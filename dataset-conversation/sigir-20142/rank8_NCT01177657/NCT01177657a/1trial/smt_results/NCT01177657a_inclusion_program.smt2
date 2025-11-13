;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the patient's age in weeks as recorded at the current time.","when_to_set_to_null":"Set to null if the patient's age in weeks is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value indicating the patient's age in weeks as recorded at the current time."} // "at least 12 weeks of age"
(declare-const patient_birthdate_value_recorded Real) ;; {"when_to_set_to_value":"Set to the patient's birthdate as recorded in the medical record.","when_to_set_to_null":"Set to null if the patient's birthdate is unknown, not documented, or cannot be determined.","meaning":"Date value indicating the patient's birthdate as recorded in the medical record."} // "born after 6 March 2006"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "female child"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "male child"
(declare-const patient_is_male_child Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a male child (i.e., current sex is male and patient is a child by study definition).","when_to_set_to_false":"Set to false if the patient is not a male child.","when_to_set_to_null":"Set to null if the status cannot be determined.","meaning":"Boolean value indicating whether the patient is a male child as defined by the study."} // "male child"
(declare-const patient_is_female_child_born_after_2006_03_06_and_at_least_12_weeks_old Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a female child, was born after 6 March 2006, and is at least 12 weeks of age.","when_to_set_to_false":"Set to false if any of these conditions are not met.","when_to_set_to_null":"Set to null if the status cannot be determined.","meaning":"Boolean value indicating whether the patient is a female child born after 6 March 2006 and at least 12 weeks old."} // "female child born after 6 March 2006 and at least 12 weeks of age"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: patient_is_male_child is true if patient_sex_is_male_now is true and patient_age_value_recorded_now_in_weeks >= 0 (child status assumed by context)
(assert
  (! (= patient_is_male_child
        patient_sex_is_male_now)
     :named REQ0_AUXILIARY0)) ;; "male child"

;; Definition: patient_is_female_child_born_after_2006_03_06_and_at_least_12_weeks_old is true if patient_sex_is_female_now is true AND birthdate > 2006-03-06 AND age >= 12 weeks
(assert
  (! (= patient_is_female_child_born_after_2006_03_06_and_at_least_12_weeks_old
        (and patient_sex_is_female_now
             (> patient_birthdate_value_recorded 20060306)
             (>= patient_age_value_recorded_now_in_weeks 12)))
     :named REQ0_AUXILIARY1)) ;; "female child born after 6 March 2006 and at least 12 weeks of age"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be a male child OR a female child born after 6 March 2006 and at least 12 weeks of age.
(assert
  (! (or patient_is_male_child
         patient_is_female_child_born_after_2006_03_06_and_at_least_12_weeks_old)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_admitted_to_study_clinic_for_severe_gastroenteritis_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient was admitted to a study clinic for severe gastroenteritis during the study period.","when_to_set_to_false":"Set to false if the patient was not admitted to a study clinic for severe gastroenteritis during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was admitted to a study clinic for severe gastroenteritis during the study period.","meaning":"Boolean indicating whether the patient was admitted to a study clinic for severe gastroenteritis during the study period."} // "be admitted to the study clinics for severe gastroenteritis during the study period"
(declare-const patient_admitted_to_study_hospital_for_severe_gastroenteritis_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient was admitted to a study hospital for severe gastroenteritis during the study period.","when_to_set_to_false":"Set to false if the patient was not admitted to a study hospital for severe gastroenteritis during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was admitted to a study hospital for severe gastroenteritis during the study period.","meaning":"Boolean indicating whether the patient was admitted to a study hospital for severe gastroenteritis during the study period."} // "be admitted to the study hospitals for severe gastroenteritis during the study period"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_admitted_to_study_clinic_for_severe_gastroenteritis_during_study_period
         patient_admitted_to_study_hospital_for_severe_gastroenteritis_during_study_period)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be admitted to the study clinics for severe gastroenteritis during the study period) OR (be admitted to the study hospitals for severe gastroenteritis during the study period))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const onset_of_severe_gastroenteritis_to_admission_interval_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the onset of severe gastroenteritis and the patient's hospital admission, if both dates are known.","when_to_set_to_null":"Set to null if either the onset date of severe gastroenteritis or the admission date is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the interval in days between onset of severe gastroenteritis and hospital admission."} // "onset of severe gastroenteritis ≤ 14 days prior to admission"
(declare-const patient_has_finding_of_gastroenteritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of gastroenteritis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of gastroenteritis.","meaning":"Boolean indicating whether the patient currently has gastroenteritis."} // "severe gastroenteritis"
(declare-const patient_has_finding_of_gastroenteritis_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current gastroenteritis is severe.","when_to_set_to_false":"Set to false if the patient's current gastroenteritis is not severe.","when_to_set_to_null":"Set to null if severity of the patient's current gastroenteritis is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient's current gastroenteritis is severe."} // "severe gastroenteritis"
(declare-const patient_has_finding_of_gastroenteritis_now@@onset_within_14_days_prior_to_admission Bool) ;; {"when_to_set_to_true":"Set to true if the onset of the patient's current gastroenteritis occurred within 14 days prior to admission.","when_to_set_to_false":"Set to false if the onset of the patient's current gastroenteritis occurred more than 14 days prior to admission.","when_to_set_to_null":"Set to null if the onset timing of the patient's current gastroenteritis is unknown, not documented, or indeterminate with respect to admission.","meaning":"Boolean indicating whether the onset of the patient's current gastroenteritis occurred within 14 days prior to admission."} // "onset of severe gastroenteritis ≤ 14 days prior to admission"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable (severe)
(assert
  (! (=> patient_has_finding_of_gastroenteritis_now@@severe
         patient_has_finding_of_gastroenteritis_now)
     :named REQ2_AUXILIARY0)) ;; "severe gastroenteritis"

;; Qualifier variable implies stem variable (onset within 14 days prior to admission)
(assert
  (! (=> patient_has_finding_of_gastroenteritis_now@@onset_within_14_days_prior_to_admission
         patient_has_finding_of_gastroenteritis_now)
     :named REQ2_AUXILIARY1)) ;; "onset of severe gastroenteritis ≤ 14 days prior to admission"

;; Definition: onset within 14 days prior to admission means interval ≤ 14
(assert
  (! (= patient_has_finding_of_gastroenteritis_now@@onset_within_14_days_prior_to_admission
        (<= onset_of_severe_gastroenteritis_to_admission_interval_value_in_days 14.0))
     :named REQ2_AUXILIARY2)) ;; "onset of severe gastroenteritis ≤ 14 days prior to admission"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must have onset of severe gastroenteritis ≤ 14 days prior to admission.
(assert
  (! (and patient_has_finding_of_gastroenteritis_now@@severe
          patient_has_finding_of_gastroenteritis_now@@onset_within_14_days_prior_to_admission)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have onset of severe gastroenteritis ≤ 14 days prior to admission."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_identification_of_rotavirus_antigen_in_feces_now_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone identification of rotavirus antigen in feces with a positive outcome at hospital admission.","when_to_set_to_false":"Set to false if the patient has not undergone identification of rotavirus antigen in feces with a positive outcome at hospital admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone identification of rotavirus antigen in feces with a positive outcome at hospital admission.","meaning":"Boolean indicating whether the patient has undergone identification of rotavirus antigen in feces with a positive outcome at hospital admission."} // "have a laboratory confirmed rotavirus positive stool sample at hospital admission"
(declare-const patient_has_undergone_identification_of_rotavirus_antigen_in_feces_inthepast48hours_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone identification of rotavirus antigen in feces with a positive outcome during the first 48 hours of hospitalization.","when_to_set_to_false":"Set to false if the patient has not undergone identification of rotavirus antigen in feces with a positive outcome during the first 48 hours of hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone identification of rotavirus antigen in feces with a positive outcome during the first 48 hours of hospitalization.","meaning":"Boolean indicating whether the patient has undergone identification of rotavirus antigen in feces with a positive outcome during the first 48 hours of hospitalization."} // "have a laboratory confirmed rotavirus positive stool sample during the first 48 hours of hospitalization"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have a laboratory confirmed rotavirus positive stool sample at hospital admission OR during the first 48 hours of hospitalization.
(assert
  (! (or patient_has_undergone_identification_of_rotavirus_antigen_in_feces_now_outcome_is_positive
         patient_has_undergone_identification_of_rotavirus_antigen_in_feces_inthepast48hours_outcome_is_positive)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const written_informed_consent_obtained_from_parent_for_patient Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the parent of the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the parent of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the parent of the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from the parent of the patient."} // "have written informed consent obtained from the parent of the patient"
(declare-const written_informed_consent_obtained_from_guardian_for_patient Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the guardian of the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the guardian of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the guardian of the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from the guardian of the patient."} // "have written informed consent obtained from the guardian of the patient"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (or written_informed_consent_obtained_from_parent_for_patient
         written_informed_consent_obtained_from_guardian_for_patient)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must ((have written informed consent obtained from the parent of the patient) OR (have written informed consent obtained from the guardian of the patient))."
