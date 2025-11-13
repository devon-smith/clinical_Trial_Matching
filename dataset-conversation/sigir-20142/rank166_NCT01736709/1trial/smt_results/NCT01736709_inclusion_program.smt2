;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged (≥ 18 years AND ≤ 60 years) OR aged (> 60 years)"
(declare-const patient_has_finding_of_well_adult_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a healthy adult.","when_to_set_to_false":"Set to false if the patient is currently not a healthy adult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a healthy adult.","meaning":"Boolean indicating whether the patient is currently a healthy adult."}  ;; "healthy adult"
(declare-const patient_has_finding_of_well_elder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a healthy old person.","when_to_set_to_false":"Set to false if the patient is currently not a healthy old person.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a healthy old person.","meaning":"Boolean indicating whether the patient is currently a healthy old person."}  ;; "healthy old person"
(declare-const patient_is_in_adults_group_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as being in the adults group.","when_to_set_to_false":"Set to false if the patient is currently not classified as being in the adults group.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as being in the adults group.","meaning":"Boolean indicating whether the patient is currently classified as being in the adults group."}  ;; "be in the adults group"
(declare-const patient_is_in_old_people_group_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as being in the old people group.","when_to_set_to_false":"Set to false if the patient is currently not classified as being in the old people group.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as being in the old people group.","meaning":"Boolean indicating whether the patient is currently classified as being in the old people group."}  ;; "be in the old people group"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((be in the adults group AND be a healthy adult aged (≥ 18 years AND ≤ 60 years)) OR (be in the old people group AND be a healthy old person aged (> 60 years))).
(assert
  (! (or
        (and patient_is_in_adults_group_now
             patient_has_finding_of_well_adult_now
             (>= patient_age_value_recorded_now_in_years 18.0)
             (<= patient_age_value_recorded_now_in_years 60.0))
        (and patient_is_in_old_people_group_now
             patient_has_finding_of_well_elder_now
             (> patient_age_value_recorded_now_in_years 60.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be in the adults group AND be a healthy adult aged (≥ 18 years AND ≤ 60 years)) OR (be in the old people group AND be a healthy old person aged (> 60 years)))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_vaccination_history_of_seasonal_split_influenza_vaccine_in_past_3_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a vaccination history of seasonal split influenza vaccine in the past 3 years.","when_to_set_to_false":"Set to false if the patient does not have a vaccination history of seasonal split influenza vaccine in the past 3 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a vaccination history of seasonal split influenza vaccine in the past 3 years.","meaning":"Boolean indicating whether the patient has a vaccination history of seasonal split influenza vaccine in the past 3 years."} ;; "NOT have a vaccination history of seasonal split influenza vaccine in the recent 3 years"
(declare-const patient_is_able_to_show_legal_identity_card_for_recruitment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to show a legal identity card for the purpose of recruitment.","when_to_set_to_false":"Set to false if the patient is currently not able to show a legal identity card for the purpose of recruitment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to show a legal identity card for the purpose of recruitment.","meaning":"Boolean indicating whether the patient is currently able to show a legal identity card for the purpose of recruitment."} ;; "be able to show a legal identity card for the sake of recruitment"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: ((be in the adults group AND be able to show a legal identity card for the sake of recruitment AND NOT have a vaccination history of seasonal split influenza vaccine in the recent 3 years) OR (be in the old people group AND be able to show a legal identity card for the sake of recruitment AND NOT have a vaccination history of seasonal split influenza vaccine in the recent 3 years))
(assert
  (! (or
        (and patient_is_in_adults_group_now
             patient_is_able_to_show_legal_identity_card_for_recruitment_now
             (not patient_has_vaccination_history_of_seasonal_split_influenza_vaccine_in_past_3_years))
        (and patient_is_in_old_people_group_now
             patient_is_able_to_show_legal_identity_card_for_recruitment_now
             (not patient_has_vaccination_history_of_seasonal_split_influenza_vaccine_in_past_3_years)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be in the adults group AND be able to show a legal identity card for the sake of recruitment AND NOT have a vaccination history of seasonal split influenza vaccine in the recent 3 years) OR (be in the old people group AND be able to show a legal identity card for the sake of recruitment AND NOT have a vaccination history of seasonal split influenza vaccine in the recent 3 years))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_participating_in_other_clinical_trials_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is participating in any other clinical trials during the study period.","when_to_set_to_false":"Set to false if the patient is not participating in any other clinical trials during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is participating in any other clinical trials during the study period.","meaning":"Boolean indicating whether the patient is participating in any other clinical trials during the study period."} ;; "NOT participate in any other clinical trials during the study"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or
        (and patient_is_in_adults_group_now
             (not patient_is_participating_in_other_clinical_trials_during_study))
        (and patient_is_in_old_people_group_now
             (not patient_is_participating_in_other_clinical_trials_during_study)))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((be in the adults group AND NOT participate in any other clinical trials during the study) OR (be in the old people group AND NOT participate in any other clinical trials during the study))"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_immunosuppressant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any immunosuppressant at any time in the history, including during the study period.","when_to_set_to_false":"Set to false if the patient has not been exposed to any immunosuppressant at any time in the history, including during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any immunosuppressant at any time in the history.","meaning":"Boolean indicating whether the patient has been exposed to any immunosuppressant at any time in the history (including the study period)."} ;; "have received any immunosuppressive agents during the study"
(declare-const patient_is_exposed_to_immunosuppressant_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any immunosuppressant in the one month prior to the current time (e.g., prior to study start).","when_to_set_to_false":"Set to false if the patient was not exposed to any immunosuppressant in the one month prior to the current time (e.g., prior to study start).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any immunosuppressant in the one month prior to the current time.","meaning":"Boolean indicating whether the patient was exposed to any immunosuppressant in the one month prior to the current time (e.g., prior to study start)."} ;; "have received any immunosuppressive agents during one month prior to the study"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must ((be in the adults group AND NOT have received any immunosuppressive agents during the study AND NOT have received any immunosuppressive agents during one month prior to the study) OR (be in the old people group AND NOT have received any immunosuppressive agents during the study AND NOT have received any immunosuppressive agents during one month prior to the study)).
(assert
  (! (or
        (and patient_is_in_adults_group_now
             (not patient_is_exposed_to_immunosuppressant_inthehistory)
             (not patient_is_exposed_to_immunosuppressant_inthepast1months))
        (and patient_is_in_old_people_group_now
             (not patient_is_exposed_to_immunosuppressant_inthehistory)
             (not patient_is_exposed_to_immunosuppressant_inthepast1months)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be in the adults group AND NOT have received any immunosuppressive agents during the study AND NOT have received any immunosuppressive agents during one month prior to the study) OR (be in the old people group AND NOT have received any immunosuppressive agents during the study AND NOT have received any immunosuppressive agents during one month prior to the study))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_signed_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently signed the informed consent for study participation.","when_to_set_to_false":"Set to false if the patient has not currently signed the informed consent for study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently signed the informed consent for study participation.","meaning":"Boolean indicating whether the patient has currently signed the informed consent for study participation."} ;; "sign the informed consent"
(declare-const patient_is_able_to_understand_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand information relevant to the study.","when_to_set_to_false":"Set to false if the patient is currently not able to understand information relevant to the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand information relevant to the study.","meaning":"Boolean indicating whether the patient is currently able to understand information relevant to the study."} ;; "be able to understand"

;; ===================== Constraint Assertions (REQ 4) =====================
;; To be included, the patient must ((be in the adults group AND be able to understand AND sign the informed consent) OR (be in the old people group AND be able to understand AND sign the informed consent)).
(assert
  (! (or (and patient_is_in_adults_group_now
              patient_is_able_to_understand_now
              patient_has_signed_informed_consent_now)
         (and patient_is_in_old_people_group_now
              patient_is_able_to_understand_now
              patient_has_signed_informed_consent_now))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS))
