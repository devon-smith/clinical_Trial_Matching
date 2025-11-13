;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now Bool) ;; "have a diagnosis of definite sporadic Creutzfeldt-Jakob disease" or "have a diagnosis of probable sporadic Creutzfeldt-Jakob disease" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sporadic Creutzfeldt-Jakob disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sporadic Creutzfeldt-Jakob disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sporadic Creutzfeldt-Jakob disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sporadic Creutzfeldt-Jakob disease."}
(declare-const patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now@@definite Bool) ;; "diagnosis of definite sporadic Creutzfeldt-Jakob disease" {"when_to_set_to_true":"Set to true if the diagnosis of sporadic Creutzfeldt-Jakob disease is definite.","when_to_set_to_false":"Set to false if the diagnosis is not definite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is definite.","meaning":"Boolean indicating whether the diagnosis of sporadic Creutzfeldt-Jakob disease is definite."}
(declare-const patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now@@biopsy_confirmed Bool) ;; "biopsy confirmed sporadic Creutzfeldt-Jakob disease" {"when_to_set_to_true":"Set to true if the diagnosis of sporadic Creutzfeldt-Jakob disease is biopsy confirmed.","when_to_set_to_false":"Set to false if the diagnosis is not biopsy confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is biopsy confirmed.","meaning":"Boolean indicating whether the diagnosis of sporadic Creutzfeldt-Jakob disease is biopsy confirmed."}
(declare-const patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now@@probable Bool) ;; "diagnosis of probable sporadic Creutzfeldt-Jakob disease" {"when_to_set_to_true":"Set to true if the diagnosis of sporadic Creutzfeldt-Jakob disease is probable.","when_to_set_to_false":"Set to false if the diagnosis is not probable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is probable.","meaning":"Boolean indicating whether the diagnosis of sporadic Creutzfeldt-Jakob disease is probable."}
(declare-const patient_has_finding_of_dementia_now Bool) ;; "progressive dementia" {"when_to_set_to_true":"Set to true if the patient currently has a finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of dementia.","meaning":"Boolean indicating whether the patient currently has a finding of dementia."}
(declare-const patient_has_finding_of_dementia_now@@progressive Bool) ;; "progressive dementia" {"when_to_set_to_true":"Set to true if the dementia is progressive.","when_to_set_to_false":"Set to false if the dementia is not progressive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia is progressive.","meaning":"Boolean indicating whether the dementia is progressive."}
(declare-const patient_has_undergone_electroencephalogram_now Bool) ;; "a typical electroencephalogram consistent with sporadic Creutzfeldt-Jakob disease" {"when_to_set_to_true":"Set to true if the patient has undergone an electroencephalogram at the current time.","when_to_set_to_false":"Set to false if the patient has not undergone an electroencephalogram at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electroencephalogram at the current time.","meaning":"Boolean indicating whether the patient has undergone an electroencephalogram at the current time."}
(declare-const patient_has_undergone_electroencephalogram_now@@typical Bool) ;; "a typical electroencephalogram" {"when_to_set_to_true":"Set to true if the electroencephalogram is typical.","when_to_set_to_false":"Set to false if the electroencephalogram is not typical.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the electroencephalogram is typical.","meaning":"Boolean indicating whether the electroencephalogram is typical."}
(declare-const patient_has_undergone_electroencephalogram_now@@consistent_with_sporadic_creutzfeldt_jakob_disease Bool) ;; "electroencephalogram consistent with sporadic Creutzfeldt-Jakob disease" {"when_to_set_to_true":"Set to true if the electroencephalogram is consistent with sporadic Creutzfeldt-Jakob disease.","when_to_set_to_false":"Set to false if the electroencephalogram is not consistent with sporadic Creutzfeldt-Jakob disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the electroencephalogram is consistent with sporadic Creutzfeldt-Jakob disease.","meaning":"Boolean indicating whether the electroencephalogram is consistent with sporadic Creutzfeldt-Jakob disease."}
(declare-const patient_has_undergone_magnetic_resonance_imaging_now Bool) ;; "a typical magnetic resonance imaging scan consistent with sporadic Creutzfeldt-Jakob disease" {"when_to_set_to_true":"Set to true if the patient has undergone a magnetic resonance imaging scan at the current time.","when_to_set_to_false":"Set to false if the patient has not undergone a magnetic resonance imaging scan at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a magnetic resonance imaging scan at the current time.","meaning":"Boolean indicating whether the patient has undergone a magnetic resonance imaging scan at the current time."}
(declare-const patient_has_undergone_magnetic_resonance_imaging_now@@typical Bool) ;; "a typical magnetic resonance imaging scan" {"when_to_set_to_true":"Set to true if the magnetic resonance imaging scan is typical.","when_to_set_to_false":"Set to false if the magnetic resonance imaging scan is not typical.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the magnetic resonance imaging scan is typical.","meaning":"Boolean indicating whether the magnetic resonance imaging scan is typical."}
(declare-const patient_has_undergone_magnetic_resonance_imaging_now@@consistent_with_sporadic_creutzfeldt_jakob_disease Bool) ;; "magnetic resonance imaging scan consistent with sporadic Creutzfeldt-Jakob disease" {"when_to_set_to_true":"Set to true if the magnetic resonance imaging scan is consistent with sporadic Creutzfeldt-Jakob disease.","when_to_set_to_false":"Set to false if the magnetic resonance imaging scan is not consistent with sporadic Creutzfeldt-Jakob disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the magnetic resonance imaging scan is consistent with sporadic Creutzfeldt-Jakob disease.","meaning":"Boolean indicating whether the magnetic resonance imaging scan is consistent with sporadic Creutzfeldt-Jakob disease."}
(declare-const patient_has_finding_of_myoclonus_now Bool) ;; "myoclonus" {"when_to_set_to_true":"Set to true if the patient currently has myoclonus.","when_to_set_to_false":"Set to false if the patient currently does not have myoclonus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myoclonus.","meaning":"Boolean indicating whether the patient currently has myoclonus."}
(declare-const patient_has_finding_of_pyramidal_signs_now Bool) ;; "pyramidal signs" {"when_to_set_to_true":"Set to true if the patient currently has pyramidal signs.","when_to_set_to_false":"Set to false if the patient currently does not have pyramidal signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pyramidal signs.","meaning":"Boolean indicating whether the patient currently has pyramidal signs."}
(declare-const patient_has_finding_of_extrapyramidal_signs_now Bool) ;; "extrapyramidal signs" {"when_to_set_to_true":"Set to true if the patient currently has extrapyramidal signs.","when_to_set_to_false":"Set to false if the patient currently does not have extrapyramidal signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has extrapyramidal signs.","meaning":"Boolean indicating whether the patient currently has extrapyramidal signs."}
(declare-const patient_has_finding_of_visual_symptoms_now Bool) ;; "visual symptoms" {"when_to_set_to_true":"Set to true if the patient currently has visual symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have visual symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has visual symptoms.","meaning":"Boolean indicating whether the patient currently has visual symptoms."}
(declare-const patient_has_finding_of_cerebellar_signs_now Bool) ;; "cerebellar signs" {"when_to_set_to_true":"Set to true if the patient currently has cerebellar signs.","when_to_set_to_false":"Set to false if the patient currently does not have cerebellar signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cerebellar signs.","meaning":"Boolean indicating whether the patient currently has cerebellar signs."}
(declare-const patient_has_finding_of_akinetic_mutism_now Bool) ;; "akinetic mutism" {"when_to_set_to_true":"Set to true if the patient currently has akinetic mutism.","when_to_set_to_false":"Set to false if the patient currently does not have akinetic mutism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has akinetic mutism.","meaning":"Boolean indicating whether the patient currently has akinetic mutism."}
(declare-const patient_has_finding_of_focal_higher_cortical_neurologic_signs_now Bool) ;; "other focal higher cortical neurologic signs (with non-exhaustive examples (neglect, apraxia, aphasia))" {"when_to_set_to_true":"Set to true if the patient currently has focal higher cortical neurologic signs (including but not limited to neglect, apraxia, aphasia).","when_to_set_to_false":"Set to false if the patient currently does not have focal higher cortical neurologic signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has focal higher cortical neurologic signs.","meaning":"Boolean indicating whether the patient currently has focal higher cortical neurologic signs (including but not limited to neglect, apraxia, aphasia)."}
(declare-const patient_count_of_clinical_features_present_now Real) ;; "at least two of the following clinical features: myoclonus OR pyramidal signs OR extrapyramidal signs OR visual symptoms OR cerebellar signs OR akinetic mutism OR other focal higher cortical neurologic signs" {"when_to_set_to_value":"Set to the number of clinical features present now among: myoclonus, pyramidal signs, extrapyramidal signs, visual symptoms, cerebellar signs, akinetic mutism, focal higher cortical neurologic signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many clinical features are present now.","meaning":"Numeric value indicating the count of clinical features present now among: myoclonus, pyramidal signs, extrapyramidal signs, visual symptoms, cerebellar signs, akinetic mutism, focal higher cortical neurologic signs."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now@@definite
         patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now)
     :named REQ0_AUXILIARY0)) ;; "diagnosis of definite sporadic Creutzfeldt-Jakob disease" implies diagnosis

(assert
  (! (=> patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now@@probable
         patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now)
     :named REQ0_AUXILIARY1)) ;; "diagnosis of probable sporadic Creutzfeldt-Jakob disease" implies diagnosis

(assert
  (! (=> patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now@@biopsy_confirmed
         patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now)
     :named REQ0_AUXILIARY2)) ;; "biopsy confirmed" implies diagnosis

(assert
  (! (=> patient_has_finding_of_dementia_now@@progressive
         patient_has_finding_of_dementia_now)
     :named REQ0_AUXILIARY3)) ;; "progressive dementia" implies dementia

(assert
  (! (=> patient_has_undergone_electroencephalogram_now@@typical
         patient_has_undergone_electroencephalogram_now)
     :named REQ0_AUXILIARY4)) ;; "typical EEG" implies EEG

(assert
  (! (=> patient_has_undergone_electroencephalogram_now@@consistent_with_sporadic_creutzfeldt_jakob_disease
         patient_has_undergone_electroencephalogram_now)
     :named REQ0_AUXILIARY5)) ;; "EEG consistent with sCJD" implies EEG

(assert
  (! (=> patient_has_undergone_magnetic_resonance_imaging_now@@typical
         patient_has_undergone_magnetic_resonance_imaging_now)
     :named REQ0_AUXILIARY6)) ;; "typical MRI" implies MRI

(assert
  (! (=> patient_has_undergone_magnetic_resonance_imaging_now@@consistent_with_sporadic_creutzfeldt_jakob_disease
         patient_has_undergone_magnetic_resonance_imaging_now)
     :named REQ0_AUXILIARY7)) ;; "MRI consistent with sCJD" implies MRI

;; Non-exhaustive examples: neglect, apraxia, aphasia are examples of focal higher cortical neurologic signs
;; (non-exhaustive, so only one-way implication)
;; No additional variables for these examples, as umbrella variable is already present.

;; Definition: Definite sCJD = biopsy confirmed sCJD
(assert
  (! (= patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now@@definite
        patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now@@biopsy_confirmed)
     :named REQ0_AUXILIARY8)) ;; "definite sCJD (defined as biopsy confirmed sCJD)"

;; Definition: Probable sCJD = progressive dementia AND (typical EEG consistent with sCJD OR typical MRI consistent with sCJD) AND at least two clinical features
(define-fun patient_has_typical_eeg_consistent_with_scjd_now () Bool
  (and patient_has_undergone_electroencephalogram_now@@typical
       patient_has_undergone_electroencephalogram_now@@consistent_with_sporadic_creutzfeldt_jakob_disease)) ;; "typical electroencephalogram consistent with sCJD"

(define-fun patient_has_typical_mri_consistent_with_scjd_now () Bool
  (and patient_has_undergone_magnetic_resonance_imaging_now@@typical
       patient_has_undergone_magnetic_resonance_imaging_now@@consistent_with_sporadic_creutzfeldt_jakob_disease)) ;; "typical MRI consistent with sCJD"

(assert
  (! (= patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now@@probable
        (and patient_has_finding_of_dementia_now@@progressive
             (or patient_has_typical_eeg_consistent_with_scjd_now
                 patient_has_typical_mri_consistent_with_scjd_now)
             (>= patient_count_of_clinical_features_present_now 2)))
     :named REQ0_AUXILIARY9)) ;; "probable sCJD (defined as progressive dementia AND (typical EEG OR typical MRI) AND at least two clinical features)"

;; Definition: patient_count_of_clinical_features_present_now
(assert
  (! (= patient_count_of_clinical_features_present_now
        (+ (ite patient_has_finding_of_myoclonus_now 1.0 0.0)
           (ite patient_has_finding_of_pyramidal_signs_now 1.0 0.0)
           (ite patient_has_finding_of_extrapyramidal_signs_now 1.0 0.0)
           (ite patient_has_finding_of_visual_symptoms_now 1.0 0.0)
           (ite patient_has_finding_of_cerebellar_signs_now 1.0 0.0)
           (ite patient_has_finding_of_akinetic_mutism_now 1.0 0.0)
           (ite patient_has_finding_of_focal_higher_cortical_neurologic_signs_now 1.0 0.0)))
     :named REQ0_AUXILIARY10)) ;; "at least two of the following clinical features: ..."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Inclusion: definite sCJD (biopsy confirmed) OR probable sCJD (progressive dementia + typical EEG/MRI + >=2 clinical features)
(assert
  (! (or patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now@@definite
         patient_has_diagnosis_of_sporadic_creutzfeldt_jakob_disease_now@@probable)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have a diagnosis of definite sporadic Creutzfeldt-Jakob disease (defined as biopsy confirmed sporadic Creutzfeldt-Jakob disease)) OR (have a diagnosis of probable sporadic Creutzfeldt-Jakob disease (defined as progressive dementia AND (a typical electroencephalogram consistent with sporadic Creutzfeldt-Jakob disease OR a typical magnetic resonance imaging scan consistent with sporadic Creutzfeldt-Jakob disease) AND (at least two of the following clinical features: ...))))"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "aged ≥ 18 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patients_ability_to_swallow_is_positive_now Bool) ;; "To be included, the patient must be able to swallow." {"when_to_set_to_true":"Set to true if the patient is currently able to swallow.","when_to_set_to_false":"Set to false if the patient is currently unable to swallow.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to swallow.","meaning":"Boolean indicating whether the patient is currently able to swallow."}

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patients_ability_to_swallow_is_positive_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to swallow."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_able_to_follow_simple_one_step_commands_now Bool) ;; "To be included, the patient must be able to follow simple one-step commands." {"when_to_set_to_true":"Set to true if the patient is currently able to follow simple one-step commands.","when_to_set_to_false":"Set to false if the patient is currently unable to follow simple one-step commands.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to follow simple one-step commands.","meaning":"Boolean indicating whether the patient is currently able to follow simple one-step commands."}

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_able_to_follow_simple_one_step_commands_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to follow simple one-step commands."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_mri_of_brain_and_brain_stem_inthepast6months Bool) ;; "have had a brain magnetic resonance imaging scan within the previous 6 months" {"when_to_set_to_true":"Set to true if the patient has undergone a brain and brain stem MRI within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone a brain and brain stem MRI within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a brain and brain stem MRI within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone a brain and brain stem MRI within the past 6 months."}
(declare-const patient_has_undergone_mri_of_brain_and_brain_stem_inthepast6months@@rules_out_other_etiologies Bool) ;; "the brain magnetic resonance imaging scan must rule out other etiologies (such as brain mass, stroke, non-convulsive status epilepticus)" {"when_to_set_to_true":"Set to true if the brain and brain stem MRI within the past 6 months has ruled out other etiologies (such as brain mass, stroke, non-convulsive status epilepticus).","when_to_set_to_false":"Set to false if the MRI did not rule out other etiologies or if other etiologies cannot be excluded.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the MRI ruled out other etiologies.","meaning":"Boolean indicating whether the brain and brain stem MRI within the past 6 months has ruled out other etiologies."}
(declare-const patient_has_undergone_electroencephalogram_inthepast3months Bool) ;; "have had an electroencephalogram within the previous 3 months" {"when_to_set_to_true":"Set to true if the patient has undergone an electroencephalogram within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not undergone an electroencephalogram within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electroencephalogram within the past 3 months.","meaning":"Boolean indicating whether the patient has undergone an electroencephalogram within the past 3 months."}
(declare-const patient_has_undergone_electroencephalogram_inthepast3months@@rules_out_other_etiologies Bool) ;; "the electroencephalogram must rule out other etiologies (such as brain mass, stroke, non-convulsive status epilepticus)" {"when_to_set_to_true":"Set to true if the electroencephalogram within the past 3 months has ruled out other etiologies (such as brain mass, stroke, non-convulsive status epilepticus).","when_to_set_to_false":"Set to false if the EEG did not rule out other etiologies or if other etiologies cannot be excluded.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the EEG ruled out other etiologies.","meaning":"Boolean indicating whether the electroencephalogram within the past 3 months has ruled out other etiologies."}

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_mri_of_brain_and_brain_stem_inthepast6months@@rules_out_other_etiologies
         patient_has_undergone_mri_of_brain_and_brain_stem_inthepast6months)
     :named REQ4_AUXILIARY0)) ;; "the brain magnetic resonance imaging scan must rule out other etiologies (such as brain mass, stroke, non-convulsive status epilepticus)"

(assert
  (! (=> patient_has_undergone_electroencephalogram_inthepast3months@@rules_out_other_etiologies
         patient_has_undergone_electroencephalogram_inthepast3months)
     :named REQ4_AUXILIARY1)) ;; "the electroencephalogram must rule out other etiologies (such as brain mass, stroke, non-convulsive status epilepticus)"

;; Non-exhaustive examples imply umbrella term for "other etiologies"
;; (brain mass ∨ stroke ∨ non-convulsive status epilepticus) ⇒ rules_out_other_etiologies
(declare-const patient_has_finding_of_brain_mass_now Bool) ;; "brain mass" {"when_to_set_to_true":"Set to true if the patient currently has a finding of brain mass.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of brain mass.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of brain mass.","meaning":"Boolean indicating whether the patient currently has a finding of brain mass."}
(declare-const patient_has_finding_of_stroke_now Bool) ;; "stroke" {"when_to_set_to_true":"Set to true if the patient currently has a finding of stroke.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of stroke.","meaning":"Boolean indicating whether the patient currently has a finding of stroke."}
(declare-const patient_has_finding_of_non_convulsive_status_epilepticus_now Bool) ;; "non-convulsive status epilepticus" {"when_to_set_to_true":"Set to true if the patient currently has a finding of non-convulsive status epilepticus.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of non-convulsive status epilepticus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of non-convulsive status epilepticus.","meaning":"Boolean indicating whether the patient currently has a finding of non-convulsive status epilepticus."}

(assert
  (! (=> (or patient_has_finding_of_brain_mass_now
             patient_has_finding_of_stroke_now
             patient_has_finding_of_non_convulsive_status_epilepticus_now)
         (not patient_has_undergone_mri_of_brain_and_brain_stem_inthepast6months@@rules_out_other_etiologies))
     :named REQ4_AUXILIARY2)) ;; "other etiologies (such as brain mass, stroke, non-convulsive status epilepticus)" for MRI

(assert
  (! (=> (or patient_has_finding_of_brain_mass_now
             patient_has_finding_of_stroke_now
             patient_has_finding_of_non_convulsive_status_epilepticus_now)
         (not patient_has_undergone_electroencephalogram_inthepast3months@@rules_out_other_etiologies))
     :named REQ4_AUXILIARY3)) ;; "other etiologies (such as brain mass, stroke, non-convulsive status epilepticus)" for EEG

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: MRI within previous 6 months
(assert
  (! patient_has_undergone_mri_of_brain_and_brain_stem_inthepast6months
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have had a brain magnetic resonance imaging scan within the previous 6 months"

;; Component 1: EEG within previous 3 months
(assert
  (! patient_has_undergone_electroencephalogram_inthepast3months
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have had an electroencephalogram within the previous 3 months"

;; Component 2: Both MRI and EEG must rule out other etiologies
(assert
  (! (and patient_has_undergone_mri_of_brain_and_brain_stem_inthepast6months@@rules_out_other_etiologies
          patient_has_undergone_electroencephalogram_inthepast3months@@rules_out_other_etiologies)
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the brain magnetic resonance imaging scan AND the electroencephalogram must rule out other etiologies (such as brain mass, stroke, non-convulsive status epilepticus)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_will_undergo_autopsy_examination_inthefuture Bool) ;; "autopsy in the event of the patient's death during or after the study." {"when_to_set_to_true":"Set to true if the patient will undergo autopsy examination at any point in the future.","when_to_set_to_false":"Set to false if it is known that the patient will not undergo autopsy examination at any point in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo autopsy examination in the future.","meaning":"Boolean indicating whether the patient will undergo autopsy examination in the future."}
(declare-const patient_will_undergo_autopsy_examination_inthefuture@@contingent_on_death_during_or_after_study Bool) ;; "autopsy in the event of the patient's death during or after the study." {"when_to_set_to_true":"Set to true if the patient's future autopsy examination is contingent on the patient's death occurring during or after the study.","when_to_set_to_false":"Set to false if the patient's future autopsy examination is not contingent on death during or after the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the autopsy is contingent on death during or after the study.","meaning":"Boolean indicating whether the future autopsy examination is contingent on the patient's death during or after the study."}
(declare-const patient_will_undergo_autopsy_examination_inthefuture@@patient_has_consented Bool) ;; "the patient must consent to autopsy in the event of the patient's death during or after the study." {"when_to_set_to_true":"Set to true if the patient has provided consent for autopsy examination in the event of their death during or after the study.","when_to_set_to_false":"Set to false if the patient has not provided such consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent for autopsy examination in this context.","meaning":"Boolean indicating whether the patient has consented to autopsy examination in the event of their death during or after the study."}

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_will_undergo_autopsy_examination_inthefuture@@contingent_on_death_during_or_after_study
         patient_will_undergo_autopsy_examination_inthefuture)
     :named REQ5_AUXILIARY0)) ;; "autopsy in the event of the patient's death during or after the study."

(assert
  (! (=> patient_will_undergo_autopsy_examination_inthefuture@@patient_has_consented
         patient_will_undergo_autopsy_examination_inthefuture)
     :named REQ5_AUXILIARY1)) ;; "the patient must consent to autopsy in the event of the patient's death during or after the study."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (and patient_will_undergo_autopsy_examination_inthefuture@@contingent_on_death_during_or_after_study
          patient_will_undergo_autopsy_examination_inthefuture@@patient_has_consented)
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must consent to autopsy in the event of the patient's death during or after the study."
