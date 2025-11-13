;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_systemic_onset_juvenile_chronic_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of systemic-onset juvenile idiopathic arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of systemic-onset juvenile idiopathic arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of systemic-onset juvenile idiopathic arthritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of systemic-onset juvenile idiopathic arthritis."}  ;; "systemic-onset juvenile idiopathic arthritis"
(declare-const patient_has_diagnosis_of_systemic_onset_juvenile_chronic_arthritis_now@@meets_edmontons_revision_of_durbans_consensus_conference_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of systemic-onset juvenile idiopathic arthritis meets Edmonton's revision of Durban's consensus conference criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of systemic-onset juvenile idiopathic arthritis does not meet Edmonton's revision of Durban's consensus conference criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of systemic-onset juvenile idiopathic arthritis meets Edmonton's revision of Durban's consensus conference criteria.","meaning":"Boolean indicating whether the patient's diagnosis of systemic-onset juvenile idiopathic arthritis meets Edmonton's revision of Durban's consensus conference criteria."}  ;; "meets the diagnostic criteria for systemic-onset juvenile idiopathic arthritis (Edmonton's revision of Durban's consensus conference criteria)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_systemic_onset_juvenile_chronic_arthritis_now@@meets_edmontons_revision_of_durbans_consensus_conference_criteria
         patient_has_diagnosis_of_systemic_onset_juvenile_chronic_arthritis_now)
     :named REQ0_AUXILIARY0)) ;; "meets the diagnostic criteria for systemic-onset juvenile idiopathic arthritis (Edmonton's revision of Durban's consensus conference criteria)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_systemic_onset_juvenile_chronic_arthritis_now@@meets_edmontons_revision_of_durbans_consensus_conference_criteria
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must meet the diagnostic criteria for systemic-onset juvenile idiopathic arthritis (Edmonton's revision of Durban's consensus conference criteria)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_at_treatment_initiation_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time of treatment initiation if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in years at the time of treatment initiation is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time of initiation of treatment."}  ;; "aged ≥ 2 years AND aged < 20 years at the initiation of treatment"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 2 years at the initiation of treatment.
(assert
  (! (>= patient_age_value_recorded_at_treatment_initiation_in_years 2)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 2 years at the initiation of treatment"

;; Component 1: To be included, the patient must be aged < 20 years at the initiation of treatment.
(assert
  (! (< patient_age_value_recorded_at_treatment_initiation_in_years 20)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged < 20 years at the initiation of treatment"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_systemic_onset_juvenile_chronic_arthritis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with systemic-onset juvenile idiopathic arthritis at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with systemic-onset juvenile idiopathic arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with systemic-onset juvenile idiopathic arthritis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with systemic-onset juvenile idiopathic arthritis in their history."} ;; "systemic-onset juvenile idiopathic arthritis"
(declare-const patient_has_diagnosis_of_systemic_onset_juvenile_chronic_arthritis_inthehistory@@duration_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has had a diagnosis of systemic-onset juvenile idiopathic arthritis, if known.","when_to_set_to_null":"Set to null if the duration in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in months that the patient has had a diagnosis of systemic-onset juvenile idiopathic arthritis."} ;; "duration of systemic-onset juvenile idiopathic arthritis ≥ 6 months"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have a duration of systemic-onset juvenile idiopathic arthritis ≥ 6 months.
(assert
  (! (and patient_has_diagnosis_of_systemic_onset_juvenile_chronic_arthritis_inthehistory
          (>= patient_has_diagnosis_of_systemic_onset_juvenile_chronic_arthritis_inthehistory@@duration_in_months 6.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a duration of systemic-onset juvenile idiopathic arthritis ≥ 6 months."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_failed_corticosteroid_treatment_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has failed corticosteroid treatment in the past.","when_to_set_to_false":"Set to false if the patient has not failed corticosteroid treatment in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has failed corticosteroid treatment in the past.","meaning":"Boolean indicating whether the patient has failed corticosteroid treatment in the past."} ;; "have failed corticosteroid treatment"
(declare-const patient_requires_corticosteroid_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires corticosteroid treatment.","when_to_set_to_false":"Set to false if the patient does not currently require corticosteroid treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires corticosteroid treatment.","meaning":"Boolean indicating whether the patient currently requires corticosteroid treatment."} ;; "require corticosteroid treatment"
(declare-const patient_corticosteroid_daily_dose_value_recorded_now_withunit_mg Real) ;; {"when_to_set_to_value":"Set to the patient's current daily dose of corticosteroid in milligrams if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current daily dose of corticosteroid in milligrams is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current daily dose of corticosteroid in milligrams."} ;; "daily dose (≥ 0.3 mg/kg OR ≥ 10 mg if the patient's weight > 34 kg)"
(declare-const patient_corticosteroid_daily_dose_value_recorded_now_withunit_mg_per_kg Real) ;; {"when_to_set_to_value":"Set to the patient's current daily dose of corticosteroid in milligrams per kilogram if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current daily dose of corticosteroid in milligrams per kilogram is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current daily dose of corticosteroid in milligrams per kilogram."} ;; "daily dose (≥ 0.3 mg/kg OR ≥ 10 mg if the patient's weight > 34 kg)"
(declare-const patient_weight_value_recorded_now_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the patient's current weight in kilograms if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current weight in kilograms is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current weight in kilograms."} ;; "if the patient's weight > 34 kg"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Dose threshold logic: If weight > 34 kg, threshold is 10 mg; otherwise, threshold is 0.3 mg/kg
(define-fun corticosteroid_dose_sufficient_now () Bool
  (or
    (>= patient_corticosteroid_daily_dose_value_recorded_now_withunit_mg_per_kg 0.3) ;; "≥ 0.3 mg/kg"
    (and
      (> patient_weight_value_recorded_now_withunit_kg 34.0) ;; "if the patient's weight > 34 kg"
      (>= patient_corticosteroid_daily_dose_value_recorded_now_withunit_mg 10.0)))) ;; "≥ 10 mg if the patient's weight > 34 kg"
;; {"meaning":"True if the patient's corticosteroid daily dose is sufficient for inclusion as per protocol: either ≥ 0.3 mg/kg, or ≥ 10 mg if weight > 34 kg."}

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must have failed corticosteroid treatment OR require corticosteroid treatment at a sufficient daily dose
(assert
  (! (or
        patient_has_failed_corticosteroid_treatment_in_the_history
        (and patient_requires_corticosteroid_treatment_now
             corticosteroid_dose_sufficient_now))
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have failed corticosteroid treatment OR require corticosteroid treatment at a daily dose (≥ 0.3 mg/kg OR ≥ 10 mg if the patient's weight > 34 kg))."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================

;; "To be included, the patient must have active systemic symptoms."
(declare-const patient_has_finding_of_active_systemic_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active systemic symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have active systemic symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active systemic symptoms.","meaning":"Boolean indicating whether the patient currently has active systemic symptoms now."} ;; "active systemic symptoms"

;; "To be included, the patient must have severe systemic symptoms."
(declare-const patient_has_finding_of_severe_systemic_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe systemic symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have severe systemic symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe systemic symptoms.","meaning":"Boolean indicating whether the patient currently has severe systemic symptoms now."} ;; "severe systemic symptoms"

;; "To be included, the patient must have active arthritis as assessed by an experienced pediatric rheumatologist."
(declare-const patient_has_finding_of_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of arthritis.","meaning":"Boolean indicating whether the patient currently has arthritis now."} ;; "arthritis"
(declare-const patient_has_finding_of_arthritis_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current arthritis is active.","when_to_set_to_false":"Set to false if the patient's current arthritis is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current arthritis is active.","meaning":"Boolean indicating whether the patient's current arthritis is active."} ;; "active arthritis"
(declare-const patient_has_finding_of_arthritis_now@@assessed_by_experienced_pediatric_rheumatologist Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current arthritis is assessed by an experienced pediatric rheumatologist.","when_to_set_to_false":"Set to false if the patient's current arthritis is not assessed by an experienced pediatric rheumatologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current arthritis is assessed by an experienced pediatric rheumatologist.","meaning":"Boolean indicating whether the patient's current arthritis is assessed by an experienced pediatric rheumatologist."} ;; "as assessed by an experienced pediatric rheumatologist"

;; Giannini's core-set items
(declare-const patient_physician_global_assessment_of_disease_activity_value_recorded_now_withunit_score_0_to_100 Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric physician global assessment of disease activity (score 0 to 100) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current physician global assessment of disease activity (score 0 to 100)."} ;; "physician global assessment of disease activity ≥ 20/100"
(declare-const patient_parent_assessment_of_disease_effect_on_overall_well_being_value_recorded_now_withunit_score_0_to_100 Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric parent assessment of disease effect on overall well-being (score 0 to 100) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current parent assessment of disease effect on overall well-being (score 0 to 100)."} ;; "parent assessment of disease effect on overall well-being ≥ 20/100"
(declare-const patient_self_assessment_of_disease_effect_on_overall_well_being_value_recorded_now_withunit_score_0_to_100 Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric self assessment of disease effect on overall well-being (score 0 to 100) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current self assessment of disease effect on overall well-being (score 0 to 100)."} ;; "patient assessment of disease effect on overall well-being ≥ 20/100"
(declare-const patient_functional_disability_children_health_assessment_questionnaire_score_value_recorded_now_withunit_score_0_to_3 Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric Children Health Assessment Questionnaire score (score 0 to 3) for functional disability recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Children Health Assessment Questionnaire score for functional disability (score 0 to 3)."} ;; "functional disability with a Children Health Assessment Questionnaire score ≥ 0.375/3"
(declare-const patient_number_of_joints_with_active_arthritis_now Real) ;; {"when_to_set_to_value":"Set to the measured value if the number of joints with active arthritis now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the number of joints with active arthritis in the patient currently."} ;; "number of joints with active arthritis ≥ 2"
(declare-const patient_number_of_joints_with_non_irreversible_limited_range_of_motion_now Real) ;; {"when_to_set_to_value":"Set to the measured value if the number of joints with non-irreversible limited range of motion now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the number of joints with non-irreversible limited range of motion in the patient currently."} ;; "number of joints with non-irreversible limited range of motion ≥ 2"
(declare-const patient_number_of_joints_with_non_irreversible_limited_range_of_motion_now@@non_irreversible_limited_range_of_motion_defined_by_absence_of_radiological_evidence_of_irreversible_joint_damage_and_ankylosis Bool) ;; {"when_to_set_to_true":"Set to true if the non-irreversible limited range of motion is defined by the absence of radiological evidence of irreversible joint damage and ankylosis.","when_to_set_to_false":"Set to false if the non-irreversible limited range of motion is not defined by the absence of radiological evidence of irreversible joint damage and ankylosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the non-irreversible limited range of motion is defined by the absence of radiological evidence of irreversible joint damage and ankylosis.","meaning":"Boolean indicating whether the non-irreversible limited range of motion is defined by the absence of radiological evidence of irreversible joint damage and ankylosis."} ;; "where irreversible limited range of motion is defined by radiological evidence of irreversible joint damage and ankylosis"
(declare-const patient_erythrocyte_sedimentation_rate_finding_value_recorded_now_withunit_mm_per_hr Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of erythrocyte sedimentation rate (in mm/hr) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current erythrocyte sedimentation rate in mm/hr."} ;; "erythrocyte sedimentation rate ≥ 20"

;; ===================== Auxiliary Assertions (REQ 4) =====================

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_arthritis_now@@active_status
         patient_has_finding_of_arthritis_now)
     :named REQ4_AUXILIARY0)) ;; "active arthritis"

(assert
  (! (=> patient_has_finding_of_arthritis_now@@assessed_by_experienced_pediatric_rheumatologist
         patient_has_finding_of_arthritis_now)
     :named REQ4_AUXILIARY1)) ;; "assessed by an experienced pediatric rheumatologist"

(assert
  (! (=> patient_number_of_joints_with_non_irreversible_limited_range_of_motion_now@@non_irreversible_limited_range_of_motion_defined_by_absence_of_radiological_evidence_of_irreversible_joint_damage_and_ankylosis
         (>= patient_number_of_joints_with_non_irreversible_limited_range_of_motion_now 0))
     :named REQ4_AUXILIARY2)) ;; "non-irreversible limited range of motion is defined by absence of radiological evidence of irreversible joint damage and ankylosis"

;; Giannini's core-set items: define Boolean indicators for each criterion
(define-fun giannini_physician_global_assessment_criterion_met () Bool
  (>= patient_physician_global_assessment_of_disease_activity_value_recorded_now_withunit_score_0_to_100 20.0)) ;; "physician global assessment of disease activity ≥ 20/100"

(define-fun giannini_parent_assessment_criterion_met () Bool
  (>= patient_parent_assessment_of_disease_effect_on_overall_well_being_value_recorded_now_withunit_score_0_to_100 20.0)) ;; "parent assessment of disease effect on overall well-being ≥ 20/100"

(define-fun giannini_patient_assessment_criterion_met () Bool
  (>= patient_self_assessment_of_disease_effect_on_overall_well_being_value_recorded_now_withunit_score_0_to_100 20.0)) ;; "patient assessment of disease effect on overall well-being ≥ 20/100"

(define-fun giannini_functional_disability_criterion_met () Bool
  (>= patient_functional_disability_children_health_assessment_questionnaire_score_value_recorded_now_withunit_score_0_to_3 0.375)) ;; "functional disability with a Children Health Assessment Questionnaire score ≥ 0.375/3"

(define-fun giannini_number_of_joints_with_active_arthritis_criterion_met () Bool
  (>= patient_number_of_joints_with_active_arthritis_now 2.0)) ;; "number of joints with active arthritis ≥ 2"

(define-fun giannini_number_of_joints_with_non_irreversible_limited_rom_criterion_met () Bool
  (and
    (>= patient_number_of_joints_with_non_irreversible_limited_range_of_motion_now 2.0)
    patient_number_of_joints_with_non_irreversible_limited_range_of_motion_now@@non_irreversible_limited_range_of_motion_defined_by_absence_of_radiological_evidence_of_irreversible_joint_damage_and_ankylosis)) ;; "number of joints with non-irreversible limited range of motion (where irreversible limited range of motion is defined by radiological evidence of irreversible joint damage and ankylosis) ≥ 2"

(define-fun giannini_erythrocyte_sedimentation_rate_criterion_met () Bool
  (>= patient_erythrocyte_sedimentation_rate_finding_value_recorded_now_withunit_mm_per_hr 20.0)) ;; "erythrocyte sedimentation rate ≥ 20"

;; Count the number of Giannini's core-set criteria met (at least 3 required)
(define-fun giannini_criteria_met_count () Int
  (+ (ite giannini_physician_global_assessment_criterion_met 1 0)
     (ite (or giannini_parent_assessment_criterion_met giannini_patient_assessment_criterion_met) 1 0)
     (ite giannini_functional_disability_criterion_met 1 0)
     (ite giannini_number_of_joints_with_active_arthritis_criterion_met 1 0)
     (ite giannini_number_of_joints_with_non_irreversible_limited_rom_criterion_met 1 0)
     (ite giannini_erythrocyte_sedimentation_rate_criterion_met 1 0))) ;; "at least 3 of the following criteria"

;; ===================== Constraint Assertions (REQ 4) =====================

;; Component 0: active systemic symptoms
(assert
  (! patient_has_finding_of_active_systemic_symptoms_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have active systemic symptoms."

;; Component 1: severe systemic symptoms
(assert
  (! patient_has_finding_of_severe_systemic_symptoms_now
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have severe systemic symptoms."

;; Component 2: active arthritis as assessed by an experienced pediatric rheumatologist
(assert
  (! (and patient_has_finding_of_arthritis_now@@active_status
          patient_has_finding_of_arthritis_now@@assessed_by_experienced_pediatric_rheumatologist)
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have active arthritis as assessed by an experienced pediatric rheumatologist."

;; Component 3: at least 3 of Giannini's core-set criteria
(assert
  (! (>= giannini_criteria_met_count 3)
     :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least 3 of the following criteria when assessing Giannini's core-set items: ..."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_c_reactive_protein_measurement_value_recorded_now_withunit_mg_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current C-reactive protein level in mg/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current C-reactive protein level in mg/L."} ;; "C-reactive protein level"
(declare-const patient_erythrocyte_sedimentation_rate_finding_value_recorded_now_withunit_mm_per_hr Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of erythrocyte sedimentation rate (in mm/hr) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current erythrocyte sedimentation rate in mm/hr."} ;; "erythrocyte sedimentation rate in the first hour"
(declare-const patient_erythrocyte_sedimentation_rate_finding_value_recorded_now_withunit_mm_per_hr@@measured_in_first_hour Bool) ;; {"when_to_set_to_true":"Set to true if the ESR measurement is specifically taken in the first hour.","when_to_set_to_false":"Set to false if the ESR measurement is not taken in the first hour.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ESR measurement was taken in the first hour.","meaning":"Boolean indicating whether the ESR measurement was taken in the first hour."} ;; "erythrocyte sedimentation rate in the first hour"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"
(declare-const patient_has_finding_of_fever_now@@disease_related Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current fever is disease-related.","when_to_set_to_false":"Set to false if the patient's current fever is not disease-related.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current fever is disease-related.","meaning":"Boolean indicating whether the patient's current fever is disease-related."} ;; "disease-related fever"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_erythrocyte_sedimentation_rate_finding_value_recorded_now_withunit_mm_per_hr@@measured_in_first_hour
         true)
     :named REQ5_AUXILIARY0)) ;; "erythrocyte sedimentation rate in the first hour"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_fever_now@@disease_related
         patient_has_finding_of_fever_now)
     :named REQ5_AUXILIARY1)) ;; "disease-related fever"

;; ===================== Constraint Assertions (REQ 5) =====================
;; In the absence of disease-related fever, the patient must have (CRP > ULN) OR (ESR in first hour > ULN) OR (both)
;; Note: ULN (upper limit of normal) is a threshold to be provided by the site; here we use symbolic constants.
(declare-const c_reactive_protein_upper_limit_of_normal_value Real) ;; {"when_to_set_to_value":"Set to the upper limit of normal for C-reactive protein in mg/L as defined by the laboratory reference.","when_to_set_to_null":"Set to null if the upper limit of normal is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for C-reactive protein in mg/L."} ;; "upper limit of normal values for C-reactive protein"
(declare-const erythrocyte_sedimentation_rate_upper_limit_of_normal_value Real) ;; {"when_to_set_to_value":"Set to the upper limit of normal for erythrocyte sedimentation rate in mm/hr as defined by the laboratory reference.","when_to_set_to_null":"Set to null if the upper limit of normal is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for erythrocyte sedimentation rate in mm/hr."} ;; "upper limit of normal values for erythrocyte sedimentation rate"

(assert
  (! (=> (not patient_has_finding_of_fever_now@@disease_related)
         (or
           (> patient_c_reactive_protein_measurement_value_recorded_now_withunit_mg_per_l c_reactive_protein_upper_limit_of_normal_value)
           (and patient_erythrocyte_sedimentation_rate_finding_value_recorded_now_withunit_mm_per_hr@@measured_in_first_hour
                (> patient_erythrocyte_sedimentation_rate_finding_value_recorded_now_withunit_mm_per_hr erythrocyte_sedimentation_rate_upper_limit_of_normal_value))
           (and
             (> patient_c_reactive_protein_measurement_value_recorded_now_withunit_mg_per_l c_reactive_protein_upper_limit_of_normal_value)
             (and patient_erythrocyte_sedimentation_rate_finding_value_recorded_now_withunit_mm_per_hr@@measured_in_first_hour
                  (> patient_erythrocyte_sedimentation_rate_finding_value_recorded_now_withunit_mm_per_hr erythrocyte_sedimentation_rate_upper_limit_of_normal_value)))))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, in the absence of disease-related fever, the patient must ((C-reactive protein level > upper limit of normal values) OR (erythrocyte sedimentation rate in the first hour > upper limit of normal values) OR (both C-reactive protein level > upper limit of normal values AND erythrocyte sedimentation rate in the first hour > upper limit of normal values))."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_reduced_mobility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of limitation of motion (reduced mobility) in any joint.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of limitation of motion (reduced mobility) in any joint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has limitation of motion in any joint.","meaning":"Boolean indicating whether the patient currently has limitation of motion (reduced mobility) in any joint."} ;; "limitation of motion"
(declare-const patient_number_of_joints_with_inflammation_now Real) ;; {"when_to_set_to_value":"Set to the number of joints in the patient that currently have clinical evidence of inflammation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many joints currently have inflammation.","meaning":"Numeric value indicating the number of joints in the patient that currently have clinical evidence of inflammation."} ;; "number of joints with inflammation"
(declare-const patient_number_of_joints_with_radiological_evidence_of_irreversible_joint_damage_now Real) ;; {"when_to_set_to_value":"Set to the number of joints in the patient that currently present radiological evidence of irreversible joint damage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many joints currently present radiological evidence of irreversible joint damage.","meaning":"Numeric value indicating the number of joints in the patient that currently present radiological evidence of irreversible joint damage."} ;; "number of joints with radiological evidence of irreversible joint damage"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Polyarthritis is defined as number of joints with inflammation or limitation of motion ≥ 5
(define-fun patient_number_of_joints_with_inflammation_or_limitation_of_motion_now () Real
  (+ patient_number_of_joints_with_inflammation_now
     patient_number_of_joints_with_active_arthritis_now
     patient_number_of_joints_with_non_irreversible_limited_range_of_motion_now)) ;; "number of joints with inflammation or limitation of motion"

;; Polyarthritis definition: at least 5 joints with inflammation or limitation of motion
(define-fun patient_has_polyarthritis_now () Bool
  (>= patient_number_of_joints_with_inflammation_or_limitation_of_motion_now 5.0)) ;; "polyarthritis (defined as number of joints with inflammation or limitation of motion ≥ 5)"

;; Number of affected joints (for this criterion, affected = joints with inflammation or limitation of motion)
(define-fun patient_number_of_affected_joints_now () Real
  patient_number_of_joints_with_inflammation_or_limitation_of_motion_now) ;; "affected joints = joints with inflammation or limitation of motion"

;; Number of affected joints without radiological evidence of irreversible joint damage
(define-fun patient_number_of_affected_joints_without_irreversible_damage_now () Real
  (- patient_number_of_affected_joints_now
     patient_number_of_joints_with_radiological_evidence_of_irreversible_joint_damage_now)) ;; "affected joints minus those with radiological evidence of irreversible joint damage"

;; At least 50% of affected joints must NOT present radiological evidence of irreversible joint damage
(define-fun at_least_50_percent_affected_joints_without_irreversible_damage_now () Bool
  (or
    (= patient_number_of_affected_joints_now 0.0) ;; If no affected joints, vacuously true
    (>= patient_number_of_affected_joints_without_irreversible_damage_now
        (/ patient_number_of_affected_joints_now 2.0)))) ;; "at least 50% of the affected joints must NOT present radiological evidence of irreversible joint damage"

;; ===================== Constraint Assertions (REQ 6) =====================
;; If the patient has polyarthritis, at least 50% of affected joints must NOT present radiological evidence of irreversible joint damage
(assert
  (! (or (not patient_has_polyarthritis_now)
         at_least_50_percent_affected_joints_without_irreversible_damage_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient has polyarthritis (defined as number of joints with inflammation or limitation of motion ≥ 5), at least 50% of the affected joints must NOT present radiological evidence of irreversible joint damage."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const informed_consent_signed_by_parent_or_legal_guardian_if_patient_age_less_than_18_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient is less than 18 years old at the time of consent and informed consent has been signed by the parent or the person legally responsible for the patient.","when_to_set_to_false":"Set to false if the patient is less than 18 years old at the time of consent and informed consent has not been signed by the parent or the person legally responsible for the patient.","when_to_set_to_null":"Set to null if the patient's age is less than 18 years and it is unknown, not documented, or cannot be determined whether informed consent has been signed by the parent or the person legally responsible for the patient, or if the patient's age is 18 years or older.","meaning":"Boolean indicating whether informed consent has been signed by the parent or legal guardian if the patient is under 18 years old."} ;; "informed consent signed (by the parents OR by the person legally responsible for the patient) if the patient is aged < 18 years"
(declare-const informed_consent_signed_by_patient_if_patient_old_enough Bool) ;; {"when_to_set_to_true":"Set to true if the patient is considered old enough to provide consent on their own and has signed the informed consent.","when_to_set_to_false":"Set to false if the patient is considered old enough to provide consent on their own and has not signed the informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is old enough to provide consent on their own, or if it is unknown whether the patient has signed the informed consent.","meaning":"Boolean indicating whether informed consent has been signed by the patient if the patient is old enough to provide consent."} ;; "informed consent signed by the patient if the patient is old enough"
(assert
  (! (and
        (or (>= patient_age_value_recorded_at_treatment_initiation_in_years 18.0)
            informed_consent_signed_by_parent_or_legal_guardian_if_patient_age_less_than_18_years)
        (or (< patient_age_value_recorded_at_treatment_initiation_in_years 18.0)
            informed_consent_signed_by_patient_if_patient_old_enough))
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_teenage_girl_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a teenage girl.","when_to_set_to_false":"Set to false if the patient is currently not a teenage girl.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a teenage girl.","meaning":"Boolean indicating whether the patient is currently a teenage girl."} ;; "teenage girl"
(declare-const patient_is_young_woman_with_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a young woman with childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently not a young woman with childbearing potential.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a young woman with childbearing potential.","meaning":"Boolean indicating whether the patient is currently a young woman with childbearing potential."} ;; "young woman with childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently assessed to not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient currently has childbearing potential."} ;; "childbearing potential"
(declare-const patient_is_using_contraceptive_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a contraceptive method.","when_to_set_to_false":"Set to false if the patient is currently not using a contraceptive method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a contraceptive method.","meaning":"Boolean indicating whether the patient is currently using a contraceptive method."} ;; "use a contraceptive method"
(declare-const patient_is_practicing_abstinence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing abstinence as a contraceptive method.","when_to_set_to_false":"Set to false if the patient is currently not practicing abstinence as a contraceptive method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently practicing abstinence as a contraceptive method.","meaning":"Boolean indicating whether the patient is currently practicing abstinence as a contraceptive method."} ;; "abstinence"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's sex is female at the current time."} ;; "teenage girl"
(assert
  (! (=> patient_is_practicing_abstinence_now
         patient_is_using_contraceptive_method_now)
     :named REQ8_AUXILIARY0)) ;; "abstinence" is a non-exhaustive example of contraceptive method

;; "young woman with childbearing potential" implies "has childbearing potential"
(assert
  (! (=> patient_is_young_woman_with_childbearing_potential_now
         patient_has_childbearing_potential_now)
     :named REQ8_AUXILIARY1)) ;; "young woman with childbearing potential" => "has childbearing potential"

;; ===================== Constraint Assertions (REQ 8) =====================
;; If the patient is a teenage girl OR a young woman with childbearing potential, she must use a contraceptive method
(assert
  (! (or (not (or patient_is_teenage_girl_now patient_is_young_woman_with_childbearing_potential_now))
         patient_is_using_contraceptive_method_now)
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a teenage girl OR a young woman with childbearing potential, the patient must use a contraceptive method"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a delayed hypersensitivity skin test for tuberculin (PPD) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a delayed hypersensitivity skin test for tuberculin (PPD) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a delayed hypersensitivity skin test for tuberculin (PPD).","meaning":"Boolean indicating whether the patient has ever undergone a delayed hypersensitivity skin test for tuberculin (PPD) in the past."} ;; "tuberculin test performed"
(declare-const patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory@@temporalcontext_before_day_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a delayed hypersensitivity skin test for tuberculin (PPD) and the procedure occurred before Day 1.","when_to_set_to_false":"Set to false if the patient has undergone the procedure but it did not occur before Day 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred before Day 1.","meaning":"Boolean indicating whether the procedure occurred before Day 1."} ;; "tuberculin test performed before Day 1"
(declare-const patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a delayed hypersensitivity skin test for tuberculin (PPD) in the past and the result was negative.","when_to_set_to_false":"Set to false if the patient has undergone the test in the past and the result was not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone the test in the past and the result was negative.","meaning":"Boolean indicating whether the patient has ever undergone a delayed hypersensitivity skin test for tuberculin (PPD) in the past with a negative result."} ;; "tuberculin test is negative"
(declare-const patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a delayed hypersensitivity skin test for tuberculin (PPD) in the past and the result was positive.","when_to_set_to_false":"Set to false if the patient has undergone the test in the past and the result was not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone the test in the past and the result was positive.","meaning":"Boolean indicating whether the patient has ever undergone a delayed hypersensitivity skin test for tuberculin (PPD) in the past with a positive result."} ;; "tuberculin test is positive"
(declare-const patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_positive@@positivity_related_to_previous_immunization Bool) ;; {"when_to_set_to_true":"Set to true if the positive result of the tuberculin test is related to previous immunization.","when_to_set_to_false":"Set to false if the positive result is not related to previous immunization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive result is related to previous immunization.","meaning":"Boolean indicating whether the positive result is related to previous immunization."} ;; "positivity is related to previous immunization"
(declare-const patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_positive@@positivity_is_of_normal_intensity_according_to_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the positive result of the tuberculin test is of normal intensity according to the investigator's judgment.","when_to_set_to_false":"Set to false if the positive result is not of normal intensity according to the investigator's judgment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive result is of normal intensity according to the investigator's judgment.","meaning":"Boolean indicating whether the positive result is of normal intensity according to the investigator's judgment."} ;; "positivity is of normal intensity according to the investigator's judgment"
(declare-const patient_has_undergone_immunization_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone immunization at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone immunization at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone immunization.","meaning":"Boolean indicating whether the patient has ever undergone immunization in the past."} ;; "previous immunization"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable for temporal context implies stem variable
(assert
  (! (=> patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory@@temporalcontext_before_day_1
         patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory)
     :named REQ9_AUXILIARY0)) ;; "tuberculin test performed before Day 1"

;; Qualifier variables for positive outcome imply stem variable
(assert
  (! (=> patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_positive@@positivity_related_to_previous_immunization
         patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_positive)
     :named REQ9_AUXILIARY1)) ;; "positivity is related to previous immunization"

(assert
  (! (=> patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_positive@@positivity_is_of_normal_intensity_according_to_investigator_judgment
         patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_positive)
     :named REQ9_AUXILIARY2)) ;; "positivity is of normal intensity according to the investigator's judgment"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: Tuberculin test performed before Day 1
(assert
  (! patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory@@temporalcontext_before_day_1
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "tuberculin test performed before Day 1"

;; Component 1: Tuberculin test result logic
(assert
  (! (or
        patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_negative
        (and
          patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_positive
          patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_positive@@positivity_related_to_previous_immunization
          patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_positive@@positivity_is_of_normal_intensity_according_to_investigator_judgment))
     :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "tuberculin test is negative OR (positive AND related to previous immunization AND of normal intensity according to investigator's judgment)"
