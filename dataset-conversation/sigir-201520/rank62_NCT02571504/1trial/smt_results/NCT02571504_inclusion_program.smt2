;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 35 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 35)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 35 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const duration_since_first_diagnosis_of_human_immunodeficiency_virus_infection_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years since the patient's first diagnosis of human immunodeficiency virus infection, if known and documented.","when_to_set_to_null":"Set to null if the duration since first diagnosis of human immunodeficiency virus infection is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of years since the patient's first diagnosis of human immunodeficiency virus infection."} // "must have had human immunodeficiency virus infection for ≥ 1 year"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of human immunodeficiency virus infection at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of human immunodeficiency virus infection at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of human immunodeficiency virus infection in their history."} // "must have had human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory
          (>= duration_since_first_diagnosis_of_human_immunodeficiency_virus_infection_in_years 1.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have had human immunodeficiency virus infection for ≥ 1 year"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_able_to_communicate_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to communicate in English.","when_to_set_to_false":"Set to false if the patient is currently not able to communicate in English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to communicate in English.","meaning":"Boolean indicating whether the patient is currently able to communicate in English."} // "be able to communicate in English"
(declare-const patient_is_able_to_communicate_in_french_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to communicate in French.","when_to_set_to_false":"Set to false if the patient is currently not able to communicate in French.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to communicate in French.","meaning":"Boolean indicating whether the patient is currently able to communicate in French."} // "be able to communicate in French"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must be able to communicate in English OR be able to communicate in French.
(assert
  (! (or patient_is_able_to_communicate_in_english_now
         patient_is_able_to_communicate_in_french_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_capable_of_providing_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of providing informed consent.","when_to_set_to_false":"Set to false if the patient is currently not capable of providing informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of providing informed consent.","meaning":"Boolean indicating whether the patient is currently capable of providing informed consent."} // "the patient must be capable of providing informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_capable_of_providing_informed_consent_now
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be capable of providing informed consent"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_easy_access_to_internet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has easy access to the internet.","when_to_set_to_false":"Set to false if the patient currently does not have easy access to the internet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has easy access to the internet.","meaning":"Boolean indicating whether the patient currently has easy access to the internet."} // "the patient must have easy access to the internet"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_easy_access_to_internet_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have easy access to the internet"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_can_undergo_electroencephalogram_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently compatible with and can undergo electroencephalogram (EEG) testing.","when_to_set_to_false":"Set to false if the patient is currently incompatible with or cannot undergo electroencephalogram (EEG) testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo electroencephalogram (EEG) testing.","meaning":"Boolean indicating whether the patient can currently undergo electroencephalogram (EEG) testing."} // "be compatible with electroencephalography"
(declare-const patient_can_undergo_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently compatible with and can undergo magnetic resonance imaging (MRI).","when_to_set_to_false":"Set to false if the patient is currently incompatible with or cannot undergo magnetic resonance imaging (MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient can currently undergo magnetic resonance imaging (MRI)."} // "be compatible with magnetic resonance imaging"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (or patient_can_undergo_electroencephalogram_now
         patient_can_undergo_magnetic_resonance_imaging_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (be compatible with electroencephalography OR be compatible with magnetic resonance imaging)."
