;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 70 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 70.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 70 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_surgical_procedure_on_lumbar_spine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a surgical procedure on the lumbar spine.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a surgical procedure on the lumbar spine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a surgical procedure on the lumbar spine.","meaning":"Boolean indicating whether the patient is currently undergoing a surgical procedure on the lumbar spine."} ;; "undergoing lumbar spine surgery"
(declare-const patient_is_undergoing_surgical_procedure_on_cervical_spine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a surgical procedure on the cervical spine.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a surgical procedure on the cervical spine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a surgical procedure on the cervical spine.","meaning":"Boolean indicating whether the patient is currently undergoing a surgical procedure on the cervical spine."} ;; "cervical spine surgery"
(declare-const patient_is_undergoing_surgical_procedure_on_cervical_spine_now@@performed_on_posterior_cervical_spine Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure on the cervical spine is performed on the posterior cervical spine.","when_to_set_to_false":"Set to false if the surgical procedure on the cervical spine is not performed on the posterior cervical spine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is performed on the posterior cervical spine.","meaning":"Boolean indicating whether the surgical procedure on the cervical spine is performed on the posterior cervical spine."} ;; "posterior cervical spine surgery"
(declare-const patient_is_undergoing_surgical_procedure_on_cervical_spine_now@@performed_on_anterior_cervical_spine Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure on the cervical spine is performed on the anterior cervical spine.","when_to_set_to_false":"Set to false if the surgical procedure on the cervical spine is not performed on the anterior cervical spine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is performed on the anterior cervical spine.","meaning":"Boolean indicating whether the surgical procedure on the cervical spine is performed on the anterior cervical spine."} ;; "anterior cervical spine surgery"
(declare-const patient_is_undergoing_surgical_procedure_on_cervical_spine_now@@involves_number_of_levels_greater_than_2 Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure on the cervical spine involves more than 2 levels.","when_to_set_to_false":"Set to false if the surgical procedure on the cervical spine does not involve more than 2 levels.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure involves more than 2 levels.","meaning":"Boolean indicating whether the surgical procedure on the cervical spine involves more than 2 levels."} ;; "anterior cervical spine surgery involving (number of levels > 2)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply the stem variable (cervical spine surgery)
(assert
  (! (=> patient_is_undergoing_surgical_procedure_on_cervical_spine_now@@performed_on_posterior_cervical_spine
         patient_is_undergoing_surgical_procedure_on_cervical_spine_now)
     :named REQ1_AUXILIARY0)) ;; If posterior cervical spine surgery, then cervical spine surgery

(assert
  (! (=> patient_is_undergoing_surgical_procedure_on_cervical_spine_now@@performed_on_anterior_cervical_spine
         patient_is_undergoing_surgical_procedure_on_cervical_spine_now)
     :named REQ1_AUXILIARY1)) ;; If anterior cervical spine surgery, then cervical spine surgery

(assert
  (! (=> patient_is_undergoing_surgical_procedure_on_cervical_spine_now@@involves_number_of_levels_greater_than_2
         patient_is_undergoing_surgical_procedure_on_cervical_spine_now)
     :named REQ1_AUXILIARY2)) ;; If cervical spine surgery involves >2 levels, then cervical spine surgery

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must be undergoing lumbar spine surgery OR posterior cervical spine surgery OR anterior cervical spine surgery involving >2 levels
(assert
  (! (or patient_is_undergoing_surgical_procedure_on_lumbar_spine_now
         patient_is_undergoing_surgical_procedure_on_cervical_spine_now@@performed_on_posterior_cervical_spine
         (and patient_is_undergoing_surgical_procedure_on_cervical_spine_now@@performed_on_anterior_cervical_spine
              patient_is_undergoing_surgical_procedure_on_cervical_spine_now@@involves_number_of_levels_greater_than_2))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (undergoing lumbar spine surgery) OR (undergoing posterior cervical spine surgery) OR (undergoing anterior cervical spine surgery involving (number of levels > 2))."
