;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "elderly patient"
(declare-const patient_is_from_university_memory_center_of_angers_university_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient is from the University Memory Center of Angers University Hospital.","when_to_set_to_false":"Set to false if the patient is not from the University Memory Center of Angers University Hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is from the University Memory Center of Angers University Hospital.","meaning":"Boolean indicating whether the patient is from the University Memory Center of Angers University Hospital."} // "from the University Memory Center of Angers University Hospital"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be an elderly patient.
(assert
  (! (>= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "elderly patient" (commonly defined as age ≥ 65 years)

;; Component 1: To be included, the patient must be from the University Memory Center of Angers University Hospital.
(assert
  (! patient_is_from_university_memory_center_of_angers_university_hospital
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "from the University Memory Center of Angers University Hospital"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_can_walk_without_walking_aid_for_distance_value_recorded_now_in_meters Real) ;; {"when_to_set_to_value":"Set to the number of meters the patient can walk without any walking aid, measured now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how far the patient can walk without any walking aid now.","meaning":"Numeric value representing the distance in meters the patient can walk unaided at the current time."} // "the distance in meters that the patient can walk without using any walking aid"
(declare-const patient_can_walk_without_walking_aid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently walk without any walking aid.","when_to_set_to_false":"Set to false if the patient cannot currently walk without any walking aid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently walk without any walking aid.","meaning":"Boolean indicating whether the patient can walk unaided at the current time."} // "the patient is currently able to walk without using any walking aid"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; If the patient can walk at least 15 meters unaided, then they can walk without a walking aid now
(assert
  (! (=> (>= patient_can_walk_without_walking_aid_for_distance_value_recorded_now_in_meters 15.0)
         patient_can_walk_without_walking_aid_now)
     :named REQ1_AUXILIARY0)) ;; "the patient must be able to walk without any walking aid for a distance ≥ 15 meters"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_can_walk_without_walking_aid_for_distance_value_recorded_now_in_meters 15.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be able to walk without any walking aid for a distance ≥ 15 meters"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured MMSE score if a numeric measurement of the patient's Mini-Mental Status Examination score recorded now is available.","when_to_set_to_null":"Set to null if no such MMSE score measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Mini-Mental Status Examination (MMSE) score."} // "Mini-Mental Status Examination (MMSE) score recorded now"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have a Mini-Mental Status Examination (MMSE) score > 10.
(assert
  (! (> patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 10.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Mini-Mental Status Examination (MMSE) score > 10."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_affiliated_to_social_security_regime_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently affiliated to a social security regime.","when_to_set_to_false":"Set to false if the patient is currently not affiliated to a social security regime.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently affiliated to a social security regime.","meaning":"Boolean indicating whether the patient is currently affiliated to a social security regime."} // "the patient must be affiliated to a social security regime"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_affiliated_to_social_security_regime_now
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be affiliated to a social security regime"
