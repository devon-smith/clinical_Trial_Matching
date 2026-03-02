"""
Evaluation pipeline for clinical trial matching.

Compares our system's trial rankings against SIGIR gold-standard rankings
using standard IR metrics: Precision@k, Recall@k, NDCG@k.

Evaluates multiple methods:
  (a) Keyword text search only
  (b) SMT constraint matching only
  (c) RAG similarity only
  (d) Full hybrid pipeline (SMT + RAG + LLM judge)
"""

from __future__ import annotations

import math
import sqlite3
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

DB_PATH = Path(__file__).with_name("trial_data.sqlite")


# ────────────────────────────── IR Metrics ──────────────────────────────

def precision_at_k(predicted: List[str], relevant: set, k: int) -> float:
    """Fraction of top-k predictions that are relevant."""
    top_k = predicted[:k]
    if not top_k:
        return 0.0
    return sum(1 for item in top_k if item in relevant) / k


def recall_at_k(predicted: List[str], relevant: set, k: int) -> float:
    """Fraction of relevant items found in top-k predictions."""
    if not relevant:
        return 0.0
    top_k = predicted[:k]
    return sum(1 for item in top_k if item in relevant) / len(relevant)


def dcg_at_k(predicted: List[str], relevance: Dict[str, float], k: int) -> float:
    """Discounted Cumulative Gain at k."""
    total = 0.0
    for i, item in enumerate(predicted[:k]):
        rel = relevance.get(item, 0.0)
        total += rel / math.log2(i + 2)  # i+2 because log2(1) = 0
    return total


def ndcg_at_k(predicted: List[str], relevance: Dict[str, float], k: int) -> float:
    """Normalized DCG at k."""
    actual_dcg = dcg_at_k(predicted, relevance, k)
    # Ideal ranking: sort by relevance descending
    ideal_order = sorted(relevance.keys(), key=lambda x: relevance[x], reverse=True)
    ideal_dcg = dcg_at_k(ideal_order, relevance, k)
    if ideal_dcg == 0:
        return 0.0
    return actual_dcg / ideal_dcg


# ──────────────────────── Gold Standard Loader ────────────────────────

@dataclass(frozen=True)
class GoldStandard:
    patient_id: str
    note: str
    ranked_trials: List[Tuple[str, int]]  # (nct_id, rank) sorted by rank
    relevance: Dict[str, float]  # nct_id -> relevance score (higher = better)
    top_k_set: Dict[int, set]  # k -> set of relevant nct_ids at that cutoff


def load_gold_standards(db_path: Path = DB_PATH) -> List[GoldStandard]:
    """Load all SIGIR patients and their gold-standard trial rankings."""
    conn = sqlite3.connect(str(db_path))
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    cursor.execute("SELECT patient_id, note FROM patients ORDER BY patient_id")
    patients = cursor.fetchall()

    standards = []
    for patient in patients:
        pid = patient["patient_id"]
        note = patient["note"] or ""

        cursor.execute(
            """
            SELECT nct_id, rank FROM patient_trial_rankings
            WHERE patient_id = ? ORDER BY rank
            """,
            (pid,),
        )
        rankings = [(row["nct_id"], row["rank"]) for row in cursor.fetchall()]

        if not rankings:
            continue

        # Convert ranks to relevance scores: rank 1 -> highest relevance
        max_rank = max(r for _, r in rankings)
        relevance = {
            nct_id: max(0, (max_rank - rank + 1) / max_rank)
            for nct_id, rank in rankings
        }

        # Pre-compute top-k sets for efficiency
        top_k_set = {}
        for k in [5, 10, 20, 50]:
            top_k_set[k] = {nct_id for nct_id, rank in rankings if rank <= k}

        standards.append(
            GoldStandard(
                patient_id=pid,
                note=note,
                ranked_trials=rankings,
                relevance=relevance,
                top_k_set=top_k_set,
            )
        )

    conn.close()
    return standards


# ──────────────────────── Scoring Methods ────────────────────────

def score_rag_only(patient_note: str, db_path: Path = DB_PATH) -> List[str]:
    """Rank trials using only RAG (TF-IDF cosine similarity)."""
    from rag_retriever import EligibilityRAG
    rag = EligibilityRAG(str(db_path))
    scores = rag.score_patient(patient_note, top_n=100)
    return [nct_id for nct_id, _ in scores]


def _get_all_trial_ids(db_path: Path = DB_PATH) -> List[str]:
    conn = sqlite3.connect(str(db_path))
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()
    cursor.execute("SELECT nct_id FROM trials")
    ids = [row["nct_id"] for row in cursor.fetchall()]
    conn.close()
    return ids


# Shared singleton matcher to avoid reloading 8 times
_shared_matcher = None


def _get_matcher(db_path: Path = DB_PATH):
    global _shared_matcher
    if _shared_matcher is None:
        from Matcher import TrialMatcher
        _shared_matcher = TrialMatcher(db_path)
    return _shared_matcher


def score_smt_only(patient_id: str, db_path: Path = DB_PATH) -> List[str]:
    """Rank trials using only SMT constraint evaluation."""
    matcher = _get_matcher(db_path)
    patient_attrs = matcher.load_patient_attributes(patient_id)
    all_trials = _get_all_trial_ids(db_path)

    scored = []
    for nct_id in all_trials:
        result = matcher.get_detailed_evaluation(patient_attrs, nct_id)
        constraints = result.get("constraints", [])
        hard = [c for c in constraints if c.get("hard_constraint")]
        soft = [c for c in constraints if not c.get("hard_constraint")]
        hard_met = sum(1 for c in hard if c.get("met"))
        soft_met = sum(1 for c in soft if c.get("met"))
        total = max(len(hard) + len(soft), 1)
        score = (hard_met * 2 + soft_met) / total
        scored.append((nct_id, score))

    scored.sort(key=lambda x: x[1], reverse=True)
    return [nct_id for nct_id, _ in scored]


def score_hybrid(
    patient_id: str, patient_note: str, db_path: Path = DB_PATH
) -> List[str]:
    """Rank trials using the full hybrid pipeline (SMT + RAG)."""
    matcher = _get_matcher(db_path)
    patient_attrs = matcher.load_patient_attributes(patient_id)
    all_trials = _get_all_trial_ids(db_path)

    scored = []
    for nct_id in all_trials:
        result = matcher.score_trial(
            patient_attrs, patient_note, nct_id, use_llm_judge=False
        )
        scored.append((nct_id, result["match_score"]))

    scored.sort(key=lambda x: x[1], reverse=True)
    return [nct_id for nct_id, _ in scored]


# ──────────────────────── Evaluation Runner ────────────────────────

@dataclass
class MethodResult:
    method_name: str
    p_at_5: float
    p_at_10: float
    r_at_10: float
    ndcg_at_10: float
    per_patient: List[Dict[str, Any]]


def evaluate_method(
    method_name: str,
    rank_fn,
    gold_standards: List[GoldStandard],
) -> MethodResult:
    """Evaluate a ranking method across all patients."""
    p5_scores, p10_scores, r10_scores, ndcg10_scores = [], [], [], []
    per_patient = []

    for gs in gold_standards:
        try:
            predicted = rank_fn(gs)
        except Exception as e:
            print(f"  Error evaluating {gs.patient_id}: {e}")
            continue

        relevant_10 = gs.top_k_set.get(10, set())

        p5 = precision_at_k(predicted, relevant_10, 5)
        p10 = precision_at_k(predicted, relevant_10, 10)
        r10 = recall_at_k(predicted, relevant_10, 10)
        n10 = ndcg_at_k(predicted, gs.relevance, 10)

        p5_scores.append(p5)
        p10_scores.append(p10)
        r10_scores.append(r10)
        ndcg10_scores.append(n10)

        per_patient.append({
            "patient_id": gs.patient_id,
            "p@5": round(p5, 3),
            "p@10": round(p10, 3),
            "r@10": round(r10, 3),
            "ndcg@10": round(n10, 3),
        })

    n = max(len(p5_scores), 1)
    return MethodResult(
        method_name=method_name,
        p_at_5=round(sum(p5_scores) / n, 3),
        p_at_10=round(sum(p10_scores) / n, 3),
        r_at_10=round(sum(r10_scores) / n, 3),
        ndcg_at_10=round(sum(ndcg10_scores) / n, 3),
        per_patient=per_patient,
    )


def run_evaluation(methods: Optional[List[str]] = None) -> List[MethodResult]:
    """Run the full evaluation pipeline.

    Args:
        methods: List of method names to evaluate. Default: all methods.
                 Options: 'rag', 'smt', 'hybrid'
    """
    if methods is None:
        methods = ["rag", "smt", "hybrid"]

    print("Loading gold standards...")
    gold_standards = load_gold_standards()
    print(f"Loaded {len(gold_standards)} patients with gold-standard rankings.\n")

    results = []

    if "rag" in methods:
        print("Evaluating: RAG (TF-IDF) only...")
        result = evaluate_method(
            "RAG Only",
            lambda gs: score_rag_only(gs.note),
            gold_standards,
        )
        results.append(result)

    if "smt" in methods:
        print("Evaluating: SMT constraints only...")
        result = evaluate_method(
            "SMT Only",
            lambda gs: score_smt_only(gs.patient_id),
            gold_standards,
        )
        results.append(result)

    if "hybrid" in methods:
        print("Evaluating: Hybrid (SMT + RAG)...")
        result = evaluate_method(
            "Hybrid (SMT+RAG)",
            lambda gs: score_hybrid(gs.patient_id, gs.note),
            gold_standards,
        )
        results.append(result)

    return results


def print_results(results: List[MethodResult]) -> None:
    """Print evaluation results in a clean comparison table."""
    print("\n" + "=" * 65)
    print("CLINICAL TRIAL MATCHING — EVALUATION RESULTS")
    print("=" * 65)
    print(f"{'Method':<22} {'P@5':>8} {'P@10':>8} {'R@10':>8} {'NDCG@10':>8}")
    print("-" * 65)
    for r in results:
        print(f"{r.method_name:<22} {r.p_at_5:>8.3f} {r.p_at_10:>8.3f} {r.r_at_10:>8.3f} {r.ndcg_at_10:>8.3f}")
    print("-" * 65)

    # Per-patient breakdown for the best method
    best = max(results, key=lambda r: r.ndcg_at_10)
    print(f"\nPer-patient breakdown ({best.method_name}):")
    print(f"  {'Patient':<18} {'P@5':>8} {'P@10':>8} {'R@10':>8} {'NDCG@10':>8}")
    for pp in best.per_patient:
        print(f"  {pp['patient_id']:<18} {pp['p@5']:>8.3f} {pp['p@10']:>8.3f} {pp['r@10']:>8.3f} {pp['ndcg@10']:>8.3f}")
    print()


if __name__ == "__main__":
    methods_arg = sys.argv[1:] if len(sys.argv) > 1 else None
    results = run_evaluation(methods_arg)
    print_results(results)
