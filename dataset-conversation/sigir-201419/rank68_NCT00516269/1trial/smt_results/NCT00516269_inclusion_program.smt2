;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_breast_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with malignant tumor of the breast (breast cancer).","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with malignant tumor of the breast (breast cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with malignant tumor of the breast (breast cancer).","meaning":"Boolean indicating whether the patient is currently diagnosed with malignant tumor of the breast (breast cancer)."} // "be diagnosed with breast cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with malignant neoplasm of the gastrointestinal tract (gastrointestinal cancer).","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with malignant neoplasm of the gastrointestinal tract (gastrointestinal cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with malignant neoplasm of the gastrointestinal tract (gastrointestinal cancer).","meaning":"Boolean indicating whether the patient is currently diagnosed with malignant neoplasm of the gastrointestinal tract (gastrointestinal cancer)."} // "be diagnosed with gastrointestinal cancer"
(declare-const patient_has_diagnosis_of_malignant_lymphoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with malignant lymphoma.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with malignant lymphoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with malignant lymphoma.","meaning":"Boolean indicating whether the patient is currently diagnosed with malignant lymphoma."} // "be diagnosed with lymphoma"
(declare-const patient_has_diagnosis_of_multiple_myeloma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with multiple myeloma.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with multiple myeloma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with multiple myeloma.","meaning":"Boolean indicating whether the patient is currently diagnosed with multiple myeloma."} // "be diagnosed with myeloma"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with primary malignant neoplasm of the lung (lung cancer).","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with primary malignant neoplasm of the lung (lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with primary malignant neoplasm of the lung (lung cancer).","meaning":"Boolean indicating whether the patient is currently diagnosed with primary malignant neoplasm of the lung (lung cancer)."} // "be diagnosed with lung cancer"
(declare-const patient_is_undergoing_administration_of_antineoplastic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of antineoplastic agent (chemotherapy).","when_to_set_to_false":"Set to false if the patient is currently not undergoing administration of antineoplastic agent (chemotherapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing administration of antineoplastic agent (chemotherapy).","meaning":"Boolean indicating whether the patient is currently undergoing administration of antineoplastic agent (chemotherapy)."} // "be undergoing chemotherapy"
(declare-const patient_is_undergoing_hormone_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hormone therapy (hormonal treatment).","when_to_set_to_false":"Set to false if the patient is currently not undergoing hormone therapy (hormonal treatment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing hormone therapy (hormonal treatment).","meaning":"Boolean indicating whether the patient is currently undergoing hormone therapy (hormonal treatment)."} // "be undergoing hormonal treatment"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must be diagnosed with one of the specified cancers
(assert
  (! (or patient_has_diagnosis_of_malignant_tumor_of_breast_now
         patient_has_diagnosis_of_malignant_neoplasm_of_gastrointestinal_tract_now
         patient_has_diagnosis_of_malignant_lymphoma_now
         patient_has_diagnosis_of_multiple_myeloma_now
         patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((be diagnosed with breast cancer) OR (be diagnosed with gastrointestinal cancer) OR (be diagnosed with lymphoma) OR (be diagnosed with myeloma) OR (be diagnosed with lung cancer))"

;; Component 1: Must be undergoing chemotherapy or hormonal treatment
(assert
  (! (or patient_is_undergoing_administration_of_antineoplastic_agent_now
         patient_is_undergoing_hormone_therapy_now)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((be undergoing chemotherapy) OR (be undergoing hormonal treatment))"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_fatigue_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the patient's measured fatigue score (unit: score) if available at baseline using the Brief Fatigue Inventory.","when_to_set_to_null":"Set to null if no such measurement is available or if the value cannot be determined.","meaning":"Numeric value representing the patient's fatigue score (unit: score)."} // "Brief Fatigue Inventory fatigue worst score"
(declare-const patient_fatigue_value_recorded_now_withunit_score@@worst_score Bool) ;; {"when_to_set_to_true":"Set to true if the value represents the worst fatigue score as measured by the Brief Fatigue Inventory.","when_to_set_to_false":"Set to false if the value does not represent the worst fatigue score.","when_to_set_to_null":"Set to null if it is unknown whether the value represents the worst fatigue score.","meaning":"Indicates whether the numeric value is the worst fatigue score as measured by the Brief Fatigue Inventory."} // "fatigue worst score"
(declare-const patient_fatigue_value_recorded_now_withunit_score@@measured_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the value was measured at baseline.","when_to_set_to_false":"Set to false if the value was not measured at baseline.","when_to_set_to_null":"Set to null if it is unknown whether the value was measured at baseline.","meaning":"Indicates whether the numeric value was measured at baseline."} // "at baseline"
(declare-const patient_fatigue_value_recorded_now_withunit_score@@measured_using_brief_fatigue_inventory Bool) ;; {"when_to_set_to_true":"Set to true if the value was measured using the Brief Fatigue Inventory.","when_to_set_to_false":"Set to false if the value was not measured using the Brief Fatigue Inventory.","when_to_set_to_null":"Set to null if it is unknown whether the value was measured using the Brief Fatigue Inventory.","meaning":"Indicates whether the numeric value was measured using the Brief Fatigue Inventory."} // "Brief Fatigue Inventory"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and
        (>= patient_fatigue_value_recorded_now_withunit_score 4)
        patient_fatigue_value_recorded_now_withunit_score@@worst_score
        patient_fatigue_value_recorded_now_withunit_score@@measured_at_baseline
        patient_fatigue_value_recorded_now_withunit_score@@measured_using_brief_fatigue_inventory)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Brief Fatigue Inventory fatigue worst score ≥ 4 at baseline."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const eastern_cooperative_oncology_group_performance_status_value_recorded_baseline_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's ECOG performance status as recorded at baseline.","when_to_set_to_null":"Set to null if the ECOG performance status value at baseline is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's ECOG performance status at baseline, as an integer."} // "Eastern Cooperative Oncology Group performance status ≤ 2 at baseline"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (<= eastern_cooperative_oncology_group_performance_status_value_recorded_baseline_withunit_integer 2)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have an Eastern Cooperative Oncology Group performance status ≤ 2 at baseline."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const life_expectancy_value_recorded_from_start_of_study_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's life expectancy in months, as estimated from the start of the study.","when_to_set_to_null":"Set to null if the patient's life expectancy in months from the start of the study is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's life expectancy in months from the start of the study."} // "life expectancy ≥ 6 months from the start of the study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= life_expectancy_value_recorded_from_start_of_study_in_months 6)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a life expectancy ≥ 6 months from the start of the study."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently female.","when_to_set_to_false":"Set to false if the patient is currently not female.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently female.","meaning":"Boolean value indicating whether the patient is currently female."} // "female of child-bearing potential"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently male.","when_to_set_to_false":"Set to false if the patient is currently not male.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently male.","meaning":"Boolean value indicating whether the patient is currently male."} // "male"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has child-bearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have child-bearing potential.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has child-bearing potential.","meaning":"Boolean value indicating whether the patient currently has child-bearing potential."} // "child-bearing potential"
(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."} // "sexually active"
(declare-const patient_has_partner_with_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sexual partner with child-bearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have a sexual partner with child-bearing potential.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sexual partner with child-bearing potential.","meaning":"Boolean indicating whether the patient currently has a sexual partner with child-bearing potential."} // "partner of child-bearing potential"
(declare-const patient_is_practicing_abstinence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing abstinence as a method of birth control.","when_to_set_to_false":"Set to false if the patient is currently not practicing abstinence as a method of birth control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently practicing abstinence as a method of birth control.","meaning":"Boolean indicating whether the patient is currently practicing abstinence as a method of birth control."} // "abstinence"
(declare-const patient_has_finding_of_oral_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using oral contraception (birth control pills).","when_to_set_to_false":"Set to false if the patient is currently not using oral contraception (birth control pills).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using oral contraception (birth control pills).","meaning":"Boolean indicating whether the patient is currently using oral contraception (birth control pills)."} // "birth control pills"
(declare-const patient_is_using_diaphragm_with_spermicide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a diaphragm with spermicide as a method of birth control.","when_to_set_to_false":"Set to false if the patient is currently not using a diaphragm with spermicide as a method of birth control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a diaphragm with spermicide as a method of birth control.","meaning":"Boolean indicating whether the patient is currently using a diaphragm with spermicide as a method of birth control."} // "diaphragm with spermicide"
(declare-const patient_is_using_condom_with_foam_or_spermicide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a condom with foam or spermicide as a method of birth control.","when_to_set_to_false":"Set to false if the patient is currently not using a condom with foam or spermicide as a method of birth control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a condom with foam or spermicide as a method of birth control.","meaning":"Boolean indicating whether the patient is currently using a condom with foam or spermicide as a method of birth control."} // "condom with foam or spermicide"
(declare-const patient_is_using_vaginal_spermicidal_suppository_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a vaginal spermicidal suppository as a method of birth control.","when_to_set_to_false":"Set to false if the patient is currently not using a vaginal spermicidal suppository as a method of birth control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a vaginal spermicidal suppository as a method of birth control.","meaning":"Boolean indicating whether the patient is currently using a vaginal spermicidal suppository as a method of birth control."} // "vaginal spermicidal suppository"
(declare-const patient_has_undergone_sterilization_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical sterilization procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical sterilization procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical sterilization procedure.","meaning":"Boolean indicating whether the patient has ever undergone a surgical sterilization procedure at any time in the past."} // "surgical sterilization"
(declare-const patient_is_using_medically_acceptable_birth_control_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a medically acceptable method of birth control.","when_to_set_to_false":"Set to false if the patient is currently not using a medically acceptable method of birth control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a medically acceptable method of birth control.","meaning":"Boolean indicating whether the patient is currently using a medically acceptable method of birth control."} // "medically acceptable methods of birth control"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Medically acceptable birth control methods: non-exhaustive examples
(assert
  (! (=> (or patient_is_practicing_abstinence_now
             patient_has_finding_of_oral_contraception_now
             patient_is_using_diaphragm_with_spermicide_now
             patient_is_using_condom_with_foam_or_spermicide_now
             patient_is_using_vaginal_spermicidal_suppository_now
             patient_has_undergone_sterilization_procedure_inthehistory)
         patient_is_using_medically_acceptable_birth_control_method_now)
     :named REQ5_AUXILIARY0)) ;; "including abstinence, birth control pills, diaphragm with spermicide, condom with foam or spermicide, vaginal spermicidal suppository, or surgical sterilization"

;; ===================== Constraint Assertions (REQ 5) =====================
;; If (female of child-bearing potential AND sexually active) OR (male AND sexually active with partner of child-bearing potential), must use medically acceptable birth control
(assert
  (! (or (not (and patient_sex_is_female_now
                   patient_has_childbearing_potential_now
                   patient_is_sexually_active_now))
         patient_is_using_medically_acceptable_birth_control_method_now)
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a female of child-bearing potential AND sexually active, must use medically acceptable methods of birth control"

(assert
  (! (or (not (and patient_sex_is_male_now
                   patient_is_sexually_active_now
                   patient_has_partner_with_childbearing_potential_now))
         patient_is_using_medically_acceptable_birth_control_method_now)
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a male AND sexually active with a partner of child-bearing potential, must use medically acceptable methods of birth control"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_can_speak_english Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to speak English.","when_to_set_to_false":"Set to false if the patient is not able to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to speak English.","meaning":"Boolean indicating whether the patient is able to speak English."} // "the patient must speak English"
(declare-const patient_can_understand_english Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to understand English.","when_to_set_to_false":"Set to false if the patient is not able to understand English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to understand English.","meaning":"Boolean indicating whether the patient is able to understand English."} // "the patient must understand English"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_can_speak_english
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must speak English."

(assert
  (! patient_can_understand_english
     :named REQ6_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must understand English."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_provided_written_informed_consent_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent to participate in the study before enrollment.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent to participate in the study before enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent to participate in the study before enrollment.","meaning":"Boolean indicating whether the patient has provided written informed consent to participate in the study prior to enrollment."} // "the patient must have provided written informed consent to participate in the study prior to enrollment"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_provided_written_informed_consent_prior_to_enrollment
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have provided written informed consent to participate in the study prior to enrollment"
