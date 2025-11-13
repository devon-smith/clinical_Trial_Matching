;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_bronchodilator_inthepast1hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient received or was exposed to a bronchodilator substance in the one hour prior to enrollment.","when_to_set_to_false":"Set to false if the patient was not exposed to a bronchodilator substance in the one hour prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to a bronchodilator substance in the one hour prior to enrollment.","meaning":"Boolean indicating whether the patient was exposed to a bronchodilator substance in the one hour prior to enrollment."} ;; "has received at least one dose of inhaled bronchodilator medication in the time window of one hour prior to enrollment."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_exposed_to_bronchodilator_inthepast1hours)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received at least one dose of inhaled bronchodilator medication in the time window of one hour prior to enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const oral_steroid_medication_dose_count_in_30min_to_5hr_prior_to_enrollment Real) ;; {"when_to_set_to_value":"Set to the number of doses of oral steroid medication the patient received in the time window of thirty minutes to five hours prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many doses of oral steroid medication the patient received in the time window of thirty minutes to five hours prior to enrollment.","meaning":"Numeric variable for the number of doses of oral steroid medication received in the specified time window prior to enrollment."} ;; "at least one dose of oral steroid medication in the time window of thirty minutes to five hours prior to enrollment"

(declare-const intravenous_steroid_medication_dose_count_in_30min_to_5hr_prior_to_enrollment Real) ;; {"when_to_set_to_value":"Set to the number of doses of intravenous steroid medication the patient received in the time window of thirty minutes to five hours prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many doses of intravenous steroid medication the patient received in the time window of thirty minutes to five hours prior to enrollment.","meaning":"Numeric variable for the number of doses of intravenous steroid medication received in the specified time window prior to enrollment."} ;; "at least one dose of intravenous steroid medication in the time window of thirty minutes to five hours prior to enrollment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (or (>= oral_steroid_medication_dose_count_in_30min_to_5hr_prior_to_enrollment 1)
              (>= intravenous_steroid_medication_dose_count_in_30min_to_5hr_prior_to_enrollment 1)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received (at least one dose of oral steroid medication in the time window of thirty minutes to five hours prior to enrollment) OR (at least one dose of intravenous steroid medication in the time window of thirty minutes to five hours prior to enrollment)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving mechanical ventilation (artificial respiration) at the time of enrollment.","when_to_set_to_false":"Set to false if the patient is not currently receiving mechanical ventilation (artificial respiration) at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving mechanical ventilation (artificial respiration) at the time of enrollment.","meaning":"Boolean indicating whether the patient is currently undergoing artificial respiration (mechanical ventilation) now."} ;; "mechanical ventilation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_undergoing_artificial_respiration_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving mechanical ventilation at the time of enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_skin_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a skin lesion.","when_to_set_to_false":"Set to false if the patient currently does not have a skin lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a skin lesion.","meaning":"Boolean indicating whether the patient currently has a skin lesion."} ;; "skin lesion"
(declare-const patient_has_finding_of_skin_lesion_now@@anatomical_location_chest Bool) ;; {"when_to_set_to_true":"Set to true if the skin lesion is located on the chest.","when_to_set_to_false":"Set to false if the skin lesion is not located on the chest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the skin lesion is located on the chest.","meaning":"Boolean indicating whether the skin lesion is located on the chest."} ;; "chest skin lesion"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_skin_lesion_now@@anatomical_location_chest
      patient_has_finding_of_skin_lesion_now)
:named REQ3_AUXILIARY0)) ;; "skin lesion located on the chest implies skin lesion"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_skin_lesion_now@@anatomical_location_chest)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has at least one chest skin lesion."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis."} ;; "cystic fibrosis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_cystic_fibrosis_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cystic fibrosis."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemodynamic instability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemodynamic instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemodynamic instability.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability."} ;; "hemodynamic instability"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_finding_of_hemodynamic_instability_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamic instability."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_parent_or_guardian_objecting_to_study_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a parent or guardian who objects to the study protocol.","when_to_set_to_false":"Set to false if the patient currently does not have a parent or guardian who objects to the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a parent or guardian who objects to the study protocol.","meaning":"Boolean indicating whether the patient currently has a parent or guardian who objects to the study protocol."} ;; "has a parent or guardian who objects to the study protocol."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_parent_or_guardian_objecting_to_study_protocol_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a parent or guardian who objects to the study protocol."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_currently_participating_in_other_clinical_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in at least one other clinical study.","when_to_set_to_false":"Set to false if the patient is not currently participating in any other clinical study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any other clinical study.","meaning":"Boolean indicating whether the patient is currently participating in at least one other clinical study."} ;; "concurrently participating in at least one other clinical study"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_currently_participating_in_other_clinical_study)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is concurrently participating in at least one other clinical study."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_physician_who_objects_to_study_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physician who objects to the study protocol.","when_to_set_to_false":"Set to false if the patient currently does not have a physician who objects to the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physician who objects to the study protocol.","meaning":"Boolean indicating whether the patient currently has a physician who objects to the study protocol."} ;; "The patient is excluded if the patient has a physician who objects to the study protocol."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_physician_who_objects_to_study_protocol_now)
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a physician who objects to the study protocol."
