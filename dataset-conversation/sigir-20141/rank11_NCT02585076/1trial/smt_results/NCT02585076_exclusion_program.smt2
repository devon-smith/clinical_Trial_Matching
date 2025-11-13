;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@in_opinion_of_investigator_would_make_patient_unfit_or_compromise_data_quality Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding, and in the opinion of the investigator, this would make the patient unfit to participate in the study or compromise the quality of the study data.","when_to_set_to_false":"Set to false if the patient currently has any disease, condition, or clinical finding, but in the opinion of the investigator, this would not make the patient unfit to participate in the study or compromise the quality of the study data.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the investigator, the patient's disease, condition, or clinical finding would make the patient unfit to participate or compromise data quality.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding, and in the opinion of the investigator, this would make the patient unfit to participate in the study or compromise the quality of the study data."} ;; "condition ... in the opinion of the investigator, would make the patient unfit to participate in the study or compromise the quality of the study data"
(declare-const patient_has_circumstance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any circumstance.","when_to_set_to_false":"Set to false if the patient currently does not have any circumstance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any circumstance.","meaning":"Boolean indicating whether the patient currently has any circumstance."} ;; "circumstance"
(declare-const patient_has_circumstance_now@@in_opinion_of_investigator_would_make_patient_unfit_or_compromise_data_quality Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any circumstance, and in the opinion of the investigator, this would make the patient unfit to participate in the study or compromise the quality of the study data.","when_to_set_to_false":"Set to false if the patient currently has any circumstance, but in the opinion of the investigator, this would not make the patient unfit to participate in the study or compromise the quality of the study data.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the investigator, the patient's circumstance would make the patient unfit to participate or compromise data quality.","meaning":"Boolean indicating whether the patient currently has any circumstance, and in the opinion of the investigator, this would make the patient unfit to participate in the study or compromise the quality of the study data."} ;; "circumstance ... in the opinion of the investigator, would make the patient unfit to participate in the study or compromise the quality of the study data"
(declare-const patient_is_non_native_speaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a non-native speaker of the local language.","when_to_set_to_false":"Set to false if the patient is currently a native speaker of the local language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a non-native speaker of the local language.","meaning":"Boolean indicating whether the patient is currently a non-native speaker of the local language."} ;; "the patient is a non-native speaker"
(declare-const patient_does_not_understand_local_language_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently does not understand the local language.","when_to_set_to_false":"Set to false if the patient currently understands the local language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently understands the local language.","meaning":"Boolean indicating whether the patient currently does not understand the local language."} ;; "the patient does not understand the local language"
(declare-const reliable_interpreter_services_are_available_now Bool) ;; {"when_to_set_to_true":"Set to true if reliable interpreter services are currently available for the patient.","when_to_set_to_false":"Set to false if reliable interpreter services are not currently available for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether reliable interpreter services are currently available for the patient.","meaning":"Boolean indicating whether reliable interpreter services are currently available for the patient."} ;; "unless reliable interpreter services are available"
(declare-const patient_fails_to_cooperate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently fails to cooperate.","when_to_set_to_false":"Set to false if the patient currently does not fail to cooperate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently fails to cooperate.","meaning":"Boolean indicating whether the patient currently fails to cooperate."} ;; "the patient fails to cooperate"
(declare-const patient_fails_to_cooperate_now@@due_to_major_psychiatric_disturbance Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently fails to cooperate due to major psychiatric disturbance.","when_to_set_to_false":"Set to false if the patient currently fails to cooperate but not due to major psychiatric disturbance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's failure to cooperate is due to major psychiatric disturbance.","meaning":"Boolean indicating whether the patient currently fails to cooperate due to major psychiatric disturbance."} ;; "the patient fails to cooperate due to major psychiatric disturbance"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia.","when_to_set_to_false":"Set to false if the patient currently does not have dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_fails_to_cooperate_now@@due_to_substance_use_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently fails to cooperate due to substance use disorder.","when_to_set_to_false":"Set to false if the patient currently fails to cooperate but not due to substance use disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's failure to cooperate is due to substance use disorder.","meaning":"Boolean indicating whether the patient currently fails to cooperate due to substance use disorder."} ;; "the patient fails to cooperate due to substance use disorder"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@in_opinion_of_investigator_would_make_patient_unfit_or_compromise_data_quality
      patient_has_finding_of_disease_condition_finding_now)
   :named REQ0_AUXILIARY0)) ;; "condition ... in the opinion of the investigator, would make the patient unfit to participate in the study or compromise the quality of the study data"

(assert
(! (=> patient_has_circumstance_now@@in_opinion_of_investigator_would_make_patient_unfit_or_compromise_data_quality
      patient_has_circumstance_now)
   :named REQ0_AUXILIARY1)) ;; "circumstance ... in the opinion of the investigator, would make the patient unfit to participate in the study or compromise the quality of the study data"

;; Non-exhaustive examples: if any example applies, then the umbrella exclusion applies
(assert
(! (=> (or
         (and (or patient_is_non_native_speaker_now patient_does_not_understand_local_language_now)
              (not reliable_interpreter_services_are_available_now)) ;; "the patient is a non-native speaker OR the patient does not understand the local language UNLESS reliable interpreter services are available"
         patient_fails_to_cooperate_now@@due_to_major_psychiatric_disturbance
         patient_has_finding_of_dementia_now
         patient_fails_to_cooperate_now@@due_to_substance_use_disorder)
      (or patient_has_finding_of_disease_condition_finding_now@@in_opinion_of_investigator_would_make_patient_unfit_or_compromise_data_quality
          patient_has_circumstance_now@@in_opinion_of_investigator_would_make_patient_unfit_or_compromise_data_quality))
   :named REQ0_AUXILIARY2)) ;; "with non-exhaustive examples ((the patient is a non-native speaker OR the patient does not understand the local language) UNLESS reliable interpreter services are available OR (the patient fails to cooperate due to major psychiatric disturbance) OR (the patient fails to cooperate due to dementia) OR (the patient fails to cooperate due to substance use disorder))."

;; Qualifier variables for failure to cooperate
(assert
(! (=> patient_fails_to_cooperate_now@@due_to_major_psychiatric_disturbance
      patient_fails_to_cooperate_now)
   :named REQ0_AUXILIARY3)) ;; "the patient fails to cooperate due to major psychiatric disturbance"

(assert
(! (=> patient_fails_to_cooperate_now@@due_to_substance_use_disorder
      patient_fails_to_cooperate_now)
   :named REQ0_AUXILIARY4)) ;; "the patient fails to cooperate due to substance use disorder"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@in_opinion_of_investigator_would_make_patient_unfit_or_compromise_data_quality)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition which, in the opinion of the investigator, would make the patient unfit to participate in the study."

(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@in_opinion_of_investigator_would_make_patient_unfit_or_compromise_data_quality)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition which, in the opinion of the investigator, would compromise the quality of the study data."

(assert
(! (not patient_has_circumstance_now@@in_opinion_of_investigator_would_make_patient_unfit_or_compromise_data_quality)
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any circumstance which, in the opinion of the investigator, would make the patient unfit to participate in the study."

(assert
(! (not patient_has_circumstance_now@@in_opinion_of_investigator_would_make_patient_unfit_or_compromise_data_quality)
   :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any circumstance which, in the opinion of the investigator, would compromise the quality of the study data."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const investigational_agent_half_life_value_recorded_in_hours Real) ;; {"when_to_set_to_value":"Set to the numeric value of the investigational agent's half-life in hours if known.","when_to_set_to_null":"Set to null if the half-life of the investigational agent is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the half-life of the investigational agent in hours."} ;; "five half-lives of the investigational agent"

(declare-const patient_has_received_investigational_product_within_the_longer_of_one_month_or_five_half_lives_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any investigational product within the longer of one month or five half-lives of the investigational agent prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not received any investigational product within the longer of one month or five half-lives of the investigational agent prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any investigational product within the longer of one month or five half-lives of the investigational agent prior to enrollment.","meaning":"Boolean indicating whether the patient has received any investigational product within the longer of one month or five half-lives of the investigational agent prior to enrollment."} ;; "has received any investigational product within the longer of (one month OR five half-lives of the investigational agent) prior to enrollment"

(declare-const patient_is_currently_participating_in_investigational_program_with_intervention_outside_routine_clinical_practice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any investigational program with intervention outside of routine clinical practice.","when_to_set_to_false":"Set to false if the patient is not currently participating in any investigational program with intervention outside of routine clinical practice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any investigational program with intervention outside of routine clinical practice.","meaning":"Boolean indicating whether the patient is currently participating in any investigational program with intervention outside of routine clinical practice."} ;; "currently participating in any investigational program with intervention outside of routine clinical practice"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_is_currently_participating_in_investigational_program_with_intervention_outside_routine_clinical_practice_now
            patient_has_received_investigational_product_within_the_longer_of_one_month_or_five_half_lives_prior_to_enrollment))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is currently participating in any investigational program with intervention outside of routine clinical practice) OR (the patient has received any investigational product within the longer of (one month OR five half-lives of the investigational agent) prior to enrollment)."
