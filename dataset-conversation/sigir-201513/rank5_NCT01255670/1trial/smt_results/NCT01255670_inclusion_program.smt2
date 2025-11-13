;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_referring_doctor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a referring doctor.","when_to_set_to_false":"Set to false if the patient currently does not have a referring doctor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a referring doctor.","meaning":"Boolean indicating whether the patient currently has a referring doctor."} // "the patient must have a referring doctor"
(declare-const patient_has_referring_doctor_now@@referring_doctor_suspects_peritonsillar_abscess Bool) ;; {"when_to_set_to_true":"Set to true if the referring doctor suspects peritonsillar abscess.","when_to_set_to_false":"Set to false if the referring doctor does not suspect peritonsillar abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the referring doctor suspects peritonsillar abscess.","meaning":"Boolean indicating whether the referring doctor suspects peritonsillar abscess."} // "who suspects peritonsillar abscess"
(declare-const patient_has_suspicion_of_peritonsillar_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have peritonsillar abscess.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have peritonsillar abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have peritonsillar abscess.","meaning":"Boolean indicating whether the patient is currently suspected to have peritonsillar abscess."} // "suspects peritonsillar abscess"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_referring_doctor_now@@referring_doctor_suspects_peritonsillar_abscess
         patient_has_referring_doctor_now)
     :named REQ0_AUXILIARY0)) ;; "who suspects peritonsillar abscess" implies "has referring doctor"

;; Qualifier variable implies patient is suspected to have peritonsillar abscess
(assert
  (! (=> patient_has_referring_doctor_now@@referring_doctor_suspects_peritonsillar_abscess
         patient_has_suspicion_of_peritonsillar_abscess_now)
     :named REQ0_AUXILIARY1)) ;; "referring doctor suspects peritonsillar abscess" implies "patient is suspected to have peritonsillar abscess"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_referring_doctor_now@@referring_doctor_suspects_peritonsillar_abscess
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have a referring doctor (who suspects peritonsillar abscess)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_voluntary Bool) ;; {"when_to_set_to_true":"Set to true if the patient is participating voluntarily.","when_to_set_to_false":"Set to false if the patient is not participating voluntarily (i.e., participation is involuntary).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is participating voluntarily.","meaning":"Boolean indicating whether the patient is participating voluntarily."} // "the patient must be voluntary"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_voluntary
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be voluntary"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_daily_access_to_own_email_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has daily access to their own e-mail account.","when_to_set_to_false":"Set to false if the patient currently does not have daily access to their own e-mail account.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has daily access to their own e-mail account.","meaning":"Boolean indicating whether the patient currently has daily access to their own e-mail account."} // "the patient must have daily access to the patient's own e-mail."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_daily_access_to_own_email_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have daily access to the patient's own e-mail."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_speaks_finnish_language Bool) ;; {"when_to_set_to_true":"Set to true if the patient speaks the Finnish language.","when_to_set_to_false":"Set to false if the patient does not speak the Finnish language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient speaks the Finnish language.","meaning":"Boolean indicating whether the patient speaks the Finnish language."} // "the patient must speak ... the Finnish language"
(declare-const patient_speaks_swedish_language Bool) ;; {"when_to_set_to_true":"Set to true if the patient speaks the Swedish language.","when_to_set_to_false":"Set to false if the patient does not speak the Swedish language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient speaks the Swedish language.","meaning":"Boolean indicating whether the patient speaks the Swedish language."} // "the patient must speak ... the Swedish language"
(declare-const patient_understands_finnish_language Bool) ;; {"when_to_set_to_true":"Set to true if the patient understands the Finnish language.","when_to_set_to_false":"Set to false if the patient does not understand the Finnish language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient understands the Finnish language.","meaning":"Boolean indicating whether the patient understands the Finnish language."} // "the patient must understand ... the Finnish language"
(declare-const patient_understands_swedish_language Bool) ;; {"when_to_set_to_true":"Set to true if the patient understands the Swedish language.","when_to_set_to_false":"Set to false if the patient does not understand the Swedish language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient understands the Swedish language.","meaning":"Boolean indicating whether the patient understands the Swedish language."} // "the patient must understand ... the Swedish language"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must speak AND understand (Finnish OR Swedish)
(assert
  (! (or (and patient_speaks_finnish_language patient_understands_finnish_language)
         (and patient_speaks_swedish_language patient_understands_swedish_language))
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must speak AND understand (the Finnish language OR the Swedish language)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "if the patient is female"
(declare-const patient_has_birth_control_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any birth-control method documented.","when_to_set_to_false":"Set to false if the patient currently does not have any birth-control method documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any birth-control method.","meaning":"Boolean indicating whether the patient currently has any birth-control method."} // "the patient must have an adequate birth-control method"
(declare-const patient_has_birth_control_method_now@@adequate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current birth-control method is considered adequate according to clinical standards.","when_to_set_to_false":"Set to false if the patient's current birth-control method is considered inadequate according to clinical standards.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current birth-control method is adequate.","meaning":"Boolean indicating whether the patient's current birth-control method is adequate."} // "the patient must have an adequate birth-control method"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Adequate birth-control method implies having a birth-control method
(assert
  (! (=> patient_has_birth_control_method_now@@adequate
         patient_has_birth_control_method_now)
     :named REQ4_AUXILIARY0)) ;; "the patient must have an adequate birth-control method"

;; ===================== Constraint Assertions (REQ 4) =====================
;; If the patient is female, she must have an adequate birth-control method
(assert
  (! (or (not patient_sex_is_female_now)
         patient_has_birth_control_method_now@@adequate)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is female, the patient must have an adequate birth-control method"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_peritonsillar_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a peritonsillar abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a peritonsillar abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a peritonsillar abscess.","meaning":"Boolean indicating whether the patient currently has a peritonsillar abscess."} // "the patient must have peritonsillar abscess"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_peritonsillar_abscess_now
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have peritonsillar abscess."
