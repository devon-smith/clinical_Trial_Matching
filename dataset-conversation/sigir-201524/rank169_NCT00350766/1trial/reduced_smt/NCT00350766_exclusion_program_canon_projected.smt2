;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_cardiac_arrest_now))
(assert (not patient_has_finding_of_rupture_of_papillary_muscle_now))
(assert (not patient_has_finding_of_ventricular_septal_defect_now))
(assert (not patient_has_finding_of_heart_valve_disorder_now))
(assert (not patient_has_undergone_dialysis_procedure_inthehistory))
(assert (not patient_has_finding_of_myocarditis_now))
(assert (not patient_has_diagnosis_of_blood_coagulation_disorder_now))
(assert (not patient_has_diagnosis_of_disease_now))
(assert (not patient_has_diagnosis_of_disorder_of_bone_now))
(assert (not patient_has_diagnosis_of_neoplastic_disease_now))
(assert (not patient_has_finding_of_chronic_infectious_disease_now))
(assert (not patient_has_finding_of_inflammatory_disorder_now))
(assert (not patient_has_undergone_implantation_of_cardiac_pacemaker_inthehistory))
(assert (not patient_has_undergone_implantation_of_internal_cardiac_defibrillator_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_aortic_valve_stenosis_now) patient_has_finding_of_heart_valve_disorder_now))
(assert (or (not patient_has_finding_of_mitral_valve_stenosis_now) patient_has_finding_of_heart_valve_disorder_now))
(assert (or (not patient_has_finding_of_aortic_valve_regurgitation_now) patient_has_finding_of_heart_valve_disorder_now))
(assert (or (not patient_has_finding_of_mitral_valve_regurgitation_now) patient_has_finding_of_heart_valve_disorder_now))
