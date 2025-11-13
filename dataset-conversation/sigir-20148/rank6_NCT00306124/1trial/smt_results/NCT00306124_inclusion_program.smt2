;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of Alzheimer's disease."} // "a clinical diagnosis of Alzheimer's disease"
(declare-const patient_has_diagnosis_of_mild_cognitive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of mild cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of mild cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of mild cognitive impairment.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of mild cognitive impairment."} // "a clinical diagnosis of mild cognitive impairment"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_has_diagnosis_of_alzheimer_s_disease_now
         patient_has_diagnosis_of_mild_cognitive_disorder_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a clinical diagnosis of Alzheimer's disease OR a clinical diagnosis of mild cognitive impairment)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_primary_language_is_german Bool) ;; {"when_to_set_to_true":"Set to true if German is documented as the patient's primary language.","when_to_set_to_false":"Set to false if German is not the patient's primary language (i.e., another language is primary).","when_to_set_to_null":"Set to null if the patient's primary language is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether German is the patient's primary language."} // "the patient must have German as the patient's primary language"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_primary_language_is_german
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have German as the patient's primary language"
