;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than eighteen years old"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than eighteen years old."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_bilateral_peritonsillar_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bilateral peritonsillar abscesses.","when_to_set_to_false":"Set to false if the patient currently does not have bilateral peritonsillar abscesses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bilateral peritonsillar abscesses.","meaning":"Boolean indicating whether the patient currently has bilateral peritonsillar abscesses."} ;; "the patient has bilateral peritonsillar abscesses."
(declare-const patient_has_finding_of_peritonsillar_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peritonsillar abscess.","when_to_set_to_false":"Set to false if the patient currently does not have peritonsillar abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peritonsillar abscess.","meaning":"Boolean indicating whether the patient currently has peritonsillar abscess."} ;; "peritonsillar abscesses"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Bilateral peritonsillar abscess implies peritonsillar abscess
(assert
(! (=> patient_has_finding_of_bilateral_peritonsillar_abscess_now
       patient_has_finding_of_peritonsillar_abscess_now)
   :named REQ2_AUXILIARY0)) ;; "bilateral peritonsillar abscesses" implies "peritonsillar abscesses"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_bilateral_peritonsillar_abscess_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bilateral peritonsillar abscesses."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_peritonsillar_abscess_now@@recently_drained Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a peritonsillar abscess and the abscess has been recently drained.","when_to_set_to_false":"Set to false if the patient currently has a peritonsillar abscess but it has not been recently drained.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peritonsillar abscess has been recently drained.","meaning":"Boolean indicating whether the patient's current peritonsillar abscess has been recently drained."} ;; "recently drained peritonsillar abscess"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_peritonsillar_abscess_now@@recently_drained
      patient_has_finding_of_peritonsillar_abscess_now)
:named REQ3_AUXILIARY0)) ;; "recently drained peritonsillar abscess""

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_peritonsillar_abscess_now@@recently_drained)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recently drained peritonsillar abscess."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_patient_immunocompromised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently immunocompromised.","when_to_set_to_false":"Set to false if the patient is currently not immunocompromised.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently immunocompromised.","meaning":"Boolean indicating whether the patient is currently immunocompromised."} ;; "immunocompromised"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_patient_immunocompromised_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is immunocompromised."
