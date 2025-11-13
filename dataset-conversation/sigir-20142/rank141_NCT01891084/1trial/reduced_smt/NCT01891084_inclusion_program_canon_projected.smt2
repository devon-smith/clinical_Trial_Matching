;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or (>= (+ (to_real (ite patient_has_finding_of_joint_pain_now 1 0))
       (to_real (ite patient_has_finding_of_muscle_pain_now 1 0))
       (to_real (ite patient_has_finding_of_headache_now 1 0))
       (to_real (ite patient_has_finding_of_pain_in_throat_now 1 0))
       (to_real (ite patient_has_finding_of_nasal_discharge_now 1 0))
       (to_real (ite patient_has_finding_of_cough_now 1 0)))
    1.0) (>= (+ (to_real (ite patient_has_finding_of_joint_pain_now 1 0))
       (to_real (ite patient_has_finding_of_muscle_pain_now 1 0))
       (to_real (ite patient_has_finding_of_headache_now 1 0))
       (to_real (ite patient_has_finding_of_pain_in_throat_now 1 0))
       (to_real (ite patient_has_finding_of_nasal_discharge_now 1 0))
       (to_real (ite patient_has_finding_of_cough_now 1 0)))
    2.0)))
