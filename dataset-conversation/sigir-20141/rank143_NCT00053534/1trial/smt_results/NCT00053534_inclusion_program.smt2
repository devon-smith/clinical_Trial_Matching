;; ===================== Declarations for the criterion (REQ 0) =====================
;; No variables are needed, as the requirement states: "To be included, the patient does not need to meet any eligibility criteria."

;; ===================== Constraint Assertions (REQ 0) =====================
;; The requirement is always satisfied; no eligibility criteria must be met.
(assert
  (! true
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient does not need to meet any eligibility criteria."
