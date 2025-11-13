;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "adult age (age ≥ 18 years)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be of adult age (age ≥ 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} ;; "the patient must be male"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_sex_is_male_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m² if a current measurement is available.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m²."} ;; "body mass index"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} ;; "obesity"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition in the requirement: Obesity is defined as BMI > 30
(assert
  (! (= patient_has_finding_of_obesity_now
        (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30.0))
     :named REQ2_AUXILIARY0)) ;; "obesity (body mass index > 30)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have obesity (body mass index > 30)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_aspirin_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone aspirin therapy at any time in their history (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone aspirin therapy at any time in their history (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone aspirin therapy in their history.","meaning":"Boolean indicating whether the patient has ever undergone aspirin therapy at any time in their history (prior to now)."} ;; "aspirin treatment before inclusion"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_undergone_aspirin_therapy_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have received aspirin treatment before inclusion."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const coronary_exploration_count_by_coronary_angiography_or_coronary_ct_angiography_ever Real) ;; {"when_to_set_to_value":"Set to the total number of coronary explorations the patient has ever undergone by either coronary angiography or coronary computed tomography angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many coronary explorations by either coronary angiography or coronary computed tomography angiography the patient has ever undergone.","meaning":"Numeric variable indicating the total number of coronary explorations the patient has ever undergone by either coronary angiography or coronary computed tomography angiography."} ;; "the patient must have undergone at least one coronary exploration by (coronary angiography OR coronary computed tomography angiography)"
(declare-const patient_has_undergone_coronary_exploration_by_coronary_angiography_or_coronary_ct_angiography_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone at least one coronary exploration by either coronary angiography or coronary computed tomography angiography.","when_to_set_to_false":"Set to false if the patient has never undergone coronary exploration by either coronary angiography or coronary computed tomography angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary exploration by either coronary angiography or coronary computed tomography angiography.","meaning":"Boolean indicating whether the patient has ever undergone at least one coronary exploration by either coronary angiography or coronary computed tomography angiography."} ;; "the patient must have undergone at least one coronary exploration by (coronary angiography OR coronary computed tomography angiography)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: patient_has_undergone_coronary_exploration_by_coronary_angiography_or_coronary_ct_angiography_ever is true iff coronary_exploration_count_by_coronary_angiography_or_coronary_ct_angiography_ever >= 1
(assert
  (! (= patient_has_undergone_coronary_exploration_by_coronary_angiography_or_coronary_ct_angiography_ever
        (>= coronary_exploration_count_by_coronary_angiography_or_coronary_ct_angiography_ever 1))
     :named REQ4_AUXILIARY0)) ;; "the patient must have undergone at least one coronary exploration by (coronary angiography OR coronary computed tomography angiography)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_undergone_coronary_exploration_by_coronary_angiography_or_coronary_ct_angiography_ever
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have undergone at least one coronary exploration by (coronary angiography OR coronary computed tomography angiography)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@like_stable_angina Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain and the pain is like stable angina.","when_to_set_to_false":"Set to false if the patient currently has chest pain but the pain is not like stable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chest pain is like stable angina.","meaning":"Boolean indicating whether the patient's current chest pain is like stable angina."} ;; "chest pain like stable angina"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_chest_pain_now@@like_stable_angina
         patient_has_finding_of_chest_pain_now)
     :named REQ5_AUXILIARY0)) ;; "chest pain like stable angina" ⇒ "chest pain"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must have chest pain like stable angina.
(assert
  (! patient_has_finding_of_chest_pain_now@@like_stable_angina
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have chest pain like stable angina."
