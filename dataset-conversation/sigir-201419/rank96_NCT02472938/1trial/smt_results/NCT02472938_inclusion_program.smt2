;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_relapsing_remitting_multiple_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of relapsing-remitting multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of relapsing-remitting multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of relapsing-remitting multiple sclerosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of relapsing-remitting multiple sclerosis."} // "have relapsing-remitting multiple sclerosis"
(declare-const patient_has_diagnosis_of_relapsing_remitting_multiple_sclerosis_now@@diagnosed_according_to_mcdonald_criteria_2010 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of relapsing-remitting multiple sclerosis is made according to McDonald criteria, 2010.","when_to_set_to_false":"Set to false if the patient's diagnosis of relapsing-remitting multiple sclerosis is not made according to McDonald criteria, 2010.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made according to McDonald criteria, 2010.","meaning":"Boolean indicating whether the patient's diagnosis of relapsing-remitting multiple sclerosis is made according to McDonald criteria, 2010."} // "according to McDonald criteria, 2010"
(declare-const patient_accepts_injectable_firstline_disease_modifying_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently accepts any injectable firstline disease-modifying therapy or therapies.","when_to_set_to_false":"Set to false if the patient currently does not accept any injectable firstline disease-modifying therapy or therapies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently accepts any injectable firstline disease-modifying therapy or therapies.","meaning":"Boolean indicating whether the patient currently accepts any injectable firstline disease-modifying therapy or therapies."} // "NOT accept any current injectable firstline disease-modifying therapy or therapies"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_relapsing_remitting_multiple_sclerosis_now@@diagnosed_according_to_mcdonald_criteria_2010
         patient_has_diagnosis_of_relapsing_remitting_multiple_sclerosis_now)
     :named REQ0_AUXILIARY0)) ;; "diagnosed according to McDonald criteria, 2010" implies "relapsing-remitting multiple sclerosis"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have relapsing-remitting MS diagnosed according to McDonald criteria, 2010
(assert
  (! patient_has_diagnosis_of_relapsing_remitting_multiple_sclerosis_now@@diagnosed_according_to_mcdonald_criteria_2010
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have relapsing-remitting multiple sclerosis according to McDonald criteria, 2010"

;; Component 1: Must NOT accept any current injectable firstline disease-modifying therapy or therapies
(assert
  (! (not patient_accepts_injectable_firstline_disease_modifying_therapy_now)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "NOT accept any current injectable firstline disease-modifying therapy or therapies"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_multiple_sclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had multiple sclerosis at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had multiple sclerosis in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had multiple sclerosis in their history.","meaning":"Boolean indicating whether the patient has ever had multiple sclerosis in their history."} // "must have onset of multiple sclerosis"
(declare-const patient_has_finding_of_multiple_sclerosis_inthehistory@@onset_within_one_year_before_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's onset of multiple sclerosis occurred within one year before enrolment.","when_to_set_to_false":"Set to false if the patient's onset of multiple sclerosis did not occur within one year before enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of multiple sclerosis occurred within one year before enrolment.","meaning":"Boolean indicating whether the patient's onset of multiple sclerosis occurred within one year before enrolment."} // "onset of multiple sclerosis within one year before enrolment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_multiple_sclerosis_inthehistory@@onset_within_one_year_before_enrolment
         patient_has_finding_of_multiple_sclerosis_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "onset of multiple sclerosis within one year before enrolment" ⇒ "must have onset of multiple sclerosis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_multiple_sclerosis_inthehistory@@onset_within_one_year_before_enrolment
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have onset of multiple sclerosis within one year before enrolment"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const gadolinium_enhancing_lesion_count_on_brain_mri_within_3_months_before_enrolment Real) ;; {"when_to_set_to_value":"Set to the number of gadolinium-enhancing lesions detected on a brain MRI scan performed within three months before enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many gadolinium-enhancing lesions were detected on a brain MRI scan performed within three months before enrolment.","meaning":"Numeric value indicating the number of gadolinium-enhancing lesions detected on a brain MRI scan performed within three months before enrolment."} // "at least one gadolinium-enhancing lesion at a brain magnetic resonance imaging scan performed within three months before enrolment"
(declare-const patient_has_finding_of_finding_of_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of lesion.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of lesion.","meaning":"Boolean indicating whether the patient currently has a finding of lesion."} // "lesion"
(declare-const patient_has_finding_of_gadolinium_enhancing_lesion_on_brain_mri_within_3_months_before_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at least one gadolinium-enhancing lesion detected on a brain MRI scan performed within three months before enrolment.","when_to_set_to_false":"Set to false if the patient does not have any gadolinium-enhancing lesion detected on a brain MRI scan performed within three months before enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has at least one gadolinium-enhancing lesion detected on a brain MRI scan performed within three months before enrolment.","meaning":"Boolean indicating whether the patient has at least one gadolinium-enhancing lesion detected on a brain MRI scan performed within three months before enrolment."} // "at least one gadolinium-enhancing lesion at a brain magnetic resonance imaging scan performed within three months before enrolment"
(declare-const patient_has_undergone_magnetic_resonance_imaging_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a magnetic resonance imaging procedure in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a magnetic resonance imaging procedure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a magnetic resonance imaging procedure in the past.","meaning":"Boolean indicating whether the patient has ever undergone a magnetic resonance imaging procedure in the past."} // "magnetic resonance imaging scan"
(declare-const patient_has_undergone_magnetic_resonance_imaging_inthehistory@@temporalcontext_within3months_before_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's magnetic resonance imaging procedure was performed within three months before enrolment.","when_to_set_to_false":"Set to false if the patient's magnetic resonance imaging procedure was not performed within three months before enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure was performed within three months before enrolment.","meaning":"Boolean indicating whether the patient's magnetic resonance imaging procedure was performed within three months before enrolment."} // "performed within three months before enrolment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Boolean variable is true iff there is at least one gadolinium-enhancing lesion on brain MRI within 3 months before enrolment
(assert
  (! (= patient_has_finding_of_gadolinium_enhancing_lesion_on_brain_mri_within_3_months_before_enrolment
        (>= gadolinium_enhancing_lesion_count_on_brain_mri_within_3_months_before_enrolment 1.0))
     :named REQ2_AUXILIARY0)) ;; "at least one gadolinium-enhancing lesion at a brain magnetic resonance imaging scan performed within three months before enrolment"

;; MRI scan within 3 months before enrolment implies MRI scan in history
(assert
  (! (=> patient_has_undergone_magnetic_resonance_imaging_inthehistory@@temporalcontext_within3months_before_enrolment
         patient_has_undergone_magnetic_resonance_imaging_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "magnetic resonance imaging scan performed within three months before enrolment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_gadolinium_enhancing_lesion_on_brain_mri_within_3_months_before_enrolment
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have at least one gadolinium-enhancing lesion at a brain magnetic resonance imaging scan performed within three months before enrolment"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_disease_modifying_treatment_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone disease-modifying treatment at any time in the past, regardless of indication.","when_to_set_to_false":"Set to false if the patient has never undergone disease-modifying treatment at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone disease-modifying treatment.","meaning":"Boolean indicating whether the patient has ever undergone disease-modifying treatment at any time in the past."} // "previous disease-modifying treatment"
(declare-const patient_has_undergone_disease_modifying_treatment_inthehistory@@for_multiple_sclerosis Bool) ;; {"when_to_set_to_true":"Set to true if the disease-modifying treatment undergone by the patient at any time in the past was specifically for the treatment of multiple sclerosis.","when_to_set_to_false":"Set to false if the disease-modifying treatment undergone by the patient at any time in the past was not for the treatment of multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease-modifying treatment was for multiple sclerosis.","meaning":"Boolean indicating whether the disease-modifying treatment was for multiple sclerosis."} // "previous disease-modifying treatment for multiple sclerosis"
(declare-const patient_has_undergone_immunosuppressive_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone immunosuppressive therapy at any time in the past, regardless of indication.","when_to_set_to_false":"Set to false if the patient has never undergone immunosuppressive therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone immunosuppressive therapy.","meaning":"Boolean indicating whether the patient has ever undergone immunosuppressive therapy at any time in the past."} // "previous immunosuppressive treatment"
(declare-const patient_has_undergone_immunosuppressive_therapy_inthehistory@@for_multiple_sclerosis Bool) ;; {"when_to_set_to_true":"Set to true if the immunosuppressive therapy undergone by the patient at any time in the past was specifically for the treatment of multiple sclerosis.","when_to_set_to_false":"Set to false if the immunosuppressive therapy undergone by the patient at any time in the past was not for the treatment of multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunosuppressive therapy was for multiple sclerosis.","meaning":"Boolean indicating whether the immunosuppressive therapy was for multiple sclerosis."} // "previous immunosuppressive treatment for multiple sclerosis"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_disease_modifying_treatment_inthehistory@@for_multiple_sclerosis
         patient_has_undergone_disease_modifying_treatment_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "previous disease-modifying treatment for multiple sclerosis" implies "previous disease-modifying treatment"

(assert
  (! (=> patient_has_undergone_immunosuppressive_therapy_inthehistory@@for_multiple_sclerosis
         patient_has_undergone_immunosuppressive_therapy_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "previous immunosuppressive treatment for multiple sclerosis" implies "previous immunosuppressive treatment"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Patient must NOT have had previous disease-modifying treatment for multiple sclerosis AND NOT have had previous immunosuppressive treatment for multiple sclerosis
(assert
  (! (and (not patient_has_undergone_disease_modifying_treatment_inthehistory@@for_multiple_sclerosis)
          (not patient_has_undergone_immunosuppressive_therapy_inthehistory@@for_multiple_sclerosis))
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "NOT have had previous disease-modifying treatment for multiple sclerosis AND NOT have had previous immunosuppressive treatment for multiple sclerosis"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_disability_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current Expanded Disability Status Scale (EDSS) score is available.","when_to_set_to_null":"Set to null if no current EDSS score is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current disability score as measured by the Expanded Disability Status Scale (EDSS)."} // "Expanded Disability Status Scale score"
(declare-const patient_disability_value_recorded_now_withunit_score@@temporalcontext_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the EDSS score value corresponds to the baseline timepoint for the patient.","when_to_set_to_false":"Set to false if the EDSS score value does not correspond to the baseline timepoint.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the EDSS score value corresponds to baseline.","meaning":"Indicates whether the EDSS score value is specifically from the baseline timepoint."} // "baseline Expanded Disability Status Scale score"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must have a baseline Expanded Disability Status Scale score ≥ 0.0 AND ≤ 5.0.
(assert
  (! (and patient_disability_value_recorded_now_withunit_score@@temporalcontext_baseline
          (>= patient_disability_value_recorded_now_withunit_score 0.0)
          (<= patient_disability_value_recorded_now_withunit_score 5.0))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a baseline Expanded Disability Status Scale score ≥ 0.0 AND ≤ 5.0."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of becoming pregnant (e.g., not post-menopausal for at least one year and not otherwise infertile).","when_to_set_to_false":"Set to false if the patient is currently not capable of becoming pregnant (e.g., post-menopausal for at least one year, surgically sterile, or otherwise infertile).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "woman of childbearing potential (defined as NOT post-menopausal for at least one year)"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently male as documented in the medical record.","when_to_set_to_false":"Set to false if the patient is currently not male (i.e., female or other).","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently male."} // "man"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing contraception.","when_to_set_to_false":"Set to false if the patient is currently not practicing contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently practicing contraception.","meaning":"Boolean indicating whether the patient is currently practicing contraception."} // "practice effective contraception (as defined by the Investigator) during the study"
(declare-const patient_has_finding_of_contraception_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected or committed to practice contraception in the future.","when_to_set_to_false":"Set to false if the patient is not expected or not committed to practice contraception in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will practice contraception in the future.","meaning":"Boolean indicating whether the patient will practice contraception in the future."} // "practice effective contraception (as defined by the Investigator) during the study"
(declare-const patient_has_finding_of_contraception_inthefuture@@temporalcontext_within_30_days_after_last_dose_of_study_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing and able to continue contraception for 30 days after the last dose of study treatment.","when_to_set_to_false":"Set to false if the patient is not willing or not able to continue contraception for 30 days after the last dose of study treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will continue contraception for 30 days after the last dose of study treatment.","meaning":"Boolean indicating whether the patient will practice contraception within 30 days after the last dose of study treatment."} // "be willing AND able to continue contraception for 30 days after the last dose of study treatment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_contraception_inthefuture@@temporalcontext_within_30_days_after_last_dose_of_study_treatment
         patient_has_finding_of_contraception_inthefuture)
     :named REQ5_AUXILIARY0)) ;; "be willing AND able to continue contraception for 30 days after the last dose of study treatment"

;; ===================== Constraint Assertions (REQ 5) =====================
;; If the patient is a woman of childbearing potential (defined as NOT post-menopausal for at least one year) OR a man,
;; then the patient must practice effective contraception during the study AND be willing and able to continue contraception for 30 days after the last dose of study treatment.
(assert
  (! (or (not (or patient_has_childbearing_potential_now patient_sex_is_male_now))
         (and patient_has_finding_of_contraception_now
              patient_has_finding_of_contraception_inthefuture@@temporalcontext_within_30_days_after_last_dose_of_study_treatment))
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is (a woman of childbearing potential (defined as NOT post-menopausal for at least one year) OR a man), the patient must (practice effective contraception (as defined by the Investigator) during the study) AND (be willing AND able to continue contraception for 30 days after the last dose of study treatment)"
