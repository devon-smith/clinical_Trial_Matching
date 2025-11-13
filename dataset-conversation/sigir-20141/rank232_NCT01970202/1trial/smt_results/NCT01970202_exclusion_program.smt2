;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_thromboembolism_of_vein_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a venous thromboembolic event (thromboembolism of vein) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a venous thromboembolic event (thromboembolism of vein) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a venous thromboembolic event (thromboembolism of vein).","meaning":"Boolean indicating whether the patient has ever had a venous thromboembolic event (thromboembolism of vein) at any time in the past."} ;; "The patient is excluded if the patient has a previous venous thromboembolic event."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_thromboembolism_of_vein_inthehistory)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous venous thromboembolic event."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_requires_inferior_vena_cava_filter_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires an inferior vena cava filter.","when_to_set_to_false":"Set to false if the patient currently does not require an inferior vena cava filter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires an inferior vena cava filter.","meaning":"Boolean indicating whether the patient currently requires an inferior vena cava filter."} ;; "The patient is excluded if the patient requires an inferior vena cava filter."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_requires_inferior_vena_cava_filter_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires an inferior vena cava filter."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_thrombophilia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of thrombophilia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of thrombophilia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of thrombophilia.","meaning":"Boolean indicating whether the patient currently has thrombophilia."} ;; "thrombophilia"
(declare-const patient_has_finding_of_thrombophilia_now@@caused_by_coagulation_factor_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current thrombophilia is caused by a coagulation factor disorder.","when_to_set_to_false":"Set to false if the patient's current thrombophilia is not caused by a coagulation factor disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current thrombophilia is caused by a coagulation factor disorder.","meaning":"Boolean indicating whether the patient's current thrombophilia is caused by a coagulation factor disorder."} ;; "thrombophilia due to coagulation factor disorder"
(declare-const patient_has_finding_of_thrombophilia_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known diagnosis of thrombophilia.","when_to_set_to_false":"Set to false if the patient currently does not have a known diagnosis of thrombophilia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known diagnosis of thrombophilia.","meaning":"Boolean indicating whether the patient currently has a known diagnosis of thrombophilia."} ;; "known thrombophilia"
(declare-const patient_has_finding_of_thrombophilia_now@@known@@due_to_coagulation_factor_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's known thrombophilia is due to a coagulation factor disorder.","when_to_set_to_false":"Set to false if the patient's known thrombophilia is not due to a coagulation factor disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's known thrombophilia is due to a coagulation factor disorder.","meaning":"Boolean indicating whether the patient's known thrombophilia is due to a coagulation factor disorder."} ;; "known thrombophilia due to coagulation factor disorder"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_thrombophilia_now@@caused_by_coagulation_factor_disorder
      patient_has_finding_of_thrombophilia_now)
:named REQ2_AUXILIARY0)) ;; "thrombophilia due to coagulation factor disorder"

(assert
(! (=> patient_has_finding_of_thrombophilia_now@@known
      patient_has_finding_of_thrombophilia_now)
:named REQ2_AUXILIARY1)) ;; "known thrombophilia"

(assert
(! (=> patient_has_finding_of_thrombophilia_now@@known@@due_to_coagulation_factor_disorder
      patient_has_finding_of_thrombophilia_now@@known)
:named REQ2_AUXILIARY2)) ;; "known thrombophilia due to coagulation factor disorder"

;; Non-exhaustive example: factor V Leiden implies known thrombophilia due to coagulation factor disorder
(declare-const patient_has_finding_of_factor_V_Leiden_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of factor V Leiden mutation.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of factor V Leiden mutation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of factor V Leiden mutation.","meaning":"Boolean indicating whether the patient currently has a clinical finding of factor V Leiden mutation."} ;; "factor V Leiden"
(assert
(! (=> patient_has_finding_of_factor_V_Leiden_now
      patient_has_finding_of_thrombophilia_now@@known@@due_to_coagulation_factor_disorder)
:named REQ2_AUXILIARY3)) ;; "with non-exhaustive examples (factor V Leiden)."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_thrombophilia_now@@known@@due_to_coagulation_factor_disorder)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known thrombophilia due to coagulation factor disorder with non-exhaustive examples (factor V Leiden)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of blood coagulation disorder (bleeding disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of blood coagulation disorder (bleeding disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of blood coagulation disorder (bleeding disorder).","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (bleeding disorder)."} ;; "bleeding disorder"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a bleeding disorder."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has renal failure syndrome."} ;; "renal failure"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_renal_failure_syndrome_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal failure."
