;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_sore_throat_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the symptom of sore throat.","when_to_set_to_false":"Set to false if the patient currently does not have the symptom of sore throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the symptom of sore throat.","meaning":"Boolean indicating whether the patient currently has the symptom of sore throat."}  ;; "have a sore throat"
(declare-const patient_cantor_criteria_classification_value_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the integer value representing the patient's current Cantor's criteria classification (e.g., 1, 2, 3, etc.).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's current Cantor's criteria classification is.","meaning":"Numeric value indicating the patient's current classification according to Cantor's criteria, recorded as an integer."}  ;; "be classified as 2 OR be classified as 3 according to Cantor's criteria"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have a sore throat AND be classified as 2 OR 3 according to Cantor's criteria
(assert
  (! (and patient_has_finding_of_sore_throat_symptom_now
          (or (= patient_cantor_criteria_classification_value_now_withunit_integer 2)
              (= patient_cantor_criteria_classification_value_now_withunit_integer 3)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have a sore throat) AND (be classified as 2 OR be classified as 3 according to Cantor's criteria)."
