;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_weight_loss_intervention_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone weight loss intervention in the past.","when_to_set_to_false":"Set to false if the patient has not undergone weight loss intervention in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone weight loss intervention in the past.","meaning":"Boolean indicating whether the patient has undergone weight loss intervention in the history."} ;; "has undergone weight loss intervention"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_undergone_weight_loss_intervention_in_the_history)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone weight loss intervention."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_taking_steroid_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any steroid-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any steroid-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any steroid-containing product.","meaning":"Boolean indicating whether the patient is currently taking any steroid-containing product."} ;; "steroid"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_taking_steroid_containing_product_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses steroid."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an active smoker.","when_to_set_to_false":"Set to false if the patient is currently not an active smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an active smoker.","meaning":"Boolean indicating whether the patient is currently an active smoker."} ;; "active smoker"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_smoker_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an active smoker."
