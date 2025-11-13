;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_airway_specimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had airway specimen collected as a specimen for research studies now.","when_to_set_to_false":"Set to false if the patient has not had airway specimen collected as a specimen for research studies now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had airway specimen collected as a specimen for research studies now.","meaning":"Boolean indicating whether the patient is currently exposed to airway specimen as a specimen collected for research studies."} // "Collection of airway specimen ... for research studies."
(declare-const patient_is_exposed_to_airway_specimen_now@@collected_as_specimen_for_research_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's airway specimen was collected specifically for research studies.","when_to_set_to_false":"Set to false if the patient's airway specimen was not collected for research studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the airway specimen was collected for research studies.","meaning":"Boolean indicating whether the patient's airway specimen was collected for research studies."} // "airway specimen ... for research studies."
(declare-const patient_is_exposed_to_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had blood collected as a specimen for research studies now.","when_to_set_to_false":"Set to false if the patient has not had blood collected as a specimen for research studies now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had blood collected as a specimen for research studies now.","meaning":"Boolean indicating whether the patient is currently exposed to blood as a specimen collected for research studies."} // "Collection of blood specimen ... for research studies."
(declare-const patient_is_exposed_to_blood_now@@collected_as_specimen_for_research_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's blood specimen was collected specifically for research studies.","when_to_set_to_false":"Set to false if the patient's blood specimen was not collected for research studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blood specimen was collected for research studies.","meaning":"Boolean indicating whether the patient's blood specimen was collected for research studies."} // "blood specimen ... for research studies."
(declare-const patient_is_exposed_to_urine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had urine collected as a specimen for research studies now.","when_to_set_to_false":"Set to false if the patient has not had urine collected as a specimen for research studies now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had urine collected as a specimen for research studies now.","meaning":"Boolean indicating whether the patient is currently exposed to urine as a specimen collected for research studies."} // "Collection of urine specimen ... for research studies."
(declare-const patient_is_exposed_to_urine_now@@collected_as_specimen_for_research_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's urine specimen was collected specifically for research studies.","when_to_set_to_false":"Set to false if the patient's urine specimen was not collected for research studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the urine specimen was collected for research studies.","meaning":"Boolean indicating whether the patient's urine specimen was collected for research studies."} // "urine specimen ... for research studies."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_exposed_to_airway_specimen_now@@collected_as_specimen_for_research_studies
         patient_is_exposed_to_airway_specimen_now)
     :named REQ0_AUXILIARY0)) ;; "airway specimen ... for research studies."

(assert
  (! (=> patient_is_exposed_to_blood_now@@collected_as_specimen_for_research_studies
         patient_is_exposed_to_blood_now)
     :named REQ0_AUXILIARY1)) ;; "blood specimen ... for research studies."

(assert
  (! (=> patient_is_exposed_to_urine_now@@collected_as_specimen_for_research_studies
         patient_is_exposed_to_urine_now)
     :named REQ0_AUXILIARY2)) ;; "urine specimen ... for research studies."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be enrolled in the Airway protocol #1204012331 Collection of airway specimen OR blood specimen OR urine specimen from subjects for research studies.
(assert
  (! (or patient_is_exposed_to_airway_specimen_now@@collected_as_specimen_for_research_studies
         patient_is_exposed_to_blood_now@@collected_as_specimen_for_research_studies
         patient_is_exposed_to_urine_now@@collected_as_specimen_for_research_studies)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "Collection of airway specimen OR blood specimen OR urine specimen ... for research studies."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease (COPD)."} // "chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_i_ii_iii_or_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease (COPD) and the COPD is classified as GOLD stage I, II, III, or IV.","when_to_set_to_false":"Set to false if the patient currently has COPD but it is not classified as GOLD stage I, II, III, or IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's COPD is classified as GOLD stage I, II, III, or IV.","meaning":"Boolean indicating whether the patient's COPD is classified as GOLD stage I, II, III, or IV."} // "chronic obstructive pulmonary disease (with exhaustive subcategories (Global Initiative for Chronic Obstructive Lung Disease stage I OR ... IV))"
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the lung.","meaning":"Boolean indicating whether the patient currently has a disorder of the lung."} // "lung disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_i Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung classified as GOLD stage I.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the lung but it is not classified as GOLD stage I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's lung disease is classified as GOLD stage I.","meaning":"Boolean indicating whether the patient's lung disease is classified as GOLD stage I."} // "GOLD stage I"
(declare-const patient_has_finding_of_disorder_of_lung_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung classified as GOLD stage II.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the lung but it is not classified as GOLD stage II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's lung disease is classified as GOLD stage II.","meaning":"Boolean indicating whether the patient's lung disease is classified as GOLD stage II."} // "GOLD stage II"
(declare-const patient_has_finding_of_disorder_of_lung_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_iii_or_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung classified as GOLD stage III or IV.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the lung but it is not classified as GOLD stage III or IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's lung disease is classified as GOLD stage III or IV.","meaning":"Boolean indicating whether the patient's lung disease is classified as GOLD stage III or IV."} // "GOLD stage III or IV"
(declare-const patient_has_finding_of_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory failure.","meaning":"Boolean indicating whether the patient currently has respiratory failure."} // "respiratory failure"
(declare-const patient_is_ambulatory_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently ambulatory.","when_to_set_to_false":"Set to false if the patient is currently not ambulatory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently ambulatory.","meaning":"Boolean indicating whether the patient is currently ambulatory."} // "be ambulatory"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Exhaustive subcategories for GOLD stages define the umbrella for GOLD I-IV
(assert
  (! (= patient_has_finding_of_chronic_obstructive_lung_disease_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_i_ii_iii_or_iv
        (or patient_has_finding_of_disorder_of_lung_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_i
            patient_has_finding_of_disorder_of_lung_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_ii
            patient_has_finding_of_disorder_of_lung_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_iii_or_iv))
     :named REQ1_AUXILIARY0)) ;; "with exhaustive subcategories (GOLD I-IV)"

;; Qualifier variable implies stem variable for COPD finding
(assert
  (! (=> patient_has_finding_of_chronic_obstructive_lung_disease_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_i_ii_iii_or_iv
         patient_has_finding_of_chronic_obstructive_lung_disease_now)
     :named REQ1_AUXILIARY1)) ;; "COPD classified as GOLD I-IV implies COPD"

;; Qualifier variables imply stem variable for lung disorder finding
(assert
  (! (=> patient_has_finding_of_disorder_of_lung_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_i
         patient_has_finding_of_disorder_of_lung_now)
     :named REQ1_AUXILIARY2)) ;; "GOLD I implies lung disorder"
(assert
  (! (=> patient_has_finding_of_disorder_of_lung_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_ii
         patient_has_finding_of_disorder_of_lung_now)
     :named REQ1_AUXILIARY3)) ;; "GOLD II implies lung disorder"
(assert
  (! (=> patient_has_finding_of_disorder_of_lung_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_iii_or_iv
         patient_has_finding_of_disorder_of_lung_now)
     :named REQ1_AUXILIARY4)) ;; "GOLD III/IV implies lung disorder"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must meet lung disease criteria for COPD (GOLD I-IV)
(assert
  (! patient_has_finding_of_chronic_obstructive_lung_disease_now@@classified_as_global_initiative_for_chronic_obstructive_lung_disease_stage_i_ii_iii_or_iv
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "meet the lung disease criteria for having chronic obstructive pulmonary disease (with exhaustive subcategories (GOLD I-IV))"

;; Component 1: Must be ambulatory
(assert
  (! patient_is_ambulatory_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be ambulatory"

;; Component 2: Must have no evidence of respiratory failure
(assert
  (! (not patient_has_finding_of_respiratory_failure_now)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have no evidence of respiratory failure"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_can_provide_informed_consent_for_long_term_follow_up_study_with_repeated_bronchoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","when_to_set_to_false":"Set to false if the patient is unable to provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can provide informed consent for the long term follow up study with repeated bronchoscopy procedures.","meaning":"Boolean indicating whether the patient is able to provide informed consent specifically for participation in the long term follow up study that involves repeated bronchoscopy procedures."} // "must be able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."
(declare-const patient_can_undergo_bronchoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to undergo bronchoscopy procedures now.","when_to_set_to_false":"Set to false if the patient is unable to undergo bronchoscopy procedures now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can undergo bronchoscopy procedures now.","meaning":"Boolean indicating whether the patient can undergo bronchoscopy procedures now."} // "bronchoscopy procedures"
(declare-const patient_can_undergo_bronchoscopy_now@@repeated_as_part_of_long_term_follow_up_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient can undergo bronchoscopy procedures now and these procedures are to be performed repeatedly as part of the long term follow up study.","when_to_set_to_false":"Set to false if the patient can undergo bronchoscopy procedures now but these procedures are not to be performed repeatedly as part of the long term follow up study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bronchoscopy procedures are to be performed repeatedly as part of the long term follow up study.","meaning":"Boolean indicating whether the bronchoscopy procedures are to be performed repeatedly as part of the long term follow up study."} // "repeated bronchoscopy procedures as part of long term follow up study"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_can_undergo_bronchoscopy_now@@repeated_as_part_of_long_term_follow_up_study
         patient_can_undergo_bronchoscopy_now)
     :named REQ2_AUXILIARY0)) ;; "repeated bronchoscopy procedures as part of long term follow up study" implies "bronchoscopy procedures"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_can_provide_informed_consent_for_long_term_follow_up_study_with_repeated_bronchoscopy
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be able to provide informed consent for the long term follow up study with repeated bronchoscopy procedures."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "at least 18 years of age"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be at least 18 years of age."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an active smoker.","when_to_set_to_false":"Set to false if the patient is currently not an active smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an active smoker.","meaning":"Boolean indicating whether the patient is currently an active smoker."} // "must be an active smoker"
(declare-const patient_nicotine_value_recorded_now_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's urine nicotine concentration is recorded now in ng/mL.","when_to_set_to_null":"Set to null if no urine nicotine concentration measurement is available now or the value is indeterminate.","meaning":"Numeric value of the patient's urine nicotine concentration measured now, in ng/mL."} // "urine nicotine concentration > 30 ng/mL"
(declare-const patient_cotinine_value_recorded_now_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's urine cotinine concentration is recorded now in ng/mL.","when_to_set_to_null":"Set to null if no urine cotinine concentration measurement is available now or the value is indeterminate.","meaning":"Numeric value of the patient's urine cotinine concentration measured now, in ng/mL."} // "urine cotinine concentration > 50 ng/mL"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: "active smoker as evidenced by (urine nicotine concentration > 30 ng/mL OR urine cotinine concentration > 50 ng/mL)"
(assert
  (! (= patient_has_finding_of_smoker_now
        (or (> patient_nicotine_value_recorded_now_withunit_ng_per_ml 30.0)
            (> patient_cotinine_value_recorded_now_withunit_ng_per_ml 50.0)))
     :named REQ4_AUXILIARY0)) ;; "active smoker as evidenced by (urine nicotine concentration > 30 ng/mL OR urine cotinine concentration > 50 ng/mL)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an active smoker as evidenced by (urine nicotine concentration > 30 ng/mL OR urine cotinine concentration > 50 ng/mL)."
