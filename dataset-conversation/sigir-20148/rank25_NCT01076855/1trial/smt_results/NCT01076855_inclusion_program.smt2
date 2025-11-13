;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "an elderly patient (age > 70 years)"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."}  ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@mild_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dementia is of mild severity.","when_to_set_to_false":"Set to false if the patient's dementia is not of mild severity (i.e., moderate or severe).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dementia is of mild severity.","meaning":"Boolean indicating whether the patient's dementia is mild."}  ;; "mild dementia"
(declare-const patient_has_carer_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a carer present.","when_to_set_to_false":"Set to false if the patient currently does not have a carer present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a carer present.","meaning":"Boolean indicating whether the patient currently has a carer present."}  ;; "have a carer present"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for mild dementia implies stem dementia variable
(assert
  (! (=> patient_has_finding_of_dementia_now@@mild_severity
         patient_has_finding_of_dementia_now)
     :named REQ0_AUXILIARY0)) ;; "mild dementia" implies "dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be elderly (age > 70 years)
(assert
  (! (> patient_age_value_recorded_now_in_years 70.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "an elderly patient (age > 70 years)"

;; Component 1: patient must have mild dementia
(assert
  (! patient_has_finding_of_dementia_now@@mild_severity
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have mild dementia"

;; Component 2: patient must have a carer present
(assert
  (! patient_has_carer_present_now
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have a carer present"
