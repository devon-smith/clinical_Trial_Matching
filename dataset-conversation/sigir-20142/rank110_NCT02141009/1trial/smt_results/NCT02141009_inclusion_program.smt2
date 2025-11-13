;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_participated_in_ovidius_study_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever participated in the Ovidius study.","when_to_set_to_false":"Set to false if the patient has never participated in the Ovidius study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever participated in the Ovidius study.","meaning":"Boolean indicating whether the patient has ever participated in the Ovidius study."} // "participated in the Ovidius study"
(declare-const patient_has_participated_in_triple_p_study_2004_2009 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in the Triple-P study during the years 2004 to 2009.","when_to_set_to_false":"Set to false if the patient has not participated in the Triple-P study during the years 2004 to 2009.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in the Triple-P study during the years 2004 to 2009.","meaning":"Boolean indicating whether the patient has participated in the Triple-P study during the years 2004 to 2009."} // "participated in the Triple-P study (2004-2009)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_has_participated_in_ovidius_study_ever
         patient_has_participated_in_triple_p_study_2004_2009)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (participated in the Ovidius study OR participated in the Triple-P study (2004-2009))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_pneumococcal_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of pneumococcal pneumonia in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of pneumococcal pneumonia in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of pneumococcal pneumonia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of pneumococcal pneumonia in their history."} // "pneumococcal pneumonia"
(declare-const patient_has_diagnosis_of_pneumococcal_pneumonia_inthehistory@@diagnosed_in_ovidius_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of pneumococcal pneumonia was made in the Ovidius study.","when_to_set_to_false":"Set to false if the patient's diagnosis of pneumococcal pneumonia was not made in the Ovidius study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made in the Ovidius study.","meaning":"Boolean indicating whether the patient's diagnosis of pneumococcal pneumonia was made in the Ovidius study."} // "diagnosed in Ovidius study"
(declare-const patient_has_diagnosis_of_pneumococcal_pneumonia_inthehistory@@diagnosed_in_triple_p_study_2004_2009 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of pneumococcal pneumonia was made in the Triple-P study (2004-2009).","when_to_set_to_false":"Set to false if the patient's diagnosis of pneumococcal pneumonia was not made in the Triple-P study (2004-2009).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made in the Triple-P study (2004-2009).","meaning":"Boolean indicating whether the patient's diagnosis of pneumococcal pneumonia was made in the Triple-P study (2004-2009)."} // "diagnosed in Triple-P study (2004-2009)"
(declare-const patient_has_diagnosis_of_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of pneumonia in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of pneumonia in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of pneumonia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of pneumonia in their history."} // "pneumonia"
(declare-const patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_ovidius_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of pneumonia was made in the Ovidius study.","when_to_set_to_false":"Set to false if the patient's diagnosis of pneumonia was not made in the Ovidius study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made in the Ovidius study.","meaning":"Boolean indicating whether the patient's diagnosis of pneumonia was made in the Ovidius study."} // "diagnosed in Ovidius study"
(declare-const patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_triple_p_study_2004_2009 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of pneumonia was made in the Triple-P study (2004-2009).","when_to_set_to_false":"Set to false if the patient's diagnosis of pneumonia was not made in the Triple-P study (2004-2009).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made in the Triple-P study (2004-2009).","meaning":"Boolean indicating whether the patient's diagnosis of pneumonia was made in the Triple-P study (2004-2009)."} // "diagnosed in Triple-P study (2004-2009)"
(declare-const patient_has_diagnosis_of_pneumonia_inthehistory@@due_to_another_identified_organism Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of pneumonia was due to another identified organism.","when_to_set_to_false":"Set to false if the patient's diagnosis of pneumonia was not due to another identified organism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia was due to another identified organism.","meaning":"Boolean indicating whether the patient's diagnosis of pneumonia was due to another identified organism."} // "due to another identified organism"
(declare-const patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_ovidius_study@@due_to_another_identified_organism Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of pneumonia in their history, the diagnosis was made in the Ovidius study, and the pneumonia was due to another identified organism.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of pneumonia in their history, or the diagnosis was not made in the Ovidius study, or the pneumonia was not due to another identified organism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of pneumonia in their history, whether the diagnosis was made in the Ovidius study, or whether the pneumonia was due to another identified organism.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of pneumonia in their history, the diagnosis was made in the Ovidius study, and the pneumonia was due to another identified organism."} // "diagnosed in Ovidius study and due to another identified organism"
(declare-const patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_triple_p_study_2004_2009@@due_to_another_identified_organism Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of pneumonia in their history, the diagnosis was made in the Triple-P study (2004-2009), and the pneumonia was due to another identified organism.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of pneumonia in their history, or the diagnosis was not made in the Triple-P study (2004-2009), or the pneumonia was not due to another identified organism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of pneumonia in their history, whether the diagnosis was made in the Triple-P study (2004-2009), or whether the pneumonia was due to another identified organism.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of pneumonia in their history, the diagnosis was made in the Triple-P study (2004-2009), and the pneumonia was due to another identified organism."} // "diagnosed in Triple-P study (2004-2009) and due to another identified organism"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_pneumococcal_pneumonia_inthehistory@@diagnosed_in_ovidius_study
         patient_has_diagnosis_of_pneumococcal_pneumonia_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "diagnosis of pneumococcal pneumonia in Ovidius study implies diagnosis of pneumococcal pneumonia in history"

(assert
  (! (=> patient_has_diagnosis_of_pneumococcal_pneumonia_inthehistory@@diagnosed_in_triple_p_study_2004_2009
         patient_has_diagnosis_of_pneumococcal_pneumonia_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "diagnosis of pneumococcal pneumonia in Triple-P study implies diagnosis of pneumococcal pneumonia in history"

(assert
  (! (=> patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_ovidius_study
         patient_has_diagnosis_of_pneumonia_inthehistory)
     :named REQ1_AUXILIARY2)) ;; "diagnosis of pneumonia in Ovidius study implies diagnosis of pneumonia in history"

(assert
  (! (=> patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_triple_p_study_2004_2009
         patient_has_diagnosis_of_pneumonia_inthehistory)
     :named REQ1_AUXILIARY3)) ;; "diagnosis of pneumonia in Triple-P study implies diagnosis of pneumonia in history"

(assert
  (! (=> patient_has_diagnosis_of_pneumonia_inthehistory@@due_to_another_identified_organism
         patient_has_diagnosis_of_pneumonia_inthehistory)
     :named REQ1_AUXILIARY4)) ;; "diagnosis of pneumonia due to another identified organism implies diagnosis of pneumonia in history"

(assert
  (! (=> patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_ovidius_study@@due_to_another_identified_organism
         (and patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_ovidius_study
              patient_has_diagnosis_of_pneumonia_inthehistory@@due_to_another_identified_organism))
     :named REQ1_AUXILIARY5)) ;; "diagnosis of pneumonia in Ovidius study due to another identified organism implies both qualifiers"

(assert
  (! (=> patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_triple_p_study_2004_2009@@due_to_another_identified_organism
         (and patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_triple_p_study_2004_2009
              patient_has_diagnosis_of_pneumonia_inthehistory@@due_to_another_identified_organism))
     :named REQ1_AUXILIARY6)) ;; "diagnosis of pneumonia in Triple-P study due to another identified organism implies both qualifiers"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have had a diagnosis in the Ovidius study with pneumococcal pneumonia OR had a diagnosis in the Ovidius study with pneumonia due to another identified organism OR had a diagnosis in the Triple-P study (2004-2009) with pneumococcal pneumonia OR had a diagnosis in the Triple-P study (2004-2009) with pneumonia due to another identified organism.
(assert
  (! (or patient_has_diagnosis_of_pneumococcal_pneumonia_inthehistory@@diagnosed_in_ovidius_study
         patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_ovidius_study@@due_to_another_identified_organism
         patient_has_diagnosis_of_pneumococcal_pneumonia_inthehistory@@diagnosed_in_triple_p_study_2004_2009
         patient_has_diagnosis_of_pneumonia_inthehistory@@diagnosed_in_triple_p_study_2004_2009@@due_to_another_identified_organism)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "patient must have had a diagnosis in the Ovidius or Triple-P study with pneumococcal pneumonia or pneumonia due to another identified organism"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (aged ≥ 18 years)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an informed consent document.","when_to_set_to_false":"Set to false if the patient has not signed an informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed an informed consent document.","meaning":"Boolean indicating whether the patient has signed an informed consent document."} // "the patient must have signed informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have signed informed consent"
