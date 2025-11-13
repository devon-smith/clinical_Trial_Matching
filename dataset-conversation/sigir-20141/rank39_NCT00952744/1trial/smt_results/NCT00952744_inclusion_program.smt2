;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value": "Set to the patient's current age in years as recorded.", "when_to_set_to_null": "Set to null if the patient's age is unknown or not recorded.", "meaning": "Numeric value indicating the patient's current age in years."} ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_presented_to_emergency_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has presented to the emergency department now.","when_to_set_to_false":"Set to false if the patient has not presented to the emergency department now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has presented to the emergency department now.","meaning":"Boolean indicating whether the patient has presented to the emergency department now."} ;; "present to the emergency department"
(declare-const patient_has_symptoms_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms consistent with acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms consistent with acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms consistent with acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has symptoms consistent with acute coronary syndrome."} ;; "symptoms consistent with acute coronary syndromes"
(declare-const patient_has_symptoms_of_chest_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest discomfort.","when_to_set_to_false":"Set to false if the patient currently does not have chest discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest discomfort.","meaning":"Boolean indicating whether the patient currently has chest discomfort."} ;; "chest discomfort"
(declare-const patient_has_symptoms_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"
(declare-const patient_has_symptoms_of_squeezing_in_chest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has squeezing sensation in the chest.","when_to_set_to_false":"Set to false if the patient currently does not have squeezing sensation in the chest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has squeezing sensation in the chest.","meaning":"Boolean indicating whether the patient currently has squeezing sensation in the chest."} ;; "squeezing in the chest"
(declare-const patient_has_symptoms_of_fullness_in_chest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fullness sensation in the chest.","when_to_set_to_false":"Set to false if the patient currently does not have fullness sensation in the chest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fullness sensation in the chest.","meaning":"Boolean indicating whether the patient currently has fullness sensation in the chest."} ;; "fullness in the chest"
(declare-const patient_has_symptoms_of_pain_radiating_to_left_arm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain radiating to the left arm.","when_to_set_to_false":"Set to false if the patient currently does not have pain radiating to the left arm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain radiating to the left arm.","meaning":"Boolean indicating whether the patient currently has pain radiating to the left arm."} ;; "pain radiating to the left arm"
(declare-const patient_has_symptoms_of_pain_radiating_to_both_arms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain radiating to both arms.","when_to_set_to_false":"Set to false if the patient currently does not have pain radiating to both arms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain radiating to both arms.","meaning":"Boolean indicating whether the patient currently has pain radiating to both arms."} ;; "pain radiating to both arms"
(declare-const patient_has_symptoms_of_jaw_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has jaw pain.","when_to_set_to_false":"Set to false if the patient currently does not have jaw pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has jaw pain.","meaning":"Boolean indicating whether the patient currently has jaw pain."} ;; "jaw pain"
(declare-const patient_has_symptoms_of_backache_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain in the back.","when_to_set_to_false":"Set to false if the patient currently does not have pain in the back.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain in the back.","meaning":"Boolean indicating whether the patient currently has pain in the back."} ;; "pain in the back"
(declare-const patient_has_symptoms_of_neck_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain in the neck.","when_to_set_to_false":"Set to false if the patient currently does not have pain in the neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain in the neck.","meaning":"Boolean indicating whether the patient currently has pain in the neck."} ;; "pain in the neck"
(declare-const patient_has_symptoms_of_stomach_ache_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain in the stomach.","when_to_set_to_false":"Set to false if the patient currently does not have pain in the stomach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain in the stomach.","meaning":"Boolean indicating whether the patient currently has pain in the stomach."} ;; "pain in the stomach"
(declare-const patient_has_symptoms_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shortness of breath.","when_to_set_to_false":"Set to false if the patient currently does not have shortness of breath.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has shortness of breath.","meaning":"Boolean indicating whether the patient currently has shortness of breath."} ;; "shortness of breath"
(declare-const patient_has_symptoms_of_cold_sweat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cold sweat.","when_to_set_to_false":"Set to false if the patient currently does not have cold sweat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cold sweat.","meaning":"Boolean indicating whether the patient currently has cold sweat."} ;; "cold sweat"
(declare-const patient_has_symptoms_of_nausea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nausea.","when_to_set_to_false":"Set to false if the patient currently does not have nausea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nausea.","meaning":"Boolean indicating whether the patient currently has nausea."} ;; "nausea"
(declare-const patient_has_symptoms_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vomiting.","meaning":"Boolean indicating whether the patient currently has vomiting."} ;; "vomiting"
(declare-const patient_has_symptoms_of_lightheadedness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lightheadedness.","when_to_set_to_false":"Set to false if the patient currently does not have lightheadedness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lightheadedness.","meaning":"Boolean indicating whether the patient currently has lightheadedness."} ;; "lightheadedness"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term: symptoms consistent with acute coronary syndromes
(assert
  (! (=> (or patient_has_symptoms_of_chest_discomfort_now
            patient_has_symptoms_of_chest_pain_now
            patient_has_symptoms_of_squeezing_in_chest_now
            patient_has_symptoms_of_fullness_in_chest_now
            patient_has_symptoms_of_pain_radiating_to_left_arm_now
            patient_has_symptoms_of_pain_radiating_to_both_arms_now
            patient_has_symptoms_of_jaw_pain_now
            patient_has_symptoms_of_backache_now
            patient_has_symptoms_of_neck_pain_now
            patient_has_symptoms_of_stomach_ache_now
            patient_has_symptoms_of_dyspnea_now
            patient_has_symptoms_of_cold_sweat_now
            patient_has_symptoms_of_nausea_now
            patient_has_symptoms_of_vomiting_now
            patient_has_symptoms_of_lightheadedness_now)
        patient_has_symptoms_of_acute_coronary_syndrome_now)
     :named REQ1_AUXILIARY0)) ;; "have symptoms consistent with acute coronary syndromes (with non-exhaustive examples ...)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must present to the emergency department
(assert
  (! patient_has_presented_to_emergency_department_now
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "present to the emergency department"

;; Component 1: patient must have symptoms consistent with acute coronary syndromes
(assert
  (! patient_has_symptoms_of_acute_coronary_syndrome_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have symptoms consistent with acute coronary syndromes"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const onset_time_of_most_recent_symptoms_prompting_emergency_department_visit_value_recorded_in_hours_before_emergency_department_presentation Real) ;; {"when_to_set_to_value":"Set to the number of hours between the onset of the most recent symptoms prompting emergency department visit and the patient's presentation to the emergency department.","when_to_set_to_null":"Set to null if the time of onset of the most recent symptoms prompting emergency department visit or the time of emergency department presentation is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of hours between the onset of the most recent symptoms prompting emergency department visit and the patient's presentation to the emergency department."} ;; "within ≤ 6 hours of the onset of the most recent symptoms that prompted the patient to seek medical attention in the emergency department"
(declare-const onset_time_of_most_recent_symptoms_prompting_emergency_department_visit_value_recorded_in_hours_before_emergency_department_presentation@@prompted_patient_to_seek_medical_attention_in_emergency_department Bool) ;; {"when_to_set_to_true":"Set to true if the symptoms whose onset time is recorded are those that prompted the patient to seek medical attention in the emergency department.","when_to_set_to_false":"Set to false if the symptoms whose onset time is recorded are not those that prompted the patient to seek medical attention in the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the symptoms whose onset time is recorded prompted the patient to seek medical attention in the emergency department.","meaning":"Boolean indicating whether the symptoms whose onset time is recorded are those that prompted the patient to seek medical attention in the emergency department."} ;; "symptoms that prompted the patient to seek medical attention in the emergency department"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the numeric variable is relevant to the symptoms that prompted ED visit
(assert
  (! (=> onset_time_of_most_recent_symptoms_prompting_emergency_department_visit_value_recorded_in_hours_before_emergency_department_presentation@@prompted_patient_to_seek_medical_attention_in_emergency_department
         (<= onset_time_of_most_recent_symptoms_prompting_emergency_department_visit_value_recorded_in_hours_before_emergency_department_presentation 6.0))
     :named REQ2_AUXILIARY0)) ;; "within ≤ 6 hours of the onset of the most recent symptoms that prompted the patient to seek medical attention in the emergency department"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and patient_has_presented_to_emergency_department_now
          onset_time_of_most_recent_symptoms_prompting_emergency_department_visit_value_recorded_in_hours_before_emergency_department_presentation@@prompted_patient_to_seek_medical_attention_in_emergency_department
          (<= onset_time_of_most_recent_symptoms_prompting_emergency_department_visit_value_recorded_in_hours_before_emergency_department_presentation 6.0))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "present to the emergency department within ≤ 6 hours of the onset of the most recent symptoms that prompted the patient to seek medical attention in the emergency department"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_agrees_to_abide_by_all_aspects_of_protocol_including_telephone_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to abide by all aspects of the protocol, including all telephone follow-up.","when_to_set_to_false":"Set to false if the patient has not agreed to abide by all aspects of the protocol, including all telephone follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to abide by all aspects of the protocol, including all telephone follow-up.","meaning":"Boolean indicating whether the patient agrees to abide by all aspects of the protocol, including all telephone follow-up."} ;; "the patient must agree to abide by all aspects of the protocol (including all telephone follow-up)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_agrees_to_abide_by_all_aspects_of_protocol_including_telephone_follow_up
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must agree to abide by all aspects of the protocol (including all telephone follow-up)"
