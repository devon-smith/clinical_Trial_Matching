;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patients_anti_pancreatic_islet_cell_antibody_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has positive anti-pancreatic islet cell antibodies.","when_to_set_to_false":"Set to false if the patient currently does not have positive anti-pancreatic islet cell antibodies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has positive anti-pancreatic islet cell antibodies.","meaning":"Boolean indicating whether the patient currently has positive anti-pancreatic islet cell antibodies."} ;; "positive islet cell autoantibodies"
(declare-const patients_glutamic_acid_decarboxylase_antibody_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has positive glutamic acid decarboxylase antibodies.","when_to_set_to_false":"Set to false if the patient currently does not have positive glutamic acid decarboxylase antibodies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has positive glutamic acid decarboxylase antibodies.","meaning":"Boolean indicating whether the patient currently has positive glutamic acid decarboxylase antibodies."} ;; "positive glutamic acid decarboxylase autoantibodies"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patients_anti_pancreatic_islet_cell_antibody_is_positive_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has positive islet cell autoantibodies."

(assert
(! (not patients_glutamic_acid_decarboxylase_antibody_is_positive_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has positive glutamic acid decarboxylase autoantibodies."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_significant_medical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a significant medical illness.","when_to_set_to_false":"Set to false if the patient currently does not have a significant medical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a significant medical illness.","meaning":"Boolean indicating whether the patient currently has a significant medical illness."} ;; "significant medical illness"

(declare-const patient_has_significant_surgical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a significant surgical illness.","when_to_set_to_false":"Set to false if the patient currently does not have a significant surgical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a significant surgical illness.","meaning":"Boolean indicating whether the patient currently has a significant surgical illness."} ;; "significant surgical illness"

(declare-const patient_has_finding_of_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has a finding of myocardial ischemia."} ;; "myocardial ischemia"

(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a finding of congestive heart failure."} ;; "congestive heart failure"

(declare-const patient_has_finding_of_chronic_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of chronic renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of chronic renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of chronic renal insufficiency.","meaning":"Boolean indicating whether the patient currently has a finding of chronic renal insufficiency."} ;; "chronic renal insufficiency"

(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of hepatic failure.","meaning":"Boolean indicating whether the patient currently has a finding of hepatic failure."} ;; "liver failure"

(declare-const patient_has_finding_of_infectious_process_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of infectious process.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of infectious process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of infectious process.","meaning":"Boolean indicating whether the patient currently has a finding of infectious process."} ;; "infectious process"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term (significant surgical illness)
(assert
(! (=> (or patient_has_finding_of_myocardial_ischemia_now
          patient_has_finding_of_congestive_heart_failure_now
          patient_has_finding_of_chronic_renal_insufficiency_now
          patient_has_finding_of_hepatic_failure_now
          patient_has_finding_of_infectious_process_now)
     patient_has_significant_surgical_illness_now)
:named REQ1_AUXILIARY0)) ;; "significant surgical illness with non-exhaustive examples ((myocardial ischemia) OR (congestive heart failure) OR (chronic renal insufficiency) OR (liver failure) OR (infectious process))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_significant_medical_illness_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant medical illness."

(assert
(! (not patient_has_significant_surgical_illness_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant surgical illness with non-exhaustive examples ((myocardial ischemia) OR (congestive heart failure) OR (chronic renal insufficiency) OR (liver failure) OR (infectious process))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_of_endocrine_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the endocrine system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the endocrine system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the endocrine system.","meaning":"Boolean indicating whether the patient currently has a disorder of the endocrine system."} ;; "endocrine disorder"

(declare-const patient_has_finding_of_disorder_of_endocrine_system_now@@recognized Bool) ;; {"when_to_set_to_true":"Set to true if the disorder of the endocrine system is recognized (confirmed diagnosis).","when_to_set_to_false":"Set to false if the disorder of the endocrine system is not recognized (not confirmed, e.g., only suspected).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is recognized.","meaning":"Boolean indicating whether the disorder of the endocrine system is recognized."} ;; "recognized endocrine disorder"

(declare-const patient_has_finding_of_disorder_of_endocrine_system_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the disorder of the endocrine system is suspected (not confirmed diagnosis).","when_to_set_to_false":"Set to false if the disorder of the endocrine system is not suspected (confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is suspected.","meaning":"Boolean indicating whether the disorder of the endocrine system is suspected."} ;; "suspected endocrine disorder"

(declare-const patient_has_finding_of_disorder_of_endocrine_system_now@@associated_with_increased_insulin_resistance Bool) ;; {"when_to_set_to_true":"Set to true if the disorder of the endocrine system is associated with increased insulin resistance.","when_to_set_to_false":"Set to false if the disorder of the endocrine system is not associated with increased insulin resistance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is associated with increased insulin resistance.","meaning":"Boolean indicating whether the disorder of the endocrine system is associated with increased insulin resistance."} ;; "associated with increased insulin resistance"

(declare-const patient_has_finding_of_hypercortisolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypercortisolism.","when_to_set_to_false":"Set to false if the patient currently does not have hypercortisolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypercortisolism.","meaning":"Boolean indicating whether the patient currently has hypercortisolism."} ;; "hypercortisolism"

(declare-const patient_has_finding_of_acromegaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acromegaly.","when_to_set_to_false":"Set to false if the patient currently does not have acromegaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acromegaly.","meaning":"Boolean indicating whether the patient currently has acromegaly."} ;; "acromegaly"

(declare-const patient_has_finding_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has hyperthyroidism."} ;; "hyperthyroidism"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply the "associated with increased insulin resistance" qualifier
(assert
(! (=> (or patient_has_finding_of_hypercortisolism_now
           patient_has_finding_of_acromegaly_now
           patient_has_finding_of_hyperthyroidism_now)
    patient_has_finding_of_disorder_of_endocrine_system_now@@associated_with_increased_insulin_resistance)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((hypercortisolism) OR (acromegaly) OR (hyperthyroidism))"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_endocrine_system_now@@recognized
    patient_has_finding_of_disorder_of_endocrine_system_now)
:named REQ2_AUXILIARY1)) ;; "recognized endocrine disorder"

(assert
(! (=> patient_has_finding_of_disorder_of_endocrine_system_now@@suspected
    patient_has_finding_of_disorder_of_endocrine_system_now)
:named REQ2_AUXILIARY2)) ;; "suspected endocrine disorder"

(assert
(! (=> patient_has_finding_of_disorder_of_endocrine_system_now@@associated_with_increased_insulin_resistance
    patient_has_finding_of_disorder_of_endocrine_system_now)
:named REQ2_AUXILIARY3)) ;; "associated with increased insulin resistance"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have recognized endocrine disorder associated with increased insulin resistance
(assert
(! (not (and patient_has_finding_of_disorder_of_endocrine_system_now@@recognized
             patient_has_finding_of_disorder_of_endocrine_system_now@@associated_with_increased_insulin_resistance))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "recognized endocrine disorder associated with increased insulin resistance"

;; Exclusion: patient must NOT have suspected endocrine disorder associated with increased insulin resistance
(assert
(! (not (and patient_has_finding_of_disorder_of_endocrine_system_now@@suspected
             patient_has_finding_of_disorder_of_endocrine_system_now@@associated_with_increased_insulin_resistance))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "suspected endocrine disorder associated with increased insulin resistance"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (bleeding disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder (bleeding disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder (bleeding disorder).","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (bleeding disorder)."} ;; "bleeding disorder"
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a thrombocytopenic disorder (thrombocytopenia).","when_to_set_to_false":"Set to false if the patient currently does not have a thrombocytopenic disorder (thrombocytopenia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a thrombocytopenic disorder (thrombocytopenia).","meaning":"Boolean indicating whether the patient currently has a thrombocytopenic disorder (thrombocytopenia)."} ;; "thrombocytopenia"
(declare-const patient_has_finding_of_coag_bleeding_tests_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormality in coagulation study (abnormal coagulation test results).","when_to_set_to_false":"Set to false if the patient currently does not have an abnormality in coagulation study (abnormal coagulation test results).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormality in coagulation study (abnormal coagulation test results).","meaning":"Boolean indicating whether the patient currently has an abnormality in coagulation study (abnormal coagulation test results)."} ;; "abnormality in coagulation study"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bleeding disorder."

(assert
(! (not patient_has_finding_of_thrombocytopenic_disorder_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has thrombocytopenia."

(assert
(! (not patient_has_finding_of_coag_bleeding_tests_abnormal_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormality in coagulation study."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const blood_glucose_value_recorded_after_discontinuation_of_insulin_therapy_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's blood glucose (in mg/dL) measured after discontinuation of insulin therapy.","when_to_set_to_null":"Set to null if the blood glucose value after discontinuation of insulin therapy is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's blood glucose (in mg/dL) measured after discontinuation of insulin therapy."} ;; "blood glucose > 120 milligrams per deciliter after discontinuation of insulin therapy"

(declare-const patient_has_finding_of_hyperglycemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperglycemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperglycemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hyperglycemia.","meaning":"Boolean indicating whether the patient currently has hyperglycemia."} ;; "hyperglycemia"

(declare-const patient_has_finding_of_hyperglycemia_now@@occurs_after_discontinuation_of_insulin_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hyperglycemia occurs after discontinuation of insulin therapy.","when_to_set_to_false":"Set to false if the patient's current hyperglycemia does not occur after discontinuation of insulin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hyperglycemia occurs after discontinuation of insulin therapy.","meaning":"Boolean indicating whether the patient's current hyperglycemia occurs after discontinuation of insulin therapy."} ;; "hyperglycemia after discontinuation of insulin therapy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_hyperglycemia_now@@occurs_after_discontinuation_of_insulin_therapy
      patient_has_finding_of_hyperglycemia_now)
:named REQ4_AUXILIARY0)) ;; "hyperglycemia after discontinuation of insulin therapy" implies "hyperglycemia"

;; Numeric threshold for fasting hyperglycemia after discontinuation of insulin therapy
(assert
(! (=> (> blood_glucose_value_recorded_after_discontinuation_of_insulin_therapy_withunit_mg_per_dl 120)
      patient_has_finding_of_hyperglycemia_now@@occurs_after_discontinuation_of_insulin_therapy)
:named REQ4_AUXILIARY1)) ;; "blood glucose > 120 milligrams per deciliter after discontinuation of insulin therapy" implies "hyperglycemia after discontinuation of insulin therapy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_hyperglycemia_now@@occurs_after_discontinuation_of_insulin_therapy)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fasting hyperglycemia (blood glucose > 120 milligrams per deciliter) after discontinuation of insulin therapy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
