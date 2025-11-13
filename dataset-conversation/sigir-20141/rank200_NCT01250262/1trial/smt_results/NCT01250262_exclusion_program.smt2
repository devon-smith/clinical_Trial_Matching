;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_unable_to_walk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of being unable to walk.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of being unable to walk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to walk.","meaning":"Boolean indicating whether the patient is currently unable to walk."} ;; "unable to walk"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_unable_to_walk_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to walk."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_participated_in_resistance_exercise_training_within_past_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in resistance exercise training at any time within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not participated in resistance exercise training within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in resistance exercise training within the past 6 months.","meaning":"Boolean indicating whether the patient has participated in resistance exercise training within the past 6 months."} ;; "has participated in resistance exercise training within the past 6 months"
(declare-const resistance_exercise_training_frequency_per_week_within_past_6_months Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient participated in resistance exercise training within the past 6 months.","when_to_set_to_null":"Set to null if the frequency is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the frequency (number of times per week) of resistance exercise training within the past 6 months."} ;; "frequency > 3 times per week within the past 6 months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_has_participated_in_resistance_exercise_training_within_past_6_months
             (> resistance_exercise_training_frequency_per_week_within_past_6_months 3)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in regular resistance exercise training (frequency > 3 times per week) within the past 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have pain symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain symptoms.","meaning":"Boolean indicating whether the patient currently has pain symptoms."} ;; "pain"
(declare-const patient_has_finding_of_pain_now@@severity_prevents_strength_testing_or_walking Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain symptoms and the severity of pain prevents strength testing or prevents walking.","when_to_set_to_false":"Set to false if the patient currently has pain symptoms but the severity does not prevent strength testing or walking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of pain prevents strength testing or walking.","meaning":"Boolean indicating whether the patient's pain symptoms are severe enough to prevent strength testing or walking."} ;; "pain symptoms that are too severe such that they prevent strength testing OR prevent walking"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_pain_now@@severity_prevents_strength_testing_or_walking
     patient_has_finding_of_pain_now)
:named REQ2_AUXILIARY0)) ;; "pain symptoms that are too severe such that they prevent strength testing OR prevent walking"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_pain_now@@severity_prevents_strength_testing_or_walking)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "pain symptoms that are too severe such that they prevent strength testing OR prevent walking"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_injury_of_back_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic and/or non-traumatic injury of the back.","when_to_set_to_false":"Set to false if the patient currently does not have a traumatic and/or non-traumatic injury of the back.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a traumatic and/or non-traumatic injury of the back.","meaning":"Boolean indicating whether the patient currently has a traumatic and/or non-traumatic injury of the back."} ;; "back injury"
(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_injury_of_back_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's traumatic and/or non-traumatic injury of the back is acute.","when_to_set_to_false":"Set to false if the patient's traumatic and/or non-traumatic injury of the back is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the injury is acute.","meaning":"Boolean indicating whether the patient's traumatic and/or non-traumatic injury of the back is acute."} ;; "acute back injury"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_traumatic_and_or_non_traumatic_injury_of_back_now@@acute
      patient_has_finding_of_traumatic_and_or_non_traumatic_injury_of_back_now)
:named REQ3_AUXILIARY0)) ;; "acute back injury" qualifier implies "back injury"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_traumatic_and_or_non_traumatic_injury_of_back_now@@acute)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acute back injury."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_spinal_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of spinal stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of spinal stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has spinal stenosis.","meaning":"Boolean indicating whether the patient currently has spinal stenosis."} ;; "spinal stenosis"
(declare-const patient_has_finding_of_spinal_stenosis_now@@precludes_walking_one_block_due_to_neurogenic_claudication Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has spinal stenosis and the spinal stenosis precludes walking one block due to neurogenic claudication.","when_to_set_to_false":"Set to false if the patient currently has spinal stenosis but it does not preclude walking one block due to neurogenic claudication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's spinal stenosis precludes walking one block due to neurogenic claudication.","meaning":"Boolean indicating whether the patient's spinal stenosis precludes walking one block due to neurogenic claudication."} ;; "the spinal stenosis precludes walking one block due to neurogenic claudication"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_spinal_stenosis_now@@precludes_walking_one_block_due_to_neurogenic_claudication
       patient_has_finding_of_spinal_stenosis_now)
   :named REQ4_AUXILIARY0)) ;; "the spinal stenosis precludes walking one block due to neurogenic claudication" implies "spinal stenosis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_finding_of_spinal_stenosis_now
             patient_has_finding_of_spinal_stenosis_now@@precludes_walking_one_block_due_to_neurogenic_claudication))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has spinal stenosis AND (the spinal stenosis precludes walking one block due to neurogenic claudication)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_procedure_on_back_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure on the back within the past 2 years.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure on the back within the past 2 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure on the back within the past 2 years.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure on the back within the past 2 years."} ;; "back surgery within the past 2 years"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_procedure_on_back_inthepast2years)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had back surgery within the past 2 years."

;; --- verifier-bypassed (attempt 8/8) 2025-10-25T11:12:11.886719 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_undergoing_drug_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing drug therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing drug therapy.","meaning":"Boolean indicating whether the patient is currently undergoing drug therapy."} ;; "drug interventions"
(declare-const patient_is_using_weight_loss_exercise_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using weight loss exercise interventions.","when_to_set_to_false":"Set to false if the patient is currently not using weight loss exercise interventions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using weight loss exercise interventions.","meaning":"Boolean indicating whether the patient is currently using weight loss exercise interventions."} ;; "weight loss exercise interventions"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_is_undergoing_drug_therapy_now
            patient_is_using_weight_loss_exercise_intervention_now))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is currently using weight loss drug interventions) OR (the patient is currently using weight loss exercise interventions)."
