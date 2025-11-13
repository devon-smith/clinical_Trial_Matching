;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pulmonary_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary impairment.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary impairment.","meaning":"Boolean indicating whether the patient currently has pulmonary impairment."} ;; "pulmonary impairment"
(declare-const patient_has_finding_of_pulmonary_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pulmonary impairment would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival.","when_to_set_to_false":"Set to false if the patient's current pulmonary impairment would not limit the patient's ability to receive cytoreductive therapy and would not compromise the patient's survival.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pulmonary impairment would limit the ability to receive cytoreductive therapy and compromise survival.","meaning":"Boolean indicating whether the patient's current pulmonary impairment would limit the ability to receive cytoreductive therapy and compromise survival."} ;; "pulmonary impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival"

(declare-const patient_has_finding_of_cardiac_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiac impairment.","when_to_set_to_false":"Set to false if the patient currently does not have cardiac impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiac impairment.","meaning":"Boolean indicating whether the patient currently has cardiac impairment."} ;; "cardiac impairment"
(declare-const patient_has_finding_of_cardiac_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac impairment would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival.","when_to_set_to_false":"Set to false if the patient's current cardiac impairment would not limit the patient's ability to receive cytoreductive therapy and would not compromise the patient's survival.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac impairment would limit the ability to receive cytoreductive therapy and compromise survival.","meaning":"Boolean indicating whether the patient's current cardiac impairment would limit the ability to receive cytoreductive therapy and compromise survival."} ;; "cardiac impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival"

(declare-const patient_has_finding_of_hepatic_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic impairment.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic impairment.","meaning":"Boolean indicating whether the patient currently has hepatic impairment."} ;; "hepatic impairment"
(declare-const patient_has_finding_of_hepatic_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hepatic impairment would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival.","when_to_set_to_false":"Set to false if the patient's current hepatic impairment would not limit the patient's ability to receive cytoreductive therapy and would not compromise the patient's survival.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hepatic impairment would limit the ability to receive cytoreductive therapy and compromise survival.","meaning":"Boolean indicating whether the patient's current hepatic impairment would limit the ability to receive cytoreductive therapy and compromise survival."} ;; "hepatic impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival"

(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"
(declare-const patient_has_finding_of_renal_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal impairment would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival.","when_to_set_to_false":"Set to false if the patient's current renal impairment would not limit the patient's ability to receive cytoreductive therapy and would not compromise the patient's survival.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal impairment would limit the ability to receive cytoreductive therapy and compromise survival.","meaning":"Boolean indicating whether the patient's current renal impairment would limit the ability to receive cytoreductive therapy and compromise survival."} ;; "renal impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_pulmonary_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival
      patient_has_finding_of_pulmonary_impairment_now)
:named REQ0_AUXILIARY0)) ;; "pulmonary impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival"

(assert
(! (=> patient_has_finding_of_cardiac_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival
      patient_has_finding_of_cardiac_impairment_now)
:named REQ0_AUXILIARY1)) ;; "cardiac impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival"

(assert
(! (=> patient_has_finding_of_hepatic_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival
      patient_has_finding_of_hepatic_impairment_now)
:named REQ0_AUXILIARY2)) ;; "hepatic impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival"

(assert
(! (=> patient_has_finding_of_renal_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival
      patient_has_finding_of_renal_impairment_now)
:named REQ0_AUXILIARY3)) ;; "renal impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_pulmonary_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival."

(assert
(! (not patient_has_finding_of_cardiac_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiac impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival."

(assert
(! (not patient_has_finding_of_hepatic_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival."

(assert
(! (not patient_has_finding_of_renal_impairment_now@@limits_ability_to_receive_cytoreductive_therapy_and_compromises_survival)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal impairment that would limit the patient's ability to receive cytoreductive therapy and compromise the patient's survival."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_decreased_respiratory_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased respiratory function (pulmonary dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased respiratory function (pulmonary dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased respiratory function (pulmonary dysfunction).","meaning":"Boolean indicating whether the patient currently has decreased respiratory function (pulmonary dysfunction)."} ;; "pulmonary dysfunction"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_decreased_respiratory_function_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary dysfunction as defined by the subsequent criteria."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const hemoglobin_corrected_diffusing_capacity_of_lung_for_carbon_monoxide_value_recorded_at_baseline_screening_visit_in_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the value measured for the patient's hemoglobin-corrected diffusing capacity of the lung for carbon monoxide at the Baseline Screening visit, in percent of predicted.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined at the Baseline Screening visit.","meaning":"Numeric value for hemoglobin-corrected diffusing capacity of the lung for carbon monoxide at Baseline Screening visit, in percent of predicted."} ;; "hemoglobin-corrected diffusing capacity of the lung for carbon monoxide < 40 percent of predicted at the Baseline Screening visit"

(declare-const forced_vital_capacity_value_recorded_at_baseline_screening_visit_in_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the value measured for the patient's forced vital capacity at the Baseline Screening visit, in percent of predicted.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined at the Baseline Screening visit.","meaning":"Numeric value for forced vital capacity at Baseline Screening visit, in percent of predicted."} ;; "forced vital capacity < 45 percent of predicted at the Baseline Screening visit"

(declare-const patient_has_finding_of_decreased_respiratory_function_now@@present_at_baseline_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has decreased respiratory function (pulmonary dysfunction) and this finding is present at the Baseline Screening visit.","when_to_set_to_false":"Set to false if the patient currently has decreased respiratory function (pulmonary dysfunction) but it is not present at the Baseline Screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is present at the Baseline Screening visit.","meaning":"Boolean indicating whether the patient's decreased respiratory function (pulmonary dysfunction) is present at the Baseline Screening visit."} ;; "severe pulmonary dysfunction ... at the Baseline Screening visit"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: severe pulmonary dysfunction at Baseline Screening visit with hemoglobin-corrected DLCO < 40% of predicted
(assert
(! (= (and patient_has_finding_of_decreased_respiratory_function_now@@present_at_baseline_screening_visit
           (< hemoglobin_corrected_diffusing_capacity_of_lung_for_carbon_monoxide_value_recorded_at_baseline_screening_visit_in_percent_of_predicted 40))
      patient_has_finding_of_decreased_respiratory_function_now@@present_at_baseline_screening_visit)
:named REQ2_AUXILIARY0)) ;; "severe pulmonary dysfunction with (hemoglobin-corrected diffusing capacity of the lung for carbon monoxide < 40 percent of predicted at the Baseline Screening visit)"

;; Definition: severe pulmonary dysfunction at Baseline Screening visit with forced vital capacity < 45% of predicted
(assert
(! (= (and patient_has_finding_of_decreased_respiratory_function_now@@present_at_baseline_screening_visit
           (< forced_vital_capacity_value_recorded_at_baseline_screening_visit_in_percent_of_predicted 45))
      patient_has_finding_of_decreased_respiratory_function_now@@present_at_baseline_screening_visit)
:named REQ2_AUXILIARY1)) ;; "severe pulmonary dysfunction with (forced vital capacity < 45 percent of predicted at the Baseline Screening visit)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have severe pulmonary dysfunction with either criterion at Baseline Screening visit
(assert
(! (not (or
         (and patient_has_finding_of_decreased_respiratory_function_now@@present_at_baseline_screening_visit
              (< hemoglobin_corrected_diffusing_capacity_of_lung_for_carbon_monoxide_value_recorded_at_baseline_screening_visit_in_percent_of_predicted 40))
         (and patient_has_finding_of_decreased_respiratory_function_now@@present_at_baseline_screening_visit
              (< forced_vital_capacity_value_recorded_at_baseline_screening_visit_in_percent_of_predicted 45))))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has severe pulmonary dysfunction with (hemoglobin-corrected diffusing capacity of the lung for carbon monoxide < 40 percent of predicted at the Baseline Screening visit)) OR (the patient has severe pulmonary dysfunction with (forced vital capacity < 45 percent of predicted at the Baseline Screening visit)))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_measurement_of_partial_pressure_of_oxygen_in_blood_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's partial pressure of oxygen in blood is recorded now in mmHg.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current partial pressure of oxygen in blood in mmHg."} ;; "partial pressure of oxygen < 70 mmHg without supplemental oxygen"
(declare-const patient_measurement_of_partial_pressure_of_oxygen_in_blood_value_recorded_now_withunit_mmhg@@measured_without_supplemental_oxygen Bool) ;; {"when_to_set_to_true":"Set to true if the measurement of partial pressure of oxygen in blood was performed without supplemental oxygen.","when_to_set_to_false":"Set to false if the measurement was performed with supplemental oxygen.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether supplemental oxygen was used during measurement.","meaning":"Boolean indicating whether the measurement of partial pressure of oxygen in blood was performed without supplemental oxygen."} ;; "partial pressure of oxygen < 70 mmHg without supplemental oxygen"
(declare-const patient_carbon_dioxide_measurement_partial_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's partial pressure of carbon dioxide in blood is recorded now in mmHg.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current partial pressure of carbon dioxide in blood in mmHg."} ;; "partial pressure of carbon dioxide ≥ 45 mmHg without supplemental oxygen"
(declare-const patient_carbon_dioxide_measurement_partial_pressure_value_recorded_now_withunit_mmhg@@measured_without_supplemental_oxygen Bool) ;; {"when_to_set_to_true":"Set to true if the measurement of partial pressure of carbon dioxide in blood was performed without supplemental oxygen.","when_to_set_to_false":"Set to false if the measurement was performed with supplemental oxygen.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether supplemental oxygen was used during measurement.","meaning":"Boolean indicating whether the measurement of partial pressure of carbon dioxide in blood was performed without supplemental oxygen."} ;; "partial pressure of carbon dioxide ≥ 45 mmHg without supplemental oxygen"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and
           patient_measurement_of_partial_pressure_of_oxygen_in_blood_value_recorded_now_withunit_mmhg@@measured_without_supplemental_oxygen
           (< patient_measurement_of_partial_pressure_of_oxygen_in_blood_value_recorded_now_withunit_mmhg 70)))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has partial pressure of oxygen < 70 mmHg without supplemental oxygen."

(assert
(! (not (and
           patient_carbon_dioxide_measurement_partial_pressure_value_recorded_now_withunit_mmhg@@measured_without_supplemental_oxygen
           (>= patient_carbon_dioxide_measurement_partial_pressure_value_recorded_now_withunit_mmhg 45)))
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has partial pressure of carbon dioxide ≥ 45 mmHg without supplemental oxygen."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's hemoglobin saturation with oxygen (oxygen saturation) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current hemoglobin saturation with oxygen (oxygen saturation)."} ;; "oxygen saturation < 92 percent at rest without supplemental oxygen as measured by forehead pulse oximeter"

(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_at_rest Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken while the patient was at rest.","when_to_set_to_false":"Set to false if the measurement was not taken at rest.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was taken at rest.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken at rest."} ;; "at rest"

(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_without_supplemental_oxygen Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken without supplemental oxygen.","when_to_set_to_false":"Set to false if the measurement was taken with supplemental oxygen.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was taken without supplemental oxygen.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken without supplemental oxygen."} ;; "without supplemental oxygen"

(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_by_forehead_pulse_oximeter Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken using a forehead pulse oximeter.","when_to_set_to_false":"Set to false if the measurement was not taken using a forehead pulse oximeter.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was taken using a forehead pulse oximeter.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken using a forehead pulse oximeter."} ;; "as measured by forehead pulse oximeter"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not (and
            (< patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 92)
            patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_at_rest
            patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_without_supplemental_oxygen
            patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_by_forehead_pulse_oximeter
          ))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has oxygen saturation < 92 percent at rest without supplemental oxygen as measured by forehead pulse oximeter."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_pulmonary_arterial_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary arterial hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary arterial hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pulmonary arterial hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary arterial hypertension."} ;; "pulmonary artery hypertension"
(declare-const patient_has_finding_of_pulmonary_arterial_hypertension_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary arterial hypertension meets the definition of being significant as per subsequent criteria.","when_to_set_to_false":"Set to false if the patient's pulmonary arterial hypertension does not meet the definition of being significant as per subsequent criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary arterial hypertension is significant.","meaning":"Boolean indicating whether the patient's pulmonary arterial hypertension is significant as defined by subsequent criteria."} ;; "significant pulmonary artery hypertension as defined by the subsequent criteria"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_pulmonary_arterial_hypertension_now@@is_significant
      patient_has_finding_of_pulmonary_arterial_hypertension_now)
:named REQ5_AUXILIARY0)) ;; "significant pulmonary artery hypertension as defined by the subsequent criteria"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_pulmonary_arterial_hypertension_now@@is_significant)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant pulmonary artery hypertension as defined by the subsequent criteria."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_documentation_of_normal_right_atrium_septum_shape_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation that the patient currently has normal right atrium septum shape.","when_to_set_to_false":"Set to false if there is documentation that the patient currently does not have normal right atrium septum shape.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal right atrium septum shape.","meaning":"Boolean indicating whether the patient currently has documentation of normal right atrium septum shape."} ;; "normal right atrium septum shape"
(declare-const patient_has_documentation_of_normal_right_atrium_shape_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation that the patient currently has normal right atrium shape.","when_to_set_to_false":"Set to false if there is documentation that the patient currently does not have normal right atrium shape.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal right atrium shape.","meaning":"Boolean indicating whether the patient currently has documentation of normal right atrium shape."} ;; "normal right atrium shape"
(declare-const patient_has_documentation_of_normal_right_atrium_size_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation that the patient currently has normal right atrium size.","when_to_set_to_false":"Set to false if there is documentation that the patient currently does not have normal right atrium size.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal right atrium size.","meaning":"Boolean indicating whether the patient currently has documentation of normal right atrium size."} ;; "normal right atrium size"
(declare-const patient_has_documentation_of_normal_right_atrium_wall_thickness_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation that the patient currently has normal right atrium wall thickness.","when_to_set_to_false":"Set to false if there is documentation that the patient currently does not have normal right atrium wall thickness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal right atrium wall thickness.","meaning":"Boolean indicating whether the patient currently has documentation of normal right atrium wall thickness."} ;; "normal right atrium wall thickness"
(declare-const patient_has_documentation_of_normal_right_ventricle_septum_shape_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation that the patient currently has normal right ventricle septum shape.","when_to_set_to_false":"Set to false if there is documentation that the patient currently does not have normal right ventricle septum shape.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal right ventricle septum shape.","meaning":"Boolean indicating whether the patient currently has documentation of normal right ventricle septum shape."} ;; "normal right ventricle septum shape"
(declare-const patient_has_documentation_of_normal_right_ventricle_shape_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation that the patient currently has normal right ventricle shape.","when_to_set_to_false":"Set to false if there is documentation that the patient currently does not have normal right ventricle shape.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal right ventricle shape.","meaning":"Boolean indicating whether the patient currently has documentation of normal right ventricle shape."} ;; "normal right ventricle shape"
(declare-const patient_has_documentation_of_normal_right_ventricle_size_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation that the patient currently has normal right ventricle size.","when_to_set_to_false":"Set to false if there is documentation that the patient currently does not have normal right ventricle size.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal right ventricle size.","meaning":"Boolean indicating whether the patient currently has documentation of normal right ventricle size."} ;; "normal right ventricle size"
(declare-const patient_has_documentation_of_normal_right_ventricle_wall_thickness_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation that the patient currently has normal right ventricle wall thickness.","when_to_set_to_false":"Set to false if there is documentation that the patient currently does not have normal right ventricle wall thickness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal right ventricle wall thickness.","meaning":"Boolean indicating whether the patient currently has documentation of normal right ventricle wall thickness."} ;; "normal right ventricle wall thickness"
(declare-const patient_has_undergone_catheterization_of_right_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone right heart catheterization now.","when_to_set_to_false":"Set to false if the patient has not undergone right heart catheterization now.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient has undergone right heart catheterization now.","meaning":"Boolean indicating whether the patient has undergone right heart catheterization now."} ;; "right heart catheterization"
(declare-const patient_has_undergone_catheterization_of_right_heart_now@@shows_mean_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg_at_rest Bool) ;; {"when_to_set_to_true":"Set to true if the right heart catheterization provides a mean pulmonary artery pressure value at rest (in mmHg).","when_to_set_to_false":"Set to false if the right heart catheterization does not provide a mean pulmonary artery pressure value at rest.","when_to_set_to_null":"Set to null if it is unknown whether the right heart catheterization provides a mean pulmonary artery pressure value at rest.","meaning":"Boolean indicating whether the right heart catheterization provides a mean pulmonary artery pressure value at rest (in mmHg)."} ;; "mean pulmonary artery pressure < 30 mmHg at rest by right heart catheterization"
(declare-const patient_has_undergone_catheterization_of_right_heart_now@@shows_peak_systolic_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg Bool) ;; {"when_to_set_to_true":"Set to true if the right heart catheterization provides a peak systolic pulmonary artery pressure value (in mmHg).","when_to_set_to_false":"Set to false if the right heart catheterization does not provide a peak systolic pulmonary artery pressure value.","when_to_set_to_null":"Set to null if it is unknown whether the right heart catheterization provides a peak systolic pulmonary artery pressure value.","meaning":"Boolean indicating whether the right heart catheterization provides a peak systolic pulmonary artery pressure value (in mmHg)."} ;; "peak systolic pulmonary artery pressure < 45 mmHg by right heart catheterization"
(declare-const patient_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value (in mmHg) if the patient's pulmonary artery pressure is recorded now by resting echocardiogram.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value (mmHg) of the patient's pulmonary artery pressure measured now."} ;; "pulmonary artery pressure value"
(declare-const patient_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg@@measured_by_resting_echocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the value is measured by resting echocardiogram.","when_to_set_to_false":"Set to false if the value is not measured by resting echocardiogram.","when_to_set_to_null":"Set to null if it is unknown whether the value is measured by resting echocardiogram.","meaning":"Boolean indicating whether the value is measured by resting echocardiogram."} ;; "by resting echocardiogram"
(declare-const patient_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg@@peak_systolic Bool) ;; {"when_to_set_to_true":"Set to true if the value represents the peak systolic pulmonary artery pressure.","when_to_set_to_false":"Set to false if the value does not represent the peak systolic pulmonary artery pressure.","when_to_set_to_null":"Set to null if it is unknown whether the value represents the peak systolic pulmonary artery pressure.","meaning":"Boolean indicating whether the value is the peak systolic pulmonary artery pressure."} ;; "peak systolic pulmonary artery pressure"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Documentation of all normal right atrium and right ventricle features
(assert
(! (= patient_has_finding_of_pulmonary_arterial_hypertension_now@@is_significant
(and
  (> patient_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg 50)
  patient_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg@@peak_systolic
  patient_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg@@measured_by_resting_echocardiogram
  (not (and
    patient_has_documentation_of_normal_right_atrium_size_now
    patient_has_documentation_of_normal_right_atrium_shape_now
    patient_has_documentation_of_normal_right_atrium_wall_thickness_now
    patient_has_documentation_of_normal_right_atrium_septum_shape_now
    patient_has_documentation_of_normal_right_ventricle_size_now
    patient_has_documentation_of_normal_right_ventricle_shape_now
    patient_has_documentation_of_normal_right_ventricle_wall_thickness_now
    patient_has_documentation_of_normal_right_ventricle_septum_shape_now
  ))
  (not (and
    patient_has_undergone_catheterization_of_right_heart_now
    (or
      (and
        patient_has_undergone_catheterization_of_right_heart_now@@shows_mean_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg_at_rest
        (< patient_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg 30)
      )
      (and
        patient_has_undergone_catheterization_of_right_heart_now@@shows_peak_systolic_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg
        (< patient_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg 45)
      )
    )
  ))
))
:named REQ6_AUXILIARY0)) ;; "The patient is excluded if ((the patient has peak systolic pulmonary artery pressure > 50 mmHg by resting echocardiogram) AND (the patient does NOT have documentation of (normal right atrium size AND normal right atrium shape AND normal right atrium wall thickness AND normal right atrium septum shape AND normal right ventricle size AND normal right ventricle shape AND normal right ventricle wall thickness AND normal right ventricle septum shape) to rule out pulmonary artery hypertension) AND (unless right heart catheterization shows (mean pulmonary artery pressure < 30 mmHg at rest OR peak systolic pulmonary artery pressure < 45 mmHg), in which case the patient is NOT excluded))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg@@peak_systolic
      true)
:named REQ6_AUXILIARY1)) ;; "peak systolic pulmonary artery pressure"

(assert
(! (=> patient_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg@@measured_by_resting_echocardiogram
      true)
:named REQ6_AUXILIARY2)) ;; "by resting echocardiogram"

(assert
(! (=> patient_has_undergone_catheterization_of_right_heart_now@@shows_mean_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg_at_rest
      patient_has_undergone_catheterization_of_right_heart_now)
:named REQ6_AUXILIARY3)) ;; "right heart catheterization shows mean pulmonary artery pressure value at rest"

(assert
(! (=> patient_has_undergone_catheterization_of_right_heart_now@@shows_peak_systolic_pulmonary_artery_pressure_value_recorded_now_withunit_mmhg
      patient_has_undergone_catheterization_of_right_heart_now)
:named REQ6_AUXILIARY4)) ;; "right heart catheterization shows peak systolic pulmonary artery pressure value"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_pulmonary_arterial_hypertension_now@@is_significant)
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if ((the patient has peak systolic pulmonary artery pressure > 50 mmHg by resting echocardiogram) AND (the patient does NOT have documentation of (normal right atrium size AND normal right atrium shape AND normal right atrium wall thickness AND normal right atrium septum shape AND normal right ventricle size AND normal right ventricle shape AND normal right ventricle wall thickness AND normal right ventricle septum shape) to rule out pulmonary artery hypertension) AND (unless right heart catheterization shows (mean pulmonary artery pressure < 30 mmHg at rest OR peak systolic pulmonary artery pressure < 45 mmHg), in which case the patient is NOT excluded))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_pulmonary_artery_mean_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's mean pulmonary artery pressure (mPAP) at rest by right heart catheterization is recorded now in mmHg.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's mean pulmonary artery pressure (mPAP) at rest by right heart catheterization, recorded now, in mmHg."} ;; "mean pulmonary artery pressure by right heart catheterization > 30 mmHg at rest"

(declare-const patient_transpulmonary_gradient_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's transpulmonary gradient is recorded now in mmHg.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's transpulmonary gradient measured now, in mmHg."} ;; "transpulmonary gradient"

(declare-const patient_transpulmonary_gradient_value_recorded_now_withunit_mmhg@@is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's transpulmonary gradient measured now is normal.","when_to_set_to_false":"Set to false if the patient's transpulmonary gradient measured now is not normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's transpulmonary gradient measured now is normal.","meaning":"Boolean indicating whether the patient's transpulmonary gradient measured now is normal."} ;; "transpulmonary gradient is normal"

(declare-const patients_pulmonary_vascular_resistance_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary vascular resistance is normal now.","when_to_set_to_false":"Set to false if the patient's pulmonary vascular resistance is not normal now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary vascular resistance is normal now.","meaning":"Boolean indicating whether the patient's pulmonary vascular resistance is normal now."} ;; "pulmonary vascular resistance is normal"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient has mean pulmonary artery pressure > 30 mmHg at rest by right heart catheterization, unless both pulmonary vascular resistance and transpulmonary gradient are normal
(assert
(! (not (and
           (> patient_pulmonary_artery_mean_pressure_value_recorded_now_withunit_mmhg 30)
           (not (and patients_pulmonary_vascular_resistance_is_normal_now
                     patient_transpulmonary_gradient_value_recorded_now_withunit_mmhg@@is_normal_now))
        ))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has mean pulmonary artery pressure by right heart catheterization > 30 mmHg at rest) AND (unless pulmonary vascular resistance and transpulmonary gradient are normal, in which case the patient is NOT excluded))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_classified_as_new_york_heart_association_class_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as New York Heart Association Class III.","when_to_set_to_false":"Set to false if the patient is currently not classified as New York Heart Association Class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as New York Heart Association Class III.","meaning":"Boolean indicating whether the patient is currently classified as New York Heart Association Class III."} ;; "the patient is classified as New York Heart Association Class III"
(declare-const patient_is_classified_as_new_york_heart_association_class_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as New York Heart Association Class IV.","when_to_set_to_false":"Set to false if the patient is currently not classified as New York Heart Association Class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as New York Heart Association Class IV.","meaning":"Boolean indicating whether the patient is currently classified as New York Heart Association Class IV."} ;; "the patient is classified as New York Heart Association Class IV"
(declare-const patient_is_classified_as_world_health_organization_class_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as World Health Organization Class III.","when_to_set_to_false":"Set to false if the patient is currently not classified as World Health Organization Class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as World Health Organization Class III.","meaning":"Boolean indicating whether the patient is currently classified as World Health Organization Class III."} ;; "the patient is classified as World Health Organization Class III"
(declare-const patient_is_classified_as_world_health_organization_class_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as World Health Organization Class IV.","when_to_set_to_false":"Set to false if the patient is currently not classified as World Health Organization Class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as World Health Organization Class IV.","meaning":"Boolean indicating whether the patient is currently classified as World Health Organization Class IV."} ;; "the patient is classified as World Health Organization Class IV"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_classified_as_new_york_heart_association_class_iii_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is classified as New York Heart Association Class III."

(assert
(! (not patient_is_classified_as_new_york_heart_association_class_iv_now)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is classified as New York Heart Association Class IV."

(assert
(! (not patient_is_classified_as_world_health_organization_class_iii_now)
:named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is classified as World Health Organization Class III."

(assert
(! (not patient_is_classified_as_world_health_organization_class_iv_now)
:named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is classified as World Health Organization Class IV."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_uncontrolled_clinically_significant_arrhythmias_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncontrolled clinically significant arrhythmias.","when_to_set_to_false":"Set to false if the patient currently does not have uncontrolled clinically significant arrhythmias.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled clinically significant arrhythmias.","meaning":"Boolean indicating whether the patient currently has uncontrolled clinically significant arrhythmias."} ;; "the patient has uncontrolled clinically significant arrhythmias"
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a current echocardiogram-derived LVEF is available.","when_to_set_to_null":"Set to null if no current LVEF measurement by echocardiogram is available or the value is indeterminate.","meaning":"Numeric percent value representing the patient's current left ventricular ejection fraction (LVEF)."} ;; "left ventricular ejection fraction < 50 percent by echocardiogram"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@measured_by_echocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the LVEF value is measured by echocardiogram.","when_to_set_to_false":"Set to false if the LVEF value is not measured by echocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the LVEF value is measured by echocardiogram.","meaning":"Boolean indicating whether the LVEF value is measured by echocardiogram."} ;; "left ventricular ejection fraction < 50 percent by echocardiogram"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_uncontrolled_clinically_significant_arrhythmias_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled clinically significant arrhythmias."

(assert
(! (not (and patient_has_diagnosis_of_congestive_heart_failure_now
             (or patient_is_classified_as_new_york_heart_association_class_iii_now
                 patient_is_classified_as_new_york_heart_association_class_iv_now)))
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical evidence of significant congestive heart failure (New York Heart Association Class III OR New York Heart Association Class IV)."

(assert
(! (not (and patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@measured_by_echocardiogram
             (< patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 50)))
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has left ventricular ejection fraction < 50 percent by echocardiogram."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_cardiac_arrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis or finding of cardiac arrhythmia at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis or finding of cardiac arrhythmia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis or finding of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient has a history of cardiac arrhythmia."} ;; "the patient has a history of arrhythmia"

(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has a finding of cardiac arrhythmia."} ;; "the patient has presence of arrhythmia (even if controlled) on chemical anti-arrhythmic therapy"

(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@present_while_on_chemical_anti_arrhythmic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of cardiac arrhythmia and this finding is present while the patient is on chemical anti-arrhythmic therapy.","when_to_set_to_false":"Set to false if the patient currently has a finding of cardiac arrhythmia but it is not present while on chemical anti-arrhythmic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the arrhythmia is present while on chemical anti-arrhythmic therapy.","meaning":"Boolean indicating whether the patient's current arrhythmia is present while on chemical anti-arrhythmic therapy."} ;; "the patient has presence of arrhythmia (even if controlled) on chemical anti-arrhythmic therapy"

(declare-const patient_has_undergone_referral_to_cardiology_service_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a referral to cardiology service (cardiac consult) at the present time.","when_to_set_to_false":"Set to false if the patient has not undergone a referral to cardiology service (cardiac consult) at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a referral to cardiology service (cardiac consult) at the present time.","meaning":"Boolean indicating whether the patient has undergone a referral to cardiology service (cardiac consult) now."} ;; "cardiac consult"

(declare-const patient_has_undergone_referral_to_cardiology_service_now@@performed_to_ensure_safe_proceeding_with_protocol_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac consult was performed specifically to ensure the patient could safely proceed with protocol requirements.","when_to_set_to_false":"Set to false if the patient's cardiac consult was not performed for this purpose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiac consult was performed to ensure safe proceeding with protocol requirements.","meaning":"Boolean indicating whether the cardiac consult was performed to ensure the patient could safely proceed with protocol requirements."} ;; "cardiac consult to ensure the patient could safely proceed with protocol requirements"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@present_while_on_chemical_anti_arrhythmic_therapy
      patient_has_finding_of_cardiac_arrhythmia_now)
    :named REQ10_AUXILIARY0)) ;; "the patient has presence of arrhythmia (even if controlled) on chemical anti-arrhythmic therapy"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_referral_to_cardiology_service_now@@performed_to_ensure_safe_proceeding_with_protocol_requirements
      patient_has_undergone_referral_to_cardiology_service_now)
    :named REQ10_AUXILIARY1)) ;; "cardiac consult to ensure the patient could safely proceed with protocol requirements"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: If (history of arrhythmia OR current arrhythmia present while on chemical anti-arrhythmic therapy) AND NOT (cardiac consult performed to ensure safe proceeding), patient is excluded.
(assert
(! (not (and
         (or patient_has_finding_of_cardiac_arrhythmia_inthehistory
             patient_has_finding_of_cardiac_arrhythmia_now@@present_while_on_chemical_anti_arrhythmic_therapy)
         (not patient_has_undergone_referral_to_cardiology_service_now@@performed_to_ensure_safe_proceeding_with_protocol_requirements)))
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of arrhythmia) OR (the patient has presence of arrhythmia (even if controlled) on chemical anti-arrhythmic therapy)) AND (the patient does NOT have a cardiac consult to ensure the patient could safely proceed with protocol requirements)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease (renal pathology).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease (renal pathology).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease (renal pathology).","meaning":"Boolean indicating whether the patient currently has kidney disease (renal pathology)."} ;; "renal pathology"
(declare-const patient_has_finding_of_kidney_disease_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current kidney disease (renal pathology) meets the definition of significant as specified by subsequent criteria.","when_to_set_to_false":"Set to false if the patient's current kidney disease (renal pathology) does not meet the definition of significant as specified by subsequent criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current kidney disease (renal pathology) is significant.","meaning":"Boolean indicating whether the patient's current kidney disease (renal pathology) is significant as defined by subsequent criteria."} ;; "significant renal pathology as defined by the subsequent criteria"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_kidney_disease_now@@is_significant
       patient_has_finding_of_kidney_disease_now)
   :named REQ11_AUXILIARY0)) ;; "significant renal pathology as defined by the subsequent criteria"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_kidney_disease_now@@is_significant)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant renal pathology as defined by the subsequent criteria."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured or estimated value of the patient's creatinine renal clearance in milliliters per minute, recorded now.","when_to_set_to_null":"Set to null if no such measurement or estimation is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's creatinine renal clearance (mL/min) measured now."} ;; "estimated creatinine clearance < 40 milliliters per minute (using Cockcroft-Gault formula based on actual body weight)"
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute@@estimated_using_cockcroft_gault_formula_based_on_actual_body_weight Bool) ;; {"when_to_set_to_true":"Set to true if the creatinine renal clearance value is estimated using the Cockcroft-Gault formula based on actual body weight.","when_to_set_to_false":"Set to false if the value is not estimated using the Cockcroft-Gault formula based on actual body weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Cockcroft-Gault formula based on actual body weight was used for estimation.","meaning":"Boolean indicating whether the creatinine renal clearance value was estimated using the Cockcroft-Gault formula based on actual body weight."} ;; "estimated creatinine clearance < 40 milliliters per minute (using Cockcroft-Gault formula based on actual body weight)"
(declare-const patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's serum creatinine in milligrams per deciliter, recorded now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's serum creatinine (mg/dL) measured now."} ;; "serum creatinine > 2.0 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (and
    (< patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 40) ;; "estimated creatinine clearance < 40 milliliters per minute"
    patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute@@estimated_using_cockcroft_gault_formula_based_on_actual_body_weight ;; "using Cockcroft-Gault formula based on actual body weight"
    (> patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter 2.0) ;; "serum creatinine > 2.0 milligrams per deciliter"
))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has estimated creatinine clearance < 40 milliliters per minute (using Cockcroft-Gault formula based on actual body weight)) AND (the patient has serum creatinine > 2.0 milligrams per deciliter))."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_systemic_scleroderma_renal_crisis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systemic scleroderma renal crisis.","when_to_set_to_false":"Set to false if the patient currently does not have systemic scleroderma renal crisis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systemic scleroderma renal crisis.","meaning":"Boolean indicating whether the patient currently has systemic scleroderma renal crisis."} ;; "systemic scleroderma renal crisis"
(declare-const patient_has_finding_of_systemic_scleroderma_renal_crisis_now@@active_untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current systemic scleroderma renal crisis is active and untreated.","when_to_set_to_false":"Set to false if the patient's current systemic scleroderma renal crisis is not active and untreated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current systemic scleroderma renal crisis is active and untreated.","meaning":"Boolean indicating whether the patient's current systemic scleroderma renal crisis is active and untreated."} ;; "active untreated systemic scleroderma renal crisis at the time of enrollment"
(declare-const patient_has_finding_of_nephrotic_range_proteinuria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nephrotic range proteinuria.","when_to_set_to_false":"Set to false if the patient currently does not have nephrotic range proteinuria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nephrotic range proteinuria.","meaning":"Boolean indicating whether the patient currently has nephrotic range proteinuria."} ;; "nephrotic range proteinuria"
(declare-const patient_proteinuria_value_recorded_now_withunit_grams_per_24_hours Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of proteinuria in grams per 24 hours recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current proteinuria in grams per 24 hours."} ;; "proteinuria ≥ 3.5 grams per 24 hours"
(declare-const patient_protein_creatinine_ratio_measurement_value_recorded_now_withunit_unitless Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of protein:creatinine ratio recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current protein:creatinine ratio (unitless)."} ;; "protein:creatinine ratio ≥ 3.5"
(declare-const patient_has_finding_of_urinary_sediment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has urinary sediment.","when_to_set_to_false":"Set to false if the patient currently does not have urinary sediment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has urinary sediment.","meaning":"Boolean indicating whether the patient currently has urinary sediment."} ;; "urinary sediment"
(declare-const patient_has_finding_of_urinary_sediment_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's urinary sediment is active.","when_to_set_to_false":"Set to false if the patient's urinary sediment is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's urinary sediment is active.","meaning":"Boolean indicating whether the patient's urinary sediment is active."} ;; "active urinary sediment"
(declare-const patient_urine_microscopy_rbc_s_present_value_recorded_now_withunit_per_high_power_field Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of urinary red blood cells per high power field recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current urinary red blood cells per high power field."} ;; "urinary red blood cells > 25 per high power field"
(declare-const patient_has_finding_of_urinary_cast_erythrocyte_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has urinary red cell casts.","when_to_set_to_false":"Set to false if the patient currently does not have urinary red cell casts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has urinary red cell casts.","meaning":"Boolean indicating whether the patient currently has urinary red cell casts."} ;; "red cell casts"
(declare-const patient_has_finding_of_glomerulonephritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has glomerulonephritis.","when_to_set_to_false":"Set to false if the patient currently does not have glomerulonephritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has glomerulonephritis.","meaning":"Boolean indicating whether the patient currently has glomerulonephritis."} ;; "glomerulonephritis"
(declare-const patient_has_finding_of_glomerulonephritis_now@@after_further_investigation_by_nephrologist Bool) ;; {"when_to_set_to_true":"Set to true if the patient's glomerulonephritis is found after further investigation by a nephrologist.","when_to_set_to_false":"Set to false if the patient's glomerulonephritis is not found after further investigation by a nephrologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's glomerulonephritis is found after further investigation by a nephrologist.","meaning":"Boolean indicating whether the patient's glomerulonephritis is found after further investigation by a nephrologist."} ;; "found to have glomerulonephritis after further investigation by a nephrologist"
(declare-const patient_has_finding_of_overlap_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has overlap syndromes.","when_to_set_to_false":"Set to false if the patient currently does not have overlap syndromes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has overlap syndromes.","meaning":"Boolean indicating whether the patient currently has overlap syndromes."} ;; "overlap syndromes"
(declare-const patient_has_finding_of_overlap_syndrome_now@@after_further_investigation_by_nephrologist Bool) ;; {"when_to_set_to_true":"Set to true if the patient's overlap syndromes are found after further investigation by a nephrologist.","when_to_set_to_false":"Set to false if the patient's overlap syndromes are not found after further investigation by a nephrologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's overlap syndromes are found after further investigation by a nephrologist.","meaning":"Boolean indicating whether the patient's overlap syndromes are found after further investigation by a nephrologist."} ;; "found to have overlap syndromes after further investigation by a nephrologist"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Definition: nephrotic range proteinuria = (proteinuria ≥ 3.5 grams per 24 hours OR protein:creatinine ratio ≥ 3.5)
(assert
(! (= patient_has_finding_of_nephrotic_range_proteinuria_now
(or (>= patient_proteinuria_value_recorded_now_withunit_grams_per_24_hours 3.5)
    (>= patient_protein_creatinine_ratio_measurement_value_recorded_now_withunit_unitless 3.5)))
:named REQ13_AUXILIARY0)) ;; "nephrotic range proteinuria (defined as proteinuria ≥ 3.5 grams per 24 hours OR protein:creatinine ratio ≥ 3.5)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_systemic_scleroderma_renal_crisis_now@@active_untreated
      patient_has_finding_of_systemic_scleroderma_renal_crisis_now)
:named REQ13_AUXILIARY1)) ;; "active untreated systemic scleroderma renal crisis at the time of enrollment"

(assert
(! (=> patient_has_finding_of_urinary_sediment_now@@active
      patient_has_finding_of_urinary_sediment_now)
:named REQ13_AUXILIARY2)) ;; "active urinary sediment"

(assert
(! (=> patient_has_finding_of_glomerulonephritis_now@@after_further_investigation_by_nephrologist
      patient_has_finding_of_glomerulonephritis_now)
:named REQ13_AUXILIARY3)) ;; "found to have glomerulonephritis after further investigation by a nephrologist"

(assert
(! (=> patient_has_finding_of_overlap_syndrome_now@@after_further_investigation_by_nephrologist
      patient_has_finding_of_overlap_syndrome_now)
:named REQ13_AUXILIARY4)) ;; "found to have overlap syndromes after further investigation by a nephrologist"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: If any of the following are true:
;;   - active untreated systemic scleroderma renal crisis at the time of enrollment
;;   - nephrotic range proteinuria (proteinuria ≥ 3.5 grams per 24 hours OR protein:creatinine ratio ≥ 3.5)
;;   - active urinary sediment
;;   - urinary red blood cells > 25 per high power field
;;   - red cell casts
;; AND the patient is found to have glomerulonephritis OR overlap syndromes after further investigation by a nephrologist

(assert
(! (not (and
    (or patient_has_finding_of_systemic_scleroderma_renal_crisis_now@@active_untreated
        patient_has_finding_of_nephrotic_range_proteinuria_now
        patient_has_finding_of_urinary_sediment_now@@active
        (> patient_urine_microscopy_rbc_s_present_value_recorded_now_withunit_per_high_power_field 25)
        patient_has_finding_of_urinary_cast_erythrocyte_now)
    (or patient_has_finding_of_glomerulonephritis_now@@after_further_investigation_by_nephrologist
        patient_has_finding_of_overlap_syndrome_now@@after_further_investigation_by_nephrologist)))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (((the patient has active untreated systemic scleroderma renal crisis at the time of enrollment) OR (the patient has nephrotic range proteinuria (defined as proteinuria ≥ 3.5 grams per 24 hours OR protein:creatinine ratio ≥ 3.5)) OR (the patient has active urinary sediment) OR (the patient has urinary red blood cells > 25 per high power field) OR (the patient has red cell casts)) AND (the patient is found to have glomerulonephritis OR overlap syndromes after further investigation by a nephrologist))."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_alanine_aminotransferase_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of alanine aminotransferase (ALT) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase (ALT) measurement."} ;; "alanine aminotransferase"
(declare-const patient_aspartate_aminotransferase_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of aspartate aminotransferase (AST) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate aminotransferase (AST) measurement."} ;; "aspartate aminotransferase"
(declare-const patient_bilirubin_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of bilirubin recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current bilirubin measurement."} ;; "bilirubin"
(declare-const patient_has_finding_of_inflammatory_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatitis (inflammatory disease of liver).","when_to_set_to_false":"Set to false if the patient currently does not have hepatitis (inflammatory disease of liver).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatitis (inflammatory disease of liver).","meaning":"Boolean indicating whether the patient currently has hepatitis (inflammatory disease of liver)."} ;; "hepatitis"
(declare-const patient_has_finding_of_inflammatory_disease_of_liver_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatitis (inflammatory disease of liver) and the hepatitis is active.","when_to_set_to_false":"Set to false if the patient currently has hepatitis (inflammatory disease of liver) and the hepatitis is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatitis is active.","meaning":"Boolean indicating whether the patient's current hepatitis is active."} ;; "active hepatitis"
(declare-const patient_has_finding_of_periportal_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has periportal fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have periportal fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has periportal fibrosis.","meaning":"Boolean indicating whether the patient currently has periportal fibrosis."} ;; "periportal fibrosis"
(declare-const patient_has_finding_of_periportal_fibrosis_now@@identified_by_liver_biopsy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current periportal fibrosis is identified by liver biopsy.","when_to_set_to_false":"Set to false if the patient's current periportal fibrosis is not identified by liver biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current periportal fibrosis is identified by liver biopsy.","meaning":"Boolean indicating whether the patient's current periportal fibrosis is identified by liver biopsy."} ;; "periportal fibrosis by liver biopsy"
(declare-const patient_has_finding_of_periportal_fibrosis_now@@moderate_to_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current periportal fibrosis is moderate to severe.","when_to_set_to_false":"Set to false if the patient's current periportal fibrosis is not moderate to severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current periportal fibrosis is moderate to severe.","meaning":"Boolean indicating whether the patient's current periportal fibrosis is moderate to severe."} ;; "moderate to severe periportal fibrosis"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Definition of "active hepatitis" per requirement: ALT > 2x ULN OR AST > 2x ULN OR bilirubin > 2x ULN
;; Note: We do not have explicit variables for "upper limit of normal" (ULN) for each lab, so we assume the comparison is to the respective ULN values, which must be provided at runtime.
(declare-const alanine_aminotransferase_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for alanine aminotransferase (ALT) for the laboratory used.","when_to_set_to_null":"Set to null if the ULN is not available or indeterminate.","meaning":"Reference value for the upper limit of normal for ALT."} ;; "upper limit of normal for alanine aminotransferase"
(declare-const aspartate_aminotransferase_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for aspartate aminotransferase (AST) for the laboratory used.","when_to_set_to_null":"Set to null if the ULN is not available or indeterminate.","meaning":"Reference value for the upper limit of normal for AST."} ;; "upper limit of normal for aspartate aminotransferase"
(declare-const bilirubin_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for bilirubin for the laboratory used.","when_to_set_to_null":"Set to null if the ULN is not available or indeterminate.","meaning":"Reference value for the upper limit of normal for bilirubin."} ;; "upper limit of normal for bilirubin"

;; "active hepatitis" definition
(assert
(! (= patient_has_finding_of_inflammatory_disease_of_liver_now@@active
     (or
       (> patient_alanine_aminotransferase_value_recorded_now_withunit_unit (* 2 alanine_aminotransferase_upper_limit_of_normal))
       (> patient_aspartate_aminotransferase_value_recorded_now_withunit_unit (* 2 aspartate_aminotransferase_upper_limit_of_normal))
       (> patient_bilirubin_value_recorded_now_withunit_unit (* 2 bilirubin_upper_limit_of_normal))
     ))
:named REQ14_AUXILIARY0)) ;; "active hepatitis (defined as alanine aminotransferase > 2 times the upper limit of normal OR aspartate aminotransferase > 2 times the upper limit of normal OR bilirubin > 2 times the upper limit of normal)"

;; Qualifier variable implies stem variable for hepatitis
(assert
(! (=> patient_has_finding_of_inflammatory_disease_of_liver_now@@active
       patient_has_finding_of_inflammatory_disease_of_liver_now)
:named REQ14_AUXILIARY1)) ;; "active hepatitis" implies "hepatitis"

;; Qualifier variable implies stem variable for periportal fibrosis (identified by liver biopsy)
(assert
(! (=> patient_has_finding_of_periportal_fibrosis_now@@identified_by_liver_biopsy
       patient_has_finding_of_periportal_fibrosis_now)
:named REQ14_AUXILIARY2)) ;; "periportal fibrosis by liver biopsy" implies "periportal fibrosis"

;; Qualifier variable implies stem variable for periportal fibrosis (moderate to severe)
(assert
(! (=> patient_has_finding_of_periportal_fibrosis_now@@moderate_to_severe
       patient_has_finding_of_periportal_fibrosis_now)
:named REQ14_AUXILIARY3)) ;; "moderate to severe periportal fibrosis" implies "periportal fibrosis"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion if (active hepatitis) OR (evidence of moderate to severe periportal fibrosis by liver biopsy)
(assert
(! (not
      (or
        patient_has_finding_of_inflammatory_disease_of_liver_now@@active
        (and patient_has_finding_of_periportal_fibrosis_now@@moderate_to_severe
             patient_has_finding_of_periportal_fibrosis_now@@identified_by_liver_biopsy)
      )
   )
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has active hepatitis (defined as alanine aminotransferase > 2 times the upper limit of normal OR aspartate aminotransferase > 2 times the upper limit of normal OR bilirubin > 2 times the upper limit of normal)) OR (the patient has evidence of moderate to severe periportal fibrosis by liver biopsy))."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_vascular_ectasia_of_gastric_antrum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of vascular ectasia of the gastric antrum.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of vascular ectasia of the gastric antrum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of vascular ectasia of the gastric antrum.","meaning":"Boolean indicating whether the patient currently has vascular ectasia of the gastric antrum."} ;; "gastric antral vascular ectasia (watermelon stomach)"
(declare-const patient_has_finding_of_vascular_ectasia_of_gastric_antrum_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's vascular ectasia of the gastric antrum is active.","when_to_set_to_false":"Set to false if the patient's vascular ectasia of the gastric antrum is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's vascular ectasia of the gastric antrum is active.","meaning":"Boolean indicating whether the patient's vascular ectasia of the gastric antrum is active."} ;; "active gastric antral vascular ectasia (watermelon stomach)"
(declare-const patient_has_finding_of_vascular_ectasia_of_gastric_antrum_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's vascular ectasia of the gastric antrum is clinically significant.","when_to_set_to_false":"Set to false if the patient's vascular ectasia of the gastric antrum is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's vascular ectasia of the gastric antrum is clinically significant.","meaning":"Boolean indicating whether the patient's vascular ectasia of the gastric antrum is clinically significant."} ;; "clinically significant gastric antral vascular ectasia (watermelon stomach)"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_vascular_ectasia_of_gastric_antrum_now@@active
       patient_has_finding_of_vascular_ectasia_of_gastric_antrum_now)
   :named REQ15_AUXILIARY0)) ;; "active gastric antral vascular ectasia (watermelon stomach)"

(assert
(! (=> patient_has_finding_of_vascular_ectasia_of_gastric_antrum_now@@clinically_significant
       patient_has_finding_of_vascular_ectasia_of_gastric_antrum_now)
   :named REQ15_AUXILIARY1)) ;; "clinically significant gastric antral vascular ectasia (watermelon stomach)"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not (or patient_has_finding_of_vascular_ectasia_of_gastric_antrum_now@@active
            patient_has_finding_of_vascular_ectasia_of_gastric_antrum_now@@clinically_significant))
   :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active OR clinically significant gastric antral vascular ectasia (watermelon stomach)."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_is_unwilling_to_discontinue_disallowed_disease_modifying_antirheumatic_drug_therapy_for_treatment_of_systemic_scleroderma_prior_to_mobilization Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization.","when_to_set_to_false":"Set to false if the patient is willing to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization.","meaning":"Boolean indicating whether the patient is unwilling to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization."} ;; "the patient is unwilling to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization"

(declare-const patient_is_unable_to_discontinue_disallowed_disease_modifying_antirheumatic_drug_therapy_for_treatment_of_systemic_scleroderma_prior_to_mobilization Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization.","when_to_set_to_false":"Set to false if the patient is able to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization.","meaning":"Boolean indicating whether the patient is unable to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization."} ;; "the patient is unable to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (or patient_is_unwilling_to_discontinue_disallowed_disease_modifying_antirheumatic_drug_therapy_for_treatment_of_systemic_scleroderma_prior_to_mobilization
            patient_is_unable_to_discontinue_disallowed_disease_modifying_antirheumatic_drug_therapy_for_treatment_of_systemic_scleroderma_prior_to_mobilization))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is unwilling to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization) OR (the patient is unable to discontinue disallowed disease-modifying antirheumatic drug therapy for treatment of systemic scleroderma prior to mobilization))."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_autoimmune_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of autoimmune disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of autoimmune disease in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of autoimmune disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of autoimmune disease in their history."} ;; "autoimmune disease"
(declare-const patient_has_finding_of_autoimmune_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of autoimmune disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of autoimmune disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of autoimmune disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of autoimmune disease."} ;; "autoimmune disease"
(declare-const patient_has_finding_of_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current autoimmune disease requires immunosuppressive therapy with substantial risk beyond transplant.","when_to_set_to_false":"Set to false if the patient's current autoimmune disease does not require immunosuppressive therapy with substantial risk beyond transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current autoimmune disease requires immunosuppressive therapy with substantial risk beyond transplant.","meaning":"Boolean indicating whether the patient's current autoimmune disease requires immunosuppressive therapy with substantial risk beyond transplant."} ;; "autoimmune disease requiring immunosuppressive therapy that has substantial risk of immunosuppressive treatment beyond transplant"
(declare-const patient_has_finding_of_second_autoimmune_disease_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of a second autoimmune disease, distinct from the primary autoimmune disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of a second autoimmune disease, distinct from the primary autoimmune disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of a second autoimmune disease.","meaning":"Boolean indicating whether the patient has a history of a second autoimmune disease, distinct from the primary autoimmune disease."} ;; "history of a second autoimmune disease"
(declare-const patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_sjogrens_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient's second autoimmune disease is NOT Sjogren's syndrome.","when_to_set_to_false":"Set to false if the patient's second autoimmune disease is Sjogren's syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's second autoimmune disease is Sjogren's syndrome.","meaning":"Boolean indicating whether the patient's second autoimmune disease is NOT Sjogren's syndrome."} ;; "the second autoimmune disease is NOT Sjogren's syndrome"
(declare-const patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_stable_myositis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's second autoimmune disease is NOT stable myositis.","when_to_set_to_false":"Set to false if the patient's second autoimmune disease is stable myositis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's second autoimmune disease is stable myositis.","meaning":"Boolean indicating whether the patient's second autoimmune disease is NOT stable myositis."} ;; "the second autoimmune disease is NOT stable myositis"
(declare-const patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_anti_double_stranded_dna_without_clinical_sle_in_pure_systemic_scleroderma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's second autoimmune disease is NOT anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma.","when_to_set_to_false":"Set to false if the patient's second autoimmune disease is anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's second autoimmune disease is anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma.","meaning":"Boolean indicating whether the patient's second autoimmune disease is NOT anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma."} ;; "the second autoimmune disease is NOT anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma"
(declare-const patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_concomitant_rheumatoid_arthritis_without_extra_articular_disease_characteristic_of_rheumatoid_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's second autoimmune disease is NOT concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient's second autoimmune disease is concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's second autoimmune disease is concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis.","meaning":"Boolean indicating whether the patient's second autoimmune disease is NOT concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis."} ;; "the second autoimmune disease is NOT concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis"
(declare-const patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a second autoimmune disease, distinct from the primary autoimmune disease, and this disease requires immunosuppressive therapy with substantial risk beyond transplant.","when_to_set_to_false":"Set to false if the patient currently does not have a second autoimmune disease, or if the disease does not require immunosuppressive therapy with substantial risk beyond transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a second autoimmune disease requiring immunosuppressive therapy with substantial risk beyond transplant.","meaning":"Boolean indicating whether the patient currently has a second autoimmune disease requiring immunosuppressive therapy with substantial risk beyond transplant."} ;; "presence of a second autoimmune disease requiring immunosuppressive therapy that has substantial risk of immunosuppressive treatment beyond transplant"
(declare-const patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_sjogrens_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient's second autoimmune disease is NOT Sjogren's syndrome.","when_to_set_to_false":"Set to false if the patient's second autoimmune disease is Sjogren's syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's second autoimmune disease is Sjogren's syndrome.","meaning":"Boolean indicating whether the patient's second autoimmune disease is NOT Sjogren's syndrome."} ;; "the second autoimmune disease is NOT Sjogren's syndrome"
(declare-const patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_stable_myositis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's second autoimmune disease is NOT stable myositis.","when_to_set_to_false":"Set to false if the patient's second autoimmune disease is stable myositis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's second autoimmune disease is stable myositis.","meaning":"Boolean indicating whether the patient's second autoimmune disease is NOT stable myositis."} ;; "the second autoimmune disease is NOT stable myositis"
(declare-const patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_anti_double_stranded_dna_without_clinical_sle_in_pure_systemic_scleroderma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's second autoimmune disease is NOT anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma.","when_to_set_to_false":"Set to false if the patient's second autoimmune disease is anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's second autoimmune disease is anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma.","meaning":"Boolean indicating whether the patient's second autoimmune disease is NOT anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma."} ;; "the second autoimmune disease is NOT anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma"
(declare-const patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_concomitant_rheumatoid_arthritis_without_extra_articular_disease_characteristic_of_rheumatoid_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's second autoimmune disease is NOT concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient's second autoimmune disease is concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's second autoimmune disease is concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis.","meaning":"Boolean indicating whether the patient's second autoimmune disease is NOT concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis."} ;; "the second autoimmune disease is NOT concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis"
(declare-const patient_is_undergoing_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunosuppressive therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing immunosuppressive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing immunosuppressive therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunosuppressive therapy."} ;; "immunosuppressive therapy"
(declare-const patient_is_undergoing_immunosuppressive_therapy_now@@has_substantial_risk_beyond_transplant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current immunosuppressive therapy has substantial risk of immunosuppressive treatment beyond transplant.","when_to_set_to_false":"Set to false if the patient's current immunosuppressive therapy does not have substantial risk of immunosuppressive treatment beyond transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current immunosuppressive therapy has substantial risk of immunosuppressive treatment beyond transplant.","meaning":"Boolean indicating whether the patient's current immunosuppressive therapy has substantial risk of immunosuppressive treatment beyond transplant."} ;; "immunosuppressive therapy that has substantial risk of immunosuppressive treatment beyond transplant"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variables imply corresponding stem variables for history
(assert
(! (=> patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_sjogrens_syndrome
      patient_has_finding_of_second_autoimmune_disease_in_the_history)
:named REQ17_AUXILIARY0)) ;; "the second autoimmune disease is NOT Sjogren's syndrome"

(assert
(! (=> patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_stable_myositis
      patient_has_finding_of_second_autoimmune_disease_in_the_history)
:named REQ17_AUXILIARY1)) ;; "the second autoimmune disease is NOT stable myositis"

(assert
(! (=> patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_anti_double_stranded_dna_without_clinical_sle_in_pure_systemic_scleroderma
      patient_has_finding_of_second_autoimmune_disease_in_the_history)
:named REQ17_AUXILIARY2)) ;; "the second autoimmune disease is NOT anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma"

(assert
(! (=> patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_concomitant_rheumatoid_arthritis_without_extra_articular_disease_characteristic_of_rheumatoid_arthritis
      patient_has_finding_of_second_autoimmune_disease_in_the_history)
:named REQ17_AUXILIARY3)) ;; "the second autoimmune disease is NOT concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis"

;; Qualifier variables imply corresponding stem variables for current second autoimmune disease requiring immunosuppressive therapy
(assert
(! (=> patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_sjogrens_syndrome
      patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant)
:named REQ17_AUXILIARY4)) ;; "the second autoimmune disease is NOT Sjogren's syndrome"

(assert
(! (=> patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_stable_myositis
      patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant)
:named REQ17_AUXILIARY5)) ;; "the second autoimmune disease is NOT stable myositis"

(assert
(! (=> patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_anti_double_stranded_dna_without_clinical_sle_in_pure_systemic_scleroderma
      patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant)
:named REQ17_AUXILIARY6)) ;; "the second autoimmune disease is NOT anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma"

(assert
(! (=> patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_concomitant_rheumatoid_arthritis_without_extra_articular_disease_characteristic_of_rheumatoid_arthritis
      patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant)
:named REQ17_AUXILIARY7)) ;; "the second autoimmune disease is NOT concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Exclusion: patient must NOT satisfy the exclusion criterion
(assert
(! (not
    (or
      ;; (the patient has a history of a second autoimmune disease)
      (and patient_has_finding_of_second_autoimmune_disease_in_the_history
           patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_sjogrens_syndrome
           patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_stable_myositis
           patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_anti_double_stranded_dna_without_clinical_sle_in_pure_systemic_scleroderma
           patient_has_finding_of_second_autoimmune_disease_in_the_history@@is_not_concomitant_rheumatoid_arthritis_without_extra_articular_disease_characteristic_of_rheumatoid_arthritis)
      ;; (the patient has presence of a second autoimmune disease requiring immunosuppressive therapy that has substantial risk of immunosuppressive treatment beyond transplant)
      (and patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant
           patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_sjogrens_syndrome
           patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_stable_myositis
           patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_anti_double_stranded_dna_without_clinical_sle_in_pure_systemic_scleroderma
           patient_has_finding_of_second_autoimmune_disease_now@@requires_immunosuppressive_therapy_with_substantial_risk_beyond_transplant@@is_not_concomitant_rheumatoid_arthritis_without_extra_articular_disease_characteristic_of_rheumatoid_arthritis)
    ))
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of a second autoimmune disease) OR (the patient has presence of a second autoimmune disease requiring immunosuppressive therapy that has substantial risk of immunosuppressive treatment beyond transplant)) AND (the second autoimmune disease is NOT Sjogren's syndrome) AND (the second autoimmune disease is NOT stable myositis) AND (the second autoimmune disease is NOT anti-double stranded DNA without clinical systemic lupus erythematosus in a patient with otherwise pure systemic scleroderma) AND (the second autoimmune disease is NOT concomitant rheumatoid arthritis without extra-articular disease characteristic of rheumatoid arthritis)."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_history_of_sjogrens_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of Sjogren's syndrome.","when_to_set_to_false":"Set to false if the patient does not have a documented history of Sjogren's syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of Sjogren's syndrome.","meaning":"Boolean indicating whether the patient has a history of Sjogren's syndrome."} ;; "the patient has a history of Sjogren's syndrome"
(declare-const patient_has_presence_of_sjogrens_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the presence of Sjogren's syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the presence of Sjogren's syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the presence of Sjogren's syndrome.","meaning":"Boolean indicating whether the patient currently has the presence of Sjogren's syndrome."} ;; "the patient has presence of Sjogren's syndrome"

;; ===================== Constraint Assertions (REQ 18) =====================
;; The patient is NOT excluded if ((the patient has a history of Sjogren's syndrome) OR (the patient has presence of Sjogren's syndrome)).
(assert
(! (not (or patient_has_history_of_sjogrens_syndrome
            patient_has_presence_of_sjogrens_syndrome))
   :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is NOT excluded if ((the patient has a history of Sjogren's syndrome) OR (the patient has presence of Sjogren's syndrome))."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const creatine_phosphokinase_upper_limit_of_normal_value_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the laboratory's upper limit of normal for creatine phosphokinase (CPK) in units per liter (U/L).","when_to_set_to_null":"Set to null if the upper limit of normal for creatine phosphokinase (CPK) is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the laboratory's upper limit of normal for creatine phosphokinase (CPK) in units per liter (U/L)."} ;; "upper limit of normal for creatine phosphokinase (CPK)"
(declare-const creatine_phosphokinase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the patient's current creatine phosphokinase (CPK) value in units per liter (U/L).","when_to_set_to_null":"Set to null if the patient's current creatine phosphokinase (CPK) value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current creatine phosphokinase (CPK) level in units per liter (U/L)."} ;; "current creatine phosphokinase (CPK) value"
(declare-const creatine_phosphokinase_value_trend_in_the_history_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the trend (e.g., rate of change, increase, decrease, or stability) of the patient's creatine phosphokinase (CPK) levels in the history, measured in units per liter (U/L) per time unit.","when_to_set_to_null":"Set to null if the trend of the patient's creatine phosphokinase (CPK) levels in the history is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the trend of the patient's creatine phosphokinase (CPK) levels in the history, measured in units per liter (U/L)."} ;; "trend of creatine phosphokinase (CPK) levels in the history"
(declare-const patient_has_diagnosis_of_myositis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myositis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myositis at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myositis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myositis at any time in the past."} ;; "history of myositis"
(declare-const patient_has_diagnosis_of_myositis_inthehistory@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myositis is clinically stable, as defined by lack of progressive proximal muscle weakness and stable or decreasing creatine phosphokinase.","when_to_set_to_false":"Set to false if the patient's myositis is not clinically stable (i.e., is worsening or progressing).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myositis is clinically stable.","meaning":"Boolean indicating whether the patient's myositis is clinically stable."} ;; "clinically stable myositis"
(declare-const patient_has_progressive_proximal_muscle_weakness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has progressive proximal muscle weakness.","when_to_set_to_false":"Set to false if the patient currently does not have progressive proximal muscle weakness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has progressive proximal muscle weakness.","meaning":"Boolean indicating whether the patient currently has progressive proximal muscle weakness."} ;; "progressive proximal muscle weakness"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Definition: stable myositis = history of myositis AND lack of progressive proximal muscle weakness AND (creatine phosphokinase < 3x ULN AND stable or decreasing)
(assert
(! (= patient_has_diagnosis_of_myositis_inthehistory@@stable
(and
  patient_has_diagnosis_of_myositis_inthehistory
  (not patient_has_progressive_proximal_muscle_weakness_now)
  (< creatine_phosphokinase_value_recorded_now_withunit_u_per_l
     (* 3 creatine_phosphokinase_upper_limit_of_normal_value_withunit_u_per_l))
  (<= creatine_phosphokinase_value_trend_in_the_history_withunit_u_per_l 0)
))
:named REQ19_AUXILIARY0)) ;; "defined as a history of myositis that is clinically stable by lack of progressive proximal muscle weakness AND a stable or decreasing creatine phosphokinase < 3 times upper limit of normal"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_myositis_inthehistory@@stable
       patient_has_diagnosis_of_myositis_inthehistory)
:named REQ19_AUXILIARY1)) ;; "clinically stable myositis implies history of myositis"

;; ===================== Constraint Assertions (REQ 19) =====================
;; Exclusion: patient is NOT excluded if they have stable myositis
(assert
(! (not patient_has_diagnosis_of_myositis_inthehistory@@stable)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is NOT excluded if the patient has stable myositis (defined as a history of myositis that is clinically stable by lack of progressive proximal muscle weakness AND a stable or decreasing creatine phosphokinase < 3 times upper limit of normal)."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_is_exposed_to_double_stranded_anti_dna_antibody_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has anti-double stranded DNA antibodies present.","when_to_set_to_false":"Set to false if the patient currently does not have anti-double stranded DNA antibodies present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anti-double stranded DNA antibodies.","meaning":"Boolean indicating whether the patient currently has anti-double stranded DNA antibodies."} ;; "anti-double stranded DNA"

(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of systemic lupus erythematosus.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of systemic lupus erythematosus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of systemic lupus erythematosus.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of systemic lupus erythematosus."} ;; "systemic lupus erythematosus"

(declare-const patient_has_diagnosis_of_systemic_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of systemic scleroderma (systemic sclerosis).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of systemic scleroderma (systemic sclerosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of systemic scleroderma (systemic sclerosis).","meaning":"Boolean indicating whether the patient currently has a diagnosis of systemic scleroderma (systemic sclerosis)."} ;; "systemic scleroderma"

(declare-const patient_has_diagnosis_of_systemic_sclerosis_now@@otherwise_pure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of systemic scleroderma (systemic sclerosis) is otherwise pure (not mixed with other autoimmune conditions).","when_to_set_to_false":"Set to false if the patient's diagnosis of systemic scleroderma (systemic sclerosis) is not otherwise pure (i.e., is mixed with other autoimmune conditions).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of systemic scleroderma (systemic sclerosis) is otherwise pure.","meaning":"Boolean indicating whether the patient's diagnosis of systemic scleroderma (systemic sclerosis) is otherwise pure."} ;; "otherwise pure systemic scleroderma"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_systemic_sclerosis_now@@otherwise_pure
       patient_has_diagnosis_of_systemic_sclerosis_now)
   :named REQ20_AUXILIARY0)) ;; "otherwise pure systemic scleroderma"

;; ===================== Constraint Assertions (REQ 20) =====================
;; The patient is NOT excluded if (the patient has anti-double stranded DNA) AND (the patient does NOT have clinical systemic lupus erythematosus) AND (the patient has otherwise pure systemic scleroderma); otherwise, the patient is excluded.
(assert
(! (not (and patient_is_exposed_to_double_stranded_anti_dna_antibody_now
             (not patient_has_diagnosis_of_systemic_lupus_erythematosus_now)
             patient_has_diagnosis_of_systemic_sclerosis_now@@otherwise_pure))
   :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is NOT excluded if (the patient has anti-double stranded DNA) AND (the patient does NOT have clinical systemic lupus erythematosus) AND (the patient has otherwise pure systemic scleroderma); otherwise, the patient is excluded."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_finding_of_rheumatoid_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has rheumatoid arthritis."} ;; "the patient has concomitant rheumatoid arthritis"

(declare-const patient_has_finding_of_extra_articular_rheumatoid_process_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has extra-articular disease characteristic of rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have extra-articular disease characteristic of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has extra-articular disease characteristic of rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has extra-articular disease characteristic of rheumatoid arthritis."} ;; "the patient does NOT have extra-articular disease characteristic of rheumatoid arthritis"

;; ===================== Constraint Assertions (REQ 21) =====================
;; The patient is NOT excluded if (the patient has concomitant rheumatoid arthritis) AND (the patient does NOT have extra-articular disease characteristic of rheumatoid arthritis); otherwise, the patient is excluded.
(assert
(! (not (and patient_has_finding_of_rheumatoid_arthritis_now
             (not patient_has_finding_of_extra_articular_rheumatoid_process_now)))
   :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is NOT excluded if (the patient has concomitant rheumatoid arthritis) AND (the patient does NOT have extra-articular disease characteristic of rheumatoid arthritis); otherwise, the patient is excluded."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const high_dose_therapy_is_contraindicated_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if high-dose therapy is currently contraindicated for the patient due to infection.","when_to_set_to_false":"Set to false if high-dose therapy is not currently contraindicated for the patient due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether high-dose therapy is currently contraindicated for the patient due to infection.","meaning":"Boolean indicating whether high-dose therapy is currently contraindicated for the patient due to infection."} ;; "contraindication to safe use of high-dose therapy due to infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection is active.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection is active.","meaning":"Boolean indicating whether the patient's current disorder due to infection is active."} ;; "active infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection is uncontrolled.","meaning":"Boolean indicating whether the patient's current disorder due to infection is uncontrolled."} ;; "uncontrolled infection"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@active
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ22_AUXILIARY0)) ;; "active infection"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@uncontrolled
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ22_AUXILIARY1)) ;; "uncontrolled infection"

;; Definition: high-dose therapy contraindicated due to infection requires active, uncontrolled infection
(assert
(! (= high_dose_therapy_is_contraindicated_due_to_infection_now
      (and patient_has_finding_of_disorder_due_to_infection_now@@active
           patient_has_finding_of_disorder_due_to_infection_now@@uncontrolled))
:named REQ22_AUXILIARY2)) ;; "active uncontrolled infection that is a contraindication to safe use of high-dose therapy"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not high_dose_therapy_is_contraindicated_due_to_infection_now)
:named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active uncontrolled infection that is a contraindication to safe use of high-dose therapy."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_finding_of_hepatitis_b_surface_antigen_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive hepatitis B surface antigen study.","when_to_set_to_false":"Set to false if the patient currently does not have a positive hepatitis B surface antigen study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive hepatitis B surface antigen study.","meaning":"Boolean indicating whether the patient currently has a positive hepatitis B surface antigen study."} ;; "positive study for hepatitis B surface antigen"
(declare-const patient_has_finding_of_polymerase_chain_reaction_test_for_hepatitis_b_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive hepatitis B polymerase chain reaction (PCR) test.","when_to_set_to_false":"Set to false if the patient currently does not have a positive hepatitis B polymerase chain reaction (PCR) test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive hepatitis B polymerase chain reaction (PCR) test.","meaning":"Boolean indicating whether the patient currently has a positive hepatitis B polymerase chain reaction (PCR) test."} ;; "hepatitis B confirmed by polymerase chain reaction"
(declare-const patient_has_finding_of_polymerase_chain_reaction_test_for_hepatitis_c_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive hepatitis C polymerase chain reaction (PCR) test.","when_to_set_to_false":"Set to false if the patient currently does not have a positive hepatitis C polymerase chain reaction (PCR) test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive hepatitis C polymerase chain reaction (PCR) test.","meaning":"Boolean indicating whether the patient currently has a positive hepatitis C polymerase chain reaction (PCR) test."} ;; "hepatitis C confirmed by polymerase chain reaction"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not patient_has_finding_of_hepatitis_b_surface_antigen_positive_now)
:named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive study for hepatitis B surface antigen."

(assert
(! (not patient_has_finding_of_polymerase_chain_reaction_test_for_hepatitis_b_positive_now)
:named REQ23_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatitis B confirmed by polymerase chain reaction."

(assert
(! (not patient_has_finding_of_polymerase_chain_reaction_test_for_hepatitis_c_positive_now)
:named REQ23_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatitis C confirmed by polymerase chain reaction."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_antibody_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has positive serology for human immunodeficiency virus (HIV antibody positive status).","when_to_set_to_false":"Set to false if the patient currently does not have positive serology for human immunodeficiency virus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has positive serology for human immunodeficiency virus.","meaning":"Boolean indicating whether the patient currently has positive serology for human immunodeficiency virus (HIV antibody positive status)."} ;; "positive serology for human immunodeficiency virus"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_antibody_positive_now)
:named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has positive serology for human immunodeficiency virus."
