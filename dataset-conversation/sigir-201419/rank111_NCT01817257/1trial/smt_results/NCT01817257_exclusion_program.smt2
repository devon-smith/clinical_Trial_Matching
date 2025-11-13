;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "drug"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@other_than_low_molecular_weight_heparin Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament other than low molecular weight heparin.","when_to_set_to_false":"Set to false if the patient is currently exposed only to low molecular weight heparin or not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is other than low molecular weight heparin.","meaning":"Boolean indicating whether the drug or medicament exposure excludes low molecular weight heparin."} ;; "other than low molecular weight heparin"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@indication_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament for the indication of cancer.","when_to_set_to_false":"Set to false if the patient is currently exposed to a drug or medicament for an indication other than cancer or not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is being received for cancer.","meaning":"Boolean indicating whether the drug or medicament exposure is for the indication of cancer."} ;; "for cancer"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@indication_thrombosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament for the indication of thrombosis.","when_to_set_to_false":"Set to false if the patient is currently exposed to a drug or medicament for an indication other than thrombosis or not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is being received for thrombosis.","meaning":"Boolean indicating whether the drug or medicament exposure is for the indication of thrombosis."} ;; "for thrombosis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@other_than_low_molecular_weight_heparin
      patient_is_exposed_to_drug_or_medicament_now)
:named REQ0_AUXILIARY0)) ;; "other than low molecular weight heparin"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@indication_cancer
      patient_is_exposed_to_drug_or_medicament_now)
:named REQ0_AUXILIARY1)) ;; "for cancer"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@indication_thrombosis
      patient_is_exposed_to_drug_or_medicament_now)
:named REQ0_AUXILIARY2)) ;; "for thrombosis"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient is receiving a drug other than low molecular weight heparin for cancer
(assert
(! (not (and patient_is_exposed_to_drug_or_medicament_now@@other_than_low_molecular_weight_heparin
             patient_is_exposed_to_drug_or_medicament_now@@indication_cancer))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving a drug other than low molecular weight heparin for cancer."

;; Exclusion: patient is receiving a drug other than low molecular weight heparin for thrombosis
(assert
(! (not (and patient_is_exposed_to_drug_or_medicament_now@@other_than_low_molecular_weight_heparin
             patient_is_exposed_to_drug_or_medicament_now@@indication_thrombosis))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving a drug other than low molecular weight heparin for thrombosis."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_contraindication_to_anticoagulation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to anticoagulation.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to anticoagulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to anticoagulation.","meaning":"Boolean indicating whether the patient currently has a contraindication to anticoagulation."} ;; "contraindication to anticoagulation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_contraindication_to_anticoagulation_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to anticoagulation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_fitted_with_prosthetic_heart_valve_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently fitted with a prosthetic heart valve.","when_to_set_to_false":"Set to false if the patient is currently not fitted with a prosthetic heart valve.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently fitted with a prosthetic heart valve.","meaning":"Boolean indicating whether the patient is currently fitted with a prosthetic heart valve."} ;; "The patient is excluded if the patient is fitted with a prosthetic heart valve."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_is_fitted_with_prosthetic_heart_valve_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is fitted with a prosthetic heart valve."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently known not to be lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_lactating_now)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."
