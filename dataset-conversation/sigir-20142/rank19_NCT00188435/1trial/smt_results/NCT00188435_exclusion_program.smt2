;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
;; No variables to declare, as no exclusion criteria are specified.

;; ===================== Constraint Assertions (REQ 0) =====================
;; No exclusion criteria are specified; therefore, no patient is excluded.
;; This requirement is always satisfiable and does not restrict eligibility.
(assert
(! true
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "No exclusion criteria are specified; therefore, no patient is excluded."
