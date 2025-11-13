;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 65.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_chronic_disease_value_recorded_inthehistory_withunit_count Int) ;; {"when_to_set_to_value":"Set to the number of distinct chronic diseases diagnosed in the patient at any time in their history.","when_to_set_to_null":"Set to null if the number of chronic diseases diagnosed in the patient at any time in their history is unknown or cannot be determined.","meaning":"Numeric count of distinct chronic diseases diagnosed in the patient at any time in their history."}  ;; "have ≥ 3 chronic diseases"
(declare-const patient_disease_value_recorded_inthehistory_withunit_count Int) ;; {"when_to_set_to_value":"Set to the number of distinct diseases diagnosed in the patient at any time in their history.","when_to_set_to_null":"Set to null if the number of diseases diagnosed in the patient at any time in their history is unknown or cannot be determined.","meaning":"Numeric count of distinct diseases diagnosed in the patient at any time in their history."}  ;; "have ≥ 3 vitality threatening diseases"
(declare-const patient_disease_value_recorded_inthehistory_withunit_count@@vitality_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the counted diseases are vitality threatening.","when_to_set_to_false":"Set to false if the counted diseases are not vitality threatening.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the counted diseases are vitality threatening.","meaning":"Qualifier indicating that only vitality threatening diseases are counted in the numeric value."}  ;; "vitality threatening diseases"
(declare-const patient_drug_or_medicament_value_recorded_inthepast1years_withunit_count Int) ;; {"when_to_set_to_value":"Set to the number of distinct types of medical drugs the patient has used in the past 1 year.","when_to_set_to_null":"Set to null if the number of types of medical drugs used in the past 1 year is unknown or cannot be determined.","meaning":"Numeric count of distinct types of medical drugs used by the patient in the past 1 year."}  ;; "use ≥ 5 types of medical drugs chronically in the last year"
(declare-const patient_drug_or_medicament_value_recorded_inthepast1years_withunit_count@@used_chronically Bool) ;; {"when_to_set_to_true":"Set to true if the counted medical drugs were used chronically in the past 1 year.","when_to_set_to_false":"Set to false if the counted medical drugs were not used chronically in the past 1 year.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the counted medical drugs were used chronically in the past 1 year.","meaning":"Qualifier indicating that only medical drugs used chronically in the past 1 year are counted in the numeric value."}  ;; "used chronically in the last year"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the corresponding count is for vitality threatening diseases
(assert
  (! (=> patient_disease_value_recorded_inthehistory_withunit_count@@vitality_threatening
         (>= patient_disease_value_recorded_inthehistory_withunit_count 0))
     :named REQ1_AUXILIARY0)) ;; "vitality threatening diseases count is defined only when qualifier is true"

;; Qualifier variable implies the corresponding drug count is for drugs used chronically
(assert
  (! (=> patient_drug_or_medicament_value_recorded_inthepast1years_withunit_count@@used_chronically
         (>= patient_drug_or_medicament_value_recorded_inthepast1years_withunit_count 0))
     :named REQ1_AUXILIARY1)) ;; "drug count in past 1 year is defined only when used chronically qualifier is true"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must ((have ≥ 3 chronic diseases) OR (have ≥ 3 vitality threatening diseases) OR (use ≥ 5 types of medical drugs chronically in the last year)).
(assert
  (! (or
        (>= patient_chronic_disease_value_recorded_inthehistory_withunit_count 3) ;; "have ≥ 3 chronic diseases"
        (and patient_disease_value_recorded_inthehistory_withunit_count@@vitality_threatening
             (>= patient_disease_value_recorded_inthehistory_withunit_count 3)) ;; "have ≥ 3 vitality threatening diseases"
        (and patient_drug_or_medicament_value_recorded_inthepast1years_withunit_count@@used_chronically
             (>= patient_drug_or_medicament_value_recorded_inthepast1years_withunit_count 5)) ;; "use ≥ 5 types of medical drugs chronically in the last year"
     )
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea.","meaning":"Boolean indicating whether the patient currently has dyspnea."}  ;; "have dyspnea"
(declare-const patient_has_finding_of_impaired_exercise_tolerance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired exercise tolerance.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired exercise tolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired exercise tolerance.","meaning":"Boolean indicating whether the patient currently has impaired exercise tolerance."}  ;; "have reduced exercise tolerance"
(declare-const patient_has_finding_of_impaired_exercise_tolerance_now@@scored_by_two_short_questionnaires Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired exercise tolerance is scored by two short questionnaires.","when_to_set_to_false":"Set to false if the patient's impaired exercise tolerance is not scored by two short questionnaires.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's impaired exercise tolerance is scored by two short questionnaires.","meaning":"Boolean indicating whether the patient's impaired exercise tolerance is scored by two short questionnaires."}  ;; "scored by two short questionnaires"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_impaired_exercise_tolerance_now@@scored_by_two_short_questionnaires
         patient_has_finding_of_impaired_exercise_tolerance_now)
     :named REQ2_AUXILIARY0)) ;; "scored by two short questionnaires" implies "impaired exercise tolerance"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must (have dyspnea OR have reduced exercise tolerance (scored by two short questionnaires)).
(assert
  (! (or patient_has_finding_of_dyspnea_now
         patient_has_finding_of_impaired_exercise_tolerance_now@@scored_by_two_short_questionnaires)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have dyspnea OR have reduced exercise tolerance (scored by two short questionnaires)"
