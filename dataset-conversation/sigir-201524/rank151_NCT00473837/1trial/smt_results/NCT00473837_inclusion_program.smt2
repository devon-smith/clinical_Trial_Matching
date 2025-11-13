;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "aged ≥ 12 months AND aged ≤ 6 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_months 12.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 12 months."

(assert
  (! (<= patient_age_value_recorded_now_in_months 72.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 6 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_fever_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had fever at any time in the preceding 48 hours.","when_to_set_to_false":"Set to false if the patient has not had fever in the preceding 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had fever in the preceding 48 hours.","meaning":"Boolean indicating whether the patient has had fever in the preceding 48 hours."} // "have a history of fever in the preceding 48 hours"
(declare-const patient_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature in degrees Celsius is recorded now.","when_to_set_to_null":"Set to null if no temperature measurement is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's measured body temperature in degrees Celsius recorded now."} // "measured temperature > 37.5 degrees Celsius"
(declare-const patient_peripheral_blood_smear_interpretation_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the density of asexual forms of Plasmodium falciparum in the peripheral blood film per microliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is recorded now or the value is indeterminate.","meaning":"Numeric value representing the density of asexual forms of Plasmodium falciparum in the peripheral blood film per microliter recorded now."} // "asexual forms of Plasmodium falciparum in the peripheral blood film ≥ 500 per microliter"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: ((history of fever in preceding 48 hours) OR (measured temperature > 37.5°C))
(assert
  (! (or patient_has_finding_of_fever_inthepast48hours
         (> patient_temperature_value_recorded_now_withunit_degrees_celsius 37.5))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((have a history of fever in the preceding 48 hours) OR (have a measured temperature > 37.5 degrees Celsius))"

;; Component 1: asexual forms of Plasmodium falciparum in peripheral blood film ≥ 500/μl
(assert
  (! (>= patient_peripheral_blood_smear_interpretation_value_recorded_now_withunit_per_microliter 500)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have asexual forms of Plasmodium falciparum in the peripheral blood film ≥ 500 per microliter"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_hemoglobin_finding_value_recorded_now_withunit_grams_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin concentration in grams per liter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current hemoglobin concentration in grams per liter."} // "haemoglobin level"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: haemoglobin level < 110 grams per liter
(assert
  (! (< patient_hemoglobin_finding_value_recorded_now_withunit_grams_per_liter 110.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have a haemoglobin level < 110 grams per liter"

;; Component 1: haemoglobin level > 69 grams per liter
(assert
  (! (> patient_hemoglobin_finding_value_recorded_now_withunit_grams_per_liter 69.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have a haemoglobin level > 69 grams per liter"
