;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be a child."
(declare-const patient_is_enrolled_in_target_schools_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in the target schools.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in the target schools.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in the target schools.","meaning":"Boolean indicating whether the patient is currently enrolled in the target schools."} // "To be included, the patient must be enrolled in the target schools."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and (<= patient_age_value_recorded_now_in_years 18)
          (>= patient_age_value_recorded_now_in_years 0))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a child."

(assert
  (! patient_is_enrolled_in_target_schools_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be enrolled in the target schools."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_written_informed_consent_obtained_from_parent_or_parents_now Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the parent or parents of the patient at the current time.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the parent or parents of the patient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the parent or parents of the patient at the current time.","meaning":"Boolean indicating whether written informed consent has been obtained from the parent or parents of the patient at the current time."} // "To be included, the patient must have written informed consent obtained from the parent or parents of the patient if the parent or parents of the patient agree to participate."
(declare-const patient_has_written_informed_consent_obtained_from_parent_or_parents_now@@parent_or_parents_agree_to_participate_now Bool) ;; {"when_to_set_to_true":"Set to true if the parent or parents of the patient agree to participate at the current time.","when_to_set_to_false":"Set to false if the parent or parents of the patient do not agree to participate at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parent or parents of the patient agree to participate at the current time.","meaning":"Boolean indicating whether the parent or parents of the patient agree to participate at the current time."} // "if the parent or parents of the patient agree to participate"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (if consent is obtained with agreement, then consent is obtained)
(assert
  (! (=> patient_has_written_informed_consent_obtained_from_parent_or_parents_now@@parent_or_parents_agree_to_participate_now
         patient_has_written_informed_consent_obtained_from_parent_or_parents_now)
     :named REQ1_AUXILIARY0)) ;; "if the parent or parents of the patient agree to participate"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: written informed consent from parent(s) with agreement to participate is required
(assert
  (! patient_has_written_informed_consent_obtained_from_parent_or_parents_now@@parent_or_parents_agree_to_participate_now
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have written informed consent obtained from the parent or parents of the patient if the parent or parents of the patient agree to participate."
