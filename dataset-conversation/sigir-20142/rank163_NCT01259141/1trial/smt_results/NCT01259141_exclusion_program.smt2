;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than 18 years OR the patient is older than 60 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or (< patient_age_value_recorded_now_in_years 18)
            (> patient_age_value_recorded_now_in_years 60)))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is younger than 18 years) OR (the patient is older than 60 years)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_time_of_symptom_onset_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's onset of symptoms, as recorded now.","when_to_set_to_null":"Set to null if the time since onset of symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days since the patient's onset of symptoms, recorded now."} ;; "onset of symptoms"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_time_of_symptom_onset_value_recorded_now_withunit_days 7))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is more than one week after the onset of symptoms."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_infection_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has human immunodeficiency virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_inpatient_stay_inthepast90days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an inpatient stay (hospitalization) within the past 90 days.","when_to_set_to_false":"Set to false if the patient has not had an inpatient stay (hospitalization) within the past 90 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an inpatient stay (hospitalization) within the past 90 days.","meaning":"Boolean indicating whether the patient has had an inpatient stay (hospitalization) within the past 90 days."} ;; "history of hospitalization within the past 90 days"
(declare-const patient_duration_of_inpatient_stay_value_recorded_inthepast90days_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days for the patient's inpatient stay (hospitalization) within the past 90 days, if available.","when_to_set_to_null":"Set to null if the duration in days of the inpatient stay within the past 90 days is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in days of the patient's inpatient stay (hospitalization) within the past 90 days."} ;; "length of stay of the hospitalization was greater than 2 days"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_finding_of_inpatient_stay_inthepast90days
             (> patient_duration_of_inpatient_stay_value_recorded_inthepast90days_withunit_days 2)))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of hospitalization within the past 90 days) AND (the length of stay of the hospitalization was greater than 2 days)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_lives_in_a_nursing_home_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently lives in a nursing home.","when_to_set_to_false":"Set to false if the patient currently does not live in a nursing home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently lives in a nursing home.","meaning":"Boolean indicating whether the patient currently lives in a nursing home."} ;; "the patient lives in nursing homes"
(declare-const patient_has_finding_of_lives_in_a_rehabilitation_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently lives in a rehabilitation hospital.","when_to_set_to_false":"Set to false if the patient currently does not live in a rehabilitation hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently lives in a rehabilitation hospital.","meaning":"Boolean indicating whether the patient currently lives in a rehabilitation hospital."} ;; "the patient lives in rehabilitation hospitals"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_lives_in_a_nursing_home_now)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient lives in nursing homes."

(assert
(! (not patient_has_finding_of_lives_in_a_rehabilitation_hospital_now)
:named REQ5_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient lives in rehabilitation hospitals."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_taken_macrolide_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken any macrolide antibacterial medicines at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient has never taken any macrolide antibacterial medicines prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken macrolide antibacterial medicines prior to enrollment.","meaning":"Boolean indicating whether the patient has ever taken macrolide antibacterial medicines at any time in the past (prior to enrollment)."} ;; "the patient has taken macrolide medicines before enrollment"
(declare-const patient_has_taken_quinolone_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken any quinolone antibacterial medicines at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient has never taken any quinolone antibacterial medicines prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken quinolone antibacterial medicines prior to enrollment.","meaning":"Boolean indicating whether the patient has ever taken quinolone antibacterial medicines at any time in the past (prior to enrollment)."} ;; "the patient has taken quinolone medicines before enrollment"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_taken_macrolide_antibacterial_inthehistory)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken macrolide medicines before enrollment."

(assert
(! (not patient_has_taken_quinolone_antibacterial_inthehistory)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken quinolone medicines before enrollment."
