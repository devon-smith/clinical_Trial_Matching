;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const household_has_participating_subject Bool) ;; {"when_to_set_to_true":"Set to true if there is at least one participating subject from the patient's household.","when_to_set_to_false":"Set to false if there are no participating subjects from the patient's household.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is a participating subject from the patient's household.","meaning":"Boolean indicating whether there is already a participating subject from the patient's household."} ;; "there is already a participating subject from the patient's household."
(declare-const household_has_participating_subject@@from_patient_household Bool) ;; {"when_to_set_to_true":"Set to true if the participating subject is from the patient's household.","when_to_set_to_false":"Set to false if the participating subject is not from the patient's household.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the participating subject is from the patient's household.","meaning":"Boolean indicating whether the participating subject is from the patient's household."} ;; "from the patient's household"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> household_has_participating_subject@@from_patient_household
       household_has_participating_subject)
   :named REQ0_AUXILIARY0)) ;; "from the patient's household"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not household_has_participating_subject)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if there is already a participating subject from the patient's household."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient is currently pregnant.","when_to_set_to_false":"Set to false if there is documented evidence that the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
