;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of hand-foot-mouth disease (enteroviral vesicular stomatitis with exanthem).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of hand-foot-mouth disease (enteroviral vesicular stomatitis with exanthem).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of hand-foot-mouth disease (enteroviral vesicular stomatitis with exanthem).","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of hand-foot-mouth disease (enteroviral vesicular stomatitis with exanthem)." } ;; "To be included, the patient must have a clinical diagnosis of severe hand-foot-mouth disease according to Hand-Foot-Mouth Disease Treatment Guidelines 2010 (issued by China's Ministry of Health)."
(declare-const patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical diagnosis of hand-foot-mouth disease is classified as severe.","when_to_set_to_false":"Set to false if the patient's current clinical diagnosis of hand-foot-mouth disease is not classified as severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is severe.","meaning":"Boolean indicating whether the patient's current clinical diagnosis of hand-foot-mouth disease is classified as severe."} ;; "severe hand-foot-mouth disease"
(declare-const patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_now@@diagnosed_according_to_hand_foot_mouth_disease_treatment_guidelines_2010_issued_by_chinas_ministry_of_health Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical diagnosis of hand-foot-mouth disease was made according to Hand-Foot-Mouth Disease Treatment Guidelines 2010 (issued by China's Ministry of Health).","when_to_set_to_false":"Set to false if the diagnosis was not made according to these guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made according to these guidelines.","meaning":"Boolean indicating whether the patient's current clinical diagnosis of hand-foot-mouth disease was made according to Hand-Foot-Mouth Disease Treatment Guidelines 2010 (issued by China's Ministry of Health)."} ;; "according to Hand-Foot-Mouth Disease Treatment Guidelines 2010 (issued by China's Ministry of Health)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable (severe) implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_now@@severe
         patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_now)
     :named REQ0_AUXILIARY0)) ;; "severe hand-foot-mouth disease"

;; Qualifier variable (diagnosed according to guidelines) implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_now@@diagnosed_according_to_hand_foot_mouth_disease_treatment_guidelines_2010_issued_by_chinas_ministry_of_health
         patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_now)
     :named REQ0_AUXILIARY1)) ;; "according to Hand-Foot-Mouth Disease Treatment Guidelines 2010 (issued by China's Ministry of Health)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_now@@severe
          patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_now@@diagnosed_according_to_hand_foot_mouth_disease_treatment_guidelines_2010_issued_by_chinas_ministry_of_health)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a clinical diagnosis of severe hand-foot-mouth disease according to Hand-Foot-Mouth Disease Treatment Guidelines 2010 (issued by China's Ministry of Health)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const number_of_patients_diagnosed_by_etiological_examination_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of patients in the study who have been diagnosed by etiological examination at the current time.","when_to_set_to_null":"Set to null if the number of patients diagnosed by etiological examination is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of patients in the study diagnosed by etiological examination, with unit 'count'."} ;; "number of patients in the study who have been diagnosed by etiological examination"
(declare-const number_of_patients_in_study_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the total number of patients included in the study at the current time.","when_to_set_to_null":"Set to null if the total number of patients in the study is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of patients in the study, with unit 'count'."} ;; "total number of patients included in the study"

;; ===================== Constraint Assertions (REQ 1) =====================
;; More than 1/3 of the patients in the study must be diagnosed by etiological examination
(assert
  (! (> number_of_patients_diagnosed_by_etiological_examination_value_recorded_now_withunit_count
        (/ number_of_patients_in_study_value_recorded_now_withunit_count 3.0))
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "more than 1/3 of the patients in the study must be diagnosed by etiological examination"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_fever_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an occurrence of fever within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not had an occurrence of fever within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had fever within the past 48 hours.","meaning":"Boolean indicating whether the patient has had fever within the past 48 hours."} ;; "the occurrence of fever"
(declare-const patient_has_finding_of_herpesvirus_infection_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an occurrence of herpesvirus infection within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not had an occurrence of herpesvirus infection within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had herpesvirus infection within the past 48 hours.","meaning":"Boolean indicating whether the patient has had herpesvirus infection within the past 48 hours."} ;; "the occurrence of herpes"
(declare-const patient_has_finding_of_tetter_in_the_past_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an occurrence of tetter within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not had an occurrence of tetter within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had tetter within the past 48 hours.","meaning":"Boolean indicating whether the patient has had tetter within the past 48 hours."} ;; "the occurrence of tetter"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must have had less than 48 hours since (the occurrence of fever OR the occurrence of tetter OR the occurrence of herpes).
(assert
  (! (or patient_has_finding_of_fever_inthepast48hours
         patient_has_finding_of_tetter_in_the_past_48_hours
         patient_has_finding_of_herpesvirus_infection_inthepast48hours)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged between 1 years and 14 years (inclusive)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 1.0)
          (<= patient_age_value_recorded_now_in_years 14.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged between 1 years and 14 years (inclusive)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_or_guardian_has_agreed_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if either the patient or the patient's guardian has agreed to participate in this study.","when_to_set_to_false":"Set to false if neither the patient nor the patient's guardian has agreed to participate in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient or the patient's guardian has agreed to participate in this study.","meaning":"Boolean indicating whether the patient or the patient's guardian has agreed to participate in this study."} ;; "the patient or the patient's guardian must have agreed to participate in this study"
(declare-const informed_consent_form_is_signed Bool) ;; {"when_to_set_to_true":"Set to true if the informed consent form has been signed by the patient or the patient's guardian.","when_to_set_to_false":"Set to false if the informed consent form has not been signed by the patient or the patient's guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the informed consent form has been signed by the patient or the patient's guardian.","meaning":"Boolean indicating whether the informed consent form has been signed by the patient or the patient's guardian."} ;; "the patient or the patient's guardian must have signed the informed consent form"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_or_guardian_has_agreed_to_participate_in_study
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient or the patient's guardian must have agreed to participate in this study"

(assert
  (! informed_consent_form_is_signed
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient or the patient's guardian must have signed the informed consent form"
