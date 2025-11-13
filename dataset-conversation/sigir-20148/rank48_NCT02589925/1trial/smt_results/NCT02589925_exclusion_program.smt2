;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_clinically_significant_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinically significant depression.","when_to_set_to_false":"Set to false if the patient currently does not have clinically significant depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinically significant depression.","meaning":"Boolean indicating whether the patient currently has clinically significant depression."} ;; "clinically significant depression"
(declare-const patient_has_finding_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of delirium (acute confusional state).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of delirium (acute confusional state).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has delirium (acute confusional state).","meaning":"Boolean indicating whether the patient currently has delirium (acute confusional state)."} ;; "acute confusional state (delirium)"
(declare-const patient_has_finding_of_psychosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ongoing psychosis.","when_to_set_to_false":"Set to false if the patient currently does not have ongoing psychosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ongoing psychosis.","meaning":"Boolean indicating whether the patient currently has ongoing psychosis."} ;; "ongoing psychosis"
(declare-const patient_has_significant_psychiatric_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any psychiatric problem that is considered significant (e.g., acute confusional state, ongoing psychosis, clinically significant depression, or other significant psychiatric conditions).","when_to_set_to_false":"Set to false if the patient currently does not have any significant psychiatric problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any significant psychiatric problem.","meaning":"Boolean indicating whether the patient currently has any significant psychiatric problem."} ;; "any significant psychiatric problem"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_delirium_now
           patient_has_finding_of_psychosis_now
           patient_has_finding_of_clinically_significant_depression_now)
       patient_has_significant_psychiatric_problem_now)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((acute confusional state (delirium)) OR (ongoing psychosis) OR (clinically significant depression))."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_significant_psychiatric_problem_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any significant psychiatric problem with non-exhaustive examples ((acute confusional state (delirium)) OR (ongoing psychosis) OR (clinically significant depression))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_drug_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has drug abuse.","meaning":"Boolean indicating whether the patient currently has drug abuse."} ;; "any current drug abuse"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "any current alcohol abuse"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_drug_abuse_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any current drug abuse."

(assert
  (! (not patient_has_finding_of_alcohol_abuse_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any current alcohol abuse."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_seizure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of seizure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of seizure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of seizure.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of seizure."} ;; "seizure"
(declare-const patient_has_finding_of_seizure_inthehistory@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of seizure is recurrent (i.e., more than one episode).","when_to_set_to_false":"Set to false if the patient's history of seizure is not recurrent (i.e., only a single episode or not specified as recurrent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of seizure is recurrent.","meaning":"Boolean indicating whether the patient's history of seizure is recurrent."} ;; "any history of recurrent seizure"
(declare-const patient_has_finding_of_seizure_inthehistory@@unprovoked Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of seizure is unprovoked (i.e., not caused by an acute identifiable trigger).","when_to_set_to_false":"Set to false if the patient's history of seizure is not unprovoked (i.e., provoked or not specified as unprovoked).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of seizure is unprovoked.","meaning":"Boolean indicating whether the patient's history of seizure is unprovoked."} ;; "any history of unprovoked seizure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_seizure_inthehistory@@recurrent
       patient_has_finding_of_seizure_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "any history of recurrent seizure"

(assert
(! (=> patient_has_finding_of_seizure_inthehistory@@unprovoked
       patient_has_finding_of_seizure_inthehistory)
   :named REQ2_AUXILIARY1)) ;; "any history of unprovoked seizure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_seizure_inthehistory@@recurrent)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any history of recurrent seizure."

(assert
(! (not patient_has_finding_of_seizure_inthehistory@@unprovoked)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any history of unprovoked seizure."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_movement_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a movement disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a movement disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a movement disorder.","meaning":"Boolean indicating whether the patient has ever had a movement disorder in their history."} ;; "movement disorder"

(declare-const patient_has_finding_of_movement_disorder_inthehistory@@treatment_involved_intracranial_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a movement disorder and the treatment for that movement disorder involved intracranial surgery.","when_to_set_to_false":"Set to false if the patient has ever had a movement disorder but the treatment did not involve intracranial surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the treatment for movement disorder involved intracranial surgery.","meaning":"Boolean indicating whether the patient's movement disorder treatment involved intracranial surgery."} ;; "any prior movement disorder treatment that involved intracranial surgery"

(declare-const patient_has_finding_of_movement_disorder_inthehistory@@treatment_involved_device_implantation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a movement disorder and the treatment for that movement disorder involved device implantation.","when_to_set_to_false":"Set to false if the patient has ever had a movement disorder but the treatment did not involve device implantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the treatment for movement disorder involved device implantation.","meaning":"Boolean indicating whether the patient's movement disorder treatment involved device implantation."} ;; "any prior movement disorder treatment that involved device implantation"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_movement_disorder_inthehistory@@treatment_involved_intracranial_surgery
      patient_has_finding_of_movement_disorder_inthehistory)
:named REQ3_AUXILIARY0)) ;; "any prior movement disorder treatment that involved intracranial surgery"

(assert
(! (=> patient_has_finding_of_movement_disorder_inthehistory@@treatment_involved_device_implantation
      patient_has_finding_of_movement_disorder_inthehistory)
:named REQ3_AUXILIARY1)) ;; "any prior movement disorder treatment that involved device implantation"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_movement_disorder_inthehistory@@treatment_involved_intracranial_surgery)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any prior movement disorder treatment that involved intracranial surgery."

(assert
(! (not patient_has_finding_of_movement_disorder_inthehistory@@treatment_involved_device_implantation)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any prior movement disorder treatment that involved device implantation."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_neurostimulation_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a neurostimulation procedure at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a neurostimulation procedure at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a neurostimulation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a neurostimulation procedure in their history."} ;; "neurostimulation"
(declare-const patient_has_undergone_neurostimulation_procedure_inthehistory@@intolerance Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a neurostimulation procedure and experienced intolerance to it.","when_to_set_to_false":"Set to false if the patient has undergone neurostimulation procedures but has not experienced intolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether intolerance occurred during any neurostimulation procedure.","meaning":"Boolean indicating whether intolerance to neurostimulation procedure occurred."} ;; "neurostimulation intolerance"
(declare-const patient_has_undergone_neurostimulation_procedure_inthehistory@@any_area_of_body Bool) ;; {"when_to_set_to_true":"Set to true if intolerance to neurostimulation procedure occurred in any area of the body.","when_to_set_to_false":"Set to false if intolerance only occurred in specific areas or did not occur at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether intolerance occurred in any area of the body.","meaning":"Boolean indicating whether intolerance to neurostimulation procedure occurred in any area of the body."} ;; "in any area of the body"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_neurostimulation_procedure_inthehistory@@intolerance
      patient_has_undergone_neurostimulation_procedure_inthehistory)
:named REQ4_AUXILIARY0)) ;; "intolerance to neurostimulation procedure implies neurostimulation procedure in history"

(assert
(! (=> patient_has_undergone_neurostimulation_procedure_inthehistory@@any_area_of_body
      patient_has_undergone_neurostimulation_procedure_inthehistory@@intolerance)
:named REQ4_AUXILIARY1)) ;; "intolerance in any area of the body implies intolerance to neurostimulation procedure"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_neurostimulation_procedure_inthehistory@@any_area_of_body)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of neurostimulation intolerance in any area of the body."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_significant_medical_condition_likely_to_interfere_with_study_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any significant medical condition that is likely to interfere with study procedures.","when_to_set_to_false":"Set to false if the patient currently does not have any significant medical condition that is likely to interfere with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any significant medical condition that is likely to interfere with study procedures.","meaning":"Boolean indicating whether the patient currently has any significant medical condition that is likely to interfere with study procedures."} ;; "any significant medical condition that is likely to interfere with study procedures"

(declare-const patient_has_significant_medical_condition_likely_to_confound_evaluation_of_study_endpoints_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any significant medical condition that is likely to confound evaluation of study endpoints.","when_to_set_to_false":"Set to false if the patient currently does not have any significant medical condition that is likely to confound evaluation of study endpoints.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any significant medical condition that is likely to confound evaluation of study endpoints.","meaning":"Boolean indicating whether the patient currently has any significant medical condition that is likely to confound evaluation of study endpoints."} ;; "any significant medical condition that is likely to confound evaluation of study endpoints"

(declare-const patient_has_diagnosis_of_terminal_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of terminal illness.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of terminal illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of terminal illness.","meaning":"Boolean indicating whether the patient currently has a diagnosis of terminal illness."} ;; "terminal illness"

(declare-const patient_has_terminal_illness_survival_time_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's estimated survival time in months if the patient has a terminal illness.","when_to_set_to_null":"Set to null if the patient does not have a terminal illness, or if the survival time is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's estimated survival time in months if the patient has a terminal illness."} ;; "survival less than twelve months"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive example: any terminal illness with survival less than twelve months is a significant medical condition likely to interfere or confound
(assert
(! (=> (and patient_has_diagnosis_of_terminal_illness_now
            (< patient_has_terminal_illness_survival_time_value_recorded_now_in_months 12))
     (or patient_has_significant_medical_condition_likely_to_interfere_with_study_procedures_now
         patient_has_significant_medical_condition_likely_to_confound_evaluation_of_study_endpoints_now))
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (any terminal illness with survival less than twelve months)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_has_significant_medical_condition_likely_to_interfere_with_study_procedures_now
            patient_has_significant_medical_condition_likely_to_confound_evaluation_of_study_endpoints_now))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (any significant medical condition that is likely to interfere with study procedures) OR (any significant medical condition that is likely to confound evaluation of study endpoints) with non-exhaustive examples (any terminal illness with survival less than twelve months)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_patient_entered_into_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any other trial.","when_to_set_to_false":"Set to false if the patient is not currently participating in any other trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any other trial.","meaning":"Boolean indicating whether the patient is currently participating in any other trial."} ;; "trial participation"
(declare-const patient_has_finding_of_patient_entered_into_trial_now@@not_approved_by_principal_investigators Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current participation in any other trial is NOT approved by the Principal Investigators.","when_to_set_to_false":"Set to false if the patient's current participation in any other trial is approved by the Principal Investigators.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current participation in any other trial is approved by the Principal Investigators.","meaning":"Boolean indicating whether the patient's current participation in any other trial is NOT approved by the Principal Investigators."} ;; "any other trial participation is NOT approved by the Principal Investigators"
(declare-const patient_is_undergoing_clinical_drug_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical drug trial.","when_to_set_to_false":"Set to false if the patient is not currently participating in a clinical drug trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical drug trial.","meaning":"Boolean indicating whether the patient is currently participating in a clinical drug trial."} ;; "the patient is participating in another drug trial concurrently"
(declare-const patient_is_undergoing_clinical_device_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical device trial.","when_to_set_to_false":"Set to false if the patient is not currently participating in a clinical device trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical device trial.","meaning":"Boolean indicating whether the patient is currently participating in a clinical device trial."} ;; "the patient is participating in another device trial concurrently"
(declare-const patient_is_undergoing_clinical_biologics_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical biologics trial.","when_to_set_to_false":"Set to false if the patient is not currently participating in a clinical biologics trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical biologics trial.","meaning":"Boolean indicating whether the patient is currently participating in a clinical biologics trial."} ;; "the patient is participating in another biologics trial concurrently"
(declare-const patient_has_undergone_clinical_drug_trial_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a clinical drug trial within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not participated in a clinical drug trial within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a clinical drug trial within the past 30 days.","meaning":"Boolean indicating whether the patient has participated in a clinical drug trial within the past 30 days."} ;; "the patient participated in another drug trial within the preceding thirty days"
(declare-const patient_has_undergone_clinical_device_trial_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a clinical device trial within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not participated in a clinical device trial within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a clinical device trial within the past 30 days.","meaning":"Boolean indicating whether the patient has participated in a clinical device trial within the past 30 days."} ;; "the patient participated in another device trial within the preceding thirty days"
(declare-const patient_has_undergone_clinical_biologics_trial_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a clinical biologics trial within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not participated in a clinical biologics trial within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a clinical biologics trial within the past 30 days.","meaning":"Boolean indicating whether the patient has participated in a clinical biologics trial within the past 30 days."} ;; "the patient participated in another biologics trial within the preceding thirty days"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Any specific trial participation (drug/device/biologics, now or past 30 days) implies generic trial participation
(assert
(! (=> (or patient_is_undergoing_clinical_drug_trial_now
          patient_is_undergoing_clinical_device_trial_now
          patient_is_undergoing_clinical_biologics_trial_now
          patient_has_undergone_clinical_drug_trial_inthepast30days
          patient_has_undergone_clinical_device_trial_inthepast30days
          patient_has_undergone_clinical_biologics_trial_inthepast30days)
        patient_has_finding_of_patient_entered_into_trial_now)
    :named REQ6_AUXILIARY0)) ;; "the patient is participating in another drug trial concurrently OR ... within the preceding thirty days"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_patient_entered_into_trial_now@@not_approved_by_principal_investigators
        patient_has_finding_of_patient_entered_into_trial_now)
    :named REQ6_AUXILIARY1)) ;; "any other trial participation is NOT approved by the Principal Investigators"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: If any of the listed trial participations (now or past 30 days) AND not approved by PI, patient is excluded
(assert
(! (not (and (or patient_is_undergoing_clinical_drug_trial_now
                 patient_is_undergoing_clinical_device_trial_now
                 patient_is_undergoing_clinical_biologics_trial_now
                 patient_has_undergone_clinical_drug_trial_inthepast30days
                 patient_has_undergone_clinical_device_trial_inthepast30days
                 patient_has_undergone_clinical_biologics_trial_inthepast30days)
             patient_has_finding_of_patient_entered_into_trial_now@@not_approved_by_principal_investigators))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is participating in another drug trial concurrently) OR ... within the preceding thirty days) AND (any other trial participation is NOT approved by the Principal Investigators)."

;; --- verifier-bypassed (attempt 8/8) 2025-10-25T03:34:57.975569 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has contraception.","when_to_set_to_false":"Set to false if the patient currently does not have contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has contraception.","meaning":"Boolean indicating whether the patient currently has contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@reliable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has contraception and the contraception is reliable.","when_to_set_to_false":"Set to false if the patient currently has contraception but it is not reliable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception is reliable.","meaning":"Boolean indicating whether the patient's current contraception is reliable."} ;; "reliable contraception"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_contraception_now@@reliable
      patient_has_finding_of_contraception_now)
   :named REQ7_AUXILIARY0)) ;; "contraception is reliable implies contraception"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient is excluded if (pregnant) OR (breast-feeding) OR (lacks reliable contraception)
(assert
(! (not (or patient_is_pregnant_now
            patient_is_breastfeeding_now
            (not patient_has_finding_of_contraception_now@@reliable)))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient is breast-feeding) OR (the patient lacks reliable contraception)."
