;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 75 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 75.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (age ≥ 75 years)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute myocardial infarction."}  ;; "diagnosis of acute myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_now@@evolution_period_less_than_6_hours_after_symptom_onset_until_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute myocardial infarction and the evolution period is less than 6 hours after symptom onset until randomization.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of acute myocardial infarction but the evolution period is 6 hours or more after symptom onset until randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the evolution period is less than 6 hours after symptom onset until randomization for the diagnosis of acute myocardial infarction.","meaning":"Boolean indicating that the patient currently has a diagnosis of acute myocardial infarction and the evolution period is less than 6 hours after symptom onset until randomization."} ;; "evolution period < 6 hours after symptom onset until randomization"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@duration_at_least_20_minutes Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain and the duration is at least 20 minutes.","when_to_set_to_false":"Set to false if the patient currently has chest pain but the duration is less than 20 minutes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of chest pain is at least 20 minutes.","meaning":"Boolean indicating that the patient currently has chest pain and the duration is at least 20 minutes."} ;; "chest pain of duration ≥ 20 minutes"
(declare-const patient_has_finding_of_chest_pain_now@@not_responding_to_nitrate_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain and the pain does not respond to nitrate therapy.","when_to_set_to_false":"Set to false if the patient currently has chest pain and the pain does respond to nitrate therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest pain responds to nitrate therapy.","meaning":"Boolean indicating that the patient currently has chest pain and the pain does not respond to nitrate therapy."} ;; "chest pain not responding to nitrate therapy"
(declare-const chest_pain_duration_value_recorded_now_in_minutes Real) ;; {"when_to_set_to_value":"Set to the numeric value of the duration of chest pain in minutes as recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the duration of chest pain is in minutes as recorded now.","meaning":"Numeric value indicating the duration of chest pain in minutes as recorded now."} ;; "duration of chest pain in minutes"
(declare-const patient_has_symptoms_of_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has symptoms of myocardial ischemia."} ;; "any symptom of myocardial ischemia"
(declare-const patient_has_symptoms_of_myocardial_ischemia_now@@symptom_duration_at_least_20_minutes Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of myocardial ischemia and the symptom duration is at least 20 minutes.","when_to_set_to_false":"Set to false if the patient currently has symptoms of myocardial ischemia but the symptom duration is less than 20 minutes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the symptom duration is at least 20 minutes.","meaning":"Boolean indicating that the patient currently has symptoms of myocardial ischemia and the symptom duration is at least 20 minutes."} ;; "symptom of myocardial ischemia of duration ≥ 20 minutes"
(declare-const patient_has_symptoms_of_myocardial_ischemia_now@@symptoms_not_responding_to_nitrate_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of myocardial ischemia and the symptoms do not respond to nitrate therapy.","when_to_set_to_false":"Set to false if the patient currently has symptoms of myocardial ischemia and the symptoms do respond to nitrate therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the symptoms of myocardial ischemia respond to nitrate therapy.","meaning":"Boolean indicating that the patient currently has symptoms of myocardial ischemia and the symptoms do not respond to nitrate therapy."} ;; "symptom of myocardial ischemia not responding to nitrate therapy"
(declare-const myocardial_ischemia_symptom_duration_value_recorded_now_in_minutes Real) ;; {"when_to_set_to_value":"Set to the numeric value of the duration of symptoms of myocardial ischemia in minutes as recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the duration of symptoms of myocardial ischemia is in minutes as recorded now.","meaning":"Numeric value indicating the duration of symptoms of myocardial ischemia in minutes as recorded now."} ;; "duration of symptoms of myocardial ischemia in minutes"
(declare-const evolution_period_after_symptom_onset_until_randomization_value_recorded_now_in_hours Real) ;; {"when_to_set_to_value":"Set to the numeric value of the evolution period in hours after symptom onset until randomization as recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the evolution period in hours after symptom onset until randomization is as recorded now.","meaning":"Numeric value indicating the evolution period in hours after symptom onset until randomization as recorded now."} ;; "evolution period in hours after symptom onset until randomization"
(declare-const patient_has_finding_of_st_segment_elevation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment elevation.","when_to_set_to_false":"Set to false if the patient currently does not have ST-segment elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST-segment elevation.","meaning":"Boolean indicating whether the patient currently has ST-segment elevation."} ;; "ST-segment elevation"
(declare-const patient_has_finding_of_st_segment_elevation_now@@present_in_at_least_2_precordial_leads Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment elevation and it is present in at least 2 precordial leads.","when_to_set_to_false":"Set to false if the patient currently has ST-segment elevation but it is present in fewer than 2 precordial leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ST-segment elevation is present in at least 2 precordial leads.","meaning":"Boolean indicating that the patient currently has ST-segment elevation and it is present in at least 2 precordial leads."} ;; "ST-segment elevation in ≥ 2 precordial leads"
(declare-const patient_has_finding_of_st_segment_elevation_now@@magnitude_at_least_2_millimeters Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment elevation and the magnitude is at least 2 millimeters.","when_to_set_to_false":"Set to false if the patient currently has ST-segment elevation but the magnitude is less than 2 millimeters.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the magnitude of ST-segment elevation is at least 2 millimeters.","meaning":"Boolean indicating that the patient currently has ST-segment elevation and the magnitude is at least 2 millimeters."} ;; "ST-segment elevation ≥ 2 millimeters"
(declare-const number_of_precordial_leads_with_st_segment_elevation_now_value_recorded_now_in_leads Real) ;; {"when_to_set_to_value":"Set to the numeric value of the number of precordial leads with ST-segment elevation as recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many precordial leads have ST-segment elevation as recorded now.","meaning":"Numeric value indicating the number of precordial leads with ST-segment elevation as recorded now."} ;; "number of precordial leads with ST-segment elevation"
(declare-const st_segment_elevation_magnitude_value_recorded_now_in_millimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value of the ST-segment elevation in millimeters as recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the magnitude of ST-segment elevation is in millimeters as recorded now.","meaning":"Numeric value indicating the magnitude of ST-segment elevation in millimeters as recorded now."} ;; "magnitude of ST-segment elevation in millimeters"
(declare-const patient_has_finding_of_st_segment_elevation_now@@present_in_at_least_2_anterior_leads Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment elevation and it is present in at least 2 anterior leads.","when_to_set_to_false":"Set to false if the patient currently has ST-segment elevation but it is present in fewer than 2 anterior leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ST-segment elevation is present in at least 2 anterior leads.","meaning":"Boolean indicating that the patient currently has ST-segment elevation and it is present in at least 2 anterior leads."} ;; "ST-segment elevation in ≥ 2 anterior leads"
(declare-const patient_has_finding_of_st_segment_elevation_now@@magnitude_at_least_1_millimeter Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment elevation and the magnitude is at least 1 millimeter.","when_to_set_to_false":"Set to false if the patient currently has ST-segment elevation but the magnitude is less than 1 millimeter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the magnitude of ST-segment elevation is at least 1 millimeter.","meaning":"Boolean indicating that the patient currently has ST-segment elevation and the magnitude is at least 1 millimeter."} ;; "ST-segment elevation ≥ 1 millimeter"
(declare-const number_of_anterior_leads_with_st_segment_elevation_now_value_recorded_now_in_leads Real) ;; {"when_to_set_to_value":"Set to the numeric value of the number of anterior leads with ST-segment elevation as recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many anterior leads have ST-segment elevation as recorded now.","meaning":"Numeric value indicating the number of anterior leads with ST-segment elevation as recorded now."} ;; "number of anterior leads with ST-segment elevation"
(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left bundle branch block.","meaning":"Boolean indicating whether the patient currently has left bundle branch block."} ;; "left bundle branch block"
(declare-const patient_has_finding_of_left_bundle_branch_block_now@@complete_and_de_novo Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left bundle branch block and it is both complete and de novo.","when_to_set_to_false":"Set to false if the patient currently has left bundle branch block but it is not both complete and de novo.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the left bundle branch block is both complete and de novo.","meaning":"Boolean indicating that the patient currently has left bundle branch block and it is both complete and de novo."} ;; "complete de novo left bundle branch block"
(declare-const patient_has_finding_of_left_bundle_branch_block_now@@probably_de_novo Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left bundle branch block and it is probably de novo.","when_to_set_to_false":"Set to false if the patient currently has left bundle branch block but it is not probably de novo.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the left bundle branch block is probably de novo.","meaning":"Boolean indicating that the patient currently has left bundle branch block and it is probably de novo."} ;; "probably de novo left bundle branch block"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: chest pain duration at least 20 minutes
(assert
  (! (= patient_has_finding_of_chest_pain_now@@duration_at_least_20_minutes
        (and patient_has_finding_of_chest_pain_now
             (>= chest_pain_duration_value_recorded_now_in_minutes 20.0)))
     :named REQ1_AUXILIARY0)) ;; "chest pain of duration ≥ 20 minutes"

;; Definition: chest pain not responding to nitrate therapy
(assert
  (! (=> patient_has_finding_of_chest_pain_now@@not_responding_to_nitrate_therapy
         patient_has_finding_of_chest_pain_now)
     :named REQ1_AUXILIARY1)) ;; "chest pain not responding to nitrate therapy"

;; Definition: myocardial ischemia symptom duration at least 20 minutes
(assert
  (! (= patient_has_symptoms_of_myocardial_ischemia_now@@symptom_duration_at_least_20_minutes
        (and patient_has_symptoms_of_myocardial_ischemia_now
             (>= myocardial_ischemia_symptom_duration_value_recorded_now_in_minutes 20.0)))
     :named REQ1_AUXILIARY2)) ;; "symptom of myocardial ischemia of duration ≥ 20 minutes"

;; Definition: myocardial ischemia symptoms not responding to nitrate therapy
(assert
  (! (=> patient_has_symptoms_of_myocardial_ischemia_now@@symptoms_not_responding_to_nitrate_therapy
         patient_has_symptoms_of_myocardial_ischemia_now)
     :named REQ1_AUXILIARY3)) ;; "symptom of myocardial ischemia not responding to nitrate therapy"

;; Definition: evolution period less than 6 hours after symptom onset until randomization
(assert
  (! (= patient_has_diagnosis_of_acute_myocardial_infarction_now@@evolution_period_less_than_6_hours_after_symptom_onset_until_randomization
        (and patient_has_diagnosis_of_acute_myocardial_infarction_now
             (< evolution_period_after_symptom_onset_until_randomization_value_recorded_now_in_hours 6.0)))
     :named REQ1_AUXILIARY4)) ;; "evolution period < 6 hours after symptom onset until randomization"

;; Definition: ST-segment elevation in at least 2 precordial leads and magnitude at least 2 mm
(assert
  (! (= patient_has_finding_of_st_segment_elevation_now@@present_in_at_least_2_precordial_leads
        (and patient_has_finding_of_st_segment_elevation_now
             (>= number_of_precordial_leads_with_st_segment_elevation_now_value_recorded_now_in_leads 2.0)))
     :named REQ1_AUXILIARY5)) ;; "ST-segment elevation in ≥ 2 precordial leads"

(assert
  (! (= patient_has_finding_of_st_segment_elevation_now@@magnitude_at_least_2_millimeters
        (and patient_has_finding_of_st_segment_elevation_now
             (>= st_segment_elevation_magnitude_value_recorded_now_in_millimeters 2.0)))
     :named REQ1_AUXILIARY6)) ;; "ST-segment elevation ≥ 2 millimeters"

;; Definition: ST-segment elevation in at least 2 anterior leads and magnitude at least 1 mm
(assert
  (! (= patient_has_finding_of_st_segment_elevation_now@@present_in_at_least_2_anterior_leads
        (and patient_has_finding_of_st_segment_elevation_now
             (>= number_of_anterior_leads_with_st_segment_elevation_now_value_recorded_now_in_leads 2.0)))
     :named REQ1_AUXILIARY7)) ;; "ST-segment elevation in ≥ 2 anterior leads"

(assert
  (! (= patient_has_finding_of_st_segment_elevation_now@@magnitude_at_least_1_millimeter
        (and patient_has_finding_of_st_segment_elevation_now
             (>= st_segment_elevation_magnitude_value_recorded_now_in_millimeters 1.0)))
     :named REQ1_AUXILIARY8)) ;; "ST-segment elevation ≥ 1 millimeter"

;; Definition: complete de novo left bundle branch block
(assert
  (! (=> patient_has_finding_of_left_bundle_branch_block_now@@complete_and_de_novo
         patient_has_finding_of_left_bundle_branch_block_now)
     :named REQ1_AUXILIARY9)) ;; "complete de novo left bundle branch block"

;; Definition: probably de novo left bundle branch block
(assert
  (! (=> patient_has_finding_of_left_bundle_branch_block_now@@probably_de_novo
         patient_has_finding_of_left_bundle_branch_block_now)
     :named REQ1_AUXILIARY10)) ;; "probably de novo left bundle branch block"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: diagnosis of acute myocardial infarction defined as (chest pain OR any symptom of myocardial ischemia) of duration ≥ 20 minutes AND not responding to nitrate therapy
(assert
  (! (and patient_has_diagnosis_of_acute_myocardial_infarction_now
          (or
            (and patient_has_finding_of_chest_pain_now@@duration_at_least_20_minutes
                 patient_has_finding_of_chest_pain_now@@not_responding_to_nitrate_therapy)
            (and patient_has_symptoms_of_myocardial_ischemia_now@@symptom_duration_at_least_20_minutes
                 patient_has_symptoms_of_myocardial_ischemia_now@@symptoms_not_responding_to_nitrate_therapy)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "diagnosis of acute myocardial infarction defined as (chest pain OR any symptom of myocardial ischemia) of duration ≥ 20 minutes AND not responding to nitrate therapy"

;; Component 1: evolution period < 6 hours after symptom onset until randomization
(assert
  (! patient_has_diagnosis_of_acute_myocardial_infarction_now@@evolution_period_less_than_6_hours_after_symptom_onset_until_randomization
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "evolution period < 6 hours after symptom onset until randomization"

;; Component 2: at least one of the following alterations:
;; (ST-segment elevation ≥ 2 millimeters in ≥ 2 precordial leads) OR
;; (ST-segment elevation ≥ 1 millimeter in ≥ 2 anterior leads) OR
;; (complete de novo left bundle branch block) OR
;; (probably de novo left bundle branch block)
(assert
  (! (or
        (and patient_has_finding_of_st_segment_elevation_now@@present_in_at_least_2_precordial_leads
             patient_has_finding_of_st_segment_elevation_now@@magnitude_at_least_2_millimeters)
        (and patient_has_finding_of_st_segment_elevation_now@@present_in_at_least_2_anterior_leads
             patient_has_finding_of_st_segment_elevation_now@@magnitude_at_least_1_millimeter)
        patient_has_finding_of_left_bundle_branch_block_now@@complete_and_de_novo
        patient_has_finding_of_left_bundle_branch_block_now@@probably_de_novo)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "at least one of the following alterations: (ST-segment elevation ≥ 2 millimeters in ≥ 2 precordial leads) OR (ST-segment elevation ≥ 1 millimeter in ≥ 2 anterior leads) OR (complete de novo left bundle branch block) OR (probably de novo left bundle branch block)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_able_to_give_informed_consent_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to give informed consent prior to the randomization process.","when_to_set_to_false":"Set to false if the patient is not able to give informed consent prior to the randomization process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to give informed consent prior to the randomization process.","meaning":"Boolean indicating whether the patient is able to give informed consent prior to the randomization process."} ;; "be able to give informed consent prior to the randomization process"
(declare-const patient_agrees_to_fulfill_all_protocol_procedures_including_follow_up_after_hospital_discharge Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to fulfill all procedures described in the protocol, including follow-up after hospital discharge.","when_to_set_to_false":"Set to false if the patient does not agree to fulfill all procedures described in the protocol, including follow-up after hospital discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to fulfill all procedures described in the protocol, including follow-up after hospital discharge.","meaning":"Boolean indicating whether the patient agrees to fulfill all procedures described in the protocol, including follow-up after hospital discharge."} ;; "agree to fulfill all procedures described in the protocol, including follow-up after hospital discharge"
(declare-const written_consent_signed_by_close_relative_with_witness Bool) ;; {"when_to_set_to_true":"Set to true if there is a written consent signed by a close relative with witness.","when_to_set_to_false":"Set to false if there is not a written consent signed by a close relative with witness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is a written consent signed by a close relative with witness.","meaning":"Boolean indicating whether there is a written consent signed by a close relative with witness."} ;; "have a written consent signed by a close relative with witness"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must (be able to give informed consent prior to the randomization process AND agree to fulfill all procedures described in the protocol, including follow-up after hospital discharge) OR (have a written consent signed by a close relative with witness).
(assert
  (! (or (and patient_is_able_to_give_informed_consent_prior_to_randomization
              patient_agrees_to_fulfill_all_protocol_procedures_including_follow_up_after_hospital_discharge)
         written_consent_signed_by_close_relative_with_witness)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must (be able to give informed consent prior to the randomization process AND agree to fulfill all procedures described in the protocol, including follow-up after hospital discharge) OR (have a written consent signed by a close relative with witness)."
