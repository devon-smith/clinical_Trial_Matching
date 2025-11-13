;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age > 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_hospital_admission_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the hospital for any reason.","when_to_set_to_false":"Set to false if the patient is not currently admitted to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the hospital.","meaning":"Boolean indicating whether the patient is currently admitted to the hospital."}  ;; "hospital admission"
(declare-const patient_has_undergone_hospital_admission_now@@admission_reason_is_acute_heart_failure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hospital admission is specifically for acute heart failure.","when_to_set_to_false":"Set to false if the patient's current hospital admission is not for acute heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reason for hospital admission is acute heart failure.","meaning":"Boolean indicating whether the reason for the patient's current hospital admission is acute heart failure."}  ;; "hospital admission for acute heart failure"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea.","meaning":"Boolean indicating whether the patient currently has dyspnea."}  ;; "presence of acute dyspnea"
(declare-const patient_has_finding_of_dyspnea_now@@dyspnea_is_acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dyspnea is acute.","when_to_set_to_false":"Set to false if the patient's current dyspnea is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dyspnea is acute.","meaning":"Boolean indicating whether the patient's current dyspnea is acute."}  ;; "acute dyspnea"
(declare-const patient_has_clinical_signs_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of heart failure.","meaning":"Boolean indicating whether the patient currently has clinical signs of heart failure."}  ;; "clinical signs of heart failure"
(declare-const patient_has_clinical_signs_of_heart_failure_now@@signs_present_on_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinical signs of heart failure are present on physical examination.","when_to_set_to_false":"Set to false if the patient's clinical signs of heart failure are not present on physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinical signs of heart failure are present on physical examination.","meaning":"Boolean indicating whether the patient's clinical signs of heart failure are present on physical examination."}  ;; "clinical signs of heart failure on physical examination"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for hospital admission reason implies hospital admission
(assert
  (! (=> patient_has_undergone_hospital_admission_now@@admission_reason_is_acute_heart_failure
         patient_has_undergone_hospital_admission_now)
     :named REQ1_AUXILIARY0)) ;; "hospital admission for acute heart failure"

;; Qualifier variable for acute dyspnea implies dyspnea
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@dyspnea_is_acute
         patient_has_finding_of_dyspnea_now)
     :named REQ1_AUXILIARY1)) ;; "acute dyspnea"

;; Qualifier variable for clinical signs of heart failure on physical exam implies clinical signs of heart failure
(assert
  (! (=> patient_has_clinical_signs_of_heart_failure_now@@signs_present_on_physical_examination
         patient_has_clinical_signs_of_heart_failure_now)
     :named REQ1_AUXILIARY2)) ;; "clinical signs of heart failure on physical examination"

;; Definition: Hospital admission for acute heart failure is defined as (presence of acute dyspnea AND presence of clinical signs of heart failure on physical examination)
(assert
  (! (= patient_has_undergone_hospital_admission_now@@admission_reason_is_acute_heart_failure
        (and patient_has_finding_of_dyspnea_now@@dyspnea_is_acute
             patient_has_clinical_signs_of_heart_failure_now@@signs_present_on_physical_examination))
     :named REQ1_AUXILIARY3)) ;; "hospital admission for acute heart failure (defined as (presence of acute dyspnea AND presence of clinical signs of heart failure on physical examination))"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_undergone_hospital_admission_now@@admission_reason_is_acute_heart_failure
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have hospital admission for acute heart failure (defined as (presence of acute dyspnea AND presence of clinical signs of heart failure on physical examination))."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_n_terminal_pro_brain_natriuretic_peptide_level_value_recorded_now_withunit_picograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's NT-proBNP concentration is recorded now in picograms per milliliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current NT-proBNP concentration in picograms per milliliter."} ;; "N-terminal pro b-type natriuretic peptide concentration"
(declare-const patient_has_diagnosis_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of atrial fibrillation."} ;; "atrial fibrillation"
(declare-const patient_has_diagnosis_of_atrial_fibrillation_now@@at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of atrial fibrillation is present at the time of screening.","when_to_set_to_false":"Set to false if the diagnosis of atrial fibrillation is not present at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of atrial fibrillation is present at the time of screening.","meaning":"Boolean indicating whether the diagnosis of atrial fibrillation is present at screening."} ;; "atrial fibrillation at screening"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's BMI is recorded now in kilograms per square meter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current BMI in kilograms per square meter."} ;; "body mass index"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthepast12months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's LVEF is recorded within the previous 12 months in percent.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's LVEF in percent, measured within the previous 12 months."} ;; "left ventricular ejection fraction < 45 percent assessed by echocardiography OR other method within the previous 12 months"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthepast12months_withunit_percent@@assessed_by_echocardiography Bool) ;; {"when_to_set_to_true":"Set to true if the LVEF measurement within the previous 12 months was assessed by echocardiography.","when_to_set_to_false":"Set to false if the LVEF measurement within the previous 12 months was not assessed by echocardiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the LVEF measurement was assessed by echocardiography.","meaning":"Boolean indicating whether the LVEF measurement within the previous 12 months was assessed by echocardiography."} ;; "assessed by echocardiography"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthepast12months_withunit_percent@@assessed_by_other_method Bool) ;; {"when_to_set_to_true":"Set to true if the LVEF measurement within the previous 12 months was assessed by a method other than echocardiography.","when_to_set_to_false":"Set to false if the LVEF measurement within the previous 12 months was not assessed by a method other than echocardiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the LVEF measurement was assessed by a method other than echocardiography.","meaning":"Boolean indicating whether the LVEF measurement within the previous 12 months was assessed by a method other than echocardiography."} ;; "assessed by other method"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable for atrial fibrillation
(assert
  (! (=> patient_has_diagnosis_of_atrial_fibrillation_now@@at_screening
         patient_has_diagnosis_of_atrial_fibrillation_now)
     :named REQ2_AUXILIARY0)) ;; "atrial fibrillation at screening" implies "atrial fibrillation now"

;; Qualifier variable implies stem variable for LVEF assessed by echocardiography
(assert
  (! (=> patient_left_ventricular_ejection_fraction_value_recorded_inthepast12months_withunit_percent@@assessed_by_echocardiography
         true)
     :named REQ2_AUXILIARY1)) ;; "LVEF assessed by echocardiography" is a measurement within the previous 12 months

;; Qualifier variable implies stem variable for LVEF assessed by other method
(assert
  (! (=> patient_left_ventricular_ejection_fraction_value_recorded_inthepast12months_withunit_percent@@assessed_by_other_method
         true)
     :named REQ2_AUXILIARY2)) ;; "LVEF assessed by other method" is a measurement within the previous 12 months

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: NT-proBNP and related logic
(assert
  (! (or
        (> patient_n_terminal_pro_brain_natriuretic_peptide_level_value_recorded_now_withunit_picograms_per_milliliter 900.0)
        (and
          (> patient_n_terminal_pro_brain_natriuretic_peptide_level_value_recorded_now_withunit_picograms_per_milliliter 1800.0)
          patient_has_diagnosis_of_atrial_fibrillation_now@@at_screening)
        (and
          (> patient_n_terminal_pro_brain_natriuretic_peptide_level_value_recorded_now_withunit_picograms_per_milliliter 450.0)
          (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 35.0))
     )
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((NT-proBNP > 900) OR (NT-proBNP > 1800 AND AF at screening) OR (NT-proBNP > 450 AND BMI > 35))"

;; Component 1: LVEF < 45% by echo or other method within previous 12 months
(assert
  (! (and
        (< patient_left_ventricular_ejection_fraction_value_recorded_inthepast12months_withunit_percent 45.0)
        (or patient_left_ventricular_ejection_fraction_value_recorded_inthepast12months_withunit_percent@@assessed_by_echocardiography
            patient_left_ventricular_ejection_fraction_value_recorded_inthepast12months_withunit_percent@@assessed_by_other_method)
     )
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "LVEF < 45% assessed by echocardiography OR other method within previous 12 months"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const beta_adrenergic_receptor_blocker_is_contraindicated_now Bool) ;; {"when_to_set_to_true":"Set to true if a beta-adrenergic receptor blocker is currently contraindicated for the patient.","when_to_set_to_false":"Set to false if a beta-adrenergic receptor blocker is currently not contraindicated for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a beta-adrenergic receptor blocker is currently contraindicated for the patient.","meaning":"Boolean indicating whether a beta-adrenergic receptor blocker is currently contraindicated for the patient."} ;; "beta-adrenergic receptor blocker is contraindicated"
(declare-const beta_adrenergic_receptor_blocker_is_contraindicated_now@@due_to_severe_volume_overload_or_low_output_heart_failure_or_cardiogenic_shock Bool) ;; {"when_to_set_to_true":"Set to true if a beta-adrenergic receptor blocker is currently contraindicated for the patient due to severe volume overload, low output heart failure, or cardiogenic shock.","when_to_set_to_false":"Set to false if a beta-adrenergic receptor blocker is currently contraindicated for the patient but not due to these reasons, or if it is not contraindicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a beta-adrenergic receptor blocker is currently contraindicated for the patient due to severe volume overload, low output heart failure, or cardiogenic shock.","meaning":"Boolean indicating whether a beta-adrenergic receptor blocker is currently contraindicated for the patient due to severe volume overload, low output heart failure, or cardiogenic shock."} ;; "contraindicated due to severe volume overload, low output heart failure, or cardiogenic shock"
(declare-const patient_is_on_background_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on background therapy.","when_to_set_to_false":"Set to false if the patient is currently not on background therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on background therapy.","meaning":"Boolean indicating whether the patient is currently on background therapy."} ;; "on background therapy"
(declare-const patient_is_on_background_therapy_now@@includes_at_least_acei_or_arb_and_beta_blocker Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current background therapy includes at least an angiotensin-converting enzyme inhibitor or angiotensin receptor blocker and a beta-adrenergic receptor blocker.","when_to_set_to_false":"Set to false if the patient's current background therapy does not include at least an angiotensin-converting enzyme inhibitor or angiotensin receptor blocker and a beta-adrenergic receptor blocker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current background therapy includes at least an angiotensin-converting enzyme inhibitor or angiotensin receptor blocker and a beta-adrenergic receptor blocker.","meaning":"Boolean indicating whether the patient's current background therapy includes at least an angiotensin-converting enzyme inhibitor or angiotensin receptor blocker and a beta-adrenergic receptor blocker."} ;; "includes at least ACEI or ARB and beta-blocker"
(declare-const patient_is_on_background_therapy_now@@includes_at_least_acei_or_arb_and_not_beta_blocker_if_beta_blocker_contraindicated_due_to_severe_volume_overload_or_low_output_heart_failure_or_cardiogenic_shock Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current background therapy includes at least an angiotensin-converting enzyme inhibitor or angiotensin receptor blocker and does not include a beta-adrenergic receptor blocker, and the beta-adrenergic receptor blocker is contraindicated due to severe volume overload, low output heart failure, or cardiogenic shock.","when_to_set_to_false":"Set to false if the patient's current background therapy does not meet these criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current background therapy meets these criteria.","meaning":"Boolean indicating whether the patient's current background therapy includes at least an angiotensin-converting enzyme inhibitor or angiotensin receptor blocker and does not include a beta-adrenergic receptor blocker if the beta-adrenergic receptor blocker is contraindicated due to severe volume overload, low output heart failure, or cardiogenic shock."} ;; "includes at least ACEI or ARB and NOT beta-blocker if beta-blocker contraindicated due to severe volume overload, low output heart failure, or cardiogenic shock"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for contraindication due to specific reasons implies general contraindication
(assert
  (! (=> beta_adrenergic_receptor_blocker_is_contraindicated_now@@due_to_severe_volume_overload_or_low_output_heart_failure_or_cardiogenic_shock
         beta_adrenergic_receptor_blocker_is_contraindicated_now)
     :named REQ3_AUXILIARY0)) ;; "if contraindicated due to severe volume overload, low output heart failure, or cardiogenic shock, then contraindicated in general"

;; Qualifier variable for background therapy with NOT beta-blocker if contraindicated due to specific reasons
(assert
  (! (=> patient_is_on_background_therapy_now@@includes_at_least_acei_or_arb_and_not_beta_blocker_if_beta_blocker_contraindicated_due_to_severe_volume_overload_or_low_output_heart_failure_or_cardiogenic_shock
         (and patient_is_on_background_therapy_now
              beta_adrenergic_receptor_blocker_is_contraindicated_now@@due_to_severe_volume_overload_or_low_output_heart_failure_or_cardiogenic_shock))
     :named REQ3_AUXILIARY1)) ;; "if on background therapy with at least ACEI or ARB and NOT beta-blocker due to contraindication, then must be on background therapy and beta-blocker contraindicated for those reasons"

;; Qualifier variable for background therapy with both ACEI/ARB and beta-blocker
(assert
  (! (=> patient_is_on_background_therapy_now@@includes_at_least_acei_or_arb_and_beta_blocker
         patient_is_on_background_therapy_now)
     :named REQ3_AUXILIARY2)) ;; "if on background therapy with at least ACEI or ARB and beta-blocker, then on background therapy"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must be on background therapy with at least (ACEI or ARB) and beta-blocker,
;; OR on background therapy with at least (ACEI or ARB) and NOT beta-blocker if beta-blocker is contraindicated due to severe volume overload, low output heart failure, or cardiogenic shock.
(assert
  (! (or patient_is_on_background_therapy_now@@includes_at_least_acei_or_arb_and_beta_blocker
         patient_is_on_background_therapy_now@@includes_at_least_acei_or_arb_and_not_beta_blocker_if_beta_blocker_contraindicated_due_to_severe_volume_overload_or_low_output_heart_failure_or_cardiogenic_shock)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((be on background therapy with at least (ACEI OR ARB) AND beta-blocker) OR (be on background therapy with at least (ACEI OR ARB) AND NOT beta-blocker if beta-blocker is contraindicated due to (severe volume overload OR low output heart failure OR cardiogenic shock)))"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_available_for_regular_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the patient is available for regular follow up.","when_to_set_to_false":"Set to false if the patient is not available for regular follow up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is available for regular follow up.","meaning":"Boolean indicating whether the patient is available for regular follow up."}  ;; "the patient must be available for regular follow up"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_available_for_regular_follow_up
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be available for regular follow up"
