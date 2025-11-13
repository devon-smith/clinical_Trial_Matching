;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_prisoner_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a prisoner.","when_to_set_to_false":"Set to false if the patient is currently not a prisoner.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a prisoner.","meaning":"Boolean indicating whether the patient is currently a prisoner."} ;; "The patient is excluded if the patient is a prisoner."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_prisoner_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a prisoner."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has pregnancy"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is a woman"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_sex_is_female_now patient_is_pregnant_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a woman) AND (the patient has pregnancy)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mental disorder (mental illness).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mental disorder (mental illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mental disorder (mental illness).","meaning":"Boolean indicating whether the patient currently has a diagnosis of mental disorder."} ;; "mental illness"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_mental_disorder_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a patient with mental illness."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is under the age of 18 years OR the patient is over the age of 85 years"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (< patient_age_value_recorded_now_in_years 18))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is under the age of 18 years."

(assert
  (! (not (> patient_age_value_recorded_now_in_years 85))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is over the age of 85 years."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_asa_classification_v_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ASA classification V.","when_to_set_to_false":"Set to false if the patient currently does not have ASA classification V.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ASA classification V.","meaning":"Boolean indicating whether the patient currently has ASA classification V."} ;; "The patient is excluded if the patient has American Society of Anesthesiologists classification V."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_asa_classification_v_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has American Society of Anesthesiologists classification V."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "alcohol abuse"
(declare-const patient_has_finding_of_drug_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of drug abuse.","meaning":"Boolean indicating whether the patient currently has drug abuse."} ;; "drug abuse"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a patient with alcohol abuse."

(assert
(! (not patient_has_finding_of_drug_abuse_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a patient with drug abuse."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_cerebral_perfusion_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current cerebral perfusion pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current cerebral perfusion pressure in millimeters of mercury."} ;; "cerebral perfusion pressure greater than 150 millimeters of mercury" and "cerebral perfusion pressure less than 50 millimeters of mercury"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (> patient_cerebral_perfusion_pressure_value_recorded_now_withunit_millimeters_of_mercury 150))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cerebral perfusion pressure greater than 150 millimeters of mercury."

(assert
(! (not (< patient_cerebral_perfusion_pressure_value_recorded_now_withunit_millimeters_of_mercury 50))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cerebral perfusion pressure less than 50 millimeters of mercury."
