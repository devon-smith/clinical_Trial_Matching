;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_congenital_malformation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a congenital malformation.","when_to_set_to_false":"Set to false if the patient currently does not have a congenital malformation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a congenital malformation.","meaning":"Boolean indicating whether the patient currently has a congenital malformation."} ;; "congenital malformation"
(declare-const patient_has_finding_of_congenital_malformation_now@@major Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congenital malformation is major.","when_to_set_to_false":"Set to false if the patient's congenital malformation is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congenital malformation is major.","meaning":"Boolean indicating whether the patient's congenital malformation is major."} ;; "major congenital malformation"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_congenital_malformation_now@@major
       patient_has_finding_of_congenital_malformation_now)
   :named REQ0_AUXILIARY0)) ;; "major congenital malformation"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_congenital_malformation_now@@major)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a major congenital malformation."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const mother_of_patient_is_undergoing_anticonvulsant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the mother of the patient is currently undergoing anticonvulsant drug treatment.","when_to_set_to_false":"Set to false if the mother of the patient is currently not undergoing anticonvulsant drug treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mother of the patient is currently undergoing anticonvulsant drug treatment.","meaning":"Boolean indicating whether the mother of the patient is currently undergoing anticonvulsant drug treatment."} ;; "the mother of the patient is receiving anticonvulsant drug treatment"
(declare-const mother_of_patient_is_undergoing_tb_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the mother of the patient is currently undergoing anti-tubercular drug treatment.","when_to_set_to_false":"Set to false if the mother of the patient is currently not undergoing anti-tubercular drug treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mother of the patient is currently undergoing anti-tubercular drug treatment.","meaning":"Boolean indicating whether the mother of the patient is currently undergoing anti-tubercular drug treatment."} ;; "the mother of the patient is receiving anti-tubercular drug treatment"
(declare-const mother_of_patient_is_undergoing_tb_chemotherapy_now@@with_non_exhaustive_examples_rifampicin_isoniazid Bool) ;; {"when_to_set_to_true":"Set to true if the mother of the patient is currently undergoing anti-tubercular drug treatment with drugs such as rifampicin or isoniazid, or other anti-tubercular drugs.","when_to_set_to_false":"Set to false if the mother of the patient is currently not undergoing anti-tubercular drug treatment with any anti-tubercular drugs, including rifampicin or isoniazid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mother of the patient is currently undergoing anti-tubercular drug treatment with drugs such as rifampicin or isoniazid.","meaning":"Boolean indicating whether the mother of the patient is currently undergoing anti-tubercular drug treatment with drugs such as rifampicin or isoniazid, or other anti-tubercular drugs."} ;; "with non-exhaustive examples (rifampicin, isoniazid)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> mother_of_patient_is_undergoing_tb_chemotherapy_now@@with_non_exhaustive_examples_rifampicin_isoniazid
       mother_of_patient_is_undergoing_tb_chemotherapy_now)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (rifampicin, isoniazid)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> mother_of_patient_is_undergoing_tb_chemotherapy_now@@with_non_exhaustive_examples_rifampicin_isoniazid
       mother_of_patient_is_undergoing_tb_chemotherapy_now)
   :named REQ1_AUXILIARY1)) ;; "rifampicin, isoniazid are examples of anti-tubercular drug treatment"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have a mother currently receiving anticonvulsant drug treatment
(assert
(! (not mother_of_patient_is_undergoing_anticonvulsant_therapy_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the mother of the patient is receiving anticonvulsant drug treatment."

;; Exclusion: patient must NOT have a mother currently receiving anti-tubercular drug treatment
(assert
(! (not mother_of_patient_is_undergoing_tb_chemotherapy_now)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the mother of the patient is receiving anti-tubercular drug treatment with non-exhaustive examples (rifampicin, isoniazid)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_received_postnatal_corticosteroid_treatment_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received postnatal corticosteroid treatment at any point after birth.","when_to_set_to_false":"Set to false if the patient has never received postnatal corticosteroid treatment after birth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received postnatal corticosteroid treatment after birth.","meaning":"Boolean indicating whether the patient has ever received postnatal corticosteroid treatment."} ;; "The patient is excluded if the patient has received postnatal corticosteroid treatment."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_received_postnatal_corticosteroid_treatment_ever)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received postnatal corticosteroid treatment."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_refuses_to_give_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient refuses to give consent.","when_to_set_to_false":"Set to false if the patient does not refuse to give consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refuses to give consent.","meaning":"Boolean indicating whether the patient refuses to give consent."} ;; "the patient refuses to give consent"
(declare-const representative_of_the_patient_refuses_to_give_consent Bool) ;; {"when_to_set_to_true":"Set to true if the representative of the patient refuses to give consent.","when_to_set_to_false":"Set to false if the representative of the patient does not refuse to give consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the representative of the patient refuses to give consent.","meaning":"Boolean indicating whether the representative of the patient refuses to give consent."} ;; "the representative of the patient refuses to give consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_refuses_to_give_consent)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to give consent."

(assert
(! (not representative_of_the_patient_refuses_to_give_consent)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the representative of the patient refuses to give consent."
