;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_behavior_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has behavioral manifestations.","when_to_set_to_false":"Set to false if the patient currently does not have behavioral manifestations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has behavioral manifestations.","meaning":"Boolean indicating whether the patient currently has behavioral manifestations."}  ;; "behavioral manifestations"
(declare-const patient_has_finding_of_behavior_finding_now@@characterized_by_standardized_neuropsychiatric_scale Bool) ;; {"when_to_set_to_true":"Set to true if the patient's behavioral manifestations are characterized using a standardized neuropsychiatric scale.","when_to_set_to_false":"Set to false if the patient's behavioral manifestations are not characterized using a standardized neuropsychiatric scale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's behavioral manifestations are characterized using a standardized neuropsychiatric scale.","meaning":"Boolean indicating whether the patient's behavioral manifestations are characterized using a standardized neuropsychiatric scale."}  ;; "characterized as having behavioral manifestations using a standardized neuropsychiatric scale"
(declare-const patient_has_finding_of_behavior_finding_now@@characterized_by_standardized_neuropsychiatric_interview Bool) ;; {"when_to_set_to_true":"Set to true if the patient's behavioral manifestations are characterized using a standardized neuropsychiatric interview.","when_to_set_to_false":"Set to false if the patient's behavioral manifestations are not characterized using a standardized neuropsychiatric interview.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's behavioral manifestations are characterized using a standardized neuropsychiatric interview.","meaning":"Boolean indicating whether the patient's behavioral manifestations are characterized using a standardized neuropsychiatric interview."}  ;; "characterized as having behavioral manifestations using a standardized neuropsychiatric interview"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for standardized neuropsychiatric scale implies stem variable
(assert
  (! (=> patient_has_finding_of_behavior_finding_now@@characterized_by_standardized_neuropsychiatric_scale
         patient_has_finding_of_behavior_finding_now)
     :named REQ0_AUXILIARY0)) ;; If characterized by standardized neuropsychiatric scale, then behavioral manifestations present

;; Qualifier variable for standardized neuropsychiatric interview implies stem variable
(assert
  (! (=> patient_has_finding_of_behavior_finding_now@@characterized_by_standardized_neuropsychiatric_interview
         patient_has_finding_of_behavior_finding_now)
     :named REQ0_AUXILIARY1)) ;; If characterized by standardized neuropsychiatric interview, then behavioral manifestations present

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must be characterized as having behavioral manifestations using a standardized neuropsychiatric scale
(assert
  (! patient_has_finding_of_behavior_finding_now@@characterized_by_standardized_neuropsychiatric_scale
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be characterized as having behavioral manifestations using a standardized neuropsychiatric scale."

;; Component 1: Must be characterized as having behavioral manifestations using a standardized neuropsychiatric interview
(assert
  (! patient_has_finding_of_behavior_finding_now@@characterized_by_standardized_neuropsychiatric_interview
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be characterized as having behavioral manifestations using a standardized neuropsychiatric interview."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_frontal_lobe_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of frontal cognitive dysfunctions (frontal lobe syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of frontal cognitive dysfunctions (frontal lobe syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has frontal cognitive dysfunctions (frontal lobe syndrome).","meaning":"Boolean indicating whether the patient currently has frontal cognitive dysfunctions (frontal lobe syndrome)."} ;; "frontal cognitive dysfunctions"
(declare-const patient_has_finding_of_frontal_lobe_syndrome_now@@characterized_using_short_neurobehavioral_test_battery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's frontal cognitive dysfunctions (frontal lobe syndrome) are characterized using a short neurobehavioral test battery.","when_to_set_to_false":"Set to false if the patient's frontal cognitive dysfunctions (frontal lobe syndrome) are not characterized using a short neurobehavioral test battery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's frontal cognitive dysfunctions (frontal lobe syndrome) are characterized using a short neurobehavioral test battery.","meaning":"Boolean indicating whether the patient's frontal cognitive dysfunctions (frontal lobe syndrome) are characterized using a short neurobehavioral test battery."} ;; "characterized using a short neurobehavioral test battery"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_frontal_lobe_syndrome_now@@characterized_using_short_neurobehavioral_test_battery
         patient_has_finding_of_frontal_lobe_syndrome_now)
     :named REQ1_AUXILIARY0)) ;; "characterized using a short neurobehavioral test battery" implies "frontal cognitive dysfunctions"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have frontal cognitive dysfunctions characterized using a short neurobehavioral test battery.
(assert
  (! patient_has_finding_of_frontal_lobe_syndrome_now@@characterized_using_short_neurobehavioral_test_battery
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have frontal cognitive dysfunctions characterized using a short neurobehavioral test battery."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_able_to_be_tested_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo the testing procedures required in this protocol.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo the testing procedures required in this protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to undergo the testing procedures required in this protocol.","meaning":"Boolean indicating whether the patient is currently able to undergo testing procedures required in this protocol."} ;; "the patient must be able to be tested"
(declare-const patient_is_cooperative_with_required_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently cooperative with the procedures required in this protocol.","when_to_set_to_false":"Set to false if the patient is currently not cooperative with the procedures required in this protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently cooperative with the procedures required in this protocol.","meaning":"Boolean indicating whether the patient is currently cooperative with the procedures required in this protocol."} ;; "the patient must be cooperative with the procedures required in this protocol"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_able_to_be_tested_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be able to be tested"
(assert
  (! patient_is_cooperative_with_required_procedures_now
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must be cooperative with the procedures required in this protocol"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_contraindication_to_sertraline_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to the use of sertraline.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to the use of sertraline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to the use of sertraline.","meaning":"Boolean indicating whether the patient currently has any contraindication to the use of sertraline."} ;; "the patient must NOT have contraindications to the use of Sertraline"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_contraindication_to_sertraline_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT have contraindications to the use of Sertraline"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@can_reasonably_be_expected_to_subject_patient_to_unwarranted_risk Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding that can reasonably be expected to subject the patient to unwarranted risk.","when_to_set_to_false":"Set to false if the patient currently has a disease, condition, or clinical finding but it cannot reasonably be expected to subject the patient to unwarranted risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's condition can reasonably be expected to subject the patient to unwarranted risk.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding can reasonably be expected to subject the patient to unwarranted risk."} ;; "medical condition that can reasonably be expected to subject the patient to unwarranted risk"
(declare-const patient_has_finding_of_disease_condition_finding_now@@requires_frequent_changes_in_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding that requires frequent changes in medication.","when_to_set_to_false":"Set to false if the patient currently has a disease, condition, or clinical finding but it does not require frequent changes in medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's condition requires frequent changes in medication.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding requires frequent changes in medication."} ;; "medical condition that requires frequent changes in medication"
(declare-const patient_has_finding_of_disease_condition_finding_now@@is_well_controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding that is well-controlled.","when_to_set_to_false":"Set to false if the patient currently has a disease, condition, or clinical finding but it is not well-controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's condition is well-controlled.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding is well-controlled."} ;; "well-controlled medical condition"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply the patient has a disease/condition finding
(assert
  (! (=> patient_has_finding_of_disease_condition_finding_now@@can_reasonably_be_expected_to_subject_patient_to_unwarranted_risk
         patient_has_finding_of_disease_condition_finding_now)
     :named REQ4_AUXILIARY0)) ;; "any medical condition that can reasonably be expected to subject the patient to unwarranted risk"

(assert
  (! (=> patient_has_finding_of_disease_condition_finding_now@@requires_frequent_changes_in_medication
         patient_has_finding_of_disease_condition_finding_now)
     :named REQ4_AUXILIARY1)) ;; "any medical condition that requires frequent changes in medication"

(assert
  (! (=> patient_has_finding_of_disease_condition_finding_now@@is_well_controlled
         patient_has_finding_of_disease_condition_finding_now)
     :named REQ4_AUXILIARY2)) ;; "well-controlled medical conditions such as hypertension and diabetes will not be excluded"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclude if patient has any condition that can reasonably be expected to subject to unwarranted risk, unless it is well-controlled
(assert
  (! (not (and patient_has_finding_of_disease_condition_finding_now@@can_reasonably_be_expected_to_subject_patient_to_unwarranted_risk
               (not patient_has_finding_of_disease_condition_finding_now@@is_well_controlled)))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "NOT have any medical condition that can reasonably be expected to subject the patient to unwarranted risk (e.g., cancer); well-controlled medical conditions such as hypertension and diabetes will not be excluded"

;; Exclude if patient has any condition that requires frequent changes in medication, unless it is well-controlled
(assert
  (! (not (and patient_has_finding_of_disease_condition_finding_now@@requires_frequent_changes_in_medication
               (not patient_has_finding_of_disease_condition_finding_now@@is_well_controlled)))
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT have any medical condition that requires frequent changes in medication; well-controlled medical conditions such as hypertension and diabetes will not be excluded"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."}  ;; "if the patient is still at child-bearing age"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."}  ;; "NOT be nursing"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."}  ;; "NOT be pregnant"
(declare-const patient_is_using_effective_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using effective contraception.","when_to_set_to_false":"Set to false if the patient is currently not using effective contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using effective contraception.","meaning":"Boolean value indicating whether the patient is currently using effective contraception."}  ;; "be using effective contraception"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must (NOT be pregnant) AND (NOT be nursing) AND (if the patient is still at child-bearing age, be using effective contraception).
(assert
  (! (and (not patient_is_pregnant_now) ;; "NOT be pregnant"
          (not patient_is_breastfeeding_now) ;; "NOT be nursing"
          (or (not patient_has_childbearing_potential_now) ;; "if the patient is still at child-bearing age"
              patient_is_using_effective_contraception_now)) ;; "be using effective contraception"
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_traumatic_brain_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with traumatic brain injury at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with traumatic brain injury at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with traumatic brain injury.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of traumatic brain injury in their history."} ;; "traumatic brain injury"
(declare-const patient_has_diagnosis_of_traumatic_brain_injury_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical diagnosis of traumatic brain injury was severe.","when_to_set_to_false":"Set to false if the patient's historical diagnosis of traumatic brain injury was not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the traumatic brain injury was severe.","meaning":"Boolean indicating whether the patient's historical traumatic brain injury was severe."} ;; "severe traumatic brain injury"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the nervous system at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the nervous system at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the nervous system.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a disorder of the nervous system in their history."} ;; "neurologic condition"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical diagnosis of a disorder of the nervous system was severe.","when_to_set_to_false":"Set to false if the patient's historical diagnosis of a disorder of the nervous system was not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the nervous system was severe.","meaning":"Boolean indicating whether the patient's historical disorder of the nervous system was severe."} ;; "severe neurologic condition"
(declare-const patient_has_diagnosis_of_psychotic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with psychotic disorder at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with psychotic disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with psychotic disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of psychotic disorder in their history."} ;; "psychosis"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cerebrovascular accident in their history."} ;; "stroke"
(declare-const patient_has_diagnosis_of_multiple_sclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with multiple sclerosis at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with multiple sclerosis at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with multiple sclerosis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of multiple sclerosis in their history."} ;; "multiple sclerosis"
(declare-const patient_has_diagnosis_of_spinal_cord_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with spinal cord injury at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with spinal cord injury at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with spinal cord injury.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of spinal cord injury in their history."} ;; "spinal cord injury"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_traumatic_brain_injury_inthehistory@@severe
         patient_has_diagnosis_of_traumatic_brain_injury_inthehistory)
     :named REQ6_AUXILIARY0)) ;; "severe traumatic brain injury implies traumatic brain injury"

(assert
  (! (=> patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@severe
         patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory)
     :named REQ6_AUXILIARY1)) ;; "severe neurologic condition implies neurologic condition"

;; Non-exhaustive examples imply the severe neurologic condition umbrella
(assert
  (! (=> (or patient_has_diagnosis_of_psychotic_disorder_inthehistory
             patient_has_diagnosis_of_cerebrovascular_accident_inthehistory
             patient_has_diagnosis_of_multiple_sclerosis_inthehistory
             patient_has_diagnosis_of_spinal_cord_injury_inthehistory)
         patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@severe)
     :named REQ6_AUXILIARY2)) ;; "psychosis, stroke, multiple sclerosis, spinal cord injury are examples of severe neurologic condition"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must NOT have a history of prior severe traumatic brain injury AND NOT have a history of other severe neurologic condition (with non-exhaustive examples (psychosis, stroke, multiple sclerosis, spinal cord injury)).
(assert
  (! (and (not patient_has_diagnosis_of_traumatic_brain_injury_inthehistory@@severe)
          (not patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@severe))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "NOT have a history of prior severe traumatic brain injury AND NOT have a history of other severe neurologic condition (with non-exhaustive examples (psychosis, stroke, multiple sclerosis, spinal cord injury))"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_taking_psychotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any psychotropic agent.","when_to_set_to_false":"Set to false if the patient is currently not taking any psychotropic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any psychotropic agent.","meaning":"Boolean indicating whether the patient is currently taking any psychotropic agent."} ;; "psychotropic medication"
(declare-const patient_is_taking_psychotropic_agent_now@@cannot_be_stopped_greater_equal_4_weeks_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a psychotropic agent and that agent cannot be stopped at least 4 weeks before the study.","when_to_set_to_false":"Set to false if the patient is currently taking a psychotropic agent and that agent can be stopped at least 4 weeks before the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychotropic agent can be stopped at least 4 weeks before the study.","meaning":"Boolean indicating whether the patient is currently taking a psychotropic agent that cannot be stopped at least 4 weeks before the study."} ;; "psychotropic medication which cannot be stopped ≥ 4 weeks before the study"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_taking_psychotropic_agent_now@@cannot_be_stopped_greater_equal_4_weeks_before_study
         patient_is_taking_psychotropic_agent_now)
     :named REQ7_AUXILIARY0)) ;; "psychotropic medication which cannot be stopped ≥ 4 weeks before the study" implies "psychotropic medication"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must NOT be using any psychotropic medication which cannot be stopped ≥ 4 weeks before the study.
(assert
  (! (not patient_is_taking_psychotropic_agent_now@@cannot_be_stopped_greater_equal_4_weeks_before_study)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT be using any psychotropic medication which cannot be stopped ≥ 4 weeks before the study."
