;; ===================== Declarations for the criterion (REQ 0) =====================
;; No variables need to be declared, as the requirement is always satisfied.
;; "To be included, the patient must meet no eligibility criteria." {"when_to_set_to_true": "Always set to true, as there are no eligibility criteria to meet.", "when_to_set_to_false": "Never set to false, as there are no criteria.", "when_to_set_to_null": "Never set to null, as there are no criteria.", "meaning": "There are no eligibility criteria to satisfy for inclusion."}

;; ===================== Constraint Assertions (REQ 0) =====================
;; The requirement is always satisfied (trivially true).
(assert
  (! true
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))
;; "To be included, the patient must meet no eligibility criteria."
