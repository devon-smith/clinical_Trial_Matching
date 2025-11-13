;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_undergoing_revision_anterior_cervical_spine_surgery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a revision anterior cervical spine surgery (i.e., at the present time, the revision procedure is actively being performed on the anterior cervical spine).","when_to_set_to_false":"Set to false if the patient is not currently undergoing a revision anterior cervical spine surgery (i.e., the revision procedure is not in progress at the present time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a revision anterior cervical spine surgery.","meaning":"Boolean indicating whether the patient is currently undergoing revision anterior cervical spine surgery."} ;; "To be included, the patient must be undergoing revision anterior cervical spine surgery."
(declare-const patient_is_undergoing_surgical_procedure_on_cervical_spine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a surgical procedure on the cervical spine (i.e., at the present time, the procedure is actively being performed).","when_to_set_to_false":"Set to false if the patient is not currently undergoing a surgical procedure on the cervical spine (i.e., the procedure is not in progress at the present time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a surgical procedure on the cervical spine.","meaning":"Boolean indicating whether the patient is currently undergoing a surgical procedure on the cervical spine."} ;; "cervical spine surgery"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Revision anterior cervical spine surgery is a type of surgical procedure on the cervical spine
(assert
  (! (=> patient_is_undergoing_revision_anterior_cervical_spine_surgery_now
         patient_is_undergoing_surgical_procedure_on_cervical_spine_now)
     :named REQ0_AUXILIARY0)) ;; "revision anterior cervical spine surgery" is a subclass of "surgical procedure on cervical spine"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_undergoing_revision_anterior_cervical_spine_surgery_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be undergoing revision anterior cervical spine surgery."
