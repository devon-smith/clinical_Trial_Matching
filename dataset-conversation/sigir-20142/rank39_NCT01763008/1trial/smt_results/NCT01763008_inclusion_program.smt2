;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_nosocomial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of nosocomial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of nosocomial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of nosocomial pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of nosocomial pneumonia."}  ;; "diagnosed with nosocomial pneumonia"
(declare-const patient_has_diagnosis_of_ventilator_associated_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ventilator-associated pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ventilator-associated pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ventilator-associated pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ventilator-associated pneumonia."} ;; "ventilator-associated pneumonia"
(declare-const patient_has_diagnosis_of_intra_abdominal_infection_now@@complicated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of intra-abdominal infection and the infection is complicated.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of intra-abdominal infection and the infection is not complicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of intra-abdominal infection and the infection is complicated.","meaning":"Boolean indicating whether the patient currently has a diagnosis of intra-abdominal infection and the infection is complicated."} ;; "diagnosed with complicated intra-abdominal infection"
(declare-const patient_has_diagnosis_of_urinary_tract_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of urinary tract infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of urinary tract infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of urinary tract infectious disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of urinary tract infectious disease."} ;; "diagnosed with urinary tract infection"
(declare-const patient_has_diagnosis_of_urinary_tract_infectious_disease_now@@complicated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's urinary tract infectious disease is complicated.","when_to_set_to_false":"Set to false if the patient's urinary tract infectious disease is not complicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's urinary tract infectious disease is complicated.","meaning":"Boolean indicating whether the patient's urinary tract infectious disease is complicated."} ;; "diagnosed with complicated urinary tract infection"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive example: ventilator-associated pneumonia implies nosocomial pneumonia
(assert
  (! (=> patient_has_diagnosis_of_ventilator_associated_pneumonia_now
         patient_has_diagnosis_of_nosocomial_pneumonia_now)
     :named REQ0_AUXILIARY0)) ;; "ventilator-associated pneumonia" is a non-exhaustive example of nosocomial pneumonia

;; Complicated urinary tract infection requires both diagnosis and complication
(assert
  (! (=> patient_has_diagnosis_of_urinary_tract_infectious_disease_now@@complicated
         patient_has_diagnosis_of_urinary_tract_infectious_disease_now)
     :named REQ0_AUXILIARY1)) ;; qualifier implies stem for complicated urinary tract infection

;; ===================== Constraint Assertions (REQ 0) =====================
;; Inclusion: must have (nosocomial pneumonia OR complicated intra-abdominal infection OR complicated urinary tract infection)
(assert
  (! (or patient_has_diagnosis_of_nosocomial_pneumonia_now
         patient_has_diagnosis_of_intra_abdominal_infection_now@@complicated
         patient_has_diagnosis_of_urinary_tract_infectious_disease_now@@complicated)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosed with nosocomial pneumonia (including ventilator-associated pneumonia) OR complicated intra-abdominal infection OR complicated urinary tract infection"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_eligible_for_doripenem_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently eligible for doripenem treatment.","when_to_set_to_false":"Set to false if the patient is currently not eligible for doripenem treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently eligible for doripenem treatment.","meaning":"Boolean indicating whether the patient is currently eligible for doripenem treatment."} ;; "the patient must be eligible for doripenem treatment"
(declare-const patient_is_taking_doripenem_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a doripenem-containing medicinal product.","when_to_set_to_false":"Set to false if the patient is currently not taking a doripenem-containing medicinal product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a doripenem-containing medicinal product.","meaning":"Boolean indicating whether the patient is currently taking a doripenem-containing medicinal product."} ;; "doripenem treatment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_eligible_for_doripenem_treatment_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be eligible for doripenem treatment."
