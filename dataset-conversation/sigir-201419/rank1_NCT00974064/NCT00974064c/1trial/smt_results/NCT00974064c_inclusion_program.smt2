;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_enrolled_in_airway_protocol_1204012331_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in Airway protocol #1204012331.","when_to_set_to_false":"Set to false if the patient is not currently enrolled in Airway protocol #1204012331.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in Airway protocol #1204012331.","meaning":"Boolean indicating whether the patient is currently enrolled in Airway protocol #1204012331."}
(declare-const patient_is_exposed_to_airway_specimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to airway specimen, such as through collection of an airway specimen.","when_to_set_to_false":"Set to false if the patient is not currently exposed to airway specimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to airway specimen.","meaning":"Boolean indicating whether the patient is currently exposed to airway specimen."}
(declare-const patient_is_exposed_to_airway_specimen_now@@collected_as_specimen_for_research_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to airway specimen is specifically due to collection of an airway specimen for research studies.","when_to_set_to_false":"Set to false if the patient's current exposure to airway specimen is not due to collection as a specimen for research studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to airway specimen is due to collection as a specimen for research studies.","meaning":"Boolean indicating whether the patient's current exposure to airway specimen is specifically due to collection as a specimen for research studies."}
(declare-const patient_is_exposed_to_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to blood as a substance, such as through collection of a blood specimen.","when_to_set_to_false":"Set to false if the patient is not currently exposed to blood as a substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to blood as a substance.","meaning":"Boolean indicating whether the patient is currently exposed to blood as a substance."}
(declare-const patient_is_exposed_to_blood_now@@collected_as_specimen_for_research_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to blood is specifically due to collection of a blood specimen for research studies.","when_to_set_to_false":"Set to false if the patient's current exposure to blood is not due to collection as a specimen for research studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to blood is due to collection as a specimen for research studies.","meaning":"Boolean indicating whether the patient's current exposure to blood is specifically due to collection as a specimen for research studies."}
(declare-const patient_is_exposed_to_urine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to urine as a substance, such as through collection of a urine specimen.","when_to_set_to_false":"Set to false if the patient is not currently exposed to urine as a substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to urine as a substance.","meaning":"Boolean indicating whether the patient is currently exposed to urine as a substance."}
(declare-const patient_is_exposed_to_urine_now@@collected_as_specimen_for_research_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to urine is specifically due to collection of a urine specimen for research studies.","when_to_set_to_false":"Set to false if the patient's current exposure to urine is not due to collection as a specimen for research studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to urine is due to collection as a specimen for research studies.","meaning":"Boolean indicating whether the patient's current exposure to urine is specifically due to collection as a specimen for research studies."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_exposed_to_airway_specimen_now@@collected_as_specimen_for_research_studies
         patient_is_exposed_to_airway_specimen_now)
     :named REQ0_AUXILIARY0)) ;; "Collection of Airway specimen from subjects for research studies."

(assert
  (! (=> patient_is_exposed_to_blood_now@@collected_as_specimen_for_research_studies
         patient_is_exposed_to_blood_now)
     :named REQ0_AUXILIARY1)) ;; "Collection of blood specimen from subjects for research studies."

(assert
  (! (=> patient_is_exposed_to_urine_now@@collected_as_specimen_for_research_studies
         patient_is_exposed_to_urine_now)
     :named REQ0_AUXILIARY2)) ;; "Collection of urine specimen from subjects for research studies."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be enrolled in the Airway protocol #1204012331 Collection of Airway specimen OR blood specimen OR urine specimen from subjects for research studies.
(assert
  (! (and patient_is_enrolled_in_airway_protocol_1204012331_now
          (or patient_is_exposed_to_airway_specimen_now@@collected_as_specimen_for_research_studies
              patient_is_exposed_to_blood_now@@collected_as_specimen_for_research_studies
              patient_is_exposed_to_urine_now@@collected_as_specimen_for_research_studies))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be enrolled in the Airway protocol #1204012331 Collection of Airway specimen OR blood specimen OR urine specimen from subjects for research studies."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_willing_to_provide_informed_consent_for_long_term_follow_up_study_with_repeated_bronchoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","when_to_set_to_false":"Set to false if the patient is not willing to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","meaning":"Boolean indicating whether the patient is willing to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."} ;; "the patient must be willing to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."
(declare-const patient_is_able_to_provide_informed_consent_for_long_term_follow_up_study_with_repeated_bronchoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","when_to_set_to_false":"Set to false if the patient is not able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","meaning":"Boolean indicating whether the patient is able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."} ;; "the patient must be able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Willingness to provide informed consent for the long term follow up study with repeated bronchoscopy procedures
(assert
  (! patient_is_willing_to_provide_informed_consent_for_long_term_follow_up_study_with_repeated_bronchoscopy
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."

;; Component 1: Ability to provide informed consent for the long term follow up study with repeated bronchoscopy procedures
(assert
  (! patient_is_able_to_provide_informed_consent_for_long_term_follow_up_study_with_repeated_bronchoscopy
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must be able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} ;; "male or female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} ;; "male or female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "at least 18 years of age"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: To be included, the patient must be at least 18 years of age.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be at least 18 years of age."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} ;; "the patient must be a current smoker"
(declare-const patient_self_reports_current_smoking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently self-reports being a smoker.","when_to_set_to_false":"Set to false if the patient currently self-reports not being a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently self-reports being a smoker.","meaning":"Boolean indicating whether the patient currently self-reports being a smoker."} ;; "self-report"
(declare-const patient_nicotine_value_recorded_now_withunit_nanograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current urine nicotine concentration in nanograms per milliliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current urine nicotine concentration in nanograms per milliliter."} ;; "urine nicotine concentration > 30 nanograms per milliliter"
(declare-const patient_cotinine_value_recorded_now_withunit_nanograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current urine cotinine concentration in nanograms per milliliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current urine cotinine concentration in nanograms per milliliter."} ;; "urine cotinine concentration > 50 nanograms per milliliter"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition in the requirement: "current smoker (as evidenced by (self-report AND (urine nicotine concentration > 30 ng/mL OR urine cotinine concentration > 50 ng/mL)))"
(assert
  (! (= patient_has_finding_of_smoker_now
        (and patient_self_reports_current_smoking_now
             (or (> patient_nicotine_value_recorded_now_withunit_nanograms_per_milliliter 30.0)
                 (> patient_cotinine_value_recorded_now_withunit_nanograms_per_milliliter 50.0))))
     :named REQ3_AUXILIARY0)) ;; "as evidenced by (self-report AND (urine nicotine concentration > 30 ng/mL OR urine cotinine concentration > 50 ng/mL))"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be a current smoker (as evidenced by ...)"

;; ===================== Declarations for the criterion (REQ 4) =====================
;; "the patient must be a current smoker"
;; Already declared in previous SMT program:
;; (declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."}

(declare-const patient_is_willing_to_stop_smoking Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to stop smoking.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to stop smoking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to stop smoking.","meaning":"Boolean indicating whether the patient is willing to stop smoking."} ;; "the patient must be willing to stop smoking"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: "To be included, the patient must be a current smoker."
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 1: "To be included, the patient must be willing to stop smoking."
(assert
  (! patient_is_willing_to_stop_smoking
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))
