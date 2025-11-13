;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_ischemic_stroke_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ischemic stroke.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ischemic stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ischemic stroke.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ischemic stroke."}  ;; "acute ischemic cerebral stroke"
(declare-const patient_has_diagnosis_of_ischemic_stroke_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ischemic stroke diagnosis is acute.","when_to_set_to_false":"Set to false if the patient's ischemic stroke diagnosis is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ischemic stroke diagnosis is acute.","meaning":"Boolean indicating whether the patient's ischemic stroke diagnosis is acute."}  ;; "acute ischemic cerebral stroke"
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poor hypertension control (uncontrollable hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poor hypertension control (uncontrollable hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor hypertension control.","meaning":"Boolean indicating whether the patient currently has poor hypertension control (uncontrollable hypertension)."}  ;; "uncontrollable hypertension"
(declare-const patients_blood_pressure_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's blood pressure is currently abnormal.","when_to_set_to_false":"Set to false if the patient's blood pressure is currently not abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's blood pressure is abnormal.","meaning":"Boolean indicating whether the patient's blood pressure is currently abnormal."}  ;; "blood pressure"
(declare-const patients_blood_pressure_is_abnormal_now@@may_need_to_be_controlled_for_thrombolytic_therapy_consideration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal blood pressure may need to be controlled for the purpose of considering thrombolytic therapy.","when_to_set_to_false":"Set to false if the patient's abnormal blood pressure does not need to be controlled for the purpose of considering thrombolytic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether blood pressure control is needed for thrombolytic therapy consideration.","meaning":"Boolean indicating whether the patient's abnormal blood pressure may need to be controlled for the purpose of considering thrombolytic therapy."}  ;; "may need to have blood pressure controlled for the purpose of considering thrombolytic therapy"
(declare-const patients_blood_pressure_is_abnormal_now@@may_need_to_be_controlled_for_anticoagulation_therapy_consideration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal blood pressure may need to be controlled for the purpose of considering anticoagulation therapy.","when_to_set_to_false":"Set to false if the patient's abnormal blood pressure does not need to be controlled for the purpose of considering anticoagulation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether blood pressure control is needed for anticoagulation therapy consideration.","meaning":"Boolean indicating whether the patient's abnormal blood pressure may need to be controlled for the purpose of considering anticoagulation therapy."}  ;; "may need to have blood pressure controlled for the purpose of considering anticoagulation therapy"
(declare-const patient_can_undergo_thrombolytic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo thrombolytic therapy.","when_to_set_to_false":"Set to false if the patient cannot currently undergo thrombolytic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo thrombolytic therapy.","meaning":"Boolean indicating whether the patient can currently undergo thrombolytic therapy."}  ;; "thrombolytic therapy"
(declare-const patient_can_undergo_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient cannot currently undergo anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo anticoagulant therapy.","meaning":"Boolean indicating whether the patient can currently undergo anticoagulant therapy."}  ;; "anticoagulation therapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable (acute ischemic stroke)
(assert
  (! (=> patient_has_diagnosis_of_ischemic_stroke_now@@acute
         patient_has_diagnosis_of_ischemic_stroke_now)
     :named REQ1_AUXILIARY0)) ;; "acute ischemic cerebral stroke"

;; Qualifier variable implies corresponding stem variable (abnormal BP for thrombolytic therapy)
(assert
  (! (=> patients_blood_pressure_is_abnormal_now@@may_need_to_be_controlled_for_thrombolytic_therapy_consideration
         patients_blood_pressure_is_abnormal_now)
     :named REQ1_AUXILIARY1)) ;; "may need to have blood pressure controlled for the purpose of considering thrombolytic therapy"

;; Qualifier variable implies corresponding stem variable (abnormal BP for anticoagulation therapy)
(assert
  (! (=> patients_blood_pressure_is_abnormal_now@@may_need_to_be_controlled_for_anticoagulation_therapy_consideration
         patients_blood_pressure_is_abnormal_now)
     :named REQ1_AUXILIARY2)) ;; "may need to have blood pressure controlled for the purpose of considering anticoagulation therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have acute ischemic cerebral stroke
(assert
  (! patient_has_diagnosis_of_ischemic_stroke_now@@acute
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "acute ischemic cerebral stroke"

;; Component 1: Must have uncontrollable hypertension
(assert
  (! patient_has_finding_of_poor_hypertension_control_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "uncontrollable hypertension"

;; Component 2: Must (may need to have blood pressure controlled for thrombolytic therapy OR anticoagulation therapy)
(assert
  (! (or patients_blood_pressure_is_abnormal_now@@may_need_to_be_controlled_for_thrombolytic_therapy_consideration
         patients_blood_pressure_is_abnormal_now@@may_need_to_be_controlled_for_anticoagulation_therapy_consideration)
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "may need to have blood pressure controlled for the purpose of considering thrombolytic therapy OR anticoagulation therapy"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_intracerebral_hemorrhagic_stroke_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of intracerebral hemorrhagic stroke.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of intracerebral hemorrhagic stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of intracerebral hemorrhagic stroke.","meaning":"Boolean indicating whether the patient currently has a diagnosis of intracerebral hemorrhagic stroke."}  ;; "intracerebral hemorrhagic stroke in any territory"
(declare-const patient_has_diagnosis_of_subarachnoid_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of subarachnoid hemorrhage.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of subarachnoid hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of subarachnoid hemorrhage.","meaning":"Boolean indicating whether the patient currently has a diagnosis of subarachnoid hemorrhage."}  ;; "subarachnoid hemorrhage"
(declare-const patient_has_diagnosis_of_subarachnoid_hemorrhage_now@@surgically_treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of subarachnoid hemorrhage and the hemorrhage was surgically treated.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of subarachnoid hemorrhage and the hemorrhage was not surgically treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the subarachnoid hemorrhage was surgically treated.","meaning":"Boolean indicating whether the patient's current subarachnoid hemorrhage diagnosis was surgically treated."}  ;; "subarachnoid hemorrhage (surgically treated)"
(declare-const patient_has_diagnosis_of_subarachnoid_hemorrhage_now@@not_surgically_treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of subarachnoid hemorrhage and the hemorrhage was not surgically treated.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of subarachnoid hemorrhage and the hemorrhage was surgically treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the subarachnoid hemorrhage was not surgically treated.","meaning":"Boolean indicating whether the patient's current subarachnoid hemorrhage diagnosis was not surgically treated."}  ;; "subarachnoid hemorrhage (not surgically treated)"
(declare-const patient_has_undergone_appropriate_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an appropriate study now.","when_to_set_to_false":"Set to false if the patient has not undergone an appropriate study now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an appropriate study now.","meaning":"Boolean indicating whether the patient has undergone an appropriate study now."}  ;; "appropriate study"
(declare-const patient_has_undergone_appropriate_study_now@@provides_results_consistent_with_intracerebral_hemorrhagic_stroke_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the appropriate study provides results consistent with the diagnosis of intracerebral hemorrhagic stroke.","when_to_set_to_false":"Set to false if the appropriate study does not provide results consistent with the diagnosis of intracerebral hemorrhagic stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the appropriate study provides results consistent with the diagnosis of intracerebral hemorrhagic stroke.","meaning":"Boolean indicating whether the appropriate study provides results consistent with the diagnosis of intracerebral hemorrhagic stroke."}  ;; "appropriate study providing results consistent with this diagnosis"
(declare-const patient_has_undergone_ct_of_head_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a head CT scan now.","when_to_set_to_false":"Set to false if the patient has not undergone a head CT scan now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a head CT scan now.","meaning":"Boolean indicating whether the patient has undergone a head CT scan now."}  ;; "head computed tomography scan"
(declare-const patient_has_undergone_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a magnetic resonance imaging scan now.","when_to_set_to_false":"Set to false if the patient has not undergone a magnetic resonance imaging scan now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a magnetic resonance imaging scan now.","meaning":"Boolean indicating whether the patient has undergone a magnetic resonance imaging scan now."}  ;; "magnetic resonance imaging scan"
(declare-const patient_may_require_control_of_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient may require control of blood pressure now.","when_to_set_to_false":"Set to false if the patient does not require control of blood pressure now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient may require control of blood pressure now.","meaning":"Boolean indicating whether the patient may require control of blood pressure now."}  ;; "may require the control of blood pressure"
(declare-const patient_may_require_control_of_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient may require control of hypertension now.","when_to_set_to_false":"Set to false if the patient does not require control of hypertension now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient may require control of hypertension now.","meaning":"Boolean indicating whether the patient may require control of hypertension now."}  ;; "may require the control of hypertension"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples: subarachnoid hemorrhage (surgically treated OR not surgically treated) implies intracerebral hemorrhagic stroke
(assert
  (! (=> (or patient_has_diagnosis_of_subarachnoid_hemorrhage_now
            patient_has_diagnosis_of_subarachnoid_hemorrhage_now@@surgically_treated
            patient_has_diagnosis_of_subarachnoid_hemorrhage_now@@not_surgically_treated)
         patient_has_diagnosis_of_intracerebral_hemorrhagic_stroke_now)
     :named REQ2_AUXILIARY0)) ;; "subarachnoid hemorrhage (surgically treated OR not surgically treated)" is a non-exhaustive example of intracerebral hemorrhagic stroke

;; Qualifier variables imply corresponding stem variable for subarachnoid hemorrhage
(assert
  (! (=> patient_has_diagnosis_of_subarachnoid_hemorrhage_now@@surgically_treated
         patient_has_diagnosis_of_subarachnoid_hemorrhage_now)
     :named REQ2_AUXILIARY1)) ;; "surgically treated" qualifier implies subarachnoid hemorrhage

(assert
  (! (=> patient_has_diagnosis_of_subarachnoid_hemorrhage_now@@not_surgically_treated
         patient_has_diagnosis_of_subarachnoid_hemorrhage_now)
     :named REQ2_AUXILIARY2)) ;; "not surgically treated" qualifier implies subarachnoid hemorrhage

;; Non-exhaustive examples: head CT or MRI scan implies appropriate study
(assert
  (! (=> (or patient_has_undergone_ct_of_head_now
            patient_has_undergone_magnetic_resonance_imaging_now)
         patient_has_undergone_appropriate_study_now)
     :named REQ2_AUXILIARY3)) ;; "head computed tomography scan OR magnetic resonance imaging scan" are non-exhaustive examples of appropriate study

;; Qualifier variable for appropriate study providing results consistent with diagnosis
(assert
  (! (=> patient_has_undergone_appropriate_study_now@@provides_results_consistent_with_intracerebral_hemorrhagic_stroke_diagnosis
         patient_has_undergone_appropriate_study_now)
     :named REQ2_AUXILIARY4)) ;; "appropriate study providing results consistent with this diagnosis" qualifier

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have intracerebral hemorrhagic stroke in any territory
(assert
  (! patient_has_diagnosis_of_intracerebral_hemorrhagic_stroke_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have intracerebral hemorrhagic stroke in any territory"

;; Component 1: Must have an appropriate study providing results consistent with this diagnosis
(assert
  (! patient_has_undergone_appropriate_study_now@@provides_results_consistent_with_intracerebral_hemorrhagic_stroke_diagnosis
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "must have an appropriate study providing results consistent with this diagnosis"

;; Component 2: May require the control of hypertension OR may require the control of blood pressure
(assert
  (! (or patient_may_require_control_of_hypertension_now
         patient_may_require_control_of_blood_pressure_now)
     :named REQ2_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "may require the control of hypertension OR may require the control of blood pressure"
