;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_been_randomized_under_3134k1_2202_ja_nct00752232 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been randomized under previous study 3134K1-2202-JA (NCT00752232).","when_to_set_to_false":"Set to false if the patient has not been randomized under previous study 3134K1-2202-JA (NCT00752232).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been randomized under previous study 3134K1-2202-JA (NCT00752232).","meaning":"Boolean indicating whether the patient has been randomized under previous study 3134K1-2202-JA (NCT00752232)."}

(declare-const patient_has_been_randomized_under_3134k1_2206_ja_nct00959192 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been randomized under previous study 3134K1-2206-JA (NCT00959192).","when_to_set_to_false":"Set to false if the patient has not been randomized under previous study 3134K1-2206-JA (NCT00959192).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been randomized under previous study 3134K1-2206-JA (NCT00959192).","meaning":"Boolean indicating whether the patient has been randomized under previous study 3134K1-2206-JA (NCT00959192)."}

(declare-const patient_has_met_all_inclusion_criteria_in_previous_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient has met all inclusion criteria in the previous studies 3134K1-2202-JA (NCT00752232) and 3134K1-2206-JA (NCT00959192).","when_to_set_to_false":"Set to false if the patient has not met all inclusion criteria in the previous studies 3134K1-2202-JA (NCT00752232) and 3134K1-2206-JA (NCT00959192).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has met all inclusion criteria in the previous studies 3134K1-2202-JA (NCT00752232) and 3134K1-2206-JA (NCT00959192).","meaning":"Boolean indicating whether the patient has met all inclusion criteria in the previous studies 3134K1-2202-JA (NCT00752232) and 3134K1-2206-JA (NCT00959192)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_been_randomized_under_3134k1_2202_ja_nct00752232
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been randomized under previous 3134K1-2202-JA (NCT00752232)."

(assert
  (! patient_has_been_randomized_under_3134k1_2206_ja_nct00959192
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been randomized under previous 3134K1-2206-JA (NCT00959192)."

(assert
  (! patient_has_met_all_inclusion_criteria_in_previous_studies
     :named REQ0_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have met all inclusion criteria."
