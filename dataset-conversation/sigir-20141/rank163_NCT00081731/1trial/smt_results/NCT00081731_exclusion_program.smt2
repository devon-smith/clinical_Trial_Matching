;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} ;; "unable to provide informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_able_to_provide_informed_consent_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to provide informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_unable_to_comply_with_study_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to comply with the study protocol.","when_to_set_to_false":"Set to false if the patient is able to comply with the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to comply with the study protocol.","meaning":"Boolean indicating whether the patient is unable to comply with the study protocol."} ;; "unable to comply with the study protocol"
(declare-const patient_is_unwilling_to_comply_with_study_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to comply with the study protocol.","when_to_set_to_false":"Set to false if the patient is willing to comply with the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to comply with the study protocol.","meaning":"Boolean indicating whether the patient is unwilling to comply with the study protocol."} ;; "unwilling to comply with the study protocol"
(declare-const patient_is_unable_to_comply_with_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to comply with the study procedures.","when_to_set_to_false":"Set to false if the patient is able to comply with the study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to comply with the study procedures.","meaning":"Boolean indicating whether the patient is unable to comply with the study procedures."} ;; "unable to comply with the study procedures"
(declare-const patient_is_unwilling_to_comply_with_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to comply with the study procedures.","when_to_set_to_false":"Set to false if the patient is willing to comply with the study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to comply with the study procedures.","meaning":"Boolean indicating whether the patient is unwilling to comply with the study procedures."} ;; "unwilling to comply with the study procedures"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_unable_to_comply_with_study_protocol)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to comply with the study protocol."

(assert
(! (not patient_is_unwilling_to_comply_with_study_protocol)
:named REQ1_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to comply with the study protocol."

(assert
(! (not patient_is_unable_to_comply_with_study_procedures)
:named REQ1_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to comply with the study procedures."

(assert
(! (not patient_is_unwilling_to_comply_with_study_procedures)
:named REQ1_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to comply with the study procedures."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "less than or equal to 18 years of age"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (<= patient_age_value_recorded_now_in_years 18))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than or equal to 18 years of age."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_fibromuscular_dysplasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fibromuscular dysplasia.","when_to_set_to_false":"Set to false if the patient currently does not have fibromuscular dysplasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fibromuscular dysplasia.","meaning":"Boolean indicating whether the patient currently has fibromuscular dysplasia."} ;; "the patient has fibromuscular dysplasia"

(declare-const patient_has_finding_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has renal artery stenosis."} ;; "renal artery stenosis"

(declare-const patient_has_finding_of_renal_artery_stenosis_now@@non_atherosclerotic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal artery stenosis is non-atherosclerotic.","when_to_set_to_false":"Set to false if the patient's current renal artery stenosis is atherosclerotic or not non-atherosclerotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal artery stenosis is non-atherosclerotic.","meaning":"Boolean indicating whether the patient's current renal artery stenosis is non-atherosclerotic."} ;; "non-atherosclerotic renal artery stenosis"

(declare-const patient_has_finding_of_renal_artery_stenosis_now@@known_to_be_present_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal artery stenosis is known to be present prior to randomization.","when_to_set_to_false":"Set to false if the patient's current renal artery stenosis is not known to be present prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal artery stenosis is known to be present prior to randomization.","meaning":"Boolean indicating whether the patient's current renal artery stenosis is known to be present prior to randomization."} ;; "renal artery stenosis known to be present prior to randomization"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@non_atherosclerotic
      patient_has_finding_of_renal_artery_stenosis_now)
:named REQ3_AUXILIARY0)) ;; "non-atherosclerotic renal artery stenosis"

(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@known_to_be_present_prior_to_randomization
      patient_has_finding_of_renal_artery_stenosis_now)
:named REQ3_AUXILIARY1)) ;; "renal artery stenosis known to be present prior to randomization"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have fibromuscular dysplasia
(assert
(! (not patient_has_finding_of_fibromuscular_dysplasia_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fibromuscular dysplasia."

;; Exclusion: patient must NOT have non-atherosclerotic renal artery stenosis known to be present prior to randomization
(assert
(! (not (and patient_has_finding_of_renal_artery_stenosis_now@@non_atherosclerotic
             patient_has_finding_of_renal_artery_stenosis_now@@known_to_be_present_prior_to_randomization))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-atherosclerotic renal artery stenosis known to be present prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently assessed to not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is a female of childbearing potential"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_pregnancy_status_is_unknown_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pregnancy status is unknown.","when_to_set_to_false":"Set to false if the patient's current pregnancy status is known (either pregnant or not pregnant).","when_to_set_to_null":"Set to null if it cannot be determined whether the patient's current pregnancy status is known or unknown.","meaning":"Boolean indicating whether the patient's current pregnancy status is unknown."} ;; "the patient has unknown pregnancy status"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_childbearing_potential_now
             (or patient_is_pregnant_now
                 patient_pregnancy_status_is_unknown_now)))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a female of childbearing potential AND (the patient is pregnant OR the patient has unknown pregnancy status)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_clinical_drug_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever participated in a clinical drug trial at any time in their history (including during the study period).","when_to_set_to_false":"Set to false if the patient has never participated in a clinical drug trial at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever participated in a clinical drug trial.","meaning":"Boolean indicating whether the patient has ever participated in a clinical drug trial at any time in their history."} ;; "drug trial"
(declare-const patient_has_undergone_clinical_drug_trial_inthehistory@@temporalcontext_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's participation in a clinical drug trial occurred during the study period.","when_to_set_to_false":"Set to false if the patient's participation in a clinical drug trial did not occur during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's participation in a clinical drug trial occurred during the study period.","meaning":"Boolean indicating whether the patient's participation in a clinical drug trial occurred during the study period."} ;; "the patient participates in any drug trial during the study period"
(declare-const patient_has_undergone_clinical_drug_trial_inthehistory@@participation_not_approved_by_steering_committee Bool) ;; {"when_to_set_to_true":"Set to true if the patient's participation in a clinical drug trial during the study period was NOT approved by the Steering Committee.","when_to_set_to_false":"Set to false if the patient's participation in a clinical drug trial during the study period was approved by the Steering Committee.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's participation in a clinical drug trial during the study period was approved by the Steering Committee.","meaning":"Boolean indicating whether the patient's participation in a clinical drug trial during the study period was NOT approved by the Steering Committee."} ;; "the participation is NOT approved by the Steering Committee"
(declare-const patient_has_finding_of_entered_into_device_clinical_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever entered into a device clinical trial at any time in their history (including during the study period).","when_to_set_to_false":"Set to false if the patient has never entered into a device clinical trial at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever entered into a device clinical trial.","meaning":"Boolean indicating whether the patient has ever entered into a device clinical trial at any time in their history."} ;; "device trial"
(declare-const patient_has_finding_of_entered_into_device_clinical_trial_inthehistory@@temporalcontext_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's entry into a device clinical trial occurred during the study period.","when_to_set_to_false":"Set to false if the patient's entry into a device clinical trial did not occur during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's entry into a device clinical trial occurred during the study period.","meaning":"Boolean indicating whether the patient's entry into a device clinical trial occurred during the study period."} ;; "the patient participates in any device trial during the study period"
(declare-const patient_has_finding_of_entered_into_device_clinical_trial_inthehistory@@participation_not_approved_by_steering_committee Bool) ;; {"when_to_set_to_true":"Set to true if the patient's participation in the device clinical trial during the study period was NOT approved by the Steering Committee.","when_to_set_to_false":"Set to false if the patient's participation in the device clinical trial during the study period was approved by the Steering Committee.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's participation in the device clinical trial during the study period was approved by the Steering Committee.","meaning":"Boolean indicating whether the patient's participation in the device clinical trial during the study period was NOT approved by the Steering Committee."} ;; "the participation is NOT approved by the Steering Committee"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables for drug trial
(assert
(! (=> patient_has_undergone_clinical_drug_trial_inthehistory@@temporalcontext_during_study_period
      patient_has_undergone_clinical_drug_trial_inthehistory)
    :named REQ5_AUXILIARY0)) ;; "the patient participates in any drug trial during the study period"

;; Qualifier variables imply corresponding stem variables for device trial
(assert
(! (=> patient_has_finding_of_entered_into_device_clinical_trial_inthehistory@@temporalcontext_during_study_period
      patient_has_finding_of_entered_into_device_clinical_trial_inthehistory)
    :named REQ5_AUXILIARY1)) ;; "the patient participates in any device trial during the study period"

;; Participation not approved by Steering Committee implies participation during study period (drug trial)
(assert
(! (=> patient_has_undergone_clinical_drug_trial_inthehistory@@participation_not_approved_by_steering_committee
      patient_has_undergone_clinical_drug_trial_inthehistory@@temporalcontext_during_study_period)
    :named REQ5_AUXILIARY2)) ;; "the participation is NOT approved by the Steering Committee" for drug trial

;; Participation not approved by Steering Committee implies participation during study period (device trial)
(assert
(! (=> patient_has_finding_of_entered_into_device_clinical_trial_inthehistory@@participation_not_approved_by_steering_committee
      patient_has_finding_of_entered_into_device_clinical_trial_inthehistory@@temporalcontext_during_study_period)
    :named REQ5_AUXILIARY3)) ;; "the participation is NOT approved by the Steering Committee" for device trial

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient is excluded if (participates in any drug trial during study period and not approved) OR (participates in any device trial during study period and not approved)
(assert
(! (not (or patient_has_undergone_clinical_drug_trial_inthehistory@@participation_not_approved_by_steering_committee
            patient_has_finding_of_entered_into_device_clinical_trial_inthehistory@@participation_not_approved_by_steering_committee))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient participates in any drug trial during the study period OR the patient participates in any device trial during the study period AND the participation is NOT approved by the Steering Committee."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_prior_enrollment_in_coral_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously enrolled in the CORAL study.","when_to_set_to_false":"Set to false if the patient has never enrolled in the CORAL study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously enrolled in the CORAL study.","meaning":"Boolean indicating whether the patient has previously enrolled in the CORAL study."} ;; "prior enrollment in the CORAL study"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_prior_enrollment_in_coral_study)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior enrollment in the CORAL study."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a history of cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cerebrovascular accident (stroke) at any time in the past.","meaning":"Boolean indicating whether the patient has a history of cerebrovascular accident (stroke) at any time in the past."} ;; "stroke"
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory@@associated_with_residual_neurologic_deficit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of cerebrovascular accident (stroke) is associated with a residual neurologic deficit.","when_to_set_to_false":"Set to false if the patient's history of cerebrovascular accident (stroke) is not associated with a residual neurologic deficit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of cerebrovascular accident (stroke) is associated with a residual neurologic deficit.","meaning":"Boolean indicating whether the patient's history of cerebrovascular accident (stroke) is associated with a residual neurologic deficit."} ;; "the history of stroke is associated with a residual neurologic deficit"
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within the past 6 months.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident (stroke) within the past 6 months."} ;; "stroke within 6 months"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cerebrovascular_accident_inthehistory@@associated_with_residual_neurologic_deficit
      patient_has_finding_of_cerebrovascular_accident_inthehistory)
:named REQ7_AUXILIARY0)) ;; "the history of stroke is associated with a residual neurologic deficit"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have BOTH (stroke within 6 months) AND (that history is associated with a residual neurologic deficit)
(assert
(! (not (and patient_has_finding_of_cerebrovascular_accident_inthepast6months
             patient_has_finding_of_cerebrovascular_accident_inthehistory@@associated_with_residual_neurologic_deficit))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of stroke within 6 months) AND (the history of stroke is associated with a residual neurologic deficit)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical procedure in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical procedure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical procedure in the past.","meaning":"Boolean indicating whether the patient has ever undergone a surgical procedure in the past."} ;; "surgery"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@major Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone by the patient is classified as major.","when_to_set_to_false":"Set to false if the surgical procedure undergone by the patient is not classified as major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure is major.","meaning":"Boolean indicating whether the surgical procedure is major."} ;; "major surgery"
(declare-const patient_has_finding_of_traumatic_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a traumatic injury in the past.","when_to_set_to_false":"Set to false if the patient has never had a traumatic injury in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a traumatic injury in the past.","meaning":"Boolean indicating whether the patient has ever had a traumatic injury in the past."} ;; "trauma"
(declare-const patient_has_finding_of_traumatic_injury_inthehistory@@major Bool) ;; {"when_to_set_to_true":"Set to true if the traumatic injury experienced by the patient is classified as major.","when_to_set_to_false":"Set to false if the traumatic injury experienced by the patient is not classified as major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the traumatic injury is major.","meaning":"Boolean indicating whether the traumatic injury is major."} ;; "major trauma"
(declare-const patient_has_undergone_revascularization_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a revascularization procedure in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a revascularization procedure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a revascularization procedure in the past.","meaning":"Boolean indicating whether the patient has ever undergone a revascularization procedure in the past."} ;; "revascularization procedure"
(declare-const patient_has_finding_of_preinfarction_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had preinfarction syndrome (unstable angina) in the past.","when_to_set_to_false":"Set to false if the patient has never had preinfarction syndrome (unstable angina) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had preinfarction syndrome (unstable angina) in the past.","meaning":"Boolean indicating whether the patient has ever had preinfarction syndrome (unstable angina) in the past."} ;; "unstable angina"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction in the past.","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction in the past.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction in the past."} ;; "myocardial infarction"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within30days_before_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the myocardial infarction occurred within 30 days prior to study entry.","when_to_set_to_false":"Set to false if the myocardial infarction did not occur within 30 days prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction occurred within 30 days prior to study entry.","meaning":"Boolean indicating whether the myocardial infarction occurred within 30 days prior to study entry."} ;; "myocardial infarction 30 days prior to study entry"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@major
      patient_has_undergone_surgical_procedure_inthehistory)
:named REQ8_AUXILIARY0)) ;; "major surgery"

(assert
(! (=> patient_has_finding_of_traumatic_injury_inthehistory@@major
      patient_has_finding_of_traumatic_injury_inthehistory)
:named REQ8_AUXILIARY1)) ;; "major trauma"

(assert
(! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within30days_before_study_entry
      patient_has_finding_of_myocardial_infarction_inthehistory)
:named REQ8_AUXILIARY2)) ;; "myocardial infarction 30 days prior to study entry"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthehistory@@major)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had major surgery."

(assert
(! (not patient_has_finding_of_traumatic_injury_inthehistory@@major)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had major trauma."

(assert
(! (not patient_has_undergone_revascularization_procedure_inthehistory)
:named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a revascularization procedure."

(assert
(! (not patient_has_finding_of_preinfarction_syndrome_inthehistory)
:named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had unstable angina."

(assert
(! (not patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within30days_before_study_entry)
:named REQ8_COMPONENT4_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had myocardial infarction 30 days prior to study entry."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_will_undergo_surgical_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any surgical procedure planned to occur in the future (after randomization).","when_to_set_to_false":"Set to false if the patient does not have any surgical procedure planned in the future (after randomization).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any surgical procedure planned in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo any surgical procedure in the future."} ;; "any planned major surgery after randomization"
(declare-const patient_will_undergo_surgical_procedure_inthefuture@@is_major Bool) ;; {"when_to_set_to_true":"Set to true if the planned surgical procedure is major.","when_to_set_to_false":"Set to false if the planned surgical procedure is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned surgical procedure is major.","meaning":"Boolean indicating whether the planned surgical procedure is major."} ;; "major surgery"
(declare-const patient_will_undergo_revascularization_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any revascularization procedure planned to occur in the future (after randomization).","when_to_set_to_false":"Set to false if the patient does not have any revascularization procedure planned in the future (after randomization).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any revascularization procedure planned in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo any revascularization procedure in the future (after randomization)."} ;; "any planned revascularization procedure after randomization"
(declare-const patient_will_undergo_revascularization_procedure_inthefuture@@is_outside_of_randomly_allocated_protocol_indicated_renal_stenting Bool) ;; {"when_to_set_to_true":"Set to true if the planned revascularization procedure is outside of the randomly allocated renal stenting indicated by the protocol.","when_to_set_to_false":"Set to false if the planned revascularization procedure is not outside of the randomly allocated renal stenting indicated by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned revascularization procedure is outside of the randomly allocated renal stenting indicated by the protocol.","meaning":"Boolean indicating whether the planned revascularization procedure is outside of the randomly allocated renal stenting indicated by the protocol."} ;; "the planned procedure is outside of the randomly allocated renal stenting indicated by the protocol"
(declare-const patient_will_undergo_insertion_of_renal_artery_stent_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient has insertion of a renal artery stent planned to occur in the future (after randomization).","when_to_set_to_false":"Set to false if the patient does not have insertion of a renal artery stent planned in the future (after randomization).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has insertion of a renal artery stent planned in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo insertion of a renal artery stent in the future."} ;; "renal stenting"
(declare-const patient_will_undergo_insertion_of_renal_artery_stent_inthefuture@@is_randomly_allocated Bool) ;; {"when_to_set_to_true":"Set to true if the planned renal stenting procedure is randomly allocated.","when_to_set_to_false":"Set to false if the planned renal stenting procedure is not randomly allocated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned renal stenting procedure is randomly allocated.","meaning":"Boolean indicating whether the planned renal stenting procedure is randomly allocated."} ;; "randomly allocated renal stenting"
(declare-const patient_will_undergo_insertion_of_renal_artery_stent_inthefuture@@is_protocol_indicated Bool) ;; {"when_to_set_to_true":"Set to true if the planned renal stenting procedure is indicated by the protocol.","when_to_set_to_false":"Set to false if the planned renal stenting procedure is not indicated by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned renal stenting procedure is indicated by the protocol.","meaning":"Boolean indicating whether the planned renal stenting procedure is indicated by the protocol."} ;; "renal stenting indicated by the protocol"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_will_undergo_surgical_procedure_inthefuture@@is_major
      patient_will_undergo_surgical_procedure_inthefuture)
:named REQ9_AUXILIARY0)) ;; "major surgery"

(assert
(! (=> patient_will_undergo_insertion_of_renal_artery_stent_inthefuture@@is_randomly_allocated
      patient_will_undergo_insertion_of_renal_artery_stent_inthefuture)
:named REQ9_AUXILIARY1)) ;; "randomly allocated renal stenting"

(assert
(! (=> patient_will_undergo_insertion_of_renal_artery_stent_inthefuture@@is_protocol_indicated
      patient_will_undergo_insertion_of_renal_artery_stent_inthefuture)
:named REQ9_AUXILIARY2)) ;; "renal stenting indicated by the protocol"

(assert
(! (=> patient_will_undergo_revascularization_procedure_inthefuture@@is_outside_of_randomly_allocated_protocol_indicated_renal_stenting
      patient_will_undergo_revascularization_procedure_inthefuture)
:named REQ9_AUXILIARY3)) ;; "the planned procedure is outside of the randomly allocated renal stenting indicated by the protocol"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have any planned major surgery OR planned revascularization procedure after randomization, if the planned procedure is outside of the randomly allocated renal stenting indicated by the protocol.
(assert
(! (not
    (or
      patient_will_undergo_surgical_procedure_inthefuture@@is_major
      patient_will_undergo_revascularization_procedure_inthefuture@@is_outside_of_randomly_allocated_protocol_indicated_renal_stenting
    ))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has any planned major surgery after randomization) OR (the patient has any planned revascularization procedure after randomization)) AND (the planned procedure is outside of the randomly allocated renal stenting indicated by the protocol)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_inpatient_stay_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an inpatient stay (hospitalization) within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not had an inpatient stay (hospitalization) within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an inpatient stay (hospitalization) within the past 30 days.","meaning":"Boolean indicating whether the patient has had an inpatient stay (hospitalization) within the past 30 days."} ;; "hospitalization for heart failure within the past 30 days"
(declare-const patient_has_finding_of_inpatient_stay_inthepast30days@@for_heart_failure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inpatient stay (hospitalization) within the past 30 days was for heart failure.","when_to_set_to_false":"Set to false if the patient's inpatient stay (hospitalization) within the past 30 days was not for heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reason for the patient's inpatient stay (hospitalization) within the past 30 days was heart failure.","meaning":"Boolean indicating whether the patient's inpatient stay (hospitalization) within the past 30 days was for heart failure."} ;; "hospitalization for heart failure within the past 30 days"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_inpatient_stay_inthepast30days@@for_heart_failure
      patient_has_finding_of_inpatient_stay_inthepast30days)
   :named REQ10_AUXILIARY0)) ;; "hospitalization for heart failure within the past 30 days" (qualifier variable implies stem variable)

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_inpatient_stay_inthepast30days@@for_heart_failure)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had hospitalization for heart failure within the past 30 days."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any comorbid condition.","when_to_set_to_false":"Set to false if the patient currently does not have any comorbid condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any comorbid condition.","meaning":"Boolean indicating whether the patient currently has a comorbid condition."} ;; "comorbid condition"

(declare-const patient_has_finding_of_co_morbid_conditions_now@@causes_life_expectancy_less_than_or_equal_to_3_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a comorbid condition and that condition causes life expectancy less than or equal to 3 years.","when_to_set_to_false":"Set to false if the patient currently has a comorbid condition but it does not cause life expectancy less than or equal to 3 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbid condition causes life expectancy less than or equal to 3 years.","meaning":"Boolean indicating whether the patient's comorbid condition causes life expectancy less than or equal to 3 years."} ;; "comorbid condition causing life expectancy less than or equal to 3 years"

(declare-const patient_life_expectancy_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's current estimated life expectancy in years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's current estimated life expectancy is.","meaning":"Numeric value indicating the patient's current estimated life expectancy in years."} ;; "life expectancy less than or equal to 3 years"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@causes_life_expectancy_less_than_or_equal_to_3_years
       patient_has_finding_of_co_morbid_conditions_now)
   :named REQ11_AUXILIARY0)) ;; "comorbid condition causing life expectancy less than or equal to 3 years"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@causes_life_expectancy_less_than_or_equal_to_3_years)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a comorbid condition causing life expectancy less than or equal to 3 years."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_allergy_to_contrast_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to intravascular contrast media.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to intravascular contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to intravascular contrast media.","meaning":"Boolean indicating whether the patient currently has an allergy to intravascular contrast media."} ;; "allergic reaction to intravascular contrast"
(declare-const patient_has_finding_of_allergy_to_contrast_media_now@@not_amenable_to_pre_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to intravascular contrast media is not amenable to pre-treatment.","when_to_set_to_false":"Set to false if the patient's allergy to intravascular contrast media is amenable to pre-treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy is amenable to pre-treatment.","meaning":"Boolean indicating whether the patient's allergy to intravascular contrast media is not amenable to pre-treatment."} ;; "not amenable to pre-treatment"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergy_to_contrast_media_now@@not_amenable_to_pre_treatment
      patient_has_finding_of_allergy_to_contrast_media_now)
:named REQ12_AUXILIARY0)) ;; "an allergic reaction to intravascular contrast that is not amenable to pre-treatment"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_allergy_to_contrast_media_now@@not_amenable_to_pre_treatment)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergic reaction to intravascular contrast that is not amenable to pre-treatment."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_allergy_to_stainless_steel_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to stainless steel.","when_to_set_to_false":"Set to false if the patient has never had an allergy to stainless steel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to stainless steel.","meaning":"Boolean indicating whether the patient has ever had an allergy to stainless steel."} ;; "The patient is excluded if the patient has an allergy to stainless steel."

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (not patient_has_allergy_to_stainless_steel_ever)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to stainless steel."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_allergy_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to aspirin.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to aspirin.","meaning":"Boolean indicating whether the patient currently has an allergy to aspirin."} ;; "allergy to aspirin"
(declare-const patient_has_finding_of_allergy_to_clopidogrel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to clopidogrel.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to clopidogrel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to clopidogrel.","meaning":"Boolean indicating whether the patient currently has an allergy to clopidogrel."} ;; "allergy to clopidogrel"
(declare-const patient_has_finding_of_allergy_to_ticlopidine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to ticlopidine.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to ticlopidine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to ticlopidine.","meaning":"Boolean indicating whether the patient currently has an allergy to ticlopidine."} ;; "allergy to ticlopidine"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_allergy_to_aspirin_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to aspirin."

(assert
(! (not patient_has_finding_of_allergy_to_clopidogrel_now)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to clopidogrel."

(assert
(! (not patient_has_finding_of_allergy_to_ticlopidine_now)
:named REQ14_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to ticlopidine."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_abdominal_aortic_aneurysm_value_recorded_now_withunit_centimeter Real) ;; {"when_to_set_to_value":"Set to the measured diameter in centimeters if a numeric measurement of the patient's abdominal aortic aneurysm diameter is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the diameter (in centimeters) of the patient's abdominal aortic aneurysm measured now."} ;; "aneurysm of the abdominal aorta with diameter greater than 5.0 centimeters"

(declare-const patient_has_finding_of_abdominal_aortic_aneurysm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abdominal aortic aneurysm.","when_to_set_to_false":"Set to false if the patient currently does not have an abdominal aortic aneurysm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abdominal aortic aneurysm.","meaning":"Boolean indicating whether the patient currently has an abdominal aortic aneurysm."} ;; "aneurysm of the abdominal aorta"

(declare-const patient_has_finding_of_abdominal_aortic_aneurysm_now@@is_known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abdominal aortic aneurysm is known (previously identified or diagnosed).","when_to_set_to_false":"Set to false if the patient's abdominal aortic aneurysm is not known (not previously identified or diagnosed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's abdominal aortic aneurysm is known.","meaning":"Boolean indicating whether the patient's abdominal aortic aneurysm is known."} ;; "known aneurysm of the abdominal aorta"

(declare-const patient_has_finding_of_abdominal_aortic_aneurysm_now@@is_untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abdominal aortic aneurysm is untreated (no surgical or medical intervention).","when_to_set_to_false":"Set to false if the patient's abdominal aortic aneurysm has been treated (surgical or medical intervention performed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's abdominal aortic aneurysm is untreated.","meaning":"Boolean indicating whether the patient's abdominal aortic aneurysm is untreated."} ;; "untreated aneurysm of the abdominal aorta"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_abdominal_aortic_aneurysm_now@@is_known
       patient_has_finding_of_abdominal_aortic_aneurysm_now)
    :named REQ15_AUXILIARY0)) ;; "aneurysm is known"

(assert
(! (=> patient_has_finding_of_abdominal_aortic_aneurysm_now@@is_untreated
       patient_has_finding_of_abdominal_aortic_aneurysm_now)
    :named REQ15_AUXILIARY1)) ;; "aneurysm is untreated"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not (and patient_has_finding_of_abdominal_aortic_aneurysm_now
             patient_has_finding_of_abdominal_aortic_aneurysm_now@@is_known
             patient_has_finding_of_abdominal_aortic_aneurysm_now@@is_untreated
             (> patient_abdominal_aortic_aneurysm_value_recorded_now_withunit_centimeter 5.0)))
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known untreated aneurysm of the abdominal aorta with diameter greater than 5.0 centimeters."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_undergone_transplant_of_kidney_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a kidney transplant at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a kidney transplant at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a kidney transplant.","meaning":"Boolean indicating whether the patient has ever undergone a kidney transplant in the past."} ;; "the patient has a previous kidney transplant"
(declare-const stenosis_severity_percent_value_recorded_in_previously_treated_revascularized_renal_artery Real) ;; {"when_to_set_to_value":"Set to the percent value of stenosis severity in a previously treated revascularized renal artery as recorded in the patient's medical record.","when_to_set_to_null":"Set to null if the percent severity of stenosis in a previously treated revascularized renal artery is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the percent severity of stenosis in a previously treated revascularized renal artery."} ;; "stenosis greater than 50 percent of a previously treated revascularized renal artery"
(declare-const patient_has_diagnosis_of_renal_artery_stenosis_inthepast9months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of renal artery stenosis within the past 9 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of renal artery stenosis within the past 9 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of renal artery stenosis within the past 9 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of renal artery stenosis within the past 9 months."} ;; "renal artery stenosis within the past 9 months"
(declare-const patient_has_diagnosis_of_renal_artery_stenosis_inthepast9months@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of renal artery stenosis within the past 9 months was treated.","when_to_set_to_false":"Set to false if the diagnosis of renal artery stenosis within the past 9 months was not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of renal artery stenosis within the past 9 months was treated.","meaning":"Boolean indicating whether the diagnosis of renal artery stenosis within the past 9 months was treated."} ;; "treatment of renal artery stenosis within the past 9 months"
(declare-const patient_has_undergone_treatment_of_renal_artery_stenosis_within_past_9_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone treatment of renal artery stenosis within the past 9 months.","when_to_set_to_false":"Set to false if the patient has not undergone treatment of renal artery stenosis within the past 9 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone treatment of renal artery stenosis within the past 9 months.","meaning":"Boolean indicating whether the patient has undergone treatment of renal artery stenosis within the past 9 months."} ;; "treatment of renal artery stenosis within the past 9 months"
(declare-const patient_is_roll_in_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient is classified as a roll-in patient.","when_to_set_to_false":"Set to false if the patient is not classified as a roll-in patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is classified as a roll-in patient.","meaning":"Boolean indicating whether the patient is classified as a roll-in patient."} ;; "roll-in patient"
(declare-const patient_is_roll_in_patient@@with_prior_treatment_on_contralateral_side Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a roll-in patient and has had prior treatment on the contralateral side.","when_to_set_to_false":"Set to false if the patient is a roll-in patient and has not had prior treatment on the contralateral side.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the roll-in patient has had prior treatment on the contralateral side.","meaning":"Boolean indicating whether the roll-in patient has had prior treatment on the contralateral side."} ;; "roll-in patient with prior treatment on the contralateral side"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies stem variable for roll-in patient
(assert
(! (=> patient_is_roll_in_patient@@with_prior_treatment_on_contralateral_side
       patient_is_roll_in_patient)
   :named REQ16_AUXILIARY0)) ;; "roll-in patient with prior treatment on the contralateral side" implies "roll-in patient"

;; Qualifier variable implies stem variable for diagnosis of renal artery stenosis in past 9 months
(assert
(! (=> patient_has_diagnosis_of_renal_artery_stenosis_inthepast9months@@treated
       patient_has_diagnosis_of_renal_artery_stenosis_inthepast9months)
   :named REQ16_AUXILIARY1)) ;; "diagnosis of renal artery stenosis within the past 9 months was treated" implies "diagnosis of renal artery stenosis within the past 9 months"

;; "treatment of renal artery stenosis within the past 9 months" is equivalent to "diagnosis of renal artery stenosis within the past 9 months" AND "diagnosis was treated"
(assert
(! (= patient_has_undergone_treatment_of_renal_artery_stenosis_within_past_9_months
      (and patient_has_diagnosis_of_renal_artery_stenosis_inthepast9months
           patient_has_diagnosis_of_renal_artery_stenosis_inthepast9months@@treated))
   :named REQ16_AUXILIARY2)) ;; "treatment of renal artery stenosis within the past 9 months" = "diagnosis of renal artery stenosis within the past 9 months" AND "diagnosis was treated"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Component 0: The patient is excluded if the patient has a previous kidney transplant AND the patient has stenosis greater than 50 percent of a previously treated revascularized renal artery.
(assert
(! (not (and patient_has_undergone_transplant_of_kidney_inthehistory
             (> stenosis_severity_percent_value_recorded_in_previously_treated_revascularized_renal_artery 50)))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous kidney transplant AND the patient has stenosis greater than 50 percent of a previously treated revascularized renal artery."

;; Component 1: The patient is excluded if the patient has had treatment of renal artery stenosis within the past 9 months AND the patient is NOT a roll-in patient with prior treatment on the contralateral side.
(assert
(! (not (and patient_has_undergone_treatment_of_renal_artery_stenosis_within_past_9_months
             (not patient_is_roll_in_patient@@with_prior_treatment_on_contralateral_side)))
   :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had treatment of renal artery stenosis within the past 9 months AND the patient is NOT a roll-in patient with prior treatment on the contralateral side."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const kidney_size_value_recorded_now_withunit_centimeters_supplied_by_target_vessel Real) ;; {"when_to_set_to_value":"Set to the numeric value (in centimeters) of the patient's kidney size measured now, for kidneys supplied by the target vessel.","when_to_set_to_null":"Set to null if the kidney size is unknown, not documented, cannot be determined, or if it is not clear that the kidney is supplied by the target vessel.","meaning":"Numeric value (centimeters) of the patient's kidney size measured now, for kidneys supplied by the target vessel."} ;; "kidney size less than 7 centimeters supplied by the target vessel"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
  (! (not (< kidney_size_value_recorded_now_withunit_centimeters_supplied_by_target_vessel 7))
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a kidney size less than 7 centimeters supplied by the target vessel."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_hydronephrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hydronephrosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hydronephrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hydronephrosis.","meaning":"Boolean indicating whether the patient currently has hydronephrosis."} ;; "hydronephrosis"
(declare-const patient_has_finding_of_nephritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of nephritis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of nephritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of nephritis.","meaning":"Boolean indicating whether the patient currently has nephritis."} ;; "nephritis"
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"
(declare-const patient_has_finding_of_renal_insufficiency_now@@not_due_to_large_vessel_renal_artery_stenosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal insufficiency is not due to large vessel renal artery stenosis.","when_to_set_to_false":"Set to false if the patient's current renal insufficiency is due to large vessel renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal insufficiency is due to large vessel renal artery stenosis.","meaning":"Boolean indicating that the patient's current renal insufficiency is not due to large vessel renal artery stenosis."} ;; "another known cause of renal insufficiency that is not due to large vessel renal artery stenosis"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_renal_insufficiency_now@@not_due_to_large_vessel_renal_artery_stenosis
      patient_has_finding_of_renal_insufficiency_now)
   :named REQ18_AUXILIARY0)) ;; "another known cause of renal insufficiency that is not due to large vessel renal artery stenosis"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_finding_of_hydronephrosis_now)
   :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hydronephrosis."

(assert
(! (not patient_has_finding_of_nephritis_now)
   :named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nephritis."

(assert
(! (not patient_has_finding_of_renal_insufficiency_now@@not_due_to_large_vessel_renal_artery_stenosis)
   :named REQ18_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another known cause of renal insufficiency that is not due to large vessel renal artery stenosis."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const accessory_renal_artery_supplied_renal_parenchyma_fraction_value_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the percent value representing the fraction of ipsilateral renal parenchyma supplied by the accessory renal artery with visualized stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what fraction of ipsilateral renal parenchyma is supplied by the accessory renal artery with visualized stenosis.","meaning":"Numeric value (percent) of ipsilateral renal parenchyma supplied by the accessory renal artery with visualized stenosis."} ;; "supplying greater than one-half of the ipsilateral renal parenchyma"

(declare-const patient_has_visualized_stenosis_in_accessory_renal_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has visualized stenosis in only an accessory renal artery.","when_to_set_to_false":"Set to false if the patient currently does not have visualized stenosis in only an accessory renal artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has visualized stenosis in only an accessory renal artery.","meaning":"Boolean indicating whether the patient currently has visualized stenosis in only an accessory renal artery."} ;; "visualized stenosis of only an accessory renal artery"

(declare-const patient_has_visualized_stenosis_in_accessory_renal_artery_now@@supplying_greater_than_one_half_of_ipsilateral_renal_parenchyma Bool) ;; {"when_to_set_to_true":"Set to true if the accessory renal artery with visualized stenosis supplies greater than one-half of the ipsilateral renal parenchyma.","when_to_set_to_false":"Set to false if the accessory renal artery with visualized stenosis does not supply greater than one-half of the ipsilateral renal parenchyma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the accessory renal artery with visualized stenosis supplies greater than one-half of the ipsilateral renal parenchyma.","meaning":"Boolean indicating whether the accessory renal artery with visualized stenosis supplies greater than one-half of the ipsilateral renal parenchyma."} ;; "supplying greater than one-half of the ipsilateral renal parenchyma"

(declare-const patient_has_visualized_stenosis_in_accessory_renal_artery_now@@without_stenosis_in_dominant_renal_artery Bool) ;; {"when_to_set_to_true":"Set to true if there is no stenosis in a dominant renal artery when visualized stenosis is present in only an accessory renal artery.","when_to_set_to_false":"Set to false if there is stenosis in a dominant renal artery when visualized stenosis is present in only an accessory renal artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is stenosis in a dominant renal artery when visualized stenosis is present in only an accessory renal artery.","meaning":"Boolean indicating whether there is no stenosis in a dominant renal artery when visualized stenosis is present in only an accessory renal artery."} ;; "without stenosis in a dominant renal artery"

(declare-const patient_has_visualized_stenosis_in_dominant_renal_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has visualized stenosis in a dominant renal artery.","when_to_set_to_false":"Set to false if the patient currently does not have visualized stenosis in a dominant renal artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has visualized stenosis in a dominant renal artery.","meaning":"Boolean indicating whether the patient currently has visualized stenosis in a dominant renal artery."} ;; "without stenosis in a dominant renal artery"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Define the qualifier for "supplying greater than one-half of the ipsilateral renal parenchyma"
(assert
(! (= patient_has_visualized_stenosis_in_accessory_renal_artery_now@@supplying_greater_than_one_half_of_ipsilateral_renal_parenchyma
     (> accessory_renal_artery_supplied_renal_parenchyma_fraction_value_now_withunit_percent 50))
:named REQ19_AUXILIARY0)) ;; "supplying greater than one-half of the ipsilateral renal parenchyma"

;; Define the qualifier for "without stenosis in a dominant renal artery"
(assert
(! (= patient_has_visualized_stenosis_in_accessory_renal_artery_now@@without_stenosis_in_dominant_renal_artery
     (not patient_has_visualized_stenosis_in_dominant_renal_artery_now))
:named REQ19_AUXILIARY1)) ;; "without stenosis in a dominant renal artery"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_visualized_stenosis_in_accessory_renal_artery_now@@supplying_greater_than_one_half_of_ipsilateral_renal_parenchyma
      patient_has_visualized_stenosis_in_accessory_renal_artery_now)
:named REQ19_AUXILIARY2)) ;; "supplying greater than one-half of the ipsilateral renal parenchyma"

(assert
(! (=> patient_has_visualized_stenosis_in_accessory_renal_artery_now@@without_stenosis_in_dominant_renal_artery
      patient_has_visualized_stenosis_in_accessory_renal_artery_now)
:named REQ19_AUXILIARY3)) ;; "without stenosis in a dominant renal artery"

;; ===================== Constraint Assertions (REQ 19) =====================
;; Exclusion: patient must NOT have visualized stenosis of only an accessory renal artery supplying >1/2 of ipsilateral renal parenchyma, without stenosis in a dominant renal artery
(assert
(! (not (and patient_has_visualized_stenosis_in_accessory_renal_artery_now
             patient_has_visualized_stenosis_in_accessory_renal_artery_now@@supplying_greater_than_one_half_of_ipsilateral_renal_parenchyma
             patient_has_visualized_stenosis_in_accessory_renal_artery_now@@without_stenosis_in_dominant_renal_artery))
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has visualized stenosis of only an accessory renal artery supplying greater than one-half of the ipsilateral renal parenchyma, without stenosis in a dominant renal artery."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a local laboratory serum creatinine measurement (in mg/dL) is available for the patient on the day of randomization.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's serum creatinine level (mg/dL) measured by local laboratory on the day of randomization."} ;; "serum creatinine > 4.0 milligrams per deciliter on the day of randomization"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter@@measured_by_local_laboratory Bool) ;; {"when_to_set_to_true":"Set to true if the serum creatinine measurement was performed by a local laboratory.","when_to_set_to_false":"Set to false if the measurement was not performed by a local laboratory.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was performed by a local laboratory.","meaning":"Indicates whether the serum creatinine value was measured by a local laboratory."} ;; "local laboratory"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter@@measured_on_day_of_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the serum creatinine measurement was performed on the day of randomization.","when_to_set_to_false":"Set to false if the measurement was not performed on the day of randomization.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was performed on the day of randomization.","meaning":"Indicates whether the serum creatinine value was measured on the day of randomization."} ;; "on the day of randomization"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not (and
           patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter@@measured_by_local_laboratory
           patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter@@measured_on_day_of_randomization
           (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 4.0)))
   :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has local laboratory serum creatinine > 4.0 milligrams per deciliter on the day of randomization."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_finding_of_renal_artery_stenosis_now@@not_amenable_for_treatment_with_stent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal artery stenosis is not amenable for treatment with a stent.","when_to_set_to_false":"Set to false if the patient's current renal artery stenosis is amenable for treatment with a stent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal artery stenosis is amenable for treatment with a stent.","meaning":"Boolean indicating whether the patient's current renal artery stenosis is not amenable for treatment with a stent."} ;; "presence of a renal artery stenosis not amenable for treatment with a stent"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@not_amenable_for_treatment_with_stent
      patient_has_finding_of_renal_artery_stenosis_now)
:named REQ21_AUXILIARY0)) ;; "presence of a renal artery stenosis not amenable for treatment with a stent"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@known_to_be_present_prior_to_randomization
      patient_has_finding_of_renal_artery_stenosis_now)
:named REQ21_AUXILIARY1)) ;; "the renal artery stenosis is known to be present prior to randomization"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not (and patient_has_finding_of_renal_artery_stenosis_now@@not_amenable_for_treatment_with_stent
             patient_has_finding_of_renal_artery_stenosis_now@@known_to_be_present_prior_to_randomization))
:named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (presence of a renal artery stenosis not amenable for treatment with a stent) AND (the renal artery stenosis is known to be present prior to randomization)."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const index_lesion_length_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured length in millimeters if the index lesion length is recorded at the current time.","when_to_set_to_null":"Set to null if the index lesion length is not recorded, unknown, or cannot be determined at the current time.","meaning":"Numeric value representing the length of the index lesion in millimeters, recorded at the current time."} ;; "index lesion length > 18 millimeters"
(declare-const index_lesion_length_value_recorded_now_withunit_millimeter@@cannot_be_treated_with_single_stent Bool) ;; {"when_to_set_to_true":"Set to true if the index lesion cannot be treated with a single stent.","when_to_set_to_false":"Set to false if the index lesion can be treated with a single stent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the index lesion can be treated with a single stent.","meaning":"Boolean indicating whether the index lesion cannot be treated with a single stent."} ;; "index lesion that cannot be treated with a single stent"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Exhaustive subcategory: "cannot be treated with a single stent" ≡ "index lesion length > 18 millimeters"
(assert
(! (= index_lesion_length_value_recorded_now_withunit_millimeter@@cannot_be_treated_with_single_stent
     (> index_lesion_length_value_recorded_now_withunit_millimeter 18))
   :named REQ22_AUXILIARY0)) ;; "i.e., the index lesion length > 18 millimeters"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not index_lesion_length_value_recorded_now_withunit_millimeter@@cannot_be_treated_with_single_stent)
   :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an index lesion that cannot be treated with a single stent (i.e., the index lesion length > 18 millimeters)"

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const stent_placement_will_cover_renal_artery_branch Bool) ;; {"when_to_set_to_true":"Set to true if the placement of a stent will result in a renal artery branch being covered by the stent.","when_to_set_to_false":"Set to false if the placement of a stent will not result in a renal artery branch being covered by the stent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the placement of a stent will result in a renal artery branch being covered by the stent.","meaning":"Boolean indicating whether the placement of a stent will necessitate covering a renal artery branch with a stent."} ;; "the placement of a stent will necessitate covering a renal artery branch with a stent."

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not stent_placement_will_cover_renal_artery_branch)
:named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the placement of a stent will necessitate covering a renal artery branch with a stent."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const artery_diameter_value_recorded_now_withunit_millimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value of the artery diameter in millimeters as recorded now.","when_to_set_to_null":"Set to null if the artery diameter in millimeters is unknown, not documented, or cannot be determined as recorded now.","meaning":"Numeric value representing the diameter of an artery in millimeters as recorded now."} ;; "artery with diameter < 3.5 millimeters"
(declare-const artery_has_finding_of_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the artery currently has stenosis.","when_to_set_to_false":"Set to false if the artery currently does not have stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the artery currently has stenosis.","meaning":"Boolean indicating whether the artery currently has stenosis."} ;; "has stenosis in an artery"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not (and artery_has_finding_of_stenosis_now
             (< artery_diameter_value_recorded_now_withunit_millimeters 3.5)))
   :named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has stenosis in an artery with diameter < 3.5 millimeters."
