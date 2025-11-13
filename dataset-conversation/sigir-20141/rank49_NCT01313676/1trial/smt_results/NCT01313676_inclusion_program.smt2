;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not classified as an outpatient (e.g., inpatient, emergency, etc.).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an outpatient.","meaning":"Boolean indicating whether the patient is currently classified as an outpatient."}  ;; "To be included, the patient must be an outpatient."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_outpatient_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an outpatient."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_given_signed_and_dated_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent to participate, and the consent is both signed and dated by the patient.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent to participate, or the consent is missing either a signature or a date.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent to participate, or whether the consent is signed and dated.","meaning":"Boolean indicating whether the patient has given written informed consent to participate, and the consent is both signed and dated by the patient."} ;; "To be included, the patient must give the patient's signed and dated written informed consent to participate."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_given_signed_and_dated_written_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must give the patient's signed and dated written informed consent to participate."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} ;; "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} ;; "To be included, the patient must be male or female."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the biological potential to become pregnant (e.g., is pre-menopausal and has not undergone sterilization).","when_to_set_to_false":"Set to false if the patient does not currently have the biological potential to become pregnant (e.g., is post-menopausal or has undergone sterilization).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has the potential to bear children."} ;; "post-menopausal"
(declare-const patient_is_post_menopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently post-menopausal.","when_to_set_to_false":"Set to false if the patient is currently not post-menopausal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently post-menopausal.","meaning":"Boolean indicating whether the patient is currently post-menopausal."} ;; "post-menopausal"
(declare-const patient_is_using_highly_effective_method_for_avoidance_of_pregnancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a highly effective method for avoidance of pregnancy.","when_to_set_to_false":"Set to false if the patient is currently not using a highly effective method for avoidance of pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a highly effective method for avoidance of pregnancy.","meaning":"Boolean indicating whether the patient is currently using a highly effective method for avoidance of pregnancy."} ;; "must be using a highly effective method for avoidance of pregnancy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Being post-menopausal implies not having childbearing potential
(assert
  (! (=> patient_is_post_menopausal_now
         (not patient_has_childbearing_potential_now))
     :named REQ3_AUXILIARY0)) ;; "post-menopausal" means not having childbearing potential

;; ===================== Constraint Assertions (REQ 3) =====================
;; If the patient is female, she must be post-menopausal or using a highly effective method for avoidance of pregnancy
(assert
  (! (or (not patient_sex_is_female_now)
         patient_is_post_menopausal_now
         patient_is_using_highly_effective_method_for_avoidance_of_pregnancy_now)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is female, the patient must be post-menopausal or must be using a highly effective method for avoidance of pregnancy."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const investigator_has_made_inclusion_decision_for_female_patient_of_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the investigator has made a decision to include the female patient of childbearing potential at the current time.","when_to_set_to_false":"Set to false if the investigator has made a decision to exclude the female patient of childbearing potential at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator has made a decision to include or exclude the female patient of childbearing potential at the current time.","meaning":"Boolean indicating whether the investigator has made a decision to include or exclude the female patient of childbearing potential at the current time."} ;; "the decision to include or exclude a female patient of childbearing potential may be made at the discretion of the investigator"
(declare-const investigator_has_made_inclusion_decision_for_female_patient_of_childbearing_potential_now@@in_accordance_with_local_practice_in_relation_to_adequate_contraception Bool) ;; {"when_to_set_to_true":"Set to true if the investigator's decision to include or exclude the female patient of childbearing potential at the current time is made in accordance with local practice in relation to adequate contraception.","when_to_set_to_false":"Set to false if the investigator's decision is not made in accordance with local practice in relation to adequate contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator's decision is made in accordance with local practice in relation to adequate contraception.","meaning":"Boolean indicating whether the investigator's decision is made in accordance with local practice in relation to adequate contraception."} ;; "in accordance with local practice in relation to adequate contraception"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> investigator_has_made_inclusion_decision_for_female_patient_of_childbearing_potential_now@@in_accordance_with_local_practice_in_relation_to_adequate_contraception
         investigator_has_made_inclusion_decision_for_female_patient_of_childbearing_potential_now)
     :named REQ4_AUXILIARY0)) ;; "the decision ... may be made at the discretion of the investigator in accordance with local practice in relation to adequate contraception"

;; ===================== Constraint Assertions (REQ 4) =====================
;; This requirement is always satisfiable with investigator action, so it does not restrict eligibility.
(assert
  (! true
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the decision ... may be made at the discretion of the investigator in accordance with local practice in relation to adequate contraception"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged greater than or equal to 40 years and less than or equal to 80 years at screening (Visit 1)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must be aged greater than or equal to 40 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 40 years."

;; Component 1: To be included, the patient must be aged less than or equal to 80 years at screening (Visit 1).
(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged less than or equal to 80 years at screening (Visit 1)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_cigarette_pack_years_value_recorded_now_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the measured or reported value of the patient's total cigarette smoking exposure in pack-years at screening (Visit 1).","when_to_set_to_null":"Set to null if the pack-years value at screening (Visit 1) is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's total cigarette smoking exposure in pack-years at screening (Visit 1)."} ;; "current history of cigarette smoking of greater than or equal to 10 pack-years at screening (Visit 1)"
(declare-const patient_cigarette_pack_years_value_recorded_prior_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the measured or reported value of the patient's prior history of cigarette smoking exposure in pack-years at screening (Visit 1).","when_to_set_to_null":"Set to null if the prior pack-years value at screening (Visit 1) is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's prior history of cigarette smoking exposure in pack-years at screening (Visit 1)."} ;; "prior history of cigarette smoking of greater than or equal to 10 pack-years at screening (Visit 1)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (or (>= patient_cigarette_pack_years_value_recorded_now_withunit_pack_years 10.0)
         (>= patient_cigarette_pack_years_value_recorded_prior_withunit_pack_years 10.0))
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "current history of cigarette smoking of greater than or equal to 10 pack-years at screening (Visit 1) or a prior history of cigarette smoking of greater than or equal to 10 pack-years at screening (Visit 1)"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of tobacco smoking behavior (i.e., has ever smoked in the past).","when_to_set_to_false":"Set to false if the patient has no documented history of tobacco smoking behavior (i.e., has never smoked).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of tobacco smoking behavior.","meaning":"Boolean indicating whether the patient has a history of tobacco smoking behavior."} ;; "if the patient is a previous smoker"
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory@@temporalcontext_stopped_for_at_least_6_months_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of tobacco smoking behavior and has stopped cigarette smoking for at least 6 months prior to Visit 1.","when_to_set_to_false":"Set to false if the patient has a history of tobacco smoking behavior but has not stopped for at least 6 months prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has stopped smoking for at least 6 months prior to Visit 1.","meaning":"Boolean indicating whether the patient with a history of tobacco smoking behavior has stopped smoking for at least 6 months prior to Visit 1."} ;; "must have stopped cigarette smoking for at least 6 months prior to Visit 1"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory@@temporalcontext_stopped_for_at_least_6_months_prior_to_visit_1
         patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory)
     :named REQ7_AUXILIARY0)) ;; "if the patient is a previous smoker, the patient must have stopped cigarette smoking for at least 6 months prior to Visit 1"

;; ===================== Constraint Assertions (REQ 7) =====================
;; If the patient is a previous smoker, they must have stopped for at least 6 months prior to Visit 1
(assert
  (! (or (not patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory)
         patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory@@temporalcontext_stopped_for_at_least_6_months_prior_to_visit_1)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is a previous smoker, the patient must have stopped cigarette smoking for at least 6 months prior to Visit 1"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's post-albuterol FEV1/FVC ratio is recorded at screening (Visit 1).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's measured post-albuterol FEV1/FVC ratio at screening (Visit 1)."} ;; "measured post-albuterol forced expiratory volume in 1 second/forced vital capacity ratio"
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_post_albuterol Bool) ;; {"when_to_set_to_true":"Set to true if the measurement was taken after administration of albuterol.","when_to_set_to_false":"Set to false if the measurement was not taken after administration of albuterol.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken post-albuterol.","meaning":"Boolean indicating whether the FEV1/FVC ratio measurement was taken post-albuterol."} ;; "measured post-albuterol"
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_post_salbutamol Bool) ;; {"when_to_set_to_true":"Set to true if the measurement was taken after administration of salbutamol.","when_to_set_to_false":"Set to false if the measurement was not taken after administration of salbutamol.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken post-salbutamol.","meaning":"Boolean indicating whether the FEV1/FVC ratio measurement was taken post-salbutamol."} ;; "measured post-salbutamol"
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_at_screening_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the measurement was taken at screening (Visit 1).","when_to_set_to_false":"Set to false if the measurement was not taken at screening (Visit 1).","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken at screening (Visit 1).","meaning":"Boolean indicating whether the FEV1/FVC ratio measurement was taken at screening (Visit 1)."} ;; "measured at screening (Visit 1)"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_post_albuterol
         true)
     :named REQ8_AUXILIARY0)) ;; "measured post-albuterol"

(assert
  (! (=> patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_post_salbutamol
         true)
     :named REQ8_AUXILIARY1)) ;; "measured post-salbutamol"

(assert
  (! (=> patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_at_screening_visit_1
         true)
     :named REQ8_AUXILIARY2)) ;; "measured at screening (Visit 1)"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: To be included, the patient must have a measured post-albuterol FEV1/FVC ratio ≤ 0.70 at screening (Visit 1)
;; OR a measured post-salbutamol FEV1/FVC ratio ≤ 0.70 at screening (Visit 1).
(assert
  (! (or
        (and patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_post_albuterol
             patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_at_screening_visit_1
             (<= patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio 0.70))
        (and patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_post_salbutamol
             patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_at_screening_visit_1
             (<= patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio 0.70))
     )
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a measured post-albuterol FEV1/FVC ratio ≤ 0.70 at screening (Visit 1) or a measured post-salbutamol FEV1/FVC ratio ≤ 0.70 at screening (Visit 1)."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's FEV1 as a percent of predicted is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's FEV1 as a percent of predicted, measured now."} ;; "measured post-albuterol forced expiratory volume in 1 second greater than or equal to 50 percent and less than or equal to 70 percent of predicted normal values calculated using National Health and Nutrition Examination Survey III reference equations at screening (Visit 1) or a measured post-salbutamol forced expiratory volume in 1 second greater than or equal to 50 percent and less than or equal to 70 percent of predicted normal values calculated using National Health and Nutrition Examination Survey III reference equations at screening (Visit 1)."
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_post_albuterol Bool) ;; {"when_to_set_to_true":"Set to true if the FEV1 % predicted measurement was taken post-albuterol.","when_to_set_to_false":"Set to false if the FEV1 % predicted measurement was not taken post-albuterol.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken post-albuterol.","meaning":"Boolean indicating whether the FEV1 % predicted measurement was taken post-albuterol."} ;; "measured post-albuterol"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_post_salbutamol Bool) ;; {"when_to_set_to_true":"Set to true if the FEV1 % predicted measurement was taken post-salbutamol.","when_to_set_to_false":"Set to false if the FEV1 % predicted measurement was not taken post-salbutamol.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken post-salbutamol.","meaning":"Boolean indicating whether the FEV1 % predicted measurement was taken post-salbutamol."} ;; "measured post-salbutamol"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_at_screening_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the FEV1 % predicted measurement was taken at screening (Visit 1).","when_to_set_to_false":"Set to false if the FEV1 % predicted measurement was not taken at screening (Visit 1).","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken at screening (Visit 1).","meaning":"Boolean indicating whether the FEV1 % predicted measurement was taken at screening (Visit 1)."} ;; "measured at screening (Visit 1)"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@calculated_using_nhanes_iii_reference_equations Bool) ;; {"when_to_set_to_true":"Set to true if the predicted normal values for FEV1 % were calculated using NHANES III reference equations.","when_to_set_to_false":"Set to false if the predicted normal values were not calculated using NHANES III reference equations.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether NHANES III reference equations were used.","meaning":"Boolean indicating whether the predicted normal values for FEV1 % were calculated using NHANES III reference equations."} ;; "calculated using National Health and Nutrition Examination Survey III reference equations"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; The post-albuterol FEV1% measurement at screening using NHANES III reference equations implies all qualifiers are true
(assert
  (! (=> (and patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_post_albuterol
              patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_at_screening_visit_1
              patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@calculated_using_nhanes_iii_reference_equations)
         true)
     :named REQ9_AUXILIARY0)) ;; "measured post-albuterol forced expiratory volume in 1 second ... at screening (Visit 1) ... calculated using National Health and Nutrition Examination Survey III reference equations"

;; The post-salbutamol FEV1% measurement at screening using NHANES III reference equations implies all qualifiers are true
(assert
  (! (=> (and patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_post_salbutamol
              patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_at_screening_visit_1
              patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@calculated_using_nhanes_iii_reference_equations)
         true)
     :named REQ9_AUXILIARY1)) ;; "measured post-salbutamol forced expiratory volume in 1 second ... at screening (Visit 1) ... calculated using National Health and Nutrition Examination Survey III reference equations"

;; ===================== Constraint Assertions (REQ 9) =====================
;; The patient must have either a qualifying post-albuterol or post-salbutamol FEV1% at screening (Visit 1) using NHANES III reference equations, and the value must be >=50 and <=70
(assert
  (! (or
        (and patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_post_albuterol
             patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_at_screening_visit_1
             patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@calculated_using_nhanes_iii_reference_equations
             (>= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent 50.0)
             (<= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent 70.0))
        (and patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_post_salbutamol
             patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@measured_at_screening_visit_1
             patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent@@calculated_using_nhanes_iii_reference_equations
             (>= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent 50.0)
             (<= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent 70.0)))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a measured post-albuterol forced expiratory volume in 1 second greater than or equal to 50 percent and less than or equal to 70 percent of predicted normal values calculated using National Health and Nutrition Examination Survey III reference equations at screening (Visit 1) or a measured post-salbutamol forced expiratory volume in 1 second greater than or equal to 50 percent and less than or equal to 70 percent of predicted normal values calculated using National Health and Nutrition Examination Survey III reference equations at screening (Visit 1)."

;; ===================== Declarations for the inclusion criterion (REQ 10) =====================
(declare-const patient_has_undergone_post_bronchodilator_spirometry_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone post-bronchodilator spirometry at the present time, regardless of the specific medication or timing details.","when_to_set_to_false":"Set to false if the patient has not undergone post-bronchodilator spirometry at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone post-bronchodilator spirometry at the present time.","meaning":"Boolean indicating whether the patient has undergone post-bronchodilator spirometry at the present time."} ;; "post-bronchodilator spirometry performed"
(declare-const patient_has_undergone_post_bronchodilator_spirometry_now@@performed_approximately_15_minutes_after_self_administering_4_inhalations_400_micrograms_of_albuterol_or_salbutamol_via_metered_dose_inhaler_with_valved_holding_chamber Bool) ;; {"when_to_set_to_true":"Set to true if the post-bronchodilator spirometry was performed approximately 15 minutes after the patient self-administered 4 inhalations (total 400 micrograms) of albuterol or salbutamol via a metered dose inhaler with a valved-holding chamber.","when_to_set_to_false":"Set to false if the post-bronchodilator spirometry was not performed under these medication, dose, device, and timing conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the post-bronchodilator spirometry was performed under these conditions.","meaning":"Boolean indicating whether the post-bronchodilator spirometry was performed approximately 15 minutes after self-administration of 4 inhalations (400 mcg) of albuterol or salbutamol via a metered dose inhaler with a valved-holding chamber."} ;; "performed approximately 15 minutes after self-administering (4 inhalations (total 400 micrograms) of albuterol via a metered dose inhaler with a valved-holding chamber OR 4 inhalations (total 400 micrograms) of salbutamol via a metered dose inhaler with a valved-holding chamber)"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_post_bronchodilator_spirometry_now@@performed_approximately_15_minutes_after_self_administering_4_inhalations_400_micrograms_of_albuterol_or_salbutamol_via_metered_dose_inhaler_with_valved_holding_chamber
         patient_has_undergone_post_bronchodilator_spirometry_now)
     :named REQ10_AUXILIARY0)) ;; "performed approximately 15 minutes after self-administering (4 inhalations (total 400 micrograms) of albuterol via a metered dose inhaler with a valved-holding chamber OR 4 inhalations (total 400 micrograms) of salbutamol via a metered dose inhaler with a valved-holding chamber)"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: post-bronchodilator spirometry performed under specified conditions
(assert
  (! patient_has_undergone_post_bronchodilator_spirometry_now@@performed_approximately_15_minutes_after_self_administering_4_inhalations_400_micrograms_of_albuterol_or_salbutamol_via_metered_dose_inhaler_with_valved_holding_chamber
     :named REQ10_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "post-bronchodilator spirometry performed approximately 15 minutes after self-administering (4 inhalations (total 400 micrograms) of albuterol via a metered dose inhaler with a valved-holding chamber OR 4 inhalations (total 400 micrograms) of salbutamol via a metered dose inhaler with a valved-holding chamber)"

;; Component 1: forced expiratory volume in 1 second/forced vital capacity ratio calculated
(assert
  (! (or (= patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio)
         (= patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio))
     :named REQ10_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "forced expiratory volume in 1 second/forced vital capacity ratio calculated"

;; Component 2: forced expiratory volume in 1 second percent predicted value calculated
(assert
  (! (or (= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent)
         (= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent))
     :named REQ10_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "forced expiratory volume in 1 second percent predicted value calculated"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_medical_research_council_dyspnoea_scale_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured numeric score if the patient's modified Medical Research Council dyspnea scale score is recorded at Visit 1.","when_to_set_to_null":"Set to null if no such score is recorded at Visit 1 or the value is indeterminate.","meaning":"Numeric value representing the patient's score on the modified Medical Research Council dyspnea scale as measured at Visit 1."} ;; "To be included, the patient must score greater than or equal to 2 on the modified Medical Research Council dyspnea scale at Visit 1."

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (>= patient_medical_research_council_dyspnoea_scale_score_value_recorded_now_withunit_score 2)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must score greater than or equal to 2 on the modified Medical Research Council dyspnea scale at Visit 1."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of stroke.","when_to_set_to_false":"Set to false if the patient does not have a history of stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of stroke.","meaning":"Boolean indicating whether the patient has a history of stroke."} ;; "previous stroke"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coronary artery disease.","meaning":"Boolean indicating whether the patient currently has coronary artery disease."} ;; "established coronary artery disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@established Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery disease is established.","when_to_set_to_false":"Set to false if the patient's coronary artery disease is not established.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery disease is established.","meaning":"Boolean indicating whether the patient's coronary artery disease is established."} ;; "established coronary artery disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@confirmed_by_clinical_signs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery disease is confirmed by clinical signs.","when_to_set_to_false":"Set to false if the patient's coronary artery disease is not confirmed by clinical signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery disease is confirmed by clinical signs.","meaning":"Boolean indicating whether the patient's coronary artery disease is confirmed by clinical signs."} ;; "established coronary artery disease by clinical signs"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@confirmed_by_imaging_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery disease is confirmed by imaging studies.","when_to_set_to_false":"Set to false if the patient's coronary artery disease is not confirmed by imaging studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery disease is confirmed by imaging studies.","meaning":"Boolean indicating whether the patient's coronary artery disease is confirmed by imaging studies."} ;; "established coronary artery disease by imaging studies"
(declare-const patient_has_finding_of_peripheral_vascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral vascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have peripheral vascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral vascular disease.","meaning":"Boolean indicating whether the patient currently has peripheral vascular disease."} ;; "established peripheral vascular disease"
(declare-const patient_has_finding_of_peripheral_vascular_disease_now@@established Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peripheral vascular disease is established.","when_to_set_to_false":"Set to false if the patient's peripheral vascular disease is not established.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's peripheral vascular disease is established.","meaning":"Boolean indicating whether the patient's peripheral vascular disease is established."} ;; "established peripheral vascular disease"
(declare-const patient_has_finding_of_peripheral_vascular_disease_now@@confirmed_by_clinical_signs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peripheral vascular disease is confirmed by clinical signs.","when_to_set_to_false":"Set to false if the patient's peripheral vascular disease is not confirmed by clinical signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's peripheral vascular disease is confirmed by clinical signs.","meaning":"Boolean indicating whether the patient's peripheral vascular disease is confirmed by clinical signs."} ;; "established peripheral vascular disease by clinical signs"
(declare-const patient_has_finding_of_peripheral_vascular_disease_now@@confirmed_by_imaging_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peripheral vascular disease is confirmed by imaging studies.","when_to_set_to_false":"Set to false if the patient's peripheral vascular disease is not confirmed by imaging studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's peripheral vascular disease is confirmed by imaging studies.","meaning":"Boolean indicating whether the patient's peripheral vascular disease is confirmed by imaging studies."} ;; "established peripheral vascular disease by imaging studies"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of myocardial infarction.","when_to_set_to_false":"Set to false if the patient does not have a history of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of myocardial infarction.","meaning":"Boolean indicating whether the patient has a history of myocardial infarction."} ;; "previous myocardial infarction"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_finding_of_diabetes_mellitus_now@@accompanied_by_target_organ_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diabetes mellitus is accompanied by target organ disease.","when_to_set_to_false":"Set to false if the patient's diabetes mellitus is not accompanied by target organ disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diabetes mellitus is accompanied by target organ disease.","meaning":"Boolean indicating whether the patient's diabetes mellitus is accompanied by target organ disease."} ;; "diabetes mellitus with target organ disease"
;; patient_age_value_recorded_now_in_years is already declared and reusable

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@established
         patient_has_finding_of_coronary_arteriosclerosis_now)
     :named REQ12_AUXILIARY0)) ;; "established coronary artery disease"

(assert
  (! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@confirmed_by_clinical_signs
         patient_has_finding_of_coronary_arteriosclerosis_now)
     :named REQ12_AUXILIARY1)) ;; "established coronary artery disease by clinical signs"

(assert
  (! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@confirmed_by_imaging_studies
         patient_has_finding_of_coronary_arteriosclerosis_now)
     :named REQ12_AUXILIARY2)) ;; "established coronary artery disease by imaging studies"

(assert
  (! (=> patient_has_finding_of_peripheral_vascular_disease_now@@established
         patient_has_finding_of_peripheral_vascular_disease_now)
     :named REQ12_AUXILIARY3)) ;; "established peripheral vascular disease"

(assert
  (! (=> patient_has_finding_of_peripheral_vascular_disease_now@@confirmed_by_clinical_signs
         patient_has_finding_of_peripheral_vascular_disease_now)
     :named REQ12_AUXILIARY4)) ;; "established peripheral vascular disease by clinical signs"

(assert
  (! (=> patient_has_finding_of_peripheral_vascular_disease_now@@confirmed_by_imaging_studies
         patient_has_finding_of_peripheral_vascular_disease_now)
     :named REQ12_AUXILIARY5)) ;; "established peripheral vascular disease by imaging studies"

(assert
  (! (=> patient_has_finding_of_diabetes_mellitus_now@@accompanied_by_target_organ_disease
         patient_has_finding_of_diabetes_mellitus_now)
     :named REQ12_AUXILIARY6)) ;; "diabetes mellitus with target organ disease"

;; ===================== Constraint Assertions (REQ 12) =====================
;; If the patient is aged >= 40 years, then at least one of the following must be true:
;; (established coronary artery disease by clinical signs OR established coronary artery disease by imaging studies OR established peripheral vascular disease by clinical signs OR established peripheral vascular disease by imaging studies OR previous stroke OR previous myocardial infarction OR diabetes mellitus with target organ disease)
(assert
  (! (or (not (>= patient_age_value_recorded_now_in_years 40))
         (or patient_has_finding_of_coronary_arteriosclerosis_now@@confirmed_by_clinical_signs
             patient_has_finding_of_coronary_arteriosclerosis_now@@confirmed_by_imaging_studies
             patient_has_finding_of_peripheral_vascular_disease_now@@confirmed_by_clinical_signs
             patient_has_finding_of_peripheral_vascular_disease_now@@confirmed_by_imaging_studies
             patient_has_finding_of_cerebrovascular_accident_inthehistory
             patient_has_finding_of_myocardial_infarction_inthehistory
             patient_has_finding_of_diabetes_mellitus_now@@accompanied_by_target_organ_disease))
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, if the patient is aged greater than or equal to 40 years, the patient must have at least one of the following: (established coronary artery disease by clinical signs OR established coronary artery disease by imaging studies OR established peripheral vascular disease by clinical signs OR established peripheral vascular disease by imaging studies OR previous stroke OR previous myocardial infarction OR diabetes mellitus with target organ disease)."

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const patient_count_of_being_treated_for_hypercholesterolemia_or_hypertension_or_diabetes_mellitus_or_peripheral_vascular_disease_now Real) ;; {"when_to_set_to_value":"Set to the number of conditions (from hypercholesterolemia, hypertension, diabetes mellitus, peripheral vascular disease) for which the patient is currently being treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined for how many of these conditions the patient is currently being treated.","meaning":"Numeric count of conditions for which the patient is currently being treated among hypercholesterolemia, hypertension, diabetes mellitus, or peripheral vascular disease."} ;; "the patient must have at least two of the following: (being treated for hypercholesterolemia OR being treated for hypertension OR being treated for diabetes mellitus OR being treated for peripheral vascular disease)"

(declare-const patient_has_finding_of_hypercholesterolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypercholesterolemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypercholesterolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypercholesterolemia.","meaning":"Boolean indicating whether the patient currently has hypercholesterolemia."} ;; "being treated for hypercholesterolemia"
(declare-const patient_has_finding_of_hypercholesterolemia_now@@being_treated_for Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypercholesterolemia and is being treated for it.","when_to_set_to_false":"Set to false if the patient currently has hypercholesterolemia but is not being treated for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is being treated for hypercholesterolemia.","meaning":"Boolean indicating whether the patient with hypercholesterolemia is being treated for it."} ;; "being treated for hypercholesterolemia"

(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has hypertensive disorder (hypertension)."} ;; "being treated for hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@being_treated_for Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertensive disorder (hypertension) and is being treated for it.","when_to_set_to_false":"Set to false if the patient currently has hypertensive disorder (hypertension) but is not being treated for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is being treated for hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient with hypertensive disorder (hypertension) is being treated for it."} ;; "being treated for hypertension"

(declare-const patient_has_finding_of_diabetes_mellitus_now@@being_treated_for Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus and is being treated for it.","when_to_set_to_false":"Set to false if the patient currently has diabetes mellitus but is not being treated for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is being treated for diabetes mellitus.","meaning":"Boolean indicating whether the patient with diabetes mellitus is being treated for it."} ;; "being treated for diabetes mellitus"

(declare-const patient_has_finding_of_peripheral_vascular_disease_now@@being_treated_for Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral vascular disease and is being treated for it.","when_to_set_to_false":"Set to false if the patient currently has peripheral vascular disease but is not being treated for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is being treated for peripheral vascular disease.","meaning":"Boolean indicating whether the patient with peripheral vascular disease is being treated for it."} ;; "being treated for peripheral vascular disease"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; The count variable is defined as the sum of the four "being treated for" conditions
(assert
  (! (= patient_count_of_being_treated_for_hypercholesterolemia_or_hypertension_or_diabetes_mellitus_or_peripheral_vascular_disease_now
        (+ (ite patient_has_finding_of_hypercholesterolemia_now@@being_treated_for 1 0)
           (ite patient_has_finding_of_hypertensive_disorder_now@@being_treated_for 1 0)
           (ite patient_has_finding_of_diabetes_mellitus_now@@being_treated_for 1 0)
           (ite patient_has_finding_of_peripheral_vascular_disease_now@@being_treated_for 1 0)))
     :named REQ13_AUXILIARY0)) ;; "the patient must have at least two of the following: (being treated for hypercholesterolemia OR being treated for hypertension OR being treated for diabetes mellitus OR being treated for peripheral vascular disease)"

;; Qualifier variables imply the corresponding stem variable
(assert
  (! (=> patient_has_finding_of_hypercholesterolemia_now@@being_treated_for
         patient_has_finding_of_hypercholesterolemia_now)
     :named REQ13_AUXILIARY1)) ;; "being treated for hypercholesterolemia"

(assert
  (! (=> patient_has_finding_of_hypertensive_disorder_now@@being_treated_for
         patient_has_finding_of_hypertensive_disorder_now)
     :named REQ13_AUXILIARY2)) ;; "being treated for hypertension"

;; ===================== Constraint Assertions (REQ 13) =====================
;; If the patient is aged >= 60 years, then must be treated for at least two of the four conditions
(assert
  (! (or (< patient_age_value_recorded_now_in_years 60)
         (>= patient_count_of_being_treated_for_hypercholesterolemia_or_hypertension_or_diabetes_mellitus_or_peripheral_vascular_disease_now 2))
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is aged greater than or equal to 60 years, the patient must have at least two of the following: (being treated for hypercholesterolemia OR being treated for hypertension OR being treated for diabetes mellitus OR being treated for peripheral vascular disease)"
