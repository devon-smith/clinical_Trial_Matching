;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_contraindication_to_compression_of_lower_extremities_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to compression of lower extremities.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to compression of lower extremities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to compression of lower extremities.","meaning":"Boolean indicating whether the patient currently has any contraindication to compression of lower extremities."} ;; "contraindication to compression of lower extremities"

(declare-const patient_has_contraindication_to_compression_of_lower_extremity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to compression of lower extremity.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to compression of lower extremity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to compression of lower extremity.","meaning":"Boolean indicating whether the patient currently has any contraindication to compression of lower extremity."} ;; "contraindication to compression of lower extremity"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_contraindication_to_compression_of_lower_extremity_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any contraindication to compression of lower extremity."

(assert
(! (not patient_has_contraindication_to_compression_of_lower_extremities_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any contraindication to compression of lower extremities."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight in kilograms is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in kilograms."} ;; "body weight < 2 kilograms"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_body_weight_value_recorded_now_withunit_kilograms 2))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has body weight < 2 kilograms."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@active_at_time_of_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is active at the time of surgery.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but it is not active at the time of surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is active at the time of surgery.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection and the infection is active at the time of surgery."} ;; "active infection going into surgery"
(declare-const patient_is_undergoing_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a surgical procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a surgical procedure."} ;; "surgery"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@active_at_time_of_surgery
      patient_has_finding_of_disorder_due_to_infection_now)
   :named REQ2_AUXILIARY0)) ;; "active infection going into surgery" implies "infection"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@active_at_time_of_surgery)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active infection going into surgery."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_on_renal_replacement_therapy_at_time_of_going_into_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient is receiving renal replacement therapy at the time of going into surgery.","when_to_set_to_false":"Set to false if the patient is not receiving renal replacement therapy at the time of going into surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving renal replacement therapy at the time of going into surgery.","meaning":"Boolean indicating whether the patient is on renal replacement therapy at the time of going into surgery."} ;; "the patient is on renal replacement therapy going into surgery"
(declare-const patient_is_on_mechanical_circulatory_support_at_time_of_going_into_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient is receiving mechanical circulatory support at the time of going into surgery.","when_to_set_to_false":"Set to false if the patient is not receiving mechanical circulatory support at the time of going into surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving mechanical circulatory support at the time of going into surgery.","meaning":"Boolean indicating whether the patient is on mechanical circulatory support at the time of going into surgery."} ;; "the patient is on mechanical circulatory support going into surgery"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_on_renal_replacement_therapy_at_time_of_going_into_surgery)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on renal replacement therapy going into surgery."

(assert
(! (not patient_is_on_mechanical_circulatory_support_at_time_of_going_into_surgery)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on mechanical circulatory support going into surgery."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_on_inotropic_support_at_time_of_going_into_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient is receiving inotropic support at the time of going into surgery.","when_to_set_to_false":"Set to false if the patient is not receiving inotropic support at the time of going into surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving inotropic support at the time of going into surgery.","meaning":"Boolean indicating whether the patient is receiving inotropic support at the time of going into surgery."} ;; "the patient is on inotropic support going into surgery"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_is_on_inotropic_support_at_time_of_going_into_surgery)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on inotropic support going into surgery."
