;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_longevity_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the estimated number of days the patient is expected to live, as assessed at the time of enrollment.","when_to_set_to_null":"Set to null if no such estimate is available or cannot be determined at the time of enrollment.","meaning":"Numeric value representing the patient's expected life expectancy in days, as estimated at enrollment."} ;; "life expectancy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (> patient_longevity_value_recorded_now_withunit_days 30))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is NOT expected to have a life expectancy greater than thirty days from the date of enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_anaphylaxis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an anaphylactic reaction (anaphylaxis) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an anaphylactic reaction (anaphylaxis) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an anaphylactic reaction (anaphylaxis) in the past.","meaning":"Boolean indicating whether the patient has ever had an anaphylactic reaction (anaphylaxis) in the past."} ;; "anaphylactic reaction"
(declare-const patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_quinolones Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior anaphylactic reaction (anaphylaxis) was caused by quinolones.","when_to_set_to_false":"Set to false if the patient's prior anaphylactic reaction (anaphylaxis) was not caused by quinolones.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether quinolones caused the patient's prior anaphylactic reaction (anaphylaxis).","meaning":"Boolean indicating whether the patient's prior anaphylactic reaction (anaphylaxis) was caused by quinolones."} ;; "anaphylactic reaction to quinolones"
(declare-const patient_has_finding_of_allergic_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergic reaction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an allergic reaction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergic reaction in the past.","meaning":"Boolean indicating whether the patient has ever had an allergic reaction in the past."} ;; "allergic reaction"
(declare-const patient_has_finding_of_allergic_reaction_inthehistory@@caused_by_quinolones Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior allergic reaction was caused by quinolones.","when_to_set_to_false":"Set to false if the patient's prior allergic reaction was not caused by quinolones.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether quinolones caused the patient's prior allergic reaction.","meaning":"Boolean indicating whether the patient's prior allergic reaction was caused by quinolones."} ;; "allergic reaction to quinolones"
(declare-const patient_has_finding_of_allergic_reaction_inthehistory@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior allergic reaction was serious.","when_to_set_to_false":"Set to false if the patient's prior allergic reaction was not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prior allergic reaction was serious.","meaning":"Boolean indicating whether the patient's prior allergic reaction was serious."} ;; "serious allergic reaction"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for anaphylaxis
(assert
(! (=> patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_quinolones
      patient_has_finding_of_anaphylaxis_inthehistory)
   :named REQ1_AUXILIARY0)) ;; "anaphylactic reaction to quinolones"

;; Qualifier variable implies corresponding stem variable for allergic reaction
(assert
(! (=> patient_has_finding_of_allergic_reaction_inthehistory@@caused_by_quinolones
      patient_has_finding_of_allergic_reaction_inthehistory)
   :named REQ1_AUXILIARY1)) ;; "allergic reaction to quinolones"

;; Qualifier variable implies corresponding stem variable for serious allergic reaction
(assert
(! (=> patient_has_finding_of_allergic_reaction_inthehistory@@serious
      patient_has_finding_of_allergic_reaction_inthehistory)
   :named REQ1_AUXILIARY2)) ;; "serious allergic reaction"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion if previous anaphylactic reaction to quinolones
(assert
(! (not patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_quinolones)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous anaphylactic reaction to quinolones."

;; Exclusion if previous serious allergic reaction to quinolones
(assert
(! (not (and patient_has_finding_of_allergic_reaction_inthehistory@@caused_by_quinolones
             patient_has_finding_of_allergic_reaction_inthehistory@@serious))
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous serious allergic reaction to quinolones."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_advanced_directive_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has advanced directives documented.","when_to_set_to_false":"Set to false if the patient currently does not have advanced directives documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has advanced directives.","meaning":"Boolean indicating whether the patient currently has advanced directives."} ;; "advanced directives"
(declare-const patient_has_finding_of_advanced_directive_status_now@@indicates_not_to_be_transferred_to_hospital_for_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's advanced directives specifically indicate that the patient is NOT to be transferred to hospital for treatment.","when_to_set_to_false":"Set to false if the patient's advanced directives do not specifically indicate NOT to be transferred to hospital for treatment, or if they indicate transfer is allowed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the advanced directives indicate NOT to be transferred to hospital for treatment.","meaning":"Boolean indicating whether the patient's advanced directives specifically indicate NOT to be transferred to hospital for treatment."} ;; "advanced directives indicating that the patient is NOT to be transferred to hospital for treatment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_advanced_directive_status_now@@indicates_not_to_be_transferred_to_hospital_for_treatment
      patient_has_finding_of_advanced_directive_status_now)
:named REQ2_AUXILIARY0)) ;; "advanced directives indicating that the patient is NOT to be transferred to hospital for treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_advanced_directive_status_now@@indicates_not_to_be_transferred_to_hospital_for_treatment)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has advanced directives indicating that the patient is NOT to be transferred to hospital for treatment."
