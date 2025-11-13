;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} // "To be included, the patient must have clinical chronic obstructive pulmonary disease."
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@is_clinical Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of chronic obstructive pulmonary disease is clinical (i.e., confirmed and active, not only historical or suspected).","when_to_set_to_false":"Set to false if the patient's diagnosis of chronic obstructive pulmonary disease is not clinical (i.e., only historical, suspected, or subclinical).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is clinical.","meaning":"Boolean indicating whether the patient's diagnosis of chronic obstructive pulmonary disease is clinical."} // "clinical chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@is_clinical
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ0_AUXILIARY0)) ;; "clinical chronic obstructive pulmonary disease" means the diagnosis is clinical and present

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@is_clinical
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have clinical chronic obstructive pulmonary disease."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "To be included, the patient must be a smoker."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a smoker."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "older than forty years of age"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 40)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than forty years of age."
