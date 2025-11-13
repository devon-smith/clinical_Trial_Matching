;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_sickle_cell_hemoglobin_ss_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sickle cell hemoglobin SS disease (sickle cell anemia).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sickle cell hemoglobin SS disease (sickle cell anemia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sickle cell hemoglobin SS disease (sickle cell anemia).","meaning":"Boolean indicating whether the patient currently has a diagnosis of sickle cell hemoglobin SS disease (sickle cell anemia)."} ;; "sickle cell anemia"
(declare-const patient_pain_crisis_value_recorded_inthepast2months_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of acute pain crises the patient experienced in the past two months.","when_to_set_to_null":"Set to null if the number of acute pain crises in the past two months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of acute pain crises the patient experienced in the past two months."} ;; "greater than two acute pain crises in the last two months"
(declare-const patient_is_exposed_to_hydroxyurea_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to hydroxyurea at any time in the past twelve months.","when_to_set_to_false":"Set to false if the patient has not been exposed to hydroxyurea at any time in the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to hydroxyurea in the past twelve months.","meaning":"Boolean indicating whether the patient has been exposed to hydroxyurea at any time in the past twelve months."} ;; "been on hydroxyurea therapy any time in the last twelve months"
(declare-const patient_is_exposed_to_butyric_acid_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to butyric acid (butyrate) at any time in the past twelve months.","when_to_set_to_false":"Set to false if the patient has not been exposed to butyric acid (butyrate) at any time in the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to butyric acid (butyrate) in the past twelve months.","meaning":"Boolean indicating whether the patient has been exposed to butyric acid (butyrate) at any time in the past twelve months."} ;; "been on butyrate therapy any time in the last twelve months"
(declare-const patient_has_undergone_transfusion_of_blood_product_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone transfusion of blood product within the past three months.","when_to_set_to_false":"Set to false if the patient has not undergone transfusion of blood product within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone transfusion of blood product within the past three months.","meaning":"Boolean indicating whether the patient has undergone transfusion of blood product within the past three months."} ;; "had a blood transfusion within the last three months"
(declare-const patient_hemoglobin_a_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent of hemoglobin A recorded now.","when_to_set_to_null":"Set to null if the percent of hemoglobin A recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the percent of hemoglobin A recorded now."} ;; "percent hemoglobin A greater than twenty percent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (> patient_pain_crisis_value_recorded_inthepast2months_withunit_count 2))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has greater than two acute pain crises in the last two months."

(assert
(! (not patient_is_exposed_to_hydroxyurea_inthepast12months)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been on hydroxyurea therapy any time in the last twelve months."

(assert
(! (not patient_is_exposed_to_butyric_acid_inthepast12months)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been on butyrate therapy any time in the last twelve months."

(assert
(! (not patient_has_undergone_transfusion_of_blood_product_inthepast3months)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a blood transfusion within the last three months."

(assert
(! (not (> patient_hemoglobin_a_value_recorded_now_withunit_percent 20))
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has percent hemoglobin A greater than twenty percent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is less than eighteen years old OR the patient is greater than sixty-five years old"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or (< patient_age_value_recorded_now_in_years 18)
            (> patient_age_value_recorded_now_in_years 65)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is less than eighteen years old) OR (the patient is greater than sixty-five years old))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be pregnant at the current time.","when_to_set_to_false":"Set to false if the patient is confirmed not to be pregnant at the current time.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is currently pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be lactating at the current time.","when_to_set_to_false":"Set to false if the patient is confirmed not to be lactating at the current time.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is currently lactating"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently pregnant."

(assert
(! (not patient_is_lactating_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently lactating."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_unable_to_exercise_anterior_tibialis_muscle_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to exercise the anterior tibialis muscle.","when_to_set_to_false":"Set to false if the patient is currently able to exercise the anterior tibialis muscle.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to exercise the anterior tibialis muscle.","meaning":"Boolean indicating whether the patient is currently unable to exercise the anterior tibialis muscle."} ;; "the patient is unable to exercise the anterior tibialis muscle"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_unable_to_exercise_anterior_tibialis_muscle_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to exercise the anterior tibialis muscle."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_cigarette_smoker_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been a cigarette smoker (i.e., has inhaled smoke from any tobacco product) at any time in the past 1 month.","when_to_set_to_false":"Set to false if the patient has not been a cigarette smoker (i.e., has not inhaled smoke from any tobacco product) at any time in the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been a cigarette smoker in the past 1 month.","meaning":"Boolean indicating whether the patient has been a cigarette smoker at any time in the past 1 month."} ;; "cigarette smoker, defined as the inhalation of smoke from any tobacco product in the last one month"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_cigarette_smoker_inthepast1months)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an active cigarette smoker, defined as the inhalation of smoke from any tobacco product in the last one month."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "the patient has diabetes mellitus"

(declare-const patient_has_diagnosis_of_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary artery disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary artery disease."} ;; "the patient has coronary artery disease"

(declare-const patient_has_diagnosis_of_peripheral_vascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peripheral vascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of peripheral vascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of peripheral vascular disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of peripheral vascular disease."} ;; "the patient has peripheral vascular disease"

(declare-const patient_has_finding_of_migraine_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had migraine headaches at any time in the past twelve months.","when_to_set_to_false":"Set to false if the patient has not had migraine headaches at any time in the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had migraine headaches in the past twelve months.","meaning":"Boolean indicating whether the patient has had migraine headaches in the past twelve months."} ;; "the patient has migraine headaches in the last twelve months"

(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of cerebrovascular accident at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of cerebrovascular accident at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of cerebrovascular accident.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cerebrovascular accident."} ;; "the patient has history of previous cerebrovascular accident"

(declare-const patient_has_diagnosis_of_stroke_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of stroke at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of stroke at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of stroke.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of stroke."} ;; "the patient has history of previous stroke"

(declare-const creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's creatinine level recorded at the current time, measured in milligrams per deciliter.","when_to_set_to_null":"Set to null if the patient's creatinine level at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's creatinine level recorded at the current time, measured in milligrams per deciliter."} ;; "creatinine greater than 1.0 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

(assert
(! (not patient_has_diagnosis_of_coronary_artery_disease_now)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary artery disease."

(assert
(! (not patient_has_diagnosis_of_peripheral_vascular_disease_now)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has peripheral vascular disease."

(assert
(! (not patient_has_finding_of_migraine_inthepast12months)
    :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has migraine headaches in the last twelve months."

(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
    :named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of previous cerebrovascular accident."

(assert
(! (not patient_has_diagnosis_of_stroke_inthehistory)
    :named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of previous stroke."

(assert
(! (not (> creatinine_value_recorded_now_withunit_mg_per_dl 1.0))
    :named REQ5_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine greater than 1.0 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_cardiac_pacemaker_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac pacemaker present.","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac pacemaker present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac pacemaker present.","meaning":"Boolean indicating whether the patient currently has a cardiac pacemaker present."} ;; "cardiac pacemaker"
(declare-const patient_has_finding_of_implantable_defibrillator_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implantable defibrillator present.","when_to_set_to_false":"Set to false if the patient currently does not have an implantable defibrillator present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implantable defibrillator present.","meaning":"Boolean indicating whether the patient currently has an implantable defibrillator present."} ;; "implantable defibrillator"
(declare-const patient_has_finding_of_aneurysm_clip_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an aneurysm clip present.","when_to_set_to_false":"Set to false if the patient currently does not have an aneurysm clip present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an aneurysm clip present.","meaning":"Boolean indicating whether the patient currently has an aneurysm clip present."} ;; "aneurysm clip"
(declare-const patient_has_finding_of_neural_stimulator_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a neural stimulator present.","when_to_set_to_false":"Set to false if the patient currently does not have a neural stimulator present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neural stimulator present.","meaning":"Boolean indicating whether the patient currently has a neural stimulator present."} ;; "neural stimulator"
(declare-const patient_has_finding_of_transcutaneous_electrical_nerve_stimulation_unit_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a transcutaneous electrical nerve stimulation unit present.","when_to_set_to_false":"Set to false if the patient currently does not have a transcutaneous electrical nerve stimulation unit present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a transcutaneous electrical nerve stimulation unit present.","meaning":"Boolean indicating whether the patient currently has a transcutaneous electrical nerve stimulation unit present."} ;; "transcutaneous electrical nerve stimulation unit"
(declare-const patient_has_finding_of_ear_implant_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any type of ear implant present.","when_to_set_to_false":"Set to false if the patient currently does not have any type of ear implant present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any type of ear implant present.","meaning":"Boolean indicating whether the patient currently has any type of ear implant present."} ;; "any type of ear implant"
(declare-const patient_has_finding_of_metal_foreign_body_in_eye_region_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a metallic foreign body in the eye region.","when_to_set_to_false":"Set to false if the patient currently does not have a metallic foreign body in the eye region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a metallic foreign body in the eye region.","meaning":"Boolean indicating whether the patient currently has a metallic foreign body in the eye region."} ;; "metal in the eye (for example, from machining)"
(declare-const patient_has_finding_of_any_implanted_device_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any implanted device present.","when_to_set_to_false":"Set to false if the patient currently does not have any implanted device present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any implanted device present.","meaning":"Boolean indicating whether the patient currently has any implanted device present (for example, insulin pump, drug infusion device)."} ;; "any implanted device (for example, insulin pump, drug infusion device)"
(declare-const patient_has_finding_of_insulin_pump_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an insulin pump present.","when_to_set_to_false":"Set to false if the patient currently does not have an insulin pump present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an insulin pump present.","meaning":"Boolean indicating whether the patient currently has an insulin pump present."} ;; "insulin pump"
(declare-const patient_has_finding_of_drug_infusion_device_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a drug infusion device present.","when_to_set_to_false":"Set to false if the patient currently does not have a drug infusion device present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a drug infusion device present.","meaning":"Boolean indicating whether the patient currently has a drug infusion device present."} ;; "drug infusion device"
(declare-const patient_has_finding_of_metallic_foreign_body_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any metallic foreign body present.","when_to_set_to_false":"Set to false if the patient currently does not have any metallic foreign body present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any metallic foreign body present.","meaning":"Boolean indicating whether the patient currently has any metallic foreign body present."} ;; "any metallic foreign body"
(declare-const patient_has_finding_of_shrapnel_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shrapnel present.","when_to_set_to_false":"Set to false if the patient currently does not have shrapnel present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has shrapnel present.","meaning":"Boolean indicating whether the patient currently has shrapnel present."} ;; "shrapnel"
(declare-const patient_has_finding_of_bullet_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bullet present.","when_to_set_to_false":"Set to false if the patient currently does not have a bullet present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a bullet present.","meaning":"Boolean indicating whether the patient currently has a bullet present."} ;; "bullet"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive example: transcutaneous electrical nerve stimulation unit implies neural stimulator
(assert
(! (=> patient_has_finding_of_transcutaneous_electrical_nerve_stimulation_unit_present_now
       patient_has_finding_of_neural_stimulator_present_now)
:named REQ6_AUXILIARY0)) ;; "neural stimulator (for example, transcutaneous electrical nerve stimulation unit)"

;; Non-exhaustive example: insulin pump implies any implanted device
(assert
(! (=> patient_has_finding_of_insulin_pump_present_now
       patient_has_finding_of_any_implanted_device_present_now)
:named REQ6_AUXILIARY1)) ;; "any implanted device (for example, insulin pump, drug infusion device)"

;; Non-exhaustive example: drug infusion device implies any implanted device
(assert
(! (=> patient_has_finding_of_drug_infusion_device_present_now
       patient_has_finding_of_any_implanted_device_present_now)
:named REQ6_AUXILIARY2)) ;; "any implanted device (for example, insulin pump, drug infusion device)"

;; Non-exhaustive example: metal in the eye (from machining) implies metallic foreign body in eye region
(assert
(! (=> patient_has_finding_of_metal_foreign_body_in_eye_region_now
       patient_has_finding_of_metallic_foreign_body_present_now)
:named REQ6_AUXILIARY3)) ;; "metal in the eye (for example, from machining)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exhaustive subcategories: MRI exclusion is the OR of all listed items
(assert
(! (not (or patient_has_finding_of_cardiac_pacemaker_present_now
            patient_has_finding_of_implantable_defibrillator_present_now
            patient_has_finding_of_aneurysm_clip_present_now
            patient_has_finding_of_neural_stimulator_present_now
            patient_has_finding_of_ear_implant_present_now
            patient_has_finding_of_metal_foreign_body_in_eye_region_now
            patient_has_finding_of_any_implanted_device_present_now
            patient_has_finding_of_metallic_foreign_body_present_now
            patient_has_finding_of_shrapnel_present_now
            patient_has_finding_of_bullet_present_now))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any of the following magnetic resonance imaging exclusions with exhaustive subcategories: (cardiac pacemaker or implantable defibrillator) OR (aneurysm clip) OR (neural stimulator (for example, transcutaneous electrical nerve stimulation unit)) OR (any type of ear implant) OR (metal in the eye (for example, from machining)) OR (any implanted device (for example, insulin pump, drug infusion device)) OR (any metallic foreign body) OR (shrapnel) OR (bullet)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured hematocrit percentage if a numeric measurement is available for the patient now.","when_to_set_to_null":"Set to null if no hematocrit percentage measurement is available for the patient now or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current hematocrit (packed cell volume) level."} ;; "hematocrit less than or equal to eighteen percent"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (<= patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent 18))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hematocrit less than or equal to eighteen percent."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_taken_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken aspirin on the day of the study.","when_to_set_to_false":"Set to false if the patient has not taken aspirin on the day of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken aspirin on the day of the study.","meaning":"Boolean indicating whether the patient has taken aspirin on the day of the study."} ;; "the patient has taken aspirin on the day of the study"
(declare-const patient_has_taken_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any non-steroidal anti-inflammatory drug (NSAID) on the day of the study.","when_to_set_to_false":"Set to false if the patient has not taken any non-steroidal anti-inflammatory drug (NSAID) on the day of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any non-steroidal anti-inflammatory drug (NSAID) on the day of the study.","meaning":"Boolean indicating whether the patient has taken any non-steroidal anti-inflammatory drug (NSAID) on the day of the study."} ;; "the patient has taken non-steroidal anti-inflammatory drugs on the day of the study"
(declare-const patient_has_taken_caffeine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken caffeine on the day of the study.","when_to_set_to_false":"Set to false if the patient has not taken caffeine on the day of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken caffeine on the day of the study.","meaning":"Boolean indicating whether the patient has taken caffeine on the day of the study."} ;; "the patient has taken caffeine on the day of the study"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_taken_aspirin_now
            patient_has_taken_non_steroidal_anti_inflammatory_agent_now
            patient_has_taken_caffeine_now))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has taken aspirin on the day of the study) OR (the patient has taken non-steroidal anti-inflammatory drugs on the day of the study) OR (the patient has taken caffeine on the day of the study))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_taking_sildenafil_citrate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking sildenafil citrate.","when_to_set_to_false":"Set to false if the patient is not currently taking sildenafil citrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking sildenafil citrate.","meaning":"Boolean indicating whether the patient is currently taking sildenafil citrate."} ;; "the patient is taking sildenafil citrate"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_taking_sildenafil_citrate_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking sildenafil citrate."
