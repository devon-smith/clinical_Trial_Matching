;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must be aged ≥ 65 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."}

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have hypertension.
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have hypertension."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "To be included, the patient must have diabetes."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_diagnosis_of_diabetes_mellitus_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have diabetes."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the patient's current body mass index value in kg/m^2 if available.","when_to_set_to_null":"Set to null if the patient's current body mass index value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's body mass index (BMI) measured now, in units of kilograms per square meter (kg/m^2)."} ;; "body mass index > 35"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} ;; "obesity"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition in the requirement: obesity is defined as BMI > 35
(assert
  (! (= patient_has_finding_of_obesity_now
        (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 35.0))
     :named REQ3_AUXILIARY0)) ;; "obesity (defined as body mass index > 35)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have obesity (defined as body mass index > 35)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "To be included, the patient must have renal insufficiency."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_renal_insufficiency_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have renal insufficiency."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_tobacco_user_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a tobacco user.","when_to_set_to_false":"Set to false if the patient is currently not a tobacco user.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a tobacco user.","meaning":"Boolean indicating whether the patient is currently a tobacco user."} ;; "To be included, the patient must have tobacco usage."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_tobacco_user_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have tobacco usage."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_hypercholesterolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypercholesterolemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypercholesterolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypercholesterolemia.","meaning":"Boolean indicating whether the patient currently has hypercholesterolemia."} ;; "To be included, the patient must have hypercholesterolemia."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_finding_of_hypercholesterolemia_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hypercholesterolemia."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_sleep_apnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sleep apnea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sleep apnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sleep apnea.","meaning":"Boolean indicating whether the patient currently has sleep apnea."} ;; "sleep apnea"
(declare-const patient_has_finding_of_heavy_snoring_at_night_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heavy snoring at night.","when_to_set_to_false":"Set to false if the patient currently does not have heavy snoring at night.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heavy snoring at night.","meaning":"Boolean indicating whether the patient currently has heavy snoring at night."} ;; "heavy snoring at night"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must have (sleep apnea OR heavy snoring at night).
(assert
  (! (or patient_has_finding_of_sleep_apnea_now
         patient_has_finding_of_heavy_snoring_at_night_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (sleep apnea OR heavy snoring at night)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of congestive heart failure, as defined by the presence of at least one of the specified symptoms or signs.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of congestive heart failure."} ;; "To be included, the patient must have a clinical diagnosis of congestive heart failure (defined as at least one of the following: dyspnea on exertion OR paroxysmal nocturnal dyspnea OR orthopnea OR elevated jugular venous pressure OR pulmonary rales OR third heart sound OR cardiomegaly on chest x-ray OR pulmonary edema on chest x-ray OR peripheral edema OR hepatomegaly OR pleural effusion OR palpitations OR irregular heart beats OR chest pain at rest OR chest pain at exercise OR murmur on examination)."
(declare-const patient_has_finding_of_dyspnea_on_exertion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea on exertion.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea on exertion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea on exertion.","meaning":"Boolean indicating whether the patient currently has dyspnea on exertion."} ;; "dyspnea on exertion"
(declare-const patient_has_finding_of_paroxysmal_nocturnal_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has paroxysmal nocturnal dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have paroxysmal nocturnal dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paroxysmal nocturnal dyspnea.","meaning":"Boolean indicating whether the patient currently has paroxysmal nocturnal dyspnea."} ;; "paroxysmal nocturnal dyspnea"
(declare-const patient_has_finding_of_orthopnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has orthopnea.","when_to_set_to_false":"Set to false if the patient currently does not have orthopnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has orthopnea.","meaning":"Boolean indicating whether the patient currently has orthopnea."} ;; "orthopnea"
(declare-const patient_has_finding_of_elevated_jugular_venous_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has elevated jugular venous pressure.","when_to_set_to_false":"Set to false if the patient currently does not have elevated jugular venous pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has elevated jugular venous pressure.","meaning":"Boolean indicating whether the patient currently has elevated jugular venous pressure."} ;; "elevated jugular venous pressure"
(declare-const patient_has_finding_of_pulmonary_rales_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary rales.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary rales.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary rales.","meaning":"Boolean indicating whether the patient currently has pulmonary rales."} ;; "pulmonary rales"
(declare-const patient_has_finding_of_third_heart_sound_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a third heart sound.","when_to_set_to_false":"Set to false if the patient currently does not have a third heart sound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a third heart sound.","meaning":"Boolean indicating whether the patient currently has a third heart sound."} ;; "third heart sound"
(declare-const patient_has_finding_of_cardiomegaly_on_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiomegaly on chest x-ray.","when_to_set_to_false":"Set to false if the patient currently does not have cardiomegaly on chest x-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiomegaly on chest x-ray.","meaning":"Boolean indicating whether the patient currently has cardiomegaly on chest x-ray."} ;; "cardiomegaly on chest x-ray"
(declare-const patient_has_finding_of_pulmonary_edema_on_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary edema on chest x-ray.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary edema on chest x-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary edema on chest x-ray.","meaning":"Boolean indicating whether the patient currently has pulmonary edema on chest x-ray."} ;; "pulmonary edema on chest x-ray"
(declare-const patient_has_finding_of_peripheral_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral edema.","when_to_set_to_false":"Set to false if the patient currently does not have peripheral edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral edema.","meaning":"Boolean indicating whether the patient currently has peripheral edema."} ;; "peripheral edema"
(declare-const patient_has_finding_of_hepatomegaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatomegaly.","when_to_set_to_false":"Set to false if the patient currently does not have hepatomegaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatomegaly.","meaning":"Boolean indicating whether the patient currently has hepatomegaly."} ;; "hepatomegaly"
(declare-const patient_has_finding_of_pleural_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pleural effusion.","when_to_set_to_false":"Set to false if the patient currently does not have pleural effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleural effusion.","meaning":"Boolean indicating whether the patient currently has pleural effusion."} ;; "pleural effusion"
(declare-const patient_has_finding_of_palpitations_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has palpitations.","when_to_set_to_false":"Set to false if the patient currently does not have palpitations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has palpitations.","meaning":"Boolean indicating whether the patient currently has palpitations."} ;; "palpitations"
(declare-const patient_has_finding_of_irregular_heart_beats_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has irregular heart beats.","when_to_set_to_false":"Set to false if the patient currently does not have irregular heart beats.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has irregular heart beats.","meaning":"Boolean indicating whether the patient currently has irregular heart beats."} ;; "irregular heart beats"
(declare-const patient_has_finding_of_chest_pain_at_rest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain at rest.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain at rest.","meaning":"Boolean indicating whether the patient currently has chest pain at rest."} ;; "chest pain at rest"
(declare-const patient_has_finding_of_chest_pain_at_exercise_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain at exercise.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain at exercise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain at exercise.","meaning":"Boolean indicating whether the patient currently has chest pain at exercise."} ;; "chest pain at exercise"
(declare-const patient_has_finding_of_murmur_on_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a murmur on examination.","when_to_set_to_false":"Set to false if the patient currently does not have a murmur on examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a murmur on examination.","meaning":"Boolean indicating whether the patient currently has a murmur on examination."} ;; "murmur on examination"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition in the requirement: clinical diagnosis of congestive heart failure is defined as at least one of the following findings
(assert
  (! (= patient_has_diagnosis_of_congestive_heart_failure_now
        (or patient_has_finding_of_dyspnea_on_exertion_now
            patient_has_finding_of_paroxysmal_nocturnal_dyspnea_now
            patient_has_finding_of_orthopnea_now
            patient_has_finding_of_elevated_jugular_venous_pressure_now
            patient_has_finding_of_pulmonary_rales_now
            patient_has_finding_of_third_heart_sound_now
            patient_has_finding_of_cardiomegaly_on_chest_x_ray_now
            patient_has_finding_of_pulmonary_edema_on_chest_x_ray_now
            patient_has_finding_of_peripheral_edema_now
            patient_has_finding_of_hepatomegaly_now
            patient_has_finding_of_pleural_effusion_now
            patient_has_finding_of_palpitations_now
            patient_has_finding_of_irregular_heart_beats_now
            patient_has_finding_of_chest_pain_at_rest_now
            patient_has_finding_of_chest_pain_at_exercise_now
            patient_has_finding_of_murmur_on_examination_now))
     :named REQ8_AUXILIARY0)) ;; "clinical diagnosis of congestive heart failure (defined as at least one of the following: ...)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_diagnosis_of_congestive_heart_failure_now
     :named REQ8_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of congestive heart failure (defined as at least one of the following: ...)"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary arteriosclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coronary arteriosclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary arteriosclerosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary arteriosclerosis."} ;; "known coronary artery disease"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of coronary arteriosclerosis is known (documented or confirmed).","when_to_set_to_false":"Set to false if the patient's diagnosis of coronary arteriosclerosis is not known (not documented or not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of coronary arteriosclerosis is known.","meaning":"Boolean indicating whether the patient's diagnosis of coronary arteriosclerosis is known."} ;; "known coronary artery disease"
(declare-const patient_has_finding_of_stented_coronary_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stented coronary arteries.","when_to_set_to_false":"Set to false if the patient currently does not have stented coronary arteries.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stented coronary arteries.","meaning":"Boolean indicating whether the patient currently has stented coronary arteries."} ;; "coronary artery stents"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass graft at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass graft at any time in their history."} ;; "history of coronary artery bypass graft"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_now@@known
         patient_has_diagnosis_of_coronary_arteriosclerosis_now)
     :named REQ9_AUXILIARY0)) ;; "known coronary artery disease" implies "coronary artery disease"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: To be included, the patient must have (known coronary artery disease OR coronary artery stents OR history of coronary artery bypass graft).
(assert
  (! (or patient_has_diagnosis_of_coronary_arteriosclerosis_now@@known
         patient_has_finding_of_stented_coronary_artery_now
         patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
     :named REQ9_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (known coronary artery disease OR coronary artery stents OR history of coronary artery bypass graft)."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a heart valve disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a heart valve disorder.","meaning":"Boolean indicating whether the patient currently has a heart valve disorder."} ;; "valvular disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart valve disorder is known (i.e., confirmed and documented).","when_to_set_to_false":"Set to false if the patient's heart valve disorder is not known (i.e., only suspected, undiagnosed, or not documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart valve disorder is known.","meaning":"Boolean indicating whether the patient's heart valve disorder is known."} ;; "known valvular disease"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_heart_valve_disorder_now@@known
         patient_has_finding_of_heart_valve_disorder_now)
     :named REQ10_AUXILIARY0)) ;; "known valvular disease"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! patient_has_finding_of_heart_valve_disorder_now@@known
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have known valvular disease."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a stroke at any time in the past.","when_to_set_to_false":"Set to false if the patient has not had a stroke at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a stroke in the past.","meaning":"Boolean indicating whether the patient has had a stroke at any time in the past."} ;; "had a known stroke"
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior stroke is known (documented or confirmed).","when_to_set_to_false":"Set to false if the patient's prior stroke is not known (not documented or not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prior stroke is known.","meaning":"Boolean indicating whether the patient's prior stroke is known (documented or confirmed)."} ;; "had a known stroke"
(declare-const patient_has_finding_of_transient_cerebral_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a transient ischemic attack at any time in the past.","when_to_set_to_false":"Set to false if the patient has not had a transient ischemic attack at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a transient ischemic attack in the past.","meaning":"Boolean indicating whether the patient has had a transient ischemic attack at any time in the past."} ;; "had a transient ischemic attack"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable for "known stroke" implies the patient has had a stroke in the past
(assert
  (! (=> patient_has_finding_of_cerebrovascular_accident_inthehistory@@known
         patient_has_finding_of_cerebrovascular_accident_inthehistory)
     :named REQ11_AUXILIARY0)) ;; "had a known stroke" means both stroke in history and known/documented

;; ===================== Constraint Assertions (REQ 11) =====================
;; To be included, the patient must have (had a known stroke OR had a transient ischemic attack)
(assert
  (! (or patient_has_finding_of_cerebrovascular_accident_inthehistory@@known
         patient_has_finding_of_transient_cerebral_ischemia_inthehistory)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (had a known stroke OR had a transient ischemic attack)."
