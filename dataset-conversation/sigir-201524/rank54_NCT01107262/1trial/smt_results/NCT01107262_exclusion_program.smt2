;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "less than eighteen years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than eighteen years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_known_immunosuppressive_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any known immunosuppressive condition.","when_to_set_to_false":"Set to false if the patient currently does not have any known immunosuppressive condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any known immunosuppressive condition.","meaning":"Boolean indicating whether the patient currently has any known immunosuppressive condition."} ;; "the patient has any known immunosuppressive condition"
(declare-const patient_has_known_immune_deficiency_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any known immune deficiency disease.","when_to_set_to_false":"Set to false if the patient currently does not have any known immune deficiency disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any known immune deficiency disease.","meaning":"Boolean indicating whether the patient currently has any known immune deficiency disease."} ;; "the patient has any known immune deficiency disease"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_is_undergoing_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunosuppressive therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing immunosuppressive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing immunosuppressive therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunosuppressive therapy."} ;; "the patient is receiving any ongoing immunosuppressive therapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive example: HIV infection implies immune deficiency disease
(assert
(! (=> patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
      patient_has_known_immune_deficiency_disease_now)
    :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (human immunodeficiency virus infection)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have any of the following: known immunosuppressive condition, known immune deficiency disease, or be undergoing immunosuppressive therapy
(assert
(! (not patient_has_known_immunosuppressive_condition_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has any known immunosuppressive condition"

(assert
(! (not patient_has_known_immune_deficiency_disease_now)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has any known immune deficiency disease"

(assert
(! (not patient_is_undergoing_immunosuppressive_therapy_now)
    :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is receiving any ongoing immunosuppressive therapy"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_poultry_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to poultry at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to poultry at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to poultry.","meaning":"Boolean indicating whether the patient has ever been exposed to poultry at any time in the past."} ;; "poultry"

(declare-const patient_is_exposed_to_poultry_inthehistory@@exposure_more_than_5_years_ago Bool) ;; {"when_to_set_to_true":"Set to true if the patient's poultry exposure occurred more than five years ago.","when_to_set_to_false":"Set to false if the patient's poultry exposure occurred five years ago or less, or if the patient was never exposed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient's poultry exposure occurred.","meaning":"Boolean indicating whether the patient's poultry exposure occurred more than five years ago."} ;; "the patient was exposed to poultry more than five years ago"

(declare-const patient_poultry_exposure_status_is_unknown Bool) ;; {"when_to_set_to_true":"Set to true if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to poultry.","when_to_set_to_false":"Set to false if it is known whether the patient has ever been exposed to poultry (either exposed or not exposed).","when_to_set_to_null":"Set to null if the documentation is ambiguous or contradictory regarding the patient's poultry exposure status.","meaning":"Boolean indicating whether the patient's poultry exposure status is unknown."} ;; "unknown poultry exposure status"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_poultry_exposure_status_is_unknown
            patient_is_exposed_to_poultry_inthehistory@@exposure_more_than_5_years_ago))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has unknown poultry exposure status) OR (the patient was exposed to poultry more than five years ago))."
