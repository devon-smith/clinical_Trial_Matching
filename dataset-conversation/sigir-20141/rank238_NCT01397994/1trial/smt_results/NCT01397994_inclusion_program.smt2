;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_diagnosis_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of angina pectoris.","meaning":"Boolean indicating whether the patient currently has a diagnosis of angina pectoris."}  ;; "To be included, the patient must have chronic stable angina."
(declare-const patient_has_undergone_radionuclide_imaging_of_perfusion_of_myocardium_under_exercise_stress_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has undergone an exercise myocardial perfusion SPECT scan and the outcome is abnormal.","when_to_set_to_false":"Set to false if the patient currently has undergone the scan and the outcome is not abnormal, or if the scan has not been performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone the scan and the outcome is abnormal.","meaning":"Boolean indicating whether the patient currently has undergone an exercise myocardial perfusion SPECT scan with an abnormal outcome."} ;; "abnormal exercise myocardial perfusion single-photon emission computed tomography (SPECT) scan"
(declare-const patient_has_undergone_radionuclide_imaging_of_perfusion_of_myocardium_under_exercise_stress_now_outcome_is_abnormal@@shows_reversible_ischemic_changes Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal exercise myocardial perfusion SPECT scan shows reversible ischemic changes.","when_to_set_to_false":"Set to false if the abnormal scan does not show reversible ischemic changes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal scan shows reversible ischemic changes.","meaning":"Boolean indicating whether the abnormal exercise myocardial perfusion SPECT scan shows reversible ischemic changes."} ;; "scan showing reversible ischemic changes"
(declare-const patient_has_undergone_radionuclide_imaging_of_perfusion_of_myocardium_under_exercise_stress_now_outcome_is_abnormal@@shows_partially_reversible_ischemic_changes Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal exercise myocardial perfusion SPECT scan shows partially reversible ischemic changes.","when_to_set_to_false":"Set to false if the abnormal scan does not show partially reversible ischemic changes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal scan shows partially reversible ischemic changes.","meaning":"Boolean indicating whether the abnormal exercise myocardial perfusion SPECT scan shows partially reversible ischemic changes."} ;; "scan showing partially reversible ischemic changes"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable (if scan shows reversible or partially reversible ischemic changes, then scan is abnormal)
(assert
  (! (=> patient_has_undergone_radionuclide_imaging_of_perfusion_of_myocardium_under_exercise_stress_now_outcome_is_abnormal@@shows_reversible_ischemic_changes
         patient_has_undergone_radionuclide_imaging_of_perfusion_of_myocardium_under_exercise_stress_now_outcome_is_abnormal)
     :named REQ0_AUXILIARY0)) ;; "scan showing reversible ischemic changes" implies abnormal scan

(assert
  (! (=> patient_has_undergone_radionuclide_imaging_of_perfusion_of_myocardium_under_exercise_stress_now_outcome_is_abnormal@@shows_partially_reversible_ischemic_changes
         patient_has_undergone_radionuclide_imaging_of_perfusion_of_myocardium_under_exercise_stress_now_outcome_is_abnormal)
     :named REQ0_AUXILIARY1)) ;; "scan showing partially reversible ischemic changes" implies abnormal scan

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must have chronic stable angina
(assert
  (! patient_has_diagnosis_of_angina_pectoris_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have chronic stable angina."

;; Component 1: The patient must have an abnormal exercise myocardial perfusion SPECT scan showing (reversible ischemic changes) or (partially reversible ischemic changes)
(assert
  (! (or patient_has_undergone_radionuclide_imaging_of_perfusion_of_myocardium_under_exercise_stress_now_outcome_is_abnormal@@shows_reversible_ischemic_changes
         patient_has_undergone_radionuclide_imaging_of_perfusion_of_myocardium_under_exercise_stress_now_outcome_is_abnormal@@shows_partially_reversible_ischemic_changes)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "abnormal exercise myocardial perfusion SPECT scan showing reversible or partially reversible ischemic changes"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} ;; "must be female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} ;; "must be male"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or must be female."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged between 25 years and 65 years"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must be aged between 25 years and 65 years (inclusive)
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 25.0)
          (<= patient_age_value_recorded_now_in_years 65.0))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged between 25 years and 65 years."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_understands_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient understands all study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient does not understand all study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient understands all study procedures and restrictions.","meaning":"Boolean indicating whether the patient understands all study procedures and restrictions."} ;; "the patient must understand ... all study procedures and restrictions"
(declare-const patient_is_willing_to_comply_with_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to comply with all study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient is not willing to comply with all study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with all study procedures and restrictions.","meaning":"Boolean indicating whether the patient is willing to comply with all study procedures and restrictions."} ;; "the patient must be ... willing ... to comply with all study procedures and restrictions"
(declare-const patient_is_able_to_comply_with_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to comply with all study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient is not able to comply with all study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to comply with all study procedures and restrictions.","meaning":"Boolean indicating whether the patient is able to comply with all study procedures and restrictions."} ;; "the patient must be ... able ... to comply with all study procedures and restrictions"
(declare-const patient_is_likely_to_comply_with_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is likely to comply with all study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient is not likely to comply with all study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is likely to comply with all study procedures and restrictions.","meaning":"Boolean indicating whether the patient is likely to comply with all study procedures and restrictions."} ;; "the patient must be ... likely to comply with all study procedures and restrictions"
(declare-const patient_comprehends_diary_cards Bool) ;; {"when_to_set_to_true":"Set to true if the patient comprehends the diary cards.","when_to_set_to_false":"Set to false if the patient does not comprehend the diary cards.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient comprehends the diary cards.","meaning":"Boolean indicating whether the patient comprehends the diary cards."} ;; "the patient must comprehend the diary cards"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must understand and must be willing, able and likely to comply with all study procedures and restrictions
(assert
  (! (and patient_understands_study_procedures_and_restrictions
          patient_is_willing_to_comply_with_study_procedures_and_restrictions
          patient_is_able_to_comply_with_study_procedures_and_restrictions
          patient_is_likely_to_comply_with_study_procedures_and_restrictions)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must understand and must be willing, able and likely to comply with all study procedures and restrictions"

;; Component 1: patient must comprehend the diary cards
(assert
  (! patient_comprehends_diary_cards
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must comprehend the diary cards"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_able_to_give_voluntary_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give voluntary written informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to give voluntary written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give voluntary written informed consent.","meaning":"Boolean indicating whether the patient is currently able to give voluntary written informed consent."} ;; "To be included, the patient must be able to give voluntary written informed consent."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_able_to_give_voluntary_written_informed_consent_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be able to give voluntary written informed consent."
