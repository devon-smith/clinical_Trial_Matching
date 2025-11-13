;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cardiovascular_event_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had at least one cardiovascular event (e.g., myocardial infarction, stroke, or other qualifying event) within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not had any cardiovascular event within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any cardiovascular event within the past twelve months.","meaning":"Boolean indicating whether the patient has had at least one cardiovascular event within the past twelve months."} ;; "has had at least one cardiovascular event within the past twelve months"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a stroke (cerebrovascular accident) within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not had a stroke (cerebrovascular accident) within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a stroke (cerebrovascular accident) within the past twelve months.","meaning":"Boolean indicating whether the patient has had a stroke (cerebrovascular accident) within the past twelve months."} ;; "stroke within the past twelve months"

(declare-const patient_has_finding_of_myocardial_infarction_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past twelve months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past twelve months."} ;; "myocardial infarction within the past twelve months"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_myocardial_infarction_inthepast12months
           patient_has_finding_of_cerebrovascular_accident_inthepast12months)
       patient_has_finding_of_cardiovascular_event_inthepast12months)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((myocardial infarction within the past twelve months) OR (stroke within the past twelve months))."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_cardiovascular_event_inthepast12months)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had at least one cardiovascular event with non-exhaustive examples ((myocardial infarction within the past twelve months) OR (stroke within the past twelve months))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_tricyclic_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or otherwise exposed to any tricyclic antidepressant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to any tricyclic antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to any tricyclic antidepressant medication.","meaning":"Boolean indicating whether the patient is currently exposed to any tricyclic antidepressant."} ;; "tricyclic antidepressant medications"
(declare-const patient_is_taking_monoamine_oxidase_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any monoamine oxidase inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any monoamine oxidase inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any monoamine oxidase inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking any monoamine oxidase inhibitor containing product."} ;; "monoamine oxidase inhibitor medications"
(declare-const patient_is_taking_paroxetine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any paroxetine containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any paroxetine containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any paroxetine containing product.","meaning":"Boolean indicating whether the patient is currently taking any paroxetine containing product."} ;; "paroxetine"
(declare-const patient_is_taking_mood_stabilizer_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any mood stabilizer medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any mood stabilizer medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any mood stabilizer medication.","meaning":"Boolean indicating whether the patient is currently taking any mood stabilizer medication."} ;; "mood stabilizer medications"
(declare-const patient_is_exposed_to_anti_psychotic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or otherwise exposed to any antipsychotic agent.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to any antipsychotic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to any antipsychotic agent.","meaning":"Boolean indicating whether the patient is currently exposed to any antipsychotic agent."} ;; "antipsychotic medications"
(declare-const patient_is_taking_selective_serotonin_re_uptake_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any selective serotonin reuptake inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any selective serotonin reuptake inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any selective serotonin reuptake inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking any selective serotonin reuptake inhibitor containing product."} ;; "selective serotonin reuptake inhibitor medications"
(declare-const patient_is_taking_norepinephrine_reuptake_inhibitor_and_serotonin_reuptake_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any serotonin-norepinephrine reuptake inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any serotonin-norepinephrine reuptake inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any serotonin-norepinephrine reuptake inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking any serotonin-norepinephrine reuptake inhibitor containing product."} ;; "serotonin-norepinephrine reuptake inhibitor medications"
(declare-const patient_is_taking_selective_serotonin_re_uptake_inhibitor_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any selective serotonin reuptake inhibitor containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken any selective serotonin reuptake inhibitor containing product in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken any selective serotonin reuptake inhibitor containing product in the past.","meaning":"Boolean indicating whether the patient has ever taken any selective serotonin reuptake inhibitor containing product in the past."} ;; "selective serotonin reuptake inhibitor medications"
(declare-const patient_is_taking_norepinephrine_reuptake_inhibitor_and_serotonin_reuptake_inhibitor_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any serotonin-norepinephrine reuptake inhibitor containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken any serotonin-norepinephrine reuptake inhibitor containing product in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken any serotonin-norepinephrine reuptake inhibitor containing product in the past.","meaning":"Boolean indicating whether the patient has ever taken any serotonin-norepinephrine reuptake inhibitor containing product in the past."} ;; "serotonin-norepinephrine reuptake inhibitor medications"
(declare-const patient_is_taking_selective_serotonin_re_uptake_inhibitor_containing_product_inthehistory@@not_on_stable_dose_for_three_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has NOT been on a stable dose of selective serotonin reuptake inhibitor containing product for three months.","when_to_set_to_false":"Set to false if the patient has been on a stable dose of selective serotonin reuptake inhibitor containing product for three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable dose for three months.","meaning":"Boolean indicating whether the patient has NOT been on a stable dose of selective serotonin reuptake inhibitor containing product for three months."} ;; "the patient has NOT been on a stable dose of selective serotonin reuptake inhibitor medications for three months"
(declare-const patient_is_taking_norepinephrine_reuptake_inhibitor_and_serotonin_reuptake_inhibitor_containing_product_inthehistory@@not_on_stable_dose_for_three_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has NOT been on a stable dose of serotonin-norepinephrine reuptake inhibitor containing product for three months.","when_to_set_to_false":"Set to false if the patient has been on a stable dose of serotonin-norepinephrine reuptake inhibitor containing product for three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable dose for three months.","meaning":"Boolean indicating whether the patient has NOT been on a stable dose of serotonin-norepinephrine reuptake inhibitor containing product for three months."} ;; "the patient has NOT been on a stable dose of serotonin-norepinephrine reuptake inhibitor medications for three months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_selective_serotonin_re_uptake_inhibitor_containing_product_inthehistory@@not_on_stable_dose_for_three_months
      patient_is_taking_selective_serotonin_re_uptake_inhibitor_containing_product_inthehistory)
    :named REQ1_AUXILIARY0)) ;; "the patient has NOT been on a stable dose of selective serotonin reuptake inhibitor medications for three months"

(assert
(! (=> patient_is_taking_norepinephrine_reuptake_inhibitor_and_serotonin_reuptake_inhibitor_containing_product_inthehistory@@not_on_stable_dose_for_three_months
      patient_is_taking_norepinephrine_reuptake_inhibitor_and_serotonin_reuptake_inhibitor_containing_product_inthehistory)
    :named REQ1_AUXILIARY1)) ;; "the patient has NOT been on a stable dose of serotonin-norepinephrine reuptake inhibitor medications for three months"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient is excluded if the patient uses at least one of the following medications with non-exhaustive examples ((tricyclic antidepressant medications) OR (monoamine oxidase inhibitor medications) OR (paroxetine) OR (mood stabilizer medications) OR (antipsychotic medications)).
(assert
(! (not (or patient_is_exposed_to_tricyclic_antidepressant_now
            patient_is_taking_monoamine_oxidase_inhibitor_containing_product_now
            patient_is_taking_paroxetine_containing_product_now
            patient_is_taking_mood_stabilizer_medication_now
            patient_is_exposed_to_anti_psychotic_agent_now))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses at least one of the following medications with non-exhaustive examples ((tricyclic antidepressant medications) OR (monoamine oxidase inhibitor medications) OR (paroxetine) OR (mood stabilizer medications) OR (antipsychotic medications))."

;; Component 1: The patient is excluded if ((the patient uses selective serotonin reuptake inhibitor medications OR serotonin-norepinephrine reuptake inhibitor medications) AND (the patient has NOT been on a stable dose of selective serotonin reuptake inhibitor medications OR serotonin-norepinephrine reuptake inhibitor medications for three months)).
(assert
(! (not (and
         (or patient_is_taking_selective_serotonin_re_uptake_inhibitor_containing_product_now
             patient_is_taking_norepinephrine_reuptake_inhibitor_and_serotonin_reuptake_inhibitor_containing_product_now)
         (or patient_is_taking_selective_serotonin_re_uptake_inhibitor_containing_product_inthehistory@@not_on_stable_dose_for_three_months
             patient_is_taking_norepinephrine_reuptake_inhibitor_and_serotonin_reuptake_inhibitor_containing_product_inthehistory@@not_on_stable_dose_for_three_months)))
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient uses selective serotonin reuptake inhibitor medications OR serotonin-norepinephrine reuptake inhibitor medications) AND (the patient has NOT been on a stable dose of selective serotonin reuptake inhibitor medications OR serotonin-norepinephrine reuptake inhibitor medications for three months))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_used_weight_loss_medication_in_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used at least one weight-loss medication at any time in the past 3 months.","when_to_set_to_false":"Set to false if the patient has not used any weight-loss medication in the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any weight-loss medication in the past 3 months.","meaning":"Boolean indicating whether the patient has used at least one weight-loss medication in the past 3 months."} ;; "weight-loss medications in the past three months"
(declare-const patient_has_used_medication_known_to_significantly_affect_weight_in_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used at least one medication known to significantly affect weight at any time in the past 3 months.","when_to_set_to_false":"Set to false if the patient has not used any medication known to significantly affect weight in the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any medication known to significantly affect weight in the past 3 months.","meaning":"Boolean indicating whether the patient has used at least one medication known to significantly affect weight in the past 3 months."} ;; "medications known to significantly affect weight in the past three months"
(declare-const patient_has_used_oral_steroid_medication_in_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used at least one oral steroid medication at any time in the past 3 months.","when_to_set_to_false":"Set to false if the patient has not used any oral steroid medication in the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any oral steroid medication in the past 3 months.","meaning":"Boolean indicating whether the patient has used at least one oral steroid medication in the past 3 months."} ;; "oral steroid medications in the past three months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive example: oral steroid medications are a subclass of medications known to significantly affect weight
(assert
(! (=> patient_has_used_oral_steroid_medication_in_past_3_months
      patient_has_used_medication_known_to_significantly_affect_weight_in_past_3_months)
   :named REQ2_AUXILIARY0)) ;; "medications known to significantly affect weight with non-exhaustive examples (oral steroid medications)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have used any of the listed medications in the past 3 months
(assert
(! (not (or patient_has_used_weight_loss_medication_in_past_3_months
            patient_has_used_medication_known_to_significantly_affect_weight_in_past_3_months))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "has used at least one of the following medications with non-exhaustive examples ((weight-loss medications) OR (medications known to significantly affect weight with non-exhaustive examples (oral steroid medications))) in the past three months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_weight_loss_value_recorded_inthepast6months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's weight loss (as a percent) recorded in the past six months is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's weight loss in the past six months."} ;; "weight loss of greater than or equal to five percent in the past six months"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (>= patient_weight_loss_value_recorded_inthepast6months_withunit_percent 5))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had weight loss of greater than or equal to five percent in the past six months."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const count_of_weight_reduction_programs_enrolled_in_prior_3_months Real) ;; {"when_to_set_to_value":"Set to the number of distinct weight reduction programs the patient has been enrolled in during the prior three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many weight reduction programs the patient has been enrolled in during the prior three months.","meaning":"Numeric value indicating the number of weight reduction programs the patient has been enrolled in during the prior three months."} ;; "number of weight reduction programs the patient has been enrolled in during the prior three months"
(declare-const patient_enrolled_in_weight_reduction_program_in_prior_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been enrolled in at least one weight reduction program at any time during the prior three months.","when_to_set_to_false":"Set to false if the patient has not been enrolled in any weight reduction program during the prior three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been enrolled in a weight reduction program in the prior three months.","meaning":"Boolean indicating whether the patient has been enrolled in at least one weight reduction program in the prior three months."} ;; "has been enrolled in at least one weight reduction program in the prior three months"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definitional link: patient_enrolled_in_weight_reduction_program_in_prior_3_months is true iff count_of_weight_reduction_programs_enrolled_in_prior_3_months >= 1
(assert
(! (= patient_enrolled_in_weight_reduction_program_in_prior_3_months
     (>= count_of_weight_reduction_programs_enrolled_in_prior_3_months 1))
:named REQ4_AUXILIARY0)) ;; "has been enrolled in at least one weight reduction program in the prior three months"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_enrolled_in_weight_reduction_program_in_prior_3_months)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been enrolled in at least one weight reduction program in the prior three months."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of mental disorder within the past three months.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of mental disorder within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of mental disorder within the past three months.","meaning":"Boolean indicating whether the patient has a diagnosis of mental disorder within the past three months."} ;; "psychiatric disorder"

(declare-const patient_has_diagnosis_of_mental_disorder_inthepast3months@@treated_in_individual_psychotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of mental disorder within the past three months and that diagnosis was treated in individual psychotherapy.","when_to_set_to_false":"Set to false if the patient has a diagnosis of mental disorder within the past three months but that diagnosis was not treated in individual psychotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of mental disorder within the past three months was treated in individual psychotherapy.","meaning":"Boolean indicating whether the diagnosis of mental disorder within the past three months was treated in individual psychotherapy."} ;; "has received treatment in individual psychotherapy for any psychiatric disorder in the prior three months"

(declare-const patient_has_received_treatment_in_couples_counseling_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment in couples counseling within the past three months.","when_to_set_to_false":"Set to false if the patient has not received treatment in couples counseling within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment in couples counseling within the past three months.","meaning":"Boolean indicating whether the patient has received treatment in couples counseling within the past three months."} ;; "a patient in couples counseling ... will be allowed"

(declare-const patient_has_received_treatment_in_family_counseling_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment in family counseling within the past three months.","when_to_set_to_false":"Set to false if the patient has not received treatment in family counseling within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment in family counseling within the past three months.","meaning":"Boolean indicating whether the patient has received treatment in family counseling within the past three months."} ;; "a patient in ... family counseling will be allowed"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_inthepast3months@@treated_in_individual_psychotherapy
      patient_has_diagnosis_of_mental_disorder_inthepast3months)
   :named REQ5_AUXILIARY0)) ;; "diagnosis of mental disorder within the past three months and that diagnosis was treated in individual psychotherapy"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have received individual psychotherapy for any psychiatric disorder in the prior three months
(assert
(! (not patient_has_diagnosis_of_mental_disorder_inthepast3months@@treated_in_individual_psychotherapy)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment in individual psychotherapy for any psychiatric disorder in the prior three months."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_severe_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe depression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of severe depression.","meaning":"Boolean indicating whether the patient currently has severe depression."} ;; "severe depression"

(declare-const patient_has_finding_of_severe_impairment_of_functioning_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe impairment of functioning.","when_to_set_to_false":"Set to false if the patient currently does not have severe impairment of functioning.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe impairment of functioning.","meaning":"Boolean indicating whether the patient currently has severe impairment of functioning."} ;; "severe impairment of functioning"

(declare-const patient_has_finding_of_severe_impairment_of_functioning_now@@as_judged_by_assessor_or_principal_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's severe impairment of functioning is judged by the assessor or principal investigator.","when_to_set_to_false":"Set to false if the patient's severe impairment of functioning is not judged by the assessor or principal investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's severe impairment of functioning is judged by the assessor or principal investigator.","meaning":"Boolean indicating whether the patient's severe impairment of functioning is judged by the assessor or principal investigator."} ;; "as judged by the assessor OR principal investigator"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_severe_impairment_of_functioning_now@@as_judged_by_assessor_or_principal_investigator
      patient_has_finding_of_severe_impairment_of_functioning_now)
:named REQ6_AUXILIARY0)) ;; "severe impairment of functioning as judged by the assessor OR principal investigator"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_severe_depression_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe depression."

(assert
(! (not patient_has_finding_of_severe_impairment_of_functioning_now@@as_judged_by_assessor_or_principal_investigator)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe impairment of functioning as judged by the assessor OR principal investigator."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_suicidal_thoughts_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suicidal thoughts (suicidal ideation).","when_to_set_to_false":"Set to false if the patient currently does not have suicidal thoughts (suicidal ideation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suicidal thoughts (suicidal ideation).","meaning":"Boolean indicating whether the patient currently has suicidal thoughts (suicidal ideation)."} ;; "suicidal ideation"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_suicidal_thoughts_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active suicidal ideation."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented finding or diagnosis of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a documented finding or diagnosis of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol abuse.","meaning":"Boolean indicating whether the patient currently has a finding of alcohol abuse."} ;; "alcohol abuse"
(declare-const patient_has_finding_of_alcohol_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented finding or diagnosis of alcohol dependence.","when_to_set_to_false":"Set to false if the patient currently does not have a documented finding or diagnosis of alcohol dependence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol dependence.","meaning":"Boolean indicating whether the patient currently has a finding of alcohol dependence."} ;; "alcohol dependence"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented finding or diagnosis relating to drug misuse behavior (drug abuse).","when_to_set_to_false":"Set to false if the patient currently does not have a documented finding or diagnosis relating to drug misuse behavior (drug abuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has drug abuse.","meaning":"Boolean indicating whether the patient currently has a finding relating to drug misuse behavior (drug abuse)."} ;; "drug abuse"
(declare-const patient_has_finding_of_psychoactive_substance_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented finding or diagnosis of psychoactive substance dependence (drug dependence).","when_to_set_to_false":"Set to false if the patient currently does not have a documented finding or diagnosis of psychoactive substance dependence (drug dependence).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has drug dependence.","meaning":"Boolean indicating whether the patient currently has a finding of psychoactive substance dependence (drug dependence)."} ;; "drug dependence"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_has_finding_of_alcohol_abuse_now
            patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now
            patient_has_finding_of_alcohol_dependence_now
            patient_has_finding_of_psychoactive_substance_dependence_now))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has at least one of the following conditions ((alcohol abuse) OR (drug abuse) OR (alcohol dependence) OR (drug dependence))."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "renal disease"
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "hepatic disease"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_kidney_disease_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal disease."

(assert
(! (not patient_has_finding_of_disease_of_liver_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic disease."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_taken_thyroid_hormone_containing_product_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any thyroid hormone-containing product at any time within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not taken any thyroid hormone-containing product within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any thyroid hormone-containing product within the past 3 months.","meaning":"Boolean indicating whether the patient has taken any thyroid hormone-containing product within the past 3 months."} ;; "thyroid medications"
(declare-const patient_has_taken_thyroid_hormone_containing_product_inthepast3months@@change_occurred Bool) ;; {"when_to_set_to_true":"Set to true if the patient experienced any change in their thyroid hormone-containing product regimen (initiation, discontinuation, dose adjustment, or switch) within the past 3 months.","when_to_set_to_false":"Set to false if the patient did not experience any change in their thyroid hormone-containing product regimen within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a change occurred in the thyroid hormone-containing product regimen within the past 3 months.","meaning":"Boolean indicating whether a change in thyroid hormone-containing product regimen occurred within the past 3 months."} ;; "change in thyroid medications within the last three months"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_taken_thyroid_hormone_containing_product_inthepast3months@@change_occurred
      patient_has_taken_thyroid_hormone_containing_product_inthepast3months)
:named REQ11_AUXILIARY0)) ;; "change in thyroid medications within the last three months""

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_taken_thyroid_hormone_containing_product_inthepast3months@@change_occurred)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a change in thyroid medications within the last three months."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const months_since_patient_partum_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient gave birth, recorded as of now, in units of months.","when_to_set_to_null":"Set to null if the number of months since the patient gave birth is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of months since the patient gave birth, recorded as of now, in units of months."} ;; "the patient is within six months post-partum"
(declare-const patient_is_within_six_months_post_partum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently within six months post-partum.","when_to_set_to_false":"Set to false if the patient is currently not within six months post-partum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently within six months post-partum.","meaning":"Boolean value indicating whether the patient is currently within six months post-partum."} ;; "the patient is within six months post-partum"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Define "within six months post-partum" in terms of months since partum
(assert
(! (= patient_is_within_six_months_post_partum_now
     (and (<= months_since_patient_partum_value_recorded_now_withunit_months 6)
          (>= months_since_patient_partum_value_recorded_now_withunit_months 0)))
:named REQ12_AUXILIARY0)) ;; "the patient is within six months post-partum"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_lactating_now)
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

(assert
(! (not patient_is_within_six_months_post_partum_now)
    :named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is within six months post-partum."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_diagnosis_of_anorexia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of anorexia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of anorexia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of anorexia nervosa.","meaning":"Boolean indicating whether the patient currently has a diagnosis of anorexia nervosa."} ;; "the patient has a current diagnosis of anorexia nervosa"
(declare-const patient_has_diagnosis_of_bulimia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bulimia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bulimia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bulimia nervosa.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bulimia nervosa."} ;; "the patient has a current diagnosis of bulimia nervosa"
(declare-const patient_has_diagnosis_of_anorexia_nervosa_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of anorexia nervosa at any time within the past five years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of anorexia nervosa at any time within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of anorexia nervosa within the past five years.","meaning":"Boolean indicating whether the patient has had a diagnosis of anorexia nervosa within the past five years."} ;; "the patient has a history of anorexia nervosa within the last five years"
(declare-const patient_has_diagnosis_of_bulimia_nervosa_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of bulimia nervosa at any time within the past five years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of bulimia nervosa at any time within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of bulimia nervosa within the past five years.","meaning":"Boolean indicating whether the patient has had a diagnosis of bulimia nervosa within the past five years."} ;; "the patient has a history of bulimia nervosa within the last five years"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_diagnosis_of_anorexia_nervosa_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of anorexia nervosa."

(assert
(! (not patient_has_diagnosis_of_bulimia_nervosa_now)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of bulimia nervosa."

(assert
(! (not patient_has_diagnosis_of_anorexia_nervosa_inthepast5years)
:named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of anorexia nervosa within the last five years."

(assert
(! (not patient_has_diagnosis_of_bulimia_nervosa_inthepast5years)
:named REQ13_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of bulimia nervosa within the last five years."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_psychotic_symptom_finding_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had psychotic symptoms at any time within the previous twelve months.","when_to_set_to_false":"Set to false if the patient has not had psychotic symptoms at any time within the previous twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had psychotic symptoms within the previous twelve months.","meaning":"Boolean indicating whether the patient has had psychotic symptoms within the previous twelve months."} ;; "psychotic symptoms within the previous twelve months"
(declare-const patient_has_hospitalization_for_psychiatric_disorder_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had hospitalization for a psychiatric disorder at any time within the previous twelve months.","when_to_set_to_false":"Set to false if the patient has not had hospitalization for a psychiatric disorder within the previous twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had hospitalization for a psychiatric disorder within the previous twelve months.","meaning":"Boolean indicating whether the patient has had hospitalization for a psychiatric disorder within the previous twelve months."} ;; "hospitalization for a psychiatric disorder within the previous twelve months"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_psychotic_symptom_finding_inthepast12months)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had psychotic symptoms within the previous twelve months."

(assert
(! (not patient_has_hospitalization_for_psychiatric_disorder_inthepast12months)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had hospitalization for a psychiatric disorder within the previous twelve months."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T11:07:13.389701 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_diagnosis_of_mood_disorder_not_otherwise_specified_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mood disorder not otherwise specified.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mood disorder not otherwise specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mood disorder not otherwise specified.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mood disorder not otherwise specified."} ;; "the patient has mood disorder not otherwise specified"
(declare-const patient_has_diagnosis_of_substance_induced_mood_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of substance-induced mood disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of substance-induced mood disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of substance-induced mood disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of substance-induced mood disorder."} ;; "the patient has substance-induced mood disorder"
(declare-const patient_has_diagnosis_of_mood_disorder_due_to_a_general_medical_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mood disorder due to a general medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mood disorder due to a general medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mood disorder due to a general medical condition.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mood disorder due to a general medical condition."} ;; "the patient has mood disorder due to a general medical condition"
(declare-const patient_has_diagnosis_of_mood_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mood disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mood disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mood disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mood disorder."} ;; "mood disorder"
(declare-const patient_has_diagnosis_of_psychoactive_substance_induced_organic_mood_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of psychoactive substance-induced organic mood disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of psychoactive substance-induced organic mood disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of psychoactive substance-induced organic mood disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of psychoactive substance-induced organic mood disorder."} ;; "substance-induced mood disorder"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_diagnosis_of_mood_disorder_not_otherwise_specified_now)
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mood disorder not otherwise specified."

(assert
(! (not patient_has_diagnosis_of_substance_induced_mood_disorder_now)
    :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has substance-induced mood disorder."

(assert
(! (not patient_has_diagnosis_of_mood_disorder_due_to_a_general_medical_condition_now)
    :named REQ15_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mood disorder due to a general medical condition."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_diagnosis_of_bipolar_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with bipolar disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with bipolar disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with bipolar disorder.","meaning":"Boolean indicating whether the patient has a history of bipolar disorder."} ;; "has a history of bipolar disorder"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_diagnosis_of_bipolar_disorder_inthehistory)
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of bipolar disorder."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_injury_of_head_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of head injury (head trauma) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented history of head injury (head trauma) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of head injury (head trauma).","meaning":"Boolean indicating whether the patient has ever had a history of head injury (head trauma) at any time in the past."} ;; "head trauma"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_injury_of_head_inthehistory)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of head trauma."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any tobacco smoking behavior finding (change in smoking behavior) within the past three months.","when_to_set_to_false":"Set to false if the patient has not had any tobacco smoking behavior finding (change in smoking behavior) within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any tobacco smoking behavior finding (change in smoking behavior) within the past three months.","meaning":"Boolean indicating whether the patient has had any tobacco smoking behavior finding (change in smoking behavior) within the past three months."} ;; "the patient has had any changes in smoking behavior within the prior three months"
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthefuture3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a finding of planned change in tobacco smoking behavior within the next three months.","when_to_set_to_false":"Set to false if the patient does not have a finding of planned change in tobacco smoking behavior within the next three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a finding of planned change in tobacco smoking behavior within the next three months.","meaning":"Boolean indicating whether the patient has a finding of planned change in tobacco smoking behavior within the next three months."} ;; "the patient plans to change smoking behavior within the next three months"
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthefuture3months@@planned_change Bool) ;; {"when_to_set_to_true":"Set to true if the finding of tobacco smoking behavior within the next three months is specifically a planned change (i.e., the patient intends to change smoking behavior, not that the change has already occurred).","when_to_set_to_false":"Set to false if the finding of tobacco smoking behavior within the next three months is not a planned change (i.e., it is an actual change or no change is planned).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding of tobacco smoking behavior within the next three months is a planned change.","meaning":"Boolean indicating whether the finding of tobacco smoking behavior within the next three months is specifically a planned change."} ;; "the patient plans to change smoking behavior within the next three months"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_tobacco_smoking_behavior_finding_inthefuture3months@@planned_change
      patient_has_finding_of_tobacco_smoking_behavior_finding_inthefuture3months)
:named REQ18_AUXILIARY0)) ;; "the patient plans to change smoking behavior within the next three months"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (or patient_has_finding_of_tobacco_smoking_behavior_finding_inthepast3months
            patient_has_finding_of_tobacco_smoking_behavior_finding_inthefuture3months@@planned_change))
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had any changes in smoking behavior within the prior three months) OR (the patient plans to change smoking behavior within the next three months)."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_will_undergo_bariatric_operative_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented plan or scheduled appointment to undergo a bariatric operative procedure in the future (i.e., bariatric surgery is planned but not yet performed).","when_to_set_to_false":"Set to false if the patient does not have any documented plan or scheduled appointment for a future bariatric operative procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has plans for a future bariatric operative procedure.","meaning":"Boolean indicating whether the patient is planned to undergo a bariatric operative procedure in the future."} ;; "plans for bariatric surgery"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_will_undergo_bariatric_operative_procedure_inthefuture)
:named REQ19_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has plans for bariatric surgery."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_finding_of_major_medical_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any major medical problem.","when_to_set_to_false":"Set to false if the patient currently does not have any major medical problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any major medical problem.","meaning":"Boolean indicating whether the patient currently has any major medical problem."} ;; "any other ... major medical problem"
(declare-const patient_has_finding_of_major_medical_problem_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current major medical problem is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current major medical problem is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current major medical problem is uncontrolled.","meaning":"Boolean indicating whether the patient's current major medical problem is uncontrolled."} ;; "any other uncontrolled major medical problem"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_major_medical_problem_now@@uncontrolled
      patient_has_finding_of_major_medical_problem_now)
:named REQ20_AUXILIARY0)) ;; "uncontrolled" implies "major medical problem"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_has_finding_of_major_medical_problem_now@@uncontrolled)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other uncontrolled major medical problem."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is a woman"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a woman) AND (the patient is pregnant)."
