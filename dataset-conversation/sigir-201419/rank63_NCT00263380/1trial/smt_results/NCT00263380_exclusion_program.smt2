;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than forty years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 40))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than forty years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_taking_antibiotic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any antibiotic.","when_to_set_to_false":"Set to false if the patient is currently not taking any antibiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any antibiotic.","meaning":"Boolean indicating whether the patient is currently taking any antibiotic."} ;; "the patient uses antibiotics"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any corticosteroid or corticosteroid derivative containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any corticosteroid or corticosteroid derivative containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any corticosteroid or corticosteroid derivative containing product.","meaning":"Boolean indicating whether the patient is currently taking any corticosteroid or corticosteroid derivative containing product."} ;; "the patient uses corticosteroids"
(declare-const patient_is_exposed_to_beta_adrenergic_receptor_agonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any beta-adrenergic receptor agonist.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any beta-adrenergic receptor agonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any beta-adrenergic receptor agonist.","meaning":"Boolean indicating whether the patient is currently exposed to any beta-adrenergic receptor agonist."} ;; "the patient uses beta-agonists"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_taking_antibiotic_now)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses antibiotics."

(assert
(! (not patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
:named REQ1_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses corticosteroids."

(assert
(! (not patient_is_exposed_to_beta_adrenergic_receptor_agonist_now)
:named REQ1_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses beta-agonists."
