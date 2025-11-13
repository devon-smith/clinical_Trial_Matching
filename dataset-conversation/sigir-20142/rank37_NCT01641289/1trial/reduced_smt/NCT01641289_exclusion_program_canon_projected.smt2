;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_can_undergo_insertion_of_nasogastric_tube_now)
(assert (not patient_has_finding_of_chronic_liver_disease_inthehistory))
(assert (not patient_has_allergy_to_acetaminophen_containing_product_now))
(assert (not patient_has_contraindication_to_acetaminophen_containing_product_now))
(assert (not patient_has_allergy_to_artesunate_containing_product_now))
(assert (not patient_has_contraindication_to_artesunate_containing_product_now))
(assert (not patient_is_pregnant_now))
