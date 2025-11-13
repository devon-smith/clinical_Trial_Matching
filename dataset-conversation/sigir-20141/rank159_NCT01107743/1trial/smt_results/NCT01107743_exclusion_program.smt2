;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_taken_amlodipine_and_atorvastatin_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been prescribed or has taken an amlodipine and atorvastatin containing product at any time in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never been prescribed or has never taken an amlodipine and atorvastatin containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been prescribed or has taken an amlodipine and atorvastatin containing product in the past.","meaning":"Boolean indicating whether the patient has ever taken (been prescribed) an amlodipine and atorvastatin containing product at any time in the past."} ;; "amlodipine/atorvastatin combination tablets at least once before screening"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_taken_amlodipine_and_atorvastatin_containing_product_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been prescribed amlodipine/atorvastatin combination tablets at least once before screening."
