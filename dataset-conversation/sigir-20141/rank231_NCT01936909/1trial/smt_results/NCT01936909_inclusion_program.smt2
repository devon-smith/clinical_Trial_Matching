;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_decompensated_cardiac_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of decompensated heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of decompensated heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of decompensated heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of decompensated heart failure."} ;; "To be included, the patient must have a primary diagnosis for hospitalization of decompensated heart failure..."
(declare-const patient_has_diagnosis_of_decompensated_cardiac_failure_now@@primary_diagnosis_for_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of decompensated heart failure is the primary reason for hospitalization.","when_to_set_to_false":"Set to false if the diagnosis of decompensated heart failure is not the primary reason for hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is the primary reason for hospitalization.","meaning":"Boolean indicating whether the diagnosis of decompensated heart failure is the primary reason for hospitalization."} ;; "primary diagnosis for hospitalization"
(declare-const patient_has_diagnosis_of_decompensated_cardiac_failure_now@@established_as_finding_at_admission Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of decompensated heart failure was established as the finding at admission.","when_to_set_to_false":"Set to false if the diagnosis of decompensated heart failure was not established as the finding at admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was established as the finding at admission.","meaning":"Boolean indicating whether the diagnosis of decompensated heart failure was established as the finding at admission."} ;; "established as the finding at admission"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dyspnea.","meaning":"Boolean indicating whether the patient currently has the clinical finding of dyspnea."} ;; "dyspnea"
(declare-const patient_has_finding_of_respiratory_distress_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory distress.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of respiratory distress.","meaning":"Boolean indicating whether the patient currently has the clinical finding of respiratory distress."} ;; "respiratory distress"
(declare-const patient_has_finding_of_tachypnea_at_rest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachypnea at rest.","when_to_set_to_false":"Set to false if the patient currently does not have tachypnea at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachypnea at rest.","meaning":"Boolean indicating whether the patient currently has tachypnea at rest."} ;; "tachypnea at rest"
(declare-const patient_has_finding_of_tachypnea_with_minimal_exertion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachypnea with minimal exertion.","when_to_set_to_false":"Set to false if the patient currently does not have tachypnea with minimal exertion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachypnea with minimal exertion.","meaning":"Boolean indicating whether the patient currently has tachypnea with minimal exertion."} ;; "tachypnea with minimal exertion"
(declare-const patient_has_finding_of_elevated_cardiac_filling_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has elevated cardiac filling pressure.","when_to_set_to_false":"Set to false if the patient currently does not have elevated cardiac filling pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has elevated cardiac filling pressure.","meaning":"Boolean indicating whether the patient currently has elevated cardiac filling pressure."} ;; "evidence of elevated cardiac filling pressure"
(declare-const patient_has_finding_of_pulmonary_congestion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary congestion.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary congestion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pulmonary congestion.","meaning":"Boolean indicating whether the patient currently has the clinical finding of pulmonary congestion."} ;; "evidence of pulmonary congestion"
(declare-const patient_has_finding_of_pulmonary_congestion_now@@present_at_physical_exam Bool) ;; {"when_to_set_to_true":"Set to true if the clinical finding of pulmonary congestion is present at physical exam.","when_to_set_to_false":"Set to false if the clinical finding of pulmonary congestion is not present at physical exam.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical finding of pulmonary congestion is present at physical exam.","meaning":"Boolean indicating whether the clinical finding of pulmonary congestion is present at physical exam."} ;; "pulmonary congestion at physical exam"
(declare-const patient_has_finding_of_pulmonary_congestion_now@@present_at_chest_x_ray Bool) ;; {"when_to_set_to_true":"Set to true if the clinical finding of pulmonary congestion is present at chest X-ray.","when_to_set_to_false":"Set to false if the clinical finding of pulmonary congestion is not present at chest X-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical finding of pulmonary congestion is present at chest X-ray.","meaning":"Boolean indicating whether the clinical finding of pulmonary congestion is present at chest X-ray."} ;; "pulmonary congestion at chest X-ray"
(declare-const patient_has_finding_of_pulmonary_edema_now@@present_at_physical_exam Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary edema and it is present at physical exam.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary edema present at physical exam.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary edema present at physical exam.","meaning":"Boolean indicating whether the patient currently has pulmonary edema present at physical exam."} ;; "pulmonary edema at physical exam"
(declare-const patient_has_finding_of_pulmonary_edema_now@@present_at_chest_x_ray Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary edema and it is present at chest X-ray.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary edema present at chest X-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary edema present at chest X-ray.","meaning":"Boolean indicating whether the patient currently has pulmonary edema present at chest X-ray."} ;; "pulmonary edema at chest X-ray"
(declare-const patient_b_type_natriuretic_peptide_value_recorded_now_withunit_picograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of plasma brain natriuretic peptide level in picograms per milliliter recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current plasma brain natriuretic peptide level in picograms per milliliter."} ;; "plasma brain natriuretic peptide level ≥ 200 picograms per milliliter"
(declare-const patient_left_ventricular_end_diastolic_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of left ventricular end-diastolic pressure in millimeters of mercury recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current left ventricular end-diastolic pressure in millimeters of mercury."} ;; "left ventricular end-diastolic pressure"
(declare-const patient_left_ventricular_end_diastolic_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_invasively Bool) ;; {"when_to_set_to_true":"Set to true if the measurement of left ventricular end-diastolic pressure was performed invasively.","when_to_set_to_false":"Set to false if the measurement of left ventricular end-diastolic pressure was not performed invasively.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was performed invasively.","meaning":"Boolean indicating whether the measurement of left ventricular end-diastolic pressure was performed invasively."} ;; "invasive measurement of left ventricular end-diastolic pressure"
(declare-const patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of pulmonary artery wedge pressure in millimeters of mercury recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current pulmonary artery wedge pressure in millimeters of mercury."} ;; "pulmonary artery occluding pressure (wedge)"
(declare-const patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_invasively Bool) ;; {"when_to_set_to_true":"Set to true if the measurement of pulmonary artery wedge pressure was performed invasively.","when_to_set_to_false":"Set to false if the measurement of pulmonary artery wedge pressure was not performed invasively.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was performed invasively.","meaning":"Boolean indicating whether the measurement of pulmonary artery wedge pressure was performed invasively."} ;; "invasive measurement of pulmonary artery occluding pressure (wedge)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_decompensated_cardiac_failure_now@@primary_diagnosis_for_hospitalization
         patient_has_diagnosis_of_decompensated_cardiac_failure_now)
     :named REQ0_AUXILIARY0)) ;; "primary diagnosis for hospitalization"

(assert
  (! (=> patient_has_diagnosis_of_decompensated_cardiac_failure_now@@established_as_finding_at_admission
         patient_has_diagnosis_of_decompensated_cardiac_failure_now)
     :named REQ0_AUXILIARY1)) ;; "established as the finding at admission"

(assert
  (! (=> patient_has_finding_of_pulmonary_congestion_now@@present_at_physical_exam
         patient_has_finding_of_pulmonary_congestion_now)
     :named REQ0_AUXILIARY2)) ;; "pulmonary congestion at physical exam"

(assert
  (! (=> patient_has_finding_of_pulmonary_congestion_now@@present_at_chest_x_ray
         patient_has_finding_of_pulmonary_congestion_now)
     :named REQ0_AUXILIARY3)) ;; "pulmonary congestion at chest X-ray"

;; Define pulmonary edema at chest X-ray as a separate variable (not in <new_variable_declarations>), so declare it here:
(assert
  (! (and patient_has_diagnosis_of_decompensated_cardiac_failure_now@@primary_diagnosis_for_hospitalization
          patient_has_diagnosis_of_decompensated_cardiac_failure_now@@established_as_finding_at_admission
          (or patient_has_finding_of_dyspnea_now
              patient_has_finding_of_respiratory_distress_now
              patient_has_finding_of_tachypnea_at_rest_now
              patient_has_finding_of_tachypnea_with_minimal_exertion_now))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a primary diagnosis for hospitalization of decompensated heart failure, established as the finding at admission of (dyspnea OR respiratory distress OR tachypnea at rest OR tachypnea with minimal exertion)."

;; Component 1: evidence of elevated cardiac filling pressure OR evidence of pulmonary congestion (at least one of these conditions must be met)
(assert
  (! (or patient_has_finding_of_elevated_cardiac_filling_pressure_now
         patient_has_finding_of_pulmonary_congestion_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "evidence of elevated cardiac filling pressure OR evidence of pulmonary congestion"

;; Component 2: pulmonary congestion at physical exam OR pulmonary edema at physical exam OR pulmonary congestion at chest X-ray OR pulmonary edema at chest X-ray
(assert
  (! (or patient_has_finding_of_pulmonary_congestion_now@@present_at_physical_exam
         patient_has_finding_of_pulmonary_edema_now@@present_at_physical_exam
         patient_has_finding_of_pulmonary_congestion_now@@present_at_chest_x_ray
         patient_has_finding_of_pulmonary_edema_now@@present_at_chest_x_ray)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "pulmonary congestion at physical exam OR pulmonary edema at physical exam OR pulmonary congestion at chest X-ray OR pulmonary edema at chest X-ray"

;; Component 3: plasma brain natriuretic peptide level ≥ 200 picograms per milliliter
(assert
  (! (>= patient_b_type_natriuretic_peptide_value_recorded_now_withunit_picograms_per_milliliter 200.0)
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "plasma brain natriuretic peptide level ≥ 200 picograms per milliliter"

;; Component 4: invasive measurement of left ventricular end-diastolic pressure > 18 mmHg OR invasive measurement of pulmonary artery occluding pressure (wedge) > 16 mmHg
(assert
  (! (or (and patient_left_ventricular_end_diastolic_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_invasively
              (> patient_left_ventricular_end_diastolic_pressure_value_recorded_now_withunit_millimeters_of_mercury 18.0))
         (and patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_invasively
              (> patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury 16.0)))
     :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "invasive measurement of left ventricular end-diastolic pressure > 18 millimeters of mercury OR invasive measurement of pulmonary artery occluding pressure (wedge) > 16 millimeters of mercury"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const left_ventricular_ejection_fraction_value_recorded_most_recent_assessment_in_past_12_months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's left ventricular ejection fraction as measured by any imaging modality at the most recent assessment within the past 12 months, in percent.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined for the most recent assessment within the past 12 months.","meaning":"Numeric value representing the patient's left ventricular ejection fraction at the most recent assessment by any imaging modality within the past 12 months, in percent."} ;; "ejection fraction < 50 percent at most recent assessment by any imaging modality within 12 months"
(declare-const patient_has_finding_of_left_ventricular_systolic_dysfunction_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has documentation of impaired left ventricular systolic function (left ventricular systolic dysfunction) at any time within the past 12 months.","when_to_set_to_false":"Set to false if the patient does not have documentation of impaired left ventricular systolic function at any time within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has impaired left ventricular systolic function within the past 12 months.","meaning":"Boolean indicating whether the patient has impaired left ventricular systolic function documented within the past 12 months."} ;; "impaired left ventricular systolic function documented within the past 12 months"
(declare-const patient_has_finding_of_left_ventricular_systolic_dysfunction_inthepast12months@@most_recent_assessment_by_any_imaging_modality Bool) ;; {"when_to_set_to_true":"Set to true if the documentation of impaired left ventricular systolic function within the past 12 months is from the most recent assessment by any imaging modality.","when_to_set_to_false":"Set to false if the documentation is not from the most recent assessment by any imaging modality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the documentation is from the most recent assessment by any imaging modality.","meaning":"Boolean indicating whether the documentation of impaired left ventricular systolic function within the past 12 months is from the most recent assessment by any imaging modality."} ;; "impaired left ventricular systolic function at most recent assessment by any imaging modality within 12 months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_left_ventricular_systolic_dysfunction_inthepast12months@@most_recent_assessment_by_any_imaging_modality
         patient_has_finding_of_left_ventricular_systolic_dysfunction_inthepast12months)
     :named REQ1_AUXILIARY0)) ;; "documentation of impaired left ventricular systolic function at most recent assessment by any imaging modality within 12 months" implies "documentation of impaired left ventricular systolic function within 12 months"

;; Impaired left ventricular systolic function at most recent assessment is defined by ejection fraction < 50 percent
(assert
  (! (= patient_has_finding_of_left_ventricular_systolic_dysfunction_inthepast12months@@most_recent_assessment_by_any_imaging_modality
        (< left_ventricular_ejection_fraction_value_recorded_most_recent_assessment_in_past_12_months_withunit_percent 50.0))
     :named REQ1_AUXILIARY1)) ;; "impaired left ventricular systolic function at most recent assessment by any imaging modality within 12 months" is defined as ejection fraction < 50 percent

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_left_ventricular_systolic_dysfunction_inthepast12months@@most_recent_assessment_by_any_imaging_modality
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have prior documentation of impaired left ventricular systolic function (ejection fraction < 50 percent) at most recent assessment by any imaging modality within 12 months."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_patient_s_condition_stable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is clinically stable now.","when_to_set_to_false":"Set to false if the patient is not clinically stable now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is clinically stable now.","meaning":"Boolean indicating whether the patient is clinically stable at the present time."} ;; "now be clinically stable"
(declare-const patient_has_undergone_discharge_from_hospital_now@@documented_by_standard_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hospital discharge now is documented by standard criteria.","when_to_set_to_false":"Set to false if the patient's hospital discharge now is not documented by standard criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hospital discharge now is documented by standard criteria.","meaning":"Boolean indicating whether the patient's hospital discharge now is documented by standard criteria."} ;; "meet standard criteria for hospital discharge as documented by ..."
(declare-const patient_has_finding_of_absence_of_dyspnea_at_rest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has absence of dyspnea at rest.","when_to_set_to_false":"Set to false if the patient currently does not have absence of dyspnea at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has absence of dyspnea at rest.","meaning":"Boolean indicating whether the patient currently has absence of dyspnea at rest."} ;; "absence of dyspnea at rest"
(declare-const patient_has_finding_of_absence_of_pulmonary_congestion_at_rest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has absence of pulmonary congestion at rest.","when_to_set_to_false":"Set to false if the patient currently does not have absence of pulmonary congestion at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has absence of pulmonary congestion at rest.","meaning":"Boolean indicating whether the patient currently has absence of pulmonary congestion at rest."} ;; "absence of pulmonary congestion at rest"
(declare-const patient_has_finding_of_absence_of_pulmonary_distress_at_rest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has absence of pulmonary distress at rest.","when_to_set_to_false":"Set to false if the patient currently does not have absence of pulmonary distress at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has absence of pulmonary distress at rest.","meaning":"Boolean indicating whether the patient currently has absence of pulmonary distress at rest."} ;; "absence of pulmonary distress at rest"
(declare-const patient_has_finding_of_absence_of_pitting_edema_in_lower_extremities_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has absence of pitting edema in the lower extremities.","when_to_set_to_false":"Set to false if the patient currently does not have absence of pitting edema in the lower extremities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has absence of pitting edema in the lower extremities.","meaning":"Boolean indicating whether the patient currently has absence of pitting edema in the lower extremities."} ;; "absence of pitting edema in the lower extremities"
(declare-const patient_has_finding_of_absence_of_pitting_edema_in_any_other_region_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has absence of pitting edema in any other region.","when_to_set_to_false":"Set to false if the patient currently does not have absence of pitting edema in any other region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has absence of pitting edema in any other region.","meaning":"Boolean indicating whether the patient currently has absence of pitting edema in any other region."} ;; "absence of pitting edema in any other region"
(declare-const patient_has_finding_of_stable_hemodynamic_parameters_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stable hemodynamic parameters.","when_to_set_to_false":"Set to false if the patient currently does not have stable hemodynamic parameters.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stable hemodynamic parameters.","meaning":"Boolean indicating whether the patient currently has stable hemodynamic parameters."} ;; "stable hemodynamic parameters (blood pressure AND heart rate)"
(declare-const patient_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the value of the patient's blood pressure recorded now, in mm Hg.","when_to_set_to_null":"Set to null if the patient's blood pressure value recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's blood pressure recorded at the present time, in mm Hg."} ;; "blood pressure"
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the value of the patient's heart rate recorded now, in beats per minute.","when_to_set_to_null":"Set to null if the patient's heart rate value recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's heart rate recorded at the present time, in beats per minute."} ;; "heart rate"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for hospital discharge implies stem variable
(assert
  (! (=> patient_has_undergone_discharge_from_hospital_now@@documented_by_standard_criteria
         true)
     :named REQ2_AUXILIARY0)) ;; "meet standard criteria for hospital discharge as documented by ..."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must now be clinically stable
(assert
  (! patient_has_finding_of_patient_s_condition_stable_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "now be clinically stable"

;; Component 1: Patient must meet standard criteria for hospital discharge as documented by (absence of dyspnea at rest OR absence of pulmonary congestion at rest OR absence of pulmonary distress at rest)
(assert
  (! (or patient_has_finding_of_absence_of_dyspnea_at_rest_now
         patient_has_finding_of_absence_of_pulmonary_congestion_at_rest_now
         patient_has_finding_of_absence_of_pulmonary_distress_at_rest_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "absence of dyspnea at rest OR absence of pulmonary congestion at rest OR absence of pulmonary distress at rest"

;; Component 2: Patient must have (absence of pitting edema in the lower extremities OR absence of pitting edema in any other region)
(assert
  (! (or patient_has_finding_of_absence_of_pitting_edema_in_lower_extremities_now
         patient_has_finding_of_absence_of_pitting_edema_in_any_other_region_now)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "absence of pitting edema in the lower extremities OR absence of pitting edema in any other region"

;; Component 3: Patient must have stable hemodynamic parameters (blood pressure AND heart rate)
(assert
  (! patient_has_finding_of_stable_hemodynamic_parameters_now
     :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "stable hemodynamic parameters (blood pressure AND heart rate)"

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "be of age ≥ 21 years old"
(declare-const patient_is_willing_to_provide_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is currently not willing to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to provide written informed consent.","meaning":"Boolean indicating whether the patient is currently willing to provide written informed consent."} ;; "be willing"
(declare-const patient_is_able_to_provide_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide written informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide written informed consent."} ;; "be able to provide written informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Patient must be of age ≥ 21 years old
(assert
  (! (>= patient_age_value_recorded_now_in_years 21)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be of age ≥ 21 years old."

;; Component 1: Patient must be willing to provide written informed consent
(assert
  (! patient_is_willing_to_provide_written_informed_consent_now
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing."

;; Component 2: Patient must be able to provide written informed consent
(assert
  (! patient_is_able_to_provide_written_informed_consent_now
     :named REQ3_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be able to provide written informed consent."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_willing_to_comply_with_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to comply with the protocol, including self administration of the treatment and the exercise protocol.","when_to_set_to_false":"Set to false if the patient is currently not willing to comply with the protocol, including self administration of the treatment and the exercise protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to comply with the protocol, including self administration of the treatment and the exercise protocol.","meaning":"Boolean indicating whether the patient is currently willing to comply with the study protocol, including self administration of the treatment and the exercise protocol."} ;; "be willing to comply with the protocol (self administration of the treatment AND exercise protocol)"
(declare-const patient_is_able_to_comply_with_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to comply with the protocol, including self administration of the treatment and the exercise protocol.","when_to_set_to_false":"Set to false if the patient is currently not able to comply with the protocol, including self administration of the treatment and the exercise protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to comply with the protocol, including self administration of the treatment and the exercise protocol.","meaning":"Boolean indicating whether the patient is currently able to comply with the study protocol, including self administration of the treatment and the exercise protocol."} ;; "be able to comply with the protocol (self administration of the treatment AND exercise protocol)"
(declare-const patient_is_able_to_self_administer_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to self administer the treatment as required by the protocol.","when_to_set_to_false":"Set to false if the patient is currently not able to self administer the treatment as required by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to self administer the treatment as required by the protocol.","meaning":"Boolean indicating whether the patient is currently able to self administer the treatment as required by the protocol."} ;; "be able to self administer the treatment"
(declare-const patient_is_able_to_comply_with_exercise_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to comply with the exercise protocol as required by the study protocol.","when_to_set_to_false":"Set to false if the patient is currently not able to comply with the exercise protocol as required by the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to comply with the exercise protocol as required by the study protocol.","meaning":"Boolean indicating whether the patient is currently able to comply with the exercise protocol as required by the study protocol."} ;; "be able to comply with the exercise protocol"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: "able to comply with protocol" means able to self administer treatment AND able to comply with exercise protocol
(assert
  (! (= patient_is_able_to_comply_with_protocol_now
        (and patient_is_able_to_self_administer_treatment_now
             patient_is_able_to_comply_with_exercise_protocol_now))
     :named REQ4_AUXILIARY0)) ;; "able to comply with the protocol (self administration of the treatment AND exercise protocol)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: patient must be willing to comply with protocol
(assert
  (! patient_is_willing_to_comply_with_protocol_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to comply with the protocol"

;; Component 1: patient must be able to comply with protocol (which is defined as both self administration and exercise protocol)
(assert
  (! patient_is_able_to_comply_with_protocol_now
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be able to comply with the protocol (self administration of the treatment AND exercise protocol)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_plasma_c_reactive_protein_measurement_value_recorded_now_withunit_milligrams_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's screening plasma C-reactive protein (CRP) level in milligrams per liter is available at the time of screening.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's screening plasma C-reactive protein (CRP) level in milligrams per liter, measured at screening."} ;; "screening plasma C-reactive protein level > 2 milligrams per liter"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (> patient_plasma_c_reactive_protein_measurement_value_recorded_now_withunit_milligrams_per_liter 2.0)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "screening plasma C-reactive protein level > 2 milligrams per liter"
