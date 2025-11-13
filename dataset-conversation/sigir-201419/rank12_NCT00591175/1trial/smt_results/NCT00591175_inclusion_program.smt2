;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_is_seeking_routine_dental_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently seeking routine dental care.","when_to_set_to_false":"Set to false if the patient is not currently seeking routine dental care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently seeking routine dental care.","meaning":"Boolean indicating whether the patient is currently seeking routine dental care."}  ;; "To be included, the patient must be seeking routine dental care at New York University College of Dentistry."
(declare-const patient_is_seeking_routine_dental_care_now@@at_new_york_university_college_of_dentistry Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently seeking routine dental care at New York University College of Dentistry.","when_to_set_to_false":"Set to false if the patient is currently seeking routine dental care but not at New York University College of Dentistry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently seeking routine dental care at New York University College of Dentistry.","meaning":"Boolean indicating whether the patient is currently seeking routine dental care at New York University College of Dentistry."}  ;; "To be included, the patient must be seeking routine dental care at New York University College of Dentistry."
(declare-const patient_meets_medical_clearance_for_routine_dental_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets medical clearance for routine dental care.","when_to_set_to_false":"Set to false if the patient currently does not meet medical clearance for routine dental care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets medical clearance for routine dental care.","meaning":"Boolean indicating whether the patient currently meets medical clearance for routine dental care."}  ;; "To be included, the patient must meet medical clearance for routine dental care."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_seeking_routine_dental_care_now@@at_new_york_university_college_of_dentistry
         patient_is_seeking_routine_dental_care_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must be seeking routine dental care at New York University College of Dentistry."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_seeking_routine_dental_care_now@@at_new_york_university_college_of_dentistry
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be seeking routine dental care at New York University College of Dentistry."

(assert
  (! patient_meets_medical_clearance_for_routine_dental_care_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet medical clearance for routine dental care."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const cigarettes_per_day_value_recorded_now_withunit_cigarettes_per_day Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the number of cigarettes per day currently self-reported by the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many cigarettes per day the patient currently self-reports.","meaning":"Numeric value indicating the number of cigarettes per day currently self-reported by the patient, with unit cigarettes per day."}  ;; "self-reported regular use of ≥ 10 cigarettes per day"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an active smoker (i.e., self-reports regular use of cigarettes at the present time).","when_to_set_to_false":"Set to false if the patient is currently not an active smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an active smoker.","meaning":"Boolean indicating whether the patient is currently an active smoker."}  ;; "active smoker"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition in the requirement: "active smoker (defined as self-reported regular use of ≥ 10 cigarettes per day)"
(assert
  (! (= patient_has_finding_of_smoker_now
        (>= cigarettes_per_day_value_recorded_now_withunit_cigarettes_per_day 10.0))
     :named REQ1_AUXILIARY0))

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must be an active smoker (defined as self-reported regular use of ≥ 10 cigarettes per day)."
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_can_provide_telephone_number_for_contactability_over_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide a telephone number where the patient can be reached over the subsequent 12 months.","when_to_set_to_false":"Set to false if the patient is not able to provide a telephone number where the patient can be reached over the subsequent 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide a telephone number where the patient can be reached over the subsequent 12 months.","meaning":"Boolean indicating whether the patient is able to provide a telephone number where the patient can be reached over the subsequent 12 months."}  ;; "To be included, the patient must be able to provide a telephone number ... where the patient can be reached over the subsequent 12 months."
(declare-const patient_can_provide_collateral_contact_information_for_contactability_over_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide collateral contact information where the patient can be reached over the subsequent 12 months.","when_to_set_to_false":"Set to false if the patient is not able to provide collateral contact information where the patient can be reached over the subsequent 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide collateral contact information where the patient can be reached over the subsequent 12 months.","meaning":"Boolean indicating whether the patient is able to provide collateral contact information where the patient can be reached over the subsequent 12 months."}  ;; "To be included, the patient must be able to provide ... collateral contact information where the patient can be reached over the subsequent 12 months."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must be able to provide (a telephone number OR collateral contact information) for contactability over 12 months
(assert
  (! (or patient_can_provide_telephone_number_for_contactability_over_12_months
         patient_can_provide_collateral_contact_information_for_contactability_over_12_months)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be able to provide (a telephone number OR collateral contact information) where the patient can be reached over the subsequent 12 months."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_fluent_in_english_language Bool) ;; {"when_to_set_to_true":"Set to true if the patient is fluent in the English language.","when_to_set_to_false":"Set to false if the patient is not fluent in the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is fluent in the English language.","meaning":"Boolean indicating whether the patient is fluent in the English language."}  ;; "To be included, the patient must be fluent in the English language."
(declare-const patient_is_fluent_in_spanish_language Bool) ;; {"when_to_set_to_true":"Set to true if the patient is fluent in the Spanish language.","when_to_set_to_false":"Set to false if the patient is not fluent in the Spanish language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is fluent in the Spanish language.","meaning":"Boolean indicating whether the patient is fluent in the Spanish language."}  ;; "To be included, the patient must be fluent in the Spanish language."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or patient_is_fluent_in_english_language
         patient_is_fluent_in_spanish_language)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (fluent in the English language OR fluent in the Spanish language)."
