;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 8 years AND aged ≤ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 8)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 8 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_functional_heart_murmur_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of functional (innocent) heart murmur.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of functional (innocent) heart murmur.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of functional (innocent) heart murmur.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of functional (innocent) heart murmur."} // "innocent heart murmur"
(declare-const patient_has_finding_of_functional_heart_murmur_now@@has_referral_for_this_finding Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a referral for the diagnosis or finding of functional (innocent) heart murmur.","when_to_set_to_false":"Set to false if the patient does not have a referral for the diagnosis or finding of functional (innocent) heart murmur.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a referral for the diagnosis or finding of functional (innocent) heart murmur.","meaning":"Boolean indicating whether the patient has a referral for the diagnosis or finding of functional (innocent) heart murmur."} // "referral for innocent heart murmur"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (if patient has a referral for this finding, they must have the finding)
(assert
  (! (=> patient_has_finding_of_functional_heart_murmur_now@@has_referral_for_this_finding
         patient_has_finding_of_functional_heart_murmur_now)
     :named REQ1_AUXILIARY0)) ;; "referral for innocent heart murmur" implies "innocent heart murmur"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must be pediatric (age < 18) AND have a referral for innocent heart murmur
(assert
  (! (and (< patient_age_value_recorded_now_in_years 18.0)
          patient_has_finding_of_functional_heart_murmur_now@@has_referral_for_this_finding)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "pediatric patient with a referral for innocent heart murmur"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} // "chest pain"
(declare-const patient_is_pediatric_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered pediatric (e.g., based on age threshold defined by the study or clinical context).","when_to_set_to_false":"Set to false if the patient is currently not considered pediatric.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently considered pediatric.","meaning":"Boolean indicating whether the patient is currently considered pediatric."} // "pediatric patient"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be a pediatric patient with chest pain.
(assert
  (! (and patient_is_pediatric_now
          patient_has_finding_of_chest_pain_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a pediatric patient with chest pain."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_english_speaking Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to speak English.","when_to_set_to_false":"Set to false if the patient is not able to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to speak English.","meaning":"Boolean indicating whether the patient is able to speak English."} // "the patient must be an English-speaking patient"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_english_speaking
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be an English-speaking patient"
