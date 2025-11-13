;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_intervertebral_disc_prolapse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of herniated intervertebral disk (intervertebral disc prolapse).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of herniated intervertebral disk (intervertebral disc prolapse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of herniated intervertebral disk (intervertebral disc prolapse).","meaning":"Boolean indicating whether the patient currently has a herniated intervertebral disk (intervertebral disc prolapse)."} ;; "herniated intervertebral disk"
(declare-const patient_has_finding_of_intervertebral_disc_prolapse_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's herniated intervertebral disk (intervertebral disc prolapse) is severe.","when_to_set_to_false":"Set to false if the patient's herniated intervertebral disk (intervertebral disc prolapse) is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's herniated intervertebral disk (intervertebral disc prolapse) is severe.","meaning":"Boolean indicating whether the patient's herniated intervertebral disk (intervertebral disc prolapse) is severe."} ;; "severely herniated intervertebral disk"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_intervertebral_disc_prolapse_now@@severity_severe
      patient_has_finding_of_intervertebral_disc_prolapse_now)
:named REQ0_AUXILIARY0)) ;; "severely herniated intervertebral disk""

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_intervertebral_disc_prolapse_now@@severity_severe)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severely herniated intervertebral disk."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_taken_drug_or_medicament_inthepast12hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any drug or medicament within the past twelve hours.","when_to_set_to_false":"Set to false if the patient has not taken any drug or medicament within the past twelve hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any drug or medicament within the past twelve hours.","meaning":"Boolean indicating whether the patient has taken any drug or medicament within the past twelve hours."} ;; "medication"
(declare-const patient_has_taken_pain_medication_inthepast12hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any pain medication within the past twelve hours.","when_to_set_to_false":"Set to false if the patient has not taken any pain medication within the past twelve hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any pain medication within the past twelve hours.","meaning":"Boolean indicating whether the patient has taken pain medication within the past twelve hours."} ;; "pain medication within the past twelve hours"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_taken_pain_medication_inthepast12hours)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken pain medication within the past twelve hours."
