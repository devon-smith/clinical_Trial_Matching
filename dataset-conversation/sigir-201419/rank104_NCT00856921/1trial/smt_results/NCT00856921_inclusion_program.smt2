;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "early age onset"

(declare-const patient_has_early_age_onset_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as having early age onset according to study or clinical definitions.","when_to_set_to_false":"Set to false if the patient is currently classified as NOT having early age onset according to study or clinical definitions.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has early age onset.","meaning":"Indicates whether the patient currently has early age onset."} // "early age onset"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; No explicit definition of "early age onset" provided in the requirement, so no auxiliary assertion for definition.

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_early_age_onset_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have early age onset."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_idiopathic_achalasia_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of idiopathic achalasia of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of idiopathic achalasia of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has idiopathic achalasia of the esophagus.","meaning":"Boolean indicating whether the patient currently has idiopathic achalasia of the esophagus."} // "primary achalasia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_idiopathic_achalasia_of_esophagus_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a patient with primary achalasia."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: "To be included, the patient must be less than 35 years old."
(assert
  (! (< patient_age_value_recorded_now_in_years 35.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be less than 35 years old."
