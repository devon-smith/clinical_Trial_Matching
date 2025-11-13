;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_is_competent_now Bool) ;; "To be included, the patient must be competent." {"when_to_set_to_true":"Set to true if the patient is currently competent.","when_to_set_to_false":"Set to false if the patient is currently not competent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently competent.","meaning":"Boolean indicating whether the patient is currently competent."}
(declare-const patient_is_enrolled_in_pre_operative_bariatric_surgery_program_now@@at_center_for_nutrition_and_weight_management_geisinger_medical_center_danville_pennsylvania Bool) ;; "be enrolled in the pre-operative bariatric surgery program at the Center for Nutrition and Weight Management at Geisinger Medical Center, Danville, Pennsylvania" {"when_to_set_to_true":"Set to true if the patient is currently enrolled in the pre-operative bariatric surgery program at the Center for Nutrition and Weight Management at Geisinger Medical Center, Danville, Pennsylvania.","when_to_set_to_false":"Set to false if the patient is currently enrolled in the pre-operative bariatric surgery program but not at the specified center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is enrolled in the pre-operative bariatric surgery program at the specified center.","meaning":"Boolean indicating whether the patient is currently enrolled in the pre-operative bariatric surgery program at the Center for Nutrition and Weight Management at Geisinger Medical Center, Danville, Pennsylvania."}
(declare-const patient_is_enrolled_in_post_operative_bariatric_surgery_program_now@@at_center_for_nutrition_and_weight_management_geisinger_medical_center_danville_pennsylvania Bool) ;; "be enrolled in the post-operative bariatric surgery program at the Center for Nutrition and Weight Management at Geisinger Medical Center, Danville, Pennsylvania" {"when_to_set_to_true":"Set to true if the patient is currently enrolled in the post-operative bariatric surgery program at the Center for Nutrition and Weight Management at Geisinger Medical Center, Danville, Pennsylvania.","when_to_set_to_false":"Set to false if the patient is currently enrolled in the post-operative bariatric surgery program but not at the specified center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is enrolled in the post-operative bariatric surgery program at the specified center.","meaning":"Boolean indicating whether the patient is currently enrolled in the post-operative bariatric surgery program at the Center for Nutrition and Weight Management at Geisinger Medical Center, Danville, Pennsylvania."}

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be competent
(assert
  (! patient_is_competent_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be competent."

;; Component 1: Patient must be enrolled in either the pre-operative OR post-operative bariatric surgery program at the specified center
(assert
  (! (or patient_is_enrolled_in_pre_operative_bariatric_surgery_program_now@@at_center_for_nutrition_and_weight_management_geisinger_medical_center_danville_pennsylvania
         patient_is_enrolled_in_post_operative_bariatric_surgery_program_now@@at_center_for_nutrition_and_weight_management_geisinger_medical_center_danville_pennsylvania)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((be enrolled in the pre-operative bariatric surgery program at the Center for Nutrition and Weight Management at Geisinger Medical Center, Danville, Pennsylvania) OR (be enrolled in the post-operative bariatric surgery program at the Center for Nutrition and Weight Management at Geisinger Medical Center, Danville, Pennsylvania))"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_can_undergo_6_minute_walk_test_now Bool) ;; "To be included, the patient must have the ability to perform a six-minute walk test." {"when_to_set_to_true":"Set to true if the patient currently has the ability to perform a six-minute walk test.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to perform a six-minute walk test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to perform a six-minute walk test.","meaning":"Boolean indicating whether the patient currently has the ability to perform a six-minute walk test."}

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_can_undergo_6_minute_walk_test_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have the ability to perform a six-minute walk test."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "aged ≥ 18 years AND aged ≤ 70 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 70 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 70)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 70 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_willing_to_receive_dietary_recall_phone_calls Bool) ;; "To be included, the patient must be willing to receive dietary recall phone calls." {"when_to_set_to_true":"Set to true if the patient is willing to receive dietary recall phone calls.","when_to_set_to_false":"Set to false if the patient is not willing to receive dietary recall phone calls.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to receive dietary recall phone calls.","meaning":"Boolean indicating whether the patient is willing to receive dietary recall phone calls."}
(declare-const patient_has_accessibility_to_telephone Bool) ;; "To be included, the patient must have accessibility to a telephone." {"when_to_set_to_true":"Set to true if the patient has accessibility to a telephone.","when_to_set_to_false":"Set to false if the patient does not have accessibility to a telephone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has accessibility to a telephone.","meaning":"Boolean indicating whether the patient has accessibility to a telephone."}
(declare-const patient_can_undergo_review_of_current_diet_now Bool) ;; "dietary recall" {"when_to_set_to_true":"Set to true if the patient can currently undergo a review of current diet (dietary recall).","when_to_set_to_false":"Set to false if the patient cannot currently undergo a review of current diet (dietary recall).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a review of current diet (dietary recall).","meaning":"Boolean indicating whether the patient can currently undergo a review of current diet (dietary recall)."}
(declare-const patient_can_undergo_review_of_current_diet_now@@conducted_by_phone_call Bool) ;; "dietary recall phone calls" {"when_to_set_to_true":"Set to true if the review of current diet (dietary recall) can be conducted by phone call for the patient.","when_to_set_to_false":"Set to false if the review of current diet (dietary recall) cannot be conducted by phone call for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the review of current diet (dietary recall) can be conducted by phone call for the patient.","meaning":"Boolean indicating whether the review of current diet (dietary recall) can be conducted by phone call for the patient."}

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_can_undergo_review_of_current_diet_now@@conducted_by_phone_call
         patient_can_undergo_review_of_current_diet_now)
     :named REQ3_AUXILIARY0)) ;; "dietary recall phone calls" means dietary recall by phone call

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Patient must be willing to receive dietary recall phone calls
(assert
  (! patient_is_willing_to_receive_dietary_recall_phone_calls
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to receive dietary recall phone calls."

;; Component 1: Patient must have accessibility to a telephone
(assert
  (! patient_has_accessibility_to_telephone
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have accessibility to a telephone."
