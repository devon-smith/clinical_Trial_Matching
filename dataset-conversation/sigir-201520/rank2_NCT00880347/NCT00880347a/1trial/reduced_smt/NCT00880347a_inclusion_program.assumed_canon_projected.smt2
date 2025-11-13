;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_alzheimer_s_disease_now)
(assert patient_has_undergone_neurological_examination_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory))
