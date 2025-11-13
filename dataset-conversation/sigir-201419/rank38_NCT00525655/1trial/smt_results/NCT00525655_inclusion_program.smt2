;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_confirmed_genetic_diagnosis_of_familial_adenomatous_polyposis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed genetic diagnosis of familial adenomatous polyposis.","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed genetic diagnosis of familial adenomatous polyposis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed genetic diagnosis of familial adenomatous polyposis.","meaning":"Boolean indicating whether the patient currently has a confirmed genetic diagnosis of familial adenomatous polyposis."} // "have a confirmed genetic diagnosis of familial adenomatous polyposis"
(declare-const patient_has_confirmed_clinical_diagnosis_of_familial_adenomatous_polyposis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed clinical diagnosis of familial adenomatous polyposis.","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed clinical diagnosis of familial adenomatous polyposis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed clinical diagnosis of familial adenomatous polyposis.","meaning":"Boolean indicating whether the patient currently has a confirmed clinical diagnosis of familial adenomatous polyposis."} // "have a confirmed clinical diagnosis of familial adenomatous polyposis"
(declare-const patient_age_value_recorded_at_time_of_recruitment_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time of recruitment to this study if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in years at the time of recruitment to this study is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time of recruitment to this study."} // "be aged ≥ 13 years AND ≤ 24 years at the time of recruitment to this study"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Confirmed genetic OR clinical diagnosis of familial adenomatous polyposis
(assert
  (! (or patient_has_confirmed_genetic_diagnosis_of_familial_adenomatous_polyposis_now
         patient_has_confirmed_clinical_diagnosis_of_familial_adenomatous_polyposis_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have a confirmed genetic diagnosis of familial adenomatous polyposis) OR (have a confirmed clinical diagnosis of familial adenomatous polyposis))"

;; Component 1: Age at recruitment between 13 and 24 years, inclusive
(assert
  (! (and (>= patient_age_value_recorded_at_time_of_recruitment_in_years 13)
          (<= patient_age_value_recorded_at_time_of_recruitment_in_years 24))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be aged ≥ 13 years AND ≤ 24 years at the time of recruitment to this study"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
;; Age at recruitment
;; "be aged ≥ 18 years AND ≤ 21 years"
;; Already declared in previous SMT: 
;; (declare-const patient_age_value_recorded_at_time_of_recruitment_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time of recruitment to this study if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in years at the time of recruitment to this study is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time of recruitment to this study."} // "be aged ≥ 13 years AND ≤ 24 years at the time of recruitment to this study"

;; Previous diagnosis of cancer
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of malignant neoplastic disease (cancer) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of malignant neoplastic disease (cancer) at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer) at any time in their medical history."} // "have a previous diagnosis of cancer"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Age between 18 and 21 years inclusive
(assert
  (! (and (>= patient_age_value_recorded_at_time_of_recruitment_in_years 18.0)
          (<= patient_age_value_recorded_at_time_of_recruitment_in_years 21.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be aged ≥ 18 years AND ≤ 21 years"

;; Component 1: Previous diagnosis of cancer
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have a previous diagnosis of cancer"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_can_read_english Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to read English.","when_to_set_to_false":"Set to false if the patient is not able to read English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to read English.","meaning":"Boolean indicating whether the patient is able to read English."} // "the patient must be able to read English"
(declare-const patient_can_speak_english Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to speak English.","when_to_set_to_false":"Set to false if the patient is not able to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to speak English.","meaning":"Boolean indicating whether the patient is able to speak English."} // "the patient must be able to speak English"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_can_read_english
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be able to read English."

(assert
  (! patient_can_speak_english
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be able to speak English."
