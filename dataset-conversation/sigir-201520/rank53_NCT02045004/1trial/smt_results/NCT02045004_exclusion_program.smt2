;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_operation_on_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a cardiac surgery (operation on heart) at the present time.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a cardiac surgery (operation on heart) at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a cardiac surgery (operation on heart).","meaning":"Boolean indicating whether the patient is currently undergoing a cardiac surgery (operation on heart) now."} ;; "cardiac surgery"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_undergoing_operation_on_heart_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is undergoing cardiac surgery."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_operation_on_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a neurosurgical operation.","when_to_set_to_false":"Set to false if the patient is currently not undergoing a neurosurgical operation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a neurosurgical operation.","meaning":"Boolean indicating whether the patient is currently undergoing a neurosurgical operation."} ;; "neurosurgery"
(declare-const patient_is_undergoing_carotid_endarterectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing carotid endarterectomy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing carotid endarterectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing carotid endarterectomy.","meaning":"Boolean indicating whether the patient is currently undergoing carotid endarterectomy."} ;; "carotid endarterectomy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_undergoing_operation_on_nervous_system_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is undergoing neurosurgery."

(assert
(! (not patient_is_undergoing_carotid_endarterectomy_now)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is undergoing carotid endarterectomy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patients_mini_mental_state_examination_score_is_positive_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if there is any record in the patient's history of a positive Mini Mental State Examination Score (i.e., the test was performed and a score was obtained).","when_to_set_to_false":"Set to false if there is no record in the patient's history of a positive Mini Mental State Examination Score (i.e., the test was not performed or no score was obtained).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Mini Mental State Examination Score was ever positive in the patient's history.","meaning":"Boolean indicating whether the patient has ever had a positive Mini Mental State Examination Score in their history."} ;; "Mini Mental State Examination Score"

(declare-const patients_mini_mental_state_examination_score_value_recorded_preoperative_withunit_points Real) ;; {"when_to_set_to_value":"Set to the value of the patient's Mini Mental State Examination Score recorded in the preoperative period, in points.","when_to_set_to_null":"Set to null if the preoperative Mini Mental State Examination Score is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's Mini Mental State Examination Score recorded preoperatively, in points."} ;; "preoperative Mini Mental State Examination Score < 24"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (< patients_mini_mental_state_examination_score_value_recorded_preoperative_withunit_points 24))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a preoperative Mini Mental State Examination Score < 24."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_history_of_pathological_neuroimaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of pathological neuroimaging.","when_to_set_to_false":"Set to false if the patient does not have a documented history of pathological neuroimaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of pathological neuroimaging.","meaning":"Boolean indicating whether the patient has a history of pathological neuroimaging."} ;; "previous pathological neuroimaging (if available)"
(declare-const patient_has_history_of_pathological_neuroimaging@@if_available Bool) ;; {"when_to_set_to_true":"Set to true if neuroimaging data is available for the patient.","when_to_set_to_false":"Set to false if neuroimaging data is not available for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether neuroimaging data is available for the patient.","meaning":"Boolean indicating whether neuroimaging data is available for the patient."} ;; "if available"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_history_of_pathological_neuroimaging@@if_available
     patient_has_history_of_pathological_neuroimaging)
:named REQ3_AUXILIARY0)) ;; "if available" qualifier implies the history of pathological neuroimaging is only considered if data is available

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_has_history_of_pathological_neuroimaging@@if_available
             patient_has_history_of_pathological_neuroimaging))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous pathological neuroimaging (if available)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_cerebral_alteration_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebral alteration (cerebral pathology) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebral alteration (cerebral pathology) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebral alteration (cerebral pathology).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cerebral alteration (cerebral pathology) in their history."} ;; "cerebral pathology"
(declare-const patient_has_diagnosis_of_cerebrovascular_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular disease (cerebrovascular pathology) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular disease (cerebrovascular pathology) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular disease (cerebrovascular pathology).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cerebrovascular disease (cerebrovascular pathology) in their history."} ;; "cerebrovascular pathology"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_cerebral_alteration_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebral pathology."

(assert
(! (not patient_has_diagnosis_of_cerebrovascular_disease_inthehistory)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebrovascular pathology."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_taking_psychotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a psychotropic agent.","when_to_set_to_false":"Set to false if the patient is currently not taking a psychotropic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a psychotropic agent.","meaning":"Boolean indicating whether the patient is currently taking a psychotropic agent."} ;; "psychiatric medication"
(declare-const patient_is_taking_psychotropic_agent_now@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current use of a psychotropic agent is chronic (i.e., ongoing or long-term).","when_to_set_to_false":"Set to false if the patient's current use of a psychotropic agent is not chronic (i.e., short-term, acute, or one-time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current use of a psychotropic agent is chronic.","meaning":"Boolean indicating whether the patient's current use of a psychotropic agent is chronic."} ;; "chronic use of psychiatric medication"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_psychotropic_agent_now@@chronic_use
      patient_is_taking_psychotropic_agent_now)
   :named REQ5_AUXILIARY0)) ;; "chronic use of psychiatric medication" (qualifier variable implies stem variable)

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_taking_psychotropic_agent_now@@chronic_use)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of psychiatric medication."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "alcohol abuse"
(declare-const patient_has_finding_of_substance_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of substance abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of substance abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has substance abuse.","meaning":"Boolean indicating whether the patient currently has substance abuse."} ;; "substance abuse"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alcohol abuse."

(assert
(! (not patient_has_finding_of_substance_abuse_now)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has substance abuse."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_chronic_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had chronic pain at any time in the past, regardless of cause.","when_to_set_to_false":"Set to false if the patient has never had chronic pain at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had chronic pain in the past.","meaning":"Boolean indicating whether the patient has ever had chronic pain in the past."} ;; "chronic pain"
(declare-const patient_has_finding_of_chronic_pain_inthehistory@@unrelated_to_planned_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic pain in the past is unrelated to the planned surgery.","when_to_set_to_false":"Set to false if the patient's chronic pain in the past is related to the planned surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic pain in the past is unrelated to the planned surgery.","meaning":"Boolean indicating whether the patient's chronic pain in the past is unrelated to the planned surgery."} ;; "chronic pain unrelated to the planned surgery"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_chronic_pain_inthehistory@@unrelated_to_planned_surgery
      patient_has_finding_of_chronic_pain_inthehistory)
:named REQ7_AUXILIARY0)) ;; "chronic pain unrelated to the planned surgery" implies "chronic pain"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_chronic_pain_inthehistory@@unrelated_to_planned_surgery)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chronic pain unrelated to the planned surgery."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_can_undergo_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo magnetic resonance imaging (MRI), i.e., has no contraindication to MRI.","when_to_set_to_false":"Set to false if the patient currently cannot undergo magnetic resonance imaging (MRI) due to any contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient can currently undergo magnetic resonance imaging (MRI)."} ;; "magnetic resonance imaging"
(declare-const patient_has_contraindication_for_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication for magnetic resonance imaging (MRI), including but not limited to pacemaker or other MRI-incompatible metal implant.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication for magnetic resonance imaging (MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication for magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient currently has any contraindication for magnetic resonance imaging (MRI)."} ;; "any contraindication for magnetic resonance imaging"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Contraindication for MRI means cannot undergo MRI
(assert
(! (= patient_can_undergo_magnetic_resonance_imaging_now
    (not patient_has_contraindication_for_magnetic_resonance_imaging_now))
:named REQ8_AUXILIARY0)) ;; "The patient is excluded if the patient has any contraindication for magnetic resonance imaging..."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_contraindication_for_magnetic_resonance_imaging_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any contraindication for magnetic resonance imaging with non-exhaustive examples (pacemaker, other magnetic resonance imaging-incompatible metal implant)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_claustrophobia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of claustrophobia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of claustrophobia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has claustrophobia.","meaning":"Boolean indicating whether the patient currently has claustrophobia."} ;; "claustrophobia"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_claustrophobia_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has claustrophobia."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has provided informed consent.","when_to_set_to_false":"Set to false if the patient currently has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has provided informed consent.","meaning":"Boolean indicating whether the patient currently has provided informed consent."} ;; "lacks informed consent"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_informed_consent_now)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient lacks informed consent."
