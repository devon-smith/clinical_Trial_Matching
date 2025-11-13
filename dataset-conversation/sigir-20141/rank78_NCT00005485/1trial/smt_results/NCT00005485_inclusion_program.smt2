;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_african_american_race_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently identified as being of African American race.","when_to_set_to_false":"Set to false if the patient is currently identified as not being of African American race.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently identified as being of African American race.","meaning":"Boolean indicating whether the patient is currently identified as being of African American race."} // "To be included, the patient must be a person of African American race."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_african_american_race_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a person of African American race."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_resident_of_jackson_mississippi_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a resident of Jackson, Mississippi.","when_to_set_to_false":"Set to false if the patient is currently not a resident of Jackson, Mississippi.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a resident of Jackson, Mississippi.","meaning":"Boolean indicating whether the patient is currently a resident of Jackson, Mississippi."} // "To be included, the patient must be a resident of Jackson, Mississippi."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_resident_of_jackson_mississippi_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a resident of Jackson, Mississippi."
