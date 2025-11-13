;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired cognition.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired cognition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of impaired cognition.","meaning":"Boolean indicating whether the patient currently has impaired cognition."} ;; "cognitive impairments"
(declare-const patient_has_finding_of_impaired_cognition_now@@known_comorbid_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired cognition is a known comorbid condition.","when_to_set_to_false":"Set to false if the patient's impaired cognition is not a known comorbid condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's impaired cognition is a known comorbid condition.","meaning":"Boolean indicating whether the patient's impaired cognition is a known comorbid condition."} ;; "known comorbid cognitive impairments"
(declare-const patient_has_finding_of_neurological_deficit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of neurological deficit.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of neurological deficit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of neurological deficit.","meaning":"Boolean indicating whether the patient currently has a neurological deficit."} ;; "neurological impairments"
(declare-const patient_has_finding_of_neurological_deficit_now@@known_comorbid_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neurological deficit is a known comorbid condition.","when_to_set_to_false":"Set to false if the patient's neurological deficit is not a known comorbid condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neurological deficit is a known comorbid condition.","meaning":"Boolean indicating whether the patient's neurological deficit is a known comorbid condition."} ;; "known comorbid neurological impairments"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_impaired_cognition_now@@known_comorbid_condition
      patient_has_finding_of_impaired_cognition_now)
   :named REQ0_AUXILIARY0)) ;; "known comorbid cognitive impairments"

(assert
(! (=> patient_has_finding_of_neurological_deficit_now@@known_comorbid_condition
      patient_has_finding_of_neurological_deficit_now)
   :named REQ0_AUXILIARY1)) ;; "known comorbid neurological impairments"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_impaired_cognition_now@@known_comorbid_condition)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known comorbid cognitive impairments."

(assert
(! (not patient_has_finding_of_neurological_deficit_now@@known_comorbid_condition)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known comorbid neurological impairments."
