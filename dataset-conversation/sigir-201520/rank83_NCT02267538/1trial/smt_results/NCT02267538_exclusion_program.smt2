;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_refuses_to_participate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently refuses to participate.","when_to_set_to_false":"Set to false if the patient currently does not refuse to participate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently refuses to participate.","meaning":"Boolean indicating whether the patient currently refuses to participate."} ;; "The patient refuses to participate."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_refuses_to_participate_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient refuses to participate."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_schizophrenia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of schizophrenia at any time in their history prior to the present.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of schizophrenia in their history prior to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of schizophrenia.","meaning":"Boolean indicating whether the patient has a preoperative history of schizophrenia."} ;; "the patient has a preoperative history of schizophrenia"

(declare-const patient_has_diagnosis_of_epilepsy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of epilepsy at any time in their history prior to the present.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of epilepsy in their history prior to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of epilepsy.","meaning":"Boolean indicating whether the patient has a preoperative history of epilepsy."} ;; "the patient has a preoperative history of epilepsia"

(declare-const patient_has_diagnosis_of_parkinson_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of Parkinson syndrome at any time in their history prior to the present.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of Parkinson syndrome in their history prior to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of Parkinson syndrome.","meaning":"Boolean indicating whether the patient has a preoperative history of Parkinson syndrome."} ;; "the patient has a preoperative history of Parkinson syndrome"

(declare-const patient_has_diagnosis_of_dementia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of dementia at any time in their history prior to the present.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of dementia in their history prior to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of dementia.","meaning":"Boolean indicating whether the patient has a preoperative history of dementia."} ;; "the patient has a preoperative history of dementia"

(declare-const patient_has_diagnosis_of_dementia_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dementia is classified as severe.","when_to_set_to_false":"Set to false if the patient's dementia is not classified as severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dementia is severe.","meaning":"Boolean indicating whether the patient's dementia is severe."} ;; "the patient has a preoperative history of severe dementia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_dementia_inthehistory@@severe
       patient_has_diagnosis_of_dementia_inthehistory)
   :named REQ1_AUXILIARY0)) ;; "the patient has a preoperative history of severe dementia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_schizophrenia_inthehistory)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a preoperative history of schizophrenia"

(assert
(! (not patient_has_diagnosis_of_epilepsy_inthehistory)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a preoperative history of epilepsia"

(assert
(! (not patient_has_diagnosis_of_parkinson_syndrome_inthehistory)
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has a preoperative history of Parkinson syndrome"

(assert
(! (not patient_has_diagnosis_of_dementia_inthehistory@@severe)
   :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has a preoperative history of severe dementia"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_visual_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has visual dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have visual dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has visual dysfunction.","meaning":"Boolean indicating whether the patient currently has visual dysfunction."} ;; "visual dysfunction"
(declare-const patient_has_finding_of_visual_dysfunction_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current visual dysfunction is severe.","when_to_set_to_false":"Set to false if the patient's current visual dysfunction is not severe.","when_to_set_to_null":"Set to null if severity of the patient's current visual dysfunction is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's current visual dysfunction is severe."} ;; "severe visual dysfunction"
(declare-const patient_has_finding_of_visual_dysfunction_now@@cause_of_inability_to_communicate_in_preoperative_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current severe visual dysfunction is the cause of inability to communicate in the preoperative period.","when_to_set_to_false":"Set to false if the patient's current severe visual dysfunction is not the cause of inability to communicate in the preoperative period.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient's current severe visual dysfunction is the cause of inability to communicate in the preoperative period.","meaning":"Boolean indicating whether the patient's current severe visual dysfunction is the cause of inability to communicate in the preoperative period."} ;; "inability to communicate in the preoperative period because of severe visual dysfunction"

(declare-const patient_has_finding_of_auditory_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of auditory dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of auditory dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of auditory dysfunction.","meaning":"Boolean indicating whether the patient currently has auditory dysfunction."} ;; "auditory dysfunction"
(declare-const patient_has_finding_of_auditory_dysfunction_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current auditory dysfunction is severe.","when_to_set_to_false":"Set to false if the patient's current auditory dysfunction is not severe.","when_to_set_to_null":"Set to null if severity of the patient's current auditory dysfunction is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's current auditory dysfunction is severe."} ;; "severe auditory dysfunction"
(declare-const patient_has_finding_of_auditory_dysfunction_now@@cause_of_inability_to_communicate_in_preoperative_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current severe auditory dysfunction is the cause of inability to communicate in the preoperative period.","when_to_set_to_false":"Set to false if the patient's current severe auditory dysfunction is not the cause of inability to communicate in the preoperative period.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient's current severe auditory dysfunction is the cause of inability to communicate in the preoperative period.","meaning":"Boolean indicating whether the patient's current severe auditory dysfunction is the cause of inability to communicate in the preoperative period."} ;; "inability to communicate in the preoperative period because of severe auditory dysfunction"

(declare-const patients_language_barrier_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a language barrier.","when_to_set_to_false":"Set to false if the patient currently does not have a language barrier.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a language barrier.","meaning":"Boolean indicating whether the patient currently has a language barrier."} ;; "language barrier"
(declare-const patients_language_barrier_is_positive_now@@cause_of_inability_to_communicate_in_preoperative_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current language barrier is the cause of inability to communicate in the preoperative period.","when_to_set_to_false":"Set to false if the patient's current language barrier is not the cause of inability to communicate in the preoperative period.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient's current language barrier is the cause of inability to communicate in the preoperative period.","meaning":"Boolean indicating whether the patient's current language barrier is the cause of inability to communicate in the preoperative period."} ;; "inability to communicate in the preoperative period because of language barrier"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_visual_dysfunction_now@@severity_severe
      patient_has_finding_of_visual_dysfunction_now)
:named REQ2_AUXILIARY0)) ;; "severe visual dysfunction"

(assert
(! (=> patient_has_finding_of_auditory_dysfunction_now@@severity_severe
      patient_has_finding_of_auditory_dysfunction_now)
:named REQ2_AUXILIARY1)) ;; "severe auditory dysfunction"

;; Cause-of-inability-to-communicate qualifiers imply severity
(assert
(! (=> patient_has_finding_of_visual_dysfunction_now@@cause_of_inability_to_communicate_in_preoperative_period
      patient_has_finding_of_visual_dysfunction_now@@severity_severe)
:named REQ2_AUXILIARY2)) ;; "inability to communicate in the preoperative period because of severe visual dysfunction"

(assert
(! (=> patient_has_finding_of_auditory_dysfunction_now@@cause_of_inability_to_communicate_in_preoperative_period
      patient_has_finding_of_auditory_dysfunction_now@@severity_severe)
:named REQ2_AUXILIARY3)) ;; "inability to communicate in the preoperative period because of severe auditory dysfunction"

(assert
(! (=> patients_language_barrier_is_positive_now@@cause_of_inability_to_communicate_in_preoperative_period
      patients_language_barrier_is_positive_now)
:named REQ2_AUXILIARY4)) ;; "inability to communicate in the preoperative period because of language barrier"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_visual_dysfunction_now@@cause_of_inability_to_communicate_in_preoperative_period)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to communicate in the preoperative period because of severe visual dysfunction."

(assert
(! (not patient_has_finding_of_auditory_dysfunction_now@@cause_of_inability_to_communicate_in_preoperative_period)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to communicate in the preoperative period because of severe auditory dysfunction."

(assert
(! (not patients_language_barrier_is_positive_now@@cause_of_inability_to_communicate_in_preoperative_period)
:named REQ2_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has inability to communicate in the preoperative period because of language barrier."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with traumatic and/or non-traumatic brain injury at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with traumatic and/or non-traumatic brain injury at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with traumatic and/or non-traumatic brain injury.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of traumatic and/or non-traumatic brain injury in their history."} ;; "the patient has a history of brain injury"
(declare-const patient_has_undergone_operation_on_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any operation on the nervous system (neurosurgery) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone any operation on the nervous system (neurosurgery) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone any operation on the nervous system (neurosurgery).","meaning":"Boolean indicating whether the patient has ever undergone an operation on the nervous system (neurosurgery) in their history."} ;; "the patient has a history of neurosurgery"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_diagnosis_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory
            patient_has_undergone_operation_on_nervous_system_inthehistory))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of brain injury) OR (the patient has a history of neurosurgery)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_sick_sinus_syndrome_preoperative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has sick sinus syndrome prior to the operation (preoperative period).","when_to_set_to_false":"Set to false if the patient does not have sick sinus syndrome prior to the operation (preoperative period).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has sick sinus syndrome prior to the operation.","meaning":"Boolean indicating whether the patient has preoperative sick sinus syndrome."} ;; "the patient has preoperative sick sinus syndrome"

(declare-const patient_has_finding_of_bradycardia_preoperative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has bradycardia prior to the operation (preoperative period).","when_to_set_to_false":"Set to false if the patient does not have bradycardia prior to the operation (preoperative period).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has bradycardia prior to the operation.","meaning":"Boolean indicating whether the patient has preoperative bradycardia."} ;; "the patient has preoperative bradycardia"

(declare-const patient_heart_rate_value_recorded_preoperative_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's heart rate in beats per minute recorded during the preoperative period.","when_to_set_to_null":"Set to null if the patient's heart rate in beats per minute during the preoperative period is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's heart rate in beats per minute recorded preoperatively."} ;; "heart rate < 50 beats per minute (preoperative)"

(declare-const patient_has_finding_of_atrioventricular_block_preoperative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has atrioventricular block prior to the operation (preoperative period).","when_to_set_to_false":"Set to false if the patient does not have atrioventricular block prior to the operation (preoperative period).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has atrioventricular block prior to the operation.","meaning":"Boolean indicating whether the patient has preoperative atrioventricular block."} ;; "the patient has preoperative atrioventricular block"

(declare-const patient_has_finding_of_atrioventricular_block_preoperative@@second_degree_or_above Bool) ;; {"when_to_set_to_true":"Set to true if the patient's preoperative atrioventricular block is second-degree or above.","when_to_set_to_false":"Set to false if the patient's preoperative atrioventricular block is not second-degree or above.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's preoperative atrioventricular block is second-degree or above.","meaning":"Boolean indicating whether the patient's preoperative atrioventricular block is second-degree or above."} ;; "preoperative second-degree or above atrioventricular block"

(declare-const patient_has_finding_of_atrioventricular_block_preoperative@@without_pacemaker Bool) ;; {"when_to_set_to_true":"Set to true if the patient with preoperative second-degree or above atrioventricular block does not have a pacemaker.","when_to_set_to_false":"Set to false if the patient with preoperative second-degree or above atrioventricular block has a pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient with preoperative second-degree or above atrioventricular block has a pacemaker.","meaning":"Boolean indicating whether the patient with preoperative second-degree or above atrioventricular block does not have a pacemaker."} ;; "preoperative second-degree or above atrioventricular block without pacemaker"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_atrioventricular_block_preoperative@@second_degree_or_above
      patient_has_finding_of_atrioventricular_block_preoperative)
:named REQ4_AUXILIARY0)) ;; "preoperative second-degree or above atrioventricular block"

(assert
(! (=> patient_has_finding_of_atrioventricular_block_preoperative@@without_pacemaker
      patient_has_finding_of_atrioventricular_block_preoperative@@second_degree_or_above)
:named REQ4_AUXILIARY1)) ;; "preoperative second-degree or above atrioventricular block without pacemaker"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: sick sinus syndrome (preoperative)
(assert
(! (not patient_has_finding_of_sick_sinus_syndrome_preoperative)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has preoperative sick sinus syndrome."

;; Exclusion: severe bradycardia (preoperative, heart rate < 50)
(assert
(! (not (and patient_has_finding_of_bradycardia_preoperative
             (< patient_heart_rate_value_recorded_preoperative_withunit_beats_per_minute 50)))
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has preoperative severe bradycardia (heart rate < 50 beats per minute)."

;; Exclusion: preoperative second-degree or above atrioventricular block without pacemaker
(assert
(! (not patient_has_finding_of_atrioventricular_block_preoperative@@without_pacemaker)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has preoperative second-degree or above atrioventricular block without pacemaker."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_abnormal_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal liver function (hepatic dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have abnormal liver function (hepatic dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal liver function (hepatic dysfunction).","meaning":"Boolean indicating whether the patient currently has abnormal liver function (hepatic dysfunction)."} ;; "hepatic dysfunction"
(declare-const patient_has_finding_of_abnormal_liver_function_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal liver function (hepatic dysfunction) is severe.","when_to_set_to_false":"Set to false if the patient's abnormal liver function (hepatic dysfunction) is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's abnormal liver function (hepatic dysfunction) is severe.","meaning":"Boolean indicating whether the patient's abnormal liver function (hepatic dysfunction) is severe."} ;; "severe hepatic dysfunction"
(declare-const patient_has_finding_of_abnormal_liver_function_now@@meets_child_pugh_class_c_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal liver function (hepatic dysfunction) meets Child-Pugh class C criteria.","when_to_set_to_false":"Set to false if the patient's abnormal liver function (hepatic dysfunction) does not meet Child-Pugh class C criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's abnormal liver function (hepatic dysfunction) meets Child-Pugh class C criteria.","meaning":"Boolean indicating whether the patient's abnormal liver function (hepatic dysfunction) meets Child-Pugh class C criteria."} ;; "Child-Pugh class C"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_abnormal_liver_function_now@@severe
       patient_has_finding_of_abnormal_liver_function_now)
   :named REQ5_AUXILIARY0)) ;; "severe hepatic dysfunction"

(assert
(! (=> patient_has_finding_of_abnormal_liver_function_now@@meets_child_pugh_class_c_criteria
       patient_has_finding_of_abnormal_liver_function_now)
   :named REQ5_AUXILIARY1)) ;; "Child-Pugh class C"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_abnormal_liver_function_now@@meets_child_pugh_class_c_criteria)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hepatic dysfunction (Child-Pugh class C)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment (renal dysfunction).","meaning":"Boolean indicating whether the patient currently has renal impairment (renal dysfunction)."} ;; "renal dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal impairment is severe.","when_to_set_to_false":"Set to false if the patient's current renal impairment is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal impairment is severe.","meaning":"Boolean indicating whether the patient's current renal impairment is severe."} ;; "severe renal dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now@@requires_renal_replacement_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal impairment requires renal replacement therapy.","when_to_set_to_false":"Set to false if the patient's current renal impairment does not require renal replacement therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal impairment requires renal replacement therapy.","meaning":"Boolean indicating whether the patient's current renal impairment requires renal replacement therapy."} ;; "requiring renal replacement therapy"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severe
      patient_has_finding_of_renal_impairment_now)
:named REQ6_AUXILIARY0)) ;; "severe renal dysfunction"

(assert
(! (=> patient_has_finding_of_renal_impairment_now@@requires_renal_replacement_therapy
      patient_has_finding_of_renal_impairment_now)
:named REQ6_AUXILIARY1)) ;; "requiring renal replacement therapy"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have severe renal dysfunction requiring renal replacement therapy
(assert
(! (not (and patient_has_finding_of_renal_impairment_now@@severe
             patient_has_finding_of_renal_impairment_now@@requires_renal_replacement_therapy))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal dysfunction requiring renal replacement therapy."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_other_condition_unsuitable_for_participation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other condition that is considered unsuitable for participation.","when_to_set_to_false":"Set to false if the patient currently does not have any other condition that is considered unsuitable for participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other condition that is considered unsuitable for participation.","meaning":"Boolean indicating whether the patient currently has any other condition that is considered unsuitable for participation."} ;; "The patient is excluded if the patient has other conditions that are considered unsuitable for participation."
(declare-const patient_has_other_condition_unsuitable_for_participation_now@@considered_unsuitable_for_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's other condition is considered unsuitable for participation.","when_to_set_to_false":"Set to false if the patient's other condition is not considered unsuitable for participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's other condition is considered unsuitable for participation.","meaning":"Boolean indicating whether the patient's other condition is considered unsuitable for participation."} ;; "The patient is excluded if the patient has other conditions that are considered unsuitable for participation."

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_other_condition_unsuitable_for_participation_now@@considered_unsuitable_for_participation
      patient_has_other_condition_unsuitable_for_participation_now)
:named REQ7_AUXILIARY0)) ;; "The qualifier specifies that the condition is considered unsuitable for participation."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_other_condition_unsuitable_for_participation_now@@considered_unsuitable_for_participation)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other conditions that are considered unsuitable for participation."
