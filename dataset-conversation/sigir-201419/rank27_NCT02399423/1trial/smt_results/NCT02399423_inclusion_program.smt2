;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} // "the patient must be male"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_sex_is_male_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_european_origin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently of European origin.","when_to_set_to_false":"Set to false if the patient is currently not of European origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently of European origin.","meaning":"Boolean indicating whether the patient is currently of European origin."} // "European origin"
(declare-const patient_has_finding_of_indian_origin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently of Indian origin.","when_to_set_to_false":"Set to false if the patient is currently not of Indian origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently of Indian origin.","meaning":"Boolean indicating whether the patient is currently of Indian origin."} // "Indian origin"
(declare-const patient_has_finding_of_pakistani_origin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently of Pakistani origin.","when_to_set_to_false":"Set to false if the patient is currently not of Pakistani origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently of Pakistani origin.","meaning":"Boolean indicating whether the patient is currently of Pakistani origin."} // "Pakistani origin"
(declare-const patient_has_finding_of_bangladeshi_origin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently of Bangladeshi origin.","when_to_set_to_false":"Set to false if the patient is currently not of Bangladeshi origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently of Bangladeshi origin.","meaning":"Boolean indicating whether the patient is currently of Bangladeshi origin."} // "Bangladeshi origin"
(declare-const patient_has_finding_of_sri_lankan_origin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently of Sri Lankan origin.","when_to_set_to_false":"Set to false if the patient is currently not of Sri Lankan origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently of Sri Lankan origin.","meaning":"Boolean indicating whether the patient is currently of Sri Lankan origin."} // "Sri Lankan origin"

(declare-const patient_is_of_european_origin_by_parental_report_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient self-reports that both parents are of white European origin at the current time.","when_to_set_to_false":"Set to false if the patient self-reports that one or both parents are not of white European origin at the current time.","when_to_set_to_null":"Set to null if the parental origin is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean indicating whether the patient self-reports both parents as being of white European origin at the current time."} // "self-report of both parents of white European origin"
(declare-const patient_is_of_south_asian_origin_by_parental_report_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient self-reports that both parents are of Indian, Pakistani, Bangladeshi, or Sri Lankan origin at the current time.","when_to_set_to_false":"Set to false if the patient self-reports that one or both parents are not of Indian, Pakistani, Bangladeshi, or Sri Lankan origin at the current time.","when_to_set_to_null":"Set to null if the parental origin is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean indicating whether the patient self-reports both parents as being of Indian, Pakistani, Bangladeshi, or Sri Lankan origin at the current time."} // "self-report of both parents of Indian origin OR ... Pakistani ... Bangladeshi ... Sri Lankan origin"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: European origin is defined as self-report of both parents of white European origin
(assert
  (! (= patient_has_finding_of_european_origin_now
        patient_is_of_european_origin_by_parental_report_now)
     :named REQ1_AUXILIARY0)) ;; "European origin (defined as self-report of both parents of white European origin)"

;; Definition: South Asian origin is defined as self-report of both parents of Indian, Pakistani, Bangladeshi, or Sri Lankan origin
(assert
  (! (= patient_is_of_south_asian_origin_by_parental_report_now
        (or patient_has_finding_of_indian_origin_now
            patient_has_finding_of_pakistani_origin_now
            patient_has_finding_of_bangladeshi_origin_now
            patient_has_finding_of_sri_lankan_origin_now))
     :named REQ1_AUXILIARY1)) ;; "South Asian origin (defined as self-report of both parents of Indian origin OR ... Pakistani ... Bangladeshi ... Sri Lankan origin)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must be of European origin (by definition) OR of South Asian origin (by definition)
(assert
  (! (or patient_has_finding_of_european_origin_now
         patient_is_of_south_asian_origin_by_parental_report_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be of European origin (defined as self-report of both parents of white European origin)) OR (be of South Asian origin (defined as self-report of both parents of Indian origin OR self-report of both parents of Pakistani origin OR self-report of both parents of Bangladeshi origin OR self-report of both parents of Sri Lankan origin)))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "body mass index < 25 kilograms per square meter"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (< patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body mass index < 25 kilograms per square meter"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_weight_steady_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been weight stable (weight change within ±2 kilograms) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been weight stable (weight change within ±2 kilograms) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been weight stable (weight change within ±2 kilograms) at any point in their history.","meaning":"Boolean indicating whether the patient has ever been weight stable (weight change within ±2 kilograms) in their history."} // "weight stable (defined as weight change within ± 2 kilograms)"
(declare-const patient_weight_change_duration_value_recorded_in_the_history_withunit_months Real) ;; {"when_to_set_to_value":"Set to the measured value of the duration, in months, over which the patient's weight change was observed and recorded in their history.","when_to_set_to_null":"Set to null if no such duration is available or the value is indeterminate.","meaning":"Numeric value representing the duration, in months, over which the patient's weight change was observed and recorded in their history."} // "for > 6 months"
(declare-const patient_weight_change_value_recorded_inthehistory_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's weight change (in kilograms) recorded at any point in their history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's weight change (in kilograms) recorded in their history."} // "weight change within ± 2 kilograms"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition of weight stability: weight change within ±2 kilograms
(assert
  (! (= patient_has_finding_of_weight_steady_inthehistory
        (and (<= patient_weight_change_value_recorded_inthehistory_withunit_kilograms 2.0)
             (>= patient_weight_change_value_recorded_inthehistory_withunit_kilograms (- 2.0))))
     :named REQ3_AUXILIARY0)) ;; "weight stable (defined as weight change within ± 2 kilograms)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must have been weight stable for > 6 months
(assert
  (! (and patient_has_finding_of_weight_steady_inthehistory
          (> patient_weight_change_duration_value_recorded_in_the_history_withunit_months 6.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "weight stable (defined as weight change within ± 2 kilograms) for > 6 months"
