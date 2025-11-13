;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "a child"
(declare-const patient_has_finding_of_acute_bacterial_rhinosinusitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of acute bacterial rhinosinusitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of acute bacterial rhinosinusitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of acute bacterial rhinosinusitis.","meaning":"Boolean indicating whether the patient currently has a clinical finding of acute bacterial rhinosinusitis."}  ;; "acute bacterial rhinosinusitis"
(declare-const patient_has_finding_of_bacterial_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of bacterial infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of bacterial infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of bacterial infectious disease.","meaning":"Boolean indicating whether the patient currently has a bacterial infectious disease."}  ;; "bacterial infection"
(declare-const patient_has_finding_of_hyperemic_nasal_mucosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of hyperemic nasal mucosa (redness of the nasal mucosa).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of hyperemic nasal mucosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of hyperemic nasal mucosa.","meaning":"Boolean indicating whether the patient currently has hyperemic nasal mucosa (redness of the nasal mucosa)."}  ;; "redness of the nasal mucosa"
(declare-const patient_has_finding_of_hyperemic_nasal_mucosa_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has hyperemic nasal mucosa present on the day of or the day before the first dose of the investigational product.","when_to_set_to_false":"Set to false if the patient does not have hyperemic nasal mucosa present on the day of or the day before the first dose of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether hyperemic nasal mucosa is present on the day of or the day before the first dose of the investigational product.","meaning":"Boolean indicating whether hyperemic nasal mucosa is present on the day of or the day before the first dose of the investigational product."}  ;; "redness of the nasal mucosa on the day of or the day before the first dose of the investigational product"
(declare-const patient_has_finding_of_purulent_nasal_discharge_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of purulent nasal discharge.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of purulent nasal discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of purulent nasal discharge.","meaning":"Boolean indicating whether the patient currently has purulent nasal discharge."}  ;; "purulent nasal discharge"
(declare-const patient_has_finding_of_purulent_nasal_discharge_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has purulent nasal discharge present on the day of or the day before the first dose of the investigational product.","when_to_set_to_false":"Set to false if the patient does not have purulent nasal discharge present on the day of or the day before the first dose of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether purulent nasal discharge is present on the day of or the day before the first dose of the investigational product.","meaning":"Boolean indicating whether purulent nasal discharge is present on the day of or the day before the first dose of the investigational product."}  ;; "purulent nasal discharge on the day of or the day before the first dose of the investigational product"
(declare-const patient_has_finding_of_mucopurulent_nasal_discharge_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of mucopurulent nasal discharge.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of mucopurulent nasal discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of mucopurulent nasal discharge.","meaning":"Boolean indicating whether the patient currently has mucopurulent nasal discharge."}  ;; "mucopurulent nasal discharge"
(declare-const patient_has_finding_of_mucopurulent_nasal_discharge_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has mucopurulent nasal discharge present on the day of or the day before the first dose of the investigational product.","when_to_set_to_false":"Set to false if the patient does not have mucopurulent nasal discharge present on the day of or the day before the first dose of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether mucopurulent nasal discharge is present on the day of or the day before the first dose of the investigational product.","meaning":"Boolean indicating whether mucopurulent nasal discharge is present on the day of or the day before the first dose of the investigational product."}  ;; "mucopurulent nasal discharge on the day of or the day before the first dose of the investigational product"
(declare-const patient_has_finding_of_posterior_rhinorrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of posterior rhinorrhea (postnasal discharge).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of posterior rhinorrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of posterior rhinorrhea.","meaning":"Boolean indicating whether the patient currently has posterior rhinorrhea (postnasal discharge)."}  ;; "postnasal discharge"
(declare-const patient_has_finding_of_posterior_rhinorrhea_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has posterior rhinorrhea present on the day of or the day before the first dose of the investigational product.","when_to_set_to_false":"Set to false if the patient does not have posterior rhinorrhea present on the day of or the day before the first dose of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether posterior rhinorrhea is present on the day of or the day before the first dose of the investigational product.","meaning":"Boolean indicating whether posterior rhinorrhea is present on the day of or the day before the first dose of the investigational product."}  ;; "postnasal discharge on the day of or the day before the first dose of the investigational product"
(declare-const patient_has_finding_of_mucopurulent_postnasal_discharge_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of mucopurulent postnasal discharge.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of mucopurulent postnasal discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of mucopurulent postnasal discharge.","meaning":"Boolean indicating whether the patient currently has mucopurulent postnasal discharge."}  ;; "mucopurulent postnasal discharge"
(declare-const patient_has_finding_of_mucopurulent_postnasal_discharge_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has mucopurulent postnasal discharge present on the day of or the day before the first dose of the investigational product.","when_to_set_to_false":"Set to false if the patient does not have mucopurulent postnasal discharge present on the day of or the day before the first dose of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether mucopurulent postnasal discharge is present on the day of or the day before the first dose of the investigational product.","meaning":"Boolean indicating whether mucopurulent postnasal discharge is present on the day of or the day before the first dose of the investigational product."}  ;; "mucopurulent postnasal discharge on the day of or the day before the first dose of the investigational product"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_hyperemic_nasal_mucosa_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product
         patient_has_finding_of_hyperemic_nasal_mucosa_now)
     :named REQ0_AUXILIARY0)) ;; "redness of the nasal mucosa on the day of or the day before the first dose of the investigational product" implies "redness of the nasal mucosa"

(assert
  (! (=> patient_has_finding_of_purulent_nasal_discharge_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product
         patient_has_finding_of_purulent_nasal_discharge_now)
     :named REQ0_AUXILIARY1)) ;; "purulent nasal discharge on the day of or the day before the first dose of the investigational product" implies "purulent nasal discharge"

(assert
  (! (=> patient_has_finding_of_mucopurulent_nasal_discharge_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product
         patient_has_finding_of_mucopurulent_nasal_discharge_now)
     :named REQ0_AUXILIARY2)) ;; "mucopurulent nasal discharge on the day of or the day before the first dose of the investigational product" implies "mucopurulent nasal discharge"

(assert
  (! (=> patient_has_finding_of_posterior_rhinorrhea_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product
         patient_has_finding_of_posterior_rhinorrhea_now)
     :named REQ0_AUXILIARY3)) ;; "postnasal discharge on the day of or the day before the first dose of the investigational product" implies "postnasal discharge"

(assert
  (! (=> patient_has_finding_of_mucopurulent_postnasal_discharge_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product
         patient_has_finding_of_mucopurulent_postnasal_discharge_now)
     :named REQ0_AUXILIARY4)) ;; "mucopurulent postnasal discharge on the day of or the day before the first dose of the investigational product" implies "mucopurulent postnasal discharge"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be a child with acute bacterial rhinosinusitis.
(assert
  (! (and (< patient_age_value_recorded_now_in_years 18)
          patient_has_finding_of_acute_bacterial_rhinosinusitis_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a child with acute bacterial rhinosinusitis"

;; Component 1: The patient must have inflammation as bacterial infection.
(assert
  (! patient_has_finding_of_bacterial_infectious_disease_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have inflammation as bacterial infection"

;; Component 2: The patient must have (redness of the nasal mucosa) AND (at least one of the following: purulent nasal discharge OR mucopurulent nasal discharge OR purulent postnasal discharge OR mucopurulent postnasal discharge) on the day of or the day before the first dose of the investigational product.
(assert
  (! (and patient_has_finding_of_hyperemic_nasal_mucosa_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product
          (or patient_has_finding_of_purulent_nasal_discharge_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product
              patient_has_finding_of_mucopurulent_nasal_discharge_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product
              patient_has_finding_of_posterior_rhinorrhea_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product
              patient_has_finding_of_mucopurulent_postnasal_discharge_now@@temporalcontext_on_day_of_or_day_before_first_dose_of_investigational_product))
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "redness of the nasal mucosa AND at least one of the following: purulent nasal discharge OR mucopurulent nasal discharge OR purulent postnasal discharge OR mucopurulent postnasal discharge on the day of or the day before the first dose of the investigational product"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_nasal_polypectomy_inthepast90days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a nasal polypectomy more than 90 days before the current time.","when_to_set_to_false":"Set to false if the patient has not undergone a nasal polypectomy more than 90 days before the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a nasal polypectomy more than 90 days before the current time.","meaning":"Boolean indicating whether the patient has undergone a nasal polypectomy more than 90 days before the current time."}  ;; "the patient has had a previous surgery of nasal polypectomy more than 90 days before"
(declare-const patient_has_undergone_surgical_procedure_inthepast365days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any surgical procedure more than 365 days before the current time.","when_to_set_to_false":"Set to false if the patient has not undergone any surgical procedure more than 365 days before the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any surgical procedure more than 365 days before the current time.","meaning":"Boolean indicating whether the patient has undergone any surgical procedure more than 365 days before the current time."}  ;; "the patient has had a previous surgery more than 365 days before"
(declare-const patient_has_undergone_surgical_procedure_inthepast365days@@apparently_preserved_maxillary_sinus_mucosa Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure more than 365 days before the current time and the maxillary sinus mucosa is apparently preserved.","when_to_set_to_false":"Set to false if the patient has undergone a surgical procedure more than 365 days before the current time and the maxillary sinus mucosa is not apparently preserved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the maxillary sinus mucosa is apparently preserved after the surgical procedure more than 365 days before.","meaning":"Boolean indicating whether the maxillary sinus mucosa is apparently preserved after a surgical procedure more than 365 days before the current time."}  ;; "apparently preserved maxillary sinus mucosa after a surgical procedure more than 365 days before"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_undergone_surgical_procedure_inthepast365days@@apparently_preserved_maxillary_sinus_mucosa
         patient_has_undergone_surgical_procedure_inthepast365days)
     :named REQ1_AUXILIARY0)) ;; "the patient has had a previous surgery more than 365 days before AND apparently preserved maxillary sinus mucosa"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must NOT have a surgical history, EXCEPT:
;;   (the patient has had a previous surgery more than 365 days before AND apparently preserved maxillary sinus mucosa)
;;   OR (the patient has had a previous surgery of nasal polypectomy more than 90 days before)
(assert
  (! (or (not patient_has_undergone_surgical_procedure_inthepast365days)
         patient_has_undergone_surgical_procedure_inthepast365days@@apparently_preserved_maxillary_sinus_mucosa
         patient_has_undergone_nasal_polypectomy_inthepast90days)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have a surgical history, EXCEPT (the patient has had a previous surgery more than 365 days before AND apparently preserved maxillary sinus mucosa) OR (the patient has had a previous surgery of nasal polypectomy more than 90 days before)."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
;; "a child"
;; Already declared: (declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; "acute bacterial rhinosinusitis"
;; Already declared: (declare-const patient_has_finding_of_acute_bacterial_rhinosinusitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of acute bacterial rhinosinusitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of acute bacterial rhinosinusitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of acute bacterial rhinosinusitis.","meaning":"Boolean indicating whether the patient currently has a clinical finding of acute bacterial rhinosinusitis."}

(declare-const patient_has_finding_of_moderate_or_severe_acute_bacterial_rhinosinusitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute bacterial rhinosinusitis classified as moderate or severe based on total severity score.","when_to_set_to_false":"Set to false if the patient currently has acute bacterial rhinosinusitis but it is not classified as moderate or severe based on total severity score.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute bacterial rhinosinusitis is classified as moderate or severe based on total severity score.","meaning":"Boolean indicating whether the patient currently has acute bacterial rhinosinusitis classified as moderate or severe based on total severity score."}  ;; "severity is classified as moderate OR severe (total score ≥ 4) based on nasal cavity findings and symptoms"

(declare-const patient_total_severity_score_for_acute_bacterial_rhinosinusitis_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current total severity score for acute bacterial rhinosinusitis, as determined by nasal cavity findings and symptoms, measured in points.","when_to_set_to_null":"Set to null if the total severity score for acute bacterial rhinosinusitis is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current total severity score for acute bacterial rhinosinusitis, measured in points."}  ;; "total score ≥ 4 based on nasal cavity findings and symptoms"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: moderate or severe acute bacterial rhinosinusitis is defined as total score ≥ 4
(assert
  (! (= patient_has_finding_of_moderate_or_severe_acute_bacterial_rhinosinusitis_now
        (>= patient_total_severity_score_for_acute_bacterial_rhinosinusitis_now_withunit_points 4))
     :named REQ2_AUXILIARY0)) ;; "severity is classified as moderate OR severe (total score ≥ 4) based on nasal cavity findings and symptoms"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must be a child with acute bacterial rhinosinusitis
(assert
  (! (and (< patient_age_value_recorded_now_in_years 18)
          (>= patient_age_value_recorded_now_in_years 0)
          patient_has_finding_of_acute_bacterial_rhinosinusitis_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be a child with acute bacterial rhinosinusitis"

;; Component 1: severity must be classified as moderate OR severe (total score ≥ 4)
(assert
  (! patient_has_finding_of_moderate_or_severe_acute_bacterial_rhinosinusitis_now
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "severity is classified as moderate OR severe (total score ≥ 4) based on nasal cavity findings and symptoms"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "a girl"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "a boy"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must be a boy OR a girl.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a boy OR a girl."

;; Component 1: To be included, the patient must be aged ≥ 3 months to < 15 years.
;; 3 months = 0.25 years
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 0.25)
          (< patient_age_value_recorded_now_in_years 15.0))
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 3 months to < 15 years."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body weight in kilograms is available.","when_to_set_to_null":"Set to null if no current body weight measurement in kilograms is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in kilograms."}  ;; "body weight"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have body weight ≥ 6 kilograms.
(assert
  (! (>= patient_body_weight_value_recorded_now_withunit_kilograms 6.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body weight ≥ 6 kilograms"

;; Component 1: To be included, the patient must have body weight < 40 kilograms.
(assert
  (! (< patient_body_weight_value_recorded_now_withunit_kilograms 40.0)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "body weight < 40 kilograms"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const written_informed_consent_obtained_from_legally_acceptable_representative_of_patient Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the legally acceptable representative of the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the legally acceptable representative of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the legally acceptable representative of the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from the legally acceptable representative of the patient."} ;; "written informed consent must have been obtained from the legally acceptable representative of the patient"
(declare-const written_informed_consent_provided_by_patient Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been provided by the patient.","when_to_set_to_false":"Set to false if written informed consent has not been provided by the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been provided by the patient.","meaning":"Boolean indicating whether written informed consent has been provided by the patient."} ;; "the patient must also have provided written informed consent"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Written informed consent must have been obtained from the legally acceptable representative of the patient.
(assert
  (! written_informed_consent_obtained_from_legally_acceptable_representative_of_patient
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "written informed consent must have been obtained from the legally acceptable representative of the patient"

;; Component 1: If the patient is aged ≥ 12 years, the patient must also have provided written informed consent.
(assert
  (! (or (< patient_age_value_recorded_now_in_years 12)
         written_informed_consent_provided_by_patient)
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is aged ≥ 12 years, the patient must also have provided written informed consent"
