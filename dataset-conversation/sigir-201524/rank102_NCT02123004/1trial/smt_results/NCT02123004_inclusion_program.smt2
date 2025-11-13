;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_female Bool) ;; {"when_to_set_to_true":"Set to true if the patient is female.","when_to_set_to_false":"Set to false if the patient is not female.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is female.","meaning":"Boolean indicating whether the patient is female."} // "be female"
(declare-const patient_is_male Bool) ;; {"when_to_set_to_true":"Set to true if the patient is male.","when_to_set_to_false":"Set to false if the patient is not male.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is male.","meaning":"Boolean indicating whether the patient is male."} // "be male"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pregnant.","meaning":"Boolean indicating whether the patient is currently pregnant."} // "NOT be pregnant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_is_male
         (and patient_is_female (not patient_is_pregnant_now)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be male) OR (be female AND NOT be pregnant))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years old AND be aged < 80 years old"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must be aged ≥ 18 years old."
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be aged ≥ 18 years old"

;; Component 1: "To be included, the patient must be aged < 80 years old."
(assert
  (! (< patient_age_value_recorded_now_in_years 80)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be aged < 80 years old"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented diagnosis of acute ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_false":"Set to false if the patient currently does not have a documented diagnosis of acute ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute ST-segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute ST-segment elevation myocardial infarction."} // "documented evidence of ST-segment elevation myocardial infarction"
(declare-const patient_is_consecutive_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a consecutive patient at the current time.","when_to_set_to_false":"Set to false if the patient is not a consecutive patient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a consecutive patient at the current time.","meaning":"Boolean indicating whether the patient is a consecutive patient at the current time."} // "be a consecutive patient"
(declare-const patient_is_hospitalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized.","when_to_set_to_false":"Set to false if the patient is not currently hospitalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized."} // "hospitalized"
(declare-const patient_is_undergoing_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing percutaneous coronary intervention (PCI).","when_to_set_to_false":"Set to false if the patient is not currently undergoing percutaneous coronary intervention (PCI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing percutaneous coronary intervention (PCI).","meaning":"Boolean indicating whether the patient is currently undergoing percutaneous coronary intervention."} // "receiving percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must be a consecutive patient who is hospitalized with documented evidence of STEMI
(assert
  (! (and patient_is_consecutive_patient_now
          patient_is_hospitalized_now
          patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be a consecutive patient who is hospitalized with documented evidence of ST-segment elevation myocardial infarction"

;; Component 1: patient must be receiving percutaneous coronary intervention
(assert
  (! patient_is_undergoing_percutaneous_coronary_intervention_now
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be receiving percutaneous coronary intervention"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} // "persistent chest pain"
(declare-const patient_has_finding_of_myocardial_necrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of myocardial necrosis.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of myocardial necrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of myocardial necrosis.","meaning":"Boolean indicating whether the patient currently has evidence of myocardial necrosis."} // "elevation of biomarkers of myocardial necrosis"
(declare-const st_segment_elevation_value_in_limb_leads_now_in_millivolt Real) ;; {"when_to_set_to_value":"Set to the numeric value (in millivolts) of the patient's current ST segment elevation in limb leads.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of current ST segment elevation in limb leads, in millivolts."} // "ST segment elevation ... in limb leads"
(declare-const st_segment_elevation_value_in_limb_leads_now_in_millivolt@@in_at_least_2_contiguous_limb_leads Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment elevation value is measured in at least 2 contiguous limb leads.","when_to_set_to_false":"Set to false if the ST segment elevation value is not measured in at least 2 contiguous limb leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST segment elevation value is measured in at least 2 contiguous limb leads.","meaning":"Boolean indicating whether the ST segment elevation value is measured in at least 2 contiguous limb leads."} // "in ≥ 2 contiguous limb leads"
(declare-const st_segment_elevation_value_in_precordial_leads_now_in_millivolt Real) ;; {"when_to_set_to_value":"Set to the numeric value (in millivolts) of the patient's current ST segment elevation in precordial leads.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of current ST segment elevation in precordial leads, in millivolts."} // "ST segment elevation ... in precordial leads"
(declare-const st_segment_elevation_value_in_precordial_leads_now_in_millivolt@@in_at_least_2_contiguous_precordial_leads Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment elevation value is measured in at least 2 contiguous precordial leads.","when_to_set_to_false":"Set to false if the ST segment elevation value is not measured in at least 2 contiguous precordial leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST segment elevation value is measured in at least 2 contiguous precordial leads.","meaning":"Boolean indicating whether the ST segment elevation value is measured in at least 2 contiguous precordial leads."} // "in ≥ 2 contiguous precordial leads"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> st_segment_elevation_value_in_limb_leads_now_in_millivolt@@in_at_least_2_contiguous_limb_leads
         (>= st_segment_elevation_value_in_limb_leads_now_in_millivolt 0.0))
     :named REQ3_AUXILIARY0)) ;; "in ≥ 2 contiguous limb leads" implies value is measured

(assert
  (! (=> st_segment_elevation_value_in_precordial_leads_now_in_millivolt@@in_at_least_2_contiguous_precordial_leads
         (>= st_segment_elevation_value_in_precordial_leads_now_in_millivolt 0.0))
     :named REQ3_AUXILIARY1)) ;; "in ≥ 2 contiguous precordial leads" implies value is measured

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: ((persistent ST elevation ≥0.2 mV in ≥2 contiguous precordial leads) OR (persistent ST elevation ≥0.1 mV in ≥2 contiguous limb leads AND (persistent chest pain OR elevation of biomarkers of myocardial necrosis)))
(assert
  (! (or
        (and st_segment_elevation_value_in_precordial_leads_now_in_millivolt@@in_at_least_2_contiguous_precordial_leads
             (>= st_segment_elevation_value_in_precordial_leads_now_in_millivolt 0.2))
        (and st_segment_elevation_value_in_limb_leads_now_in_millivolt@@in_at_least_2_contiguous_limb_leads
             (>= st_segment_elevation_value_in_limb_leads_now_in_millivolt 0.1)
             (or patient_has_finding_of_chest_pain_now
                 patient_has_finding_of_myocardial_necrosis_now)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have persistent ST segment elevation ≥ 0.2 millivolt in ≥ 2 contiguous precordial leads) OR (have persistent ST segment elevation ≥ 0.1 millivolt in ≥ 2 contiguous limb leads AND (have persistent chest pain OR have elevation of biomarkers of myocardial necrosis)))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_chest_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had chest pain at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had chest pain in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had chest pain in the past.","meaning":"Boolean indicating whether the patient has had chest pain at any time in the past."} // "chest pain onset"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention in the past.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention at any time in the past."} // "receiving percutaneous coronary intervention"
(declare-const time_from_chest_pain_onset_to_percutaneous_coronary_intervention_value_recorded_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours between the onset of the patient's chest pain and the time the patient received percutaneous coronary intervention, if both times are known.","when_to_set_to_null":"Set to null if either the time of chest pain onset or the time of percutaneous coronary intervention is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time in hours from chest pain onset to percutaneous coronary intervention."} // "time from chest pain onset to receiving percutaneous coronary intervention < 12 hours"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must have time from chest pain onset to receiving percutaneous coronary intervention < 12 hours.
(assert
  (! (< time_from_chest_pain_onset_to_percutaneous_coronary_intervention_value_recorded_in_hours 12)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "time from chest pain onset to receiving percutaneous coronary intervention < 12 hours"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const chest_pain_duration_value_recorded_now_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient has been experiencing the current episode of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient has been experiencing the current episode of chest pain.","meaning":"Numeric value representing the duration in hours of the patient's current chest pain episode."} // "persistent chest pain < 12 hours"
(declare-const patient_has_finding_of_chest_pain_now@@duration_less_than_12_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain and the duration of chest pain is less than 12 hours.","when_to_set_to_false":"Set to false if the patient currently has chest pain but the duration is 12 hours or more.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of chest pain is less than 12 hours.","meaning":"Boolean indicating whether the patient currently has chest pain and the duration is less than 12 hours."} // "persistent chest pain < 12 hours"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: patient_has_finding_of_chest_pain_now@@duration_less_than_12_hours is true iff patient has chest pain now AND duration < 12 hours
(assert
  (! (= patient_has_finding_of_chest_pain_now@@duration_less_than_12_hours
        (and patient_has_finding_of_chest_pain_now
             (< chest_pain_duration_value_recorded_now_in_hours 12)))
     :named REQ5_AUXILIARY0)) ;; "persistent chest pain < 12 hours"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_chest_pain_now@@duration_less_than_12_hours
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "persistent chest pain < 12 hours"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_provided_informed_consent_prior_to_study_specific_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent before any study specific procedures are performed.","when_to_set_to_false":"Set to false if the patient has not provided informed consent before any study specific procedures are performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent prior to any study specific procedures.","meaning":"Boolean indicating whether the patient has provided informed consent prior to any study specific procedures."} // "provide informed consent prior to any study specific procedures"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_provided_informed_consent_prior_to_study_specific_procedures
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide informed consent prior to any study specific procedures."
