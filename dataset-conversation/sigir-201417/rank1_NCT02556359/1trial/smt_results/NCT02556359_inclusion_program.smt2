;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} // "immune deficiency"
(declare-const patient_has_finding_of_bone_marrow_failure_in_childhood Bool) ;; {"when_to_set_to_true":"Set to true if the patient had bone marrow failure during childhood.","when_to_set_to_false":"Set to false if the patient did not have bone marrow failure during childhood.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had bone marrow failure during childhood.","meaning":"Boolean indicating whether the patient had bone marrow failure during childhood."} // "early bone marrow failure in childhood"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_immunodeficiency_disorder_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have immune deficiency."

(assert
  (! patient_has_finding_of_bone_marrow_failure_in_childhood
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have early bone marrow failure in childhood."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_common_variable_agammaglobulinemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of common variable immunodeficiency (CVID).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of common variable immunodeficiency (CVID).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has common variable immunodeficiency (CVID).","meaning":"Boolean indicating whether the patient currently has common variable immunodeficiency (CVID)."} // "common variable immunodeficiency"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_common_variable_agammaglobulinemia_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have common variable immunodeficiency."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hereditary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hereditary disease (genetic disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a hereditary disease (genetic disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hereditary disease (genetic disorder).","meaning":"Boolean indicating whether the patient currently has a hereditary disease (genetic disorder)."} // "genetic disorder"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_hereditary_disease_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a patient with a genetic disorder."
