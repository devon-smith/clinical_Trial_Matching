;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_systemic_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of systemic scleroderma (systemic sclerosis).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of systemic scleroderma (systemic sclerosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systemic scleroderma (systemic sclerosis).","meaning":"Boolean indicating whether the patient currently has systemic scleroderma (systemic sclerosis)."}  ;; "To be included, the patient must have systemic scleroderma (systemic sclerosis) (as defined by the American College of Rheumatology)."
(declare-const patient_has_finding_of_systemic_sclerosis_now@@at_risk_of_progression Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systemic scleroderma (systemic sclerosis) and is at risk of progression.","when_to_set_to_false":"Set to false if the patient currently has systemic scleroderma (systemic sclerosis) but is not at risk of progression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is at risk of progression of systemic scleroderma (systemic sclerosis).","meaning":"Boolean indicating whether the patient with systemic scleroderma (systemic sclerosis) is at risk of progression."}  ;; "To be included, the patient must be at risk of progression of systemic scleroderma."
(declare-const patient_has_finding_of_diffuse_cutaneous_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diffuse cutaneous disease.","when_to_set_to_false":"Set to false if the patient currently does not have diffuse cutaneous disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diffuse cutaneous disease.","meaning":"Boolean indicating whether the patient currently has diffuse cutaneous disease."}  ;; "To be included, the patient must have diffuse cutaneous disease."
(declare-const patient_is_in_group_5_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as being in Group 5.","when_to_set_to_false":"Set to false if the patient is currently not classified as being in Group 5.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as being in Group 5.","meaning":"Boolean indicating whether the patient is currently classified as being in Group 5."}  ;; "To be included, the patient must not be in Group 5."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_systemic_sclerosis_now@@at_risk_of_progression
         patient_has_finding_of_systemic_sclerosis_now)
     :named REQ0_AUXILIARY0)) ;; "patient_has_finding_of_systemic_sclerosis_now@@at_risk_of_progression implies patient_has_finding_of_systemic_sclerosis_now"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have systemic scleroderma (systemic sclerosis) (as defined by the American College of Rheumatology)
(assert
  (! patient_has_finding_of_systemic_sclerosis_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have systemic scleroderma (systemic sclerosis) (as defined by the American College of Rheumatology)."

;; Component 1: Must have diffuse cutaneous disease
(assert
  (! patient_has_finding_of_diffuse_cutaneous_disease_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have diffuse cutaneous disease."

;; Component 2: Must NOT be in Group 5
(assert
  (! (not patient_is_in_group_5_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not be in Group 5."

;; Component 3: Must be at risk of progression of systemic scleroderma
(assert
  (! patient_has_finding_of_systemic_sclerosis_now@@at_risk_of_progression
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be at risk of progression of systemic scleroderma."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const duration_of_prior_cyclophosphamide_treatment_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient was treated with cyclophosphamide in the prior course.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient was treated with cyclophosphamide in the prior course.","meaning":"Numeric value indicating the duration in months of the patient's prior course of treatment with cyclophosphamide."} ;; "treatment with cyclophosphamide for ≥ 4 months"
(declare-const duration_of_prior_mycophenolate_mofetil_treatment_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient was treated with mycophenolate mofetil in the prior course.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient was treated with mycophenolate mofetil in the prior course.","meaning":"Numeric value indicating the duration in months of the patient's prior course of treatment with mycophenolate mofetil."} ;; "treatment with mycophenolate mofetil for ≥ 4 months"
(declare-const eligibility_determination_to_mobilization_interval_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between eligibility determination and the start of mobilization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days elapsed between eligibility determination and the start of mobilization.","meaning":"Numeric value indicating the number of days between eligibility determination and the start of mobilization."} ;; "determined at least 1 week before start of mobilization"
(declare-const patient_has_absence_of_improvement_of_systemic_scleroderma Bool) ;; {"when_to_set_to_true":"Set to true if the patient has absence of improvement of systemic scleroderma.","when_to_set_to_false":"Set to false if the patient does not have absence of improvement of systemic scleroderma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has absence of improvement of systemic scleroderma.","meaning":"Boolean indicating whether the patient has absence of improvement of systemic scleroderma."} ;; "absence of improvement of systemic scleroderma"
(declare-const patient_has_evidence_of_progression_of_systemic_scleroderma Bool) ;; {"when_to_set_to_true":"Set to true if the patient has evidence of progression of systemic scleroderma.","when_to_set_to_false":"Set to false if the patient does not have evidence of progression of systemic scleroderma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has evidence of progression of systemic scleroderma.","meaning":"Boolean indicating whether the patient has evidence of progression of systemic scleroderma."} ;; "evidence of progression of systemic scleroderma"
(declare-const patient_has_failed_prior_course_of_cyclophosphamide Bool) ;; {"when_to_set_to_true":"Set to true if the patient has failed a prior course of treatment with cyclophosphamide.","when_to_set_to_false":"Set to false if the patient has not failed a prior course of treatment with cyclophosphamide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has failed a prior course of treatment with cyclophosphamide.","meaning":"Boolean indicating whether the patient has failed a prior course of treatment with cyclophosphamide."} ;; "failed a prior course of treatment with cyclophosphamide"
(declare-const patient_has_failed_prior_course_of_mycophenolate_mofetil Bool) ;; {"when_to_set_to_true":"Set to true if the patient has failed a prior course of treatment with mycophenolate mofetil.","when_to_set_to_false":"Set to false if the patient has not failed a prior course of treatment with mycophenolate mofetil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has failed a prior course of treatment with mycophenolate mofetil.","meaning":"Boolean indicating whether the patient has failed a prior course of treatment with mycophenolate mofetil."} ;; "failed a prior course of treatment with mycophenolate mofetil"
(declare-const patient_has_taken_cyclophosphamide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken cyclophosphamide in the past.","when_to_set_to_false":"Set to false if the patient has never taken cyclophosphamide in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken cyclophosphamide in the past.","meaning":"Boolean indicating whether the patient has ever taken cyclophosphamide in the past."} ;; "prior course of treatment with cyclophosphamide"
(declare-const patient_has_taken_cyclophosphamide_inthehistory@@temporalcontext_prior_to_eligibility_determination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior use of cyclophosphamide occurred before eligibility determination.","when_to_set_to_false":"Set to false if the patient's prior use of cyclophosphamide did not occur before eligibility determination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prior use of cyclophosphamide occurred before eligibility determination.","meaning":"Boolean indicating whether the patient's prior use of cyclophosphamide occurred before eligibility determination."} ;; "prior course of treatment with cyclophosphamide before being eligible for the study"
(declare-const patient_has_taken_mycophenolate_mofetil_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken mycophenolate mofetil in the past.","when_to_set_to_false":"Set to false if the patient has never taken mycophenolate mofetil in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken mycophenolate mofetil in the past.","meaning":"Boolean indicating whether the patient has ever taken mycophenolate mofetil in the past."} ;; "prior course of treatment with mycophenolate mofetil"
(declare-const patient_has_taken_mycophenolate_mofetil_inthehistory@@temporalcontext_prior_to_eligibility_determination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior use of mycophenolate mofetil occurred before eligibility determination.","when_to_set_to_false":"Set to false if the patient's prior use of mycophenolate mofetil did not occur before eligibility determination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prior use of mycophenolate mofetil occurred before eligibility determination.","meaning":"Boolean indicating whether the patient's prior use of mycophenolate mofetil occurred before eligibility determination."} ;; "prior course of treatment with mycophenolate mofetil before being eligible for the study"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_taken_cyclophosphamide_inthehistory@@temporalcontext_prior_to_eligibility_determination
         patient_has_taken_cyclophosphamide_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "prior use of cyclophosphamide occurred before eligibility determination"

(assert
  (! (=> patient_has_taken_mycophenolate_mofetil_inthehistory@@temporalcontext_prior_to_eligibility_determination
         patient_has_taken_mycophenolate_mofetil_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "prior use of mycophenolate mofetil occurred before eligibility determination"

;; Failure definition: evidence of progression OR absence of improvement
(assert
  (! (= patient_has_failed_prior_course_of_cyclophosphamide
        (and (or patient_has_evidence_of_progression_of_systemic_scleroderma
                 patient_has_absence_of_improvement_of_systemic_scleroderma)
             patient_has_taken_cyclophosphamide_inthehistory@@temporalcontext_prior_to_eligibility_determination
             (>= duration_of_prior_cyclophosphamide_treatment_in_months 4.0)))
     :named REQ1_AUXILIARY2)) ;; "failed a prior course of cyclophosphamide for ≥ 4 months before eligibility, failure = progression OR absence of improvement"

(assert
  (! (= patient_has_failed_prior_course_of_mycophenolate_mofetil
        (and (or patient_has_evidence_of_progression_of_systemic_scleroderma
                 patient_has_absence_of_improvement_of_systemic_scleroderma)
             patient_has_taken_mycophenolate_mofetil_inthehistory@@temporalcontext_prior_to_eligibility_determination
             (>= duration_of_prior_mycophenolate_mofetil_treatment_in_months 4.0)))
     :named REQ1_AUXILIARY3)) ;; "failed a prior course of mycophenolate mofetil for ≥ 4 months before eligibility, failure = progression OR absence of improvement"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have failed a prior course of (mycophenolate mofetil ≥ 4 months OR cyclophosphamide ≥ 4 months) before eligibility, determined at least 1 week before mobilization
(assert
  (! (and (or patient_has_failed_prior_course_of_mycophenolate_mofetil
              patient_has_failed_prior_course_of_cyclophosphamide)
          (>= eligibility_determination_to_mobilization_interval_in_days 7.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "failed a prior course of (treatment with mycophenolate mofetil for ≥ 4 months OR treatment with cyclophosphamide for ≥ 4 months) before being eligible for the study (determined at least 1 week before start of mobilization)"

;; Component 1: Failure is defined as (evidence of progression OR absence of improvement)
(assert
  (! (or patient_has_evidence_of_progression_of_systemic_scleroderma
         patient_has_absence_of_improvement_of_systemic_scleroderma)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "failure is defined as (evidence of progression of systemic scleroderma OR absence of improvement of systemic scleroderma)"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_disease_duration_value_recorded_now_withunit_years_since_first_skin_thickening Real) ;; {"when_to_set_to_value":"Set to the measured value if the duration in years since the patient's first sign of skin thickening is available.","when_to_set_to_null":"Set to null if the duration is not available or indeterminate.","meaning":"Numeric value representing the patient's disease duration in years since the development of the first sign of skin thickening."} ;; "To be included, the patient must have disease duration ≤ 2 years since development of first sign of skin thickening."
(declare-const patient_modified_rodnan_skin_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if a current modified Rodnan skin score is available.","when_to_set_to_null":"Set to null if no current modified Rodnan skin score is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current modified Rodnan skin score."} ;; "To be included, the patient must have modified Rodnan skin score ≥ 25."
(declare-const patient_erythrocyte_sedimentation_rate_finding_value_recorded_now_withunit_mm_per_1st_hour Real) ;; {"when_to_set_to_value":"Set to the measured value if a current ESR (mm/1st hour) is available.","when_to_set_to_null":"Set to null if no current ESR measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current erythrocyte sedimentation rate (ESR) in mm/1st hour."} ;; "erythrocyte sedimentation rate > 25 mm/1st hour"
(declare-const patient_hemoglobin_value_recorded_now_withunit_g_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a current hemoglobin concentration (g/dL) is available.","when_to_set_to_null":"Set to null if no current hemoglobin measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin concentration in g/dL."} ;; "hemoglobin < 11 g/dL"
(declare-const patient_hemoglobin_reduction_is_explained_by_causes_other_than_active_scleroderma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hemoglobin reduction is explained by causes other than active scleroderma.","when_to_set_to_false":"Set to false if the patient's current hemoglobin reduction is not explained by causes other than active scleroderma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hemoglobin reduction is explained by causes other than active scleroderma.","meaning":"Boolean indicating whether the patient's current hemoglobin reduction is explained by causes other than active scleroderma."} ;; "hemoglobin reduction is not explained by causes other than active scleroderma"
(declare-const patient_forced_vital_capacity_value_recorded_now_withunit_percent_predicted Real) ;; {"when_to_set_to_value":"Set to the measured value if a current FVC (% predicted) is available.","when_to_set_to_null":"Set to null if no current FVC measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current forced vital capacity as a percent of predicted."} ;; "forced vital capacity < 80%"
(declare-const patient_carbon_monoxide_diffusing_capacity_measurement_value_recorded_now_withunit_percent_predicted Real) ;; {"when_to_set_to_value":"Set to the measured value if a current DLCO (% predicted) is available.","when_to_set_to_null":"Set to null if no current DLCO measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diffusing capacity of the lung for carbon monoxide as a percent of predicted."} ;; "diffusing capacity of the lung for carbon monoxide < 80%"
(declare-const patient_has_finding_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has interstitial lung disease."} ;; "evidence of interstitial lung disease by computed tomography scan"
(declare-const patient_has_finding_of_simple_pulmonary_alveolitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alveolitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alveolitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alveolitis.","meaning":"Boolean indicating whether the patient currently has alveolitis."} ;; "evidence of alveolitis by bronchoalveolar lavage"
(declare-const patient_has_finding_of_lung_involvement_associated_with_another_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of lung involvement associated with another disorder.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of lung involvement associated with another disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lung involvement associated with another disorder.","meaning":"Boolean indicating whether the patient currently has lung involvement associated with another disorder."} ;; "lung involvement defined as (forced vital capacity < 80% OR diffusing capacity of the lung for carbon monoxide < 80%) AND (evidence of interstitial lung disease by computed tomography scan OR evidence of alveolitis by bronchoalveolar lavage)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition of lung involvement as per requirement
(assert
  (! (= patient_has_finding_of_lung_involvement_associated_with_another_disorder_now
        (and
          (or (< patient_forced_vital_capacity_value_recorded_now_withunit_percent_predicted 80.0)
              (< patient_carbon_monoxide_diffusing_capacity_measurement_value_recorded_now_withunit_percent_predicted 80.0))
          (or patient_has_finding_of_interstitial_lung_disease_now
              patient_has_finding_of_simple_pulmonary_alveolitis_now)))
     :named REQ2_AUXILIARY0)) ;; "lung involvement defined as (forced vital capacity < 80% OR diffusing capacity of the lung for carbon monoxide < 80%) AND (evidence of interstitial lung disease by computed tomography scan OR evidence of alveolitis by bronchoalveolar lavage)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: diffuse scleroderma
(assert
  (! patient_has_finding_of_diffuse_cutaneous_disease_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have diffuse scleroderma."

;; Component 1: disease duration ≤ 2 years since first skin thickening
(assert
  (! (<= patient_disease_duration_value_recorded_now_withunit_years_since_first_skin_thickening 2.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have disease duration ≤ 2 years since development of first sign of skin thickening."

;; Component 2: modified Rodnan skin score ≥ 25
(assert
  (! (>= patient_modified_rodnan_skin_score_value_recorded_now_withunit_score 25.0)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have modified Rodnan skin score ≥ 25."

;; Component 3: ESR > 25 OR (hemoglobin < 11 AND not explained by other causes) OR lung involvement
(assert
  (! (or
        (> patient_erythrocyte_sedimentation_rate_finding_value_recorded_now_withunit_mm_per_1st_hour 25.0)
        (and
          (< patient_hemoglobin_value_recorded_now_withunit_g_per_dl 11.0)
          (not patient_hemoglobin_reduction_is_explained_by_causes_other_than_active_scleroderma_now))
        patient_has_finding_of_lung_involvement_associated_with_another_disorder_now)
     :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (erythrocyte sedimentation rate > 25 mm/1st hour OR (hemoglobin < 11 g/dL AND hemoglobin reduction is not explained by causes other than active scleroderma) OR (lung involvement defined as (forced vital capacity < 80% OR diffusing capacity of the lung for carbon monoxide < 80%) AND (evidence of interstitial lung disease by computed tomography scan OR evidence of alveolitis by bronchoalveolar lavage)))."
