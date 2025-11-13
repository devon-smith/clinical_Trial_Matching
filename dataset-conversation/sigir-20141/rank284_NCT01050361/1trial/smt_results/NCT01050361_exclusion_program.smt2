;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_expected_hospital_stay_duration_in_hours Real) ;; {"when_to_set_to_value":"Set to the expected number of hours the patient is anticipated to stay in the hospital, as determined by clinical judgment or hospital documentation.","when_to_set_to_null":"Set to null if the expected duration of hospital stay is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the expected duration of the patient's hospital stay in hours."} ;; "expected to stay in the hospital for less than twenty-four hours"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_expected_hospital_stay_duration_in_hours 24))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is expected to stay in the hospital for less than twenty-four hours."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_can_undergo_transthoracic_echocardiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo transthoracic echocardiography.","when_to_set_to_false":"Set to false if the patient currently cannot undergo transthoracic echocardiography (i.e., has an inability to undergo the procedure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo transthoracic echocardiography.","meaning":"Boolean indicating whether the patient can currently undergo transthoracic echocardiography."} ;; "transthoracic echocardiogram"
(declare-const patient_can_undergo_transesophageal_echocardiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo transesophageal echocardiography.","when_to_set_to_false":"Set to false if the patient currently cannot undergo transesophageal echocardiography (i.e., has an inability to undergo the procedure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo transesophageal echocardiography.","meaning":"Boolean indicating whether the patient can currently undergo transesophageal echocardiography."} ;; "transesophageal echocardiogram"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and (not patient_can_undergo_transthoracic_echocardiography_now)
             (not patient_can_undergo_transesophageal_echocardiography_now)))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has an inability to undergo transthoracic echocardiogram) AND (the patient has an inability to undergo transesophageal echocardiogram)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_clinical_signs_of_raised_intracranial_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of raised intracranial pressure.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of raised intracranial pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of raised intracranial pressure.","meaning":"Boolean indicating whether the patient currently has clinical signs of raised intracranial pressure."} ;; "clinical evidence of elevated intracranial pressure"
(declare-const patient_has_suspicion_of_raised_intracranial_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have raised intracranial pressure.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have raised intracranial pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have raised intracranial pressure.","meaning":"Boolean indicating whether the patient currently is suspected to have raised intracranial pressure."} ;; "suspicion of elevated intracranial pressure"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have clinical evidence or suspicion of elevated intracranial pressure
(assert
(! (not (or patient_has_clinical_signs_of_raised_intracranial_pressure_now
            patient_has_suspicion_of_raised_intracranial_pressure_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has clinical evidence of elevated intracranial pressure) OR (the patient has suspicion of elevated intracranial pressure)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shock.","meaning":"Boolean indicating whether the patient currently has shock."} ;; "preoperative shock"

(declare-const patient_has_finding_of_sepsis_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sepsis syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sepsis syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of sepsis syndrome.","meaning":"Boolean indicating whether the patient currently has sepsis syndrome."} ;; "systemic sepsis"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_finding_of_shock_now
            patient_has_finding_of_sepsis_syndrome_now))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has preoperative shock) OR (the patient has systemic sepsis)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_undergoing_emergency_operation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing an emergency operation.","when_to_set_to_false":"Set to false if the patient is not currently undergoing an emergency operation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing an emergency operation.","meaning":"Boolean indicating whether the patient is currently undergoing an emergency operation."} ;; "emergency operation"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_undergoing_emergency_operation_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is undergoing an emergency operation."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_asa_class_v_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ASA Class V status.","when_to_set_to_false":"Set to false if the patient currently does not have ASA Class V status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ASA Class V status.","meaning":"Boolean indicating whether the patient currently has ASA Class V status."} ;; "the patient is American Society of Anesthesiologists Class V"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_asa_class_v_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is American Society of Anesthesiologists Class V."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_inability_to_give_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an inability to give informed consent.","when_to_set_to_false":"Set to false if the patient does not have an inability to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an inability to give informed consent.","meaning":"Boolean indicating whether the patient has an inability to give informed consent."} ;; "The patient is excluded if the patient has an inability to give informed consent."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_inability_to_give_informed_consent)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an inability to give informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_participating_in_another_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in another clinical trial.","when_to_set_to_false":"Set to false if the patient is currently not participating in another clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in another clinical trial."} ;; "The patient is excluded if the patient is participating in another clinical trial."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_participating_in_another_clinical_trial_now)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is participating in another clinical trial."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_prisoner_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a prisoner.","when_to_set_to_false":"Set to false if the patient is currently not a prisoner.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a prisoner.","meaning":"Boolean indicating whether the patient is currently a prisoner."} ;; "The patient is excluded if the patient is a prisoner."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_prisoner_now)
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a prisoner."
