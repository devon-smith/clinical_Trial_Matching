;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_deafness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has deafness.","when_to_set_to_false":"Set to false if the patient currently does not have deafness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has deafness.","meaning":"Boolean indicating whether the patient currently has deafness."} ;; "the patient has no communication possible due to deafness"
(declare-const patient_has_deafness_now@@causes_no_communication_possible Bool) ;; {"when_to_set_to_true":"Set to true if the patient's deafness causes no communication possible.","when_to_set_to_false":"Set to false if the patient's deafness does not cause no communication possible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's deafness causes no communication possible.","meaning":"Boolean indicating whether the patient's deafness causes no communication possible."} ;; "the patient has no communication possible due to deafness"
(declare-const patients_language_barrier_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a language barrier.","when_to_set_to_false":"Set to false if the patient currently does not have a language barrier.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a language barrier.","meaning":"Boolean indicating whether the patient currently has a language barrier now."} ;; "the patient has no communication possible due to a language barrier"
(declare-const patients_language_barrier_is_positive_now@@causes_no_communication_possible Bool) ;; {"when_to_set_to_true":"Set to true if the patient's language barrier causes no communication possible.","when_to_set_to_false":"Set to false if the patient's language barrier does not cause no communication possible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's language barrier causes no communication possible.","meaning":"Boolean indicating whether the patient's language barrier causes no communication possible."} ;; "the patient has no communication possible due to a language barrier"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_deafness_now@@causes_no_communication_possible
       patient_has_deafness_now)
   :named REQ0_AUXILIARY0)) ;; "the patient has no communication possible due to deafness"

(assert
(! (=> patients_language_barrier_is_positive_now@@causes_no_communication_possible
       patients_language_barrier_is_positive_now)
   :named REQ0_AUXILIARY1)) ;; "the patient has no communication possible due to a language barrier"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patients_language_barrier_is_positive_now@@causes_no_communication_possible)
   :named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has no communication possible due to a language barrier"

(assert
(! (not patient_has_deafness_now@@causes_no_communication_possible)
   :named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has no communication possible due to deafness"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_operation_on_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a procedure on the nervous system (neurological surgery).","when_to_set_to_false":"Set to false if the patient is currently not undergoing a procedure on the nervous system (neurological surgery).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a procedure on the nervous system (neurological surgery).","meaning":"Boolean indicating whether the patient is currently undergoing a procedure on the nervous system (neurological surgery)."} ;; "neurological surgery"
(declare-const patient_is_undergoing_operation_on_nervous_system_now@@is_reason_for_hospital_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a procedure on the nervous system (neurological surgery) and this procedure is the reason for hospital admission.","when_to_set_to_false":"Set to false if the patient is currently undergoing a procedure on the nervous system (neurological surgery) but it is not the reason for hospital admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is the reason for hospital admission.","meaning":"Boolean indicating whether the patient's current neurological surgery is the reason for hospital admission."} ;; "neurological surgery is the reason for hospital admission"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_undergoing_operation_on_nervous_system_now@@is_reason_for_hospital_admission)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is admitted for neurological surgery."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_participated_in_this_study_in_previous_hospital_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in this study during any previous hospital admission.","when_to_set_to_false":"Set to false if the patient has never participated in this study during any previous hospital admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in this study during any previous hospital admission.","meaning":"Boolean indicating whether the patient has participated in this study during any previous hospital admission."} ;; "participated in this study during a previous hospital admission"

(declare-const patient_has_undergone_hospital_admission_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a hospital admission at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a hospital admission at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a hospital admission.","meaning":"Boolean indicating whether the patient has ever undergone a hospital admission in their history."} ;; "hospital admission"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_participated_in_this_study_in_previous_hospital_admission)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient participated in this study during a previous hospital admission."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_practical_reasons_hampering_delirium_monitor_use_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has practical reasons that hamper the use of the delirium monitor.","when_to_set_to_false":"Set to false if the patient currently does not have practical reasons that hamper the use of the delirium monitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has practical reasons that hamper the use of the delirium monitor.","meaning":"Boolean indicating whether the patient currently has practical reasons that hamper the use of the delirium monitor."} ;; "the patient has practical reasons hampering the use of the delirium monitor"
(declare-const patient_has_logistical_reasons_hampering_delirium_monitor_use_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has logistical reasons that hamper the use of the delirium monitor.","when_to_set_to_false":"Set to false if the patient currently does not have logistical reasons that hamper the use of the delirium monitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has logistical reasons that hamper the use of the delirium monitor.","meaning":"Boolean indicating whether the patient currently has logistical reasons that hamper the use of the delirium monitor."} ;; "the patient has logistical reasons hampering the use of the delirium monitor"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_practical_reasons_hampering_delirium_monitor_use_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has practical reasons hampering the use of the delirium monitor with non-exhaustive examples (technical failure of the delirium monitor)."

(assert
(! (not patient_has_logistical_reasons_hampering_delirium_monitor_use_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has logistical reasons hampering the use of the delirium monitor with non-exhaustive examples (technical failure of the delirium monitor)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_undergoing_isolation_technique_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in isolation (i.e., undergoing an isolation technique).","when_to_set_to_false":"Set to false if the patient is currently not in isolation (i.e., not undergoing an isolation technique).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in isolation.","meaning":"Boolean indicating whether the patient is currently undergoing an isolation technique (is in isolation)."} ;; "isolation"
(declare-const patient_is_undergoing_isolation_technique_now@@caused_by_known_carrier_ship_of_resistant_bacterium Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current isolation is specifically due to known carrier ship of a resistant bacterium.","when_to_set_to_false":"Set to false if the patient's current isolation is not due to known carrier ship of a resistant bacterium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current isolation is due to known carrier ship of a resistant bacterium.","meaning":"Boolean indicating whether the patient's current isolation is due to known carrier ship of a resistant bacterium."} ;; "in isolation because of known carrier ship of a resistant bacterium"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_isolation_technique_now@@caused_by_known_carrier_ship_of_resistant_bacterium
      patient_is_undergoing_isolation_technique_now)
   :named REQ4_AUXILIARY0)) ;; "in isolation because of known carrier ship of a resistant bacterium"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_undergoing_isolation_technique_now@@caused_by_known_carrier_ship_of_resistant_bacterium)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is in isolation because of known carrier ship of a resistant bacterium."
