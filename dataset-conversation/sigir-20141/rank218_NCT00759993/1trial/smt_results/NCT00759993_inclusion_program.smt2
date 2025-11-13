;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_written_informed_consent_obtained Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from the patient."} // "To be included, the patient must have written informed consent obtained."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_written_informed_consent_obtained
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have written informed consent obtained."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_english_speaking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently English-speaking.","when_to_set_to_false":"Set to false if the patient is currently not English-speaking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently English-speaking.","meaning":"Boolean indicating whether the patient is currently English-speaking."} // "To be included, the patient must be English-speaking."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be aged ≥ 18 years AND ≤ 64 years."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_english_speaking_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be English-speaking."

(assert
  (! (and (>= patient_age_value_recorded_now_in_years 18)
          (<= patient_age_value_recorded_now_in_years 64))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years AND ≤ 64 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_psychotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a psychotropic agent.","when_to_set_to_false":"Set to false if the patient is not currently exposed to a psychotropic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a psychotropic agent.","meaning":"Boolean indicating whether the patient is currently exposed to a psychotropic agent."} // "be currently receiving a serotonergic agent"
(declare-const patient_is_exposed_to_psychotropic_agent_now@@is_serotonergic Bool) ;; {"when_to_set_to_true":"Set to true if the psychotropic agent the patient is currently exposed to is serotonergic.","when_to_set_to_false":"Set to false if the psychotropic agent the patient is currently exposed to is not serotonergic.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the psychotropic agent is serotonergic.","meaning":"Boolean indicating whether the psychotropic agent the patient is currently exposed to is serotonergic."} // "be currently receiving a serotonergic agent"

(declare-const patient_is_exposed_to_psychotropic_agent_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to be exposed to a psychotropic agent in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to be exposed to a psychotropic agent in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to be exposed to a psychotropic agent in the future.","meaning":"Boolean indicating whether the patient is scheduled to be exposed to a psychotropic agent in the future."} // "be scheduled to receive a new serotonergic psychotropic agent for a psychiatric condition" and "be scheduled to receive a change in serotonergic psychotropic agent for a psychiatric condition"
(declare-const patient_is_exposed_to_psychotropic_agent_inthefuture@@is_new Bool) ;; {"when_to_set_to_true":"Set to true if the psychotropic agent scheduled for future exposure is new to the patient.","when_to_set_to_false":"Set to false if the psychotropic agent scheduled for future exposure is not new to the patient.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the psychotropic agent is new.","meaning":"Boolean indicating whether the psychotropic agent scheduled for future exposure is new to the patient."} // "be scheduled to receive a new serotonergic psychotropic agent for a psychiatric condition"
(declare-const patient_is_exposed_to_psychotropic_agent_inthefuture@@is_change Bool) ;; {"when_to_set_to_true":"Set to true if the psychotropic agent scheduled for future exposure represents a change in the patient's regimen.","when_to_set_to_false":"Set to false if the psychotropic agent scheduled for future exposure does not represent a change in the patient's regimen.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the psychotropic agent represents a change.","meaning":"Boolean indicating whether the psychotropic agent scheduled for future exposure represents a change in the patient's regimen."} // "be scheduled to receive a change in serotonergic psychotropic agent for a psychiatric condition"
(declare-const patient_is_exposed_to_psychotropic_agent_inthefuture@@for_psychiatric_condition Bool) ;; {"when_to_set_to_true":"Set to true if the psychotropic agent scheduled for future exposure is for a psychiatric condition.","when_to_set_to_false":"Set to false if the psychotropic agent scheduled for future exposure is not for a psychiatric condition.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the psychotropic agent is for a psychiatric condition.","meaning":"Boolean indicating whether the psychotropic agent scheduled for future exposure is for a psychiatric condition."} // "for a psychiatric condition"

(declare-const patient_is_exposed_to_psychotropic_agent_inthefuture@@is_serotonergic@@is_new@@for_psychiatric_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to be exposed to a new serotonergic psychotropic agent in the future for a psychiatric condition.","when_to_set_to_false":"Set to false if the patient is not scheduled to be exposed to a new serotonergic psychotropic agent in the future for a psychiatric condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to be exposed to a new serotonergic psychotropic agent in the future for a psychiatric condition.","meaning":"Boolean indicating whether the patient is scheduled to be exposed to a new serotonergic psychotropic agent in the future for a psychiatric condition."} // "be scheduled to receive a new serotonergic psychotropic agent for a psychiatric condition"
(declare-const patient_is_exposed_to_psychotropic_agent_inthefuture@@is_serotonergic@@is_change@@for_psychiatric_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to have a change in serotonergic psychotropic agent in the future for a psychiatric condition.","when_to_set_to_false":"Set to false if the patient is not scheduled to have a change in serotonergic psychotropic agent in the future for a psychiatric condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to have a change in serotonergic psychotropic agent in the future for a psychiatric condition.","meaning":"Boolean indicating whether the patient is scheduled to have a change in serotonergic psychotropic agent in the future for a psychiatric condition."} // "be scheduled to receive a change in serotonergic psychotropic agent for a psychiatric condition"

(declare-const patient_has_been_on_stable_regimen_of_serotonergic_psychotropic_agent_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been on a stable regimen of serotonergic psychotropic agent in the past 3 months.","when_to_set_to_false":"Set to false if the patient has not been on a stable regimen of serotonergic psychotropic agent in the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable regimen of serotonergic psychotropic agent in the past 3 months.","meaning":"Boolean indicating whether the patient has been on a stable regimen of serotonergic psychotropic agent in the past 3 months."} // "be able to document that the patient has been on a stable regimen of serotonergic psychotropic agent"
(declare-const patient_has_been_on_stable_regimen_of_serotonergic_psychotropic_agent_inthepast3months@@without_any_weight_gain_as_a_result Bool) ;; {"when_to_set_to_true":"Set to true if the stable regimen of serotonergic psychotropic agent in the past 3 months has not resulted in any weight gain.","when_to_set_to_false":"Set to false if the stable regimen of serotonergic psychotropic agent in the past 3 months has resulted in weight gain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stable regimen of serotonergic psychotropic agent in the past 3 months has resulted in weight gain.","meaning":"Boolean indicating whether the stable regimen of serotonergic psychotropic agent in the past 3 months has not resulted in any weight gain."} // "without any weight gain in the last 3 months as a result"

(declare-const patient_has_finding_of_weight_increased_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had the clinical finding of weight gain in the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had the clinical finding of weight gain in the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had the clinical finding of weight gain in the past 3 months.","meaning":"Boolean indicating whether the patient has had weight gain in the past 3 months."} // "without any weight gain in the last 3 months as a result"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable for current serotonergic exposure
(assert
  (! (=> patient_is_exposed_to_psychotropic_agent_now@@is_serotonergic
         patient_is_exposed_to_psychotropic_agent_now)
     :named REQ2_AUXILIARY0)) ;; "be currently receiving a serotonergic agent"

;; Qualifier variable implies stem variable for future new serotonergic agent for psychiatric condition
(assert
  (! (=> patient_is_exposed_to_psychotropic_agent_inthefuture@@is_serotonergic@@is_new@@for_psychiatric_condition
         (and patient_is_exposed_to_psychotropic_agent_inthefuture
              patient_is_exposed_to_psychotropic_agent_inthefuture@@is_new
              patient_is_exposed_to_psychotropic_agent_inthefuture@@for_psychiatric_condition))
     :named REQ2_AUXILIARY1)) ;; "be scheduled to receive a new serotonergic psychotropic agent for a psychiatric condition"

;; Qualifier variable implies stem variable for future change in serotonergic agent for psychiatric condition
(assert
  (! (=> patient_is_exposed_to_psychotropic_agent_inthefuture@@is_serotonergic@@is_change@@for_psychiatric_condition
         (and patient_is_exposed_to_psychotropic_agent_inthefuture
              patient_is_exposed_to_psychotropic_agent_inthefuture@@is_change
              patient_is_exposed_to_psychotropic_agent_inthefuture@@for_psychiatric_condition))
     :named REQ2_AUXILIARY2)) ;; "be scheduled to receive a change in serotonergic psychotropic agent for a psychiatric condition"

;; Qualifier variable implies stem variable for stable regimen without weight gain
(assert
  (! (=> patient_has_been_on_stable_regimen_of_serotonergic_psychotropic_agent_inthepast3months@@without_any_weight_gain_as_a_result
         patient_has_been_on_stable_regimen_of_serotonergic_psychotropic_agent_inthepast3months)
     :named REQ2_AUXILIARY3)) ;; "be able to document that the patient has been on a stable regimen of serotonergic psychotropic agent without any weight gain in the last 3 months as a result"

;; ===================== Constraint Assertions (REQ 2) =====================
;; At least one of the four conditions must be satisfied for inclusion
(assert
  (! (or patient_is_exposed_to_psychotropic_agent_now@@is_serotonergic
         patient_is_exposed_to_psychotropic_agent_inthefuture@@is_serotonergic@@is_new@@for_psychiatric_condition
         patient_is_exposed_to_psychotropic_agent_inthefuture@@is_serotonergic@@is_change@@for_psychiatric_condition
         patient_has_been_on_stable_regimen_of_serotonergic_psychotropic_agent_inthepast3months@@without_any_weight_gain_as_a_result)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be currently receiving a serotonergic agent) OR (be scheduled to receive a new serotonergic psychotropic agent for a psychiatric condition) OR (be scheduled to receive a change in serotonergic psychotropic agent for a psychiatric condition) OR (be able to document that the patient has been on a stable regimen of serotonergic psychotropic agent without any weight gain in the last 3 months as a result))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_capacity_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the capacity to give informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the capacity to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the capacity to give informed consent.","meaning":"Boolean indicating whether the patient currently has the capacity to give informed consent."} // "To be included, the patient must have the capacity to give informed consent."
(declare-const patient_has_capacity_to_obtain_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the capacity to obtain informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the capacity to obtain informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the capacity to obtain informed consent.","meaning":"Boolean indicating whether the patient currently has the capacity to obtain informed consent."} // "To be included, the patient must have the capacity to obtain informed consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_capacity_to_obtain_informed_consent_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have the capacity to obtain informed consent."

(assert
  (! patient_has_capacity_to_give_informed_consent_now
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have the capacity to give informed consent."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_weight_increased_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of weight increased (weight gain).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of weight increased (weight gain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of weight increased (weight gain).","meaning":"Boolean indicating whether the patient currently has a clinical finding of weight increased (weight gain)."} // "weight gain"
(declare-const patient_has_finding_of_weight_increased_now@@concern_as_potential_side_effect_of_serotonin Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently expresses concern about weight gain specifically as a potential side effect of serotonin.","when_to_set_to_false":"Set to false if the patient currently expresses concern about weight gain but not as a potential side effect of serotonin, or if the concern is unrelated to serotonin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's concern about weight gain is specifically as a potential side effect of serotonin.","meaning":"Boolean indicating whether the patient's concern about weight gain is specifically as a potential side effect of serotonin."} // "express concern about weight gain as a potential side effect of serotonin"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_weight_increased_now@@concern_as_potential_side_effect_of_serotonin
         patient_has_finding_of_weight_increased_now)
     :named REQ4_AUXILIARY0)) ;; "express concern about weight gain as a potential side effect of serotonin" implies "weight gain"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_weight_increased_now@@concern_as_potential_side_effect_of_serotonin
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must express concern about weight gain as a potential side effect of serotonin."

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_is_in_good_health_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in good health.","when_to_set_to_false":"Set to false if the patient is currently not in good health.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in good health.","meaning":"Boolean indicating whether the patient is currently in good health."} // "be in good health as determined by medical history AND psychiatric history AND medical examination"
(declare-const patient_is_in_good_health_now@@as_determined_by_medical_history_and_psychiatric_history_and_medical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current good health is determined by medical history, psychiatric history, and medical examination.","when_to_set_to_false":"Set to false if the patient's current good health is not determined by medical history, psychiatric history, and medical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current good health is determined by medical history, psychiatric history, and medical examination.","meaning":"Boolean indicating whether the patient's current good health is determined by medical history, psychiatric history, and medical examination."} // "be in good health as determined by medical history AND psychiatric history AND medical examination"
(declare-const patient_has_undergone_medical_history_taking_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone medical history taking at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone medical history taking at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone medical history taking at any time in the past.","meaning":"Boolean indicating whether the patient has ever undergone medical history taking at any time in the past."} // "medical history"
(declare-const patient_has_undergone_history_taking_mental_health_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone psychiatric history taking (history taking of mental health) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone psychiatric history taking (history taking of mental health) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone psychiatric history taking (history taking of mental health).","meaning":"Boolean indicating whether the patient has ever undergone psychiatric history taking (history taking of mental health) at any time in the past."} // "psychiatric history"
(declare-const patient_has_undergone_medical_examination_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a medical examination at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a medical examination at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a medical examination at any time in the past.","meaning":"Boolean indicating whether the patient has ever undergone a medical examination at any time in the past."} // "medical examination"
(declare-const patient_has_finding_of_serious_physical_health_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious physical health problem (major medical illness).","when_to_set_to_false":"Set to false if the patient currently does not have a serious physical health problem (major medical illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious physical health problem (major medical illness).","meaning":"Boolean indicating whether the patient currently has a serious physical health problem (major medical illness)."} // "major medical illness"
(declare-const patient_has_finding_of_serious_physical_health_problem_now@@would_jeopardize_patient_health_during_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current serious physical health problem (major medical illness) would jeopardize the patient's health during the study.","when_to_set_to_false":"Set to false if the patient's current serious physical health problem (major medical illness) would not jeopardize the patient's health during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current serious physical health problem (major medical illness) would jeopardize the patient's health during the study.","meaning":"Boolean indicating whether the patient's current serious physical health problem (major medical illness) would jeopardize the patient's health during the study."} // "major medical illness that would jeopardize patient health during the study"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_in_good_health_now@@as_determined_by_medical_history_and_psychiatric_history_and_medical_examination
         patient_is_in_good_health_now)
     :named REQ5_AUXILIARY0)) ;; "be in good health as determined by medical history AND psychiatric history AND medical examination"

;; Qualifier variable for major medical illness implies stem variable
(assert
  (! (=> patient_has_finding_of_serious_physical_health_problem_now@@would_jeopardize_patient_health_during_the_study
         patient_has_finding_of_serious_physical_health_problem_now)
     :named REQ5_AUXILIARY1)) ;; "major medical illness that would jeopardize patient health during the study"

;; Good health as determined by all three: medical history, psychiatric history, and medical examination
(assert
  (! (= patient_is_in_good_health_now@@as_determined_by_medical_history_and_psychiatric_history_and_medical_examination
        (and patient_has_undergone_medical_history_taking_in_the_history
             patient_has_undergone_history_taking_mental_health_inthehistory
             patient_has_undergone_medical_examination_in_the_history
             patient_is_in_good_health_now))
     :named REQ5_AUXILIARY2)) ;; "be in good health as determined by medical history AND psychiatric history AND medical examination"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: patient must be in good health as determined by medical history AND psychiatric history AND medical examination
(assert
  (! patient_is_in_good_health_now@@as_determined_by_medical_history_and_psychiatric_history_and_medical_examination
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be in good health as determined by medical history AND psychiatric history AND medical examination"

;; Component 1: patient must NOT have a major medical illness that would jeopardize patient health during the study
(assert
  (! (not patient_has_finding_of_serious_physical_health_problem_now@@would_jeopardize_patient_health_during_the_study)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT have a major medical illness that would jeopardize patient health during the study"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} // "if the patient is a woman"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential (e.g., postmenopausal, surgically sterile).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient currently has the potential for childbearing."} // "be of nonchildbearing potential"
(declare-const patient_has_finding_of_postmenopausal_state_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has postmenopausal status.","when_to_set_to_false":"Set to false if the patient currently does not have postmenopausal status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has postmenopausal status.","meaning":"Boolean indicating whether the patient currently has postmenopausal status."} // "postmenopausal status"
(declare-const patient_has_finding_of_surgically_sterile_status_by_hysterectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically sterile by hysterectomy.","when_to_set_to_false":"Set to false if the patient is currently not surgically sterile by hysterectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically sterile by hysterectomy.","meaning":"Boolean indicating whether the patient is currently surgically sterile by hysterectomy."} // "surgically sterile status by hysterectomy"
(declare-const patient_has_finding_of_surgically_sterile_status_by_tubal_ligation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically sterile by tubal ligation.","when_to_set_to_false":"Set to false if the patient is currently not surgically sterile by tubal ligation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically sterile by tubal ligation.","meaning":"Boolean indicating whether the patient is currently surgically sterile by tubal ligation."} // "surgically sterile status by tubal ligation"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to become pregnant.","when_to_set_to_false":"Set to false if the patient is currently not able to become pregnant (e.g., due to sterilization, menopause).","when_to_set_to_null":"Set to null if the patient's ability to become pregnant is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently able to become pregnant."} // "the patient must ... use a reliable medically accepted form of contraception ... for ≥ 60 days before the baseline visit"
(declare-const patient_has_finding_of_oral_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using oral contraceptives.","when_to_set_to_false":"Set to false if the patient is currently not using oral contraceptives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using oral contraceptives.","meaning":"Boolean indicating whether the patient is currently using oral contraceptives."} // "oral contraceptives"
(declare-const patient_has_finding_of_subcutaneous_contraceptive_implant_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a subcutaneous contraceptive implant present.","when_to_set_to_false":"Set to false if the patient currently does not have a subcutaneous contraceptive implant present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a subcutaneous contraceptive implant present.","meaning":"Boolean indicating whether the patient currently has a subcutaneous contraceptive implant present."} // "implanted contraceptives"
(declare-const patient_has_finding_of_contraception_using_injectable_contraceptive_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using injectable contraceptive medication.","when_to_set_to_false":"Set to false if the patient is currently not using injectable contraceptive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using injectable contraceptive medication.","meaning":"Boolean indicating whether the patient is currently using injectable contraceptive medication."} // "injected contraceptives"
(declare-const patient_has_finding_of_iud_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intrauterine device (IUD) in place.","when_to_set_to_false":"Set to false if the patient currently does not have an intrauterine device (IUD) in place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intrauterine device (IUD) in place.","meaning":"Boolean indicating whether the patient currently has an intrauterine device (IUD) in place."} // "intrauterine device"
(declare-const patient_has_finding_of_double_barrier_contraception_with_spermicide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an adequate double-barrier method of contraception in conjunction with spermicide.","when_to_set_to_false":"Set to false if the patient is currently not using an adequate double-barrier method of contraception in conjunction with spermicide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an adequate double-barrier method of contraception in conjunction with spermicide.","meaning":"Boolean indicating whether the patient is currently using an adequate double-barrier method of contraception in conjunction with spermicide."} // "adequate double-barrier method in conjunction with spermicide"
(declare-const patient_is_practicing_abstinence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing abstinence.","when_to_set_to_false":"Set to false if the patient is currently not practicing abstinence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently practicing abstinence.","meaning":"Boolean indicating whether the patient is currently practicing abstinence."} // "abstinence"
(declare-const patient_has_finding_of_contraception_duration_before_baseline_visit_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient has used a reliable medically accepted form of contraception before the baseline visit.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days the patient has used a reliable medically accepted form of contraception before the baseline visit."} // "for ≥ 60 days before the baseline visit"
(declare-const patient_has_finding_of_iud_contraception_duration_before_baseline_visit_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient has had an intrauterine device (IUD) in place before the baseline visit.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days the patient has had an intrauterine device (IUD) in place before the baseline visit."} // "intrauterine device in place for ≥ 3 months"
(declare-const patient_agrees_to_continue_contraception_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to continue using a reliable medically accepted form of contraception throughout the duration of the study.","when_to_set_to_false":"Set to false if the patient does not agree to continue using a reliable medically accepted form of contraception throughout the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to continue using contraception throughout the study.","meaning":"Boolean indicating whether the patient agrees to continue using a reliable medically accepted form of contraception throughout the duration of the study."} // "agree to continue such use throughout the duration of the study"
(declare-const patient_agrees_to_continue_contraception_for_30_days_after_final_study_drug_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to continue using a reliable medically accepted form of contraception for 30 days after the final dose of study drug.","when_to_set_to_false":"Set to false if the patient does not agree to continue using a reliable medically accepted form of contraception for 30 days after the final dose of study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to continue using contraception for 30 days after the final dose of study drug.","meaning":"Boolean indicating whether the patient agrees to continue using a reliable medically accepted form of contraception for 30 days after the final dose of study drug."} // "agree to continue such use for 30 days after the final dose of study drug"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Exhaustive subcategories for nonchildbearing potential
(assert
  (! (= (not patient_has_childbearing_potential_now)
        (or patient_has_finding_of_postmenopausal_state_now
            patient_has_finding_of_surgically_sterile_status_by_hysterectomy_now
            patient_has_finding_of_surgically_sterile_status_by_tubal_ligation_now))
     :named REQ6_AUXILIARY0)) ;; "be of nonchildbearing potential (with exhaustive subcategories (postmenopausal status OR surgically sterile status by hysterectomy OR surgically sterile status by tubal ligation))"

;; Non-exhaustive examples for reliable contraception
(assert
  (! (=> (or patient_has_finding_of_oral_contraception_now
             patient_has_finding_of_subcutaneous_contraceptive_implant_present_now
             patient_has_finding_of_contraception_using_injectable_contraceptive_medication_now
             patient_has_finding_of_iud_contraception_now
             patient_has_finding_of_double_barrier_contraception_with_spermicide_now
             patient_is_practicing_abstinence_now)
         patient_is_able_to_be_pregnant_now)
     :named REQ6_AUXILIARY1)) ;; "use a reliable medically accepted form of contraception (with non-exhaustive examples ...)"

;; IUD duration for reliable contraception (≥ 3 months = 90 days)
(assert
  (! (=> (and patient_has_finding_of_iud_contraception_now
              (>= patient_has_finding_of_iud_contraception_duration_before_baseline_visit_value_recorded_in_days 90))
         patient_is_able_to_be_pregnant_now)
     :named REQ6_AUXILIARY2)) ;; "intrauterine device in place for ≥ 3 months"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Main inclusion logic for women: must be of nonchildbearing potential OR meet all contraception requirements
(assert
  (! (or
        (not patient_sex_is_female_now)
        (or
          (not patient_has_childbearing_potential_now)
          (and
            (>= patient_has_finding_of_contraception_duration_before_baseline_visit_value_recorded_in_days 60) ;; "for ≥ 60 days before the baseline visit"
            patient_agrees_to_continue_contraception_throughout_study ;; "agree to continue such use throughout the duration of the study"
            patient_agrees_to_continue_contraception_for_30_days_after_final_study_drug_dose ;; "agree to continue such use for 30 days after the final dose of study drug"
          )
        )
     )
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, if the patient is a woman, the patient must ((be of nonchildbearing potential ...) OR ((use a reliable medically accepted form of contraception ... for ≥ 60 days before the baseline visit) AND (agree to continue such use throughout the duration of the study) AND (agree to continue such use for 30 days after the final dose of study drug)))"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_undergone_urine_pregnancy_test_for_beta_human_chorionic_gonadotropin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine pregnancy test for beta human chorionic gonadotropin (beta hCG) at the current time.","when_to_set_to_false":"Set to false if the patient has not undergone a urine pregnancy test for beta human chorionic gonadotropin (beta hCG) at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a urine pregnancy test for beta human chorionic gonadotropin (beta hCG) at the current time.","meaning":"Boolean indicating whether the patient has undergone a urine pregnancy test for beta human chorionic gonadotropin (beta hCG) at the current time."} // "be given a urine pregnancy test (beta human chorionic gonadotropin)"
(declare-const patient_is_at_least_2_years_postmenopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently at least 2 years postmenopausal.","when_to_set_to_false":"Set to false if the patient is currently less than 2 years postmenopausal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is at least 2 years postmenopausal.","meaning":"Boolean indicating whether the patient is currently at least 2 years postmenopausal."} // "be at least 2 years postmenopausal"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a urine pregnancy test (beta hCG) or other reliable clinical evidence.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a urine pregnancy test (beta hCG) or other reliable clinical evidence.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "have a negative result"
(declare-const urine_pregnancy_test_for_beta_human_chorionic_gonadotropin_result_value_now_withunit_milli_international_units_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the urine pregnancy test for beta human chorionic gonadotropin (beta hCG) result at the current time, measured in mIU/mL.","when_to_set_to_null":"Set to null if the result value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the result of the urine pregnancy test for beta human chorionic gonadotropin (beta hCG) at the current time, measured in mIU/mL."} // "urine pregnancy test (beta human chorionic gonadotropin) result"
(declare-const patient_has_finding_of_surgically_sterile_status_by_hysterectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically sterile by hysterectomy.","when_to_set_to_false":"Set to false if the patient is currently not surgically sterile by hysterectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically sterile by hysterectomy.","meaning":"Boolean indicating whether the patient is currently surgically sterile by hysterectomy."} // "surgically sterile status by hysterectomy"
(declare-const patient_has_finding_of_surgically_sterile_status_by_tubal_ligation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically sterile by tubal ligation.","when_to_set_to_false":"Set to false if the patient is currently not surgically sterile by tubal ligation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically sterile by tubal ligation.","meaning":"Boolean indicating whether the patient is currently surgically sterile by tubal ligation."} // "surgically sterile status by tubal ligation"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Being at least 2 years postmenopausal implies postmenopausal state
(assert
  (! (=> patient_is_at_least_2_years_postmenopausal_now
         patient_has_finding_of_postmenopausal_state_now)
     :named REQ7_AUXILIARY0)) ;; "be at least 2 years postmenopausal" implies "postmenopausal state"

;; Negative urine pregnancy test result implies not pregnant (threshold: < 5 mIU/mL)
(assert
  (! (= patient_is_pregnant_now
        (>= urine_pregnancy_test_for_beta_human_chorionic_gonadotropin_result_value_now_withunit_milli_international_units_per_milliliter 5.0))
     :named REQ7_AUXILIARY1)) ;; "have a negative result" for urine pregnancy test (beta hCG)

;; ===================== Constraint Assertions (REQ 7) =====================
;; If the patient is a woman, then either:
;;   (at least 2 years postmenopausal OR surgically sterile)
;;   OR (has undergone urine pregnancy test AND is not pregnant)
(assert
  (! (or
        (not patient_sex_is_female_now)
        (or
          patient_is_at_least_2_years_postmenopausal_now
          patient_has_finding_of_surgically_sterile_status_by_hysterectomy_now
          patient_has_finding_of_surgically_sterile_status_by_tubal_ligation_now
          (and patient_has_undergone_urine_pregnancy_test_for_beta_human_chorionic_gonadotropin_now
               (not patient_is_pregnant_now))))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is a woman, the patient must ((be given a urine pregnancy test (beta human chorionic gonadotropin) AND have a negative result) UNLESS (be at least 2 years postmenopausal OR be surgically sterile))"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_willing_and_able_to_comply_with_study_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is both willing and able to comply with all study restrictions as required by the protocol.","when_to_set_to_false":"Set to false if the patient is not willing and/or not able to comply with all study restrictions as required by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing and able to comply with all study restrictions as required by the protocol.","meaning":"Boolean indicating whether the patient is both willing and able to comply with all study restrictions as required by the protocol."} // "To be included, the patient must be willing and able to comply with study restrictions."
(declare-const patient_is_able_and_willing_to_remain_at_clinic_for_required_duration_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able and willing to remain at the clinic for the required duration during the study period.","when_to_set_to_false":"Set to false if the patient is not able and/or not willing to remain at the clinic for the required duration during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able and willing to remain at the clinic for the required duration during the study period.","meaning":"Boolean indicating whether the patient is able and willing to remain at the clinic for the required duration during the study period."} // "To be included, the patient must remain at the clinic for the required duration during the study period."
(declare-const patient_is_willing_to_return_to_clinic_for_follow_up_evaluation_as_specified_in_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to return to the clinic for the follow-up evaluation as specified in the protocol.","when_to_set_to_false":"Set to false if the patient is not willing to return to the clinic for the follow-up evaluation as specified in the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to return to the clinic for the follow-up evaluation as specified in the protocol.","meaning":"Boolean indicating whether the patient is willing to return to the clinic for the follow-up evaluation as specified in the protocol."} // "To be included, the patient must be willing to return to the clinic for the follow-up evaluation as specified in this protocol."

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: Patient must be willing and able to comply with study restrictions
(assert
  (! patient_is_willing_and_able_to_comply_with_study_restrictions
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing and able to comply with study restrictions."

;; Component 1: Patient must remain at the clinic for the required duration during the study period
(assert
  (! patient_is_able_and_willing_to_remain_at_clinic_for_required_duration_during_study_period
     :named REQ8_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must remain at the clinic for the required duration during the study period."

;; Component 2: Patient must be willing to return to the clinic for the follow-up evaluation as specified in this protocol
(assert
  (! patient_is_willing_to_return_to_clinic_for_follow_up_evaluation_as_specified_in_protocol
     :named REQ8_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to return to the clinic for the follow-up evaluation as specified in this protocol."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_finding_of_hospital_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an inpatient (hospital patient).","when_to_set_to_false":"Set to false if the patient is currently not an inpatient (hospital patient).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an inpatient (hospital patient).","meaning":"Boolean indicating whether the patient is currently an inpatient (hospital patient)."} // "inpatient"
(declare-const patient_has_finding_of_hospital_patient_now@@admission_is_voluntary Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an inpatient and the admission is voluntary.","when_to_set_to_false":"Set to false if the patient is currently an inpatient and the admission is not voluntary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inpatient admission is voluntary.","meaning":"Boolean indicating whether the patient's current inpatient admission is voluntary."} // "voluntary admission"
(declare-const patient_has_finding_of_hospital_patient_now@@at_suny_upstate_medical_university_psychiatric_department Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an inpatient and the admission is at SUNY Upstate Medical University's Psychiatric department.","when_to_set_to_false":"Set to false if the patient is currently an inpatient but not at SUNY Upstate Medical University's Psychiatric department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inpatient status is at SUNY Upstate Medical University's Psychiatric department.","meaning":"Boolean indicating whether the patient's current inpatient status is at SUNY Upstate Medical University's Psychiatric department."} // "at SUNY Upstate Medical University's Psychiatric department"
(declare-const patient_has_finding_of_hospital_patient_now@@admission_is_voluntary@@at_suny_upstate_medical_university_psychiatric_department Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an inpatient, the admission is voluntary, and the inpatient status is at SUNY Upstate Medical University's Psychiatric department.","when_to_set_to_false":"Set to false if the patient is currently an inpatient, but either the admission is not voluntary or the inpatient status is not at SUNY Upstate Medical University's Psychiatric department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an inpatient with voluntary admission at SUNY Upstate Medical University's Psychiatric department.","meaning":"Boolean indicating whether the patient is currently an inpatient with voluntary admission at SUNY Upstate Medical University's Psychiatric department."} // "voluntary admission inpatient at SUNY Upstate Medical University's Psychiatric department"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_hospital_patient_now@@admission_is_voluntary
         patient_has_finding_of_hospital_patient_now)
     :named REQ9_AUXILIARY0)) ;; "voluntary admission" implies "inpatient"

(assert
  (! (=> patient_has_finding_of_hospital_patient_now@@at_suny_upstate_medical_university_psychiatric_department
         patient_has_finding_of_hospital_patient_now)
     :named REQ9_AUXILIARY1)) ;; "inpatient at SUNY Upstate Medical University's Psychiatric department" implies "inpatient"

(assert
  (! (=> patient_has_finding_of_hospital_patient_now@@admission_is_voluntary@@at_suny_upstate_medical_university_psychiatric_department
         (and patient_has_finding_of_hospital_patient_now@@admission_is_voluntary
              patient_has_finding_of_hospital_patient_now@@at_suny_upstate_medical_university_psychiatric_department))
     :named REQ9_AUXILIARY2)) ;; "voluntary admission inpatient at SUNY Upstate Medical University's Psychiatric department" implies both qualifiers

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patient_has_finding_of_hospital_patient_now@@admission_is_voluntary@@at_suny_upstate_medical_university_psychiatric_department
     :named REQ9_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a voluntary admission inpatient at SUNY Upstate Medical University's Psychiatric department."
