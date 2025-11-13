;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const cough_duration_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks the patient's current cough has lasted, if known and documented.","when_to_set_to_null":"Set to null if the duration of the patient's current cough in weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration, in weeks, of the patient's current cough."}  ;; "a cough lasting for ≥ 8 weeks"
(declare-const patient_has_finding_of_chronic_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic cough (cough lasting at least 8 weeks).","when_to_set_to_false":"Set to false if the patient currently does not have a chronic cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic cough.","meaning":"Boolean indicating whether the patient currently has a chronic cough."}  ;; "a cough lasting for ≥ 8 weeks"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cough.","when_to_set_to_false":"Set to false if the patient currently does not have a cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cough.","meaning":"Boolean indicating whether the patient currently has a cough."}  ;; "cough"
(declare-const patient_has_finding_of_cough_now@@is_irritating Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cough and the cough is irritating.","when_to_set_to_false":"Set to false if the patient currently has a cough and the cough is not irritating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cough is irritating.","meaning":"Boolean indicating whether the patient's current cough is irritating."}  ;; "an irritating cough"
(declare-const patient_has_finding_of_dry_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a dry cough.","when_to_set_to_false":"Set to false if the patient currently does not have a dry cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a dry cough.","meaning":"Boolean indicating whether the patient currently has a dry cough."}  ;; "a dry cough"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: chronic cough is a cough lasting at least 8 weeks
(assert
  (! (= patient_has_finding_of_chronic_cough_now
        (and patient_has_finding_of_cough_now
             (>= cough_duration_value_recorded_now_in_weeks 8.0)))
     :named REQ0_AUXILIARY0)) ;; "a cough lasting for ≥ 8 weeks"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_cough_now@@is_irritating
         patient_has_finding_of_cough_now)
     :named REQ0_AUXILIARY1)) ;; "an irritating cough"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have a cough lasting for ≥ 8 weeks
(assert
  (! patient_has_finding_of_chronic_cough_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a cough lasting for ≥ 8 weeks"

;; Component 1: Must have an irritating cough
(assert
  (! patient_has_finding_of_cough_now@@is_irritating
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "an irritating cough"

;; Component 2: Must have a dry cough
(assert
  (! patient_has_finding_of_dry_cough_now
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a dry cough"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_hypersensitivity_to_fume_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hypersensitive, allergic, or intolerant to fumes.","when_to_set_to_false":"Set to false if the patient is currently not hypersensitive, allergic, or intolerant to fumes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hypersensitive, allergic, or intolerant to fumes.","meaning":"Boolean indicating whether the patient currently has hypersensitivity, allergy, or intolerance to fumes."}  ;; "sensitive to fumes"
(declare-const patient_has_finding_of_allergy_to_dust_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy or hypersensitivity to dust.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy or hypersensitivity to dust.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy or hypersensitivity to dust.","meaning":"Boolean indicating whether the patient currently has a clinical finding of allergy or hypersensitivity to dust."}  ;; "sensitive to dust"
(declare-const patient_is_sensitive_to_odorous_air_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sensitive, allergic, or intolerant to odorous air.","when_to_set_to_false":"Set to false if the patient is currently not sensitive, allergic, or intolerant to odorous air.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sensitive, allergic, or intolerant to odorous air.","meaning":"Boolean indicating whether the patient is currently sensitive, allergic, or intolerant to odorous air."}  ;; "sensitive to odorous air"
(declare-const patient_has_finding_of_intolerant_of_cold_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of intolerance or hypersensitivity to cold air.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of intolerance or hypersensitivity to cold air.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of intolerance or hypersensitivity to cold air.","meaning":"Boolean indicating whether the patient currently has a clinical finding of intolerance or hypersensitivity to cold air."}  ;; "sensitive to cold air"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must be sensitive to fumes."
(assert
  (! patient_has_hypersensitivity_to_fume_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "sensitive to fumes"

;; Component 1: "To be included, the patient must be sensitive to dust."
(assert
  (! patient_has_finding_of_allergy_to_dust_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "sensitive to dust"

;; Component 2: "To be included, the patient must be sensitive to odorous air."
(assert
  (! patient_is_sensitive_to_odorous_air_now
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "sensitive to odorous air"

;; Component 3: "To be included, the patient must be sensitive to cold air."
(assert
  (! patient_has_finding_of_intolerant_of_cold_now
     :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "sensitive to cold air"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_plain_chest_x_ray_now_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest x-ray now and the outcome is normal.","when_to_set_to_false":"Set to false if the patient has undergone a plain chest x-ray now and the outcome is not normal, or if the patient has not undergone the procedure now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest x-ray now with a normal outcome.","meaning":"Boolean indicating whether the patient has undergone a plain chest x-ray now and the outcome is normal."} ;; "normal chest radiographs"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_undergone_plain_chest_x_ray_now_outcome_is_normal
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal chest radiographs."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 17 years AND aged ≤ 70 years"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "To be included, the patient must be aged ≥ 17 years."
(assert
  (! (>= patient_age_value_recorded_now_in_years 17)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 17 years"

;; Component 1: "To be included, the patient must be aged ≤ 70 years."
(assert
  (! (<= patient_age_value_recorded_now_in_years 70)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 70 years"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of tobacco smoking behavior at any point in the past.","when_to_set_to_false":"Set to false if the patient has never had a history of tobacco smoking behavior at any point in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of tobacco smoking behavior.","meaning":"Boolean indicating whether the patient has ever had tobacco smoking behavior in their history."}  ;; "a history of smoking"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not have a history of smoking."
