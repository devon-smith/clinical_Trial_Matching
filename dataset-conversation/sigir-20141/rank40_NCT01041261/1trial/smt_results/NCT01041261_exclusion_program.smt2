;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_tobacco_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to tobacco within the past four weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to tobacco within the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to tobacco within the past four weeks.","meaning":"Boolean indicating whether the patient has been exposed to tobacco within the past four weeks."} ;; "has smoked tobacco within the past four weeks."
(declare-const patient_is_exposed_to_tobacco_inthepast4weeks@@exposure_mode_smoking Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to tobacco within the past four weeks was specifically by smoking.","when_to_set_to_false":"Set to false if the patient's exposure to tobacco within the past four weeks was not by smoking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure mode was smoking.","meaning":"Boolean indicating whether the patient's exposure to tobacco within the past four weeks was specifically by smoking."} ;; "has smoked tobacco within the past four weeks."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_tobacco_inthepast4weeks@@exposure_mode_smoking
      patient_is_exposed_to_tobacco_inthepast4weeks)
:named REQ0_AUXILIARY0)) ;; "smoked tobacco within the past four weeks" (smoking is a mode of tobacco exposure)

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_exposed_to_tobacco_inthepast4weeks@@exposure_mode_smoking)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has smoked tobacco within the past four weeks."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_allergy_to_soya_bean_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to soya bean.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to soya bean.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to soya bean.","meaning":"Boolean indicating whether the patient currently has an allergy to soya bean."} ;; "soy"
(declare-const patient_has_allergy_to_thiaa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to THIAA.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to THIAA.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to THIAA.","meaning":"Boolean indicating whether the patient currently has an allergy to THIAA."} ;; "THIAA"
(declare-const patient_has_intolerance_to_soya_bean_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intolerance to soya bean.","when_to_set_to_false":"Set to false if the patient currently does not have an intolerance to soya bean.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intolerance to soya bean.","meaning":"Boolean indicating whether the patient currently has an intolerance to soya bean."} ;; "soy"
(declare-const patient_has_intolerance_to_thiaa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intolerance to THIAA.","when_to_set_to_false":"Set to false if the patient currently does not have an intolerance to THIAA.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intolerance to THIAA.","meaning":"Boolean indicating whether the patient currently has an intolerance to THIAA."} ;; "THIAA"

(declare-const patient_has_allergy_to_study_ingredient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to any ingredient used in the study.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to any ingredient used in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to any ingredient used in the study.","meaning":"Boolean indicating whether the patient currently has an allergy to any ingredient used in the study."} ;; "allergy to ingredients used in the study"
(declare-const patient_has_intolerance_to_study_ingredient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intolerance to any ingredient used in the study.","when_to_set_to_false":"Set to false if the patient currently does not have an intolerance to any ingredient used in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intolerance to any ingredient used in the study.","meaning":"Boolean indicating whether the patient currently has an intolerance to any ingredient used in the study."} ;; "intolerance to ingredients used in the study"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term (allergy)
(assert
(! (=> (or patient_has_allergy_to_soya_bean_now
          patient_has_allergy_to_thiaa_now)
       patient_has_allergy_to_study_ingredient_now)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (soy, THIAA)" for allergy

;; Non-exhaustive examples imply umbrella term (intolerance)
(assert
(! (=> (or patient_has_intolerance_to_soya_bean_now
          patient_has_intolerance_to_thiaa_now)
       patient_has_intolerance_to_study_ingredient_now)
:named REQ2_AUXILIARY1)) ;; "with non-exhaustive examples (soy, THIAA)" for intolerance

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have allergy to study ingredients
(assert
(! (not patient_has_allergy_to_study_ingredient_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to ingredients used in the study with non-exhaustive examples (soy, THIAA)."

;; Exclusion: patient must NOT have intolerance to study ingredients
(assert
(! (not patient_has_intolerance_to_study_ingredient_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to ingredients used in the study with non-exhaustive examples (soy, THIAA)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_sound_medical_reason_for_unsuitability_as_determined_by_principal_investigator_now Bool) ;; {"when_to_set_to_true":"Set to true if, at the present time, the Principal Investigator has determined that the patient has a sound medical reason making the patient unsuitable for the study.","when_to_set_to_false":"Set to false if, at the present time, the Principal Investigator has determined that the patient does not have a sound medical reason making the patient unsuitable for the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Principal Investigator has determined a sound medical reason making the patient unsuitable for the study.","meaning":"Boolean indicating whether, at the present time, the patient has a sound medical reason that makes the patient unsuitable for the study, as determined by the Principal Investigator."} ;; "there is a sound medical reason as determined by the Principal Investigator that makes the patient unsuitable for the study"

(declare-const patient_has_sound_psychiatric_reason_for_unsuitability_as_determined_by_principal_investigator_now Bool) ;; {"when_to_set_to_true":"Set to true if, at the present time, the Principal Investigator has determined that the patient has a sound psychiatric reason making the patient unsuitable for the study.","when_to_set_to_false":"Set to false if, at the present time, the Principal Investigator has determined that the patient does not have a sound psychiatric reason making the patient unsuitable for the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Principal Investigator has determined a sound psychiatric reason making the patient unsuitable for the study.","meaning":"Boolean indicating whether, at the present time, the patient has a sound psychiatric reason that makes the patient unsuitable for the study, as determined by the Principal Investigator."} ;; "there is a sound psychiatric reason as determined by the Principal Investigator that makes the patient unsuitable for the study"

(declare-const patient_has_sound_social_reason_for_unsuitability_as_determined_by_principal_investigator_now Bool) ;; {"when_to_set_to_true":"Set to true if, at the present time, the Principal Investigator has determined that the patient has a sound social reason making the patient unsuitable for the study.","when_to_set_to_false":"Set to false if, at the present time, the Principal Investigator has determined that the patient does not have a sound social reason making the patient unsuitable for the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Principal Investigator has determined a sound social reason making the patient unsuitable for the study.","meaning":"Boolean indicating whether, at the present time, the patient has a sound social reason that makes the patient unsuitable for the study, as determined by the Principal Investigator."} ;; "there is a sound social reason as determined by the Principal Investigator that makes the patient unsuitable for the study"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_sound_medical_reason_for_unsuitability_as_determined_by_principal_investigator_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "there is a sound medical reason as determined by the Principal Investigator that makes the patient unsuitable for the study"

(assert
(! (not patient_has_sound_psychiatric_reason_for_unsuitability_as_determined_by_principal_investigator_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "there is a sound psychiatric reason as determined by the Principal Investigator that makes the patient unsuitable for the study"

(assert
(! (not patient_has_sound_social_reason_for_unsuitability_as_determined_by_principal_investigator_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "there is a sound social reason as determined by the Principal Investigator that makes the patient unsuitable for the study"
