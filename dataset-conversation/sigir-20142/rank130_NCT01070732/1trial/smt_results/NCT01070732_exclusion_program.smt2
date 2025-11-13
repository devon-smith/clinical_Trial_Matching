;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than 18 years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than 18 years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} ;; "The patient is excluded if the patient does NOT provide informed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_provided_informed_consent)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does NOT provide informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_cirrhosis_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with liver cirrhosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with liver cirrhosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with liver cirrhosis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of liver cirrhosis in their medical history."} ;; "liver cirrhosis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_cirrhosis_of_liver_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of liver cirrhosis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current blood creatinine concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood creatinine concentration in milligrams per deciliter."} ;; "blood creatinine concentration greater than 3 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (> patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter 3))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has blood creatinine concentration greater than 3 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const laboratory_upper_normal_limit_for_ast_serum_concentration_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the value defined by the laboratory as the upper normal limit for AST serum concentration, measured now, in the laboratory's unit.","when_to_set_to_null":"Set to null if the laboratory's upper normal limit for AST serum concentration is not available or indeterminate.","meaning":"Numeric value representing the upper normal limit for AST serum concentration, as defined by the laboratory, measured now, in the laboratory's unit."} ;; "upper normal level according to the laboratory of the participating hospital"
(declare-const patient_ast_serum_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current blood aspartate aminotransferase (AST) concentration in serum is recorded now and the unit is specified by the laboratory.","when_to_set_to_null":"Set to null if no such measurement is available now or the value/unit is indeterminate.","meaning":"Numeric value representing the patient's current blood aspartate aminotransferase (AST) concentration in serum, measured now, in the laboratory's unit."} ;; "blood aspartate aminotransferase concentration"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (> patient_ast_serum_measurement_value_recorded_now_withunit_unit
           (* 3 laboratory_upper_normal_limit_for_ast_serum_concentration_now_withunit_unit)))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has blood aspartate aminotransferase concentration greater than 3 times the upper normal level according to the laboratory of the participating hospital."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_history_of_hypersensitivity_to_non_steroidal_anti_inflammatory_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity caused by a non-steroidal anti-inflammatory drug.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity caused by a non-steroidal anti-inflammatory drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity caused by a non-steroidal anti-inflammatory drug.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to non-steroidal anti-inflammatory drug."} ;; "has a history of hypersensitivity to non-steroidal anti-inflammatory drug."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_history_of_hypersensitivity_to_non_steroidal_anti_inflammatory_drug)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to non-steroidal anti-inflammatory drug."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_analgesic_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to analgesic substances at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to analgesic substances at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to analgesic substances in their history.","meaning":"Boolean indicating whether the patient has ever been exposed to analgesic substances in their history."} ;; "analgesic medication"

(declare-const patient_is_exposed_to_analgesic_inthehistory@@abuse_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of abuse of analgesic substances (i.e., exposure is characterized as abuse).","when_to_set_to_false":"Set to false if the patient has exposure to analgesic substances in their history but no history of abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to analgesic substances in their history constitutes abuse.","meaning":"Boolean indicating whether the patient's historical exposure to analgesic substances constitutes abuse."} ;; "history of abuse of analgesic medication"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_analgesic_inthehistory@@abuse_history
       patient_is_exposed_to_analgesic_inthehistory)
   :named REQ6_AUXILIARY0)) ;; "history of abuse of analgesic medication" implies "exposed to analgesic medication"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_exposed_to_analgesic_inthehistory@@abuse_history)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of abuse of analgesic medication."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently known not to be lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_is_lactating_now)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bleeding (hemorrhage).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bleeding (hemorrhage).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bleeding (hemorrhage).","meaning":"Boolean indicating whether the patient currently has bleeding (hemorrhage)."} ;; "hemorrhage"
(declare-const patient_has_finding_of_bleeding_now@@fulminant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding (hemorrhage) is fulminant.","when_to_set_to_false":"Set to false if the patient's current bleeding (hemorrhage) is not fulminant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding (hemorrhage) is fulminant.","meaning":"Boolean indicating whether the patient's current bleeding (hemorrhage) is fulminant."} ;; "fulminant hemorrhage"
(declare-const patient_has_finding_of_bleeding_now@@located_in_upper_digestive_tract Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding (hemorrhage) is located in the upper digestive tract.","when_to_set_to_false":"Set to false if the patient's current bleeding (hemorrhage) is not located in the upper digestive tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding (hemorrhage) is located in the upper digestive tract.","meaning":"Boolean indicating whether the patient's current bleeding (hemorrhage) is located in the upper digestive tract."} ;; "upper digestive tract"
(declare-const patient_has_finding_of_bleeding_now@@located_in_lower_digestive_tract Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding (hemorrhage) is located in the lower digestive tract.","when_to_set_to_false":"Set to false if the patient's current bleeding (hemorrhage) is not located in the lower digestive tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding (hemorrhage) is located in the lower digestive tract.","meaning":"Boolean indicating whether the patient's current bleeding (hemorrhage) is located in the lower digestive tract."} ;; "lower digestive tract"
(declare-const patient_has_finding_of_bleeding_now@@fulminant@@located_in_upper_digestive_tract Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bleeding (hemorrhage) that is fulminant and located in the upper digestive tract.","when_to_set_to_false":"Set to false if the patient currently does not have bleeding (hemorrhage) that is fulminant and located in the upper digestive tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bleeding (hemorrhage) that is fulminant and located in the upper digestive tract.","meaning":"Boolean indicating whether the patient currently has bleeding (hemorrhage) that is fulminant and located in the upper digestive tract."} ;; "fulminant hemorrhage of the upper digestive tract"
(declare-const patient_has_finding_of_bleeding_now@@fulminant@@located_in_lower_digestive_tract Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bleeding (hemorrhage) that is fulminant and located in the lower digestive tract.","when_to_set_to_false":"Set to false if the patient currently does not have bleeding (hemorrhage) that is fulminant and located in the lower digestive tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bleeding (hemorrhage) that is fulminant and located in the lower digestive tract.","meaning":"Boolean indicating whether the patient currently has bleeding (hemorrhage) that is fulminant and located in the lower digestive tract."} ;; "fulminant hemorrhage of the lower digestive tract"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_bleeding_now@@fulminant
      patient_has_finding_of_bleeding_now)
   :named REQ8_AUXILIARY0)) ;; "fulminant hemorrhage"

(assert
(! (=> patient_has_finding_of_bleeding_now@@located_in_upper_digestive_tract
      patient_has_finding_of_bleeding_now)
   :named REQ8_AUXILIARY1)) ;; "upper digestive tract"

(assert
(! (=> patient_has_finding_of_bleeding_now@@located_in_lower_digestive_tract
      patient_has_finding_of_bleeding_now)
   :named REQ8_AUXILIARY2)) ;; "lower digestive tract"

;; Definition: fulminant hemorrhage of upper digestive tract
(assert
(! (= patient_has_finding_of_bleeding_now@@fulminant@@located_in_upper_digestive_tract
      (and patient_has_finding_of_bleeding_now@@fulminant
           patient_has_finding_of_bleeding_now@@located_in_upper_digestive_tract))
   :named REQ8_AUXILIARY3)) ;; "fulminant hemorrhage of the upper digestive tract"

;; Definition: fulminant hemorrhage of lower digestive tract
(assert
(! (= patient_has_finding_of_bleeding_now@@fulminant@@located_in_lower_digestive_tract
      (and patient_has_finding_of_bleeding_now@@fulminant
           patient_has_finding_of_bleeding_now@@located_in_lower_digestive_tract))
   :named REQ8_AUXILIARY4)) ;; "fulminant hemorrhage of the lower digestive tract"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_bleeding_now@@fulminant@@located_in_upper_digestive_tract)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fulminant hemorrhage of the upper digestive tract."

(assert
(! (not patient_has_finding_of_bleeding_now@@fulminant@@located_in_lower_digestive_tract)
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fulminant hemorrhage of the lower digestive tract."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of thrombocytopenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of thrombocytopenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombocytopenia.","meaning":"Boolean indicating whether the patient currently has thrombocytopenia."} ;; "thrombocytopenia"
(declare-const patient_platelet_component_of_blood_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's platelet count per microliter recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count per microliter."} ;; "less than 50,000 platelets per microliter"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition: thrombocytopenia is defined as less than 50,000 platelets per microliter
(assert
(! (= patient_has_finding_of_thrombocytopenic_disorder_now
     (< patient_platelet_component_of_blood_value_recorded_now_withunit_per_microliter 50000))
:named REQ9_AUXILIARY0)) ;; "thrombocytopenia defined as less than 50,000 platelets per microliter."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_thrombocytopenic_disorder_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has thrombocytopenia defined as less than 50,000 platelets per microliter."
