;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is male.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not male.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is male."} // "be a male child"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is female."} // "be a female child"
(declare-const patient_birth_date_value_recorded_in_iso8601 Real) ;; {"when_to_set_to_value":"Set to the patient's date of birth in ISO 8601 format (YYYY-MM-DD).","when_to_set_to_null":"Set to null if the patient's date of birth is unknown, not documented, or cannot be determined.","meaning":"The patient's date of birth, recorded in ISO 8601 format (YYYY-MM-DD)."} // "be born after 1 March 2006"
(declare-const patient_age_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the patient's current age in weeks, calculated as of now.","when_to_set_to_null":"Set to null if the patient's current age in weeks is unknown, not documented, or cannot be determined.","meaning":"The patient's current age in weeks, calculated as of now."} // "be at least 12 weeks of age"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Define the cutoff date for birth: 1 March 2006 as 2006-03-01 in ISO8601, represented as 2006.0301 (YYYY.MMDD)
(define-fun birth_cutoff_date_iso8601 () Real 2006.0301) ;; "be born after 1 March 2006"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ((male child AND born after cutoff AND age >= 12) OR (female child AND born after cutoff AND age >= 12))
(assert
  (! (or
        (and patient_sex_is_male_now
             (> patient_birth_date_value_recorded_in_iso8601 birth_cutoff_date_iso8601)
             (>= patient_age_value_recorded_now_in_weeks 12))
        (and patient_sex_is_female_now
             (> patient_birth_date_value_recorded_in_iso8601 birth_cutoff_date_iso8601)
             (>= patient_age_value_recorded_now_in_weeks 12)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be a male child AND be born after 1 March 2006 AND be at least 12 weeks of age) OR (be a female child AND be born after 1 March 2006 AND be at least 12 weeks of age))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_been_admitted_to_study_hospital_during_study_period_for_severe_gastroenteritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been admitted to the study hospital during the study period and the reason for admission was severe gastroenteritis.","when_to_set_to_false":"Set to false if the patient has not been admitted to the study hospital during the study period for severe gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been admitted to the study hospital during the study period for severe gastroenteritis.","meaning":"Boolean indicating whether the patient has been admitted to the study hospital during the study period for severe gastroenteritis."} // "must have been admitted to the study hospital for severe gastroenteritis during the study period"
(declare-const patient_has_finding_of_gastroenteritis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of gastroenteritis documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of gastroenteritis documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had gastroenteritis.","meaning":"Boolean indicating whether the patient has ever had gastroenteritis in their history."} // "gastroenteritis"
(declare-const patient_has_finding_of_gastroenteritis_inthehistory@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastroenteritis episode in history was severe.","when_to_set_to_false":"Set to false if the patient's gastroenteritis episode in history was not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the gastroenteritis episode was severe.","meaning":"Boolean indicating whether the patient's gastroenteritis episode in history was severe."} // "severe gastroenteritis"
(declare-const patient_has_finding_of_gastroenteritis_inthehistory@@occurred_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastroenteritis episode in history occurred during the study period.","when_to_set_to_false":"Set to false if the patient's gastroenteritis episode in history did not occur during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the gastroenteritis episode occurred during the study period.","meaning":"Boolean indicating whether the patient's gastroenteritis episode in history occurred during the study period."} // "during the study period"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply the stem variable (gastroenteritis in history)
(assert
  (! (=> patient_has_finding_of_gastroenteritis_inthehistory@@severity_severe
         patient_has_finding_of_gastroenteritis_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "severe gastroenteritis"

(assert
  (! (=> patient_has_finding_of_gastroenteritis_inthehistory@@occurred_during_study_period
         patient_has_finding_of_gastroenteritis_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "gastroenteritis episode occurred during the study period"

;; Admission for severe gastroenteritis during study period implies both qualifiers
(assert
  (! (= patient_has_been_admitted_to_study_hospital_during_study_period_for_severe_gastroenteritis
        (and patient_has_finding_of_gastroenteritis_inthehistory@@severity_severe
             patient_has_finding_of_gastroenteritis_inthehistory@@occurred_during_study_period))
     :named REQ1_AUXILIARY2)) ;; "admitted to the study hospital for severe gastroenteritis during the study period"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_been_admitted_to_study_hospital_during_study_period_for_severe_gastroenteritis
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have been admitted to the study hospital for severe gastroenteritis during the study period"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const onset_of_gastroenteritis_to_admission_interval_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the onset of severe gastroenteritis and the date of hospital admission, if both dates are known.","when_to_set_to_null":"Set to null if either the onset date of severe gastroenteritis or the admission date is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the interval in days between onset of severe gastroenteritis and hospital admission."} // "onset of severe gastroenteritis less than or equal to 14 days prior to admission"
(declare-const patient_has_finding_of_gastroenteritis_inthehistory@@temporalcontext_within_14_days_prior_to_admission Bool) ;; {"when_to_set_to_true":"Set to true if the onset of the patient's gastroenteritis occurred within 14 days prior to admission.","when_to_set_to_false":"Set to false if the onset of the patient's gastroenteritis occurred more than 14 days prior to admission or at an unknown time.","when_to_set_to_null":"Set to null if the timing of onset relative to admission is unknown or indeterminate.","meaning":"Boolean indicating whether the onset of the patient's gastroenteritis was within 14 days prior to admission."} // "onset of severe gastroenteritis less than or equal to 14 days prior to admission"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: temporal context qualifier is true iff interval is ≤ 14 days
(assert
  (! (= patient_has_finding_of_gastroenteritis_inthehistory@@temporalcontext_within_14_days_prior_to_admission
        (and (<= onset_of_gastroenteritis_to_admission_interval_value_in_days 14)
             (>= onset_of_gastroenteritis_to_admission_interval_value_in_days 0)))
     :named REQ2_AUXILIARY0)) ;; "onset of severe gastroenteritis less than or equal to 14 days prior to admission"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_gastroenteritis_inthehistory@@temporalcontext_within_14_days_prior_to_admission
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "onset of severe gastroenteritis less than or equal to 14 days prior to admission"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_enzyme_linked_immunosorbent_assay_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an enzyme-linked immunosorbent assay (ELISA).","when_to_set_to_false":"Set to false if the patient has never undergone an enzyme-linked immunosorbent assay (ELISA).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone the procedure.","meaning":"Boolean indicating whether the patient has ever undergone an enzyme-linked immunosorbent assay (ELISA)."} // "enzyme-linked immunosorbent assay"
(declare-const patient_has_undergone_enzyme_linked_immunosorbent_assay_inthehistory@@performed_at_hospital_laboratory Bool) ;; {"when_to_set_to_true":"Set to true if the enzyme-linked immunosorbent assay was performed at the hospital laboratory.","when_to_set_to_false":"Set to false if the assay was performed elsewhere.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the assay was performed at the hospital laboratory.","meaning":"Boolean indicating whether the enzyme-linked immunosorbent assay was performed at the hospital laboratory."} // "enzyme-linked immunosorbent assay at the hospital laboratory"
(declare-const patient_has_undergone_identification_of_rotavirus_antigen_in_feces_inthehistory_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a procedure to identify rotavirus antigen in feces and the result was positive.","when_to_set_to_false":"Set to false if the patient has undergone the procedure and the result was not positive, or if the procedure was never performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone the procedure or the result.","meaning":"Boolean indicating whether the patient has ever had a positive laboratory identification of rotavirus antigen in feces."} // "rotavirus positive stool sample"
(declare-const patient_has_undergone_identification_of_rotavirus_antigen_in_feces_inthehistory_outcome_is_positive@@temporalcontext_at_hospital_admission_or_within_48_hours_of_hospitalisation Bool) ;; {"when_to_set_to_true":"Set to true if the positive identification of rotavirus antigen in feces occurred at hospital admission or during the first 48 hours of hospitalisation.","when_to_set_to_false":"Set to false if the positive identification occurred outside this window.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred within the specified window.","meaning":"Boolean indicating whether the positive identification of rotavirus antigen in feces occurred at hospital admission or during the first 48 hours of hospitalisation."} // "at hospital admission OR during the first 48 hours of hospitalisation"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_enzyme_linked_immunosorbent_assay_inthehistory@@performed_at_hospital_laboratory
         patient_has_undergone_enzyme_linked_immunosorbent_assay_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "enzyme-linked immunosorbent assay at the hospital laboratory"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_identification_of_rotavirus_antigen_in_feces_inthehistory_outcome_is_positive@@temporalcontext_at_hospital_admission_or_within_48_hours_of_hospitalisation
         patient_has_undergone_identification_of_rotavirus_antigen_in_feces_inthehistory_outcome_is_positive)
     :named REQ3_AUXILIARY1)) ;; "rotavirus positive stool sample at hospital admission OR during the first 48 hours of hospitalisation"

;; Laboratory confirmed defined as by enzyme-linked immunosorbent assay at the hospital laboratory
(define-fun patient_has_laboratory_confirmed_rotavirus_positive_stool_sample_at_admission_or_within_48h () Bool
  (and patient_has_undergone_identification_of_rotavirus_antigen_in_feces_inthehistory_outcome_is_positive@@temporalcontext_at_hospital_admission_or_within_48_hours_of_hospitalisation
       patient_has_undergone_enzyme_linked_immunosorbent_assay_inthehistory@@performed_at_hospital_laboratory)) ;; "laboratory confirmed defined as by enzyme-linked immunosorbent assay at the hospital laboratory" AND "rotavirus positive stool sample at hospital admission OR during the first 48 hours of hospitalisation"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_laboratory_confirmed_rotavirus_positive_stool_sample_at_admission_or_within_48h
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a laboratory confirmed rotavirus positive stool sample (laboratory confirmed defined as by enzyme-linked immunosorbent assay at the hospital laboratory) at hospital admission OR during the first 48 hours of hospitalisation."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_written_informed_consent_obtained_from_parent_or_guardian Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from either the parent or the guardian for the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from either the parent or the guardian for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from either the parent or the guardian for the patient.","meaning":"Boolean indicating whether written informed consent has been obtained for the patient from either the parent or the guardian."} // "written informed consent obtained from the parent OR guardian"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_written_informed_consent_obtained_from_parent_or_guardian
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have written informed consent obtained from the parent OR guardian."
