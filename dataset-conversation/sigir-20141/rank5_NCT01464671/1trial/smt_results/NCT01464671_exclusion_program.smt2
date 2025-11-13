;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing cardiogenic shock.","when_to_set_to_false":"Set to false if the patient is currently not experiencing cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing cardiogenic shock.","meaning":"Boolean indicating whether the patient is currently experiencing cardiogenic shock."} ;; "cardiogenic shock"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_cardiogenic_shock_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is in cardiogenic shock."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "acute coronary syndrome"
(declare-const patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute non-ST-segment elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute non-ST-segment elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute non-ST-segment elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute non-ST-segment elevation myocardial infarction."} ;; "non-ST-elevation myocardial infarction"
(declare-const patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute ST-segment elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute ST-segment elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute ST-segment elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute ST-segment elevation myocardial infarction."} ;; "ST-elevation myocardial infarction"
(declare-const patient_has_finding_of_unstable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unstable angina.","when_to_set_to_false":"Set to false if the patient currently does not have unstable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina.","meaning":"Boolean indicating whether the patient currently has unstable angina."} ;; "unstable angina"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Exhaustive subcategories define acute coronary syndrome exactly
(assert
(! (= patient_has_finding_of_acute_coronary_syndrome_now
     (or patient_has_finding_of_unstable_angina_now
         patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now
         patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now))
   :named REQ1_AUXILIARY0)) ;; "acute coronary syndrome with exhaustive subcategories ((unstable angina) OR (non-ST-elevation myocardial infarction) OR (ST-elevation myocardial infarction))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_unstable_angina_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina."

(assert
(! (not patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-ST-elevation myocardial infarction."

(assert
(! (not patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now)
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ST-elevation myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_heparin_induced_thrombocytopenia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of diagnosis of heparin-induced thrombocytopenia at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of diagnosis of heparin-induced thrombocytopenia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of diagnosis of heparin-induced thrombocytopenia.","meaning":"Boolean indicating whether the patient has ever been diagnosed with heparin-induced thrombocytopenia."} ;; "heparin-induced thrombocytopenia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_heparin_induced_thrombocytopenia_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of heparin-induced thrombocytopenia."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_contraindication_to_heparin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented contraindication to unfractionated heparin at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented contraindication to unfractionated heparin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a contraindication to unfractionated heparin in their history.","meaning":"Boolean indicating whether the patient has a contraindication to unfractionated heparin at any time in their history."} ;; "contraindication to unfractionated heparin"
(declare-const patient_has_contraindication_to_bivalirudin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented contraindication to bivalirudin at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented contraindication to bivalirudin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a contraindication to bivalirudin in their history.","meaning":"Boolean indicating whether the patient has a contraindication to bivalirudin at any time in their history."} ;; "contraindication to bivalirudin"
(declare-const patient_has_contraindication_to_anticoagulant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented contraindication to any anticoagulant pharmacological agent at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented contraindication to any anticoagulant pharmacological agent at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a contraindication to any anticoagulant pharmacological agent in their history.","meaning":"Boolean indicating whether the patient has a contraindication to any anticoagulant pharmacological agent at any time in their history."} ;; "contraindication to any anticoagulant pharmacological agent"
(declare-const patient_has_contraindication_to_antithrombotic_pharmacological_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented contraindication to any antithrombotic pharmacological agent at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented contraindication to any antithrombotic pharmacological agent at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a contraindication to any antithrombotic pharmacological agent in their history.","meaning":"Boolean indicating whether the patient has a contraindication to any antithrombotic pharmacological agent at any time in their history."} ;; "contraindication to any antithrombotic pharmacological agent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_contraindication_to_heparin_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to unfractionated heparin."

(assert
(! (not patient_has_contraindication_to_bivalirudin_inthehistory)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to bivalirudin."

(assert
(! (not patient_has_contraindication_to_anticoagulant_inthehistory)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to any anticoagulant pharmacological agent."

(assert
(! (not patient_has_contraindication_to_antithrombotic_pharmacological_agent_inthehistory)
:named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to any antithrombotic pharmacological agent."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_significant_medical_condition_that_may_interfere_with_optimal_study_participation_in_investigators_opinion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any significant medical condition which, in the investigator's opinion, may interfere with the patient's optimal participation in the study.","when_to_set_to_false":"Set to false if the patient currently does not have any significant medical condition which, in the investigator's opinion, may interfere with the patient's optimal participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any significant medical condition which, in the investigator's opinion, may interfere with the patient's optimal participation in the study.","meaning":"Boolean indicating whether the patient currently has any significant medical condition which, in the investigator's opinion, may interfere with the patient's optimal participation in the study."} ;; "any significant medical condition which, in the investigator's opinion, may interfere with the patient's optimal participation in the study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_significant_medical_condition_that_may_interfere_with_optimal_study_participation_in_investigators_opinion_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any significant medical condition which, in the investigator's opinion, may interfere with the patient's optimal participation in the study."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is a pregnant woman"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is a nursing mother"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a pregnant woman."

(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a nursing mother."
