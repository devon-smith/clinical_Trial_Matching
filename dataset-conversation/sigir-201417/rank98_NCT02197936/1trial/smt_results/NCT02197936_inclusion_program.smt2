;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged 20-45 years"
(declare-const patient_is_premenopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as premenopausal.","when_to_set_to_false":"Set to false if the patient is currently documented as not premenopausal (perimenopausal, postmenopausal, or other).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently premenopausal.","meaning":"Boolean value indicating whether the patient is currently premenopausal."}  ;; "premenopausal woman"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "premenopausal woman"
(declare-const patient_has_finding_of_adenomyosis_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of adenomyosis at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of adenomyosis in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with adenomyosis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with adenomyosis in the past."}  ;; "have been diagnosed with adenomyosis earlier"
(declare-const patient_has_finding_of_disorder_of_uterus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinical finding of disorder of the uterus.","when_to_set_to_false":"Set to false if the patient currently does not have any clinical finding of disorder of the uterus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder of the uterus.","meaning":"Boolean indicating whether the patient currently has any disorder of the uterus."}  ;; "pathology of the uterus"
(declare-const patient_has_finding_of_pathology_of_uterus_other_than_adenomyosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any documented pathology of the uterus other than adenomyosis.","when_to_set_to_false":"Set to false if the patient currently does not have any documented pathology of the uterus other than adenomyosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any pathology of the uterus other than adenomyosis.","meaning":"Boolean indicating whether the patient currently has any pathology of the uterus other than adenomyosis."}  ;; "no other pathology of the uterus"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be a premenopausal woman aged 20-45 years.
(assert
  (! (and patient_is_premenopausal_now
          patient_sex_is_female_now
          (>= patient_age_value_recorded_now_in_years 20)
          (<= patient_age_value_recorded_now_in_years 45))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a premenopausal woman aged 20-45 years."

;; Component 1: The patient must have been diagnosed with adenomyosis earlier.
(assert
  (! patient_has_finding_of_adenomyosis_in_the_history
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been diagnosed with adenomyosis earlier."

;; Component 2: The patient must have no other pathology of the uterus, regardless of clinical symptoms.
(assert
  (! (not patient_has_finding_of_pathology_of_uterus_other_than_adenomyosis_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no other pathology of the uterus, regardless of clinical symptoms."
