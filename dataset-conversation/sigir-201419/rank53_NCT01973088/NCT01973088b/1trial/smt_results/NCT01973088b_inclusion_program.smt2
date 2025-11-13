;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_normal_renal_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of normal renal function.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of normal renal function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal renal function.","meaning":"Boolean indicating whether the patient currently has normal renal function."} // "have normal renal function"
(declare-const patient_has_finding_of_urolithiasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of urolithiasis (urinary calculi).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of urolithiasis (urinary calculi).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has urolithiasis (urinary calculi).","meaning":"Boolean indicating whether the patient currently has urolithiasis (urinary calculi)."} // "associated with urinary calculi"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must have normal renal function.
(assert
  (! patient_has_finding_of_normal_renal_function_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal renal function."

;; Component 1: The patient must not be associated with urinary calculi.
(assert
  (! (not patient_has_finding_of_urolithiasis_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not be associated with urinary calculi."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} // "be a patient with cancer"
(declare-const patient_can_undergo_radical_nephrectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets indications to undergo radical nephrectomy.","when_to_set_to_false":"Set to false if the patient currently does not meet indications to undergo radical nephrectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets indications to undergo radical nephrectomy.","meaning":"Boolean indicating whether the patient currently meets indications to undergo radical nephrectomy."} // "meet radical nephrectomy indications for surgery"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must be a patient with cancer
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be a patient with cancer"

;; Component 1: Patient must meet radical nephrectomy indications for surgery
(assert
  (! patient_can_undergo_radical_nephrectomy_now
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "meet radical nephrectomy indications for surgery"

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_emergency_trauma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of emergency trauma.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of emergency trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of emergency trauma.","meaning":"Boolean indicating whether the patient currently has emergency trauma."} // "be a patient with emergency trauma"
(declare-const patient_has_finding_of_traumatic_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of traumatic injury.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of traumatic injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of traumatic injury.","meaning":"Boolean indicating whether the patient currently has a finding of traumatic injury."} // "trauma"
(declare-const patient_can_undergo_kidney_excision_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo kidney excision (kidney resection).","when_to_set_to_false":"Set to false if the patient cannot currently undergo kidney excision (kidney resection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo kidney excision (kidney resection).","meaning":"Boolean indicating whether the patient can currently undergo kidney excision (kidney resection)."} // "kidney resection"
(declare-const patient_can_undergo_kidney_excision_now@@suffering_from_surgical_indications_for_kidney_resection Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo kidney excision and is suffering from surgical indications for kidney resection.","when_to_set_to_false":"Set to false if the patient can currently undergo kidney excision but is not suffering from surgical indications for kidney resection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is suffering from surgical indications for kidney resection.","meaning":"Boolean indicating whether the patient can currently undergo kidney excision and is suffering from surgical indications for kidney resection."} // "suffering from kidney resection surgical indications"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Emergency trauma is a type of traumatic injury (non-exhaustive, default to implication)
(assert
  (! (=> patient_has_finding_of_emergency_trauma_now
         patient_has_finding_of_traumatic_injury_now)
     :named REQ3_AUXILIARY0)) ;; "emergency trauma" implies "traumatic injury"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_can_undergo_kidney_excision_now@@suffering_from_surgical_indications_for_kidney_resection
         patient_can_undergo_kidney_excision_now)
     :named REQ3_AUXILIARY1)) ;; "suffering from surgical indications for kidney resection" implies "can undergo kidney excision"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must have emergency trauma
(assert
  (! patient_has_finding_of_emergency_trauma_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be a patient with emergency trauma"

;; Component 1: patient must be suffering from kidney resection surgical indications
(assert
  (! patient_can_undergo_kidney_excision_now@@suffering_from_surgical_indications_for_kidney_resection
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be suffering from kidney resection surgical indications"
