;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_physical_impairment_making_intervention_very_difficult_according_to_physician_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical impairment that would make the intervention very difficult according to the patient's physician.","when_to_set_to_false":"Set to false if the patient currently does not have a physical impairment that would make the intervention very difficult according to the patient's physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical impairment that would make the intervention very difficult according to the patient's physician.","meaning":"Boolean indicating whether the patient currently has a physical impairment that would make the intervention very difficult according to the patient's physician."} ;; "the patient has a physical impairment which would make the intervention very difficult according to the patient's physician"

(declare-const patient_has_finding_of_physical_impairment_making_intervention_unsafe_according_to_physician_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical impairment that would make the intervention unsafe according to the patient's physician.","when_to_set_to_false":"Set to false if the patient currently does not have a physical impairment that would make the intervention unsafe according to the patient's physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical impairment that would make the intervention unsafe according to the patient's physician.","meaning":"Boolean indicating whether the patient currently has a physical impairment that would make the intervention unsafe according to the patient's physician."} ;; "the patient has a physical impairment which would make the intervention unsafe according to the patient's physician"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction."} ;; "the patient has a history of myocardial infarction"

(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with stroke (cerebrovascular accident) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with stroke (cerebrovascular accident).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with stroke (cerebrovascular accident).","meaning":"Boolean indicating whether the patient has ever been diagnosed with stroke (cerebrovascular accident)."} ;; "the patient has a history of stroke"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass graft surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass graft surgery."} ;; "the patient has a history of coronary bypass surgery"

(declare-const patient_has_undergone_angioplasty_of_blood_vessel_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone angioplasty of a blood vessel within the past six months.","when_to_set_to_false":"Set to false if the patient has not undergone angioplasty of a blood vessel within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone angioplasty of a blood vessel within the past six months.","meaning":"Boolean indicating whether the patient has undergone angioplasty of a blood vessel within the past six months."} ;; "the patient has a history of angioplasty in the last six months"

(declare-const patient_has_diagnosis_of_peripheral_arterial_occlusive_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with peripheral arterial occlusive disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with peripheral arterial occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with peripheral arterial occlusive disease."} ;; "the patient has a history of peripheral artery disease"

(declare-const patient_has_diagnosis_of_preinfarction_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with unstable angina (preinfarction syndrome) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient has ever been diagnosed with unstable angina (preinfarction syndrome)."} ;; "the patient has a history of unstable angina"

(declare-const patient_has_diagnosis_of_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with ischemia at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with ischemia.","meaning":"Boolean indicating whether the patient has ever been diagnosed with ischemia."} ;; "the patient has a history of ischemia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_physical_impairment_making_intervention_very_difficult_according_to_physician_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a physical impairment which would make the intervention very difficult according to the patient's physician."

(assert
(! (not patient_has_finding_of_physical_impairment_making_intervention_unsafe_according_to_physician_now)
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a physical impairment which would make the intervention unsafe according to the patient's physician."

(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory)
    :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myocardial infarction."

(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
    :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stroke."

(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
    :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of coronary bypass surgery."

(assert
(! (not patient_has_undergone_angioplasty_of_blood_vessel_inthepast6months)
    :named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of angioplasty in the last six months."

(assert
(! (not patient_has_diagnosis_of_peripheral_arterial_occlusive_disease_inthehistory)
    :named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of peripheral artery disease."

(assert
(! (not patient_has_diagnosis_of_preinfarction_syndrome_inthehistory)
    :named REQ0_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of unstable angina."

(assert
(! (not patient_has_diagnosis_of_ischemia_inthehistory)
    :named REQ0_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of ischemia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_been_enrolled_in_formal_weight_loss_program_within_past_1_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been enrolled in a formal weight loss program at any time within the past one year.","when_to_set_to_false":"Set to false if the patient has not been enrolled in a formal weight loss program within the past one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been enrolled in a formal weight loss program within the past one year.","meaning":"Boolean indicating whether the patient has been enrolled in a formal weight loss program within the past one year."} ;; "has been enrolled within the past one year in a formal weight loss program"
(declare-const time_since_last_enrollment_in_formal_weight_loss_program_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years since the patient's last enrollment in a formal weight loss program, if known.","when_to_set_to_null":"Set to null if the time since last enrollment in a formal weight loss program is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the time in years since the patient's last enrollment in a formal weight loss program."} ;; "within the past one year in a formal weight loss program"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_been_enrolled_in_formal_weight_loss_program_within_past_1_year)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been enrolled within the past one year in a formal weight loss program."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_body_weight_value_recorded_inthepast6months_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight (in kilograms) was recorded within the previous six months.","when_to_set_to_null":"Set to null if no body weight measurement in kilograms was recorded within the previous six months or the value is indeterminate.","meaning":"Numeric value representing the patient's body weight (in kilograms) recorded within the previous six months."} ;; "body weight"
(declare-const patient_body_weight_value_reported_lost_inthepast6months_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the reported value if the patient has reported losing a specific amount of body weight (in kilograms) within the previous six months.","when_to_set_to_null":"Set to null if no reported body weight loss in kilograms is available for the previous six months or the value is indeterminate.","meaning":"Numeric value representing the amount of body weight (in kilograms) the patient has reported losing within the previous six months."} ;; "reported losing greater than five percent of current body weight in the previous six months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_body_weight_value_reported_lost_inthepast6months_withunit_kg
           (* 0.05 patient_body_weight_value_recorded_inthepast6months_withunit_kg)))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has reported losing greater than five percent of current body weight in the previous six months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tobacco smoking behavior.","when_to_set_to_false":"Set to false if the patient currently does not have tobacco smoking behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tobacco smoking behavior.","meaning":"Boolean indicating whether the patient currently has tobacco smoking behavior."} ;; "The patient is excluded if the patient has tobacco smoking."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_tobacco_smoking_behavior_finding_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tobacco smoking."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_plans_to_move_from_area Bool) ;; {"when_to_set_to_true":"Set to true if it is documented or reported that the patient plans to move from the area.","when_to_set_to_false":"Set to false if it is documented or reported that the patient does not plan to move from the area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient plans to move from the area.","meaning":"Boolean indicating whether the patient plans to move from the area."} ;; "The patient is excluded if the patient plans to move from the area."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_plans_to_move_from_area)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient plans to move from the area."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_participating_in_another_research_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in another research study.","when_to_set_to_false":"Set to false if the patient is currently not participating in another research study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another research study.","meaning":"Boolean indicating whether the patient is currently participating in another research study."} ;; "The patient is excluded if the patient is participating in another research study."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_participating_in_another_research_study_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is participating in another research study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_clinically_judged_unsuitable_for_participation_by_physician_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's physician currently judges the patient to be unsuitable for participation.","when_to_set_to_false":"Set to false if the patient's physician currently judges the patient to be suitable for participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physician currently judges the patient to be unsuitable for participation.","meaning":"Boolean indicating whether the patient is currently considered unsuitable for participation as determined by the patient's physician."} ;; "the patient is clinically judged to be unsuitable for participation as determined by the patient's physician"
(declare-const patient_is_clinically_judged_unsuitable_for_adherence_by_physician_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's physician currently judges the patient to be unsuitable for adherence.","when_to_set_to_false":"Set to false if the patient's physician currently judges the patient to be suitable for adherence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physician currently judges the patient to be unsuitable for adherence.","meaning":"Boolean indicating whether the patient is currently considered unsuitable for adherence as determined by the patient's physician."} ;; "the patient is clinically judged to be unsuitable for adherence as determined by the patient's physician"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_clinically_judged_unsuitable_for_participation_by_physician_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is clinically judged to be unsuitable for participation as determined by the patient's physician."

(assert
(! (not patient_is_clinically_judged_unsuitable_for_adherence_by_physician_now)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is clinically judged to be unsuitable for adherence as determined by the patient's physician."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_unable_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently able to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to provide informed consent.","meaning":"Boolean indicating whether the patient is currently unable to provide informed consent."} ;; "the patient is unable to provide informed consent"
(declare-const patient_is_unwilling_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently willing to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to provide informed consent.","meaning":"Boolean indicating whether the patient is currently unwilling to provide informed consent."} ;; "the patient is unwilling to provide informed consent"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_unable_to_provide_informed_consent_now)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide informed consent."

(assert
(! (not patient_is_unwilling_to_provide_informed_consent_now)
:named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to provide informed consent."
