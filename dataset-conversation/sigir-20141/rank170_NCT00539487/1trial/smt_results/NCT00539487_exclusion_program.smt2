;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_meets_exclusion_criterion_according_to_summary_of_product_characteristics Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets at least one exclusion criterion as determined according to the summary of product characteristics.","when_to_set_to_false":"Set to false if the patient does not meet any exclusion criterion as determined according to the summary of product characteristics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets any exclusion criterion as determined according to the summary of product characteristics.","meaning":"Boolean indicating whether the patient meets at least one exclusion criterion as determined according to the summary of product characteristics."} ;; "meets at least one exclusion criterion according to summary of product characteristics"

(declare-const patient_meets_exclusion_criterion_according_to_summary_of_product_characteristics@@according_to_summary_of_product_characteristics Bool) ;; {"when_to_set_to_true":"Set to true if the exclusion criterion is determined according to the summary of product characteristics.","when_to_set_to_false":"Set to false if the exclusion criterion is not determined according to the summary of product characteristics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exclusion criterion is determined according to the summary of product characteristics.","meaning":"Boolean indicating whether the exclusion criterion is determined according to the summary of product characteristics."} ;; "according to summary of product characteristics"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_meets_exclusion_criterion_according_to_summary_of_product_characteristics@@according_to_summary_of_product_characteristics
      patient_meets_exclusion_criterion_according_to_summary_of_product_characteristics)
:named REQ0_AUXILIARY0)) ;; "according to summary of product characteristics"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_meets_exclusion_criterion_according_to_summary_of_product_characteristics)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient meets at least one exclusion criterion according to summary of product characteristics."
