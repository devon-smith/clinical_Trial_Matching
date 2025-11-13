;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_terminal_illness_stage_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a terminal illness that is classified as Stage IV.","when_to_set_to_false":"Set to false if the patient currently does not have a terminal illness that is classified as Stage IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a terminal illness that is classified as Stage IV.","meaning":"Boolean indicating whether the patient currently has a terminal illness that is classified as Stage IV."} // "a terminal illness (Stage IV)"
(declare-const patient_has_finding_of_prognosis_outlook_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented prognosis outlook finding.","when_to_set_to_false":"Set to false if the patient currently does not have a documented prognosis outlook finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a prognosis outlook finding.","meaning":"Boolean indicating whether the patient currently has a prognosis outlook finding (i.e., a documented prognosis) at the present time."} // "prognosis"
(declare-const patient_prognosis_expected_survival_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's expected survival in days as recorded at the present time.","when_to_set_to_null":"Set to null if the expected survival in days is unknown, not documented, or cannot be determined at the present time.","meaning":"Numeric value indicating the patient's expected survival in days, as recorded at the present time."} // "expected survival of ≥ 7 days"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; None required for this requirement (all components are direct constraints).

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must have a terminal illness (Stage IV)
(assert
  (! patient_has_finding_of_terminal_illness_stage_iv_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a terminal illness (Stage IV)."

;; Component 1: Patient must have a prognosis of < 6 months
;; 6 months = 180 days
(assert
  (! (and patient_has_finding_of_prognosis_outlook_finding_now
          (< patient_prognosis_expected_survival_value_recorded_now_in_days 180))
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a prognosis of < 6 months."

;; Component 2: Patient must have an expected survival of ≥ 7 days
(assert
  (! (>= patient_prognosis_expected_survival_value_recorded_now_in_days 7)
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have an expected survival of ≥ 7 days."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_can_identify_at_least_one_family_member Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to identify at least one family member.","when_to_set_to_false":"Set to false if the patient is not able to identify any family member.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to identify at least one family member.","meaning":"Boolean indicating whether the patient is able to identify at least one family member."} // "the patient must be able to identify (at least one family member ...)"
(declare-const patient_can_identify_at_least_one_significant_other Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to identify at least one significant other.","when_to_set_to_false":"Set to false if the patient is not able to identify any significant other.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to identify at least one significant other.","meaning":"Boolean indicating whether the patient is able to identify at least one significant other."} // "the patient must be able to identify (... OR at least one significant other)"
(declare-const identified_family_member_agrees_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the identified family member agrees to participate in the study.","when_to_set_to_false":"Set to false if the identified family member does not agree to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the identified family member agrees to participate in the study.","meaning":"Boolean indicating whether the identified family member agrees to participate in the study."} // "this identified family member ... must agree to participate in the study"
(declare-const identified_significant_other_agrees_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the identified significant other agrees to participate in the study.","when_to_set_to_false":"Set to false if the identified significant other does not agree to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the identified significant other agrees to participate in the study.","meaning":"Boolean indicating whether the identified significant other agrees to participate in the study."} // "this identified ... significant other must agree to participate in the study"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must be able to identify (at least one family member OR at least one significant other)
(assert
  (! (or patient_can_identify_at_least_one_family_member
         patient_can_identify_at_least_one_significant_other)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be able to identify (at least one family member OR at least one significant other)"

;; Component 1: (this identified family member OR this identified significant other) must agree to participate in the study
(assert
  (! (or identified_family_member_agrees_to_participate_in_study
         identified_significant_other_agrees_to_participate_in_study)
     :named REQ2_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "(this identified family member OR this identified significant other) must agree to participate in the study"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_can_communicate_with_english_speaking_therapist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to communicate with an English-speaking therapist.","when_to_set_to_false":"Set to false if the patient is currently not able to communicate with an English-speaking therapist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to communicate with an English-speaking therapist.","meaning":"Boolean indicating whether the patient is currently able to communicate with an English-speaking therapist."} // "the patient must be able to communicate with an English-speaking therapist"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_can_communicate_with_english_speaking_therapist_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be able to communicate with an English-speaking therapist"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_cognitively_able_to_provide_valid_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if, in the investigator's judgement, the patient is cognitively able to provide valid informed consent now.","when_to_set_to_false":"Set to false if, in the investigator's judgement, the patient is not cognitively able to provide valid informed consent now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is cognitively able to provide valid informed consent now.","meaning":"Boolean indicating whether, in the investigator's judgement, the patient is cognitively able to provide valid informed consent now."} // "the patient must be cognitively able to provide valid informed consent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_cognitively_able_to_provide_valid_informed_consent_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be cognitively able to provide valid informed consent"
