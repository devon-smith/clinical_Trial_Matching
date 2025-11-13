;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of stable angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of stable angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stable angina pectoris.","meaning":"Boolean indicating whether the patient currently has stable angina pectoris."} // "To be included, the patient must have chronic stable angina pectoris."
(declare-const patient_has_finding_of_stable_angina_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's stable angina pectoris is chronic.","when_to_set_to_false":"Set to false if the patient's stable angina pectoris is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's stable angina pectoris is chronic.","meaning":"Boolean indicating whether the patient's stable angina pectoris is chronic."} // "chronic stable angina pectoris"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_stable_angina_now@@chronic
         patient_has_finding_of_stable_angina_now)
     :named REQ0_AUXILIARY0)) ;; "chronic stable angina pectoris" implies "stable angina pectoris"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_stable_angina_now@@chronic
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have chronic stable angina pectoris."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_exercise_tolerance_test_abnormal_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a positive (abnormal) exercise tolerance test result at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a positive (abnormal) exercise tolerance test result at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a positive (abnormal) exercise tolerance test result.","meaning":"Boolean indicating whether the patient has ever had a positive (abnormal) exercise tolerance test result in the past."} // "To be included, the patient must have had a previous positive exercise tolerance test."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_exercise_tolerance_test_abnormal_inthehistory
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had a previous positive exercise tolerance test."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_can_undergo_angioplasty_of_blood_vessel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered suitable and can undergo angioplasty of blood vessel.","when_to_set_to_false":"Set to false if the patient is currently considered not suitable and cannot undergo angioplasty of blood vessel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo angioplasty of blood vessel.","meaning":"Boolean indicating whether the patient can currently undergo angioplasty of blood vessel."} // "angioplasty"
(declare-const patient_can_undergo_coronary_artery_bypass_graft_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered suitable and can undergo coronary artery bypass grafting.","when_to_set_to_false":"Set to false if the patient is currently considered not suitable and cannot undergo coronary artery bypass grafting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient can currently undergo coronary artery bypass grafting."} // "coronary artery bypass grafting"
(declare-const patient_has_disease_not_suitable_for_angioplasty_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease that is considered not suitable for angioplasty.","when_to_set_to_false":"Set to false if the patient currently does not have a disease that is considered not suitable for angioplasty.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease that is not suitable for angioplasty.","meaning":"Boolean indicating whether the patient currently has a disease that is not suitable for angioplasty."} // "disease not suitable for angioplasty"
(declare-const patient_has_disease_not_suitable_for_coronary_artery_bypass_grafting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease that is considered not suitable for coronary artery bypass grafting.","when_to_set_to_false":"Set to false if the patient currently does not have a disease that is considered not suitable for coronary artery bypass grafting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease that is not suitable for coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient currently has a disease that is not suitable for coronary artery bypass grafting."} // "disease not suitable for coronary artery bypass grafting"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: If the patient cannot undergo angioplasty, then the patient has disease not suitable for angioplasty
(assert
  (! (= patient_has_disease_not_suitable_for_angioplasty_now
        (not patient_can_undergo_angioplasty_of_blood_vessel_now))
     :named REQ2_AUXILIARY0)) ;; "disease not suitable for angioplasty" is equivalent to "cannot undergo angioplasty"

;; Definition: If the patient cannot undergo coronary artery bypass grafting, then the patient has disease not suitable for coronary artery bypass grafting
(assert
  (! (= patient_has_disease_not_suitable_for_coronary_artery_bypass_grafting_now
        (not patient_can_undergo_coronary_artery_bypass_graft_now))
     :named REQ2_AUXILIARY1)) ;; "disease not suitable for coronary artery bypass grafting" is equivalent to "cannot undergo coronary artery bypass grafting"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (disease not suitable for coronary artery bypass grafting OR disease not suitable for angioplasty)
(assert
  (! (or patient_has_disease_not_suitable_for_coronary_artery_bypass_grafting_now
         patient_has_disease_not_suitable_for_angioplasty_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (disease not suitable for coronary artery bypass grafting OR disease not suitable for angioplasty)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has type 2 diabetes mellitus."} // "type 2 diabetes mellitus"
(declare-const patient_has_finding_of_type_2_diabetes_mellitus_now@@is_overt Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current type 2 diabetes mellitus is overt.","when_to_set_to_false":"Set to false if the patient's current type 2 diabetes mellitus is not overt.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current type 2 diabetes mellitus is overt.","meaning":"Boolean indicating whether the patient's current type 2 diabetes mellitus is overt."} // "overt type 2 diabetes mellitus"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_type_2_diabetes_mellitus_now@@is_overt
         patient_has_finding_of_type_2_diabetes_mellitus_now)
     :named REQ3_AUXILIARY0)) ;; "overt type 2 diabetes mellitus" implies "type 2 diabetes mellitus"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must NOT have overt type 2 diabetes mellitus.
(assert
  (! (not patient_has_finding_of_type_2_diabetes_mellitus_now@@is_overt)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have overt type 2 diabetes mellitus."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the most recent measured value of the patient's body mass index (BMI) in kg/m^2 at the current time.","when_to_set_to_null":"Set to null if no BMI measurement is available for the patient at the current time or if the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} // "body mass index"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 25.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index > 25."
