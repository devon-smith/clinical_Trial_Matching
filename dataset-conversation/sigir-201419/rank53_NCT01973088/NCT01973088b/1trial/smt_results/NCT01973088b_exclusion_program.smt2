;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than eighteen years OR the patient is older than sixty-five years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or (< patient_age_value_recorded_now_in_years 18)
            (> patient_age_value_recorded_now_in_years 65)))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is younger than eighteen years) OR (the patient is older than sixty-five years))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of neurological disease (disorder of nervous system).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of neurological disease (disorder of nervous system).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of neurological disease (disorder of nervous system).","meaning":"Boolean indicating whether the patient currently has a neurological disease (disorder of nervous system)."} ;; "neurological disease"
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of cognitive dysfunction (impaired cognition).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of cognitive dysfunction (impaired cognition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of cognitive dysfunction (impaired cognition).","meaning":"Boolean indicating whether the patient currently has cognitive dysfunction (impaired cognition)."} ;; "cognitive dysfunction"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a neurological disease."

(assert
(! (not patient_has_finding_of_impaired_cognition_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive dysfunction."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (coagulopathy).","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder (coagulopathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder (coagulopathy).","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (coagulopathy)."} ;; "coagulopathy"
(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@cannot_be_corrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (coagulopathy) and this disorder cannot be corrected.","when_to_set_to_false":"Set to false if the patient currently has a blood coagulation disorder (coagulopathy) and this disorder can be corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's blood coagulation disorder (coagulopathy) can be corrected.","meaning":"Boolean indicating whether the patient's current blood coagulation disorder (coagulopathy) cannot be corrected."} ;; "coagulopathy that cannot be corrected"
(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (coagulopathy) and this disorder is uncorrected.","when_to_set_to_false":"Set to false if the patient currently has a blood coagulation disorder (coagulopathy) and this disorder is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's blood coagulation disorder (coagulopathy) is uncorrected.","meaning":"Boolean indicating whether the patient's current blood coagulation disorder (coagulopathy) is uncorrected."} ;; "uncorrected coagulopathy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_now@@cannot_be_corrected
      patient_has_finding_of_blood_coagulation_disorder_now)
   :named REQ2_AUXILIARY0)) ;; "coagulopathy that cannot be corrected"

(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_now@@uncorrected
      patient_has_finding_of_blood_coagulation_disorder_now)
   :named REQ2_AUXILIARY1)) ;; "uncorrected coagulopathy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_finding_of_blood_coagulation_disorder_now@@cannot_be_corrected
            patient_has_finding_of_blood_coagulation_disorder_now@@uncorrected))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has coagulopathy that cannot be corrected) OR (the patient has uncorrected coagulopathy))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder."} ;; "hypertension"
(declare-const patient_has_diagnosis_of_metabolic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of metabolic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of metabolic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of metabolic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of metabolic disease."} ;; "other metabolic diseases"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes."

(assert
(! (not patient_has_diagnosis_of_hypertensive_disorder_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypertension."

(assert
(! (not patient_has_diagnosis_of_metabolic_disease_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other metabolic diseases."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tuberculosis.","meaning":"Boolean indicating whether the patient currently has tuberculosis."} ;; "the patient has tuberculosis"
(declare-const patient_has_finding_of_inflammatory_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatitis (inflammatory disease of liver).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatitis (inflammatory disease of liver).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatitis (inflammatory disease of liver).","meaning":"Boolean indicating whether the patient currently has hepatitis (inflammatory disease of liver)."} ;; "the patient has hepatitis"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "the patient has human immunodeficiency virus infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of any other infectious disease (disorder due to infection).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of any other infectious disease (disorder due to infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other infectious disease (disorder due to infection).","meaning":"Boolean indicating whether the patient currently has any other infectious disease (disorder due to infection)."} ;; "the patient has other infectious diseases"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_tuberculosis_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tuberculosis."

(assert
(! (not patient_has_finding_of_inflammatory_disease_of_liver_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatitis."

(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_infection_now)
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has human immunodeficiency virus infection."

(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now)
    :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other infectious diseases."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_poor_tolerance_to_anesthesia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor tolerance to anesthesia.","when_to_set_to_false":"Set to false if the patient currently does not have poor tolerance to anesthesia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor tolerance to anesthesia.","meaning":"Boolean indicating whether the patient currently has poor tolerance to anesthesia."} ;; "the patient has poor tolerance to anesthesia"

(declare-const patient_can_undergo_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo a surgical procedure (i.e., has adequate tolerance for surgery).","when_to_set_to_false":"Set to false if the patient is currently unable to undergo a surgical procedure (i.e., has poor tolerance for surgery).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a surgical procedure.","meaning":"Boolean indicating whether the patient is currently able to undergo a surgical procedure."} ;; "the patient has poor tolerance to surgery"

(declare-const patient_has_finding_of_severe_cardiopulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe cardiopulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have severe cardiopulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe cardiopulmonary disease.","meaning":"Boolean indicating whether the patient currently has severe cardiopulmonary disease."} ;; "severe cardiopulmonary disease"

(assert
(! (=> (or patient_has_finding_of_severe_cardiopulmonary_disease_now
           patient_has_finding_of_blood_coagulation_disorder_now)
     (not patient_can_undergo_surgical_procedure_now))
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (severe cardiopulmonary disease, coagulation disorders)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: poor tolerance to anesthesia OR poor tolerance to surgery (with non-exhaustive examples)
(assert
(! (not (or patient_has_poor_tolerance_to_anesthesia_now
            (not patient_can_undergo_surgical_procedure_now)))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has poor tolerance to anesthesia) OR (the patient has poor tolerance to surgery with non-exhaustive examples (severe cardiopulmonary disease, coagulation disorders)))."

(assert
(! (not (not patient_can_undergo_surgical_procedure_now))
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poor tolerance to surgery with non-exhaustive examples (severe cardiopulmonary disease, coagulation disorders)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_undergone_ultrasonography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography (ultrasound examination) now.","when_to_set_to_false":"Set to false if the patient has not undergone ultrasonography (ultrasound examination) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultrasonography now.","meaning":"Boolean indicating whether the patient has undergone ultrasonography (ultrasound examination) now."} ;; "ultrasound examination"
(declare-const patient_has_undergone_renal_imaging_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone renal imaging examination now.","when_to_set_to_false":"Set to false if the patient has not undergone renal imaging examination now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone renal imaging examination now.","meaning":"Boolean indicating whether the patient has undergone renal imaging examination now."} ;; "renal imaging examination"
(declare-const renal_cortical_thickness_value_recorded_now_in_centimeters Real) ;; {"when_to_set_to_value":"Set to the value of the patient's renal cortical thickness recorded now, in centimeters.","when_to_set_to_null":"Set to null if the value of the patient's renal cortical thickness recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's renal cortical thickness recorded now, in centimeters."} ;; "renal cortical thickness less than one point five centimeters"
(declare-const patient_has_finding_of_structural_variation_of_renal_cortex_on_ultrasound_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ultrasound examination now reveals structural variation of the renal cortex.","when_to_set_to_false":"Set to false if the patient's ultrasound examination now does not reveal structural variation of the renal cortex.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ultrasound examination now reveals structural variation of the renal cortex.","meaning":"Boolean indicating whether the patient's ultrasound examination now reveals structural variation of the renal cortex."} ;; "the patient's ultrasound examination reveals structural variation"
(declare-const patient_has_finding_of_structural_variation_of_renal_cortex_on_renal_imaging_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal imaging examination now reveals structural variation of the renal cortex.","when_to_set_to_false":"Set to false if the patient's renal imaging examination now does not reveal structural variation of the renal cortex.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal imaging examination now reveals structural variation of the renal cortex.","meaning":"Boolean indicating whether the patient's renal imaging examination now reveals structural variation of the renal cortex."} ;; "the patient's renal imaging examination reveals structural variation"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: renal cortex is significantly thinner (<1.5 cm) on ultrasound
(assert
(! (not (and patient_has_undergone_ultrasonography_now
             (< renal_cortical_thickness_value_recorded_now_in_centimeters 1.5)))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient's ultrasound examination reveals that the renal cortex is significantly thinner (renal cortical thickness less than one point five centimeters)"

;; Exclusion: renal cortex is significantly thinner (<1.5 cm) on renal imaging
(assert
(! (not (and patient_has_undergone_renal_imaging_examination_now
             (< renal_cortical_thickness_value_recorded_now_in_centimeters 1.5)))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient's renal imaging examination reveals that the renal cortex is significantly thinner (renal cortical thickness less than one point five centimeters)"

;; Exclusion: structural variation on ultrasound
(assert
(! (not patient_has_finding_of_structural_variation_of_renal_cortex_on_ultrasound_now)
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient's ultrasound examination reveals structural variation"

;; Exclusion: structural variation on renal imaging
(assert
(! (not patient_has_finding_of_structural_variation_of_renal_cortex_on_renal_imaging_examination_now)
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient's renal imaging examination reveals structural variation"

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_severe_systemic_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a severe systemic infection.","when_to_set_to_false":"Set to false if the patient currently does not have a severe systemic infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a severe systemic infection.","meaning":"Boolean indicating whether the patient currently has a severe systemic infection."} ;; "the patient has a severe systemic infection"
(declare-const patient_has_finding_of_severe_urinary_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a severe urinary tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have a severe urinary tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a severe urinary tract infection.","meaning":"Boolean indicating whether the patient currently has a severe urinary tract infection."} ;; "the patient has a severe urinary tract infection"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_severe_systemic_infection_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe systemic infection."

(assert
(! (not patient_has_finding_of_severe_urinary_tract_infection_now)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe urinary tract infection."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_kidney_imaging_with_function_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a radionuclide renal function examination (kidney imaging with function study) now.","when_to_set_to_false":"Set to false if the patient has not undergone a radionuclide renal function examination (kidney imaging with function study) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a radionuclide renal function examination (kidney imaging with function study) now.","meaning":"Boolean indicating whether the patient has undergone a radionuclide renal function examination (kidney imaging with function study) now."} ;; "radionuclide renal function examination"
(declare-const patient_has_undergone_kidney_imaging_with_function_study_now@@tips_indicate_severely_impaired_ipsilateral_renal_function Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a radionuclide renal function examination (kidney imaging with function study) now and the examination's tips indicate that ipsilateral renal function is severely impaired.","when_to_set_to_false":"Set to false if the patient has undergone the examination now and the tips do not indicate severely impaired ipsilateral renal function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tips of the examination indicate severely impaired ipsilateral renal function.","meaning":"Boolean indicating whether the tips of the patient's radionuclide renal function examination (kidney imaging with function study) now indicate severely impaired ipsilateral renal function."} ;; "radionuclide renal function examination tips indicate that ipsilateral renal function is severely impaired"
(declare-const patient_has_solitary_kidney_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a solitary kidney.","when_to_set_to_false":"Set to false if the patient currently does not have a solitary kidney.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a solitary kidney.","meaning":"Boolean indicating whether the patient currently has a solitary kidney."} ;; "the patient has a solitary kidney"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_kidney_imaging_with_function_study_now@@tips_indicate_severely_impaired_ipsilateral_renal_function
      patient_has_undergone_kidney_imaging_with_function_study_now)
    :named REQ8_AUXILIARY0)) ;; "radionuclide renal function examination tips indicate that ipsilateral renal function is severely impaired"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_undergone_kidney_imaging_with_function_study_now@@tips_indicate_severely_impaired_ipsilateral_renal_function
            patient_has_solitary_kidney_now))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient's radionuclide renal function examination tips indicate that ipsilateral renal function is severely impaired) OR (the patient has a solitary kidney))."
