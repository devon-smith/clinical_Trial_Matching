;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "be aged ≥ 18 years AND be aged ≤ 70 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be aged ≥ 18 years"
(assert
  (! (<= patient_age_value_recorded_now_in_years 70.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be aged ≤ 70 years"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const birth_control_agreement_required_duration_after_treatment_ends_value_in_months Real) ;; {"when_to_set_to_value":"Set to 6 when the required post-treatment birth control agreement duration after treatment ends is specified as 6 months.","when_to_set_to_null":"Set to null if the required post-treatment birth control agreement duration after treatment ends is not specified or cannot be determined.","meaning":"Numeric value representing the required duration in months for the patient's agreement to use birth control after treatment ends."} ;; "the 6-month period after treatment ends"
(declare-const patient_agrees_to_use_reliable_birth_control_during_6_months_after_treatment_ends Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use a reliable method of birth control during the 6-month period after treatment ends.","when_to_set_to_false":"Set to false if the patient does not agree to use a reliable method of birth control during the 6-month period after treatment ends.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use a reliable method of birth control during the 6-month period after treatment ends.","meaning":"Boolean indicating whether the patient agrees to use a reliable method of birth control during the 6-month period after treatment ends."} ;; "agree to use a reliable method of birth control during the 6-month period after treatment ends"
(declare-const patient_agrees_to_use_reliable_birth_control_during_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use a reliable method of birth control during the treatment period.","when_to_set_to_false":"Set to false if the patient does not agree to use a reliable method of birth control during the treatment period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use a reliable method of birth control during the treatment period.","meaning":"Boolean indicating whether the patient agrees to use a reliable method of birth control during the treatment period."} ;; "agree to use a reliable method of birth control during treatment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
(assert
  (! (= birth_control_agreement_required_duration_after_treatment_ends_value_in_months 6.0)
     :named REQ1_AUXILIARY0))
;; "the 6-month period after treatment ends"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_agrees_to_use_reliable_birth_control_during_treatment
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))
;; "agree to use a reliable method of birth control during treatment"

(assert
  (! patient_agrees_to_use_reliable_birth_control_during_6_months_after_treatment_ends
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS))
;; "agree to use a reliable method of birth control during the 6-month period after treatment ends"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented diagnosis of systemic lupus erythematosus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of systemic lupus erythematosus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of systemic lupus erythematosus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of systemic lupus erythematosus."} ;; "systemic lupus erythematosus"
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@defined_by_american_college_of_rheumatology_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of systemic lupus erythematosus is defined by the American College of Rheumatology criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of systemic lupus erythematosus is not defined by the American College of Rheumatology criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of systemic lupus erythematosus meets American College of Rheumatology criteria.","meaning":"Boolean indicating whether the patient's diagnosis of systemic lupus erythematosus is defined by the American College of Rheumatology criteria."} ;; "as defined by the American College of Rheumatology criteria"

;; ===================== Auxiliary Assertions (REQ 2) =====================
(assert
  (! (=> patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@defined_by_american_college_of_rheumatology_criteria
         patient_has_diagnosis_of_systemic_lupus_erythematosus_now)
     :named REQ2_AUXILIARY0)) ;; "as defined by the American College of Rheumatology criteria"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@defined_by_american_college_of_rheumatology_criteria
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have systemic lupus erythematosus (as defined by the American College of Rheumatology criteria)."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@present_for_at_least_6_months_prior_to_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of systemic lupus erythematosus has been present for at least 6 months before the screening visit.","when_to_set_to_false":"Set to false if the patient's current diagnosis duration before the screening visit is known and is less than 6 months.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the diagnosis has been present for at least 6 months prior to the screening visit.","meaning":"Boolean indicating that the patient's current systemic lupus erythematosus diagnosis has persisted for at least 6 months prior to the screening visit."} ;; "systemic lupus erythematosus for ≥ 6 months prior to the screening visit."
(declare-const systemic_lupus_erythematosus_diagnosis_duration_prior_to_screening_visit_value_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric count of months that the patient's systemic lupus erythematosus diagnosis has been present prior to the screening visit.","when_to_set_to_null":"Set to null if the duration prior to the screening visit cannot be determined from available records, including when either the onset date of systemic lupus erythematosus or the screening visit date is unknown or indeterminate.","meaning":"Numeric value in months representing the duration that the patient's systemic lupus erythematosus diagnosis has been present prior to the screening visit."} ;; "≥ 6 months prior to the screening visit."

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@present_for_at_least_6_months_prior_to_screening_visit
         patient_has_diagnosis_of_systemic_lupus_erythematosus_now)
     :named REQ3_AUXILIARY0)) ;; "must have had systemic lupus erythematosus for ≥ 6 months prior to the screening visit."

;; Define the duration-based qualifier exactly by the numeric threshold
(assert
  (! (= patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@present_for_at_least_6_months_prior_to_screening_visit
        (>= systemic_lupus_erythematosus_diagnosis_duration_prior_to_screening_visit_value_in_months 6.0))
     :named REQ3_AUXILIARY1)) ;; "≥ 6 months prior to the screening visit."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@present_for_at_least_6_months_prior_to_screening_visit
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had systemic lupus erythematosus for ≥ 6 months prior to the screening visit."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@disease_is_active Bool) ;; "active systemic lupus erythematosus disease" {"when_to_set_to_true":"Set to true if the patient's systemic lupus erythematosus is active.","when_to_set_to_false":"Set to false if the patient's systemic lupus erythematosus is inactive or in remission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's systemic lupus erythematosus is active.","meaning":"Boolean indicating whether the systemic lupus erythematosus is active for the above stem condition."}
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@temporalcontext_at_screening_visit Bool) ;; "at the screening visit" {"when_to_set_to_true":"Set to true if the presence/status of the patient's systemic lupus erythematosus pertains specifically to the screening visit assessment.","when_to_set_to_false":"Set to false if the presence/status does not pertain to the screening visit (e.g., pertains to another timepoint).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the presence/status pertains to the screening visit.","meaning":"Boolean indicating that the above stem condition is specifically anchored to the screening visit temporal context."}

;; ===================== Auxiliary Assertions (REQ 4) =====================
(assert
  (! (=> patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@disease_is_active
         patient_has_diagnosis_of_systemic_lupus_erythematosus_now)
     :named REQ4_AUXILIARY0)) ;; "active systemic lupus erythematosus disease"
(assert
  (! (=> patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@temporalcontext_at_screening_visit
         patient_has_diagnosis_of_systemic_lupus_erythematosus_now)
     :named REQ4_AUXILIARY1)) ;; "at the screening visit"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@disease_is_active
          patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@temporalcontext_at_screening_visit)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have active systemic lupus erythematosus disease at the screening visit."

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disease_affecting_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease affecting the blood.","when_to_set_to_false":"Set to false if the patient currently does not have a disease affecting the blood.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease affecting the blood.","meaning":"Boolean indicating whether the patient currently has a disease affecting the blood."} ;; "organ disease affecting the blood"
(declare-const patient_has_finding_of_disorder_of_intestine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding consistent with a disorder of the intestine.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the intestine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the intestine.","meaning":"Boolean indicating whether the patient currently has a disorder of the intestine."} ;; "organ disease affecting the intestine"
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding consistent with a disorder of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the lung.","meaning":"Boolean indicating whether the patient currently has a disorder of the lung."} ;; "organ disease affecting the lung"
(declare-const patient_has_finding_of_disorder_of_stomach_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding consistent with a disorder of the stomach.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the stomach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the stomach.","meaning":"Boolean indicating whether the patient currently has a disorder of the stomach."} ;; "organ disease affecting the stomach"
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding consistent with heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "organ disease affecting the heart"
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding consistent with kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "organ disease affecting the kidney"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (or patient_has_finding_of_disorder_of_lung_now
         patient_has_finding_of_disorder_of_stomach_now
         patient_has_finding_of_disorder_of_intestine_now
         patient_has_finding_of_disease_affecting_blood_now
         patient_has_finding_of_kidney_disease_now
         patient_has_finding_of_heart_disease_now)
     :named        REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))
;; "the patient must have (organ disease affecting the lung) OR (organ disease affecting the stomach) OR (organ disease affecting the intestine) OR (organ disease affecting the blood) OR (organ disease affecting the kidney) OR (organ disease affecting the heart)."

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_has_failed_standard_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has documented historical failure of standard therapy.","when_to_set_to_false":"Set to false if the patient does not have documented historical failure of standard therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has documented historical failure of standard therapy.","meaning":"Boolean indicating whether the patient has documented historical failure of standard therapy."} ;; "have failed standard therapy"
(declare-const patient_is_exposed_to_immunosuppressant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has documented historical exposure to any immunosuppressant substance.","when_to_set_to_false":"Set to false if the patient does not have documented historical exposure to any immunosuppressant substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has historical exposure to immunosuppressant substances.","meaning":"Boolean indicating whether the patient has documented historical exposure to immunosuppressant substances."} ;; "immunosuppressive agent"
(declare-const patient_is_exposed_to_immunosuppressant_inthehistory@@count_at_least_one Bool) ;; {"when_to_set_to_true":"Set to true if the number of distinct immunosuppressant agents the patient was exposed to is at least one.","when_to_set_to_false":"Set to false if the number of distinct immunosuppressant agents the patient was exposed to is zero.","when_to_set_to_null":"Set to null if the count of distinct immunosuppressant agents is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether, for the attached exposure stem, the count of distinct immunosuppressant agents is at least one."} ;; "including at least one immunosuppressive agent"
(declare-const patient_standard_therapy_immunosuppressive_agents_count_value_recorded_inthehistory_withunit_count Int) ;; {"when_to_set_to_value":"Set to the recorded number of distinct immunosuppressive agents included in the patient's standard therapy regimen in the history.","when_to_set_to_null":"Set to null if the number of distinct immunosuppressive agents included in the patient's standard therapy regimen in the history is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the count of distinct immunosuppressive agents included in the patient's standard therapy regimen in the history, expressed in count units."} ;; "including at least one immunosuppressive agent"
(declare-const patient_has_intolerance_to_immunosuppressant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has documented historical intolerance to an immunosuppressant substance.","when_to_set_to_false":"Set to false if the patient does not have documented historical intolerance to immunosuppressant substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has historical intolerance to immunosuppressant substances.","meaning":"Boolean indicating whether the patient has documented historical intolerance to immunosuppressant substances."} ;; "experienced side effects from an immunosuppressive agent"
(declare-const patient_has_intolerance_to_immunosuppressant_inthehistory@@required_discontinuation_of_treatment Bool) ;; {"when_to_set_to_true":"Set to true if treatment was discontinued due to adverse effects from an immunosuppressant.","when_to_set_to_false":"Set to false if adverse effects from an immunosuppressant did not require discontinuation of treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether treatment was discontinued due to adverse effects from an immunosuppressant.","meaning":"Boolean indicating whether, for the attached intolerance stem, the adverse effects required discontinuation of treatment."} ;; "required discontinuation of treatment"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier implies corresponding stem (intolerance with required discontinuation):
(assert
  (! (=> patient_has_intolerance_to_immunosuppressant_inthehistory@@required_discontinuation_of_treatment
         patient_has_intolerance_to_immunosuppressant_inthehistory)
     :named REQ6_AUXILIARY0)) ;; "experienced side effects from an immunosuppressive agent that required discontinuation of treatment"

;; If standard therapy included at least one immunosuppressive agent (count ≥ 1), then exposure-to-immunosuppressant-at-least-one holds:
(assert
  (! (=> (>= patient_standard_therapy_immunosuppressive_agents_count_value_recorded_inthehistory_withunit_count 1)
         patient_is_exposed_to_immunosuppressant_inthehistory@@count_at_least_one)
     :named REQ6_AUXILIARY1)) ;; "including at least one immunosuppressive agent"

;; Exposure count qualifier implies exposure stem:
(assert
  (! (=> patient_is_exposed_to_immunosuppressant_inthehistory@@count_at_least_one
         patient_is_exposed_to_immunosuppressant_inthehistory)
     :named REQ6_AUXILIARY2)) ;; "immunosuppressive agent"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Inclusion: (failed standard therapy including ≥1 immunosuppressive agent) OR (experienced immunosuppressant side effects requiring discontinuation)
(assert
  (! (or (and patient_has_failed_standard_therapy_inthehistory
              (>= patient_standard_therapy_immunosuppressive_agents_count_value_recorded_inthehistory_withunit_count 1)) ;; "including at least one immunosuppressive agent"
         patient_has_intolerance_to_immunosuppressant_inthehistory@@required_discontinuation_of_treatment) ;; "experienced side effects from an immunosuppressive agent that required discontinuation of treatment"
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have failed standard therapy (including at least one immunosuppressive agent)) OR (have experienced side effects from an immunosuppressive agent that required discontinuation of treatment)."

;; ===================== Declarations for the inclusion criterion (REQ 7) =====================
(declare-const patient_meets_blood_laboratory_values_set_by_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets the protocol-specified criteria for blood laboratory values.","when_to_set_to_false":"Set to false if the patient does not meet the protocol-specified criteria for blood laboratory values.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets the protocol-specified criteria for blood laboratory values.","meaning":"Boolean indicating whether the patient meets the protocol-specified blood laboratory value criteria."} ;; "meet blood laboratory values set by the protocol"
(declare-const patient_meets_kidney_laboratory_values_set_by_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets the protocol-specified criteria for kidney laboratory values.","when_to_set_to_false":"Set to false if the patient does not meet the protocol-specified criteria for kidney laboratory values.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets the protocol-specified criteria for kidney laboratory values.","meaning":"Boolean indicating whether the patient meets the protocol-specified kidney laboratory value criteria."} ;; "meet kidney laboratory values set by the protocol"
(declare-const patient_meets_liver_laboratory_values_set_by_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets the protocol-specified criteria for liver laboratory values.","when_to_set_to_false":"Set to false if the patient does not meet the protocol-specified criteria for liver laboratory values.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets the protocol-specified criteria for liver laboratory values.","meaning":"Boolean indicating whether the patient meets the protocol-specified liver laboratory value criteria."} ;; "meet liver laboratory values set by the protocol"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert (! patient_meets_blood_laboratory_values_set_by_protocol :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet blood laboratory values set by the protocol."
(assert (! patient_meets_liver_laboratory_values_set_by_protocol :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet liver laboratory values set by the protocol."
(assert (! patient_meets_kidney_laboratory_values_set_by_protocol :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet kidney laboratory values set by the protocol."

;; ===================== Declarations for the inclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_immunosuppressant_inthehistory@@temporalcontext_within2weeks_before_first_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the documented immunosuppressant exposure occurred within the 14 days prior to the patient's first treatment.","when_to_set_to_false":"Set to false if the documented immunosuppressant exposure did not occur within the 14 days prior to the patient's first treatment (e.g., occurred earlier or after the first treatment).","when_to_set_to_null":"Set to null if timing of exposure relative to the first treatment is unknown or cannot be determined.","meaning":"Boolean qualifier indicating whether the exposure falls within 2 weeks before the first treatment."} ;; "during the 2-week period prior to the first treatment."

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_exposed_to_immunosuppressant_inthehistory@@temporalcontext_within2weeks_before_first_treatment
         patient_is_exposed_to_immunosuppressant_inthehistory)
     :named        REQ8_AUXILIARY0)) ;; "an immunosuppressive agent" and "during the 2-week period prior to the first treatment."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_is_exposed_to_immunosuppressant_inthehistory@@temporalcontext_within2weeks_before_first_treatment)
     :named        REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have taken (an immunosuppressive agent) during the 2-week period prior to the first treatment."

;; ===================== Declarations for the inclusion criterion (REQ 9) =====================
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any corticosteroid or corticosteroid-derivative containing product in the past.","when_to_set_to_false":"Set to false if the patient has not taken any corticosteroid or corticosteroid-derivative containing product in the past.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has taken a corticosteroid or corticosteroid-derivative containing product in the past.","meaning":"Boolean indicating whether the patient has taken a corticosteroid or corticosteroid-derivative containing product in the past."} ;; "have been on a stable dose of oral corticosteroids"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@route_of_administration_oral Bool) ;; {"when_to_set_to_true":"Set to true if the route of administration for the past corticosteroid product use was oral.","when_to_set_to_false":"Set to false if the route of administration for the past corticosteroid product use was not oral.","when_to_set_to_null":"Set to null if the route of administration for the past corticosteroid product use is unknown or cannot be determined.","meaning":"Boolean indicating whether the route of administration was oral for past corticosteroid product use."} ;; "oral corticosteroids"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@dose_is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid dose remained stable (unchanged) during the period of past use.","when_to_set_to_false":"Set to false if the corticosteroid dose was not stable (changed) during the period of past use.","when_to_set_to_null":"Set to null if stability of the corticosteroid dose during the period of past use is unknown or cannot be determined.","meaning":"Boolean indicating whether the corticosteroid dose was stable during the relevant past use period."} ;; "stable dose"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@temporalcontext_for_at_least_4_weeks_before_first_week_visit Bool) ;; {"when_to_set_to_true":"Set to true if the duration of stable oral corticosteroid use was at least 4 weeks prior to the first week's visit.","when_to_set_to_false":"Set to false if the duration of stable oral corticosteroid use was less than 4 weeks prior to the first week's visit.","when_to_set_to_null":"Set to null if the duration of stable oral corticosteroid use prior to the first week's visit is unknown or cannot be determined.","meaning":"Boolean indicating whether stable oral corticosteroid use lasted at least 4 weeks before the first week's visit."} ;; "for ≥ 4 weeks before the first week's visit"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any corticosteroid or corticosteroid-derivative containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any corticosteroid or corticosteroid-derivative containing product.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is currently taking a corticosteroid or corticosteroid-derivative containing product.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid-derivative containing product."} ;; "be taking oral corticosteroids"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@route_of_administration_oral Bool) ;; {"when_to_set_to_true":"Set to true if the route of administration for the currently taken corticosteroid product is oral.","when_to_set_to_false":"Set to false if the route of administration for the currently taken corticosteroid product is not oral.","when_to_set_to_null":"Set to null if the route of administration for the currently taken corticosteroid product is unknown or cannot be determined.","meaning":"Boolean indicating whether the route of administration is oral for the current corticosteroid product use."} ;; "oral corticosteroids"
(declare-const patient_stable_dose_of_oral_corticosteroids_duration_before_first_week_visit_value_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks that the patient had continuously been on a stable (unchanged) dose of an oral corticosteroid immediately prior to the first week's visit.","when_to_set_to_null":"Set to null if the duration of stable-dose oral corticosteroid use prior to the first week's visit is unknown, not documented, or cannot be determined.","meaning":"Numeric value in weeks representing the duration of stable-dose oral corticosteroid use before the first week's visit."} ;; "≥ 4 weeks before the first week's visit"

;; ===================== Auxiliary Assertions (REQ 9) =====================
(assert
  (! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@route_of_administration_oral
         patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
     :named        REQ9_AUXILIARY0)) ;; "oral corticosteroids"

(assert
  (! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@route_of_administration_oral
         patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory)
     :named        REQ9_AUXILIARY1)) ;; "oral corticosteroids"

(assert
  (! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@dose_is_stable
         patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory)
     :named        REQ9_AUXILIARY2)) ;; "stable dose"

(assert
  (! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@temporalcontext_for_at_least_4_weeks_before_first_week_visit
         patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory)
     :named        REQ9_AUXILIARY3)) ;; "for ≥ 4 weeks before the first week's visit"

;; Definitional equality for the 'stable oral corticosteroids for ≥ 4 weeks before the first week's visit'
(assert
  (! (= patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@temporalcontext_for_at_least_4_weeks_before_first_week_visit
        (and patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory
             patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@route_of_administration_oral
             patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@dose_is_stable
             (>= patient_stable_dose_of_oral_corticosteroids_duration_before_first_week_visit_value_in_weeks 4.0)))
     :named        REQ9_AUXILIARY4)) ;; "have been on a stable dose of oral corticosteroids for ≥ 4 weeks before the first week's visit"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (or
       (not (and patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now
                 patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@route_of_administration_oral))  ;; "NOT be taking oral corticosteroids"
       patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@temporalcontext_for_at_least_4_weeks_before_first_week_visit) ;; "have been on a stable dose of oral corticosteroids for ≥ 4 weeks before the first week's visit"
     :named        REQ9_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the inclusion criterion (REQ 10) =====================
(declare-const elevated_autoantibody_level_result_count_recorded_at_screening_visit_in_count Int) ;; {"when_to_set_to_value":"Set to the integer count of autoantibody level results that are classified as elevated and were measured at the screening visit.","when_to_set_to_null":"Set to null if the count of elevated autoantibody level results measured at the screening visit is unknown, not documented, or cannot be determined.","meaning":"Numeric count representing the number of elevated autoantibody level results measured at the screening visit."} ;; "≥ 1 elevated autoantibody level at the screening visit"
(declare-const patient_has_finding_of_autoantibody_level_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding related to autoantibody level.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding related to autoantibody level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding related to autoantibody level.","meaning":"Boolean flag for the presence of the autoantibody level clinical finding now."} ;; "autoantibody level"
(declare-const patient_has_finding_of_autoantibody_level_finding_now@@is_elevated Bool) ;; {"when_to_set_to_true":"Set to true if the autoantibody level finding corresponds to an elevated autoantibody result.","when_to_set_to_false":"Set to false if the autoantibody level finding does not correspond to an elevated result.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the autoantibody level finding corresponds to an elevated result.","meaning":"Boolean flag indicating elevated status of the autoantibody level finding."} ;; "elevated"
(declare-const patient_has_finding_of_autoantibody_level_finding_now@@measured_at_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the autoantibody level finding pertains to a measurement performed at the screening visit.","when_to_set_to_false":"Set to false if the autoantibody level finding does not pertain to a measurement performed at the screening visit.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the autoantibody level finding pertains to the screening visit measurement.","meaning":"Boolean flag indicating that the autoantibody level finding is anchored to the screening visit measurement."} ;; "at the screening visit"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier implies stem: elevated autoantibody level finding implies the autoantibody level finding exists
(assert
  (! (=> patient_has_finding_of_autoantibody_level_finding_now@@is_elevated
         patient_has_finding_of_autoantibody_level_finding_now)
     :named        REQ10_AUXILIARY0)) ;; "elevated" and "autoantibody level"

;; Qualifier implies stem: screening-visit measurement implies the autoantibody level finding exists
(assert
  (! (=> patient_has_finding_of_autoantibody_level_finding_now@@measured_at_screening_visit
         patient_has_finding_of_autoantibody_level_finding_now)
     :named        REQ10_AUXILIARY1)) ;; "at the screening visit" and "autoantibody level"

;; Linking: if there is an elevated autoantibody level measured at the screening visit, then the count recorded at screening is at least 1
(assert
  (! (=> (and patient_has_finding_of_autoantibody_level_finding_now@@is_elevated
              patient_has_finding_of_autoantibody_level_finding_now@@measured_at_screening_visit)
         (>= elevated_autoantibody_level_result_count_recorded_at_screening_visit_in_count 1))
     :named        REQ10_AUXILIARY2)) ;; "≥ 1 elevated autoantibody level at the screening visit"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: At least one elevated autoantibody level at the screening visit
(assert
  (! (>= elevated_autoantibody_level_result_count_recorded_at_screening_visit_in_count 1)
     :named        REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "≥ 1 elevated autoantibody level at the screening visit"
