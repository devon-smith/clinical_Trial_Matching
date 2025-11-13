;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 14 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 14)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (age > 14 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_lower_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of lower abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of lower abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lower abdominal pain.","meaning":"Boolean indicating whether the patient currently has lower abdominal pain."} // "lower abdominal pain"
(declare-const patient_has_finding_of_right_iliac_fossa_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of right iliac fossa abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of right iliac fossa abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has right iliac fossa abdominal pain.","meaning":"Boolean indicating whether the patient currently has right iliac fossa abdominal pain."} // "right iliac fossa abdominal pain"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_has_finding_of_lower_abdominal_pain_now
         patient_has_finding_of_right_iliac_fossa_pain_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (lower abdominal pain OR right iliac fossa abdominal pain)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const alvarado_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the value of the patient's Alvarado Score in points, as recorded at the current time.","when_to_set_to_null":"Set to null if the Alvarado Score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric variable indicating the patient's Alvarado Score, recorded at the current time, in points."} // "Alvarado Score"
(declare-const patient_has_suspicion_of_acute_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have acute appendicitis.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have acute appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have acute appendicitis.","meaning":"Boolean indicating whether the patient is currently suspected to have acute appendicitis."} // "clinical suspicion of acute appendicitis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: clinical suspicion of acute appendicitis as indicated by Alvarado Score in specified ranges
(assert
  (! (= patient_has_suspicion_of_acute_appendicitis_now
        (or (and (>= alvarado_score_value_recorded_now_withunit_points 5)
                 (<= alvarado_score_value_recorded_now_withunit_points 6))
            (and (>= alvarado_score_value_recorded_now_withunit_points 7)
                 (<= alvarado_score_value_recorded_now_withunit_points 8))
            (and (>= alvarado_score_value_recorded_now_withunit_points 9)
                 (<= alvarado_score_value_recorded_now_withunit_points 10))))
     :named REQ2_AUXILIARY0)) ;; "clinical suspicion of acute appendicitis, as indicated by (Alvarado Score ≥ 5 AND ≤ 6) OR (Alvarado Score ≥ 7 AND ≤ 8) OR (Alvarado Score ≥ 9 AND ≤ 10)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_suspicion_of_acute_appendicitis_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have clinical suspicion of acute appendicitis, as indicated by Alvarado Score in specified ranges"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_provided_informed_consent_personally_or_via_legal_representative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent, either personally or via a legal representative.","when_to_set_to_false":"Set to false if the patient has not provided informed consent, neither personally nor via a legal representative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent, either personally or via a legal representative.","meaning":"Boolean indicating whether the patient has provided informed consent, either personally or via a legal representative."} // "To be included, the patient must have provided informed consent (either personally OR via a legal representative)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_provided_informed_consent_personally_or_via_legal_representative
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided informed consent (either personally OR via a legal representative)."
