;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cognitive impairment.","meaning":"Boolean indicating whether the patient currently has cognitive impairment."}  ;; "cognitive impairments"
(declare-const patient_has_finding_of_impaired_cognition_now@@suggestive_of_dementia_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cognitive impairment is suggestive of dementia syndrome.","when_to_set_to_false":"Set to false if the patient's cognitive impairment is not suggestive of dementia syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cognitive impairment is suggestive of dementia syndrome.","meaning":"Boolean indicating whether the patient's cognitive impairment is suggestive of dementia syndrome."}  ;; "cognitive impairments that are suggestive of dementia syndrome"
(declare-const patient_has_finding_of_memory_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of memory impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of memory impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of memory impairment.","meaning":"Boolean indicating whether the patient currently has memory impairment."}  ;; "memory impairments"
(declare-const patient_has_finding_of_memory_impairment_now@@suggestive_of_dementia_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient's memory impairment is suggestive of dementia syndrome.","when_to_set_to_false":"Set to false if the patient's memory impairment is not suggestive of dementia syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's memory impairment is suggestive of dementia syndrome.","meaning":"Boolean indicating whether the patient's memory impairment is suggestive of dementia syndrome."}  ;; "memory impairments that are suggestive of dementia syndrome"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_impaired_cognition_now@@suggestive_of_dementia_syndrome
         patient_has_finding_of_impaired_cognition_now)
     :named REQ0_AUXILIARY0)) ;; "cognitive impairments that are suggestive of dementia syndrome" implies "cognitive impairments"

(assert
  (! (=> patient_has_finding_of_memory_impairment_now@@suggestive_of_dementia_syndrome
         patient_has_finding_of_memory_impairment_now)
     :named REQ0_AUXILIARY1)) ;; "memory impairments that are suggestive of dementia syndrome" implies "memory impairments"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have (memory impairments OR cognitive impairments) that are suggestive of dementia syndrome.
(assert
  (! (or patient_has_finding_of_memory_impairment_now@@suggestive_of_dementia_syndrome
         patient_has_finding_of_impaired_cognition_now@@suggestive_of_dementia_syndrome)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have (memory impairments OR cognitive impairments) that are suggestive of dementia syndrome"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a formal diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a formal diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a formal diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a formal diagnosis of dementia."}  ;; "To be included, the patient must have a formal diagnosis of dementia."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_dementia_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a formal diagnosis of dementia."
