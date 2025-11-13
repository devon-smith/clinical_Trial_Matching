"""
Simple retrieval-augmented matcher that compares patient notes with
trial eligibility text using lightweight TF-IDF + cosine similarity.

We keep everything local (no external embeddings) so it works in restricted
environments, yet still gives soft relevance scores that complement the
deterministic SMT criteria.
"""

from __future__ import annotations

import math
import re
from collections import Counter
from pathlib import Path
from typing import Dict, List, Tuple

import sqlite3

DEFAULT_DB_PATH = Path(__file__).with_name("trial_data.sqlite")


class EligibilityRAG:
    TOKEN_RE = re.compile(r"[a-zA-Z][a-zA-Z0-9_]+")

    def __init__(self, db_path: Path | str = DEFAULT_DB_PATH):
        self.db_path = str(db_path)
        self._trial_docs: Dict[str, str] = {}
        self._trial_vectors: Dict[str, Dict[str, float]] = {}
        self._idf: Dict[str, float] = {}
        self._build_index()

    def _connect(self) -> sqlite3.Connection:
        conn = sqlite3.connect(self.db_path)
        conn.row_factory = sqlite3.Row
        return conn

    def _build_index(self) -> None:
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute(
            """
            SELECT t.nct_id,
                   COALESCE(c_inclusion.characteristic_value, '') AS inclusion_text,
                   COALESCE(c_exclusion.characteristic_value, '') AS exclusion_text,
                   COALESCE(t.brief_summary, '') AS summary
            FROM trials t
            LEFT JOIN trial_characteristics c_inclusion
                ON c_inclusion.nct_id = t.nct_id
               AND c_inclusion.characteristic_key = 'inclusion_text'
            LEFT JOIN trial_characteristics c_exclusion
                ON c_exclusion.nct_id = t.nct_id
               AND c_exclusion.characteristic_key = 'exclusion_text'
            """
        )

        docs = {}
        for row in cursor.fetchall():
            doc = " ".join(
                filter(
                    None,
                    [row["summary"], row["inclusion_text"], row["exclusion_text"]],
                )
            )
            if doc.strip():
                docs[row["nct_id"]] = doc
        conn.close()

        self._trial_docs = docs
        self._compute_tfidf()

    def _tokenize(self, text: str) -> List[str]:
        return [match.group(0).lower() for match in self.TOKEN_RE.finditer(text)]

    def _compute_tfidf(self) -> None:
        doc_freq: Counter = Counter()
        tokenized_docs: Dict[str, List[str]] = {}

        for nct_id, text in self._trial_docs.items():
            tokens = self._tokenize(text)
            tokenized_docs[nct_id] = tokens
            doc_freq.update(set(tokens))

        total_docs = max(len(tokenized_docs), 1)
        self._idf = {
            token: math.log((total_docs + 1) / (freq + 1)) + 1.0 for token, freq in doc_freq.items()
        }

        for nct_id, tokens in tokenized_docs.items():
            tf = Counter(tokens)
            vector = {}
            norm = 0.0
            for token, count in tf.items():
                weight = (count / len(tokens)) * self._idf.get(token, 1.0)
                vector[token] = weight
                norm += weight * weight
            norm = math.sqrt(norm) or 1.0
            self._trial_vectors[nct_id] = {token: weight / norm for token, weight in vector.items()}

    def _vectorize_patient(self, patient_text: str) -> Dict[str, float]:
        tokens = self._tokenize(patient_text)
        if not tokens:
            return {}
        tf = Counter(tokens)
        vector = {}
        norm = 0.0
        for token, count in tf.items():
            idf = self._idf.get(token, math.log((len(self._trial_vectors) + 1)))
            weight = (count / len(tokens)) * idf
            vector[token] = weight
            norm += weight * weight
        norm = math.sqrt(norm) or 1.0
        return {token: weight / norm for token, weight in vector.items()}

    def score_patient(
        self,
        patient_text: str,
        top_n: int = 10,
    ) -> List[Tuple[str, float]]:
        patient_vec = self._vectorize_patient(patient_text)
        if not patient_vec:
            return []
        scores: List[Tuple[str, float]] = []
        for nct_id, vector in self._trial_vectors.items():
            score = self._cosine(patient_vec, vector)
            if score > 0:
                scores.append((nct_id, score))
        scores.sort(key=lambda item: item[1], reverse=True)
        return scores[:top_n]

    @staticmethod
    def _cosine(vec_a: Dict[str, float], vec_b: Dict[str, float]) -> float:
        if len(vec_a) > len(vec_b):
            vec_a, vec_b = vec_b, vec_a
        dot = 0.0
        for token, weight in vec_a.items():
            if token in vec_b:
                dot += weight * vec_b[token]
        return dot


__all__ = ["EligibilityRAG"]
