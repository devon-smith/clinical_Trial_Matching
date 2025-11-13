;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_is_community_dwelling_individual_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in a community setting (not institutionalized, e.g., not residing in a hospital, nursing home, or other long-term care facility).","when_to_set_to_false":"Set to false if the patient is currently not living in a community setting (i.e., is institutionalized).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a community-dwelling individual.","meaning":"Boolean indicating whether the patient is currently a community-dwelling individual."}  ;; "To be included, the patient must be a community-dwelling individual."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "To be included, the patient must be aged ≥ 65 years."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be a community-dwelling individual
(assert
  (! patient_is_community_dwelling_individual_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a community-dwelling individual."

;; Component 1: patient must be aged ≥ 65 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_been_admitted_to_methodist_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to Methodist Hospital.","when_to_set_to_false":"Set to false if the patient is not currently admitted to Methodist Hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to Methodist Hospital.","meaning":"Boolean indicating whether the patient is currently admitted to Methodist Hospital."}  ;; "To be included, the patient must be admitted to Methodist Hospital for surgical repair of hip fracture."
(declare-const patient_has_been_admitted_to_methodist_hospital_now@@for_surgical_repair_of_hip_fracture Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current admission to Methodist Hospital is for surgical repair of hip fracture.","when_to_set_to_false":"Set to false if the patient's current admission to Methodist Hospital is not for surgical repair of hip fracture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current admission to Methodist Hospital is for surgical repair of hip fracture.","meaning":"Boolean indicating whether the patient's current admission to Methodist Hospital is for surgical repair of hip fracture."}  ;; "To be included, the patient must be admitted to Methodist Hospital for surgical repair of hip fracture."
(declare-const patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of fracture of the proximal end of the femur (hip fracture).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of fracture of the proximal end of the femur (hip fracture).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of fracture of the proximal end of the femur (hip fracture).","meaning":"Boolean indicating whether the patient currently has a diagnosis of fracture of the proximal end of the femur (hip fracture)."}  ;; "hip fracture"
(declare-const patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_now@@indication_for_surgical_repair Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of fracture of the proximal end of the femur (hip fracture) is the indication for surgical repair.","when_to_set_to_false":"Set to false if the patient's diagnosis of fracture of the proximal end of the femur (hip fracture) is not the indication for surgical repair.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is the indication for surgical repair.","meaning":"Boolean indicating whether the patient's diagnosis of fracture of the proximal end of the femur (hip fracture) is the indication for surgical repair."}  ;; "hip fracture" as indication for surgical repair

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_been_admitted_to_methodist_hospital_now@@for_surgical_repair_of_hip_fracture
         patient_has_been_admitted_to_methodist_hospital_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must be admitted to Methodist Hospital for surgical repair of hip fracture."

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_now@@indication_for_surgical_repair
         patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_now)
     :named REQ1_AUXILIARY1)) ;; "hip fracture" as indication for surgical repair

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_been_admitted_to_methodist_hospital_now@@for_surgical_repair_of_hip_fracture
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be admitted to Methodist Hospital for surgical repair of hip fracture."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of delirium (i.e., at the time of hospital admission).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of delirium (i.e., at the time of hospital admission).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has delirium at the time of hospital admission.","meaning":"Boolean indicating whether the patient currently has delirium (at the time of hospital admission)."}  ;; "To be included, the patient must have NO evidence of delirium at admission to hospital."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_delirium_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have NO evidence of delirium at admission to hospital."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the measured total score (in points) if the patient's Mini-Mental State Examination score, adjusted for education and age, is recorded now.","when_to_set_to_null":"Set to null if no such score is available, not recorded now, or the value is indeterminate.","meaning":"Numeric value representing the patient's total Mini-Mental State Examination score (in points) recorded now."}  ;; "Mini-Mental State Examination (after adjustment for education and age)"
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_points@@adjusted_for_education_and_age Bool) ;; {"when_to_set_to_true":"Set to true if the recorded Mini-Mental State Examination score is adjusted for both education and age.","when_to_set_to_false":"Set to false if the recorded score is not adjusted for education and age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the score is adjusted for education and age.","meaning":"Boolean indicating whether the Mini-Mental State Examination score is adjusted for education and age."}  ;; "Mini-Mental State Examination (after adjustment for education and age)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_mini_mental_state_examination_score_value_recorded_now_withunit_points@@adjusted_for_education_and_age
          (< patient_mini_mental_state_examination_score_value_recorded_now_withunit_points 24))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a total score on the Mini-Mental State Examination (after adjustment for education and age) < 24 points."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_provided_consent_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided consent to participate in the study.","when_to_set_to_false":"Set to false if the patient has not provided consent to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent to participate in the study.","meaning":"Boolean indicating whether the patient has provided consent to participate in the study."}  ;; "To be included, the patient must provide consent to participate in the study."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_provided_consent_to_participate_in_study
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide consent to participate in the study."
