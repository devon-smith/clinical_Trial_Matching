;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_signed_informed_consent_form_prior_to_study_procedure_initiation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed the informed consent form before any study-related procedure was initiated.","when_to_set_to_false":"Set to false if the patient has not signed the informed consent form before any study-related procedure was initiated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient signed the informed consent form prior to initiation of any study-related procedure.","meaning":"Boolean indicating whether the patient has signed the informed consent form prior to initiation of any study-related procedure."} // "To be included, the patient must have signed the informed consent form prior to initiation of any study-related procedure."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_signed_informed_consent_form_prior_to_study_procedure_initiation
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed the informed consent form prior to initiation of any study-related procedure."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "adult / aged ≥ 40 years"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "female adult aged ≥ 40 years"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "male adult"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: "adult" is not explicitly defined in the requirement, so we do not assert a specific age threshold for "adult" here.
;; No auxiliary assertions needed for this requirement.

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be (a male adult) OR (a female adult aged ≥ 40 years).
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now (>= patient_age_value_recorded_now_in_years 40.0)))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (a male adult) OR (a female adult aged ≥ 40 years)."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic obstructive lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive lung disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive lung disease."} // "chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now@@is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic obstructive lung disease is stable.","when_to_set_to_false":"Set to false if the patient's chronic obstructive lung disease is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic obstructive lung disease is stable.","meaning":"Boolean indicating whether the patient's chronic obstructive lung disease is stable."} // "stable chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now@@stage_2 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic obstructive lung disease is at Stage 2.","when_to_set_to_false":"Set to false if the patient's chronic obstructive lung disease is not at Stage 2.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic obstructive lung disease is at Stage 2.","meaning":"Boolean indicating whether the patient's chronic obstructive lung disease is at Stage 2."} // "Stage 2"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now@@stage_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic obstructive lung disease is at Stage 3.","when_to_set_to_false":"Set to false if the patient's chronic obstructive lung disease is not at Stage 3.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic obstructive lung disease is at Stage 3.","meaning":"Boolean indicating whether the patient's chronic obstructive lung disease is at Stage 3."} // "Stage 3"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now@@staged_according_to_2014_global_initiative_for_chronic_obstructive_lung_disease_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic obstructive lung disease is staged according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines.","when_to_set_to_false":"Set to false if the patient's chronic obstructive lung disease is not staged according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic obstructive lung disease is staged according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines.","meaning":"Boolean indicating whether the patient's chronic obstructive lung disease is staged according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines."} // "according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines"
(declare-const patient_has_finding_of_moderate_airflow_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has moderate airflow obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have moderate airflow obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate airflow obstruction.","meaning":"Boolean indicating whether the patient currently has moderate airflow obstruction."} // "moderate airflow obstruction"
(declare-const patient_has_finding_of_moderate_airflow_obstruction_now@@with_stable_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has moderate airflow obstruction and stable chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently has moderate airflow obstruction but does not have stable chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate airflow obstruction with stable chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has moderate airflow obstruction with stable chronic obstructive pulmonary disease."} // "moderate airflow obstruction with stable chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_moderate_airflow_obstruction_now@@stage_2_according_to_2014_global_initiative_for_chronic_obstructive_lung_disease_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the patient's moderate airflow obstruction is classified as Stage 2 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines.","when_to_set_to_false":"Set to false if the patient's moderate airflow obstruction is not classified as Stage 2 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's moderate airflow obstruction is classified as Stage 2 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines.","meaning":"Boolean indicating whether the patient's moderate airflow obstruction is classified as Stage 2 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines."} // "Stage 2 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines"
(declare-const patient_has_finding_of_severe_airflow_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe airflow obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have severe airflow obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe airflow obstruction.","meaning":"Boolean indicating whether the patient currently has severe airflow obstruction."} // "severe airflow obstruction"
(declare-const patient_has_finding_of_severe_airflow_obstruction_now@@with_stable_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe airflow obstruction and stable chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently has severe airflow obstruction but does not have stable chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe airflow obstruction with stable chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has severe airflow obstruction with stable chronic obstructive pulmonary disease."} // "severe airflow obstruction with stable chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_severe_airflow_obstruction_now@@stage_3_according_to_2014_global_initiative_for_chronic_obstructive_lung_disease_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the patient's severe airflow obstruction is classified as Stage 3 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines.","when_to_set_to_false":"Set to false if the patient's severe airflow obstruction is not classified as Stage 3 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's severe airflow obstruction is classified as Stage 3 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines.","meaning":"Boolean indicating whether the patient's severe airflow obstruction is classified as Stage 3 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines."} // "Stage 3 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_chronic_obstructive_lung_disease_now@@is_stable
         patient_has_finding_of_chronic_obstructive_lung_disease_now)
     :named REQ2_AUXILIARY0)) ;; "stable chronic obstructive pulmonary disease" implies "chronic obstructive pulmonary disease"

(assert
  (! (=> patient_has_finding_of_chronic_obstructive_lung_disease_now@@stage_2
         patient_has_finding_of_chronic_obstructive_lung_disease_now)
     :named REQ2_AUXILIARY1)) ;; "Stage 2" implies "chronic obstructive pulmonary disease"

(assert
  (! (=> patient_has_finding_of_chronic_obstructive_lung_disease_now@@stage_3
         patient_has_finding_of_chronic_obstructive_lung_disease_now)
     :named REQ2_AUXILIARY2)) ;; "Stage 3" implies "chronic obstructive pulmonary disease"

(assert
  (! (=> patient_has_finding_of_chronic_obstructive_lung_disease_now@@staged_according_to_2014_global_initiative_for_chronic_obstructive_lung_disease_guidelines
         patient_has_finding_of_chronic_obstructive_lung_disease_now)
     :named REQ2_AUXILIARY3)) ;; "staged according to 2014 GOLD guidelines" implies "chronic obstructive pulmonary disease"

(assert
  (! (=> patient_has_finding_of_moderate_airflow_obstruction_now@@with_stable_chronic_obstructive_pulmonary_disease
         (and patient_has_finding_of_moderate_airflow_obstruction_now
              patient_has_finding_of_chronic_obstructive_lung_disease_now@@is_stable))
     :named REQ2_AUXILIARY4)) ;; "moderate airflow obstruction with stable COPD" implies both

(assert
  (! (=> patient_has_finding_of_moderate_airflow_obstruction_now@@stage_2_according_to_2014_global_initiative_for_chronic_obstructive_lung_disease_guidelines
         (and patient_has_finding_of_moderate_airflow_obstruction_now
              patient_has_finding_of_chronic_obstructive_lung_disease_now@@stage_2
              patient_has_finding_of_chronic_obstructive_lung_disease_now@@staged_according_to_2014_global_initiative_for_chronic_obstructive_lung_disease_guidelines))
     :named REQ2_AUXILIARY5)) ;; "moderate airflow obstruction, Stage 2, GOLD 2014" implies all

(assert
  (! (=> patient_has_finding_of_severe_airflow_obstruction_now@@with_stable_chronic_obstructive_pulmonary_disease
         (and patient_has_finding_of_severe_airflow_obstruction_now
              patient_has_finding_of_chronic_obstructive_lung_disease_now@@is_stable))
     :named REQ2_AUXILIARY6)) ;; "severe airflow obstruction with stable COPD" implies both

(assert
  (! (=> patient_has_finding_of_severe_airflow_obstruction_now@@stage_3_according_to_2014_global_initiative_for_chronic_obstructive_lung_disease_guidelines
         (and patient_has_finding_of_severe_airflow_obstruction_now
              patient_has_finding_of_chronic_obstructive_lung_disease_now@@stage_3
              patient_has_finding_of_chronic_obstructive_lung_disease_now@@staged_according_to_2014_global_initiative_for_chronic_obstructive_lung_disease_guidelines))
     :named REQ2_AUXILIARY7)) ;; "severe airflow obstruction, Stage 3, GOLD 2014" implies all

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have either:
;; (moderate airflow obstruction with stable COPD, Stage 2, GOLD 2014)
;; OR
;; (severe airflow obstruction with stable COPD, Stage 3, GOLD 2014)
(assert
  (! (or
        (and patient_has_finding_of_moderate_airflow_obstruction_now
             patient_has_finding_of_chronic_obstructive_lung_disease_now@@is_stable
             patient_has_finding_of_chronic_obstructive_lung_disease_now@@stage_2
             patient_has_finding_of_chronic_obstructive_lung_disease_now@@staged_according_to_2014_global_initiative_for_chronic_obstructive_lung_disease_guidelines)
        (and patient_has_finding_of_severe_airflow_obstruction_now
             patient_has_finding_of_chronic_obstructive_lung_disease_now@@is_stable
             patient_has_finding_of_chronic_obstructive_lung_disease_now@@stage_3
             patient_has_finding_of_chronic_obstructive_lung_disease_now@@staged_according_to_2014_global_initiative_for_chronic_obstructive_lung_disease_guidelines))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((moderate airflow obstruction with stable chronic obstructive pulmonary disease (Stage 2 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines)) OR (severe airflow obstruction with stable chronic obstructive pulmonary disease (Stage 3 according to the 2014 Global Initiative for Chronic Obstructive Lung Disease guidelines)))."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters Real) ;; {"when_to_set_to_value":"Set to the measured value in liters if the patient's post-bronchodilator FEV1 is recorded now (i.e., at run-in Visit 101, 15 minutes after inhalation of 400 micrograms of salbutamol).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's post-bronchodilator FEV1 in liters, measured now."} // "post-bronchodilator forced expiratory volume in one second"
(declare-const patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters@@measured_15_minutes_after_inhalation_of_400_micrograms_salbutamol Bool) ;; {"when_to_set_to_true":"Set to true if the FEV1 measurement was taken 15 minutes after inhalation of 400 micrograms of salbutamol.","when_to_set_to_false":"Set to false if the FEV1 measurement was not taken under these conditions.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken 15 minutes after inhalation of 400 micrograms of salbutamol.","meaning":"Boolean indicating whether the FEV1 measurement was taken 15 minutes after inhalation of 400 micrograms of salbutamol."} // "post-bronchodilator refers to 15 minutes after inhalation of 400 micrograms of salbutamol"
(declare-const patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters@@measured_at_run_in_visit_101 Bool) ;; {"when_to_set_to_true":"Set to true if the FEV1 measurement was taken at run-in Visit 101.","when_to_set_to_false":"Set to false if the FEV1 measurement was not taken at run-in Visit 101.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken at run-in Visit 101.","meaning":"Boolean indicating whether the FEV1 measurement was taken at run-in Visit 101."} // "at run-in Visit 101"
(declare-const patient_fev1_predicted_normal_value_now_withunit_liters Real) ;; {"when_to_set_to_value":"Set to the predicted normal value in liters if the patient's FEV1 predicted normal value is available now.","when_to_set_to_null":"Set to null if no such predicted normal value is available or the value is indeterminate.","meaning":"Numeric value representing the patient's predicted normal FEV1 in liters, measured now."} // "predicted normal value"
(declare-const patient_forced_vital_capacity_value_recorded_now_withunit_liters Real) ;; {"when_to_set_to_value":"Set to the measured value in liters if the patient's FVC is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's FVC in liters, measured now."} // "forced vital capacity"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; The FEV1 measurement with both qualifiers implies the measurement is valid for this criterion
(assert
  (! (and patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters@@measured_15_minutes_after_inhalation_of_400_micrograms_salbutamol
          patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters@@measured_at_run_in_visit_101)
     :named REQ3_AUXILIARY0)) ;; "post-bronchodilator refers to 15 minutes after inhalation of 400 micrograms of salbutamol" and "at run-in Visit 101"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: FEV1 ≥ 40% of predicted normal value
(assert
  (! (=> (and patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters@@measured_15_minutes_after_inhalation_of_400_micrograms_salbutamol
              patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters@@measured_at_run_in_visit_101)
         (>= patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters
             (* 0.40 patient_fev1_predicted_normal_value_now_withunit_liters)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "post-bronchodilator forced expiratory volume in one second ≥ 40% of the predicted normal value"

;; Component 1: FEV1 < 80% of predicted normal value
(assert
  (! (=> (and patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters@@measured_15_minutes_after_inhalation_of_400_micrograms_salbutamol
              patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters@@measured_at_run_in_visit_101)
         (< patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters
            (* 0.80 patient_fev1_predicted_normal_value_now_withunit_liters)))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "post-bronchodilator forced expiratory volume in one second < 80% of the predicted normal value"

;; Component 2: FEV1/FVC < 0.70
(assert
  (! (=> (and patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters@@measured_15_minutes_after_inhalation_of_400_micrograms_salbutamol
              patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters@@measured_at_run_in_visit_101)
         (< (/ patient_fev1_after_bronchodilation_value_recorded_now_withunit_liters
               patient_forced_vital_capacity_value_recorded_now_withunit_liters)
            0.70))
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "post-bronchodilator forced expiratory volume in one second/forced vital capacity < 0.70 at run-in Visit 101 (post-bronchodilator refers to 15 minutes after inhalation of 400 micrograms of salbutamol)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "current smoker"
(declare-const patient_has_finding_of_ex_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an ex-smoker (i.e., has not smoked for a period defined by study criteria, typically ≥ 6 months at screening).","when_to_set_to_false":"Set to false if the patient is not currently classified as an ex-smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an ex-smoker.","meaning":"Boolean indicating whether the patient is currently classified as an ex-smoker."} // "ex-smoker"
(declare-const patient_tobacco_smoking_behavior_finding_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total number of pack years if the patient's smoking history is available at any time in the patient's history.","when_to_set_to_null":"Set to null if the patient's smoking history in pack years is not available or cannot be determined.","meaning":"Numeric value representing the patient's total smoking history in pack years, recorded at any time in the patient's history."} // "smoking history of ≥ 10 pack years"

;; Additional variable for ex-smoker definition (not in <new_variable_declarations>)
(declare-const patient_has_not_smoked_for_at_least_6_months_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has not smoked for at least 6 months at the time of screening.","when_to_set_to_false":"Set to false if the patient has smoked within the last 6 months at screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has not smoked for at least 6 months at screening.","meaning":"Boolean indicating whether the patient has not smoked for at least 6 months at screening."} // "an ex-smoker (defined as a patient who has not smoked for ≥ 6 months at screening)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition of ex-smoker as per requirement: ex-smoker ≡ has not smoked for ≥ 6 months at screening
(assert
  (! (= patient_has_finding_of_ex_smoker_now
        patient_has_not_smoked_for_at_least_6_months_at_screening)
     :named REQ4_AUXILIARY0)) ;; "An ex-smoker is defined as a patient who has not smoked for ≥ 6 months at screening."

;; ===================== Constraint Assertions (REQ 4) =====================
;; Inclusion: (current smoker AND ≥10 pack years) OR (ex-smoker AND ≥10 pack years)
(assert
  (! (or (and patient_has_finding_of_smoker_now
              (>= patient_tobacco_smoking_behavior_finding_value_recorded_inthehistory_withunit_pack_years 10.0))
         (and patient_has_finding_of_ex_smoker_now
              (>= patient_tobacco_smoking_behavior_finding_value_recorded_inthehistory_withunit_pack_years 10.0)))
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be ((a current smoker with a smoking history of ≥ 10 pack years) OR (an ex-smoker (defined as a patient who has not smoked for ≥ 6 months at screening) with a smoking history of ≥ 10 pack years))."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const duration_of_triple_treatment_with_lama_laba_ics_immediately_prior_to_screening_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has been on triple treatment with LAMA, LABA, and ICS immediately prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient has been on triple treatment with LAMA, LABA, and ICS immediately prior to screening.","meaning":"Numeric value in months indicating the duration of triple treatment with LAMA, LABA, and ICS immediately prior to screening."} // "for ≥ 6 months immediately prior to screening"
(declare-const patient_is_exposed_to_muscarinic_receptor_antagonist_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to a muscarinic receptor antagonist at any time during the 6 months prior to now.","when_to_set_to_false":"Set to false if the patient was not exposed to a muscarinic receptor antagonist at any time during the 6 months prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to a muscarinic receptor antagonist during the 6 months prior to now.","meaning":"Boolean indicating whether the patient was exposed to a muscarinic receptor antagonist during the 6 months prior to now."} // "long-acting muscarinic antagonist"
(declare-const patient_is_exposed_to_muscarinic_receptor_antagonist_inthepast6months@@temporalcontext_within6months_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the 6-month exposure window is anchored immediately prior to the screening event.","when_to_set_to_false":"Set to false if the exposure window is not anchored immediately prior to screening.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the exposure window is anchored to screening.","meaning":"Boolean indicating whether the 6-month exposure window is immediately prior to screening."} // "immediately prior to screening"
(declare-const patient_is_exposed_to_selective_beta_2_agonist_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to a selective beta-2 agonist at any time during the 6 months prior to now.","when_to_set_to_false":"Set to false if the patient was not exposed to a selective beta-2 agonist at any time during the 6 months prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to a selective beta-2 agonist during the 6 months prior to now.","meaning":"Boolean indicating whether the patient was exposed to a selective beta-2 agonist during the 6 months prior to now."} // "long-acting beta2-agonist"
(declare-const patient_is_exposed_to_selective_beta_2_agonist_inthepast6months@@temporalcontext_within6months_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the 6-month exposure window is anchored immediately prior to the screening event.","when_to_set_to_false":"Set to false if the exposure window is not anchored immediately prior to screening.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the exposure window is anchored to screening.","meaning":"Boolean indicating whether the 6-month exposure window is immediately prior to screening."} // "immediately prior to screening"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient was taking a corticosteroid and corticosteroid derivative containing product at any time during the 6 months prior to now.","when_to_set_to_false":"Set to false if the patient was not taking a corticosteroid and corticosteroid derivative containing product at any time during the 6 months prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was taking a corticosteroid and corticosteroid derivative containing product during the 6 months prior to now.","meaning":"Boolean indicating whether the patient was taking a corticosteroid and corticosteroid derivative containing product during the 6 months prior to now."} // "inhaled corticosteroid"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6months@@temporalcontext_within6months_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the 6-month taking window is anchored immediately prior to the screening event.","when_to_set_to_false":"Set to false if the taking window is not anchored immediately prior to screening.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the taking window is anchored to screening.","meaning":"Boolean indicating whether the 6-month taking window is immediately prior to screening."} // "immediately prior to screening"
(declare-const patient_is_on_triple_treatment_with_lama_laba_ics_for_at_least_6_months_immediately_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been on triple treatment with LAMA, LABA, and ICS for at least 6 months immediately prior to screening.","when_to_set_to_false":"Set to false if the patient has not been on triple treatment with LAMA, LABA, and ICS for at least 6 months immediately prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on triple treatment with LAMA, LABA, and ICS for at least 6 months immediately prior to screening.","meaning":"Boolean indicating whether the patient has been on triple treatment with LAMA, LABA, and ICS for at least 6 months immediately prior to screening."} // "To be included, the patient must have been on triple treatment with (long-acting muscarinic antagonist) AND (long-acting beta2-agonist) AND (inhaled corticosteroid) for ≥ 6 months immediately prior to screening."

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: patient_is_on_triple_treatment_with_lama_laba_ics_for_at_least_6_months_immediately_prior_to_screening is true iff all three exposures occurred in the 6 months immediately prior to screening and duration is at least 6 months
(assert
  (! (= patient_is_on_triple_treatment_with_lama_laba_ics_for_at_least_6_months_immediately_prior_to_screening
        (and 
          (>= duration_of_triple_treatment_with_lama_laba_ics_immediately_prior_to_screening_in_months 6.0)
          patient_is_exposed_to_muscarinic_receptor_antagonist_inthepast6months
          patient_is_exposed_to_muscarinic_receptor_antagonist_inthepast6months@@temporalcontext_within6months_before_screening
          patient_is_exposed_to_selective_beta_2_agonist_inthepast6months
          patient_is_exposed_to_selective_beta_2_agonist_inthepast6months@@temporalcontext_within6months_before_screening
          patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6months
          patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6months@@temporalcontext_within6months_before_screening
        ))
     :named REQ5_AUXILIARY0)) ;; "To be included, the patient must have been on triple treatment with (long-acting muscarinic antagonist) AND (long-acting beta2-agonist) AND (inhaled corticosteroid) for ≥ 6 months immediately prior to screening."

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_exposed_to_muscarinic_receptor_antagonist_inthepast6months@@temporalcontext_within6months_before_screening
        patient_is_exposed_to_muscarinic_receptor_antagonist_inthepast6months)
     :named REQ5_AUXILIARY1)) ;; "immediately prior to screening" for muscarinic antagonist

(assert
  (! (=> patient_is_exposed_to_selective_beta_2_agonist_inthepast6months@@temporalcontext_within6months_before_screening
        patient_is_exposed_to_selective_beta_2_agonist_inthepast6months)
     :named REQ5_AUXILIARY2)) ;; "immediately prior to screening" for beta2-agonist

(assert
  (! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6months@@temporalcontext_within6months_before_screening
        patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6months)
     :named REQ5_AUXILIARY3)) ;; "immediately prior to screening" for corticosteroid

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_on_triple_treatment_with_lama_laba_ics_for_at_least_6_months_immediately_prior_to_screening
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been on triple treatment with (long-acting muscarinic antagonist) AND (long-acting beta2-agonist) AND (inhaled corticosteroid) for ≥ 6 months immediately prior to screening."
