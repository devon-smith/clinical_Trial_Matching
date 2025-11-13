;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_in_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized (admitted to a hospital at the present time).","when_to_set_to_false":"Set to false if the patient is currently not hospitalized (not admitted to a hospital at the present time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized (admitted to a hospital at the present time)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_patient_in_hospital_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is hospitalized."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_surgical_procedure_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure at any time within the past four weeks.","when_to_set_to_false":"Set to false if the patient has not undergone any surgical procedure within the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within the past four weeks.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within the past four weeks."} ;; "the patient has had major surgery within the last four weeks"
(declare-const patient_has_undergone_clinical_trial_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a clinical trial at any time within the past four weeks.","when_to_set_to_false":"Set to false if the patient has not participated in any clinical trial within the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a clinical trial within the past four weeks.","meaning":"Boolean indicating whether the patient has participated in a clinical trial within the past four weeks."} ;; "the patient has participated in another clinical trial within the last four weeks"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthepast4weeks)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has had major surgery within the last four weeks"

(assert
(! (not patient_has_undergone_clinical_trial_inthepast4weeks)
:named REQ1_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has participated in another clinical trial within the last four weeks"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_breathing_tube_for_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on a breathing tube and the indication for the breathing tube is asthma.","when_to_set_to_false":"Set to false if the patient is currently not on a breathing tube for asthma, including if the patient is not on a breathing tube or the breathing tube is for a reason other than asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on a breathing tube for asthma.","meaning":"Boolean indicating whether the patient is currently on a breathing tube specifically for asthma."} ;; "has been on a breathing tube for asthma"

(declare-const patient_has_breathing_tube_for_asthma_now@@indication_is_asthma Bool) ;; {"when_to_set_to_true":"Set to true if the breathing tube is used for asthma.","when_to_set_to_false":"Set to false if the breathing tube is not used for asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the breathing tube is used for asthma.","meaning":"Boolean indicating whether the breathing tube is used for asthma."} ;; "breathing tube ... for asthma"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_breathing_tube_for_asthma_now@@indication_is_asthma
      patient_has_breathing_tube_for_asthma_now)
   :named REQ2_AUXILIARY0)) ;; "breathing tube ... for asthma"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_breathing_tube_for_asthma_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been on a breathing tube for asthma."
