;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is female."} ;; "the patient must be male or female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is male.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not male.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is male."} ;; "the patient must be male or female"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of cardiovascular system."} ;; "cardiovascular disease"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@intended_to_be_treated_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of disorder of cardiovascular system is the condition intended to be treated.","when_to_set_to_false":"Set to false if the patient's diagnosis of disorder of cardiovascular system is not the condition intended to be treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is the condition intended to be treated.","meaning":"Boolean indicating whether the patient's diagnosis of disorder of cardiovascular system is the condition intended to be treated."} ;; "intend to treat the patient's cardiovascular disease"
(declare-const patient_is_taking_amlodipine_and_atorvastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an amlodipine and atorvastatin containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking an amlodipine and atorvastatin containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an amlodipine and atorvastatin containing product.","meaning":"Boolean indicating whether the patient is currently taking an amlodipine and atorvastatin containing product."} ;; "amlodipine/atorvastatin (Caduet®) combination tablets"
(declare-const patient_is_taking_amlodipine_and_atorvastatin_containing_product_now@@prescribed_by_patient_physician Bool) ;; {"when_to_set_to_true":"Set to true if the amlodipine and atorvastatin containing product is prescribed by the patient's physician.","when_to_set_to_false":"Set to false if the amlodipine and atorvastatin containing product is not prescribed by the patient's physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is prescribed by the patient's physician.","meaning":"Boolean indicating whether the amlodipine and atorvastatin containing product is prescribed by the patient's physician."} ;; "prescribed amlodipine/atorvastatin (Caduet®) combination tablets by the patient's physician"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@intended_to_be_treated_condition
         patient_has_diagnosis_of_disorder_of_cardiovascular_system_now)
     :named REQ0_AUXILIARY0)) ;; "intend to treat the patient's cardiovascular disease"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_taking_amlodipine_and_atorvastatin_containing_product_now@@prescribed_by_patient_physician
         patient_is_taking_amlodipine_and_atorvastatin_containing_product_now)
     :named REQ0_AUXILIARY1)) ;; "prescribed amlodipine/atorvastatin (Caduet®) combination tablets by the patient's physician"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be male or female
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be male or female"

;; Component 1: patient must intend to treat cardiovascular disease
(assert
  (! patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@intended_to_be_treated_condition
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "intend to treat the patient's cardiovascular disease"

;; Component 2: patient must be prescribed amlodipine/atorvastatin (Caduet®) combination tablets by the patient's physician
(assert
  (! patient_is_taking_amlodipine_and_atorvastatin_containing_product_now@@prescribed_by_patient_physician
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "prescribed amlodipine/atorvastatin (Caduet®) combination tablets by the patient's physician"
