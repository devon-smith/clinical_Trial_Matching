;; ===================== Declarations for the criterion (REQ 0) =====================
;; No variables are needed, as the requirement states that no eligibility criteria must be met.

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; No auxiliary assertions are needed, as there are no eligibility criteria to define.

;; ===================== Constraint Assertions (REQ 0) =====================
;; The requirement is always satisfied: "To be included, the patient must not be required to meet any eligibility criteria."
(assert
  (! true
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))
