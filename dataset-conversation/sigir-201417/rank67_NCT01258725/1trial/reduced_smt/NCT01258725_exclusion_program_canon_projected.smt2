;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_preterm_premature_rupture_of_membranes_now))
(assert (not patient_is_undergoing_cerclage_of_uterine_cervix_now))
(assert (not patient_has_suspicion_of_placental_abruption_now))
(assert (not patient_has_finding_of_bleeds_profusely_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_tender_body_of_uterus_now) patient_has_suspicion_of_placental_abruption_now))
