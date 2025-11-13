;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_epileptic_seizure_inthehistory))
(assert (not patient_has_diagnosis_of_malignant_neoplasm_of_brain_inthehistory))
(assert (not patient_is_pregnant_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_exposed_to_metal_now) (not patient_is_undergoing_magnetic_resonance_imaging_now)))
(assert (or (not patient_is_exposed_to_metal_now) (not patient_is_undergoing_transcranial_magnetic_stimulation_now)))
