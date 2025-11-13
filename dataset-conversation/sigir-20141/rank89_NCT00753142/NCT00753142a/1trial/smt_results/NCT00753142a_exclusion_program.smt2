;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patients_anti_pancreatic_islet_cell_antibody_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has positive anti-pancreatic islet cell antibodies.","when_to_set_to_false":"Set to false if the patient currently does not have positive anti-pancreatic islet cell antibodies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has positive anti-pancreatic islet cell antibodies.","meaning":"Boolean indicating whether the patient currently has positive anti-pancreatic islet cell antibodies."} ;; "positive islet cell autoantibodies"
(declare-const patients_glutamic_acid_decarboxylase_antibody_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has positive glutamic acid decarboxylase antibodies.","when_to_set_to_false":"Set to false if the patient currently does not have positive glutamic acid decarboxylase antibodies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has positive glutamic acid decarboxylase antibodies.","meaning":"Boolean indicating whether the patient currently has positive glutamic acid decarboxylase antibodies."} ;; "positive glutamic acid decarboxylase autoantibodies"
(declare-const patient_has_positive_autoimmune_marker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any positive autoimmune marker, including but not limited to positive islet cell autoantibodies or positive glutamic acid decarboxylase autoantibodies.","when_to_set_to_false":"Set to false if the patient currently does not have any positive autoimmune marker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any positive autoimmune marker.","meaning":"Boolean indicating whether the patient currently has any positive autoimmune marker."} ;; "positive autoimmune markers"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patients_anti_pancreatic_islet_cell_antibody_is_positive_now
          patients_glutamic_acid_decarboxylase_antibody_is_positive_now)
    patient_has_positive_autoimmune_marker_now)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((positive islet cell autoantibodies) OR (positive glutamic acid decarboxylase autoantibodies))."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_positive_autoimmune_marker_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has positive autoimmune markers with non-exhaustive examples ((positive islet cell autoantibodies) OR (positive glutamic acid decarboxylase autoantibodies))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_significant_medical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a significant medical illness.","when_to_set_to_false":"Set to false if the patient currently does not have a significant medical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a significant medical illness.","meaning":"Boolean indicating whether the patient currently has a significant medical illness."} ;; "significant medical illness"
(declare-const patient_has_finding_of_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has myocardial ischemia."} ;; "myocardial ischemia"
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_chronic_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic renal insufficiency.","meaning":"Boolean indicating whether the patient currently has chronic renal insufficiency."} ;; "chronic renal insufficiency"
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic (liver) failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic (liver) failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hepatic (liver) failure.","meaning":"Boolean indicating whether the patient currently has hepatic (liver) failure."} ;; "liver failure"
(declare-const patient_has_finding_of_hepatic_failure_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hepatic (liver) failure is considered significant.","when_to_set_to_false":"Set to false if the patient's hepatic (liver) failure is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hepatic (liver) failure is significant.","meaning":"Boolean indicating whether the patient's hepatic (liver) failure is significant."} ;; "significant liver failure"
(declare-const patient_has_finding_of_infectious_process_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infectious process.","when_to_set_to_false":"Set to false if the patient currently does not have an infectious process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infectious process.","meaning":"Boolean indicating whether the patient currently has an infectious process."} ;; "infectious process"
(declare-const patient_has_finding_of_significant_surgical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a significant surgical illness.","when_to_set_to_false":"Set to false if the patient currently does not have a significant surgical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a significant surgical illness.","meaning":"Boolean indicating whether the patient currently has a significant surgical illness."} ;; "significant surgical illness"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_myocardial_ischemia_now
          patient_has_finding_of_congestive_heart_failure_now
          patient_has_finding_of_chronic_renal_insufficiency_now
          patient_has_finding_of_hepatic_failure_now@@significant
          patient_has_finding_of_infectious_process_now)
    patient_has_finding_of_significant_medical_illness_now)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (myocardial ischemia, congestive heart failure, chronic renal insufficiency, liver failure, infectious process)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hepatic_failure_now@@significant
    patient_has_finding_of_hepatic_failure_now)
:named REQ1_AUXILIARY1)) ;; "significant liver failure"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have significant medical illness
(assert
(! (not patient_has_finding_of_significant_medical_illness_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "significant medical illness with non-exhaustive examples (myocardial ischemia, congestive heart failure, chronic renal insufficiency, liver failure, infectious process)"

;; Exclusion: patient must NOT have significant surgical illness
(assert
(! (not patient_has_finding_of_significant_surgical_illness_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "significant surgical illness"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_of_endocrine_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder of the endocrine system.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder of the endocrine system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder of the endocrine system.","meaning":"Boolean indicating whether the patient currently has any disorder of the endocrine system."} ;; "endocrine disorder"
(declare-const patient_has_finding_of_disorder_of_endocrine_system_now@@recognized Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of the endocrine system is recognized.","when_to_set_to_false":"Set to false if the patient's disorder of the endocrine system is not recognized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is recognized.","meaning":"Boolean indicating whether the patient's disorder of the endocrine system is recognized."} ;; "recognized endocrine disorder"
(declare-const patient_has_finding_of_disorder_of_endocrine_system_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of the endocrine system is suspected.","when_to_set_to_false":"Set to false if the patient's disorder of the endocrine system is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is suspected.","meaning":"Boolean indicating whether the patient's disorder of the endocrine system is suspected."} ;; "suspected endocrine disorder"
(declare-const patient_has_finding_of_disorder_of_endocrine_system_now@@associated_with_increased_insulin_resistance Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of the endocrine system is associated with increased insulin resistance.","when_to_set_to_false":"Set to false if the patient's disorder of the endocrine system is not associated with increased insulin resistance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is associated with increased insulin resistance.","meaning":"Boolean indicating whether the patient's disorder of the endocrine system is associated with increased insulin resistance."} ;; "associated with increased insulin resistance"
(declare-const patient_has_finding_of_hypercortisolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypercortisolism.","when_to_set_to_false":"Set to false if the patient currently does not have hypercortisolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypercortisolism.","meaning":"Boolean indicating whether the patient currently has hypercortisolism."} ;; "hypercortisolism"
(declare-const patient_has_finding_of_acromegaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acromegaly.","when_to_set_to_false":"Set to false if the patient currently does not have acromegaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acromegaly.","meaning":"Boolean indicating whether the patient currently has acromegaly."} ;; "acromegaly"
(declare-const patient_has_finding_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has hyperthyroidism."} ;; "hyperthyroidism"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply recognized endocrine disorder associated with increased insulin resistance
(assert
(! (=> (or patient_has_finding_of_hypercortisolism_now
          patient_has_finding_of_acromegaly_now
          patient_has_finding_of_hyperthyroidism_now)
     (and patient_has_finding_of_disorder_of_endocrine_system_now@@recognized
          patient_has_finding_of_disorder_of_endocrine_system_now@@associated_with_increased_insulin_resistance))
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (hypercortisolism, acromegaly, hyperthyroidism)" for recognized endocrine disorder associated with increased insulin resistance

;; Non-exhaustive examples imply suspected endocrine disorder associated with increased insulin resistance
(assert
(! (=> (or patient_has_finding_of_hypercortisolism_now
          patient_has_finding_of_acromegaly_now
          patient_has_finding_of_hyperthyroidism_now)
     (and patient_has_finding_of_disorder_of_endocrine_system_now@@suspected
          patient_has_finding_of_disorder_of_endocrine_system_now@@associated_with_increased_insulin_resistance))
:named REQ2_AUXILIARY1)) ;; "with non-exhaustive examples (hypercortisolism, acromegaly, hyperthyroidism)" for suspected endocrine disorder associated with increased insulin resistance

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_endocrine_system_now@@recognized
       patient_has_finding_of_disorder_of_endocrine_system_now)
:named REQ2_AUXILIARY2)) ;; "recognized endocrine disorder"

(assert
(! (=> patient_has_finding_of_disorder_of_endocrine_system_now@@suspected
       patient_has_finding_of_disorder_of_endocrine_system_now)
:named REQ2_AUXILIARY3)) ;; "suspected endocrine disorder"

(assert
(! (=> patient_has_finding_of_disorder_of_endocrine_system_now@@associated_with_increased_insulin_resistance
       patient_has_finding_of_disorder_of_endocrine_system_now)
:named REQ2_AUXILIARY4)) ;; "associated with increased insulin resistance"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: recognized endocrine disorder associated with increased insulin resistance
(assert
(! (not (and patient_has_finding_of_disorder_of_endocrine_system_now@@recognized
             patient_has_finding_of_disorder_of_endocrine_system_now@@associated_with_increased_insulin_resistance))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "recognized endocrine disorder associated with increased insulin resistance"

;; Exclusion: suspected endocrine disorder associated with increased insulin resistance
(assert
(! (not (and patient_has_finding_of_disorder_of_endocrine_system_now@@suspected
             patient_has_finding_of_disorder_of_endocrine_system_now@@associated_with_increased_insulin_resistance))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "suspected endocrine disorder associated with increased insulin resistance"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (bleeding disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder (bleeding disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder (bleeding disorder).","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (bleeding disorder)."} ;; "bleeding disorder"
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a thrombocytopenic disorder (thrombocytopenia).","when_to_set_to_false":"Set to false if the patient currently does not have a thrombocytopenic disorder (thrombocytopenia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a thrombocytopenic disorder (thrombocytopenia).","meaning":"Boolean indicating whether the patient currently has a thrombocytopenic disorder (thrombocytopenia)."} ;; "thrombocytopenia"
(declare-const patient_has_finding_of_coag_bleeding_tests_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal coagulation studies.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal coagulation studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal coagulation studies.","meaning":"Boolean indicating whether the patient currently has abnormal coagulation studies."} ;; "abnormality in coagulation studies"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bleeding disorder."

(assert
(! (not patient_has_finding_of_thrombocytopenic_disorder_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has thrombocytopenia."

(assert
(! (not patient_has_finding_of_coag_bleeding_tests_abnormal_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormality in coagulation studies."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current blood glucose level in mg/dl is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood glucose level in mg/dl."} ;; "blood glucose"
(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@fasting_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current blood glucose measurement was taken in the fasting context.","when_to_set_to_false":"Set to false if the patient's current blood glucose measurement was not taken in the fasting context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken in the fasting context.","meaning":"Boolean indicating whether the patient's current blood glucose measurement was taken in the fasting context."} ;; "fasting context"
(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@measured_after_discontinuation_of_insulin_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current blood glucose measurement was taken after discontinuation of insulin therapy.","when_to_set_to_false":"Set to false if the patient's current blood glucose measurement was not taken after discontinuation of insulin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken after discontinuation of insulin therapy.","meaning":"Boolean indicating whether the patient's current blood glucose measurement was taken after discontinuation of insulin therapy."} ;; "after discontinuation of insulin therapy"
(declare-const patient_has_finding_of_hyperglycemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperglycemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperglycemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperglycemia.","meaning":"Boolean indicating whether the patient currently has hyperglycemia."} ;; "hyperglycemia"
(declare-const patient_has_finding_of_hyperglycemia_now@@fasting_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hyperglycemia is in the fasting context.","when_to_set_to_false":"Set to false if the patient's current hyperglycemia is not in the fasting context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hyperglycemia is in the fasting context.","meaning":"Boolean indicating whether the patient's current hyperglycemia is in the fasting context."} ;; "fasting hyperglycemia"
(declare-const patient_has_finding_of_hyperglycemia_now@@occurs_after_discontinuation_of_insulin_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hyperglycemia occurs after discontinuation of insulin therapy.","when_to_set_to_false":"Set to false if the patient's current hyperglycemia does not occur after discontinuation of insulin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hyperglycemia occurs after discontinuation of insulin therapy.","meaning":"Boolean indicating whether the patient's current hyperglycemia occurs after discontinuation of insulin therapy."} ;; "after discontinuation of insulin therapy"
(declare-const patient_is_exposed_to_insulin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to insulin.","when_to_set_to_false":"Set to false if the patient is not currently exposed to insulin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to insulin.","meaning":"Boolean indicating whether the patient is currently exposed to insulin."} ;; "insulin"
(declare-const patient_is_exposed_to_insulin_now@@discontinued_prior_to_event Bool) ;; {"when_to_set_to_true":"Set to true if insulin therapy was discontinued prior to the relevant event.","when_to_set_to_false":"Set to false if insulin therapy was not discontinued prior to the relevant event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether insulin therapy was discontinued prior to the relevant event.","meaning":"Boolean indicating whether insulin therapy was discontinued prior to the relevant event."} ;; "discontinuation of insulin therapy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hyperglycemia_now@@fasting_context
      patient_has_finding_of_hyperglycemia_now)
    :named REQ4_AUXILIARY0)) ;; "fasting hyperglycemia"

(assert
(! (=> patient_has_finding_of_hyperglycemia_now@@occurs_after_discontinuation_of_insulin_therapy
      patient_has_finding_of_hyperglycemia_now)
    :named REQ4_AUXILIARY1)) ;; "hyperglycemia after discontinuation of insulin therapy"

(assert
(! (=> patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@fasting_context
      true)
    :named REQ4_AUXILIARY2)) ;; "blood glucose measured in fasting context"

(assert
(! (=> patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@measured_after_discontinuation_of_insulin_therapy
      true)
    :named REQ4_AUXILIARY3)) ;; "blood glucose measured after discontinuation of insulin therapy"

;; Fasting hyperglycemia after discontinuation of insulin therapy is defined by blood glucose > 120 mg/dl, measured in fasting context, after discontinuation of insulin therapy
(assert
(! (= patient_has_finding_of_hyperglycemia_now@@fasting_context
      (and
        patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@fasting_context
        patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@measured_after_discontinuation_of_insulin_therapy
        (> patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl 120)))
    :named REQ4_AUXILIARY4)) ;; "fasting hyperglycemia (blood glucose > 120 mg/dl) after discontinuation of insulin therapy"

(assert
(! (= patient_has_finding_of_hyperglycemia_now@@occurs_after_discontinuation_of_insulin_therapy
      (and
        patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@measured_after_discontinuation_of_insulin_therapy
        (> patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl 120)))
    :named REQ4_AUXILIARY5)) ;; "hyperglycemia after discontinuation of insulin therapy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_hyperglycemia_now@@fasting_context)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fasting hyperglycemia (blood glucose > 120 mg/dl) after discontinuation of insulin therapy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
