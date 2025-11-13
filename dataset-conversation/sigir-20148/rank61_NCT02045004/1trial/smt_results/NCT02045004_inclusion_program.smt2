;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must be aged ≥ 65 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_undergoing_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently scheduled for a surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently scheduled for a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently scheduled for a surgical procedure.","meaning":"Boolean indicating whether the patient is currently scheduled for a surgical procedure."} ;; "the patient must be scheduled for elective major surgery"
(declare-const patient_is_undergoing_surgical_procedure_now@@is_elective Bool) ;; {"when_to_set_to_true":"Set to true if the scheduled surgical procedure is elective.","when_to_set_to_false":"Set to false if the scheduled surgical procedure is not elective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduled surgical procedure is elective.","meaning":"Boolean indicating whether the scheduled surgical procedure is elective."} ;; "the patient must be scheduled for elective major surgery"
(declare-const patient_is_undergoing_surgical_procedure_now@@is_major Bool) ;; {"when_to_set_to_true":"Set to true if the scheduled surgical procedure is major.","when_to_set_to_false":"Set to false if the scheduled surgical procedure is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduled surgical procedure is major.","meaning":"Boolean indicating whether the scheduled surgical procedure is major."} ;; "the patient must be scheduled for elective major surgery"
(declare-const patient_is_undergoing_surgical_procedure_now@@is_elective@@is_major Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently scheduled for a surgical procedure and the procedure is both elective and major.","when_to_set_to_false":"Set to false if the patient is currently scheduled for a surgical procedure but the procedure is not both elective and major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently scheduled for a surgical procedure that is both elective and major.","meaning":"Boolean indicating whether the patient is currently scheduled for a surgical procedure that is both elective and major."} ;; "the patient must be scheduled for elective major surgery"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_is_undergoing_surgical_procedure_now@@is_elective
         patient_is_undergoing_surgical_procedure_now)
     :named REQ1_AUXILIARY0)) ;; "the patient must be scheduled for elective major surgery"

(assert
  (! (=> patient_is_undergoing_surgical_procedure_now@@is_major
         patient_is_undergoing_surgical_procedure_now)
     :named REQ1_AUXILIARY1)) ;; "the patient must be scheduled for elective major surgery"

;; The doubly qualified variable implies both single qualifiers
(assert
  (! (=> patient_is_undergoing_surgical_procedure_now@@is_elective@@is_major
         (and patient_is_undergoing_surgical_procedure_now@@is_elective
              patient_is_undergoing_surgical_procedure_now@@is_major))
     :named REQ1_AUXILIARY2)) ;; "the patient must be scheduled for elective major surgery"

;; The doubly qualified variable implies the stem variable
(assert
  (! (=> patient_is_undergoing_surgical_procedure_now@@is_elective@@is_major
         patient_is_undergoing_surgical_procedure_now)
     :named REQ1_AUXILIARY3)) ;; "the patient must be scheduled for elective major surgery"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must be scheduled for a surgical procedure that is both elective and major
(assert
  (! patient_is_undergoing_surgical_procedure_now@@is_elective@@is_major
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be scheduled for elective major surgery"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_will_undergo_general_anesthesia_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled or planned to undergo general anesthesia in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled or planned to undergo general anesthesia in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo general anesthesia in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo general anesthesia in the future."} ;; "the patient must have planned general anesthesia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_will_undergo_general_anesthesia_inthefuture
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have planned general anesthesia"
