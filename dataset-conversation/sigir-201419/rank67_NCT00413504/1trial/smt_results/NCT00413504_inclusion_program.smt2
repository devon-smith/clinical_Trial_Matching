;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_thromboembolism_of_vein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of venous thromboembolism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of venous thromboembolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of venous thromboembolism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of venous thromboembolism."} // "recurrent venous thromboembolism despite anticoagulation with warfarin"
(declare-const patient_has_diagnosis_of_thromboembolism_of_vein_now@@is_recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of venous thromboembolism is recurrent.","when_to_set_to_false":"Set to false if the patient's current diagnosis of venous thromboembolism is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is recurrent.","meaning":"Boolean indicating whether the patient's current diagnosis of venous thromboembolism is recurrent."} // "recurrent venous thromboembolism"
(declare-const patient_is_undergoing_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing anticoagulant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy."} // "anticoagulation"
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@performed_with_warfarin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current anticoagulant therapy is performed with warfarin.","when_to_set_to_false":"Set to false if the patient's current anticoagulant therapy is not performed with warfarin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy is performed with warfarin.","meaning":"Boolean indicating whether the patient's current anticoagulant therapy is performed with warfarin."} // "anticoagulation with warfarin"
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of bleeding.","meaning":"Boolean indicating whether the patient currently has a finding of bleeding."} // "bleeding complications"
(declare-const patient_has_finding_of_bleeding_now@@caused_by_warfarin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is caused by warfarin.","when_to_set_to_false":"Set to false if the patient's current bleeding is not caused by warfarin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bleeding is caused by warfarin.","meaning":"Boolean indicating whether the patient's current bleeding is caused by warfarin."} // "bleeding complications due to warfarin"
(declare-const patient_has_finding_of_bleeding_now@@is_clinically_important Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is clinically important.","when_to_set_to_false":"Set to false if the patient's current bleeding is not clinically important.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bleeding is clinically important.","meaning":"Boolean indicating whether the patient's current bleeding is clinically important."} // "clinically important bleeding complications"
(declare-const patient_is_unable_to_achieve_target_international_normalized_ratio_on_warfarin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to achieve the target INR while on warfarin therapy.","when_to_set_to_false":"Set to false if the patient is currently able to achieve the target INR while on warfarin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to achieve the target INR while on warfarin therapy.","meaning":"Boolean indicating whether the patient is currently unable to achieve the target international normalized ratio (INR) while on warfarin therapy."} // "inability to achieve the target international normalized ratio on warfarin"
(declare-const patient_has_finding_of_warfarin_side_effects_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of side effects of warfarin.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of side effects of warfarin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of side effects of warfarin.","meaning":"Boolean indicating whether the patient currently has a finding of side effects of warfarin."} // "side effects of warfarin"
(declare-const patient_has_finding_of_warfarin_side_effects_now@@is_nonbleeding Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current side effects of warfarin are nonbleeding.","when_to_set_to_false":"Set to false if the patient's current side effects of warfarin are not nonbleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the side effects are nonbleeding.","meaning":"Boolean indicating whether the patient's current side effects of warfarin are nonbleeding."} // "nonbleeding side effects of warfarin"
(declare-const patient_has_finding_of_hair_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of hair loss.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of hair loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of hair loss.","meaning":"Boolean indicating whether the patient currently has a finding of hair loss."} // "hair loss"
(declare-const patient_has_finding_of_rash_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of rash.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of rash.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of rash.","meaning":"Boolean indicating whether the patient currently has a finding of rash."} // "rash"
(declare-const patient_has_finding_of_purple_toe_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of purple toe syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of purple toe syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of purple toe syndrome.","meaning":"Boolean indicating whether the patient currently has a finding of purple toe syndrome."} // "purple toe syndrome"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_thromboembolism_of_vein_now@@is_recurrent
         patient_has_diagnosis_of_thromboembolism_of_vein_now)
     :named REQ0_AUXILIARY0)) ;; "recurrent venous thromboembolism"

(assert
  (! (=> patient_is_undergoing_anticoagulant_therapy_now@@performed_with_warfarin
         patient_is_undergoing_anticoagulant_therapy_now)
     :named REQ0_AUXILIARY1)) ;; "anticoagulation with warfarin"

(assert
  (! (=> patient_has_finding_of_bleeding_now@@caused_by_warfarin
         patient_has_finding_of_bleeding_now)
     :named REQ0_AUXILIARY2)) ;; "bleeding complications due to warfarin"

(assert
  (! (=> patient_has_finding_of_bleeding_now@@is_clinically_important
         patient_has_finding_of_bleeding_now)
     :named REQ0_AUXILIARY3)) ;; "clinically important bleeding complications"

(assert
  (! (=> patient_has_finding_of_warfarin_side_effects_now@@is_nonbleeding
         patient_has_finding_of_warfarin_side_effects_now)
     :named REQ0_AUXILIARY4)) ;; "nonbleeding side effects of warfarin"

;; Non-exhaustive examples imply the umbrella term for nonbleeding warfarin side effects
(assert
  (! (=> (or patient_has_finding_of_hair_loss_now
             patient_has_finding_of_rash_now
             patient_has_finding_of_purple_toe_syndrome_now)
         patient_has_finding_of_warfarin_side_effects_now@@is_nonbleeding)
     :named REQ0_AUXILIARY5)) ;; "nonbleeding side effects of warfarin such as hair loss, rash, purple toe syndrome"

;; ===================== Constraint Assertions (REQ 0) =====================
;; At least one of the following must be true:
;; (recurrent venous thromboembolism despite anticoagulation with warfarin)
;; OR (clinically important bleeding complications due to warfarin)
;; OR (inability to achieve the target international normalized ratio on warfarin)
;; OR (nonbleeding side effects of warfarin)
(assert
  (! (or
        (and patient_has_diagnosis_of_thromboembolism_of_vein_now@@is_recurrent
             patient_is_undergoing_anticoagulant_therapy_now@@performed_with_warfarin) ;; "recurrent venous thromboembolism despite anticoagulation with warfarin"
        (and patient_has_finding_of_bleeding_now@@is_clinically_important
             patient_has_finding_of_bleeding_now@@caused_by_warfarin) ;; "clinically important bleeding complications due to warfarin"
        patient_is_unable_to_achieve_target_international_normalized_ratio_on_warfarin_now ;; "inability to achieve the target international normalized ratio on warfarin"
        patient_has_finding_of_warfarin_side_effects_now@@is_nonbleeding ;; "nonbleeding side effects of warfarin"
     )
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} // "a patient with cancer"
(declare-const patient_has_diagnosis_of_deep_vein_thrombosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of deep vein thrombosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of deep vein thrombosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of deep vein thrombosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of deep vein thrombosis."} // "deep vein thrombosis"
(declare-const patient_has_diagnosis_of_pulmonary_embolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary embolism."} // "pulmonary embolism"
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@is_monotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current anticoagulant therapy is given as monotherapy.","when_to_set_to_false":"Set to false if the patient's current anticoagulant therapy is not given as monotherapy (i.e., is combination therapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current anticoagulant therapy is given as monotherapy.","meaning":"Boolean indicating whether the patient's current anticoagulant therapy is given as monotherapy."} // "monotherapy"
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@is_parenteral Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current anticoagulant therapy is administered via a parenteral route.","when_to_set_to_false":"Set to false if the patient's current anticoagulant therapy is not administered via a parenteral route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current anticoagulant therapy is administered via a parenteral route.","meaning":"Boolean indicating whether the patient's current anticoagulant therapy is administered via a parenteral route."} // "parenteral anticoagulation"
;; patient_is_undergoing_anticoagulant_therapy_now is already declared and reused

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_is_undergoing_anticoagulant_therapy_now@@is_monotherapy
         patient_is_undergoing_anticoagulant_therapy_now)
     :named REQ1_AUXILIARY0)) ;; "monotherapy with parenteral anticoagulation"

(assert
  (! (=> patient_is_undergoing_anticoagulant_therapy_now@@is_parenteral
         patient_is_undergoing_anticoagulant_therapy_now)
     :named REQ1_AUXILIARY1)) ;; "parenteral anticoagulation"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must be a patient with cancer
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a patient with cancer"

;; Component 1: patient must be on monotherapy with parenteral anticoagulation for (deep vein thrombosis OR pulmonary embolism)
(assert
  (! (and patient_is_undergoing_anticoagulant_therapy_now@@is_monotherapy
          patient_is_undergoing_anticoagulant_therapy_now@@is_parenteral
          (or patient_has_diagnosis_of_deep_vein_thrombosis_now
              patient_has_diagnosis_of_pulmonary_embolism_now))
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "on monotherapy with parenteral anticoagulation for (deep vein thrombosis OR pulmonary embolism)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const anticoagulation_required_duration_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days for which anticoagulation is required for the patient, as documented or determined clinically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days anticoagulation is required for the patient.","meaning":"Numeric value representing the total duration in days for which anticoagulation is required for the patient."} // "require anticoagulation for ≥ 90 days"
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@required_for_at_least_90_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy and the therapy is required for at least 90 days.","when_to_set_to_false":"Set to false if the patient is currently undergoing anticoagulant therapy but the therapy is required for less than 90 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy is required for at least 90 days.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy and the therapy is required for at least 90 days."} // "require anticoagulation for ≥ 90 days"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: The qualifier variable is true iff the patient is undergoing anticoagulant therapy now AND the required duration is at least 90 days
(assert
  (! (= patient_is_undergoing_anticoagulant_therapy_now@@required_for_at_least_90_days
        (and patient_is_undergoing_anticoagulant_therapy_now
             (>= anticoagulation_required_duration_value_in_days 90.0)))
     :named REQ2_AUXILIARY0)) ;; "require anticoagulation for ≥ 90 days"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_undergoing_anticoagulant_therapy_now@@required_for_at_least_90_days
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "require anticoagulation for ≥ 90 days"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@for_objectively_confirmed_deep_vein_thrombosis_or_pulmonary_embolism Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy specifically for objectively confirmed deep vein thrombosis or pulmonary embolism.","when_to_set_to_false":"Set to false if the patient is currently undergoing anticoagulant therapy for other indications or not for objectively confirmed deep vein thrombosis or pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the indication for anticoagulant therapy is objectively confirmed deep vein thrombosis or pulmonary embolism.","meaning":"Boolean indicating whether the patient's current anticoagulant therapy is specifically for objectively confirmed deep vein thrombosis or pulmonary embolism."} // "require anticoagulation for objectively confirmed deep vein thrombosis OR objectively confirmed pulmonary embolism"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_undergoing_anticoagulant_therapy_now@@for_objectively_confirmed_deep_vein_thrombosis_or_pulmonary_embolism
         patient_is_undergoing_anticoagulant_therapy_now)
     :named REQ3_AUXILIARY0)) ;; "require anticoagulation for objectively confirmed deep vein thrombosis OR objectively confirmed pulmonary embolism"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_undergoing_anticoagulant_therapy_now@@for_objectively_confirmed_deep_vein_thrombosis_or_pulmonary_embolism
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must require anticoagulation for objectively confirmed deep vein thrombosis OR objectively confirmed pulmonary embolism."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 18 years"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age > 18 years."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "the patient must provide written informed consent"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide written informed consent"
