;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_indication_for_in_vitro_fertilization_for_the_couple Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an indication for in vitro fertilization for the couple.","when_to_set_to_false":"Set to false if the patient does not have an indication for in vitro fertilization for the couple.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an indication for in vitro fertilization for the couple.","meaning":"Boolean indicating whether the patient has an indication for in vitro fertilization for the couple."} // "an indication for in vitro fertilization for the couple"
(declare-const patient_has_indication_for_intracytoplasmic_sperm_injection_for_the_couple Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an indication for intracytoplasmic sperm injection for the couple.","when_to_set_to_false":"Set to false if the patient does not have an indication for intracytoplasmic sperm injection for the couple.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an indication for intracytoplasmic sperm injection for the couple.","meaning":"Boolean indicating whether the patient has an indication for intracytoplasmic sperm injection for the couple."} // "an indication for intracytoplasmic sperm injection for the couple"
(declare-const patient_has_undergone_in_vitro_fertilization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone in vitro fertilization now.","when_to_set_to_false":"Set to false if the patient has not undergone in vitro fertilization now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone in vitro fertilization now.","meaning":"Boolean indicating whether the patient has undergone in vitro fertilization now."} // "has undergone in vitro fertilization now"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must have (an indication for in vitro fertilization for the couple OR an indication for intracytoplasmic sperm injection for the couple).
(assert
  (! (or patient_has_indication_for_in_vitro_fertilization_for_the_couple
         patient_has_indication_for_intracytoplasmic_sperm_injection_for_the_couple)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (an indication for in vitro fertilization for the couple OR an indication for intracytoplasmic sperm injection for the couple)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged > 18 years AND < 38 years at randomization"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "a woman"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patient_sex_is_female_now
          (> patient_age_value_recorded_now_in_years 18.0))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a woman aged > 18 years at randomization."

(assert
  (! (and patient_sex_is_female_now
          (< patient_age_value_recorded_now_in_years 38.0))
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a woman aged < 38 years at randomization."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_undergoing_first_in_vitro_fertilization_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing the first in vitro fertilization treatment.","when_to_set_to_false":"Set to false if the patient is not currently undergoing the first in vitro fertilization treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing the first in vitro fertilization treatment.","meaning":"Boolean indicating whether the patient is currently undergoing the first in vitro fertilization treatment."} // "undergoing the first in vitro fertilization treatment"
(declare-const patient_is_undergoing_second_in_vitro_fertilization_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing the second in vitro fertilization treatment.","when_to_set_to_false":"Set to false if the patient is not currently undergoing the second in vitro fertilization treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing the second in vitro fertilization treatment.","meaning":"Boolean indicating whether the patient is currently undergoing the second in vitro fertilization treatment."} // "undergoing the second in vitro fertilization treatment"
(declare-const patient_is_undergoing_third_in_vitro_fertilization_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing the third in vitro fertilization treatment.","when_to_set_to_false":"Set to false if the patient is not currently undergoing the third in vitro fertilization treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing the third in vitro fertilization treatment.","meaning":"Boolean indicating whether the patient is currently undergoing the third in vitro fertilization treatment."} // "undergoing the third in vitro fertilization treatment"
(declare-const patient_is_undergoing_first_intracytoplasmic_sperm_injection_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing the first intracytoplasmic sperm injection treatment.","when_to_set_to_false":"Set to false if the patient is not currently undergoing the first intracytoplasmic sperm injection treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing the first intracytoplasmic sperm injection treatment.","meaning":"Boolean indicating whether the patient is currently undergoing the first intracytoplasmic sperm injection treatment."} // "undergoing the first intracytoplasmic sperm injection treatment"
(declare-const patient_is_undergoing_second_intracytoplasmic_sperm_injection_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing the second intracytoplasmic sperm injection treatment.","when_to_set_to_false":"Set to false if the patient is not currently undergoing the second intracytoplasmic sperm injection treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing the second intracytoplasmic sperm injection treatment.","meaning":"Boolean indicating whether the patient is currently undergoing the second intracytoplasmic sperm injection treatment."} // "undergoing the second intracytoplasmic sperm injection treatment"
(declare-const patient_is_undergoing_third_intracytoplasmic_sperm_injection_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing the third intracytoplasmic sperm injection treatment.","when_to_set_to_false":"Set to false if the patient is not currently undergoing the third intracytoplasmic sperm injection treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing the third intracytoplasmic sperm injection treatment.","meaning":"Boolean indicating whether the patient is currently undergoing the third intracytoplasmic sperm injection treatment."} // "undergoing the third intracytoplasmic sperm injection treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be (undergoing the first in vitro fertilization treatment OR undergoing the second in vitro fertilization treatment OR undergoing the third in vitro fertilization treatment OR undergoing the first intracytoplasmic sperm injection treatment OR undergoing the second intracytoplasmic sperm injection treatment OR undergoing the third intracytoplasmic sperm injection treatment).
(assert
  (! (or patient_is_undergoing_first_in_vitro_fertilization_treatment_now
         patient_is_undergoing_second_in_vitro_fertilization_treatment_now
         patient_is_undergoing_third_in_vitro_fertilization_treatment_now
         patient_is_undergoing_first_intracytoplasmic_sperm_injection_treatment_now
         patient_is_undergoing_second_intracytoplasmic_sperm_injection_treatment_now
         patient_is_undergoing_third_intracytoplasmic_sperm_injection_treatment_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (undergoing the first in vitro fertilization treatment OR undergoing the second in vitro fertilization treatment OR undergoing the third in vitro fertilization treatment OR undergoing the first intracytoplasmic sperm injection treatment OR undergoing the second intracytoplasmic sperm injection treatment OR undergoing the third intracytoplasmic sperm injection treatment)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m2 if a numeric measurement of the patient's body mass index recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m2."} // "body mass index"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have body mass index ≥ 30.0 kg/m2.
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_m2 30.0)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "body mass index ≥ 30.0 kg/m2"

;; Component 1: To be included, the patient must have body mass index < 35.0 kg/m2.
(assert
  (! (< patient_body_mass_index_value_recorded_now_withunit_kg_m2 35.0)
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "body mass index < 35.0 kg/m2"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_willing_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to participate in the study.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to participate in the study.","meaning":"Boolean indicating whether the patient is willing to participate in the study."} // "the patient must be willing to participate"
(declare-const patient_is_willing_to_sign_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to sign the informed consent document.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to sign the informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to sign the informed consent document.","meaning":"Boolean indicating whether the patient is willing to sign the informed consent document."} // "the patient must be willing to sign informed consent"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: The patient must be willing to participate.
(assert
  (! patient_is_willing_to_participate
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to participate"

;; Component 1: The patient must be willing to sign informed consent.
(assert
  (! patient_is_willing_to_sign_informed_consent
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to sign informed consent"
