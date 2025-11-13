;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} // "To be included, the patient must have human immunodeficiency virus infection."
(declare-const patient_is_in_group_3b_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as being in Group 3b.","when_to_set_to_false":"Set to false if the patient is currently not classified as being in Group 3b.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as being in Group 3b.","meaning":"Boolean indicating whether the patient is currently classified as being in Group 3b."} // "To be included, the patient must not be in Group 3b."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have human immunodeficiency virus infection."

(assert
  (! (not patient_is_in_group_3b_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not be in Group 3b."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 13 years"
(declare-const patient_has_parental_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has documented consent from a parent.","when_to_set_to_false":"Set to false if the patient currently does not have documented consent from a parent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has consent from a parent.","meaning":"Boolean indicating whether the patient currently has consent from a parent."} // "consent of parent"
(declare-const patient_has_guardian_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has documented consent from a guardian.","when_to_set_to_false":"Set to false if the patient currently does not have documented consent from a guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has consent from a guardian.","meaning":"Boolean indicating whether the patient currently has consent from a guardian."} // "consent of guardian"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be aged ≥ 13 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 13)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 13 years."

;; Component 1: If the patient is aged < 18 years, must have consent of parent OR consent of guardian.
(assert
  (! (or (>= patient_age_value_recorded_now_in_years 18)
         (or patient_has_parental_consent_now patient_has_guardian_consent_now))
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if aged < 18 years, have consent of parent OR consent of guardian"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} // "To be included, the patient must have acute Pneumocystis carinii pneumonia."
(declare-const patient_has_finding_of_pneumonia_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia is acute.","when_to_set_to_false":"Set to false if the patient's current pneumonia is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia is acute.","meaning":"Boolean indicating whether the patient's current pneumonia is acute."} // "acute"
(declare-const patient_has_finding_of_pneumonia_now@@pneumocystis_carinii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia is caused by Pneumocystis carinii.","when_to_set_to_false":"Set to false if the patient's current pneumonia is not caused by Pneumocystis carinii.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia is caused by Pneumocystis carinii.","meaning":"Boolean indicating whether the patient's current pneumonia is caused by Pneumocystis carinii."} // "Pneumocystis carinii"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_pneumonia_now@@acute
         patient_has_finding_of_pneumonia_now)
     :named REQ2_AUXILIARY0)) ;; "acute"

(assert
  (! (=> patient_has_finding_of_pneumonia_now@@pneumocystis_carinii
         patient_has_finding_of_pneumonia_now)
     :named REQ2_AUXILIARY1)) ;; "Pneumocystis carinii"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Patient must have acute Pneumocystis carinii pneumonia now
(assert
  (! (and patient_has_finding_of_pneumonia_now@@acute
          patient_has_finding_of_pneumonia_now@@pneumocystis_carinii)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute Pneumocystis carinii pneumonia."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_taken_antiretroviral_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received potent antiretroviral drugs at any time in their history.","when_to_set_to_false":"Set to false if the patient has never received potent antiretroviral drugs at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received potent antiretroviral drugs.","meaning":"Boolean indicating whether the patient has ever received potent antiretroviral drugs at any time in their history."} // "have never received potent anti-human immunodeficiency virus drugs"
(declare-const patient_has_taken_antiretroviral_inthehistory@@temporalcontext_at_least_8_weeks_prior_to_pneumocystis_carinii_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient has not received potent antiretroviral drugs for at least 8 weeks prior to the onset of Pneumocystis carinii pneumonia.","when_to_set_to_false":"Set to false if the patient has received potent antiretroviral drugs within 8 weeks prior to the onset of Pneumocystis carinii pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received potent antiretroviral drugs within 8 weeks prior to the onset of Pneumocystis carinii pneumonia.","meaning":"Boolean indicating whether the patient has not received potent antiretroviral drugs for at least 8 weeks prior to the onset of Pneumocystis carinii pneumonia."} // "NOT have received potent anti-human immunodeficiency virus drugs for ≥ 8 weeks prior to getting Pneumocystis carinii pneumonia"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_taken_antiretroviral_inthehistory@@temporalcontext_at_least_8_weeks_prior_to_pneumocystis_carinii_pneumonia
         patient_has_taken_antiretroviral_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "NOT have received potent anti-human immunodeficiency virus drugs for ≥ 8 weeks prior to getting Pneumocystis carinii pneumonia" implies "has ever received potent anti-human immunodeficiency virus drugs"

;; ===================== Constraint Assertions (REQ 3) =====================
;; (have never received potent anti-human immunodeficiency virus drugs) OR (NOT have received potent anti-human immunodeficiency virus drugs for ≥ 8 weeks prior to getting Pneumocystis carinii pneumonia)
(assert
  (! (or (not patient_has_taken_antiretroviral_inthehistory)
         (not patient_has_taken_antiretroviral_inthehistory@@temporalcontext_at_least_8_weeks_prior_to_pneumocystis_carinii_pneumonia))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have never received potent anti-human immunodeficiency virus drugs) OR (NOT have received potent anti-human immunodeficiency virus drugs for ≥ 8 weeks prior to getting Pneumocystis carinii pneumonia)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_absolute_cd4_count_procedure_value_recorded_now_withunit_cells_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current CD4 cell count in cells per cubic millimeter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current CD4 cell count in cells per cubic millimeter."} // "CD4 cell count < 200 cells per cubic millimeter."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (< patient_absolute_cd4_count_procedure_value_recorded_now_withunit_cells_per_cubic_millimeter 200.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have CD4 cell count < 200 cells per cubic millimeter."
