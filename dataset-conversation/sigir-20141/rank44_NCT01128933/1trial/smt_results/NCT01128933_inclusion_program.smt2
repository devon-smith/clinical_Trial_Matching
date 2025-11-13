;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_atheromatic_appearance_of_renal_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an atheromatic appearance of the renal artery.","when_to_set_to_false":"Set to false if the patient currently does not have an atheromatic appearance of the renal artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an atheromatic appearance of the renal artery.","meaning":"Boolean indicating whether the patient currently has an atheromatic appearance of the renal artery."}  ;; "renal artery stenosis with atheromatic appearance of the renal artery in angiography"
(declare-const patient_has_finding_of_atheromatic_appearance_of_renal_artery_now@@identified_by_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the atheromatic appearance of the renal artery is identified by angiography.","when_to_set_to_false":"Set to false if the atheromatic appearance of the renal artery is not identified by angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the atheromatic appearance of the renal artery is identified by angiography.","meaning":"Boolean indicating whether the atheromatic appearance of the renal artery is identified by angiography."}  ;; "atheromatic appearance of the renal artery in angiography"
(declare-const patient_has_finding_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has renal artery stenosis."}  ;; "renal artery stenosis"
(declare-const renal_artery_stenosis_degree_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the current degree of renal artery stenosis, measured in percent, if available.","when_to_set_to_null":"Set to null if the degree of renal artery stenosis is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the current degree of renal artery stenosis in percent."}  ;; "degree of renal artery stenosis ≥ 60 %"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for atheromatic appearance identified by angiography implies the stem variable
(assert
  (! (=> patient_has_finding_of_atheromatic_appearance_of_renal_artery_now@@identified_by_angiography
         patient_has_finding_of_atheromatic_appearance_of_renal_artery_now)
     :named REQ0_AUXILIARY0)) ;; "atheromatic appearance of the renal artery in angiography"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have renal artery stenosis with atheromatic appearance of the renal artery in angiography
(assert
  (! (and patient_has_finding_of_renal_artery_stenosis_now
          patient_has_finding_of_atheromatic_appearance_of_renal_artery_now@@identified_by_angiography)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "renal artery stenosis with atheromatic appearance of the renal artery in angiography"

;; Component 1: Must have degree of renal artery stenosis ≥ 60 %
(assert
  (! (>= renal_artery_stenosis_degree_value_recorded_now_withunit_percent 60.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "degree of renal artery stenosis ≥ 60 %"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypertension (hypertensive disorder).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypertension (hypertensive disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertension (hypertensive disorder).","meaning":"Boolean indicating whether the patient currently has hypertension (hypertensive disorder)."} ;; "hypertension (defined according to World Health Organization criteria)"

(declare-const patient_has_finding_of_hypertensive_disorder_now@@defined_according_to_who_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertension (hypertensive disorder) is defined according to World Health Organization criteria.","when_to_set_to_false":"Set to false if the patient's hypertension (hypertensive disorder) is not defined according to World Health Organization criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertension (hypertensive disorder) is defined according to World Health Organization criteria.","meaning":"Boolean indicating whether the patient's hypertension (hypertensive disorder) is defined according to World Health Organization criteria."} ;; "defined according to World Health Organization criteria"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_hypertensive_disorder_now@@defined_according_to_who_criteria
         patient_has_finding_of_hypertensive_disorder_now)
     :named REQ1_AUXILIARY0)) ;; "defined according to World Health Organization criteria" implies "hypertension"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_hypertensive_disorder_now@@defined_according_to_who_criteria
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have hypertension (defined according to World Health Organization criteria)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 18 years"

;; Component 1: To be included, the patient must be aged ≤ 75 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 75)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 75 years"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_signed_informed_consent_obtained Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed informed consent and it has been obtained.","when_to_set_to_false":"Set to false if the patient has not signed informed consent or it has not been obtained.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed informed consent and it has been obtained.","meaning":"Boolean indicating whether the patient has signed informed consent that has been obtained."} ;; "To be included, the patient must have signed informed consent obtained."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_signed_informed_consent_obtained
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed informed consent obtained."
