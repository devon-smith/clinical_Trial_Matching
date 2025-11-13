;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (BMI) recorded now is available, in kg/m^2.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} ;; "body mass index"
(declare-const patient_body_mass_value_recorded_now_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured body mass value if a numeric measurement of the patient's body mass recorded now is available, in kilograms.","when_to_set_to_null":"Set to null if no such body mass measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass in kilograms."} ;; "body mass"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a body mass index > 30."

(assert
(! (not (> patient_body_mass_value_recorded_now_withunit_kg 70))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a body mass > 70 kilograms."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_allergy_to_ultrasound_gel_material_applied_to_skin_surface_as_acoustic_transmission_medium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to ultrasound gel material applied to the skin surface as an acoustic transmission medium.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to ultrasound gel material applied to the skin surface as an acoustic transmission medium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to ultrasound gel material applied to the skin surface as an acoustic transmission medium.","meaning":"Boolean indicating whether the patient currently has an allergy to ultrasound gel material applied to the skin surface as an acoustic transmission medium."} ;; "has an allergy to ultrasound gel material applied to the skin surface as an acoustic transmission medium."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_allergy_to_ultrasound_gel_material_applied_to_skin_surface_as_acoustic_transmission_medium_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to ultrasound gel material applied to the skin surface as an acoustic transmission medium."
