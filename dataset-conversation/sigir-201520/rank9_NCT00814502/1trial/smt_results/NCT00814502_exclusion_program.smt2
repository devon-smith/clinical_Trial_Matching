;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_feeling_agitated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently agitated.","when_to_set_to_false":"Set to false if the patient is currently not agitated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently agitated.","meaning":"Boolean indicating whether the patient is currently agitated."} ;; "agitated"
(declare-const patient_has_finding_of_feeling_agitated_now@@severity_prevents_wearing_activity_monitors Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently agitated and the severity of agitation prevents the patient from being able to wear activity monitors.","when_to_set_to_false":"Set to false if the patient is currently agitated but the severity does not prevent wearing activity monitors, or if the patient is not agitated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of agitation prevents the patient from wearing activity monitors.","meaning":"Boolean indicating whether the patient's current agitation is severe enough to prevent wearing activity monitors."} ;; "too agitated to be able to wear the activity monitors"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_feeling_agitated_now@@severity_prevents_wearing_activity_monitors
      patient_has_finding_of_feeling_agitated_now)
   :named REQ0_AUXILIARY0)) ;; "too agitated to be able to wear the activity monitors"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_feeling_agitated_now@@severity_prevents_wearing_activity_monitors)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is too agitated to be able to wear the activity monitors."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_actively_suicidal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently actively suicidal.","when_to_set_to_false":"Set to false if the patient is currently not actively suicidal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently actively suicidal.","meaning":"Boolean indicating whether the patient is currently actively suicidal."} ;; "the patient is actively suicidal"
(declare-const patient_is_actively_homicidal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently actively homicidal.","when_to_set_to_false":"Set to false if the patient is currently not actively homicidal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently actively homicidal.","meaning":"Boolean indicating whether the patient is currently actively homicidal."} ;; "the patient is actively homicidal"
(declare-const clinical_treatment_team_considers_study_participation_unsuitable_for_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the clinical treatment team currently considers participation in the study to be unsuitable for the patient.","when_to_set_to_false":"Set to false if the clinical treatment team currently does not consider participation in the study to be unsuitable for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical treatment team currently considers participation in the study to be unsuitable for the patient.","meaning":"Boolean indicating whether the clinical treatment team currently considers participation in the study to be unsuitable for the patient."} ;; "the clinical treatment team considers participation in the study to be unsuitable for the patient"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_actively_suicidal_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is actively suicidal."

(assert
  (! (not patient_is_actively_homicidal_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is actively homicidal."

(assert
  (! (not clinical_treatment_team_considers_study_participation_unsuitable_for_patient_now)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the clinical treatment team considers participation in the study to be unsuitable for the patient."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_sleep_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sleep disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a sleep disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sleep disorder.","meaning":"Boolean indicating whether the patient currently has a sleep disorder."} ;; "sleep disorders"
(declare-const patient_has_finding_of_sleep_disorder_now@@primary Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sleep disorder is primary (not secondary to another condition).","when_to_set_to_false":"Set to false if the patient's current sleep disorder is not primary (i.e., it is secondary to another condition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current sleep disorder is primary.","meaning":"Boolean indicating whether the patient's current sleep disorder is primary."} ;; "primary sleep disorders"
(declare-const patient_has_finding_of_sleep_disorder_now@@untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sleep disorder is untreated (the patient is not receiving treatment for it).","when_to_set_to_false":"Set to false if the patient's current sleep disorder is being treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current sleep disorder is untreated.","meaning":"Boolean indicating whether the patient's current sleep disorder is untreated."} ;; "untreated sleep disorders"
(declare-const patient_has_finding_of_sleep_disorder_now@@primary@@untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a primary sleep disorder that is untreated (the patient is not receiving treatment for it).","when_to_set_to_false":"Set to false if the patient currently does not have a primary sleep disorder that is untreated (either no sleep disorder, or it is not primary, or it is being treated).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a primary sleep disorder that is untreated.","meaning":"Boolean indicating whether the patient currently has a primary sleep disorder that is untreated."} ;; "untreated primary sleep disorders"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definitional: untreated primary sleep disorder = sleep disorder AND primary AND untreated
(assert
(! (= patient_has_finding_of_sleep_disorder_now@@primary@@untreated
(and patient_has_finding_of_sleep_disorder_now
     patient_has_finding_of_sleep_disorder_now@@primary
     patient_has_finding_of_sleep_disorder_now@@untreated))
:named REQ2_AUXILIARY0)) ;; "untreated primary sleep disorders"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_sleep_disorder_now@@primary
       patient_has_finding_of_sleep_disorder_now)
:named REQ2_AUXILIARY1)) ;; "primary sleep disorders"

(assert
(! (=> patient_has_finding_of_sleep_disorder_now@@untreated
       patient_has_finding_of_sleep_disorder_now)
:named REQ2_AUXILIARY2)) ;; "untreated sleep disorders"

(assert
(! (=> patient_has_finding_of_sleep_disorder_now@@primary@@untreated
       patient_has_finding_of_sleep_disorder_now@@primary)
:named REQ2_AUXILIARY3)) ;; "primary sleep disorders"

(assert
(! (=> patient_has_finding_of_sleep_disorder_now@@primary@@untreated
       patient_has_finding_of_sleep_disorder_now@@untreated)
:named REQ2_AUXILIARY4)) ;; "untreated sleep disorders"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_sleep_disorder_now@@primary@@untreated)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has untreated primary sleep disorders."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_hypnotic_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to hypnotic agents at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient was not exposed to hypnotic agents at any time prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to hypnotic agents prior to enrollment.","meaning":"Boolean indicating whether the patient was exposed to hypnotic agents prior to enrollment."} ;; "the patient received hypnotic medications prior to enrollment"

(declare-const patient_is_exposed_to_hypnotic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently (i.e., during study participation) exposed to hypnotic agents (receiving hypnotic medications).","when_to_set_to_false":"Set to false if the patient is not currently exposed to hypnotic agents during study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to hypnotic agents during study participation.","meaning":"Boolean indicating whether the patient is currently exposed to hypnotic agents during study participation."} ;; "the patient receives hypnotic medications during participation in the study"

(declare-const patient_is_exposed_to_hypnotic_agent_now@@does_not_agree_to_stop_with_attending_physician_approval Bool) ;; {"when_to_set_to_true":"Set to true if the patient does NOT agree to stop receiving hypnotic agents with the approval of the attending physician.","when_to_set_to_false":"Set to false if the patient agrees to stop receiving hypnotic agents with the approval of the attending physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to stop receiving hypnotic agents with the approval of the attending physician.","meaning":"Boolean indicating whether the patient does NOT agree to stop receiving hypnotic agents with the approval of the attending physician."} ;; "the patient does NOT agree to stop receiving hypnotic medications with the approval of the attending physician"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_hypnotic_agent_now@@does_not_agree_to_stop_with_attending_physician_approval
     patient_is_exposed_to_hypnotic_agent_now)
:named REQ3_AUXILIARY0)) ;; "the patient does NOT agree to stop receiving hypnotic medications with the approval of the attending physician""

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT be currently exposed to hypnotic agents during study participation
(assert
(! (not patient_is_exposed_to_hypnotic_agent_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient receives hypnotic medications during participation in the study"

;; Exclusion: patient must NOT have BOTH prior exposure to hypnotic agents AND refusal to stop with attending physician approval
(assert
(! (not (and patient_is_exposed_to_hypnotic_agent_inthehistory
             patient_is_exposed_to_hypnotic_agent_now@@does_not_agree_to_stop_with_attending_physician_approval))
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "(the patient received hypnotic medications prior to enrollment) AND (the patient does NOT agree to stop receiving hypnotic medications with the approval of the attending physician)"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_receiving_over_the_counter_sleep_aids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving over the counter sleep aids.","when_to_set_to_false":"Set to false if the patient is currently not receiving over the counter sleep aids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving over the counter sleep aids.","meaning":"Boolean indicating whether the patient is currently receiving over the counter sleep aids."} ;; "the patient is receiving over the counter sleep aids"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_receiving_over_the_counter_sleep_aids_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving over the counter sleep aids."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding relating to alcohol drinking behavior (i.e., is using alcohol).","when_to_set_to_false":"Set to false if the patient currently does not have a finding relating to alcohol drinking behavior (i.e., is not using alcohol).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding relating to alcohol drinking behavior.","meaning":"Boolean indicating whether the patient currently has a finding relating to alcohol drinking behavior."} ;; "alcohol use"
(declare-const patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now@@cannot_commit_to_abstaining_while_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient cannot commit to abstaining from alcohol use while in the study.","when_to_set_to_false":"Set to false if the patient can commit to abstaining from alcohol use while in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can commit to abstaining from alcohol use while in the study.","meaning":"Boolean indicating whether the patient cannot commit to abstaining from alcohol use while in the study."} ;; "cannot commit to abstaining from alcohol use while in the study"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now@@cannot_commit_to_abstaining_while_in_study
       patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now)
   :named REQ5_AUXILIARY0)) ;; "cannot commit to abstaining from alcohol use while in the study"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now@@cannot_commit_to_abstaining_while_in_study)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient cannot commit to abstaining from alcohol use while in the study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_anaphylaxis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented anaphylactic reaction (anaphylaxis) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented anaphylactic reaction (anaphylaxis) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an anaphylactic reaction (anaphylaxis).","meaning":"Boolean indicating whether the patient has ever had anaphylaxis (anaphylactic reaction) at any time in the past."} ;; "anaphylactic reaction"
(declare-const patient_has_finding_of_anaphylaxis_inthehistory@@associated_with_zolpidem_controlled_release Bool) ;; {"when_to_set_to_true":"Set to true if the patient's anaphylactic reaction (anaphylaxis) was associated with Zolpidem Controlled Release.","when_to_set_to_false":"Set to false if the patient's anaphylactic reaction (anaphylaxis) was not associated with Zolpidem Controlled Release.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anaphylactic reaction (anaphylaxis) was associated with Zolpidem Controlled Release.","meaning":"Boolean indicating whether the patient's anaphylactic reaction (anaphylaxis) was associated with Zolpidem Controlled Release."} ;; "anaphylactic reaction with Zolpidem Controlled Release"
(declare-const patient_has_finding_of_angioedema_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented angioedema at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented angioedema at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had angioedema.","meaning":"Boolean indicating whether the patient has ever had angioedema at any time in the past."} ;; "angioedema"
(declare-const patient_has_finding_of_angioedema_inthehistory@@associated_with_zolpidem_controlled_release Bool) ;; {"when_to_set_to_true":"Set to true if the patient's angioedema was associated with Zolpidem Controlled Release.","when_to_set_to_false":"Set to false if the patient's angioedema was not associated with Zolpidem Controlled Release.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angioedema was associated with Zolpidem Controlled Release.","meaning":"Boolean indicating whether the patient's angioedema was associated with Zolpidem Controlled Release."} ;; "angioedema with Zolpidem Controlled Release"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_anaphylaxis_inthehistory@@associated_with_zolpidem_controlled_release
      patient_has_finding_of_anaphylaxis_inthehistory)
:named REQ6_AUXILIARY0)) ;; "anaphylactic reaction with Zolpidem Controlled Release"

(assert
(! (=> patient_has_finding_of_angioedema_inthehistory@@associated_with_zolpidem_controlled_release
      patient_has_finding_of_angioedema_inthehistory)
:named REQ6_AUXILIARY1)) ;; "angioedema with Zolpidem Controlled Release"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_has_finding_of_anaphylaxis_inthehistory@@associated_with_zolpidem_controlled_release
            patient_has_finding_of_angioedema_inthehistory@@associated_with_zolpidem_controlled_release))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a known anaphylactic reaction with Zolpidem Controlled Release) OR (the patient has a known angioedema with Zolpidem Controlled Release))."
