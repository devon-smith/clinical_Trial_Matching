;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_participated_in_lead_in_study_14362a Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in lead-in Study 14362A.","when_to_set_to_false":"Set to false if the patient has not participated in lead-in Study 14362A.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in lead-in Study 14362A.","meaning":"Boolean indicating whether the patient has participated in lead-in Study 14362A."} ;; "did not participate in lead-in Study 14362A"
(declare-const patient_meets_separately_listed_exclusion_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets all of the separately listed exclusion criteria.","when_to_set_to_false":"Set to false if the patient does not meet all of the separately listed exclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets all of the separately listed exclusion criteria.","meaning":"Boolean indicating whether the patient meets the separately listed exclusion criteria."} ;; "does not meet the separately listed exclusion criteria"
(declare-const patient_meets_separately_listed_inclusion_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets all of the separately listed inclusion criteria.","when_to_set_to_false":"Set to false if the patient does not meet all of the separately listed inclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets all of the separately listed inclusion criteria.","meaning":"Boolean indicating whether the patient meets the separately listed inclusion criteria."} ;; "does not meet the separately listed inclusion criteria"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT satisfy the exclusion condition as described
(assert
(! (not (and
         (not patient_has_participated_in_lead_in_study_14362a)
         (or (not patient_meets_separately_listed_inclusion_criteria)
             (not patient_meets_separately_listed_exclusion_criteria))))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient did not participate in lead-in Study 14362A and does not meet the separately listed inclusion criteria or does not meet the separately listed exclusion criteria."
