;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding (nursing).","when_to_set_to_false":"Set to false if the patient is currently known not to be breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is a mother who is nursing"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a mother who is nursing."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic (liver) failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic (liver) failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic (liver) failure.","meaning":"Boolean indicating whether the patient currently has hepatic (liver) failure."} ;; "liver failure"
(declare-const patient_has_finding_of_hepatic_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic (liver) failure and the failure is severe.","when_to_set_to_false":"Set to false if the patient currently has hepatic (liver) failure but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic (liver) failure is severe.","meaning":"Boolean indicating whether the patient's current hepatic (liver) failure is severe."} ;; "severe liver failure"
(declare-const patient_has_finding_of_hepatic_failure_now@@classified_as_child_pugh_class_c Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic (liver) failure and it is classified as Child-Pugh class C.","when_to_set_to_false":"Set to false if the patient currently has hepatic (liver) failure but it is not classified as Child-Pugh class C.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic (liver) failure is classified as Child-Pugh class C.","meaning":"Boolean indicating whether the patient's current hepatic (liver) failure is classified as Child-Pugh class C."} ;; "Child-Pugh class C"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_hepatic_failure_now@@severe
       patient_has_finding_of_hepatic_failure_now)
   :named REQ1_AUXILIARY0)) ;; "severe liver failure"

(assert
(! (=> patient_has_finding_of_hepatic_failure_now@@classified_as_child_pugh_class_c
       patient_has_finding_of_hepatic_failure_now)
   :named REQ1_AUXILIARY1)) ;; "classified as Child-Pugh class C"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have severe liver failure classified as Child-Pugh class C
(assert
(! (not (and patient_has_finding_of_hepatic_failure_now@@severe
             patient_has_finding_of_hepatic_failure_now@@classified_as_child_pugh_class_c))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe liver failure classified as Child-Pugh class C."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_linezolid_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing linezolid.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing linezolid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing linezolid.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing linezolid."} ;; "linezolid"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_taking_linezolid_containing_product_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is using linezolid."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_pheochromocytoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pheochromocytoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pheochromocytoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pheochromocytoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pheochromocytoma."} ;; "pheochromocytoma"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_pheochromocytoma_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pheochromocytoma."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor of lymphoid, hemopoietic, and related tissue (hematologic malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant tumor of lymphoid, hemopoietic, and related tissue (hematologic malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant tumor of lymphoid, hemopoietic, and related tissue.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant tumor of lymphoid, hemopoietic, and related tissue (hematologic malignancy)."} ;; "hematologic malignancy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a hematologic malignancy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_using_epinephrine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using epinephrine.","when_to_set_to_false":"Set to false if the patient is currently not using epinephrine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using epinephrine.","meaning":"Boolean indicating whether the patient is currently using epinephrine."} ;; "the patient is using epinephrine"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_is_using_epinephrine_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is using epinephrine."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_undergoing_continuous_venovenous_hemofiltration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing continuous venovenous hemofiltration treatment.","when_to_set_to_false":"Set to false if the patient is currently not undergoing continuous venovenous hemofiltration treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing continuous venovenous hemofiltration treatment.","meaning":"Boolean indicating whether the patient is currently undergoing continuous venovenous hemofiltration treatment."} ;; "continuous venovenous hemofiltration treatment"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_undergoing_continuous_venovenous_hemofiltration_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is undergoing continuous venovenous hemofiltration treatment."
