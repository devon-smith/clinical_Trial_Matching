;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_neuropsychological_testing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone neuropsychological testing.","when_to_set_to_false":"Set to false if the patient has not currently undergone neuropsychological testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone neuropsychological testing.","meaning":"Boolean indicating whether the patient has currently undergone neuropsychological testing."} ;; "neuropsychological tests"
(declare-const patient_has_undergone_neuropsychological_testing_now@@failed_to_pass Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone neuropsychological testing and failed to pass the test.","when_to_set_to_false":"Set to false if the patient has currently undergone neuropsychological testing and did not fail to pass (i.e., passed) the test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient failed to pass the neuropsychological test.","meaning":"Boolean indicating whether the patient failed to pass the neuropsychological test after currently undergoing it."} ;; "fails to pass the neuropsychological tests"
(declare-const patient_has_finding_of_sensory_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sensory disability (sensory deficit).","when_to_set_to_false":"Set to false if the patient currently does not have a sensory disability (sensory deficit).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sensory disability (sensory deficit).","meaning":"Boolean indicating whether the patient currently has a sensory disability (sensory deficit)."} ;; "sensory deficit"
(declare-const patient_has_finding_of_motor_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a motor dysfunction (motor deficit).","when_to_set_to_false":"Set to false if the patient currently does not have a motor dysfunction (motor deficit).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a motor dysfunction (motor deficit).","meaning":"Boolean indicating whether the patient currently has a motor dysfunction (motor deficit)."} ;; "motor deficit"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_neuropsychological_testing_now@@failed_to_pass
      patient_has_undergone_neuropsychological_testing_now)
   :named REQ0_AUXILIARY0)) ;; "fails to pass the neuropsychological tests""

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient fails to pass neuropsychological tests AND (sensory OR motor deficit)
(assert
(! (not (and patient_has_undergone_neuropsychological_testing_now@@failed_to_pass
             (or patient_has_finding_of_sensory_disability_now
                 patient_has_finding_of_motor_dysfunction_now)))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient fails to pass the neuropsychological tests) AND ((the patient has a sensory deficit) OR (the patient has a motor deficit)))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
;; "sensory deficit"
;; Already declared in <already_used_variables_in_SMT_program>
;; (declare-const patient_has_finding_of_sensory_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sensory disability (sensory deficit).","when_to_set_to_false":"Set to false if the patient currently does not have a sensory disability (sensory deficit).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sensory disability (sensory deficit).","meaning":"Boolean indicating whether the patient currently has a sensory disability (sensory deficit)."} ;; "sensory deficit"

(declare-const patient_has_finding_of_sensory_disability_now@@prevents_patient_from_perfectly_meeting_therapeutic_solutions Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sensory deficit prevents the patient from perfectly meeting the therapeutic solutions.","when_to_set_to_false":"Set to false if the patient's current sensory deficit does not prevent the patient from perfectly meeting the therapeutic solutions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sensory deficit prevents the patient from perfectly meeting the therapeutic solutions.","meaning":"Boolean indicating whether the patient's current sensory deficit prevents the patient from perfectly meeting the therapeutic solutions."} ;; "the sensory deficit prevents the patient from perfectly meeting the therapeutic solutions"

(declare-const patient_has_finding_of_olfactory_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an olfactory deficit (disability).","when_to_set_to_false":"Set to false if the patient currently does not have an olfactory deficit (disability).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an olfactory deficit (disability).","meaning":"Boolean indicating whether the patient currently has an olfactory deficit (disability)."} ;; "an olfactory deficit"

(declare-const patient_has_finding_of_visual_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a visual deficit (disability).","when_to_set_to_false":"Set to false if the patient currently does not have a visual deficit (disability).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a visual deficit (disability).","meaning":"Boolean indicating whether the patient currently has a visual deficit (disability)."} ;; "a visual deficit"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_olfactory_disability_now
           patient_has_finding_of_visual_disability_now)
       patient_has_finding_of_sensory_disability_now)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((an olfactory deficit) OR (a visual deficit))"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_sensory_disability_now@@prevents_patient_from_perfectly_meeting_therapeutic_solutions
       patient_has_finding_of_sensory_disability_now)
   :named REQ1_AUXILIARY1)) ;; "the sensory deficit prevents the patient from perfectly meeting the therapeutic solutions"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_sensory_disability_now@@prevents_patient_from_perfectly_meeting_therapeutic_solutions)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a sensory deficit with non-exhaustive examples ((an olfactory deficit) OR (a visual deficit))) AND (the sensory deficit prevents the patient from perfectly meeting the therapeutic solutions))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_psychotropic_treatment_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any psychotropic treatment at any time in the 1 week prior to the evaluation.","when_to_set_to_false":"Set to false if the patient has not been exposed to any psychotropic treatment in the 1 week prior to the evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any psychotropic treatment in the 1 week prior to the evaluation.","meaning":"Boolean indicating whether the patient has been exposed to any psychotropic treatment in the 1 week prior to the evaluation."} ;; "psychotropic treatment in the week before the evaluation"
(declare-const patient_is_exposed_to_psychotropic_treatment_inthepast1weeks@@is_new_prescription Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to any psychotropic treatment in the past 1 week is a new prescription (not a continuation).","when_to_set_to_false":"Set to false if the exposure is not a new prescription (i.e., is a continuation).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the exposure is a new prescription.","meaning":"Boolean indicating whether the psychotropic treatment exposure in the past 1 week is a new prescription."} ;; "new psychotropic treatment in the week before the evaluation"
(declare-const patient_is_exposed_to_hypnotic_agent_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a hypnotic agent at any time in the 1 week prior to the evaluation.","when_to_set_to_false":"Set to false if the patient has not been exposed to a hypnotic agent in the 1 week prior to the evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to a hypnotic agent in the 1 week prior to the evaluation.","meaning":"Boolean indicating whether the patient has been exposed to a hypnotic agent in the 1 week prior to the evaluation."} ;; "hypnotic treatment"
(declare-const patient_is_exposed_to_hypnotic_agent_inthepast1weeks@@is_new_prescription Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to a hypnotic agent in the past 1 week is a new prescription (not a continuation).","when_to_set_to_false":"Set to false if the exposure is not a new prescription (i.e., is a continuation).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the exposure is a new prescription.","meaning":"Boolean indicating whether the hypnotic agent exposure in the past 1 week is a new prescription."} ;; "new hypnotic treatment"
(declare-const patient_is_exposed_to_anxiolytic_agent_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an anxiolytic agent at any time in the 1 week prior to the evaluation.","when_to_set_to_false":"Set to false if the patient has not been exposed to an anxiolytic agent in the 1 week prior to the evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to an anxiolytic agent in the 1 week prior to the evaluation.","meaning":"Boolean indicating whether the patient has been exposed to an anxiolytic agent in the 1 week prior to the evaluation."} ;; "anxiolytic treatment"
(declare-const patient_is_exposed_to_anxiolytic_agent_inthepast1weeks@@is_new_prescription Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to an anxiolytic agent in the past 1 week is a new prescription (not a continuation).","when_to_set_to_false":"Set to false if the exposure is not a new prescription (i.e., is a continuation).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the exposure is a new prescription.","meaning":"Boolean indicating whether the anxiolytic agent exposure in the past 1 week is a new prescription."} ;; "new anxiolytic treatment"
(declare-const patient_is_exposed_to_antidepressant_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an antidepressant at any time in the 1 week prior to the evaluation.","when_to_set_to_false":"Set to false if the patient has not been exposed to an antidepressant in the 1 week prior to the evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to an antidepressant in the 1 week prior to the evaluation.","meaning":"Boolean indicating whether the patient has been exposed to an antidepressant in the 1 week prior to the evaluation."} ;; "antidepressant treatment"
(declare-const patient_is_exposed_to_antidepressant_inthepast1weeks@@is_new_prescription Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to an antidepressant in the past 1 week is a new prescription (not a continuation).","when_to_set_to_false":"Set to false if the exposure is not a new prescription (i.e., is a continuation).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the exposure is a new prescription.","meaning":"Boolean indicating whether the antidepressant exposure in the past 1 week is a new prescription."} ;; "new antidepressant treatment"
(declare-const patient_is_exposed_to_antipsychotic_agent_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an antipsychotic agent at any time in the 1 week prior to the evaluation.","when_to_set_to_false":"Set to false if the patient has not been exposed to an antipsychotic agent in the 1 week prior to the evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to an antipsychotic agent in the 1 week prior to the evaluation.","meaning":"Boolean indicating whether the patient has been exposed to an antipsychotic agent in the 1 week prior to the evaluation."} ;; "antipsychotic treatment"
(declare-const patient_is_exposed_to_antipsychotic_agent_inthepast1weeks@@is_new_prescription Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to an antipsychotic agent in the past 1 week is a new prescription (not a continuation).","when_to_set_to_false":"Set to false if the exposure is not a new prescription (i.e., is a continuation).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the exposure is a new prescription.","meaning":"Boolean indicating whether the antipsychotic agent exposure in the past 1 week is a new prescription."} ;; "new antipsychotic treatment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples: any new prescription of listed agents implies new psychotropic treatment
(assert
(! (=> (or patient_is_exposed_to_hypnotic_agent_inthepast1weeks@@is_new_prescription
           patient_is_exposed_to_anxiolytic_agent_inthepast1weeks@@is_new_prescription
           patient_is_exposed_to_antidepressant_inthepast1weeks@@is_new_prescription
           patient_is_exposed_to_antipsychotic_agent_inthepast1weeks@@is_new_prescription)
        patient_is_exposed_to_psychotropic_treatment_inthepast1weeks@@is_new_prescription)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((a hypnotic treatment) OR (an anxiolytic treatment) OR (an antidepressant treatment) OR (an antipsychotic treatment)) in the week before the evaluation"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_psychotropic_treatment_inthepast1weeks@@is_new_prescription
       patient_is_exposed_to_psychotropic_treatment_inthepast1weeks)
   :named REQ2_AUXILIARY1)) ;; "new psychotropic treatment in the week before the evaluation"

(assert
(! (=> patient_is_exposed_to_hypnotic_agent_inthepast1weeks@@is_new_prescription
       patient_is_exposed_to_hypnotic_agent_inthepast1weeks)
   :named REQ2_AUXILIARY2)) ;; "new hypnotic treatment"

(assert
(! (=> patient_is_exposed_to_anxiolytic_agent_inthepast1weeks@@is_new_prescription
       patient_is_exposed_to_anxiolytic_agent_inthepast1weeks)
   :named REQ2_AUXILIARY3)) ;; "new anxiolytic treatment"

(assert
(! (=> patient_is_exposed_to_antidepressant_inthepast1weeks@@is_new_prescription
       patient_is_exposed_to_antidepressant_inthepast1weeks)
   :named REQ2_AUXILIARY4)) ;; "new antidepressant treatment"

(assert
(! (=> patient_is_exposed_to_antipsychotic_agent_inthepast1weeks@@is_new_prescription
       patient_is_exposed_to_antipsychotic_agent_inthepast1weeks)
   :named REQ2_AUXILIARY5)) ;; "new antipsychotic treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_exposed_to_psychotropic_treatment_inthepast1weeks@@is_new_prescription)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has been prescribed at least one new psychotropic treatment ... in the week before the evaluation)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_administrative_deprivation_of_liberty_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently subject to administrative deprivation of liberty.","when_to_set_to_false":"Set to false if the patient is currently not subject to administrative deprivation of liberty.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently subject to administrative deprivation of liberty.","meaning":"Boolean indicating whether the patient is currently subject to administrative deprivation of liberty."} ;; "administrative deprivation of liberty"
(declare-const patient_has_finding_of_imprisonment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently subject to imprisonment (judicial deprivation of liberty).","when_to_set_to_false":"Set to false if the patient is currently not subject to imprisonment (judicial deprivation of liberty).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently subject to imprisonment (judicial deprivation of liberty).","meaning":"Boolean indicating whether the patient is currently subject to imprisonment (judicial deprivation of liberty)."} ;; "judicial deprivation of liberty"

(declare-const patient_is_deprived_of_liberty_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently deprived of liberty for any reason.","when_to_set_to_false":"Set to false if the patient is currently not deprived of liberty.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently deprived of liberty.","meaning":"Boolean indicating whether the patient is currently deprived of liberty."} ;; "deprived of liberty"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_administrative_deprivation_of_liberty_now
           patient_has_finding_of_imprisonment_now)
       patient_is_deprived_of_liberty_now)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((administrative deprivation of liberty) OR (judicial deprivation of liberty))"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_deprived_of_liberty_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is deprived of liberty with non-exhaustive examples ((administrative deprivation of liberty) OR (judicial deprivation of liberty)))."
