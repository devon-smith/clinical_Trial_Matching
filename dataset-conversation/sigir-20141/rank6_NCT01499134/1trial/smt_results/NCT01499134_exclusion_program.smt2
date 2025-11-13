;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any clinical trial.","when_to_set_to_false":"Set to false if the patient is currently not participating in any clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in a clinical trial."} ;; "participating in another clinical trial"
(declare-const patient_is_undergoing_clinical_trial_now@@not_current_study Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial the patient is currently participating in is not the current study.","when_to_set_to_false":"Set to false if the clinical trial the patient is currently participating in is the current study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial is the current study or another study.","meaning":"Boolean indicating whether the clinical trial the patient is currently participating in is not the current study."} ;; "participating in another clinical trial"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_undergoing_clinical_trial_now@@not_current_study
      patient_is_undergoing_clinical_trial_now)
   :named REQ0_AUXILIARY0)) ;; "participating in another clinical trial" (qualifier variable implies stem variable)

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_undergoing_clinical_trial_now@@not_current_study)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is participating in another clinical trial."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain.","when_to_set_to_false":"Set to false if the patient currently does not have pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain.","meaning":"Boolean indicating whether the patient currently has pain."} ;; "ongoing ischemic limb pain at rest"
(declare-const patient_has_finding_of_pain_now@@located_in_limb Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pain is located in the limb.","when_to_set_to_false":"Set to false if the patient's pain is not located in the limb.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pain is located in the limb.","meaning":"Boolean indicating whether the patient's pain is located in the limb."} ;; "limb pain"
(declare-const patient_has_finding_of_pain_now@@ongoing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pain is ongoing.","when_to_set_to_false":"Set to false if the patient's pain is not ongoing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pain is ongoing.","meaning":"Boolean indicating whether the patient's pain is ongoing."} ;; "ongoing pain"
(declare-const patient_has_finding_of_pain_now@@occurs_at_rest Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pain occurs at rest.","when_to_set_to_false":"Set to false if the patient's pain does not occur at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pain occurs at rest.","meaning":"Boolean indicating whether the patient's pain occurs at rest."} ;; "pain at rest"

(declare-const patient_has_finding_of_ulcer_of_lower_extremity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ulceration of the lower extremity.","when_to_set_to_false":"Set to false if the patient currently does not have ulceration of the lower extremity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ulceration of the lower extremity.","meaning":"Boolean indicating whether the patient currently has ulceration of the lower extremity."} ;; "lower extremity ulceration"
(declare-const patient_has_finding_of_ulcer_of_lower_extremity_now@@due_to_arterial_insufficiency Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lower extremity ulceration is due to arterial insufficiency.","when_to_set_to_false":"Set to false if the patient's lower extremity ulceration is not due to arterial insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ulceration is due to arterial insufficiency.","meaning":"Boolean indicating whether the patient's lower extremity ulceration is due to arterial insufficiency."} ;; "ulceration due to arterial insufficiency"

(declare-const patient_ankle_brachial_pressure_index_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the ankle-brachial pressure index recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric ratio representing the patient's current ankle-brachial pressure index value."} ;; "ankle-brachial index less than 0.6"
(declare-const patient_has_finding_of_disease_potentially_requiring_revascularization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease that potentially requires revascularization.","when_to_set_to_false":"Set to false if the patient currently does not have a disease that potentially requires revascularization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease potentially requiring revascularization.","meaning":"Boolean indicating whether the patient currently has a disease potentially requiring revascularization."} ;; "disease potentially requiring revascularization"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_pain_now@@located_in_limb
       patient_has_finding_of_pain_now)
    :named REQ1_AUXILIARY0)) ;; "limb pain"

(assert
(! (=> patient_has_finding_of_pain_now@@ongoing
       patient_has_finding_of_pain_now)
    :named REQ1_AUXILIARY1)) ;; "ongoing pain"

(assert
(! (=> patient_has_finding_of_pain_now@@occurs_at_rest
       patient_has_finding_of_pain_now)
    :named REQ1_AUXILIARY2)) ;; "pain at rest"

(assert
(! (=> patient_has_finding_of_ulcer_of_lower_extremity_now@@due_to_arterial_insufficiency
       patient_has_finding_of_ulcer_of_lower_extremity_now)
    :named REQ1_AUXILIARY3)) ;; "ulceration due to arterial insufficiency"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: ongoing ischemic limb pain at rest
(assert
(! (not (and patient_has_finding_of_pain_now@@ongoing
             patient_has_finding_of_pain_now@@located_in_limb
             patient_has_finding_of_pain_now@@occurs_at_rest))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ongoing ischemic limb pain at rest."

;; Exclusion: lower extremity ulceration due to arterial insufficiency
(assert
(! (not patient_has_finding_of_ulcer_of_lower_extremity_now@@due_to_arterial_insufficiency)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lower extremity ulceration due to arterial insufficiency."

;; Exclusion: ankle-brachial index less than 0.6 indicating disease potentially requiring revascularization
(assert
(! (not (and (< patient_ankle_brachial_pressure_index_value_recorded_now_withunit_ratio 0.6)
             patient_has_finding_of_disease_potentially_requiring_revascularization_now))
    :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an ankle-brachial index less than 0.6 indicating disease potentially requiring revascularization."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_amputation_of_limb_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a limb amputation procedure at any point in their medical history, regardless of cause.","when_to_set_to_false":"Set to false if the patient has never undergone a limb amputation procedure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a limb amputation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a limb amputation procedure in their medical history."} ;; "history of limb amputation"
(declare-const patient_has_undergone_amputation_of_limb_inthehistory@@due_to_arterial_insufficiency Bool) ;; {"when_to_set_to_true":"Set to true if the limb amputation procedure was performed specifically due to arterial insufficiency.","when_to_set_to_false":"Set to false if the limb amputation procedure was not performed due to arterial insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the limb amputation was due to arterial insufficiency.","meaning":"Boolean indicating whether the limb amputation was performed due to arterial insufficiency."} ;; "history of limb amputation due to arterial insufficiency"
(declare-const patient_has_undergone_amputation_of_digit_inthehistory@@due_to_arterial_insufficiency Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a digit amputation procedure at any point in their medical history, and the procedure was performed specifically due to arterial insufficiency.","when_to_set_to_false":"Set to false if the patient has never undergone a digit amputation procedure due to arterial insufficiency at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a digit amputation procedure due to arterial insufficiency in their medical history.","meaning":"Boolean indicating whether the patient has ever undergone a digit amputation procedure due to arterial insufficiency in their medical history."} ;; "history of digit amputation due to arterial insufficiency"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for limb amputation
(assert
(! (=> patient_has_undergone_amputation_of_limb_inthehistory@@due_to_arterial_insufficiency
      patient_has_undergone_amputation_of_limb_inthehistory)
    :named REQ2_AUXILIARY0)) ;; "history of limb amputation due to arterial insufficiency"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have a history of limb amputation due to arterial insufficiency OR digit amputation due to arterial insufficiency
(assert
(! (not (or patient_has_undergone_amputation_of_limb_inthehistory@@due_to_arterial_insufficiency
            patient_has_undergone_amputation_of_digit_inthehistory@@due_to_arterial_insufficiency))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of limb amputation due to arterial insufficiency) OR (the patient has a history of digit amputation due to arterial insufficiency))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const months_since_most_recent_revascularization_of_peripheral_vessels Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent revascularization of peripheral vessels, if known.","when_to_set_to_null":"Set to null if the number of months since the patient's most recent revascularization of peripheral vessels is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of months since the patient's most recent revascularization of peripheral vessels."} ;; "number of months since the patient's most recent revascularization of peripheral vessels"

(declare-const patient_has_undergone_revascularization_of_peripheral_vessels_within_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone revascularization of peripheral vessels within the preceding 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone revascularization of peripheral vessels within the preceding 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone revascularization of peripheral vessels within the preceding 6 months.","meaning":"Boolean indicating whether the patient has undergone revascularization of peripheral vessels within the preceding 6 months."} ;; "undergone revascularization of peripheral vessels within the preceding 6 months"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: patient_has_undergone_revascularization_of_peripheral_vessels_within_6_months is true iff months_since_most_recent_revascularization_of_peripheral_vessels < 6
(assert
(! (= patient_has_undergone_revascularization_of_peripheral_vessels_within_6_months
     (< months_since_most_recent_revascularization_of_peripheral_vessels 6))
   :named REQ3_AUXILIARY0)) ;; "has had revascularization of peripheral vessels within the preceding 6 months."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_revascularization_of_peripheral_vessels_within_6_months)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had revascularization of peripheral vessels within the preceding 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncontrolled hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncontrolled hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled hypertension.","meaning":"Boolean indicating whether the patient currently has uncontrolled hypertension."} ;; "uncontrolled hypertension"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure greater than or equal to 160 millimeters of mercury"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current diastolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in millimeters of mercury."} ;; "diastolic blood pressure greater than or equal to 100 millimeters of mercury"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: uncontrolled hypertension as defined by (systolic BP >= 160 OR diastolic BP >= 100)
(assert
(! (= patient_has_finding_of_poor_hypertension_control_now
     (or (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 160)
         (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100)))
   :named REQ4_AUXILIARY0)) ;; "uncontrolled hypertension as defined by (systolic blood pressure >= 160 mmHg OR diastolic blood pressure >= 100 mmHg)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_poor_hypertension_control_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled hypertension as defined by (systolic blood pressure >= 160 mmHg OR diastolic blood pressure >= 100 mmHg)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_contraindication_to_beta_adrenergic_receptor_blocking_agent_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a contraindication to beta adrenergic receptor blocking agent therapy.","when_to_set_to_false":"Set to false if the patient does not have a contraindication to beta adrenergic receptor blocking agent therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a contraindication to beta adrenergic receptor blocking agent therapy.","meaning":"Boolean indicating whether the patient has a contraindication to beta adrenergic receptor blocking agent therapy."} ;; "the patient has a contraindication to beta blocker therapy"

(declare-const patient_has_finding_of_allergic_disposition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of allergic disposition at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of allergic disposition at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of allergic disposition.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergic disposition in their medical history."} ;; "allergy"

(declare-const patient_has_finding_of_allergic_disposition_inthehistory@@to_beta_adrenergic_receptor_blocking_agent_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergic disposition is specifically to beta adrenergic receptor blocking agent therapy.","when_to_set_to_false":"Set to false if the patient's allergic disposition is not to beta adrenergic receptor blocking agent therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergic disposition is to beta adrenergic receptor blocking agent therapy.","meaning":"Boolean indicating whether the allergic disposition is specifically to beta adrenergic receptor blocking agent therapy."} ;; "allergy to beta blocker therapy"

(declare-const patient_has_undergone_beta_adrenergic_receptor_blocking_agent_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone beta adrenergic receptor blocking agent therapy at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone beta adrenergic receptor blocking agent therapy at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone beta adrenergic receptor blocking agent therapy.","meaning":"Boolean indicating whether the patient has ever undergone beta adrenergic receptor blocking agent therapy in their medical history."} ;; "beta blocker therapy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergic_disposition_inthehistory@@to_beta_adrenergic_receptor_blocking_agent_therapy
       patient_has_finding_of_allergic_disposition_inthehistory)
    :named REQ5_AUXILIARY0)) ;; "allergy to beta blocker therapy" implies "allergy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_has_contraindication_to_beta_adrenergic_receptor_blocking_agent_therapy
            patient_has_finding_of_allergic_disposition_inthehistory@@to_beta_adrenergic_receptor_blocking_agent_therapy))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a contraindication to beta blocker therapy) OR (the patient has an allergy to beta blocker therapy))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past 6 months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past 6 months."} ;; "the patient has a history of myocardial infarction within the preceding 6 months"

(declare-const patient_has_history_of_coronary_revascularization_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of coronary revascularization within the past 6 months.","when_to_set_to_false":"Set to false if the patient does not have a history of coronary revascularization within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of coronary revascularization within the past 6 months.","meaning":"Boolean indicating whether the patient has a history of coronary revascularization within the past 6 months."} ;; "the patient has a history of coronary revascularization within the preceding 6 months"

(declare-const patient_has_history_of_cerebrovascular_event_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of cerebrovascular event within the past 6 months.","when_to_set_to_false":"Set to false if the patient does not have a history of cerebrovascular event within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cerebrovascular event within the past 6 months.","meaning":"Boolean indicating whether the patient has a history of cerebrovascular event within the past 6 months."} ;; "the patient has a history of cerebrovascular event within the preceding 6 months"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast6months)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myocardial infarction within the preceding 6 months."

(assert
(! (not patient_has_history_of_coronary_revascularization_inthepast6months)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of coronary revascularization within the preceding 6 months."

(assert
(! (not patient_has_history_of_cerebrovascular_event_inthepast6months)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebrovascular event within the preceding 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has angina pectoris.","meaning":"Boolean indicating whether the patient currently has angina pectoris."} ;; "angina"

(declare-const patient_has_finding_of_angina_pectoris_now@@angina_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris and the angina is of class III severity.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris but the angina is not of class III severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris is of class III severity.","meaning":"Boolean indicating whether the patient's angina pectoris is of class III severity."} ;; "class III angina"

(declare-const patient_has_finding_of_angina_pectoris_now@@angina_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris and the angina is of class IV severity.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris but the angina is not of class IV severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris is of class IV severity.","meaning":"Boolean indicating whether the patient's angina pectoris is of class IV severity."} ;; "class IV angina"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_angina_pectoris_now@@angina_class_iii
       patient_has_finding_of_angina_pectoris_now)
   :named REQ7_AUXILIARY0)) ;; "class III angina" implies "angina"

(assert
(! (=> patient_has_finding_of_angina_pectoris_now@@angina_class_iv
       patient_has_finding_of_angina_pectoris_now)
   :named REQ7_AUXILIARY1)) ;; "class IV angina" implies "angina"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_finding_of_angina_pectoris_now@@angina_class_iii
            patient_has_finding_of_angina_pectoris_now@@angina_class_iv))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has class III angina) OR (the patient has class IV angina))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "current history of heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is classified as NYHA class III.","when_to_set_to_false":"Set to false if the patient's current heart failure is not classified as NYHA class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is NYHA class III.","meaning":"Boolean indicating whether the patient's current heart failure is NYHA class III."} ;; "current history of New York Heart Association class III heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is classified as NYHA class IV.","when_to_set_to_false":"Set to false if the patient's current heart failure is not classified as NYHA class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is NYHA class IV.","meaning":"Boolean indicating whether the patient's current heart failure is NYHA class IV."} ;; "current history of New York Heart Association class IV heart failure"
(declare-const patient_has_finding_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of heart failure.","when_to_set_to_false":"Set to false if the patient does not have a history of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of heart failure.","meaning":"Boolean indicating whether the patient has a history of heart failure."} ;; "past history of heart failure"
(declare-const patient_has_finding_of_heart_failure_inthehistory@@nyha_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical heart failure is classified as NYHA class III.","when_to_set_to_false":"Set to false if the patient's historical heart failure is not classified as NYHA class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's historical heart failure is NYHA class III.","meaning":"Boolean indicating whether the patient's historical heart failure is NYHA class III."} ;; "past history of New York Heart Association class III heart failure"
(declare-const patient_has_finding_of_heart_failure_inthehistory@@nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical heart failure is classified as NYHA class IV.","when_to_set_to_false":"Set to false if the patient's historical heart failure is not classified as NYHA class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's historical heart failure is NYHA class IV.","meaning":"Boolean indicating whether the patient's historical heart failure is NYHA class IV."} ;; "past history of New York Heart Association class IV heart failure"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_class_iii
       patient_has_finding_of_heart_failure_now)
   :named REQ8_AUXILIARY0)) ;; "current history of New York Heart Association class III heart failure"

(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_class_iv
       patient_has_finding_of_heart_failure_now)
   :named REQ8_AUXILIARY1)) ;; "current history of New York Heart Association class IV heart failure"

(assert
(! (=> patient_has_finding_of_heart_failure_inthehistory@@nyha_class_iii
       patient_has_finding_of_heart_failure_inthehistory)
   :named REQ8_AUXILIARY2)) ;; "past history of New York Heart Association class III heart failure"

(assert
(! (=> patient_has_finding_of_heart_failure_inthehistory@@nyha_class_iv
       patient_has_finding_of_heart_failure_inthehistory)
   :named REQ8_AUXILIARY3)) ;; "past history of New York Heart Association class IV heart failure"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@nyha_class_iii)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current history of New York Heart Association class III heart failure."

(assert
(! (not patient_has_finding_of_heart_failure_inthehistory@@nyha_class_iii)
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of New York Heart Association class III heart failure."

(assert
(! (not patient_has_finding_of_heart_failure_now@@nyha_class_iv)
   :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current history of New York Heart Association class IV heart failure."

(assert
(! (not patient_has_finding_of_heart_failure_inthehistory@@nyha_class_iv)
   :named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of New York Heart Association class IV heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_able_to_walk_on_a_treadmill_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to walk on a treadmill for any reason.","when_to_set_to_false":"Set to false if the patient is currently unable to walk on a treadmill for any reason.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to walk on a treadmill for any reason.","meaning":"Boolean indicating whether the patient is currently able to walk on a treadmill for any reason."} ;; "unable to walk on a treadmill for any reason"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_able_to_walk_on_a_treadmill_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to walk on a treadmill for any reason."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_taking_nitroglycerin_containing_product_in_oral_dose_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking oral nitroglycerin-containing products.","when_to_set_to_false":"Set to false if the patient is currently not taking oral nitroglycerin-containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking oral nitroglycerin-containing products.","meaning":"Boolean indicating whether the patient is currently taking oral nitroglycerin-containing products."} ;; "the patient regularly uses oral nitroglycerin"
(declare-const patient_is_taking_nitroglycerin_20_mg_g_cutaneous_ointment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking nitroglycerin 20 mg/g cutaneous ointment.","when_to_set_to_false":"Set to false if the patient is currently not taking nitroglycerin 20 mg/g cutaneous ointment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking nitroglycerin 20 mg/g cutaneous ointment.","meaning":"Boolean indicating whether the patient is currently taking nitroglycerin 20 mg/g cutaneous ointment."} ;; "the patient regularly uses transdermal nitroglycerin ointment"
(declare-const patient_is_taking_nitroglycerin_containing_product_now@@transdermal_patch_form Bool) ;; {"when_to_set_to_true":"Set to true if the nitroglycerin-containing product is in transdermal patch form.","when_to_set_to_false":"Set to false if the nitroglycerin-containing product is not in transdermal patch form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nitroglycerin-containing product is in transdermal patch form.","meaning":"Boolean indicating whether the nitroglycerin-containing product is in transdermal patch form."} ;; "the patient regularly uses transdermal nitroglycerin patch"
(declare-const patient_is_taking_nitroglycerin_containing_product_now@@sublingual_form Bool) ;; {"when_to_set_to_true":"Set to true if the nitroglycerin-containing product is in sublingual form.","when_to_set_to_false":"Set to false if the nitroglycerin-containing product is not in sublingual form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nitroglycerin-containing product is in sublingual form.","meaning":"Boolean indicating whether the nitroglycerin-containing product is in sublingual form."} ;; "the patient regularly uses sublingual nitroglycerin"
(declare-const patient_is_taking_nitroglycerin_containing_product_now@@translingual_spray_form Bool) ;; {"when_to_set_to_true":"Set to true if the nitroglycerin-containing product is in translingual spray form.","when_to_set_to_false":"Set to false if the nitroglycerin-containing product is not in translingual spray form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nitroglycerin-containing product is in translingual spray form.","meaning":"Boolean indicating whether the nitroglycerin-containing product is in translingual spray form."} ;; "the patient regularly uses translingual nitroglycerin spray"
(declare-const patient_is_exposed_to_nitrate_salt_now@@via_combination_agents Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to nitrate salts is via combination agents containing nitrates.","when_to_set_to_false":"Set to false if the patient's exposure to nitrate salts is not via combination agents containing nitrates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to nitrate salts is via combination agents containing nitrates.","meaning":"Boolean indicating whether the patient's exposure to nitrate salts is via combination agents containing nitrates."} ;; "the patient regularly uses combination agents containing nitrates"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_taking_nitroglycerin_containing_product_in_oral_dose_form_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient regularly uses oral nitroglycerin"

(assert
(! (not patient_is_taking_nitroglycerin_20_mg_g_cutaneous_ointment_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient regularly uses transdermal nitroglycerin ointment"

(assert
(! (not patient_is_taking_nitroglycerin_containing_product_now@@transdermal_patch_form)
:named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient regularly uses transdermal nitroglycerin patch"

(assert
(! (not patient_is_taking_nitroglycerin_containing_product_now@@sublingual_form)
:named REQ10_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient regularly uses sublingual nitroglycerin"

(assert
(! (not patient_is_taking_nitroglycerin_containing_product_now@@translingual_spray_form)
:named REQ10_COMPONENT4_OTHER_REQUIREMENTS)) ;; "the patient regularly uses translingual nitroglycerin spray"

(assert
(! (not patient_is_exposed_to_nitrate_salt_now@@via_combination_agents)
:named REQ10_COMPONENT5_OTHER_REQUIREMENTS)) ;; "the patient regularly uses combination agents containing nitrates"

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_liver_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a liver disorder (liver process).","when_to_set_to_false":"Set to false if the patient currently does not have a liver disorder (liver process).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a liver disorder (liver process).","meaning":"Boolean indicating whether the patient currently has a liver disorder (liver process) now."} ;; "liver process"
(declare-const patient_has_finding_of_liver_disorder_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a liver disorder (liver process) and the process is active.","when_to_set_to_false":"Set to false if the patient currently has a liver disorder (liver process) but the process is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the liver disorder (liver process) is active.","meaning":"Boolean indicating whether the patient's current liver disorder (liver process) is active."} ;; "active liver process"

(declare-const patient_has_finding_of_pulmonary_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary disorder (pulmonary process).","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary disorder (pulmonary process).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary disorder (pulmonary process).","meaning":"Boolean indicating whether the patient currently has a pulmonary disorder (pulmonary process) now."} ;; "pulmonary process"
(declare-const patient_has_finding_of_pulmonary_disorder_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary disorder (pulmonary process) and the process is active.","when_to_set_to_false":"Set to false if the patient currently has a pulmonary disorder (pulmonary process) but the process is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary disorder (pulmonary process) is active.","meaning":"Boolean indicating whether the patient's current pulmonary disorder (pulmonary process) is active."} ;; "active pulmonary process"

(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection (infectious process).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection (infectious process).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection (infectious process).","meaning":"Boolean indicating whether the patient currently has a disorder due to infection (infectious process) now."} ;; "infectious process"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the process is active.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the process is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder due to infection is active.","meaning":"Boolean indicating whether the patient's current disorder due to infection is active."} ;; "active infectious process"

(declare-const patient_has_finding_of_inflammatory_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inflammatory disorder (inflammatory process).","when_to_set_to_false":"Set to false if the patient currently does not have an inflammatory disorder (inflammatory process).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inflammatory disorder (inflammatory process).","meaning":"Boolean indicating whether the patient currently has an inflammatory disorder (inflammatory process) now."} ;; "inflammatory process"
(declare-const patient_has_finding_of_inflammatory_disorder_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inflammatory disorder and the process is active.","when_to_set_to_false":"Set to false if the patient currently has an inflammatory disorder but the process is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inflammatory disorder is active.","meaning":"Boolean indicating whether the patient's current inflammatory disorder is active."} ;; "active inflammatory process"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_liver_disorder_now@@active_status
      patient_has_finding_of_liver_disorder_now)
    :named REQ11_AUXILIARY0)) ;; "active liver process"

(assert
(! (=> patient_has_finding_of_pulmonary_disorder_now@@active_status
      patient_has_finding_of_pulmonary_disorder_now)
    :named REQ11_AUXILIARY1)) ;; "active pulmonary process"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@active_status
      patient_has_finding_of_disorder_due_to_infection_now)
    :named REQ11_AUXILIARY2)) ;; "active infectious process"

(assert
(! (=> patient_has_finding_of_inflammatory_disorder_now@@active_status
      patient_has_finding_of_inflammatory_disorder_now)
    :named REQ11_AUXILIARY3)) ;; "active inflammatory process"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_liver_disorder_now@@active_status)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an active liver process."

(assert
(! (not patient_has_finding_of_pulmonary_disorder_now@@active_status)
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an active pulmonary process."

(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@active_status)
    :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an active infectious process."

(assert
(! (not patient_has_finding_of_inflammatory_disorder_now@@active_status)
    :named REQ11_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an active inflammatory process."

;; --- verifier-bypassed (attempt 8/8) 2025-10-25T01:56:50.939096 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malignant neoplastic disease (malignancy) within the past five years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malignant neoplastic disease (malignancy) within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malignant neoplastic disease (malignancy) within the past five years.","meaning":"Boolean indicating whether the patient has had a diagnosis of malignant neoplastic disease (malignancy) within the past five years."} ;; "malignancy"
(declare-const patient_has_history_of_basal_cell_skin_cancer_within_past5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of basal cell skin cancer within the preceding five years.","when_to_set_to_false":"Set to false if the patient does not have a history of basal cell skin cancer within the preceding five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of basal cell skin cancer within the preceding five years.","meaning":"Boolean indicating whether the patient has a history of basal cell skin cancer within the preceding five years."} ;; "basal cell skin cancer"
(declare-const patient_has_history_of_squamous_cell_skin_cancer_within_past5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of squamous cell skin cancer within the preceding five years.","when_to_set_to_false":"Set to false if the patient does not have a history of squamous cell skin cancer within the preceding five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of squamous cell skin cancer within the preceding five years.","meaning":"Boolean indicating whether the patient has a history of squamous cell skin cancer within the preceding five years."} ;; "squamous cell skin cancer"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; If the only malignancy within the past 5 years is basal cell or squamous cell skin cancer, then the patient does not have any other malignancy within the past 5 years.
(assert
(! (=> (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years
           (or patient_has_history_of_basal_cell_skin_cancer_within_past5years
               patient_has_history_of_squamous_cell_skin_cancer_within_past5years))
        (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years
                  (not (or patient_has_history_of_basal_cell_skin_cancer_within_past5years
                           patient_has_history_of_squamous_cell_skin_cancer_within_past5years)))))
   :named REQ12_AUXILIARY0)) ;; "the history of malignancy within the preceding five years is ONLY basal cell skin cancer OR squamous cell skin cancer"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclude if the patient has a history of malignancy within the preceding five years AND NOT (the history is ONLY basal cell or squamous cell skin cancer)
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years
             (not (and (or patient_has_history_of_basal_cell_skin_cancer_within_past5years
                           patient_has_history_of_squamous_cell_skin_cancer_within_past5years)
                       (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years
                                 (not (or patient_has_history_of_basal_cell_skin_cancer_within_past5years
                                          patient_has_history_of_squamous_cell_skin_cancer_within_past5years))))))))
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of malignancy within the preceding five years) AND NOT ((the history of malignancy within the preceding five years is ONLY basal cell skin cancer OR squamous cell skin cancer))."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@renders_enrollment_unsafe_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease, condition, or clinical finding, and the investigators judge that this renders it unsafe for the patient to be enrolled.","when_to_set_to_false":"Set to false if the patient currently has a disease, condition, or clinical finding, but the investigators do not judge it to render enrollment unsafe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigators judge the condition to render enrollment unsafe.","meaning":"Boolean indicating whether the patient currently has a disease, condition, or clinical finding that, in the opinion of the investigators, renders it unsafe for the patient to be enrolled."} ;; "in the opinion of the investigators, renders it unsafe for the patient to be enrolled"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@renders_enrollment_unsafe_investigator_opinion
       patient_has_finding_of_disease_condition_finding_now)
   :named REQ13_AUXILIARY0)) ;; "the patient currently has a disease, condition, or clinical finding, and the investigators judge that this renders it unsafe for the patient to be enrolled"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@renders_enrollment_unsafe_investigator_opinion)
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other condition that, in the opinion of the investigators, renders it unsafe for the patient to be enrolled."
