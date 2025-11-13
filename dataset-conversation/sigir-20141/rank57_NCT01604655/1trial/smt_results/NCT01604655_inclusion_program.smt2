;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."}  ;; "have chest pain"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shortness of breath (dyspnea).","when_to_set_to_false":"Set to false if the patient currently does not have shortness of breath (dyspnea).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has shortness of breath (dyspnea).","meaning":"Boolean indicating whether the patient currently has shortness of breath (dyspnea)."}  ;; "have shortness of breath"
(declare-const patient_has_finding_of_dyspnea_now@@admitted_for_rule_out_acute_coronary_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shortness of breath (dyspnea) and is admitted for rule out acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently has shortness of breath (dyspnea) but is not admitted for rule out acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient with shortness of breath is admitted for rule out acute coronary syndrome.","meaning":"Boolean indicating whether the patient with shortness of breath is admitted for rule out acute coronary syndrome."}  ;; "be admitted for rule out acute coronary syndrome" (qualifier for dyspnea)

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@admitted_for_rule_out_acute_coronary_syndrome
         patient_has_finding_of_dyspnea_now)
     :named REQ0_AUXILIARY0)) ;; "patient_has_finding_of_dyspnea_now@@admitted_for_rule_out_acute_coronary_syndrome" implies "patient_has_finding_of_dyspnea_now"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((have chest pain) OR (have shortness of breath AND be admitted for rule out acute coronary syndrome)).
(assert
  (! (or patient_has_finding_of_chest_pain_now
         patient_has_finding_of_dyspnea_now@@admitted_for_rule_out_acute_coronary_syndrome)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have chest pain OR (have shortness of breath AND be admitted for rule out acute coronary syndrome)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 45 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 45)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 45 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_electrocardiographic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an electrocardiographic procedure (electrocardiogram) now.","when_to_set_to_false":"Set to false if the patient has not undergone an electrocardiographic procedure (electrocardiogram) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electrocardiographic procedure (electrocardiogram) now.","meaning":"Boolean indicating whether the patient has undergone an electrocardiographic procedure (electrocardiogram) now."}  ;; "have an electrocardiogram"
(declare-const patient_has_undergone_electrocardiographic_procedure_now@@nondiagnostic_for_acute_coronary_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the electrocardiographic procedure (electrocardiogram) performed now is non-diagnostic for acute coronary syndrome.","when_to_set_to_false":"Set to false if the electrocardiographic procedure (electrocardiogram) performed now is diagnostic for acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the electrocardiographic procedure (electrocardiogram) performed now is non-diagnostic for acute coronary syndrome.","meaning":"Boolean indicating whether the electrocardiographic procedure (electrocardiogram) performed now is non-diagnostic for acute coronary syndrome."}  ;; "that is non-diagnostic for acute coronary syndrome"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the base variable (if the ECG is non-diagnostic for ACS, then the patient must have had an ECG)
(assert
  (! (=> patient_has_undergone_electrocardiographic_procedure_now@@nondiagnostic_for_acute_coronary_syndrome
         patient_has_undergone_electrocardiographic_procedure_now)
     :named REQ2_AUXILIARY0)) ;; "that is non-diagnostic for acute coronary syndrome" implies "have an electrocardiogram"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have an electrocardiogram that is non-diagnostic for acute coronary syndrome
(assert
  (! patient_has_undergone_electrocardiographic_procedure_now@@nondiagnostic_for_acute_coronary_syndrome
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have an electrocardiogram that is non-diagnostic for acute coronary syndrome"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const negative_troponin_i_set_count_value_recorded_in_history_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of sets of negative troponin I recorded in the patient's history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many sets of negative troponin I are recorded in the patient's history.","meaning":"Numeric variable representing the count of sets of negative troponin I in the patient's history."}  ;; "number of sets of negative troponin I recorded in the patient's history"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= negative_troponin_i_set_count_value_recorded_in_history_withunit_count 1)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have ≥ 1 set of negative troponin I"
