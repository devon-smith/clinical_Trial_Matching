;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 6 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 6.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age ≥ 6 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_pulmonary_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with pulmonary symptoms.","when_to_set_to_false":"Set to false if the patient currently does not present with pulmonary symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with pulmonary symptoms.","meaning":"Boolean indicating whether the patient currently presents with pulmonary symptoms."} // "the patient must present with pulmonary symptoms"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_pulmonary_symptoms_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must present with pulmonary symptoms"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with cough.","when_to_set_to_false":"Set to false if the patient currently does not present with cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with cough.","meaning":"Boolean indicating whether the patient currently presents with cough."} // "cough"
(declare-const patient_has_finding_of_cough_now@@chief_complaint Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with cough and cough is the chief complaint.","when_to_set_to_false":"Set to false if the patient currently presents with cough but cough is not the chief complaint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cough is the chief complaint.","meaning":"Boolean indicating whether cough is the chief complaint at presentation."} // "chief complaint of cough"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_cough_now@@chief_complaint
         patient_has_finding_of_cough_now)
     :named REQ2_AUXILIARY0)) ;; "chief complaint of cough" implies "cough"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_cough_now@@chief_complaint
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must present with a chief complaint of cough"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_cough_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days if the duration of the patient's current cough is known and recorded.","when_to_set_to_null":"Set to null if the duration of the patient's current cough is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in days of the patient's current cough."} // "cough of duration > 7 days"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> patient_cough_value_recorded_now_withunit_days 7)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a cough of duration > 7 days)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of asthma."} // "asthma"
(declare-const patient_requires_asthma_room_disposition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires asthma room disposition.","when_to_set_to_false":"Set to false if the patient currently does not require asthma room disposition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires asthma room disposition.","meaning":"Boolean indicating whether the patient currently requires asthma room disposition."} // "require (asthma room disposition)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must NOT require (asthma room disposition).
(assert
  (! (not patient_requires_asthma_room_disposition_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT require (asthma room disposition)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented to have pneumonia.","when_to_set_to_false":"Set to false if the patient is currently not documented to have pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is documented to have pneumonia.","meaning":"Boolean indicating whether the patient is currently documented to have pneumonia."} // "documented to have pneumonia"
(declare-const patient_has_suspicion_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have pneumonia.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is suspected to have pneumonia.","meaning":"Boolean indicating whether the patient is currently suspected to have pneumonia."} // "suspected to have pneumonia"
(declare-const patient_has_diagnosis_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented to have a radiologic infiltrate of the lung.","when_to_set_to_false":"Set to false if the patient is currently not documented to have a radiologic infiltrate of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is documented to have a radiologic infiltrate of the lung.","meaning":"Boolean indicating whether the patient is currently documented to have a radiologic infiltrate of the lung."} // "documented to have a pulmonary infiltrate"
(declare-const patient_has_suspicion_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have a radiologic infiltrate of the lung.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have a radiologic infiltrate of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is suspected to have a radiologic infiltrate of the lung.","meaning":"Boolean indicating whether the patient is currently suspected to have a radiologic infiltrate of the lung."} // "suspected to have a pulmonary infiltrate"
(declare-const patient_has_symptoms_of_dry_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of dry cough (no production of purulent sputum).","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of dry cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of dry cough.","meaning":"Boolean indicating whether the patient currently has symptoms of dry cough."} // "dry cough (defined as no production of purulent sputum)"
(declare-const patient_has_production_of_purulent_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently produces purulent sputum.","when_to_set_to_false":"Set to false if the patient currently does not produce purulent sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently produces purulent sputum.","meaning":"Boolean indicating whether the patient currently produces purulent sputum."} // "no production of purulent sputum"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: dry cough is defined as no production of purulent sputum
(assert
  (! (= patient_has_symptoms_of_dry_cough_now
        (and (not patient_has_production_of_purulent_sputum_now)
             ;; patient must have cough to have dry cough
             patient_has_finding_of_cough_now))
     :named REQ5_AUXILIARY0)) ;; "dry cough (defined as no production of purulent sputum)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; If the patient is suspected or documented to have pneumonia or pulmonary infiltrate, then the patient must have a dry cough
(assert
  (! (=> (or patient_has_suspicion_of_pneumonia_now
            patient_has_diagnosis_of_pneumonia_now
            patient_has_suspicion_of_radiologic_infiltrate_of_lung_now
            patient_has_diagnosis_of_radiologic_infiltrate_of_lung_now)
         patient_has_symptoms_of_dry_cough_now)
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "if (the patient is suspected to have pneumonia OR the patient is documented to have pneumonia OR the patient is suspected to have a pulmonary infiltrate OR the patient is documented to have a pulmonary infiltrate), then the patient must have (a dry cough (defined as no production of purulent sputum))."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_patient_s_condition_stable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is medically stable now.","when_to_set_to_false":"Set to false if the patient is not medically stable now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is medically stable now.","meaning":"Boolean indicating whether the patient is medically stable now."} // "medically stable"
(declare-const patient_has_finding_of_patient_s_condition_stable_now@@at_time_of_consent_process Bool) ;; {"when_to_set_to_true":"Set to true if the patient is medically stable now and this status is specifically at the time of the consent process.","when_to_set_to_false":"Set to false if the patient is not medically stable now at the time of the consent process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is medically stable at the time of the consent process.","meaning":"Boolean indicating whether the patient is medically stable now at the time of the consent process."} // "medically stable at the time of the consent process"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_patient_s_condition_stable_now@@at_time_of_consent_process
         patient_has_finding_of_patient_s_condition_stable_now)
     :named REQ6_AUXILIARY0)) ;; "medically stable at the time of the consent process" implies "medically stable"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_finding_of_patient_s_condition_stable_now@@at_time_of_consent_process
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be medically stable at the time of the consent process."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_number_of_months_physically_in_guyana_in_last_24_months Real) ;; {"when_to_set_to_value":"Set to the number of months (out of the last 24 months prior to enrollment) during which the patient was physically present in Guyana.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient was physically present in Guyana in the last 24 months prior to enrollment.","meaning":"Numeric value (in months) representing the number of months the patient was physically present in Guyana in the last 24 months prior to enrollment."} // "at least 21 of the previous 24 months physically in Guyana"
(declare-const patient_residence_duration_in_guyana_prior_to_enrollment_in_months Real) ;; {"when_to_set_to_value":"Set to the total number of months the patient has continuously resided in Guyana in the 24 months immediately prior to enrollment, excluding any periods classified as short trips out of the country.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient has continuously resided in Guyana in the 24 months prior to enrollment, exclusive of short trips.","meaning":"Numeric value (in months) representing the total duration of continuous residence in Guyana in the 24 months prior to enrollment, exclusive of short trips out of the country."} // "continuous residence in Guyana for ≥ 2 years at the time of enrollment, exclusive of short trips out of the country"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (and (>= patient_residence_duration_in_guyana_prior_to_enrollment_in_months 24.0)
          (>= patient_number_of_months_physically_in_guyana_in_last_24_months 21.0))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "continuous residence in Guyana for ≥ 2 years at the time of enrollment, exclusive of short trips out of the country (defined as at least 21 of the previous 24 months physically in Guyana)"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_english_speaking Bool) ;; {"when_to_set_to_true":"Set to true if the patient is English speaking.","when_to_set_to_false":"Set to false if the patient is not English speaking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is English speaking.","meaning":"Boolean indicating whether the patient is English speaking."} // "the patient must be (English speaking)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_is_english_speaking
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be (English speaking)"
