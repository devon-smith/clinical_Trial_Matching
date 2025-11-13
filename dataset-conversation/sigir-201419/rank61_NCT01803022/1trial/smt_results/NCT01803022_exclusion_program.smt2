;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_contraindication_to_low_molecular_weight_heparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to the use of low molecular weight heparin.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to the use of low molecular weight heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to the use of low molecular weight heparin.","meaning":"Boolean indicating whether the patient currently has a contraindication to the use of low molecular weight heparin."} ;; "The patient is excluded if the patient has a contraindication to the use of low molecular weight heparin."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_contraindication_to_low_molecular_weight_heparin_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to the use of low molecular weight heparin."
