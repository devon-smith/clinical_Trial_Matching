;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "an adult (age ≥ 18 years)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must be an adult (age ≥ 18 years).
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an adult (age ≥ 18 years)."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be age ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≥ 18 years."

;; Component 1: To be included, the patient must be age ≤ 85 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 85)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≤ 85 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_undergoing_operation_on_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently scheduled for or undergoing an operation on the nervous system (neurosurgery).","when_to_set_to_false":"Set to false if the patient is not currently scheduled for or undergoing an operation on the nervous system (neurosurgery).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently scheduled for or undergoing an operation on the nervous system (neurosurgery).","meaning":"Boolean indicating whether the patient is currently scheduled for or undergoing an operation on the nervous system (neurosurgery)."} ;; "neurosurgery"
(declare-const patient_is_undergoing_operation_on_nervous_system_now@@requires_opening_of_cranium_and_dura Bool) ;; {"when_to_set_to_true":"Set to true if the scheduled or ongoing operation on the nervous system requires opening of both the cranium and the dura.","when_to_set_to_false":"Set to false if the scheduled or ongoing operation on the nervous system does not require opening of both the cranium and the dura.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduled or ongoing operation on the nervous system requires opening of both the cranium and the dura.","meaning":"Boolean indicating whether the scheduled or ongoing operation on the nervous system requires opening of both the cranium and the dura."} ;; "requiring opening of the cranium AND opening of the dura"
(declare-const patient_is_undergoing_operation_on_nervous_system_now@@performed_at_ohio_state_university_medical_center Bool) ;; {"when_to_set_to_true":"Set to true if the scheduled or ongoing operation on the nervous system is performed at Ohio State University Medical Center.","when_to_set_to_false":"Set to false if the scheduled or ongoing operation on the nervous system is not performed at Ohio State University Medical Center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduled or ongoing operation on the nervous system is performed at Ohio State University Medical Center.","meaning":"Boolean indicating whether the scheduled or ongoing operation on the nervous system is performed at Ohio State University Medical Center."} ;; "at Ohio State University Medical Center"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the stem variable (if a patient is scheduled for neurosurgery with a qualifier, then they are scheduled for neurosurgery)
(assert
  (! (=> patient_is_undergoing_operation_on_nervous_system_now@@requires_opening_of_cranium_and_dura
         patient_is_undergoing_operation_on_nervous_system_now)
     :named REQ2_AUXILIARY0)) ;; "requiring opening of the cranium AND opening of the dura"

(assert
  (! (=> patient_is_undergoing_operation_on_nervous_system_now@@performed_at_ohio_state_university_medical_center
         patient_is_undergoing_operation_on_nervous_system_now)
     :named REQ2_AUXILIARY1)) ;; "at Ohio State University Medical Center"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must be scheduled for neurosurgery that BOTH requires opening of the cranium and dura AND is performed at OSU Medical Center
(assert
  (! (and patient_is_undergoing_operation_on_nervous_system_now@@requires_opening_of_cranium_and_dura
          patient_is_undergoing_operation_on_nervous_system_now@@performed_at_ohio_state_university_medical_center)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be scheduled for neurosurgery (requiring opening of the cranium AND opening of the dura) at Ohio State University Medical Center."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_given_written_consent_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written consent to participate in this study.","when_to_set_to_false":"Set to false if the patient has not provided written consent to participate in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written consent to participate in this study.","meaning":"Boolean indicating whether the patient has provided written consent to participate in this study."} ;; "the patient must consent in writing to participate in this study."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_given_written_consent_to_participate_in_study
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must consent in writing to participate in this study."
