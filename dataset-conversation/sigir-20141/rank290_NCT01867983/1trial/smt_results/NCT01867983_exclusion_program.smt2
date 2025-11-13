;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has pregnancy"
(declare-const patient_is_pregnant_inthefuture3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to become pregnant within the next 3 months.","when_to_set_to_false":"Set to false if the patient is not planning to become pregnant within the next 3 months.","when_to_set_to_null":"Set to null if the patient's plans for pregnancy within the next 3 months are unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is planning to become pregnant within the next 3 months."} ;; "the patient is planning pregnancy within the next 3 months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (or patient_is_pregnant_now
              patient_is_pregnant_inthefuture3months))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has pregnancy) OR (the patient is planning pregnancy within the next 3 months)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bariatric operative procedure (weight loss surgery) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a bariatric operative procedure (weight loss surgery) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a bariatric operative procedure (weight loss surgery) in the past.","meaning":"Boolean indicating whether the patient has ever undergone a bariatric operative procedure (weight loss surgery) at any time in the past."} ;; "the patient has had previous weight loss surgery"
(declare-const patient_will_undergo_bariatric_operative_procedure_inthefuture12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to undergo a bariatric operative procedure (weight loss surgery) within the next 12 months.","when_to_set_to_false":"Set to false if the patient is not planning to undergo a bariatric operative procedure (weight loss surgery) within the next 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning to undergo a bariatric operative procedure (weight loss surgery) within the next 12 months.","meaning":"Boolean indicating whether the patient is planning to undergo a bariatric operative procedure (weight loss surgery) within the next 12 months."} ;; "the patient is planning weight loss surgery within the next 12 months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_undergone_bariatric_operative_procedure_inthehistory
            patient_will_undergo_bariatric_operative_procedure_inthefuture12months))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had previous weight loss surgery) OR (the patient is planning weight loss surgery within the next 12 months)."
