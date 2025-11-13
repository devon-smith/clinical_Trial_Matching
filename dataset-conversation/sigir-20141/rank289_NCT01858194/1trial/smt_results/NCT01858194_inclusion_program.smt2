;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age ≥ 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_structural_disorder_of_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of structural disorder of the heart (structural heart disease).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of structural disorder of the heart.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a structural disorder of the heart.","meaning":"Boolean indicating whether the patient currently has a structural disorder of the heart (structural heart disease)."} // "structural heart disease"
(declare-const patient_has_finding_of_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myocardial infarction.","meaning":"Boolean indicating whether the patient currently has myocardial infarction."} // "post-myocardial infarction"
(declare-const patient_has_finding_of_dilated_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of dilated cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of dilated cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dilated cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has dilated cardiomyopathy."} // "dilated cardiomyopathy"
(declare-const patient_has_finding_of_sarcoid_myopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of sarcoid myopathy.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of sarcoid myopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sarcoid myopathy.","meaning":"Boolean indicating whether the patient currently has sarcoid myopathy."} // "sarcoid myopathy"
(declare-const patient_has_finding_of_hypertrophic_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of hypertrophic cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of hypertrophic cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertrophic cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has hypertrophic cardiomyopathy."} // "hypertrophic cardiomyopathy"
(declare-const patient_has_finding_of_chagas_disease_with_heart_involvement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of Chagas disease with heart involvement (Chagas-related cardiomyopathy).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of Chagas disease with heart involvement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Chagas disease with heart involvement.","meaning":"Boolean indicating whether the patient currently has Chagas disease with heart involvement (Chagas-related cardiomyopathy)."} // "Chagas-related cardiomyopathy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply the umbrella term (structural heart disease)
(assert
  (! (=> (or patient_has_finding_of_myocardial_infarction_now
            patient_has_finding_of_dilated_cardiomyopathy_now
            patient_has_finding_of_sarcoid_myopathy_now
            patient_has_finding_of_hypertrophic_cardiomyopathy_now
            patient_has_finding_of_chagas_disease_with_heart_involvement_now)
         patient_has_finding_of_structural_disorder_of_heart_now)
     :named REQ1_AUXILIARY0)) ;; "structural heart disease with non-exhaustive examples (post-myocardial infarction OR dilated cardiomyopathy OR sarcoid myopathy OR hypertrophic cardiomyopathy OR Chagas-related cardiomyopathy)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_structural_disorder_of_heart_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have structural heart disease"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ventricular tachycardia."} // "ventricular tachycardia"
(declare-const patient_will_undergo_catheter_ablation_of_arrhythmogenic_focus_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planned or scheduled to undergo catheter ablation of arrhythmogenic focus in the future.","when_to_set_to_false":"Set to false if the patient is not planned or scheduled to undergo catheter ablation of arrhythmogenic focus in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planned to undergo catheter ablation of arrhythmogenic focus in the future.","meaning":"Boolean indicating whether the patient is planned to undergo catheter ablation of arrhythmogenic focus in the future."} // "catheter-based ablation"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must be planned for catheter-based ablation of ventricular tachycardia.
(assert
  (! (and patient_has_diagnosis_of_ventricular_tachycardia_now
          patient_will_undergo_catheter_ablation_of_arrhythmogenic_focus_inthefuture)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_existing_implantable_cardioverter_defibrillator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an existing implantable cardioverter defibrillator.","when_to_set_to_false":"Set to false if the patient currently does not have an existing implantable cardioverter defibrillator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an existing implantable cardioverter defibrillator.","meaning":"Boolean indicating whether the patient currently has an existing implantable cardioverter defibrillator."} // "To be included, the patient must have (an existing implantable cardioverter defibrillator)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_existing_implantable_cardioverter_defibrillator_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (an existing implantable cardioverter defibrillator)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_renal_arteriography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone renal arteriography (renal angiography) now.","when_to_set_to_false":"Set to false if the patient has not undergone renal arteriography (renal angiography) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone renal arteriography (renal angiography) now.","meaning":"Boolean indicating whether the patient has undergone renal arteriography (renal angiography) now."} // "renal angiography"
(declare-const renal_vasculature_is_accessible_as_determined_by_renal_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal vasculature is accessible as determined by renal angiography now.","when_to_set_to_false":"Set to false if the patient's renal vasculature is not accessible as determined by renal angiography now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal vasculature is accessible as determined by renal angiography now.","meaning":"Boolean indicating whether the patient's renal vasculature is accessible as determined by renal angiography now."} // "accessibility of renal vasculature as determined by renal angiography"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Accessibility as determined by renal angiography implies renal angiography was performed
(assert
  (! (=> renal_vasculature_is_accessible_as_determined_by_renal_angiography_now
         patient_has_undergone_renal_arteriography_now)
     :named REQ4_AUXILIARY0)) ;; "accessibility of renal vasculature as determined by renal angiography"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! renal_vasculature_is_accessible_as_determined_by_renal_angiography_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (accessibility of renal vasculature as determined by renal angiography)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_ability_to_understand_study_requirements_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to understand the requirements of the study.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to understand the requirements of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to understand the requirements of the study.","meaning":"Boolean indicating whether the patient currently has the ability to understand the requirements of the study."} // "the ability to understand the requirements of the study"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_ability_to_understand_study_requirements_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (the ability to understand the requirements of the study)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_willing_to_adhere_to_study_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to adhere to all study restrictions as required by the study protocol.","when_to_set_to_false":"Set to false if the patient is not willing to adhere to all study restrictions as required by the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to adhere to all study restrictions as required by the study protocol.","meaning":"Boolean indicating whether the patient is willing to adhere to the study restrictions required by the study protocol."} // "willing to adhere to study restrictions"
(declare-const patient_is_willing_to_comply_with_post_procedural_follow_up_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to comply with all post-procedural follow-up requirements as specified by the study.","when_to_set_to_false":"Set to false if the patient is not willing to comply with all post-procedural follow-up requirements as specified by the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with all post-procedural follow-up requirements as specified by the study.","meaning":"Boolean indicating whether the patient is willing to comply with all post-procedural follow-up requirements as specified by the study."} // "willing to comply with all post-procedural follow-up requirements"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_willing_to_adhere_to_study_restrictions
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be (willing to adhere to study restrictions)."

(assert
  (! patient_is_willing_to_comply_with_post_procedural_follow_up_requirements
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be (willing to comply with all post-procedural follow-up requirements)."
