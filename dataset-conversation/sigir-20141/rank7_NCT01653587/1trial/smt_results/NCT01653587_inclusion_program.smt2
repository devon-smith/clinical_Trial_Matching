;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "To be included, the patient must have non-ST-segment elevation acute coronary syndrome"
(declare-const patient_has_finding_of_acute_coronary_syndrome_now@@non_st_segment_elevation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute coronary syndrome is of the non-ST-segment elevation type.","when_to_set_to_false":"Set to false if the patient's acute coronary syndrome is not of the non-ST-segment elevation type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute coronary syndrome is of the non-ST-segment elevation type.","meaning":"Boolean indicating whether the patient's acute coronary syndrome is of the non-ST-segment elevation type."} ;; "non-ST-segment elevation acute coronary syndrome"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "clinical presentation compatible with a new manifestation of worsening chest pain characteristic of myocardial ischemia at rest OR at minimum effort lasting > 10 minutes"
(declare-const patient_has_finding_of_chest_pain_now@@new_manifestation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain is a new manifestation.","when_to_set_to_false":"Set to false if the patient's current chest pain is not a new manifestation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain is a new manifestation.","meaning":"Boolean indicating whether the patient's current chest pain is a new manifestation."} ;; "new manifestation of worsening chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@worsening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain is worsening.","when_to_set_to_false":"Set to false if the patient's current chest pain is not worsening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain is worsening.","meaning":"Boolean indicating whether the patient's current chest pain is worsening."} ;; "worsening chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@characteristic_of_myocardial_ischemia_at_rest_or_minimum_effort Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain is characteristic of myocardial ischemia at rest or at minimum effort.","when_to_set_to_false":"Set to false if the patient's current chest pain is not characteristic of myocardial ischemia at rest or at minimum effort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain is characteristic of myocardial ischemia at rest or at minimum effort.","meaning":"Boolean indicating whether the patient's current chest pain is characteristic of myocardial ischemia at rest or at minimum effort."} ;; "chest pain characteristic of myocardial ischemia at rest or at minimum effort"
(declare-const patient_has_finding_of_chest_pain_now@@duration_greater_than_10_minutes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain lasts more than 10 minutes.","when_to_set_to_false":"Set to false if the patient's current chest pain does not last more than 10 minutes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain lasts more than 10 minutes.","meaning":"Boolean indicating whether the patient's current chest pain lasts more than 10 minutes."} ;; "chest pain ... lasting > 10 minutes"
(declare-const patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of non-ST-segment elevation acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of non-ST-segment elevation acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has non-ST-segment elevation acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has non-ST-segment elevation acute myocardial infarction."} ;; "non-ST-segment elevation acute myocardial infarction"
;; Unstable angina is not explicitly declared, so we introduce it:
(declare-const patient_has_finding_of_unstable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina.","meaning":"Boolean indicating whether the patient currently has unstable angina."} ;; "unstable angina (example of ischemic symptoms suspicious of non-ST-segment elevation acute coronary syndrome)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply their stem variable
(assert
  (! (=> patient_has_finding_of_acute_coronary_syndrome_now@@non_st_segment_elevation
         patient_has_finding_of_acute_coronary_syndrome_now)
     :named REQ0_AUXILIARY0)) ;; "non-ST-segment elevation acute coronary syndrome"

(assert
  (! (=> patient_has_finding_of_chest_pain_now@@new_manifestation
         patient_has_finding_of_chest_pain_now)
     :named REQ0_AUXILIARY1)) ;; "new manifestation of chest pain"

(assert
  (! (=> patient_has_finding_of_chest_pain_now@@worsening
         patient_has_finding_of_chest_pain_now)
     :named REQ0_AUXILIARY2)) ;; "worsening chest pain"

(assert
  (! (=> patient_has_finding_of_chest_pain_now@@characteristic_of_myocardial_ischemia_at_rest_or_minimum_effort
         patient_has_finding_of_chest_pain_now)
     :named REQ0_AUXILIARY3)) ;; "chest pain characteristic of myocardial ischemia at rest or at minimum effort"

(assert
  (! (=> patient_has_finding_of_chest_pain_now@@duration_greater_than_10_minutes
         patient_has_finding_of_chest_pain_now)
     :named REQ0_AUXILIARY4)) ;; "chest pain lasting > 10 minutes"

;; Non-exhaustive examples: unstable angina and non-ST-segment elevation acute myocardial infarction are examples of ischemic symptoms suspicious of non-ST-segment elevation acute coronary syndrome
(assert
  (! (=> (or patient_has_finding_of_unstable_angina_now
            patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now)
         patient_has_finding_of_acute_coronary_syndrome_now@@non_st_segment_elevation)
     :named REQ0_AUXILIARY5)) ;; "ischemic symptoms suspicious of non-ST-segment elevation acute coronary syndrome (with non-exhaustive examples (unstable angina, non-ST-segment elevation acute myocardial infarction))"

;; Definition of non-ST-segment elevation acute coronary syndrome per requirement:
(assert
  (! (= patient_has_finding_of_acute_coronary_syndrome_now@@non_st_segment_elevation
        (and
          ;; Ischemic symptoms suspicious of non-ST-segment elevation acute coronary syndrome
          (or patient_has_finding_of_unstable_angina_now
              patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now)
          ;; Clinical presentation compatible with a new manifestation of worsening chest pain characteristic of myocardial ischemia at rest or at minimum effort lasting > 10 minutes
          (and patient_has_finding_of_chest_pain_now@@new_manifestation
               patient_has_finding_of_chest_pain_now@@worsening
               patient_has_finding_of_chest_pain_now@@characteristic_of_myocardial_ischemia_at_rest_or_minimum_effort
               patient_has_finding_of_chest_pain_now@@duration_greater_than_10_minutes)))
     :named REQ0_AUXILIARY6)) ;; "non-ST-segment elevation acute coronary syndrome (defined as (ischemic symptoms suspicious of non-ST-segment elevation acute coronary syndrome ... AND clinical presentation compatible with a new manifestation of worsening chest pain characteristic of myocardial ischemia at rest OR at minimum effort lasting > 10 minutes))"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_acute_coronary_syndrome_now@@non_st_segment_elevation
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have non-ST-segment elevation acute coronary syndrome (defined as ... )"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_intention_for_early_invasive_strategy_within_72_hours_after_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the intention to be submitted to early invasive strategy within the first 72 hours after admission.","when_to_set_to_false":"Set to false if the patient does not have the intention to be submitted to early invasive strategy within the first 72 hours after admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the intention to be submitted to early invasive strategy within the first 72 hours after admission.","meaning":"Boolean indicating whether the patient has the intention to be submitted to early invasive strategy within the first 72 hours after admission."} ;; "To be included, the patient must have the intention to be submitted to early invasive strategy ... in the first 72 hours after admission."
(declare-const patient_has_intention_for_early_invasive_strategy_within_72_hours_after_admission@@consists_of_coronary_angiography_immediately_followed_by_percutaneous_coronary_intervention_when_applicable Bool) ;; {"when_to_set_to_true":"Set to true if the early invasive strategy consists of coronary angiography immediately followed by percutaneous coronary intervention, when applicable.","when_to_set_to_false":"Set to false if the early invasive strategy does not consist of coronary angiography immediately followed by percutaneous coronary intervention, when applicable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the early invasive strategy consists of coronary angiography immediately followed by percutaneous coronary intervention, when applicable.","meaning":"Boolean indicating whether the early invasive strategy consists of coronary angiography immediately followed by percutaneous coronary intervention, when applicable."} ;; "early invasive strategy (consisting of coronary angiography immediately followed by percutaneous coronary intervention, when applicable)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_intention_for_early_invasive_strategy_within_72_hours_after_admission@@consists_of_coronary_angiography_immediately_followed_by_percutaneous_coronary_intervention_when_applicable
        patient_has_intention_for_early_invasive_strategy_within_72_hours_after_admission)
     :named REQ1_AUXILIARY0)) ;; "early invasive strategy (consisting of coronary angiography immediately followed by percutaneous coronary intervention, when applicable)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patient_has_intention_for_early_invasive_strategy_within_72_hours_after_admission
          patient_has_intention_for_early_invasive_strategy_within_72_hours_after_admission@@consists_of_coronary_angiography_immediately_followed_by_percutaneous_coronary_intervention_when_applicable)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have the intention to be submitted to early invasive strategy (consisting of coronary angiography immediately followed by percutaneous coronary intervention, when applicable) in the first 72 hours after admission."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed informed consent.","when_to_set_to_false":"Set to false if the patient has not signed informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed informed consent.","meaning":"Boolean indicating whether the patient has signed informed consent."} ;; "To be included, the patient must have signed informed consent."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed informed consent."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_can_undergo_coronary_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently eligible and able to undergo coronary angiography.","when_to_set_to_false":"Set to false if the patient is currently not eligible or unable to undergo coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo coronary angiography.","meaning":"Boolean indicating whether the patient can currently undergo coronary angiography."} ;; "To be included, the patient must be eligible for transradial coronary angiography AND transfemoral coronary angiography"
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently eligible and able to undergo percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient is currently not eligible or unable to undergo percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient can currently undergo percutaneous coronary intervention."} ;; "To be included, the patient must be eligible for percutaneous coronary intervention."
(declare-const patient_has_palpable_radial_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a palpable radial artery.","when_to_set_to_false":"Set to false if the patient currently does not have a palpable radial artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a palpable radial artery.","meaning":"Boolean indicating whether the patient currently has a palpable radial artery."} ;; "palpable radial artery"
(declare-const patient_has_normal_allen_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a normal Allen test.","when_to_set_to_false":"Set to false if the patient currently does not have a normal Allen test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a normal Allen test.","meaning":"Boolean indicating whether the patient currently has a normal Allen test."} ;; "normal Allen test"
(declare-const patient_has_normal_oximetry_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a normal oximetry test.","when_to_set_to_false":"Set to false if the patient currently does not have a normal oximetry test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a normal oximetry test.","meaning":"Boolean indicating whether the patient currently has a normal oximetry test."} ;; "normal oximetry test"
(declare-const operator_is_familiar_with_radial_technique_now Bool) ;; {"when_to_set_to_true":"Set to true if the operator is currently familiar with the radial technique.","when_to_set_to_false":"Set to false if the operator is currently not familiar with the radial technique.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the operator is currently familiar with the radial technique.","meaning":"Boolean indicating whether the operator is currently familiar with the radial technique."} ;; "familiarity of the operator with the radial technique"
(declare-const operator_is_familiar_with_femoral_technique_using_angioseal_now Bool) ;; {"when_to_set_to_true":"Set to true if the operator is currently familiar with the femoral technique using AngioSeal.","when_to_set_to_false":"Set to false if the operator is currently not familiar with the femoral technique using AngioSeal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the operator is currently familiar with the femoral technique using AngioSeal.","meaning":"Boolean indicating whether the operator is currently familiar with the femoral technique using AngioSeal."} ;; "familiarity of the operator with the femoral technique using AngioSeal"
(declare-const operator_agrees_to_use_access_route_determined_by_randomization_now Bool) ;; {"when_to_set_to_true":"Set to true if the operator currently agrees to use the access route determined by the randomization process.","when_to_set_to_false":"Set to false if the operator currently does not agree to use the access route determined by the randomization process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the operator currently agrees to use the access route determined by the randomization process.","meaning":"Boolean indicating whether the operator currently agrees to use the access route determined by the randomization process."} ;; "agreement of the operator to use the access route determined by the randomization process"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Eligible for transradial coronary angiography
(assert
  (! patient_can_undergo_coronary_angiography_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be eligible for transradial coronary angiography."

;; Component 1: Eligible for transfemoral coronary angiography
(assert
  (! patient_can_undergo_coronary_angiography_now
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be eligible for transfemoral coronary angiography."

;; Component 2: Eligible for percutaneous coronary intervention
(assert
  (! patient_can_undergo_percutaneous_coronary_intervention_now
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be eligible for percutaneous coronary intervention."

;; Component 3: Prerequisite - (palpable radial artery with normal Allen test OR normal oximetry test)
(assert
  (! (or (and patient_has_palpable_radial_artery_now patient_has_normal_allen_test_now)
         patient_has_normal_oximetry_test_now)
     :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (palpable radial artery with normal Allen test OR normal oximetry test)."

;; Component 4: Operator familiarity with radial technique
(assert
  (! operator_is_familiar_with_radial_technique_now
     :named REQ3_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have familiarity of the operator with the radial technique."

;; Component 5: Operator familiarity with femoral technique using AngioSeal
(assert
  (! operator_is_familiar_with_femoral_technique_using_angioseal_now
     :named REQ3_COMPONENT5_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have familiarity of the operator with the femoral technique using AngioSeal."

;; Component 6: Operator agreement to use access route determined by randomization
(assert
  (! operator_agrees_to_use_access_route_determined_by_randomization_now
     :named REQ3_COMPONENT6_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have agreement of the operator to use the access route determined by the randomization process."
