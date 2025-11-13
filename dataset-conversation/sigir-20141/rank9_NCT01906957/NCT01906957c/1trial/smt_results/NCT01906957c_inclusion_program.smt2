;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "To be included, the patient must be male or female."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_female_now
         patient_sex_is_male_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged > 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged > 18 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "To be included, the patient must provide written informed consent."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide written informed consent."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patients_physical_capacities_are_sufficient_for_independent_daily_living_now@@initial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's physical capacities are sufficient for independent daily living now and are initial (at baseline/start of assessment).","when_to_set_to_false":"Set to false if the patient's physical capacities are not sufficient for independent daily living now or are not initial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physical capacities are sufficient for independent daily living and initial.","meaning":"Boolean indicating whether the patient's physical capacities are sufficient for independent daily living now and initial (at baseline/start of assessment)."} // "sufficient initial physical capacities allowing an independent daily living"
(declare-const patients_intellectual_ability_is_normal_now@@sufficient_for_independent_daily_living Bool) ;; {"when_to_set_to_true":"Set to true if the patient's intellectual ability is normal now and is sufficient to allow independent daily living.","when_to_set_to_false":"Set to false if the patient's intellectual ability is normal now but is not sufficient to allow independent daily living.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's intellectual ability is sufficient for independent daily living.","meaning":"Boolean indicating whether the patient's intellectual ability is normal now and sufficient for independent daily living."} // "sufficient initial intellectual capacities allowing an independent daily living"
(declare-const patients_intellectual_ability_is_normal_now@@initial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's intellectual ability is normal now and is initial (at baseline/start of assessment).","when_to_set_to_false":"Set to false if the patient's intellectual ability is normal now but is not initial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's intellectual ability is initial.","meaning":"Boolean indicating whether the patient's intellectual ability is normal now and initial (at baseline/start of assessment)."} // "sufficient initial intellectual capacities"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patients_physical_capacities_are_sufficient_for_independent_daily_living_now@@initial
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have sufficient initial physical capacities allowing an independent daily living."

(assert
  (! (and patients_intellectual_ability_is_normal_now@@initial
          patients_intellectual_ability_is_normal_now@@sufficient_for_independent_daily_living)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have sufficient initial intellectual capacities allowing an independent daily living."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_coronary_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented diagnosis of coronary heart disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented diagnosis of coronary heart disease at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a documented diagnosis of coronary heart disease.","meaning":"Boolean indicating whether the patient has ever had a documented diagnosis of coronary heart disease at any time in the past."} // "To be included, the patient must have documented coronary heart disease (prior myocardial infarction, prior coronary angiography or prior coronary angioplasty, or documented myocardial ischemia on myocardial scintigraphy)."
(declare-const patient_has_diagnosis_of_coronary_heart_disease_inthehistory@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of coronary heart disease is documented.","when_to_set_to_false":"Set to false if the diagnosis of coronary heart disease is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of coronary heart disease is documented.","meaning":"Boolean indicating whether the diagnosis of coronary heart disease is documented."} // "documented coronary heart disease"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction at any time in the past."} // "prior myocardial infarction"
(declare-const patient_has_undergone_coronary_angiography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary angiography at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary angiography at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary angiography.","meaning":"Boolean indicating whether the patient has ever undergone coronary angiography at any time in the past."} // "prior coronary angiography"
(declare-const patient_has_undergone_coronary_angioplasty_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary angioplasty at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary angioplasty at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary angioplasty.","meaning":"Boolean indicating whether the patient has ever undergone coronary angioplasty at any time in the past."} // "prior coronary angioplasty"
(declare-const patient_has_finding_of_myocardial_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of myocardial ischemia at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of myocardial ischemia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of myocardial ischemia.","meaning":"Boolean indicating whether the patient has ever had a finding of myocardial ischemia at any time in the past."} // "documented myocardial ischemia"
(declare-const patient_has_finding_of_myocardial_ischemia_inthehistory@@documented_on_myocardial_scintigraphy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial ischemia finding is documented specifically on myocardial scintigraphy.","when_to_set_to_false":"Set to false if the patient's myocardial ischemia finding is not documented on myocardial scintigraphy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myocardial ischemia finding is documented on myocardial scintigraphy.","meaning":"Boolean indicating whether the patient's myocardial ischemia finding is documented on myocardial scintigraphy."} // "documented myocardial ischemia on myocardial scintigraphy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable for coronary heart disease
(assert
  (! (=> patient_has_diagnosis_of_coronary_heart_disease_inthehistory@@documented
         patient_has_diagnosis_of_coronary_heart_disease_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "documented coronary heart disease"

;; Qualifier variable implies corresponding stem variable for myocardial ischemia
(assert
  (! (=> patient_has_finding_of_myocardial_ischemia_inthehistory@@documented_on_myocardial_scintigraphy
         patient_has_finding_of_myocardial_ischemia_inthehistory)
     :named REQ4_AUXILIARY1)) ;; "documented myocardial ischemia on myocardial scintigraphy"

;; Exhaustive subcategories: documented coronary heart disease ≡ (prior myocardial infarction ∨ prior coronary angiography ∨ prior coronary angioplasty ∨ documented myocardial ischemia on myocardial scintigraphy)
(assert
  (! (= patient_has_diagnosis_of_coronary_heart_disease_inthehistory@@documented
        (or patient_has_diagnosis_of_myocardial_infarction_inthehistory
            patient_has_undergone_coronary_angiography_inthehistory
            patient_has_undergone_coronary_angioplasty_inthehistory
            patient_has_finding_of_myocardial_ischemia_inthehistory@@documented_on_myocardial_scintigraphy))
     :named REQ4_AUXILIARY2)) ;; "prior myocardial infarction, prior coronary angiography or prior coronary angioplasty, or documented myocardial ischemia on myocardial scintigraphy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_diagnosis_of_coronary_heart_disease_inthehistory@@documented
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have documented coronary heart disease (prior myocardial infarction, prior coronary angiography or prior coronary angioplasty, or documented myocardial ischemia on myocardial scintigraphy)."
