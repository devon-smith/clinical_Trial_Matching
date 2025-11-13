;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."}  ;; "To be included, the patient must have no major organ disease."
(declare-const patient_has_finding_of_disease_now@@is_major_organ_disease Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient qualifies as a major organ disease.","when_to_set_to_false":"Set to false if the disease present in the patient does not qualify as a major organ disease, or if no disease is present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present qualifies as a major organ disease.","meaning":"Boolean indicating whether the disease present in the patient is a major organ disease."}  ;; "To be included, the patient must have no major organ disease."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; If the patient has a major organ disease, then the patient must have a disease
(assert
  (! (=> patient_has_finding_of_disease_now@@is_major_organ_disease
         patient_has_finding_of_disease_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have no major organ disease."

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must NOT have a major organ disease
(assert
  (! (not patient_has_finding_of_disease_now@@is_major_organ_disease)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no major organ disease."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_fasting_blood_glucose_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's fasting blood glucose concentration is recorded now in milligrams per deciliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's fasting blood glucose concentration measured now, in milligrams per deciliter."}  ;; "fasting blood glucose concentration"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (< patient_fasting_blood_glucose_measurement_value_recorded_now_withunit_milligrams_per_deciliter 126.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have fasting blood glucose concentration < 126 milligrams per deciliter."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body mass index (BMI) recorded now, in kilograms per square meter."}  ;; "body mass index"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≥ 25 kilograms per square meter."

(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 35.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≤ 35 kilograms per square meter."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."}  ;; "a nonpregnant patient"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."}  ;; "a nonlactating patient"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must be a nonpregnant patient.
(assert
  (! (not patient_is_pregnant_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a nonpregnant patient."

;; Component 1: To be included, the patient must be a nonlactating patient.
(assert
  (! (not patient_is_lactating_now)
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a nonlactating patient."
