;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_systolic_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of systolic heart failure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of systolic heart failure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of systolic heart failure.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of systolic heart failure in their history."} // "systolic heart failure"
(declare-const patient_has_undergone_hospital_admission_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a hospital admission at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a hospital admission at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a hospital admission.","meaning":"Boolean indicating whether the patient has ever undergone a hospital admission in their history."} // "admitted to hospital"
(declare-const patient_has_undergone_hospital_admission_inthehistory@@occurred_in_year_2009 Bool) ;; {"when_to_set_to_true":"Set to true if the hospital admission occurred in the year 2009.","when_to_set_to_false":"Set to false if the hospital admission did not occur in the year 2009.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hospital admission occurred in the year 2009.","meaning":"Boolean indicating whether the hospital admission occurred in the year 2009."} // "admitted in the year 2009"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a left ventricular ejection fraction (LVEF) measurement in percent is available at any time in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's left ventricular ejection fraction (LVEF) in percent, recorded at any time in their history."} // "left ventricular ejection fraction < 45 %"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_hospital_admission_inthehistory@@occurred_in_year_2009
         patient_has_undergone_hospital_admission_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "admitted in the year 2009" implies "admitted to hospital"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Admitted to hospital with systolic heart failure (LVEF < 45%)
(assert
  (! (and patient_has_undergone_hospital_admission_inthehistory
          patient_has_diagnosis_of_systolic_heart_failure_inthehistory
          (< patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent 45.0))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "admitted to hospital with systolic heart failure (left ventricular ejection fraction < 45 %)"

;; Component 1: Admitted in the year 2009
(assert
  (! patient_has_undergone_hospital_admission_inthehistory@@occurred_in_year_2009
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "admitted in the year 2009"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 20 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be age ≥ 20 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 20)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
;; "To be included, the patient must have been admitted to hospital (with non-exhaustive examples (emergency area OR internal medicine wards OR cardiology wards OR coronary care unit OR intensive care unit))."
;; "admitted to hospital"
;; Already declared: patient_has_undergone_hospital_admission_inthehistory

(declare-const patient_has_undergone_admission_to_emergency_area_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been admitted to an emergency area at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been admitted to an emergency area in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been admitted to an emergency area in their history.","meaning":"Boolean indicating whether the patient has ever undergone admission to an emergency area in their history."} // "emergency area"
(declare-const patient_has_undergone_admission_to_acute_internal_medicine_department_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been admitted to an acute internal medicine department (internal medicine ward) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been admitted to an acute internal medicine department (internal medicine ward) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been admitted to an acute internal medicine department (internal medicine ward) in their history.","meaning":"Boolean indicating whether the patient has ever undergone admission to an acute internal medicine department (internal medicine ward) in their history."} // "internal medicine wards"
(declare-const patient_has_undergone_admission_to_cardiology_department_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been admitted to a cardiology department (cardiology ward) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been admitted to a cardiology department (cardiology ward) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been admitted to a cardiology department (cardiology ward) in their history.","meaning":"Boolean indicating whether the patient has ever undergone admission to a cardiology department (cardiology ward) in their history."} // "cardiology wards"
(declare-const patient_has_undergone_admission_to_cardiac_intensive_care_unit_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been admitted to a cardiac intensive care unit (coronary care unit) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been admitted to a cardiac intensive care unit (coronary care unit) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been admitted to a cardiac intensive care unit (coronary care unit) in their history.","meaning":"Boolean indicating whether the patient has ever undergone admission to a cardiac intensive care unit (coronary care unit) in their history."} // "coronary care unit"
(declare-const patient_has_undergone_admission_to_intensive_care_unit_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been admitted to an intensive care unit at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been admitted to an intensive care unit in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been admitted to an intensive care unit in their history.","meaning":"Boolean indicating whether the patient has ever undergone admission to an intensive care unit in their history."} // "intensive care unit"

;; "To be included, the patient must have dyspnea."
(declare-const patient_has_finding_of_dyspnea_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of dyspnea (shortness of breath) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of dyspnea (shortness of breath) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had the clinical finding of dyspnea (shortness of breath) in their history.","meaning":"Boolean indicating whether the patient has ever had the clinical finding of dyspnea (shortness of breath) in their history."} // "dyspnea"

;; "To be included, the patient must have verification of heart failure based on ALL of the following criteria: (1) symptoms typical of heart failure (with non-exhaustive examples (breathlessness at rest OR breathlessness on exercise OR fatigue OR tiredness OR ankle swelling)), AND (2) signs typical of heart failure (with non-exhaustive examples (tachycardia OR tachypnoea OR pulmonary rales OR pleural effusion OR raised jugular venous pressure OR peripheral oedema OR hepatomegaly)), AND (3) (objective evidence of a structural abnormality of the heart at rest (with non-exhaustive examples (cardiomegaly OR third heart sound OR cardiac murmurs OR abnormality on the echocardiogram OR raised natriuretic peptide concentration)) OR objective evidence of a functional abnormality of the heart at rest (with non-exhaustive examples (cardiomegaly OR third heart sound OR cardiac murmurs OR abnormality on the echocardiogram OR raised natriuretic peptide concentration)))."
(declare-const patient_has_symptoms_typical_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had symptoms typical of heart failure in their history.","when_to_set_to_false":"Set to false if the patient has never had symptoms typical of heart failure in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had symptoms typical of heart failure in their history.","meaning":"Boolean indicating whether the patient has ever had symptoms typical of heart failure in their history."} // "symptoms typical of heart failure"
(declare-const patient_has_signs_typical_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had signs typical of heart failure in their history.","when_to_set_to_false":"Set to false if the patient has never had signs typical of heart failure in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had signs typical of heart failure in their history.","meaning":"Boolean indicating whether the patient has ever had signs typical of heart failure in their history."} // "signs typical of heart failure"
(declare-const patient_has_objective_evidence_of_structural_abnormality_of_heart_at_rest_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has objective evidence of a structural abnormality of the heart at rest in their history.","when_to_set_to_false":"Set to false if the patient does not have objective evidence of a structural abnormality of the heart at rest in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has objective evidence of a structural abnormality of the heart at rest in their history.","meaning":"Boolean indicating whether the patient has objective evidence of a structural abnormality of the heart at rest in their history."} // "objective evidence of a structural abnormality of the heart at rest"
(declare-const patient_has_objective_evidence_of_functional_abnormality_of_heart_at_rest_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has objective evidence of a functional abnormality of the heart at rest in their history.","when_to_set_to_false":"Set to false if the patient does not have objective evidence of a functional abnormality of the heart at rest in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has objective evidence of a functional abnormality of the heart at rest in their history.","meaning":"Boolean indicating whether the patient has objective evidence of a functional abnormality of the heart at rest in their history."} // "objective evidence of a functional abnormality of the heart at rest"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples for hospital admission: each example implies the umbrella term
(assert
  (! (=> patient_has_undergone_admission_to_emergency_area_inthehistory
         patient_has_undergone_hospital_admission_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "emergency area" is a non-exhaustive example of hospital admission

(assert
  (! (=> patient_has_undergone_admission_to_acute_internal_medicine_department_inthehistory
         patient_has_undergone_hospital_admission_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "internal medicine wards" is a non-exhaustive example of hospital admission

(assert
  (! (=> patient_has_undergone_admission_to_cardiology_department_inthehistory
         patient_has_undergone_hospital_admission_inthehistory)
     :named REQ2_AUXILIARY2)) ;; "cardiology wards" is a non-exhaustive example of hospital admission

(assert
  (! (=> patient_has_undergone_admission_to_cardiac_intensive_care_unit_inthehistory
         patient_has_undergone_hospital_admission_inthehistory)
     :named REQ2_AUXILIARY3)) ;; "coronary care unit" is a non-exhaustive example of hospital admission

(assert
  (! (=> patient_has_undergone_admission_to_intensive_care_unit_inthehistory
         patient_has_undergone_hospital_admission_inthehistory)
     :named REQ2_AUXILIARY4)) ;; "intensive care unit" is a non-exhaustive example of hospital admission

;; Non-exhaustive examples for symptoms typical of heart failure
(declare-const patient_has_symptom_of_breathlessness_at_rest_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had breathlessness at rest in their history.","when_to_set_to_false":"Set to false if the patient has never had breathlessness at rest in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had breathlessness at rest in their history.","meaning":"Boolean indicating whether the patient has ever had breathlessness at rest in their history."} // "breathlessness at rest"
(declare-const patient_has_symptom_of_breathlessness_on_exercise_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had breathlessness on exercise in their history.","when_to_set_to_false":"Set to false if the patient has never had breathlessness on exercise in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had breathlessness on exercise in their history.","meaning":"Boolean indicating whether the patient has ever had breathlessness on exercise in their history."} // "breathlessness on exercise"
(declare-const patient_has_symptom_of_fatigue_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had fatigue in their history.","when_to_set_to_false":"Set to false if the patient has never had fatigue in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had fatigue in their history.","meaning":"Boolean indicating whether the patient has ever had fatigue in their history."} // "fatigue"
(declare-const patient_has_symptom_of_tiredness_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had tiredness in their history.","when_to_set_to_false":"Set to false if the patient has never had tiredness in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had tiredness in their history.","meaning":"Boolean indicating whether the patient has ever had tiredness in their history."} // "tiredness"
(declare-const patient_has_symptom_of_ankle_swelling_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had ankle swelling in their history.","when_to_set_to_false":"Set to false if the patient has never had ankle swelling in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had ankle swelling in their history.","meaning":"Boolean indicating whether the patient has ever had ankle swelling in their history."} // "ankle swelling"

(assert
  (! (=> (or patient_has_symptom_of_breathlessness_at_rest_inthehistory
             patient_has_symptom_of_breathlessness_on_exercise_inthehistory
             patient_has_symptom_of_fatigue_inthehistory
             patient_has_symptom_of_tiredness_inthehistory
             patient_has_symptom_of_ankle_swelling_inthehistory)
         patient_has_symptoms_typical_of_heart_failure_inthehistory)
     :named REQ2_AUXILIARY5)) ;; Non-exhaustive examples for symptoms typical of heart failure

;; Non-exhaustive examples for signs typical of heart failure
(declare-const patient_has_sign_of_tachycardia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had tachycardia in their history.","when_to_set_to_false":"Set to false if the patient has never had tachycardia in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had tachycardia in their history.","meaning":"Boolean indicating whether the patient has ever had tachycardia in their history."} // "tachycardia"
(declare-const patient_has_sign_of_tachypnoea_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had tachypnoea in their history.","when_to_set_to_false":"Set to false if the patient has never had tachypnoea in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had tachypnoea in their history.","meaning":"Boolean indicating whether the patient has ever had tachypnoea in their history."} // "tachypnoea"
(declare-const patient_has_sign_of_pulmonary_rales_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had pulmonary rales in their history.","when_to_set_to_false":"Set to false if the patient has never had pulmonary rales in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had pulmonary rales in their history.","meaning":"Boolean indicating whether the patient has ever had pulmonary rales in their history."} // "pulmonary rales"
(declare-const patient_has_sign_of_pleural_effusion_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had pleural effusion in their history.","when_to_set_to_false":"Set to false if the patient has never had pleural effusion in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had pleural effusion in their history.","meaning":"Boolean indicating whether the patient has ever had pleural effusion in their history."} // "pleural effusion"
(declare-const patient_has_sign_of_raised_jugular_venous_pressure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had raised jugular venous pressure in their history.","when_to_set_to_false":"Set to false if the patient has never had raised jugular venous pressure in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had raised jugular venous pressure in their history.","meaning":"Boolean indicating whether the patient has ever had raised jugular venous pressure in their history."} // "raised jugular venous pressure"
(declare-const patient_has_sign_of_peripheral_oedema_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had peripheral oedema in their history.","when_to_set_to_false":"Set to false if the patient has never had peripheral oedema in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had peripheral oedema in their history.","meaning":"Boolean indicating whether the patient has ever had peripheral oedema in their history."} // "peripheral oedema"
(declare-const patient_has_sign_of_hepatomegaly_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had hepatomegaly in their history.","when_to_set_to_false":"Set to false if the patient has never had hepatomegaly in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had hepatomegaly in their history.","meaning":"Boolean indicating whether the patient has ever had hepatomegaly in their history."} // "hepatomegaly"

(assert
  (! (=> (or patient_has_sign_of_tachycardia_inthehistory
             patient_has_sign_of_tachypnoea_inthehistory
             patient_has_sign_of_pulmonary_rales_inthehistory
             patient_has_sign_of_pleural_effusion_inthehistory
             patient_has_sign_of_raised_jugular_venous_pressure_inthehistory
             patient_has_sign_of_peripheral_oedema_inthehistory
             patient_has_sign_of_hepatomegaly_inthehistory)
         patient_has_signs_typical_of_heart_failure_inthehistory)
     :named REQ2_AUXILIARY6)) ;; Non-exhaustive examples for signs typical of heart failure

;; Non-exhaustive examples for objective evidence of structural/functional abnormality of heart at rest
(declare-const patient_has_evidence_of_cardiomegaly_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had evidence of cardiomegaly in their history.","when_to_set_to_false":"Set to false if the patient has never had evidence of cardiomegaly in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had evidence of cardiomegaly in their history.","meaning":"Boolean indicating whether the patient has ever had evidence of cardiomegaly in their history."} // "cardiomegaly"
(declare-const patient_has_evidence_of_third_heart_sound_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had evidence of a third heart sound in their history.","when_to_set_to_false":"Set to false if the patient has never had evidence of a third heart sound in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had evidence of a third heart sound in their history.","meaning":"Boolean indicating whether the patient has ever had evidence of a third heart sound in their history."} // "third heart sound"
(declare-const patient_has_evidence_of_cardiac_murmurs_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had evidence of cardiac murmurs in their history.","when_to_set_to_false":"Set to false if the patient has never had evidence of cardiac murmurs in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had evidence of cardiac murmurs in their history.","meaning":"Boolean indicating whether the patient has ever had evidence of cardiac murmurs in their history."} // "cardiac murmurs"
(declare-const patient_has_evidence_of_abnormality_on_echocardiogram_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had evidence of abnormality on echocardiogram in their history.","when_to_set_to_false":"Set to false if the patient has never had evidence of abnormality on echocardiogram in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had evidence of abnormality on echocardiogram in their history.","meaning":"Boolean indicating whether the patient has ever had evidence of abnormality on echocardiogram in their history."} // "abnormality on the echocardiogram"
(declare-const patient_has_evidence_of_raised_natriuretic_peptide_concentration_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had evidence of raised natriuretic peptide concentration in their history.","when_to_set_to_false":"Set to false if the patient has never had evidence of raised natriuretic peptide concentration in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had evidence of raised natriuretic peptide concentration in their history.","meaning":"Boolean indicating whether the patient has ever had evidence of raised natriuretic peptide concentration in their history."} // "raised natriuretic peptide concentration"

(assert
  (! (=> (or patient_has_evidence_of_cardiomegaly_inthehistory
             patient_has_evidence_of_third_heart_sound_inthehistory
             patient_has_evidence_of_cardiac_murmurs_inthehistory
             patient_has_evidence_of_abnormality_on_echocardiogram_inthehistory
             patient_has_evidence_of_raised_natriuretic_peptide_concentration_inthehistory)
         patient_has_objective_evidence_of_structural_abnormality_of_heart_at_rest_inthehistory)
     :named REQ2_AUXILIARY7)) ;; Non-exhaustive examples for objective evidence of structural abnormality

(assert
  (! (=> (or patient_has_evidence_of_cardiomegaly_inthehistory
             patient_has_evidence_of_third_heart_sound_inthehistory
             patient_has_evidence_of_cardiac_murmurs_inthehistory
             patient_has_evidence_of_abnormality_on_echocardiogram_inthehistory
             patient_has_evidence_of_raised_natriuretic_peptide_concentration_inthehistory)
         patient_has_objective_evidence_of_functional_abnormality_of_heart_at_rest_inthehistory)
     :named REQ2_AUXILIARY8)) ;; Non-exhaustive examples for objective evidence of functional abnormality

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Admitted to hospital
(assert
  (! patient_has_undergone_hospital_admission_inthehistory
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "admitted to hospital"

;; Component 1: Dyspnea
(assert
  (! patient_has_finding_of_dyspnea_inthehistory
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "dyspnea"

;; Component 2: Verification of heart failure based on ALL of the following:
;; (1) symptoms typical of heart failure
;; (2) signs typical of heart failure
;; (3) (objective evidence of a structural abnormality of the heart at rest OR objective evidence of a functional abnormality of the heart at rest)
(assert
  (! (and patient_has_symptoms_typical_of_heart_failure_inthehistory
          patient_has_signs_typical_of_heart_failure_inthehistory
          (or patient_has_objective_evidence_of_structural_abnormality_of_heart_at_rest_inthehistory
              patient_has_objective_evidence_of_functional_abnormality_of_heart_at_rest_inthehistory))
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "verification of heart failure based on ALL of the following criteria"
