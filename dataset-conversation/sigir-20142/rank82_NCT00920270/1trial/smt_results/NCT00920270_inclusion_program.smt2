;; ===================== Declarations for the inclusion criteria (REQ 0) =====================

;; Age variable
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "an adult (age > 18 years)"

;; Hospitalization status
(declare-const patient_is_hospitalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized.","when_to_set_to_false":"Set to false if the patient is not currently hospitalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized."} ;; "a hospitalized patient"

;; Hospital-acquired pneumonia
(declare-const patient_has_finding_of_hospital_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hospital-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hospital-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hospital-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has hospital-acquired pneumonia."} ;; "hospital-acquired pneumonia"

;; Hospital-acquired pneumonia caused by Gram negative bacterial infection (qualifier)
(declare-const patient_has_finding_of_hospital_acquired_pneumonia_now@@caused_by_gram_negative_bacterial_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hospital-acquired pneumonia is caused by Gram negative bacterial infection.","when_to_set_to_false":"Set to false if the patient's hospital-acquired pneumonia is not caused by Gram negative bacterial infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hospital-acquired pneumonia is caused by Gram negative bacterial infection.","meaning":"Boolean indicating whether the patient's hospital-acquired pneumonia is caused by Gram negative bacterial infection."} ;; "have hospital-acquired pneumonia due to Gram negative bacterial infection"

;; Bacterial infectious disease
(declare-const patient_has_finding_of_bacterial_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bacterial infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bacterial infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bacterial infectious disease.","meaning":"Boolean indicating whether the patient currently has bacterial infectious disease."} ;; "bacterial infection"

;; Bacterial infectious disease of Gram negative type (qualifier)
(declare-const patient_has_finding_of_bacterial_infectious_disease_now@@of_gram_negative_type Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bacterial infectious disease is of Gram negative type.","when_to_set_to_false":"Set to false if the patient's bacterial infectious disease is not of Gram negative type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bacterial infectious disease is of Gram negative type.","meaning":"Boolean indicating whether the patient's bacterial infectious disease is of Gram negative type."} ;; "Gram negative bacterial infection"

;; ===================== Auxiliary Assertions (REQ 0) =====================

;; Qualifier variable for hospital-acquired pneumonia implies stem variable
(assert
  (! (=> patient_has_finding_of_hospital_acquired_pneumonia_now@@caused_by_gram_negative_bacterial_infection
         patient_has_finding_of_hospital_acquired_pneumonia_now)
     :named REQ0_AUXILIARY0)) ;; "have hospital-acquired pneumonia due to Gram negative bacterial infection"

;; Qualifier variable for bacterial infectious disease implies stem variable
(assert
  (! (=> patient_has_finding_of_bacterial_infectious_disease_now@@of_gram_negative_type
         patient_has_finding_of_bacterial_infectious_disease_now)
     :named REQ0_AUXILIARY1)) ;; "Gram negative bacterial infection"

;; ===================== Constraint Assertions (REQ 0) =====================

;; Component 0: Adult (age > 18 years)
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an adult (age > 18 years)."

;; Component 1: Hospitalized patient
(assert
  (! patient_is_hospitalized_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a hospitalized patient."

;; Component 2: Hospital-acquired pneumonia due to Gram negative bacterial infection
(assert
  (! patient_has_finding_of_hospital_acquired_pneumonia_now@@caused_by_gram_negative_bacterial_infection
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have hospital-acquired pneumonia due to Gram negative bacterial infection."
