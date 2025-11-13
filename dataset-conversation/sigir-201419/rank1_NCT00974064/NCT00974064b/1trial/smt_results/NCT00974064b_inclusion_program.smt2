;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_enrolled_in_airway_protocol_1204012331_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in the Airway protocol #1204012331.","when_to_set_to_false":"Set to false if the patient is not currently enrolled in the Airway protocol #1204012331.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in the Airway protocol #1204012331.","meaning":"Boolean indicating whether the patient is currently enrolled in the Airway protocol #1204012331."} // "To be included, the patient must be enrolled in the Airway protocol #1204012331 Collection of airway specimen or blood specimen or urine specimen from subjects for research studies."
(declare-const patient_has_airway_specimen_collected_for_research_studies_now Bool) ;; {"when_to_set_to_true":"Set to true if an airway specimen has been collected from the patient for research studies at the current time.","when_to_set_to_false":"Set to false if an airway specimen has not been collected from the patient for research studies at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an airway specimen has been collected from the patient for research studies at the current time.","meaning":"Boolean indicating whether an airway specimen has been collected from the patient for research studies at the current time."} // "Collection of airway specimen ... for research studies."
(declare-const patient_is_exposed_to_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to blood as a substance (e.g., via collection of blood specimen).","when_to_set_to_false":"Set to false if the patient is not currently exposed to blood as a substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to blood as a substance.","meaning":"Boolean indicating whether the patient is currently exposed to blood as a substance."} // "Collection of ... blood specimen ... for research studies."
(declare-const patient_is_exposed_to_blood_now@@collected_as_specimen_for_research_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to blood is specifically due to collection of blood specimen for research studies.","when_to_set_to_false":"Set to false if the patient's exposure to blood is not due to collection of blood specimen for research studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to blood is due to collection of blood specimen for research studies.","meaning":"Boolean indicating whether the patient's exposure to blood is specifically due to collection as a specimen for research studies."} // "Collection of blood specimen ... for research studies."
(declare-const patient_is_exposed_to_urine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to urine as a substance (e.g., via collection of urine specimen).","when_to_set_to_false":"Set to false if the patient is not currently exposed to urine as a substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to urine as a substance.","meaning":"Boolean indicating whether the patient is currently exposed to urine as a substance."} // "Collection of ... urine specimen ... for research studies."
(declare-const patient_is_exposed_to_urine_now@@collected_as_specimen_for_research_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to urine is specifically due to collection of urine specimen for research studies.","when_to_set_to_false":"Set to false if the patient's exposure to urine is not due to collection of urine specimen for research studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to urine is due to collection of urine specimen for research studies.","meaning":"Boolean indicating whether the patient's exposure to urine is specifically due to collection as a specimen for research studies."} // "Collection of urine specimen ... for research studies."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_exposed_to_blood_now@@collected_as_specimen_for_research_studies
         patient_is_exposed_to_blood_now)
     :named REQ0_AUXILIARY0)) ;; "patient_is_exposed_to_blood_now@@collected_as_specimen_for_research_studies implies patient_is_exposed_to_blood_now"

(assert
  (! (=> patient_is_exposed_to_urine_now@@collected_as_specimen_for_research_studies
         patient_is_exposed_to_urine_now)
     :named REQ0_AUXILIARY1)) ;; "patient_is_exposed_to_urine_now@@collected_as_specimen_for_research_studies implies patient_is_exposed_to_urine_now"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be enrolled in the Airway protocol #1204012331
(assert
  (! patient_is_enrolled_in_airway_protocol_1204012331_now
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be enrolled in the Airway protocol #1204012331 Collection of airway specimen or blood specimen or urine specimen from subjects for research studies."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_is_willing_to_provide_informed_consent_for_long_term_follow_up_study_with_repeated_bronchoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","when_to_set_to_false":"Set to false if the patient does not express willingness to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","meaning":"Boolean indicating whether the patient is willing to provide informed consent for participation in the long term follow up study with repeated bronchoscopy procedures."} // "To be included, the patient must be willing to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."
(declare-const patient_is_able_to_provide_informed_consent_for_long_term_follow_up_study_with_repeated_bronchoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","when_to_set_to_false":"Set to false if the patient is not able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","meaning":"Boolean indicating whether the patient is able to provide informed consent for participation in the long term follow up study with repeated bronchoscopy procedures."} // "To be included, the patient must be able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_willing_to_provide_informed_consent_for_long_term_follow_up_study_with_repeated_bronchoscopy
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."
(assert
  (! patient_is_able_to_provide_informed_consent_for_long_term_follow_up_study_with_repeated_bronchoscopy
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} // "To be included, the patient must be male or female."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be at least 18 years of age."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must be male or female
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: Patient must be at least 18 years of age
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be at least 18 years of age."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an active smoker.","when_to_set_to_false":"Set to false if the patient is currently not an active smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an active smoker.","meaning":"Boolean indicating whether the patient is currently an active smoker."} // "To be included, the patient must be an active smoker (as evidenced by self-report)"
(declare-const patient_has_finding_of_smoker_now@@evidenced_by_self_report Bool) ;; {"when_to_set_to_true":"Set to true if the patient's status as an active smoker is evidenced by self-report.","when_to_set_to_false":"Set to false if the patient's status as an active smoker is not evidenced by self-report.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether self-report evidences the patient's active smoker status.","meaning":"Boolean indicating whether the patient's active smoker status is evidenced by self-report."} // "as evidenced by self-report"
(declare-const patient_nicotine_value_recorded_now_withunit_nanograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's urine nicotine concentration is recorded now in nanograms per milliliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's urine nicotine concentration measured now in nanograms per milliliter."} // "urine nicotine concentration > 30 nanograms per milliliter"
(declare-const patient_cotinine_value_recorded_now_withunit_nanograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's urine cotinine concentration is recorded now in nanograms per milliliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's urine cotinine concentration measured now in nanograms per milliliter."} // "urine cotinine concentration > 50 nanograms per milliliter"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_smoker_now@@evidenced_by_self_report
         patient_has_finding_of_smoker_now)
     :named REQ3_AUXILIARY0)) ;; "as evidenced by self-report" implies "active smoker"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must be an active smoker as evidenced by self-report
(assert
  (! patient_has_finding_of_smoker_now@@evidenced_by_self_report
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an active smoker (as evidenced by self-report)"

;; Component 1: Must have (urine nicotine concentration > 30 ng/mL OR urine cotinine concentration > 50 ng/mL)
(assert
  (! (or (> patient_nicotine_value_recorded_now_withunit_nanograms_per_milliliter 30.0)
         (> patient_cotinine_value_recorded_now_withunit_nanograms_per_milliliter 50.0))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "urine nicotine concentration > 30 nanograms per milliliter OR urine cotinine concentration > 50 nanograms per milliliter"
