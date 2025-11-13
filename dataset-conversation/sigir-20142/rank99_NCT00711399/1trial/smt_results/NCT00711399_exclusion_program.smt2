;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_chest_tube_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chest tube in place.","when_to_set_to_false":"Set to false if the patient currently does not have a chest tube in place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chest tube in place.","meaning":"Boolean indicating whether the patient currently has a chest tube in place."} ;; "The patient is excluded if the patient has a chest tube."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_chest_tube_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chest tube."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_skin_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a skin lesion.","when_to_set_to_false":"Set to false if the patient currently does not have a skin lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a skin lesion.","meaning":"Boolean indicating whether the patient currently has a skin lesion."} ;; "skin lesion"
(declare-const patient_has_finding_of_skin_lesion_now@@precludes_attachment_of_sensor Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current skin lesion precludes attachment of a sensor.","when_to_set_to_false":"Set to false if the patient's current skin lesion does not preclude attachment of a sensor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current skin lesion precludes attachment of a sensor.","meaning":"Boolean indicating whether the patient's current skin lesion precludes attachment of a sensor."} ;; "skin lesion that precludes attachment of sensor"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_skin_lesion_now@@precludes_attachment_of_sensor
      patient_has_finding_of_skin_lesion_now)
:named REQ1_AUXILIARY0)) ;; "skin lesion that precludes attachment of sensor"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_skin_lesion_now@@precludes_attachment_of_sensor)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a skin lesion that precludes attachment of sensor."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_respiratory_distress_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory distress.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of respiratory distress.","meaning":"Boolean indicating whether the patient currently has respiratory distress."} ;; "respiratory distress"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_respiratory_distress_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has respiratory distress."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "pregnant woman"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is female.","when_to_set_to_false":"Set to false if the patient's current sex is not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "woman"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (and patient_is_pregnant_now patient_sex_is_female_now))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a pregnant woman."
