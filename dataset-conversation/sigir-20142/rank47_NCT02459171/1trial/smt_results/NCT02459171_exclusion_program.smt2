;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_known_immunosuppressive_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any known immunosuppressive condition.","when_to_set_to_false":"Set to false if the patient currently does not have any known immunosuppressive condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any known immunosuppressive condition.","meaning":"Boolean indicating whether the patient currently has any known immunosuppressive condition."} ;; "the patient has any known immunosuppressive condition"

(declare-const patient_has_known_immune_deficiency_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any known immune deficiency disease.","when_to_set_to_false":"Set to false if the patient currently does not have any known immune deficiency disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any known immune deficiency disease.","meaning":"Boolean indicating whether the patient currently has any known immune deficiency disease."} ;; "the patient has any known immune deficiency disease"

(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

(declare-const patient_is_undergoing_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunosuppressive therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing immunosuppressive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing immunosuppressive therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunosuppressive therapy."} ;; "the patient is receiving any ongoing immunosuppressive therapy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive example: HIV infection implies immune deficiency disease
(assert
(! (=> patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
      patient_has_known_immune_deficiency_disease_now)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (human immunodeficiency virus infection)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have any known immunosuppressive condition
(assert
(! (not patient_has_known_immunosuppressive_condition_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has any known immunosuppressive condition"

;; Exclusion: patient must NOT have any known immune deficiency disease
(assert
(! (not patient_has_known_immune_deficiency_disease_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has any known immune deficiency disease"

;; Exclusion: patient must NOT be receiving any ongoing immunosuppressive therapy
(assert
(! (not patient_is_undergoing_immunosuppressive_therapy_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is receiving any ongoing immunosuppressive therapy"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_terminal_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of terminal illness.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of terminal illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has terminal illness.","meaning":"Boolean indicating whether the patient currently has terminal illness."} ;; "terminally ill"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_terminal_illness_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is terminally ill."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "less than two years old at the time of baseline enrollment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 2))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than two years old at the time of baseline enrollment."
