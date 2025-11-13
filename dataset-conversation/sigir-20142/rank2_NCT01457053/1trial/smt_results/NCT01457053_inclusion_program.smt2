;; ===================== Declarations for the inclusion criteria (REQ 0) =====================

(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is male."}  ;; "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."}  ;; "be female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."}  ;; "be non-pregnant"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "be aged > 18 years"
(declare-const patient_is_undergoing_hospital_admission_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the hospital.","when_to_set_to_false":"Set to false if the patient is currently not admitted to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the hospital.","meaning":"Boolean indicating whether the patient is currently admitted to the hospital."}  ;; "be admitted to the hospital"
(declare-const patient_is_being_treated_in_outpatient_heart_failure_clinic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated in an outpatient heart failure clinic.","when_to_set_to_false":"Set to false if the patient is currently not being treated in an outpatient heart failure clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated in an outpatient heart failure clinic.","meaning":"Boolean indicating whether the patient is currently being treated in an outpatient heart failure clinic."}  ;; "be treated in an outpatient heart failure clinic"
(declare-const patient_has_diagnosis_of_decompensated_cardiac_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute decompensated heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute decompensated heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute decompensated heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute decompensated heart failure."}  ;; "acute decompensated heart failure"
(declare-const patient_has_diagnosis_of_decompensated_cardiac_failure_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if acute decompensated heart failure is the patient's primary diagnosis.","when_to_set_to_false":"Set to false if acute decompensated heart failure is not the patient's primary diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether acute decompensated heart failure is the patient's primary diagnosis.","meaning":"Boolean indicating whether acute decompensated heart failure is the patient's primary diagnosis."}  ;; "primary diagnosis of acute decompensated heart failure"
(declare-const patient_has_diagnosis_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart failure."}  ;; "heart failure"

;; ===================== Auxiliary Assertions (REQ 0) =====================

;; Qualifier variable for primary diagnosis implies the base diagnosis
(assert
  (! (=> patient_has_diagnosis_of_decompensated_cardiac_failure_now@@primary_diagnosis
         patient_has_diagnosis_of_decompensated_cardiac_failure_now)
     :named REQ0_AUXILIARY0)) ;; "primary diagnosis of acute decompensated heart failure" implies "diagnosis of acute decompensated heart failure"

;; ===================== Constraint Assertions (REQ 0) =====================

;; Component 0: ((be male) OR ((be female) AND (be non-pregnant) AND (be aged > 18 years)))
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (not patient_is_pregnant_now)
              (> patient_age_value_recorded_now_in_years 18)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be male) OR ((be female) AND (be non-pregnant) AND (be aged > 18 years)))."

;; Component 1: ((be admitted to the hospital) OR (be treated in an outpatient heart failure clinic))
(assert
  (! (or patient_is_undergoing_hospital_admission_now
         patient_is_being_treated_in_outpatient_heart_failure_clinic_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be admitted to the hospital) OR (be treated in an outpatient heart failure clinic))."

;; Component 2: (have the primary diagnosis of acute decompensated heart failure)
(assert
  (! patient_has_diagnosis_of_decompensated_cardiac_failure_now@@primary_diagnosis
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have the primary diagnosis of acute decompensated heart failure."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================

;; Fluid overload > 8 kg above dry weight
(declare-const patient_hypervolemia_value_recorded_now_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value in kilograms if the patient's fluid overload above dry weight is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fluid overload in kilograms above dry weight."} ;; "have evidence of fluid overload > 8 kilograms above the dry weight of the patient"

;; Hypervolemia definition (at least two of the following findings)
(declare-const patient_has_finding_of_hypervolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypervolemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypervolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypervolemia.","meaning":"Boolean indicating whether the patient currently has hypervolemia."} ;; "conform to the definition of hypervolemia"

;; Pitting edema of the lower extremities > 1+
(declare-const patient_pitting_edema_value_recorded_now_withunit_plus Real) ;; {"when_to_set_to_value":"Set to the measured degree (e.g., 1+, 2+) if pitting edema in the lower extremities is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the degree of pitting edema in the lower extremities, recorded now, on the plus scale."} ;; "pitting edema of the lower extremities > 1+"

;; Jugular venous pressure > 10 cm water
(declare-const patient_jugular_venous_pressure_value_recorded_now_withunit_centimeters_water Real) ;; {"when_to_set_to_value":"Set to the measured value in centimeters of water if jugular venous pressure is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's jugular venous pressure in centimeters of water, recorded now."} ;; "jugular venous pressure > 10 centimeters water"

;; Pulmonary edema on chest radiograph consistent with acute decompensated heart failure
(declare-const patient_has_finding_of_pulmonary_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary edema.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary edema.","meaning":"Boolean indicating whether the patient currently has pulmonary edema."} ;; "pulmonary edema on chest radiograph consistent with acute decompensated heart failure"
(declare-const patient_has_finding_of_pulmonary_edema_now@@identified_on_chest_radiograph Bool) ;; {"when_to_set_to_true":"Set to true if pulmonary edema is identified on chest radiograph.","when_to_set_to_false":"Set to false if pulmonary edema is not identified on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether pulmonary edema is identified on chest radiograph.","meaning":"Boolean indicating whether pulmonary edema is identified on chest radiograph."} ;; "pulmonary edema on chest radiograph"
(declare-const patient_has_finding_of_pulmonary_edema_now@@consistent_with_acute_decompensated_heart_failure Bool) ;; {"when_to_set_to_true":"Set to true if pulmonary edema is consistent with acute decompensated heart failure.","when_to_set_to_false":"Set to false if pulmonary edema is not consistent with acute decompensated heart failure.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether pulmonary edema is consistent with acute decompensated heart failure.","meaning":"Boolean indicating whether pulmonary edema is consistent with acute decompensated heart failure."} ;; "pulmonary edema ... consistent with acute decompensated heart failure"

;; Pleural effusion on chest radiograph consistent with acute decompensated heart failure
(declare-const patient_has_finding_of_pleural_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pleural effusion.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pleural effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleural effusion.","meaning":"Boolean indicating whether the patient currently has pleural effusion."} ;; "pleural effusion on chest radiograph consistent with acute decompensated heart failure"
(declare-const patient_has_finding_of_pleural_effusion_now@@identified_on_chest_radiograph Bool) ;; {"when_to_set_to_true":"Set to true if pleural effusion is identified on chest radiograph.","when_to_set_to_false":"Set to false if pleural effusion is not identified on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether pleural effusion is identified on chest radiograph.","meaning":"Boolean indicating whether pleural effusion is identified on chest radiograph."} ;; "pleural effusion on chest radiograph"
(declare-const patient_has_finding_of_pleural_effusion_now@@consistent_with_acute_decompensated_heart_failure Bool) ;; {"when_to_set_to_true":"Set to true if pleural effusion is consistent with acute decompensated heart failure.","when_to_set_to_false":"Set to false if pleural effusion is not consistent with acute decompensated heart failure.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether pleural effusion is consistent with acute decompensated heart failure.","meaning":"Boolean indicating whether pleural effusion is consistent with acute decompensated heart failure."} ;; "pleural effusion ... consistent with acute decompensated heart failure"

;; Ascites
(declare-const patient_has_finding_of_ascites_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ascites.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ascites.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ascites.","meaning":"Boolean indicating whether the patient currently has ascites."} ;; "ascites"

;; Paroxysmal nocturnal dyspnea
(declare-const patient_has_finding_of_paroxysmal_nocturnal_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of paroxysmal nocturnal dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of paroxysmal nocturnal dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paroxysmal nocturnal dyspnea.","meaning":"Boolean indicating whether the patient currently has paroxysmal nocturnal dyspnea."} ;; "paroxysmal nocturnal dyspnea"

;; Orthopnea requiring ≥ 2 pillows
(declare-const patient_orthopnea_value_recorded_now_withunit_pillows Real) ;; {"when_to_set_to_value":"Set to the measured number of pillows if orthopnea is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the number of pillows required for orthopnea, recorded now."} ;; "orthopnea requiring ≥ 2 pillows"

;; ===================== Auxiliary Assertions (REQ 1) =====================

;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_pulmonary_edema_now@@identified_on_chest_radiograph
         patient_has_finding_of_pulmonary_edema_now)
     :named REQ1_AUXILIARY0)) ;; "pulmonary edema on chest radiograph"

(assert
  (! (=> patient_has_finding_of_pulmonary_edema_now@@consistent_with_acute_decompensated_heart_failure
         patient_has_finding_of_pulmonary_edema_now)
     :named REQ1_AUXILIARY1)) ;; "pulmonary edema ... consistent with acute decompensated heart failure"

(assert
  (! (=> patient_has_finding_of_pleural_effusion_now@@identified_on_chest_radiograph
         patient_has_finding_of_pleural_effusion_now)
     :named REQ1_AUXILIARY2)) ;; "pleural effusion on chest radiograph"

(assert
  (! (=> patient_has_finding_of_pleural_effusion_now@@consistent_with_acute_decompensated_heart_failure
         patient_has_finding_of_pleural_effusion_now)
     :named REQ1_AUXILIARY3)) ;; "pleural effusion ... consistent with acute decompensated heart failure"

;; Pulmonary edema on chest radiograph consistent with acute decompensated heart failure
(define-fun pulmonary_edema_chest_xray_adhf () Bool
  (and patient_has_finding_of_pulmonary_edema_now
       patient_has_finding_of_pulmonary_edema_now@@identified_on_chest_radiograph
       patient_has_finding_of_pulmonary_edema_now@@consistent_with_acute_decompensated_heart_failure)) ;; "pulmonary edema on chest radiograph consistent with acute decompensated heart failure"

;; Pleural effusion on chest radiograph consistent with acute decompensated heart failure
(define-fun pleural_effusion_chest_xray_adhf () Bool
  (and patient_has_finding_of_pleural_effusion_now
       patient_has_finding_of_pleural_effusion_now@@identified_on_chest_radiograph
       patient_has_finding_of_pleural_effusion_now@@consistent_with_acute_decompensated_heart_failure)) ;; "pleural effusion on chest radiograph consistent with acute decompensated heart failure"

;; At least two of the following findings for hypervolemia:
;; 1. pitting edema of the lower extremities > 1+
;; 2. jugular venous pressure > 10 cm water
;; 3. pulmonary edema on chest radiograph consistent with acute decompensated heart failure
;; 4. pleural effusion on chest radiograph consistent with acute decompensated heart failure
;; 5. ascites
;; 6. paroxysmal nocturnal dyspnea
;; 7. orthopnea requiring ≥ 2 pillows

(define-fun hypervolemia_criteria_count () Int
  (+ (ite (> patient_pitting_edema_value_recorded_now_withunit_plus 1.0) 1 0)
     (ite (> patient_jugular_venous_pressure_value_recorded_now_withunit_centimeters_water 10.0) 1 0)
     (ite pulmonary_edema_chest_xray_adhf 1 0)
     (ite pleural_effusion_chest_xray_adhf 1 0)
     (ite patient_has_finding_of_ascites_now 1 0)
     (ite patient_has_finding_of_paroxysmal_nocturnal_dyspnea_now 1 0)
     (ite (>= patient_orthopnea_value_recorded_now_withunit_pillows 2.0) 1 0))) ;; "at least two of the following findings"

;; Definitional equivalence for hypervolemia as per requirement
(assert
  (! (= patient_has_finding_of_hypervolemia_now
        (>= hypervolemia_criteria_count 2))
     :named REQ1_AUXILIARY4)) ;; "conform to the definition of hypervolemia (have at least two of the following findings...)"

;; ===================== Constraint Assertions (REQ 1) =====================

;; Component 0: Fluid overload > 8 kg above dry weight
(assert
  (! (> patient_hypervolemia_value_recorded_now_withunit_kilograms 8.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have evidence of fluid overload > 8 kilograms above the dry weight of the patient"

;; Component 1: Must conform to the definition of hypervolemia (at least two findings)
(assert
  (! patient_has_finding_of_hypervolemia_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "conform to the definition of hypervolemia (have at least two of the following findings...)"
