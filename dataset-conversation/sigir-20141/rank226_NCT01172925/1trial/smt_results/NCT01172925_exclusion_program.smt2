;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than 18 years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (< patient_age_value_recorded_now_in_years 18))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than 18 years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's forced expiratory volume in one second/forced vital capacity ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current forced expiratory volume in one second/forced vital capacity ratio."} ;; "forced expiratory volume in one second/forced vital capacity ratio"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_predicted Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's forced expiratory volume in one second (FEV1) percent predicted post-bronchodilator is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current forced expiratory volume in one second (FEV1) percent predicted post-bronchodilator."} ;; "forced expiratory volume in one second less than 80 percent predicted post-bronchodilator"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_predicted@@measured_post_bronchodilator Bool) ;; {"when_to_set_to_true":"Set to true if the FEV1 percent predicted measurement was taken post-bronchodilator.","when_to_set_to_false":"Set to false if the FEV1 percent predicted measurement was not taken post-bronchodilator.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken post-bronchodilator.","meaning":"Boolean indicating whether the FEV1 percent predicted measurement was taken post-bronchodilator."} ;; "forced expiratory volume in one second less than 80 percent predicted post-bronchodilator"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and
  (< patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio 0.7) ;; "forced expiratory volume in one second/forced vital capacity ratio less than 0.7"
  (< patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_predicted 80) ;; "forced expiratory volume in one second less than 80 percent predicted"
  patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_predicted@@measured_post_bronchodilator ;; "post-bronchodilator"
))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a forced expiratory volume in one second/forced vital capacity ratio less than 0.7) AND (the patient has a forced expiratory volume in one second less than 80 percent predicted post-bronchodilator)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the numeric value if the patient's current life expectancy in months is documented or estimated.","when_to_set_to_null":"Set to null if the patient's current life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in months."} ;; "life expectancy less than 3 months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (< patient_longevity_value_recorded_now_withunit_months 3))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life expectancy less than 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_acute_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have an acute heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute heart disease.","meaning":"Boolean indicating whether the patient currently has an acute heart disease."} ;; "acute cardiac condition"

(declare-const patient_has_finding_of_acute_respiratory_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute respiratory condition.","when_to_set_to_false":"Set to false if the patient currently does not have an acute respiratory condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute respiratory condition.","meaning":"Boolean indicating whether the patient currently has an acute respiratory condition."} ;; "acute respiratory condition"

(declare-const patient_has_finding_of_dyspnea_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had dyspnea within the past 1 week.","when_to_set_to_false":"Set to false if the patient has not had dyspnea within the past 1 week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had dyspnea within the past 1 week.","meaning":"Boolean indicating whether the patient has had dyspnea within the past 1 week."} ;; "dyspnea"

(declare-const patient_has_finding_of_dyspnea_inthepast1weeks@@significantly_worsening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had dyspnea within the past 1 week and the dyspnea is significantly worsening.","when_to_set_to_false":"Set to false if the patient has had dyspnea within the past 1 week but the dyspnea is not significantly worsening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dyspnea is significantly worsening within the past 1 week.","meaning":"Boolean indicating whether the patient has had dyspnea within the past 1 week and the dyspnea is significantly worsening."} ;; "significant worsening of dyspnea over the last week"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_dyspnea_inthepast1weeks@@significantly_worsening
       patient_has_finding_of_dyspnea_inthepast1weeks)
   :named REQ3_AUXILIARY0)) ;; "significant worsening of dyspnea over the last week"

;; Non-exhaustive examples: pneumonia, heart failure are examples of acute respiratory/cardiac conditions
;; (pneumonia, heart failure) ⇒ (acute respiratory condition ∨ acute cardiac condition)
;; No explicit variables for pneumonia/heart failure, so no further auxiliary assertion needed.

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: (significant worsening of dyspnea over the last week) AND (acute cardiac condition OR acute respiratory condition is considered likely)
(assert
(! (not (and patient_has_finding_of_dyspnea_inthepast1weeks@@significantly_worsening
             (or patient_has_finding_of_acute_heart_disease_now
                 patient_has_finding_of_acute_respiratory_condition_now)))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has significant worsening of dyspnea over the last week) AND (an acute cardiac condition OR an acute respiratory condition with non-exhaustive examples (pneumonia, heart failure) is considered likely)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction at any time within the previous 1 month.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the previous 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the previous 1 month.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the previous 1 month."} ;; "myocardial infarction within the previous 1 month"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast1months)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had a myocardial infarction within the previous 1 month."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured heart rate value in beats per minute if a current measurement is available.","when_to_set_to_null":"Set to null if no current heart rate measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute."} ;; "heart rate"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (>= patient_heart_rate_value_recorded_now_withunit_beats_per_minute 120))
    :named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a heart rate greater than or equal to 120."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active tuberculosis.","meaning":"Boolean indicating whether the patient currently has active tuberculosis."} ;; "active tuberculosis"

(declare-const patient_is_undergoing_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antibiotic therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving antibiotic therapy.","meaning":"Boolean indicating whether the patient is currently receiving antibiotic therapy."} ;; "antibiotic therapy"

(declare-const patient_is_undergoing_antibiotic_therapy_now@@for_tuberculosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antibiotic therapy and the therapy is specifically for tuberculosis.","when_to_set_to_false":"Set to false if the patient is currently receiving antibiotic therapy but it is not for tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy is for tuberculosis.","meaning":"Boolean indicating whether the patient is currently receiving antibiotic therapy for tuberculosis."} ;; "antibiotic therapy for tuberculosis"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_antibiotic_therapy_now@@for_tuberculosis
      patient_is_undergoing_antibiotic_therapy_now)
   :named REQ6_AUXILIARY0)) ;; "the patient is receiving antibiotic therapy for tuberculosis."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_active_tuberculosis_now)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has active tuberculosis"

(assert
(! (not patient_is_undergoing_antibiotic_therapy_now@@for_tuberculosis)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is receiving antibiotic therapy for tuberculosis"

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_taking_ipratropium_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any ipratropium-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any ipratropium-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any ipratropium-containing product.","meaning":"Boolean indicating whether the patient is currently taking any ipratropium-containing product."} ;; "current use of ipratropium"
(declare-const patient_is_taking_tiotropium_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any tiotropium-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any tiotropium-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any tiotropium-containing product.","meaning":"Boolean indicating whether the patient is currently taking any tiotropium-containing product."} ;; "current use of tiotropium"
(declare-const patient_is_taking_oxitropium_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any oxitropium-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any oxitropium-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any oxitropium-containing product.","meaning":"Boolean indicating whether the patient is currently taking any oxitropium-containing product."} ;; "current use of oxitropium"
(declare-const patient_has_taken_ipratropium_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously taken any ipratropium-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken any ipratropium-containing product in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously taken any ipratropium-containing product.","meaning":"Boolean indicating whether the patient has previously taken any ipratropium-containing product at any time in the past."} ;; "previous use of ipratropium"
(declare-const patient_has_taken_tiotropium_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously taken any tiotropium-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken any tiotropium-containing product in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously taken any tiotropium-containing product.","meaning":"Boolean indicating whether the patient has previously taken any tiotropium-containing product at any time in the past."} ;; "previous use of tiotropium"
(declare-const patient_has_taken_oxitropium_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously taken any oxitropium-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken any oxitropium-containing product in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously taken any oxitropium-containing product.","meaning":"Boolean indicating whether the patient has previously taken any oxitropium-containing product at any time in the past."} ;; "previous use of oxitropium"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_taking_ipratropium_containing_product_now)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has current use of ipratropium."

(assert
(! (not patient_is_taking_tiotropium_containing_product_now)
:named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has current use of tiotropium."

(assert
(! (not patient_is_taking_oxitropium_containing_product_now)
:named REQ7_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has current use of oxitropium."

(assert
(! (not patient_has_taken_ipratropium_containing_product_inthehistory)
:named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous use of ipratropium."

(assert
(! (not patient_has_taken_tiotropium_containing_product_inthehistory)
:named REQ7_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous use of tiotropium."

(assert
(! (not patient_has_taken_oxitropium_containing_product_inthehistory)
:named REQ7_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous use of oxitropium."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_allergy_to_atropine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy or hypersensitivity to atropine.","when_to_set_to_false":"Set to false if the patient is known not to have an allergy or hypersensitivity to atropine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an allergy or hypersensitivity to atropine.","meaning":"Boolean indicating whether the patient currently has a clinical finding of allergy or hypersensitivity to atropine."} ;; "sensitivity to atropine"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_allergy_to_atropine_now)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sensitivity to atropine."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with asthma at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with asthma at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with asthma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of asthma in their medical history."} ;; "the patient has a pre-existing diagnosis of asthma"
(declare-const patient_has_diagnosis_of_moderate_chronic_obstructive_pulmonary_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with moderate chronic obstructive pulmonary disease at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with moderate chronic obstructive pulmonary disease at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with moderate chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of moderate chronic obstructive pulmonary disease in their medical history."} ;; "the patient has a pre-existing diagnosis of moderate chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with severe chronic obstructive pulmonary disease at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with severe chronic obstructive pulmonary disease at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with severe chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of severe chronic obstructive pulmonary disease in their medical history."} ;; "the patient has a pre-existing diagnosis of severe chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_diagnosis_of_asthma_inthehistory)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a pre-existing diagnosis of asthma."

(assert
  (! (not patient_has_diagnosis_of_moderate_chronic_obstructive_pulmonary_disease_inthehistory)
     :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a pre-existing diagnosis of moderate chronic obstructive pulmonary disease."

(assert
  (! (not patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_inthehistory)
     :named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a pre-existing diagnosis of severe chronic obstructive pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const beta_adrenergic_bronchodilator_use_frequency_per_week_value_recorded_in_times_per_week Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient uses beta-adrenergic bronchodilators, as documented in the patient's record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times per week the patient uses beta-adrenergic bronchodilators.","meaning":"Numeric value representing the frequency per week of beta-adrenergic bronchodilator use by the patient, in units of times per week."} ;; "uses beta-adrenergic bronchodilators more than one time per week"
(declare-const patient_is_exposed_to_beta_adrenergic_receptor_agonist_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to beta-adrenergic receptor agonists (beta-adrenergic bronchodilators) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to beta-adrenergic receptor agonists (beta-adrenergic bronchodilators) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to beta-adrenergic receptor agonists (beta-adrenergic bronchodilators) at any time in their history.","meaning":"Boolean indicating whether the patient has ever been exposed to beta-adrenergic receptor agonists (beta-adrenergic bronchodilators) at any time in their history."} ;; "beta-adrenergic bronchodilators"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (> beta_adrenergic_bronchodilator_use_frequency_per_week_value_recorded_in_times_per_week 1))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses beta-adrenergic bronchodilators more than one time per week."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_using_experimental_therapy_with_known_cholinergic_effects_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an experimental therapy with known cholinergic effects.","when_to_set_to_false":"Set to false if the patient is currently not using an experimental therapy with known cholinergic effects.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an experimental therapy with known cholinergic effects.","meaning":"Boolean indicating whether the patient is currently using an experimental therapy with known cholinergic effects."} ;; "the patient uses experimental therapy with known cholinergic effects"
(declare-const patient_is_using_experimental_therapy_with_known_adrenergic_effects_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an experimental therapy with known adrenergic effects.","when_to_set_to_false":"Set to false if the patient is currently not using an experimental therapy with known adrenergic effects.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an experimental therapy with known adrenergic effects.","meaning":"Boolean indicating whether the patient is currently using an experimental therapy with known adrenergic effects."} ;; "the patient uses experimental therapy with known adrenergic effects"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (or patient_is_using_experimental_therapy_with_known_cholinergic_effects_now
            patient_is_using_experimental_therapy_with_known_adrenergic_effects_now))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient uses experimental therapy with known cholinergic effects) OR (the patient uses experimental therapy with known adrenergic effects)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_glaucoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of glaucoma.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of glaucoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of glaucoma.","meaning":"Boolean indicating whether the patient currently has glaucoma."} ;; "glaucoma"
(declare-const patient_has_finding_of_glaucoma_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current glaucoma is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current glaucoma is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current glaucoma is uncontrolled.","meaning":"Boolean indicating whether the patient's current glaucoma is uncontrolled."} ;; "uncontrolled glaucoma"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_glaucoma_now@@uncontrolled
      patient_has_finding_of_glaucoma_now)
   :named REQ12_AUXILIARY0)) ;; "uncontrolled glaucoma" implies "glaucoma"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_glaucoma_now@@uncontrolled)
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled glaucoma."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_retention_of_urine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of retention of urine (urinary retention).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of retention of urine (urinary retention).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has retention of urine (urinary retention).","meaning":"Boolean indicating whether the patient currently has retention of urine (urinary retention)."} ;; "urinary retention"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_retention_of_urine_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has urinary retention."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_upper_respiratory_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an upper respiratory infection.","when_to_set_to_false":"Set to false if the patient currently does not have an upper respiratory infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an upper respiratory infection.","meaning":"Boolean indicating whether the patient currently has an upper respiratory infection."} ;; "the patient has an active upper respiratory infection"
(declare-const patient_has_finding_of_upper_respiratory_infection_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current upper respiratory infection is active.","when_to_set_to_false":"Set to false if the patient's current upper respiratory infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current upper respiratory infection is active.","meaning":"Boolean indicating whether the patient's current upper respiratory infection is active."} ;; "the patient has an active upper respiratory infection"
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have a lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lower respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has a lower respiratory tract infection."} ;; "the patient has an active lower respiratory infection"
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current lower respiratory tract infection is active.","when_to_set_to_false":"Set to false if the patient's current lower respiratory tract infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current lower respiratory tract infection is active.","meaning":"Boolean indicating whether the patient's current lower respiratory tract infection is active."} ;; "the patient has an active lower respiratory infection"
(declare-const patient_has_finding_of_upper_respiratory_infection_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an upper respiratory infection within the past four weeks.","when_to_set_to_false":"Set to false if the patient has not had an upper respiratory infection within the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an upper respiratory infection within the past four weeks.","meaning":"Boolean indicating whether the patient has had an upper respiratory infection within the past four weeks."} ;; "upper respiratory infection within four weeks"
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a lower respiratory tract infection within the past four weeks.","when_to_set_to_false":"Set to false if the patient has not had a lower respiratory tract infection within the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a lower respiratory tract infection within the past four weeks.","meaning":"Boolean indicating whether the patient has had a lower respiratory tract infection within the past four weeks."} ;; "lower respiratory infection within four weeks"
(declare-const patient_has_taken_antibiotics_for_upper_respiratory_infection_within_4_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken antibiotics for any recent upper respiratory infection within the past four weeks.","when_to_set_to_false":"Set to false if the patient has not taken antibiotics for any recent upper respiratory infection within the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken antibiotics for any recent upper respiratory infection within the past four weeks.","meaning":"Boolean indicating whether the patient has taken antibiotics for any recent upper respiratory infection within the past four weeks."} ;; "the patient has taken antibiotics for any recent upper respiratory infection within four weeks"
(declare-const patient_has_taken_antibiotics_for_lower_respiratory_infection_within_4_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken antibiotics for any recent lower respiratory infection within the past four weeks.","when_to_set_to_false":"Set to false if the patient has not taken antibiotics for any recent lower respiratory infection within the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken antibiotics for any recent lower respiratory infection within the past four weeks.","meaning":"Boolean indicating whether the patient has taken antibiotics for any recent lower respiratory infection within the past four weeks."} ;; "the patient has taken antibiotics for any recent lower respiratory infection within four weeks"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_upper_respiratory_infection_now@@active
       patient_has_finding_of_upper_respiratory_infection_now)
   :named REQ14_AUXILIARY0)) ;; "the patient has an active upper respiratory infection"

(assert
(! (=> patient_has_finding_of_lower_respiratory_tract_infection_now@@active
       patient_has_finding_of_lower_respiratory_tract_infection_now)
   :named REQ14_AUXILIARY1)) ;; "the patient has an active lower respiratory infection"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_upper_respiratory_infection_now@@active)
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has an active upper respiratory infection"

(assert
(! (not patient_has_finding_of_lower_respiratory_tract_infection_now@@active)
   :named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has an active lower respiratory infection"

(assert
(! (not patient_has_taken_antibiotics_for_upper_respiratory_infection_within_4_weeks)
   :named REQ14_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has taken antibiotics for any recent upper respiratory infection within four weeks"

(assert
(! (not patient_has_taken_antibiotics_for_lower_respiratory_infection_within_4_weeks)
   :named REQ14_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has taken antibiotics for any recent lower respiratory infection within four weeks"

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_pleural_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pleural effusion.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pleural effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleural effusion.","meaning":"Boolean indicating whether the patient currently has pleural effusion."} ;; "pleural effusion"
(declare-const patient_has_finding_of_pleural_effusion_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pleural effusion and the effusion is symptomatic.","when_to_set_to_false":"Set to false if the patient currently has pleural effusion but it is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pleural effusion is symptomatic.","meaning":"Boolean indicating whether the patient's pleural effusion is symptomatic."} ;; "symptomatic pleural effusion"
(declare-const patient_has_finding_of_pericardial_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pericardial effusion.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pericardial effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pericardial effusion.","meaning":"Boolean indicating whether the patient currently has pericardial effusion."} ;; "pericardial effusion"
(declare-const patient_has_finding_of_pericardial_effusion_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pericardial effusion and the effusion is symptomatic.","when_to_set_to_false":"Set to false if the patient currently has pericardial effusion but it is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pericardial effusion is symptomatic.","meaning":"Boolean indicating whether the patient's pericardial effusion is symptomatic."} ;; "symptomatic pericardial effusion"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_pleural_effusion_now@@symptomatic
       patient_has_finding_of_pleural_effusion_now)
   :named REQ15_AUXILIARY0)) ;; "symptomatic pleural effusion"

(assert
(! (=> patient_has_finding_of_pericardial_effusion_now@@symptomatic
       patient_has_finding_of_pericardial_effusion_now)
   :named REQ15_AUXILIARY1)) ;; "symptomatic pericardial effusion"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_pleural_effusion_now@@symptomatic)
   :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptomatic pleural effusion."

(assert
(! (not patient_has_finding_of_pericardial_effusion_now@@symptomatic)
   :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptomatic pericardial effusion."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_evidence_of_reversible_proximal_endobronchial_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of reversible proximal endobronchial obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of reversible proximal endobronchial obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of reversible proximal endobronchial obstruction.","meaning":"Boolean indicating whether the patient currently has evidence of reversible proximal endobronchial obstruction."} ;; "evidence of reversible proximal endobronchial obstruction"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_evidence_of_reversible_proximal_endobronchial_obstruction_now)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of reversible proximal endobronchial obstruction."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's current hemoglobin saturation with oxygen (oxygen saturation) is available.","when_to_set_to_null":"Set to null if no such percentage measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current hemoglobin saturation with oxygen (oxygen saturation)."} ;; "oxygen saturation less than ninety percent"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not (< patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 90))
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has oxygen saturation less than ninety percent."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const hemoglobin_value_recorded_within_4_weeks_of_randomization_in_grams_per_litre Real) ;; {"when_to_set_to_value":"Set to the patient's hemoglobin value in grams per litre if the value was recorded within four weeks of randomization.","when_to_set_to_null":"Set to null if the hemoglobin value in grams per litre recorded within four weeks of randomization is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's hemoglobin in grams per litre, recorded within four weeks of randomization."} ;; "hemoglobin less than one hundred grams per litre, with testing within 4 weeks of randomization"

(declare-const patient_has_undergone_detection_of_hemoglobin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a hemoglobin test at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a hemoglobin test at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a hemoglobin test.","meaning":"Boolean indicating whether the patient has ever undergone a hemoglobin test at any time in the past."} ;; "hemoglobin testing"

(declare-const patient_has_undergone_detection_of_hemoglobin_inthehistory@@temporalcontext_within4weeks_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the hemoglobin test was performed within four weeks of the patient's randomization.","when_to_set_to_false":"Set to false if the hemoglobin test was not performed within four weeks of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hemoglobin test was performed within four weeks of randomization.","meaning":"Boolean indicating whether the hemoglobin test was performed within four weeks of randomization."} ;; "the hemoglobin testing was performed within four weeks of randomization"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_detection_of_hemoglobin_inthehistory@@temporalcontext_within4weeks_of_randomization
      patient_has_undergone_detection_of_hemoglobin_inthehistory)
:named REQ18_AUXILIARY0)) ;; "the hemoglobin testing was performed within four weeks of randomization"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (and
          patient_has_undergone_detection_of_hemoglobin_inthehistory@@temporalcontext_within4weeks_of_randomization
          (< hemoglobin_value_recorded_within_4_weeks_of_randomization_in_grams_per_litre 100)
      ))
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has hemoglobin less than one hundred grams per litre) AND (the hemoglobin testing was performed within four weeks of randomization)."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_millilitres_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's calculated creatinine renal clearance is recorded now in millilitres per minute.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's calculated creatinine renal clearance (mL/min) measured now."} ;; "calculated creatinine clearance less than or equal to fifty millilitres per minute"

(declare-const patient_urine_creatinine_clearance_value_recorded_withunit_millilitres_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's urine creatinine clearance is recorded in millilitres per minute.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's urine creatinine clearance (mL/min)."} ;; "urine creatinine clearance less than or equal to fifty millilitres per minute"

(declare-const patient_has_undergone_measurement_of_renal_clearance_of_creatinine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone creatinine clearance testing at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone creatinine clearance testing in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone creatinine clearance testing in the past.","meaning":"Boolean indicating whether the patient has ever undergone creatinine clearance testing in the past."} ;; "creatinine clearance testing"

(declare-const patient_has_undergone_measurement_of_renal_clearance_of_creatinine_inthehistory@@temporalcontext_within_four_weeks_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the creatinine clearance testing was performed within four weeks of randomization.","when_to_set_to_false":"Set to false if the creatinine clearance testing was not performed within four weeks of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether creatinine clearance testing was performed within four weeks of randomization.","meaning":"Boolean indicating whether creatinine clearance testing was performed within four weeks of randomization."} ;; "the creatinine clearance testing was performed within four weeks of randomization"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_measurement_of_renal_clearance_of_creatinine_inthehistory@@temporalcontext_within_four_weeks_of_randomization
      patient_has_undergone_measurement_of_renal_clearance_of_creatinine_inthehistory)
:named REQ19_AUXILIARY0)) ;; "the creatinine clearance testing was performed within four weeks of randomization"

;; ===================== Constraint Assertions (REQ 19) =====================
;; Exclusion: patient must NOT have (calculated creatinine clearance ≤ 50 OR urine creatinine clearance ≤ 50) AND testing within 4 weeks of randomization
(assert
(! (not (and
         (or (<= patient_creatinine_renal_clearance_value_recorded_now_withunit_millilitres_per_minute 50)
             (<= patient_urine_creatinine_clearance_value_recorded_withunit_millilitres_per_minute 50))
         patient_has_undergone_measurement_of_renal_clearance_of_creatinine_inthehistory@@temporalcontext_within_four_weeks_of_randomization))
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has calculated creatinine clearance less than or equal to fifty millilitres per minute) OR (the patient has urine creatinine clearance less than or equal to fifty millilitres per minute)) AND (the creatinine clearance testing was performed within four weeks of randomization)."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_weight_decreased_value_recorded_inthepast6months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's body weight loss within the past 6 months is available.","when_to_set_to_null":"Set to null if no such percentage measurement within the past 6 months is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's body weight loss within the past 6 months."} ;; "weight loss > 10 % of usual body weight within 6 months."

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not (> patient_weight_decreased_value_recorded_inthepast6months_withunit_percent 10))
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has weight loss > 10 % of usual body weight within 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently known to be pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently known to be pregnant."} ;; "the patient is known to be pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently known to be lactating.","when_to_set_to_false":"Set to false if the patient is currently known not to be lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently known to be lactating."} ;; "the patient is known to be lactating"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not (or patient_is_pregnant_now patient_is_lactating_now))
:named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is known to be pregnant) OR (the patient is known to be lactating)."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_is_unable_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to give informed consent.","meaning":"Boolean indicating whether the patient is currently unable to give informed consent."} ;; "unable to give informed consent"
(declare-const patient_is_unable_to_independently_fill_out_quality_of_life_forms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to independently fill out quality of life forms.","when_to_set_to_false":"Set to false if the patient is currently able to independently fill out quality of life forms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to independently fill out quality of life forms.","meaning":"Boolean indicating whether the patient is currently unable to independently fill out quality of life forms."} ;; "unable to independently fill out quality of life forms"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not (or patient_is_unable_to_independently_fill_out_quality_of_life_forms_now
            patient_is_unable_to_give_informed_consent_now))
:named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is unable to independently fill out quality of life forms) OR (the patient is unable to give informed consent)."
