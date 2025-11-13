;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_taking_low_molecular_weight_heparin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving a low molecular weight heparin-containing product.","when_to_set_to_false":"Set to false if the patient is currently not receiving a low molecular weight heparin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving a low molecular weight heparin-containing product.","meaning":"Boolean indicating whether the patient is currently receiving a low molecular weight heparin-containing product."}  ;; "receiving low molecular weight heparin"
(declare-const patient_is_taking_low_molecular_weight_heparin_containing_product_now@@for_treatment_of_cancer_associated_thrombosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving a low molecular weight heparin-containing product for the treatment of cancer-associated thrombosis.","when_to_set_to_false":"Set to false if the patient is currently receiving a low molecular weight heparin-containing product but not for the treatment of cancer-associated thrombosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is being received for the treatment of cancer-associated thrombosis.","meaning":"Boolean indicating whether the patient is currently receiving a low molecular weight heparin-containing product for the treatment of cancer-associated thrombosis."}  ;; "for treatment of cancer-associated thrombosis"
(declare-const patient_is_taking_low_molecular_weight_heparin_containing_product_now@@duration_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has been continuously receiving a low molecular weight heparin-containing product.","when_to_set_to_null":"Set to null if the duration in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in months of continuous receipt of a low molecular weight heparin-containing product."}  ;; "for a duration ≥ five months"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_taking_low_molecular_weight_heparin_containing_product_now@@for_treatment_of_cancer_associated_thrombosis
         patient_is_taking_low_molecular_weight_heparin_containing_product_now)
     :named REQ0_AUXILIARY0)) ;; "for treatment of cancer-associated thrombosis" implies "receiving low molecular weight heparin"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_is_taking_low_molecular_weight_heparin_containing_product_now@@for_treatment_of_cancer_associated_thrombosis
          (>= patient_is_taking_low_molecular_weight_heparin_containing_product_now@@duration_months 5.0))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "receiving low molecular weight heparin for treatment of cancer-associated thrombosis for a duration ≥ five months"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_locally_advanced_cancer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of locally advanced cancer.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of locally advanced cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of locally advanced cancer.","meaning":"Boolean indicating whether the patient currently has a clinical finding of locally advanced cancer now."}  ;; "locally advanced cancer"
(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of metastatic cancer (secondary malignant neoplastic disease).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of metastatic cancer (secondary malignant neoplastic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metastatic cancer (secondary malignant neoplastic disease).","meaning":"Boolean indicating whether the patient currently has metastatic cancer (secondary malignant neoplastic disease) now."}  ;; "metastatic cancer"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have (locally advanced cancer) OR (metastatic cancer).
(assert
  (! (or patient_has_finding_of_locally_advanced_cancer_now
         patient_has_finding_of_secondary_malignant_neoplastic_disease_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (locally advanced cancer) OR (metastatic cancer)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_taking_low_molecular_weight_heparin_containing_product_now@@self_administered_by_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking low molecular weight heparin containing product and the product is self-administered by the patient.","when_to_set_to_false":"Set to false if the patient is currently taking low molecular weight heparin containing product but it is not self-administered by the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is self-administered by the patient.","meaning":"Boolean indicating whether the patient is currently taking low molecular weight heparin containing product and the product is self-administered by the patient."}  ;; "able to self-administer low molecular weight heparin"
(declare-const patient_is_taking_low_molecular_weight_heparin_containing_product_now@@administered_by_carer Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking low molecular weight heparin containing product and the product is administered by a carer.","when_to_set_to_false":"Set to false if the patient is currently taking low molecular weight heparin containing product but it is not administered by a carer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is administered by a carer.","meaning":"Boolean indicating whether the patient is currently taking low molecular weight heparin containing product and the product is administered by a carer."}  ;; "have low molecular weight heparin administered by a carer"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the patient is currently taking low molecular weight heparin
(assert
  (! (=> patient_is_taking_low_molecular_weight_heparin_containing_product_now@@self_administered_by_patient
         patient_is_taking_low_molecular_weight_heparin_containing_product_now)
     :named REQ2_AUXILIARY0)) ;; If self-administered, patient is taking LMWH

(assert
  (! (=> patient_is_taking_low_molecular_weight_heparin_containing_product_now@@administered_by_carer
         patient_is_taking_low_molecular_weight_heparin_containing_product_now)
     :named REQ2_AUXILIARY1)) ;; If administered by carer, patient is taking LMWH

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must be able to self-administer LMWH OR have it administered by a carer
(assert
  (! (or patient_is_taking_low_molecular_weight_heparin_containing_product_now@@self_administered_by_patient
         patient_is_taking_low_molecular_weight_heparin_containing_product_now@@administered_by_carer)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be (able to self-administer low molecular weight heparin) OR (have low molecular weight heparin administered by a carer)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."}  ;; "able to give informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_able_to_give_informed_consent_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to give informed consent."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ sixteen years"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 16)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ sixteen years."
