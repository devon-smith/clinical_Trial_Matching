;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_bariatric_operative_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a bariatric operative procedure.","when_to_set_to_false":"Set to false if the patient is currently not undergoing a bariatric operative procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a bariatric operative procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a bariatric operative procedure."} ;; "bariatric surgical procedure"
(declare-const patient_is_undergoing_bariatric_operative_procedure_now@@other_than_laparoscopic_gastric_bypass_surgical_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the bariatric operative procedure the patient is currently undergoing is not a laparoscopic gastric bypass surgical procedure.","when_to_set_to_false":"Set to false if the bariatric operative procedure the patient is currently undergoing is a laparoscopic gastric bypass surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bariatric operative procedure is a laparoscopic gastric bypass surgical procedure or not.","meaning":"Boolean indicating whether the bariatric operative procedure is not a laparoscopic gastric bypass surgical procedure."} ;; "other than laparoscopic gastric bypass surgical procedure"
(declare-const patient_is_undergoing_revisional_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a revisional surgical procedure.","when_to_set_to_false":"Set to false if the patient is currently not undergoing a revisional surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a revisional surgical procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a revisional surgical procedure."} ;; "revisional surgical procedure"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_bariatric_operative_procedure_now@@other_than_laparoscopic_gastric_bypass_surgical_procedure
      patient_is_undergoing_bariatric_operative_procedure_now)
   :named REQ0_AUXILIARY0)) ;; "other than laparoscopic gastric bypass surgical procedure"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient is undergoing a bariatric surgical procedure other than laparoscopic gastric bypass surgical procedure
(assert
(! (not patient_is_undergoing_bariatric_operative_procedure_now@@other_than_laparoscopic_gastric_bypass_surgical_procedure)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is undergoing a bariatric surgical procedure other than laparoscopic gastric bypass surgical procedure."

;; Exclusion: patient is undergoing revisional surgical procedure
(assert
(! (not patient_is_undergoing_revisional_surgical_procedure_now)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is undergoing revisional surgical procedure."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_lost_to_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the patient is lost to follow-up, meaning the patient cannot be contacted or their status cannot be determined for study purposes.","when_to_set_to_false":"Set to false if the patient is not lost to follow-up and their status is known and contactable for study purposes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is lost to follow-up.","meaning":"Boolean indicating whether the patient is lost to follow-up."} ;; "The patient is excluded if the patient is lost to follow-up."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_lost_to_follow_up)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lost to follow-up."
