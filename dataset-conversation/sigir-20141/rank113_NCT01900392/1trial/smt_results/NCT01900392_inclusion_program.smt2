;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "an adult with age ≥ 30 years AND age ≤ 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be an adult with age ≥ 30 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 30)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an adult with age ≥ 30 years."

;; Component 1: To be included, the patient must be an adult with age ≤ 80 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an adult with age ≤ 80 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_inthehistory_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value (kg/m²) if a BMI measurement is available from any time prior to starting Weight Watchers.","when_to_set_to_null":"Set to null if no BMI measurement prior to starting Weight Watchers is available or the value is indeterminate.","meaning":"Numeric value representing the patient's BMI (kg/m²) measured prior to starting Weight Watchers."} ;; "body mass index ≥ 30 AND body mass index ≤ 45 prior to starting Weight Watchers"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_inthehistory_withunit_kg_per_m2 30)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body mass index ≥ 30 prior to starting Weight Watchers"

(assert
  (! (<= patient_body_mass_index_value_recorded_inthehistory_withunit_kg_per_m2 45)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "body mass index ≤ 45 prior to starting Weight Watchers"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_weight_loss_value_recorded_inthepast6months_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the documented value in kilograms if the patient's weight loss within the past 6 months prior to enrolling is recorded.","when_to_set_to_null":"Set to null if no documented weight loss value within the past 6 months prior to enrolling is available or the value is indeterminate.","meaning":"Numeric value representing the patient's documented weight loss in kilograms within the past 6 months prior to enrolling."} ;; "documented weight loss of at least 5 kilograms within the 4 to 6 months prior to enrolling"
(declare-const patient_weight_loss_value_recorded_inthepast6months_withunit_kilograms@@temporalcontext_within4to6months_prior_to_enrolling Bool) ;; {"when_to_set_to_true":"Set to true if the documented weight loss occurred specifically within the 4 to 6 months prior to enrolling.","when_to_set_to_false":"Set to false if the documented weight loss did not occur within the 4 to 6 months prior to enrolling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the weight loss occurred within the 4 to 6 months prior to enrolling.","meaning":"Boolean indicating whether the documented weight loss occurred within the 4 to 6 months prior to enrolling."} ;; "documented weight loss of at least 5 kilograms within the 4 to 6 months prior to enrolling"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
  (! (=> patient_weight_loss_value_recorded_inthepast6months_withunit_kilograms@@temporalcontext_within4to6months_prior_to_enrolling
         (>= patient_weight_loss_value_recorded_inthepast6months_withunit_kilograms 0))
     :named REQ2_AUXILIARY0)) ;; "documented weight loss in the past 6 months, specifically within the 4 to 6 months prior to enrolling"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must have a documented weight loss of at least 5 kg within the 4 to 6 months prior to enrolling
(assert
  (! (and patient_weight_loss_value_recorded_inthepast6months_withunit_kilograms@@temporalcontext_within4to6months_prior_to_enrolling
          (>= patient_weight_loss_value_recorded_inthepast6months_withunit_kilograms 5.0))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "documented weight loss of at least 5 kilograms within the 4 to 6 months prior to enrolling"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_patient_s_condition_stable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stable health status.","when_to_set_to_false":"Set to false if the patient currently does not have stable health status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stable health status.","meaning":"Boolean indicating whether the patient currently has stable health status."} ;; "stable health status"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_patient_s_condition_stable_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have stable health status."
