;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of myocardial ischemia (as determined at initial testing).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of myocardial ischemia (as determined at initial testing).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of myocardial ischemia (as determined at initial testing).","meaning":"Boolean indicating whether the patient currently has myocardial ischemia."} ;; "myocardial ischemia"

(declare-const patient_has_finding_of_myocardial_ischemia_now@@ruled_in_at_initial_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial ischemia is confirmed (ruled in) at initial testing.","when_to_set_to_false":"Set to false if the patient's myocardial ischemia is not confirmed (not ruled in) at initial testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether myocardial ischemia was ruled in at initial testing.","meaning":"Boolean indicating whether the patient's myocardial ischemia is confirmed (ruled in) at initial testing."} ;; "rules in for myocardial ischemia at initial testing"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_myocardial_ischemia_now@@ruled_in_at_initial_testing
      patient_has_finding_of_myocardial_ischemia_now)
:named REQ0_AUXILIARY0)) ;; "rules in for myocardial ischemia at initial testing""

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_myocardial_ischemia_now@@ruled_in_at_initial_testing)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient rules in for myocardial ischemia at initial testing."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_terminal_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of terminal illness.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of terminal illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of terminal illness.","meaning":"Boolean indicating whether the patient currently has a clinical finding of terminal illness."} ;; "terminal illness"

(declare-const patient_has_finding_of_terminal_illness_now@@expected_survival_less_than_three_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a terminal illness and is expected to survive less than three months.","when_to_set_to_false":"Set to false if the patient currently has a terminal illness but is expected to survive three months or longer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient with terminal illness is expected to survive less than three months.","meaning":"Boolean indicating whether the patient with terminal illness is expected to survive less than three months."} ;; "terminal illness and is expected to survive less than three months"

(declare-const patient_expected_survival_duration_now_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient is expected to survive from now, as estimated by clinical judgment or documentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient is expected to survive from now.","meaning":"Numeric value representing the number of months the patient is expected to survive from now."} ;; "expected to survive less than three months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: The qualifier variable is true iff the patient has terminal illness AND is expected to survive less than three months
(assert
(! (= patient_has_finding_of_terminal_illness_now@@expected_survival_less_than_three_months
     (and patient_has_finding_of_terminal_illness_now
          (< patient_expected_survival_duration_now_in_months 3)))
:named REQ1_AUXILIARY0)) ;; "terminal illness and is expected to survive less than three months"

;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_terminal_illness_now@@expected_survival_less_than_three_months
       patient_has_finding_of_terminal_illness_now)
:named REQ1_AUXILIARY1)) ;; "terminal illness and is expected to survive less than three months" implies "terminal illness"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_terminal_illness_now@@expected_survival_less_than_three_months)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has terminal illness) AND (the patient is expected to survive less than three months)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_available_for_six_month_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the patient is available for follow-up at six months after the index event or enrollment.","when_to_set_to_false":"Set to false if the patient is unavailable for follow-up at six months after the index event or enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is available for follow-up at six months after the index event or enrollment.","meaning":"Boolean indicating whether the patient is available for follow-up at six months after the index event or enrollment."} ;; "unavailable for six-month follow-up"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_available_for_six_month_follow_up)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unavailable for six-month follow-up."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_can_be_contacted_by_telephone Bool) ;; {"when_to_set_to_true":"Set to true if the patient can be contacted by telephone.","when_to_set_to_false":"Set to false if the patient cannot be contacted by telephone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can be contacted by telephone.","meaning":"Boolean indicating whether the patient can be contacted by telephone."} ;; "cannot be contacted by telephone"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_can_be_contacted_by_telephone)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient cannot be contacted by telephone."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_institutionalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently institutionalized for any reason, including but not limited to being a prisoner or a nursing home resident.","when_to_set_to_false":"Set to false if the patient is currently not institutionalized for any reason.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently institutionalized.","meaning":"Boolean indicating whether the patient is currently institutionalized for any reason."} ;; "institutionalized"
(declare-const patient_has_finding_of_nursing_home_resident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a nursing home resident.","when_to_set_to_false":"Set to false if the patient is currently not a nursing home resident.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a nursing home resident.","meaning":"Boolean indicating whether the patient is currently a nursing home resident."} ;; "nursing home resident"
(declare-const patient_has_finding_of_prisoner_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a prisoner.","when_to_set_to_false":"Set to false if the patient is currently not a prisoner.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a prisoner.","meaning":"Boolean indicating whether the patient is currently a prisoner."} ;; "prisoner"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_prisoner_now
          patient_has_finding_of_nursing_home_resident_now)
     patient_has_finding_of_institutionalized_now)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples ((the patient is a prisoner) OR (the patient is a nursing home resident))."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_institutionalized_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is institutionalized with non-exhaustive examples ((the patient is a prisoner) OR (the patient is a nursing home resident))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_unable_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently able to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to provide informed consent.","meaning":"Boolean indicating whether the patient is currently unable to provide informed consent."} ;; "unable to provide informed consent"
(declare-const patient_has_finding_of_altered_mental_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired (altered) mental status.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired (altered) mental status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired (altered) mental status.","meaning":"Boolean indicating whether the patient currently has impaired (altered) mental status."} ;; "impaired mental status"
(declare-const patient_is_unable_to_speak_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to speak English.","when_to_set_to_false":"Set to false if the patient is currently able to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to speak English.","meaning":"Boolean indicating whether the patient is currently unable to speak English."} ;; "unable to speak English"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_altered_mental_status_now
           patient_is_unable_to_speak_english_now)
       patient_is_unable_to_provide_informed_consent_now)
   :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples ((the patient has impaired mental status) OR (the patient is unable to speak English))."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_unable_to_provide_informed_consent_now)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to provide informed consent with non-exhaustive examples ((the patient has impaired mental status) OR (the patient is unable to speak English))."
