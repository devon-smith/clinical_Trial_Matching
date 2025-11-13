;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "male or female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "male or female"
(declare-const patient_has_finding_of_inflammatory_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of inflammatory disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of inflammatory disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of inflammatory disorder.","meaning":"Boolean indicating whether the patient currently has an inflammatory disorder."} // "inflammatory disease"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "greater than or equal to 18 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be male or female with inflammatory disease
(assert
  (! (and (or patient_sex_is_male_now patient_sex_is_female_now)
          patient_has_finding_of_inflammatory_disorder_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female with inflammatory disease."

;; Component 1: Patient must be greater than or equal to 18 years of age
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be greater than or equal to 18 years of age."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_familial_mediterranean_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of familial Mediterranean fever.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of familial Mediterranean fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of familial Mediterranean fever.","meaning":"Boolean indicating whether the patient currently has a clinical finding of familial Mediterranean fever."} // "familial Mediterranean fever"
(declare-const patient_is_participating_in_nih_study_94_ar_0105_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in National Institutes of Health study number 94-AR-0105.","when_to_set_to_false":"Set to false if the patient is currently not participating in National Institutes of Health study number 94-AR-0105.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in National Institutes of Health study number 94-AR-0105.","meaning":"Boolean indicating whether the patient is currently participating in National Institutes of Health study number 94-AR-0105."} // "participating in National Institutes of Health study number 94-AR-0105"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be participating in National Institutes of Health study number 94-AR-0105 (genetics of familial Mediterranean fever and pathophysiology of familial Mediterranean fever and related disorders).
(assert
  (! patient_is_participating_in_nih_study_94_ar_0105_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chronic_infantile_neurological_cutaneous_and_articular_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic infantile neurological cutaneous and articular syndrome (neonatal onset multisystem inflammatory disease).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic infantile neurological cutaneous and articular syndrome (neonatal onset multisystem inflammatory disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic infantile neurological cutaneous and articular syndrome (neonatal onset multisystem inflammatory disease).","meaning":"Boolean indicating whether the patient currently has chronic infantile neurological cutaneous and articular syndrome (neonatal onset multisystem inflammatory disease)."} // "active neonatal onset multisystem inflammatory disease"
(declare-const patient_has_finding_of_chronic_infantile_neurological_cutaneous_and_articular_syndrome_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chronic infantile neurological cutaneous and articular syndrome (neonatal onset multisystem inflammatory disease) is active.","when_to_set_to_false":"Set to false if the patient's current chronic infantile neurological cutaneous and articular syndrome (neonatal onset multisystem inflammatory disease) is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chronic infantile neurological cutaneous and articular syndrome (neonatal onset multisystem inflammatory disease) is active.","meaning":"Boolean indicating whether the patient's current chronic infantile neurological cutaneous and articular syndrome (neonatal onset multisystem inflammatory disease) is active."} // "active neonatal onset multisystem inflammatory disease"
(declare-const patient_has_finding_of_familial_amyloid_nephropathy_with_urticaria_and_deafness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of familial amyloid nephropathy with urticaria and deafness (Muckle-Wells syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of familial amyloid nephropathy with urticaria and deafness (Muckle-Wells syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of familial amyloid nephropathy with urticaria and deafness (Muckle-Wells syndrome).","meaning":"Boolean indicating whether the patient currently has familial amyloid nephropathy with urticaria and deafness (Muckle-Wells syndrome)."} // "active Muckle-Wells syndrome"
(declare-const patient_has_finding_of_familial_amyloid_nephropathy_with_urticaria_and_deafness_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current familial amyloid nephropathy with urticaria and deafness (Muckle-Wells syndrome) is active.","when_to_set_to_false":"Set to false if the patient's current familial amyloid nephropathy with urticaria and deafness (Muckle-Wells syndrome) is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current familial amyloid nephropathy with urticaria and deafness (Muckle-Wells syndrome) is active.","meaning":"Boolean indicating whether the patient's current familial amyloid nephropathy with urticaria and deafness (Muckle-Wells syndrome) is active."} // "active Muckle-Wells syndrome"
(declare-const patient_has_finding_of_familial_cold_urticaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of familial cold urticaria (familial cold autoinflammatory syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of familial cold urticaria (familial cold autoinflammatory syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of familial cold urticaria (familial cold autoinflammatory syndrome).","meaning":"Boolean indicating whether the patient currently has familial cold urticaria (familial cold autoinflammatory syndrome)."} // "active familial cold autoinflammatory syndrome"
(declare-const patient_has_finding_of_familial_cold_urticaria_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current familial cold urticaria (familial cold autoinflammatory syndrome) is active.","when_to_set_to_false":"Set to false if the patient's current familial cold urticaria (familial cold autoinflammatory syndrome) is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current familial cold urticaria (familial cold autoinflammatory syndrome) is active.","meaning":"Boolean indicating whether the patient's current familial cold urticaria (familial cold autoinflammatory syndrome) is active."} // "active familial cold autoinflammatory syndrome"
(declare-const patient_has_finding_of_familial_mediterranean_fever_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current familial Mediterranean fever is active.","when_to_set_to_false":"Set to false if the patient's current familial Mediterranean fever is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current familial Mediterranean fever is active.","meaning":"Boolean indicating whether the patient's current familial Mediterranean fever is active."} // "active familial Mediterranean fever"
(declare-const patient_has_finding_of_adult_onset_still_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of adult onset Still's disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of adult onset Still's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of adult onset Still's disease.","meaning":"Boolean indicating whether the patient currently has adult onset Still's disease."} // "active adult Still's disease"
(declare-const patient_has_finding_of_adult_onset_still_s_disease_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current adult onset Still's disease is active.","when_to_set_to_false":"Set to false if the patient's current adult onset Still's disease is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current adult onset Still's disease is active.","meaning":"Boolean indicating whether the patient's current adult onset Still's disease is active."} // "active adult Still's disease"
(declare-const patient_has_clinical_signs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with clinical signs relevant to the diagnosis of the specified autoinflammatory diseases.","when_to_set_to_false":"Set to false if the patient currently does not present with clinical signs relevant to the diagnosis of the specified autoinflammatory diseases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with clinical signs relevant to the diagnosis of the specified autoinflammatory diseases.","meaning":"Boolean indicating whether the patient currently presents with clinical signs relevant to the diagnosis of the specified autoinflammatory diseases."} // "clinical signs"
(declare-const patient_has_clinical_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with clinical symptoms relevant to the diagnosis of the specified autoinflammatory diseases.","when_to_set_to_false":"Set to false if the patient currently does not present with clinical symptoms relevant to the diagnosis of the specified autoinflammatory diseases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with clinical symptoms relevant to the diagnosis of the specified autoinflammatory diseases.","meaning":"Boolean indicating whether the patient currently presents with clinical symptoms relevant to the diagnosis of the specified autoinflammatory diseases."} // "clinical symptoms"
(declare-const patient_has_biochemical_marker_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with biochemical markers of disease relevant to the diagnosis of the specified autoinflammatory diseases.","when_to_set_to_false":"Set to false if the patient currently does not present with biochemical markers of disease relevant to the diagnosis of the specified autoinflammatory diseases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with biochemical markers of disease relevant to the diagnosis of the specified autoinflammatory diseases.","meaning":"Boolean indicating whether the patient currently presents with biochemical markers of disease relevant to the diagnosis of the specified autoinflammatory diseases."} // "biochemical markers"
(declare-const patient_has_acute_phase_reactant_value_recorded_now_withunit_mg_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's acute phase reactant measured now, in mg/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's acute phase reactant measured now, in mg/L."} // "acute phase reactants"
(declare-const patient_has_c_reactive_protein_value_recorded_now_withunit_mg_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's C-reactive protein measured now, in mg/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's C-reactive protein measured now, in mg/L."} // "C-reactive protein"
(declare-const patient_has_serum_amyloid_a_value_recorded_now_withunit_mg_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's serum amyloid A measured now, in mg/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's serum amyloid A measured now, in mg/L."} // "serum amyloid A"
(declare-const patient_has_erythrocyte_sedimentation_rate_value_recorded_now_withunit_mm_per_hr Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's erythrocyte sedimentation rate measured now, in mm/hr.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's erythrocyte sedimentation rate measured now, in mm/hr."} // "erythrocyte sedimentation rate"
(declare-const patient_has_clinical_features_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with clinical features relevant to the diagnosis of the specified autoinflammatory diseases.","when_to_set_to_false":"Set to false if the patient currently does not present with clinical features relevant to the diagnosis of the specified autoinflammatory diseases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with clinical features relevant to the diagnosis of the specified autoinflammatory diseases.","meaning":"Boolean indicating whether the patient currently presents with clinical features relevant to the diagnosis of the specified autoinflammatory diseases."} // "clinical features"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_chronic_infantile_neurological_cutaneous_and_articular_syndrome_now@@active
         patient_has_finding_of_chronic_infantile_neurological_cutaneous_and_articular_syndrome_now)
     :named REQ2_AUXILIARY0)) ;; "active neonatal onset multisystem inflammatory disease"

(assert
  (! (=> patient_has_finding_of_familial_amyloid_nephropathy_with_urticaria_and_deafness_now@@active
         patient_has_finding_of_familial_amyloid_nephropathy_with_urticaria_and_deafness_now)
     :named REQ2_AUXILIARY1)) ;; "active Muckle-Wells syndrome"

(assert
  (! (=> patient_has_finding_of_familial_cold_urticaria_now@@active
         patient_has_finding_of_familial_cold_urticaria_now)
     :named REQ2_AUXILIARY2)) ;; "active familial cold autoinflammatory syndrome"

(assert
  (! (=> patient_has_finding_of_familial_mediterranean_fever_now@@active
         patient_has_finding_of_familial_mediterranean_fever_now)
     :named REQ2_AUXILIARY3)) ;; "active familial Mediterranean fever"

(assert
  (! (=> patient_has_finding_of_adult_onset_still_s_disease_now@@active
         patient_has_finding_of_adult_onset_still_s_disease_now)
     :named REQ2_AUXILIARY4)) ;; "active adult Still's disease"

;; Non-exhaustive examples imply umbrella subclass for biochemical markers
(assert
  (! (=> (or (not (= patient_has_acute_phase_reactant_value_recorded_now_withunit_mg_per_l 0.0))
             (not (= patient_has_c_reactive_protein_value_recorded_now_withunit_mg_per_l 0.0))
             (not (= patient_has_serum_amyloid_a_value_recorded_now_withunit_mg_per_l 0.0))
             (not (= patient_has_erythrocyte_sedimentation_rate_value_recorded_now_withunit_mm_per_hr 0.0)))
         patient_has_biochemical_marker_of_disease_now)
     :named REQ2_AUXILIARY5)) ;; "biochemical markers with non-exhaustive examples (acute phase reactants (C-reactive protein OR serum amyloid A OR erythrocyte sedimentation rate))"

;; Clinical features are defined as clinical signs or clinical symptoms
(assert
  (! (= patient_has_clinical_features_now
         (or patient_has_clinical_signs_now
             patient_has_clinical_symptoms_now))
     :named REQ2_AUXILIARY6)) ;; "clinical features = clinical signs OR clinical symptoms"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Inclusion: patient must present with one of the listed active diseases, based on clinical signs OR clinical symptoms OR biochemical markers
(assert
  (! (and
        (or patient_has_finding_of_chronic_infantile_neurological_cutaneous_and_articular_syndrome_now@@active
            patient_has_finding_of_familial_amyloid_nephropathy_with_urticaria_and_deafness_now@@active
            patient_has_finding_of_familial_cold_urticaria_now@@active
            patient_has_finding_of_familial_mediterranean_fever_now@@active
            patient_has_finding_of_adult_onset_still_s_disease_now@@active)
        (or patient_has_clinical_signs_now
            patient_has_clinical_symptoms_now
            patient_has_biochemical_marker_of_disease_now))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must present with (active ... disease) based on (clinical signs OR clinical symptoms OR biochemical markers ...)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever as a classical feature of disease.","when_to_set_to_false":"Set to false if the patient currently does not have fever as a classical feature of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever as a classical feature of disease.","meaning":"Boolean indicating whether the patient currently has fever as a classical feature of disease."} // "fever"
(declare-const patient_has_finding_of_rash_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has rash as a classical feature of disease.","when_to_set_to_false":"Set to false if the patient currently does not have rash as a classical feature of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rash as a classical feature of disease.","meaning":"Boolean indicating whether the patient currently has rash as a classical feature of disease."} // "rash"
(declare-const patient_has_finding_of_joint_involvement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has joint involvement as a classical feature of disease.","when_to_set_to_false":"Set to false if the patient currently does not have joint involvement as a classical feature of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has joint involvement as a classical feature of disease.","meaning":"Boolean indicating whether the patient currently has joint involvement as a classical feature of disease."} // "joint involvement"
(declare-const patient_has_finding_of_central_nervous_system_involvement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has central nervous system involvement as a classical feature of disease.","when_to_set_to_false":"Set to false if the patient currently does not have central nervous system involvement as a classical feature of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has central nervous system involvement as a classical feature of disease.","meaning":"Boolean indicating whether the patient currently has central nervous system involvement as a classical feature of disease."} // "central nervous system involvement"

(declare-const patient_has_finding_of_mutation_positive_now@@for_cold_induced_autoinflammatory_syndrome_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently positive for recognized mutations in cold-induced autoinflammatory syndrome 1.","when_to_set_to_false":"Set to false if the patient is currently negative for recognized mutations in cold-induced autoinflammatory syndrome 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is positive for recognized mutations in cold-induced autoinflammatory syndrome 1.","meaning":"Boolean indicating whether the patient is currently positive for recognized mutations in cold-induced autoinflammatory syndrome 1."} // "mutation positive for cold-induced autoinflammatory syndrome 1"
(declare-const patient_has_finding_of_negative_genetic_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently negative for recognized mutations in cold-induced autoinflammatory syndrome 1.","when_to_set_to_false":"Set to false if the patient is currently positive for recognized mutations in cold-induced autoinflammatory syndrome 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is negative for recognized mutations in cold-induced autoinflammatory syndrome 1.","meaning":"Boolean indicating whether the patient is currently negative for recognized mutations in cold-induced autoinflammatory syndrome 1."} // "mutation negative"
(declare-const patient_has_finding_of_negative_genetic_finding_now@@for_cold_induced_autoinflammatory_syndrome_1 Bool) ;; {"when_to_set_to_true":"Set to true if the negative genetic finding pertains specifically to cold-induced autoinflammatory syndrome 1.","when_to_set_to_false":"Set to false if the negative genetic finding does not pertain to cold-induced autoinflammatory syndrome 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the negative genetic finding pertains to cold-induced autoinflammatory syndrome 1.","meaning":"Boolean indicating whether the negative genetic finding is specific to cold-induced autoinflammatory syndrome 1."} // "mutation negative for cold-induced autoinflammatory syndrome 1"
(declare-const patient_has_finding_of_recognized_mutation_now@@for_cold_induced_autoinflammatory_syndrome_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a recognized mutation in cold-induced autoinflammatory syndrome 1.","when_to_set_to_false":"Set to false if the patient currently does not have a recognized mutation in cold-induced autoinflammatory syndrome 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a recognized mutation in cold-induced autoinflammatory syndrome 1.","meaning":"Boolean indicating whether the patient currently has a recognized mutation in cold-induced autoinflammatory syndrome 1."} // "recognized mutation in cold-induced autoinflammatory syndrome 1"

(declare-const patient_has_quiescent_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has quiescent disease.","when_to_set_to_false":"Set to false if the patient currently does not have quiescent disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has quiescent disease.","meaning":"Boolean indicating whether the patient currently has quiescent disease."} // "quiescent disease"
(declare-const patient_has_received_therapy_with_anakinra_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received therapy with anakinra in the past.","when_to_set_to_false":"Set to false if the patient has not received therapy with anakinra in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received therapy with anakinra in the past.","meaning":"Boolean indicating whether the patient has received therapy with anakinra in the history."} // "history of therapy with anakinra"
(declare-const patient_has_received_therapy_with_anakinra_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving therapy with anakinra.","when_to_set_to_false":"Set to false if the patient is not currently receiving therapy with anakinra.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving therapy with anakinra.","meaning":"Boolean indicating whether the patient is currently receiving therapy with anakinra."} // "currently receiving anakinra"
(declare-const patient_has_active_disease_now@@after_anakinra_discontinued Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active disease after anakinra has been discontinued.","when_to_set_to_false":"Set to false if the patient currently does not have active disease after anakinra has been discontinued.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active disease after anakinra has been discontinued.","meaning":"Boolean indicating whether the patient currently has active disease after anakinra has been discontinued."} // "active disease after anakinra discontinued"
(declare-const patient_is_eligible_to_receive_study_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently eligible to receive study drug.","when_to_set_to_false":"Set to false if the patient is currently not eligible to receive study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently eligible to receive study drug.","meaning":"Boolean indicating whether the patient is currently eligible to receive study drug."} // "eligible to receive study drug"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Exhaustive subcategories for classical features of disease
(assert
  (! (= patient_has_clinical_features_now
        (or patient_has_finding_of_fever_now
            patient_has_finding_of_rash_now
            patient_has_finding_of_joint_involvement_now
            patient_has_finding_of_central_nervous_system_involvement_now))
     :named REQ3_AUXILIARY0)) ;; "classical features of disease with exhaustive subcategories (fever, rash, joint involvement, central nervous system involvement)"

;; Qualifier variable implies stem variable for mutation negative
(assert
  (! (=> patient_has_finding_of_negative_genetic_finding_now@@for_cold_induced_autoinflammatory_syndrome_1
         patient_has_finding_of_negative_genetic_finding_now)
     :named REQ3_AUXILIARY1)) ;; "mutation negative for cold-induced autoinflammatory syndrome 1"

;; Qualifier variable implies stem variable for mutation positive
(assert
  (! (=> patient_has_finding_of_mutation_positive_now@@for_cold_induced_autoinflammatory_syndrome_1
         patient_has_finding_of_recognized_mutation_now@@for_cold_induced_autoinflammatory_syndrome_1)
     :named REQ3_AUXILIARY2)) ;; "mutation positive for cold-induced autoinflammatory syndrome 1"

;; Definition of active disease: presence of classical features OR history of classical features that became quiescent in the setting of therapy with anakinra
(declare-const patient_has_history_of_classical_features_that_became_quiescent_with_anakinra Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of classical features that became quiescent in the setting of therapy with anakinra.","when_to_set_to_false":"Set to false if the patient does not have such a history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has such a history.","meaning":"Boolean indicating whether the patient has a history of classical features that became quiescent in the setting of therapy with anakinra."} // "history of classical features that became quiescent in the setting of therapy with anakinra"
(assert
  (! (= patient_has_history_of_classical_features_that_became_quiescent_with_anakinra
        (and patient_has_received_therapy_with_anakinra_in_the_history
             patient_has_quiescent_disease_now))
     :named REQ3_AUXILIARY3)) ;; "history of classical features that became quiescent in the setting of therapy with anakinra"

(declare-const patient_has_active_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active disease as defined by the protocol.","when_to_set_to_false":"Set to false if the patient currently does not have active disease as defined by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active disease as defined by the protocol.","meaning":"Boolean indicating whether the patient currently has active disease as defined by the protocol."} // "active disease"
(assert
  (! (= patient_has_active_disease_now
        (or patient_has_clinical_features_now
            patient_has_history_of_classical_features_that_became_quiescent_with_anakinra))
     :named REQ3_AUXILIARY4)) ;; "active disease is defined as (presence of aforementioned classical features) OR (history of aforementioned classical features that became quiescent in the setting of therapy with anakinra)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Diagnosis must be based on history of classical features for specified diseases
(assert
  (! (=> (or patient_has_finding_of_chronic_infantile_neurological_cutaneous_and_articular_syndrome_now
            patient_has_finding_of_familial_amyloid_nephropathy_with_urticaria_and_deafness_now
            patient_has_finding_of_familial_cold_urticaria_now)
         patient_has_clinical_features_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "diagnosis must be based on history of classical features of disease"

;; Component 1: Subjects with or without recognized mutations in cold-induced autoinflammatory syndrome 1 are eligible
(assert
  (! (=> (or patient_has_finding_of_chronic_infantile_neurological_cutaneous_and_articular_syndrome_now
            patient_has_finding_of_familial_amyloid_nephropathy_with_urticaria_and_deafness_now
            patient_has_finding_of_familial_cold_urticaria_now)
         (or patient_has_finding_of_mutation_positive_now@@for_cold_induced_autoinflammatory_syndrome_1
             patient_has_finding_of_negative_genetic_finding_now@@for_cold_induced_autoinflammatory_syndrome_1))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "subjects with OR without recognized mutations in cold-induced autoinflammatory syndrome 1 will be eligible"

;; Component 2: Active disease definition for specified diseases
(assert
  (! (=> (or patient_has_finding_of_chronic_infantile_neurological_cutaneous_and_articular_syndrome_now
            patient_has_finding_of_familial_amyloid_nephropathy_with_urticaria_and_deafness_now
            patient_has_finding_of_familial_cold_urticaria_now)
         patient_has_active_disease_now)
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "active disease is defined as (presence of aforementioned classical features) OR (history of aforementioned classical features that became quiescent in the setting of therapy with anakinra)"

;; Component 3: Before a patient with quiescent disease and currently taking anakinra can receive study drug, must fulfill criteria for active disease after anakinra discontinued
(assert
  (! (=> (and patient_has_quiescent_disease_now
             patient_has_received_therapy_with_anakinra_now)
         (=> patient_is_eligible_to_receive_study_drug_now
             patient_has_active_disease_now@@after_anakinra_discontinued))
     :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "before a patient who has quiescent disease and is currently taking anakinra can receive study drug, the patient must fulfill criteria for active disease after anakinra has been discontinued"

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_has_mutant_allele_of_mediterranean_fever_gene_count_recorded_now Real) ;; {"when_to_set_to_value":"Set to the number of mutant alleles of the Mediterranean fever gene currently documented for the patient (e.g., 0, 1, or 2).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many mutant alleles of the Mediterranean fever gene the patient has.","meaning":"Numeric value representing the number of mutant alleles of the Mediterranean fever gene currently documented for the patient."} // "documented presence of one mutant allele of Mediterranean fever gene OR documented presence of two mutant alleles of Mediterranean fever gene"
(declare-const patient_has_history_of_classical_clinical_features_of_familial_mediterranean_fever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of classical clinical features of familial Mediterranean fever (such as periodic fever, rash, arthritis, arthralgia, or episodes of serositis).","when_to_set_to_false":"Set to false if the patient does not have a documented history of classical clinical features of familial Mediterranean fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of classical clinical features of familial Mediterranean fever.","meaning":"Boolean indicating whether the patient has a history of classical clinical features of familial Mediterranean fever."} // "history of classical clinical features of familial Mediterranean fever"
(declare-const patient_has_history_of_periodic_fever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of periodic fever.","when_to_set_to_false":"Set to false if the patient does not have a documented history of periodic fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of periodic fever.","meaning":"Boolean indicating whether the patient has a history of periodic fever."} // "periodic fever"
(declare-const patient_has_history_of_rash Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of rash.","when_to_set_to_false":"Set to false if the patient does not have a documented history of rash.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of rash.","meaning":"Boolean indicating whether the patient has a history of rash."} // "rash"
(declare-const patient_has_history_of_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of arthritis.","when_to_set_to_false":"Set to false if the patient does not have a documented history of arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of arthritis.","meaning":"Boolean indicating whether the patient has a history of arthritis."} // "arthritis"
(declare-const patient_has_history_of_arthralgia Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of arthralgia.","when_to_set_to_false":"Set to false if the patient does not have a documented history of arthralgia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of arthralgia.","meaning":"Boolean indicating whether the patient has a history of arthralgia."} // "arthralgia"
(declare-const patient_has_history_of_episodes_of_serositis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of episodes of serositis.","when_to_set_to_false":"Set to false if the patient does not have a documented history of episodes of serositis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of episodes of serositis.","meaning":"Boolean indicating whether the patient has a history of episodes of serositis."} // "episodes of serositis"
(declare-const patient_is_non_responsive_to_colchicine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered non-responsive to colchicine treatment.","when_to_set_to_false":"Set to false if the patient is currently considered responsive to colchicine treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently non-responsive to colchicine treatment.","meaning":"Boolean indicating whether the patient is currently considered non-responsive to colchicine treatment."} // "non-responsive to colchicine"
(declare-const patient_is_non_responsive_to_colchicine_now@@despite_maximally_tolerated_doses_of_colchicine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's non-responsiveness to colchicine is determined despite treatment with maximally tolerated doses of colchicine.","when_to_set_to_false":"Set to false if the patient's non-responsiveness to colchicine is not determined despite maximally tolerated doses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether non-responsiveness is despite maximally tolerated doses of colchicine.","meaning":"Boolean indicating whether the patient's non-responsiveness to colchicine is despite maximally tolerated doses of colchicine."} // "non-responsive to colchicine despite maximally tolerated doses"
(declare-const patient_has_flare_count_per_month_recorded_now Real) ;; {"when_to_set_to_value":"Set to the number of flares the patient experiences per month, as currently documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many flares per month the patient experiences.","meaning":"Numeric value representing the number of flares per month currently documented for the patient."} // "flares (greater than or equal to one per month)"
(declare-const patient_has_undergone_genetic_test_inthehistory_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a positive genetic test result documented in the medical record, regardless of when it occurred.","when_to_set_to_false":"Set to false if the patient has only had negative or no genetic test results documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a positive genetic test result.","meaning":"Boolean indicating whether the patient has ever had a positive genetic test result."} // "positive genetic test"
(declare-const patient_has_undergone_genetic_test_inthehistory_outcome_is_positive@@for_familial_mediterranean_fever Bool) ;; {"when_to_set_to_true":"Set to true if the positive genetic test was specifically for familial Mediterranean fever.","when_to_set_to_false":"Set to false if the positive genetic test was not for familial Mediterranean fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive genetic test was for familial Mediterranean fever.","meaning":"Boolean indicating whether the positive genetic test was for familial Mediterranean fever."} // "positive genetic test for familial Mediterranean fever"
(declare-const upper_limit_of_normal_for_c_reactive_protein_value_recorded_between_attacks_withunit_mg_per_l Real) ;; {"when_to_set_to_value":"Set to the upper limit of normal for C-reactive protein, measured between attacks, in mg/L.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the upper limit of normal is for C-reactive protein between attacks.","meaning":"Numeric value representing the upper limit of normal for C-reactive protein, measured between attacks, in mg/L."} // "upper limit of normal for C-reactive protein"
(declare-const upper_limit_of_normal_for_erythrocyte_sedimentation_rate_value_recorded_between_attacks_withunit_mm_per_hr Real) ;; {"when_to_set_to_value":"Set to the upper limit of normal for erythrocyte sedimentation rate, measured between attacks, in mm/hr.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the upper limit of normal is for erythrocyte sedimentation rate between attacks.","meaning":"Numeric value representing the upper limit of normal for erythrocyte sedimentation rate, measured between attacks, in mm/hr."} // "upper limit of normal for erythrocyte sedimentation rate"
(declare-const upper_limit_of_normal_for_serum_amyloid_a_value_recorded_between_attacks_withunit_mg_per_l Real) ;; {"when_to_set_to_value":"Set to the upper limit of normal for serum amyloid A, measured between attacks, in mg/L.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the upper limit of normal is for serum amyloid A between attacks.","meaning":"Numeric value representing the upper limit of normal for serum amyloid A, measured between attacks, in mg/L."} // "upper limit of normal for serum amyloid A"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term for classical clinical features
(assert
  (! (=> (or patient_has_history_of_periodic_fever
            patient_has_history_of_rash
            patient_has_history_of_arthritis
            patient_has_history_of_arthralgia
            patient_has_history_of_episodes_of_serositis)
         patient_has_history_of_classical_clinical_features_of_familial_mediterranean_fever)
     :named REQ4_AUXILIARY0)) ;; "history of classical clinical features of familial Mediterranean fever with non-exhaustive examples (periodic fever, rash, arthritis, arthralgia, episodes of serositis)"

;; Qualifier variable for positive genetic test for FMF implies stem variable
(assert
  (! (=> patient_has_undergone_genetic_test_inthehistory_outcome_is_positive@@for_familial_mediterranean_fever
         patient_has_undergone_genetic_test_inthehistory_outcome_is_positive)
     :named REQ4_AUXILIARY1)) ;; "positive genetic test for familial Mediterranean fever"

;; Qualifier variable for non-responsiveness to colchicine despite maximally tolerated doses implies stem variable
(assert
  (! (=> patient_is_non_responsive_to_colchicine_now@@despite_maximally_tolerated_doses_of_colchicine
         patient_is_non_responsive_to_colchicine_now)
     :named REQ4_AUXILIARY2)) ;; "non-responsive to colchicine despite maximally tolerated doses"

;; Definition: Elevated acute phase reactants (between attacks) for FMF
(define-fun patient_has_elevated_acute_phase_reactants_between_attacks_now () Bool
  (or
    (>= patient_has_c_reactive_protein_value_recorded_now_withunit_mg_per_l
        (* 1.5 upper_limit_of_normal_for_c_reactive_protein_value_recorded_between_attacks_withunit_mg_per_l))
    (>= patient_has_erythrocyte_sedimentation_rate_value_recorded_now_withunit_mm_per_hr
        (* 1.5 upper_limit_of_normal_for_erythrocyte_sedimentation_rate_value_recorded_between_attacks_withunit_mm_per_hr))
    (>= patient_has_serum_amyloid_a_value_recorded_now_withunit_mg_per_l
        (* 1.5 upper_limit_of_normal_for_serum_amyloid_a_value_recorded_between_attacks_withunit_mg_per_l))
  )
) ;; "elevated acute phase reactants (erythrocyte sedimentation rate OR C-reactive protein OR serum amyloid A greater than or equal to 1.5 times the upper limit of normal between attacks)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Diagnosis must be based on (documented presence of one mutant allele OR two mutant alleles)
(assert
  (! (or (= patient_has_mutant_allele_of_mediterranean_fever_gene_count_recorded_now 1)
         (= patient_has_mutant_allele_of_mediterranean_fever_gene_count_recorded_now 2))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "documented presence of one mutant allele of Mediterranean fever gene OR documented presence of two mutant alleles of Mediterranean fever gene"

;; Component 1: Diagnosis must be based on history of classical clinical features
(assert
  (! patient_has_history_of_classical_clinical_features_of_familial_mediterranean_fever
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "history of classical clinical features of familial Mediterranean fever"

;; Component 2: Non-responsive to colchicine (up to 2 mg/day) on the basis of (continued symptoms OR flares >= 1/month OR elevated acute phase reactants) despite maximally tolerated doses
(assert
  (! (and
        patient_is_non_responsive_to_colchicine_now@@despite_maximally_tolerated_doses_of_colchicine
        (or
          ;; continued symptoms: non-responsiveness itself
          patient_is_non_responsive_to_colchicine_now
          ;; flares >= 1/month
          (>= patient_has_flare_count_per_month_recorded_now 1)
          ;; elevated acute phase reactants
          patient_has_elevated_acute_phase_reactants_between_attacks_now
        )
     )
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "non-responsive to colchicine (up to 2 milligrams per day) on the basis of (continued symptoms OR flares (>=1/month) OR elevated acute phase reactants) despite treatment with maximally tolerated doses of colchicine"

;; Component 3: Positive genetic test for FMF required to rule out misdiagnosis
(assert
  (! patient_has_undergone_genetic_test_inthehistory_outcome_is_positive@@for_familial_mediterranean_fever
     :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "positive genetic test will be required for familial Mediterranean fever to rule out the possibility that non-response to colchicine is due to misdiagnosis"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_adult_onset_still_s_disease_now@@diagnosis_based_on_history_of_classical_clinical_features Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of adult Still's disease is based on history of classical clinical features (e.g., fever, rash, arthritis, arthralgia, myalgia).","when_to_set_to_false":"Set to false if the diagnosis of adult Still's disease is not based on history of classical clinical features.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of adult Still's disease is based on history of classical clinical features.","meaning":"Boolean indicating whether the diagnosis of adult Still's disease is based on history of classical clinical features."} // "diagnosis must be based on history of classical clinical features"
(declare-const patient_has_finding_of_myalgia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myalgia (muscle pain).","when_to_set_to_false":"Set to false if the patient currently does not have myalgia (muscle pain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myalgia (muscle pain).","meaning":"Boolean indicating whether the patient currently has myalgia (muscle pain)."} // "myalgia"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply the umbrella term (classical clinical features)
(assert
  (! (=> (or patient_has_finding_of_fever_now
            patient_has_finding_of_rash_now
            patient_has_finding_of_joint_involvement_now
            patient_has_finding_of_myalgia_now)
         patient_has_clinical_features_now)
     :named REQ5_AUXILIARY0)) ;; "history of classical clinical features with non-exhaustive examples (fever, evanescent salmon-pink rash, arthritis, arthralgia, myalgia)"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_adult_onset_still_s_disease_now@@diagnosis_based_on_history_of_classical_clinical_features
         patient_has_finding_of_adult_onset_still_s_disease_now)
     :named REQ5_AUXILIARY1)) ;; "diagnosis must be based on history of classical clinical features"

;; Definition of active disease for adult Still's disease
(assert
  (! (= patient_has_finding_of_adult_onset_still_s_disease_now@@active
        (and patient_has_finding_of_adult_onset_still_s_disease_now
             (or
               (or patient_has_finding_of_fever_now
                   patient_has_finding_of_rash_now
                   patient_has_finding_of_joint_involvement_now
                   patient_has_finding_of_myalgia_now)
               patient_has_elevated_acute_phase_reactants_between_attacks_now)))
     :named REQ5_AUXILIARY2)) ;; "Active disease is defined as (presence of at least one of these features) OR (elevation of acute phase reactants...)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Diagnosis of adult Still's disease must be based on history of classical clinical features
(assert
  (! (=> patient_has_finding_of_adult_onset_still_s_disease_now
         patient_has_finding_of_adult_onset_still_s_disease_now@@diagnosis_based_on_history_of_classical_clinical_features)
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis must be based on history of classical clinical features"

;; Component 1: If patient has adult Still's disease, must have active disease as defined
(assert
  (! (=> patient_has_finding_of_adult_onset_still_s_disease_now
         patient_has_finding_of_adult_onset_still_s_disease_now@@active)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "active disease is defined as (presence of at least one of these features) OR (elevation of acute phase reactants...)"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const hours_since_last_dose_of_anakinra_before_start_of_interleukin_1_trap_therapy_value_recorded_now_withunit_hr Real) ;; {"when_to_set_to_value":"Set to the number of hours between the patient's last dose of anakinra and the planned start of interleukin-1 Trap therapy, measured in hours.","when_to_set_to_null":"Set to null if the time since last dose of anakinra before starting interleukin-1 Trap therapy is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the hours elapsed between the last dose of anakinra and the start of interleukin-1 Trap therapy."} // "greater than 48 hours from the last dose of anakinra before beginning interleukin-1 Trap therapy"
(declare-const patient_is_taking_anakinra_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any anakinra-containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking any anakinra-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any anakinra-containing product.","meaning":"Boolean indicating whether the patient is currently taking any anakinra-containing product."} // "currently treated with anakinra"
(declare-const patient_will_not_take_anakinra_for_remainder_of_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if it is planned and confirmed that the patient will not take anakinra for the remainder of their enrollment in the study.","when_to_set_to_false":"Set to false if the patient will take anakinra at any point during the remainder of their enrollment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will take anakinra for the remainder of their enrollment in the study.","meaning":"Boolean indicating whether the patient will not take anakinra for the remainder of their enrollment in the study."} // "will NOT take anakinra for the remainder of enrollment in the study"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; If patient is currently treated with anakinra, history of active autoinflammatory disease prior to treatment with anakinra is sufficient
(assert
  (! (=> patient_is_taking_anakinra_containing_product_now
         patient_has_history_of_classical_features_that_became_quiescent_with_anakinra)
     :named REQ6_AUXILIARY0)) ;; "if the patient is currently treated with anakinra, history of active autoinflammatory disease prior to treatment with anakinra will be sufficient"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: If currently treated with anakinra, history of active autoinflammatory disease prior to treatment with anakinra is required
(assert
  (! (or (not patient_is_taking_anakinra_containing_product_now)
         patient_has_history_of_classical_features_that_became_quiescent_with_anakinra)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is currently treated with anakinra, history of active autoinflammatory disease prior to treatment with anakinra will be sufficient"

;; Component 1: If currently treated with anakinra, must be >48 hours from last dose before starting interleukin-1 Trap therapy
(assert
  (! (or (not patient_is_taking_anakinra_containing_product_now)
         (> hours_since_last_dose_of_anakinra_before_start_of_interleukin_1_trap_therapy_value_recorded_now_withunit_hr 48.0))
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be greater than 48 hours from the last dose of anakinra before beginning interleukin-1 Trap therapy"

;; Component 2: If currently treated with anakinra, patient will NOT take anakinra for the remainder of enrollment
(assert
  (! (or (not patient_is_taking_anakinra_containing_product_now)
         patient_will_not_take_anakinra_for_remainder_of_study_enrollment)
     :named REQ6_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "will NOT take anakinra for the remainder of enrollment in the study"

;; Component 3: Before study drug is administered, patient must manifest signs of active disease as described above
(assert
  (! (=> patient_is_eligible_to_receive_study_drug_now
         patient_has_active_disease_now@@after_anakinra_discontinued)
     :named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "before study drug is administered, the patient must manifest signs of active disease as described above"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_colchicine_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to colchicine at any time during the four weeks prior to the enrollment visit.","when_to_set_to_false":"Set to false if the patient has not been exposed to colchicine during the four weeks prior to the enrollment visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to colchicine during the four weeks prior to the enrollment visit.","meaning":"Boolean indicating whether the patient has been exposed to colchicine during the four weeks prior to the enrollment visit."} // "colchicine for four weeks prior to the enrollment visit"
(declare-const patient_is_exposed_to_colchicine_inthepast4weeks@@dose_is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to colchicine during the four weeks prior to the enrollment visit and the dose has been stable throughout that period.","when_to_set_to_false":"Set to false if the patient has been exposed to colchicine during the four weeks prior to the enrollment visit but the dose has not been stable throughout that period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose of colchicine was stable during the four weeks prior to the enrollment visit.","meaning":"Boolean indicating whether the dose of colchicine was stable during the four weeks prior to the enrollment visit."} // "stable dose of colchicine for four weeks prior to the enrollment visit"
(declare-const patient_is_exposed_to_disease_modifying_antirheumatic_drug_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a disease-modifying antirheumatic drug at any time during the four weeks prior to the enrollment visit.","when_to_set_to_false":"Set to false if the patient has not been exposed to a disease-modifying antirheumatic drug during the four weeks prior to the enrollment visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to a disease-modifying antirheumatic drug during the four weeks prior to the enrollment visit.","meaning":"Boolean indicating whether the patient has been exposed to a disease-modifying antirheumatic drug during the four weeks prior to the enrollment visit."} // "disease-modifying antirheumatic drug for four weeks prior to the enrollment visit"
(declare-const patient_is_exposed_to_disease_modifying_antirheumatic_drug_inthepast4weeks@@dose_is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a disease-modifying antirheumatic drug during the four weeks prior to the enrollment visit and the dose has been stable throughout that period.","when_to_set_to_false":"Set to false if the patient has been exposed to a disease-modifying antirheumatic drug during the four weeks prior to the enrollment visit but the dose has not been stable throughout that period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose of disease-modifying antirheumatic drug was stable during the four weeks prior to the enrollment visit.","meaning":"Boolean indicating whether the dose of disease-modifying antirheumatic drug was stable during the four weeks prior to the enrollment visit."} // "stable dose of disease-modifying antirheumatic drug for four weeks prior to the enrollment visit"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a nonsteroidal anti-inflammatory drug at any time during the four weeks prior to the enrollment visit.","when_to_set_to_false":"Set to false if the patient has not been exposed to a nonsteroidal anti-inflammatory drug during the four weeks prior to the enrollment visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to a nonsteroidal anti-inflammatory drug during the four weeks prior to the enrollment visit.","meaning":"Boolean indicating whether the patient has been exposed to a nonsteroidal anti-inflammatory drug during the four weeks prior to the enrollment visit."} // "nonsteroidal anti-inflammatory drug for four weeks prior to the enrollment visit"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@dose_is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a nonsteroidal anti-inflammatory drug during the four weeks prior to the enrollment visit and the dose has been stable throughout that period.","when_to_set_to_false":"Set to false if the patient has been exposed to a nonsteroidal anti-inflammatory drug during the four weeks prior to the enrollment visit but the dose has not been stable throughout that period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose of nonsteroidal anti-inflammatory drug was stable during the four weeks prior to the enrollment visit.","meaning":"Boolean indicating whether the dose of nonsteroidal anti-inflammatory drug was stable during the four weeks prior to the enrollment visit."} // "stable dose of nonsteroidal anti-inflammatory drug for four weeks prior to the enrollment visit"
(declare-const patient_is_exposed_to_steroid_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a steroid at any time during the four weeks prior to the enrollment visit.","when_to_set_to_false":"Set to false if the patient has not been exposed to a steroid during the four weeks prior to the enrollment visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to a steroid during the four weeks prior to the enrollment visit.","meaning":"Boolean indicating whether the patient has been exposed to a steroid during the four weeks prior to the enrollment visit."} // "steroid for four weeks prior to the enrollment visit"
(declare-const patient_is_exposed_to_steroid_inthepast4weeks@@dose_is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a steroid during the four weeks prior to the enrollment visit and the dose has been stable throughout that period.","when_to_set_to_false":"Set to false if the patient has been exposed to a steroid during the four weeks prior to the enrollment visit but the dose has not been stable throughout that period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose of steroid was stable during the four weeks prior to the enrollment visit.","meaning":"Boolean indicating whether the dose of steroid was stable during the four weeks prior to the enrollment visit."} // "stable dose of steroid for four weeks prior to the enrollment visit"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_exposed_to_colchicine_inthepast4weeks@@dose_is_stable
         patient_is_exposed_to_colchicine_inthepast4weeks)
     :named REQ7_AUXILIARY0)) ;; "stable dose of colchicine for four weeks prior to the enrollment visit"

(assert
  (! (=> patient_is_exposed_to_disease_modifying_antirheumatic_drug_inthepast4weeks@@dose_is_stable
         patient_is_exposed_to_disease_modifying_antirheumatic_drug_inthepast4weeks)
     :named REQ7_AUXILIARY1)) ;; "stable dose of disease-modifying antirheumatic drug for four weeks prior to the enrollment visit"

(assert
  (! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@dose_is_stable
         patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks)
     :named REQ7_AUXILIARY2)) ;; "stable dose of nonsteroidal anti-inflammatory drug for four weeks prior to the enrollment visit"

(assert
  (! (=> patient_is_exposed_to_steroid_inthepast4weeks@@dose_is_stable
         patient_is_exposed_to_steroid_inthepast4weeks)
     :named REQ7_AUXILIARY3)) ;; "stable dose of steroid for four weeks prior to the enrollment visit"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: Must be on a stable dose of (steroid OR nonsteroidal anti-inflammatory drug OR disease-modifying antirheumatic drug OR colchicine) for four weeks prior to the enrollment visit
(assert
  (! (or patient_is_exposed_to_steroid_inthepast4weeks@@dose_is_stable
         patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@dose_is_stable
         patient_is_exposed_to_disease_modifying_antirheumatic_drug_inthepast4weeks@@dose_is_stable
         patient_is_exposed_to_colchicine_inthepast4weeks@@dose_is_stable)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be on a stable dose of (steroid OR nonsteroidal anti-inflammatory drug OR disease-modifying antirheumatic drug OR colchicine) for four weeks prior to the enrollment visit."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently female and has had at least one menstrual period, indicating childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently female and has not had any menstrual periods, or if the patient is not currently female.","when_to_set_to_null":"Set to null if the patient's menstrual history or current sex is unknown or cannot be determined.","meaning":"Indicates whether the patient currently has childbearing potential, defined as a female who has had at least one menstrual period regardless of age."} // "female of childbearing potential (young women who have had at least one menstrual period regardless of age)"
(declare-const patient_has_undergone_urine_pregnancy_test_inthepast1days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine pregnancy test at the screening visit (within the past 1 day).","when_to_set_to_false":"Set to false if the patient has not undergone a urine pregnancy test at the screening visit (within the past 1 day).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a urine pregnancy test at the screening visit (within the past 1 day).","meaning":"Boolean indicating whether the patient has undergone a urine pregnancy test at the screening visit (within the past 1 day)."} // "urine pregnancy test"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the urine pregnancy test at screening is positive, indicating the patient is pregnant.","when_to_set_to_false":"Set to false if the urine pregnancy test at screening is negative, indicating the patient is not pregnant.","when_to_set_to_null":"Set to null if the urine pregnancy test result at screening is unknown, indeterminate, or not performed.","meaning":"Indicates whether the patient is currently pregnant, as determined by a urine pregnancy test at screening."} // "negative urine pregnancy test at screening"
(declare-const patient_has_undergone_serum_pregnancy_test_now_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a serum pregnancy test at baseline (now) and the result is negative.","when_to_set_to_false":"Set to false if the patient has undergone a serum pregnancy test at baseline (now) and the result is not negative, or if the test was not performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a serum pregnancy test at baseline (now) and the result is negative.","meaning":"Boolean indicating whether the patient has undergone a serum pregnancy test at baseline (now) and the result is negative."} // "serum pregnancy test"
(declare-const patient_has_undergone_serum_pregnancy_test_now_outcome_is_negative@@performed_prior_to_radiologic_procedure_or_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the serum pregnancy test at baseline (now) with a negative result was performed prior to any radiologic procedure or administration of study medication.","when_to_set_to_false":"Set to false if the serum pregnancy test at baseline (now) with a negative result was not performed prior to any radiologic procedure or administration of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serum pregnancy test at baseline (now) with a negative result was performed prior to any radiologic procedure or administration of study medication.","meaning":"Boolean indicating whether the serum pregnancy test at baseline (now) with a negative result was performed prior to any radiologic procedure or administration of study medication."} // "serum pregnancy test at baseline prior to performance of any radiologic procedure OR administration of study medication"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_serum_pregnancy_test_now_outcome_is_negative@@performed_prior_to_radiologic_procedure_or_study_medication
         patient_has_undergone_serum_pregnancy_test_now_outcome_is_negative)
     :named REQ8_AUXILIARY0)) ;; "serum pregnancy test at baseline prior to performance of any radiologic procedure OR administration of study medication"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: If the patient is a female of childbearing potential, she must have a negative urine pregnancy test at screening.
(assert
  (! (or (not patient_has_childbearing_potential_now)
         (and patient_has_undergone_urine_pregnancy_test_inthepast1days
              (not patient_is_pregnant_now)))
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a female of childbearing potential ... must have a negative urine pregnancy test at screening"

;; Component 1: If the patient is a female of childbearing potential, she must have a negative serum pregnancy test at baseline prior to radiologic procedure or study medication.
(assert
  (! (or (not patient_has_childbearing_potential_now)
         patient_has_undergone_serum_pregnancy_test_now_outcome_is_negative@@performed_prior_to_radiologic_procedure_or_study_medication)
     :named REQ8_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a female of childbearing potential ... must have a negative serum pregnancy test at baseline prior to performance of any radiologic procedure OR administration of study medication"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_agrees_to_use_effective_birth_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently agrees to use a form of effective birth control, including abstinence.","when_to_set_to_false":"Set to false if the patient currently does not agree to use a form of effective birth control, including abstinence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently agrees to use a form of effective birth control, including abstinence.","meaning":"Boolean indicating whether the patient currently agrees to use a form of effective birth control, including abstinence."} // "must agree to use a form of effective birth control, including abstinence"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a form of birth control.","when_to_set_to_false":"Set to false if the patient is currently not using any form of birth control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a form of birth control.","meaning":"Boolean indicating whether the patient is currently using a form of birth control."} // "birth control"
(declare-const patient_has_finding_of_contraception_now@@effective Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a form of birth control and the method is considered effective.","when_to_set_to_false":"Set to false if the patient is currently using a form of birth control but the method is not considered effective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the birth control method is effective.","meaning":"Boolean indicating whether the patient's current birth control method is effective."} // "effective birth control"
(declare-const patient_has_finding_of_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."} // "sexually active"
(declare-const patient_is_man_able_to_father_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a man able to father a child.","when_to_set_to_false":"Set to false if the patient is currently not a man able to father a child.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a man able to father a child.","meaning":"Boolean indicating whether the patient is currently a man able to father a child."} // "man able to father a child"
(declare-const patient_is_woman_of_childbearing_age_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a woman of childbearing age.","when_to_set_to_false":"Set to false if the patient is currently not a woman of childbearing age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a woman of childbearing age.","meaning":"Boolean indicating whether the patient is currently a woman of childbearing age."} // "woman of childbearing age"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; If the patient is using effective contraception, then they agree to use effective birth control (including abstinence)
(assert
  (! (=> patient_has_finding_of_contraception_now@@effective
         patient_agrees_to_use_effective_birth_control_now)
     :named REQ9_AUXILIARY0)) ;; "must agree to use a form of effective birth control, including abstinence"

;; ===================== Constraint Assertions (REQ 9) =====================
;; If the patient is (a woman of childbearing age OR a man able to father a child) AND is sexually active, then the patient must agree to use a form of effective birth control, including abstinence.
(assert
  (! (=> (and (or patient_is_woman_of_childbearing_age_now
                  patient_is_man_able_to_father_child_now)
              patient_has_finding_of_sexually_active_now)
         patient_agrees_to_use_effective_birth_control_now)
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is (a woman of childbearing age OR a man able to father a child) AND is sexually active, the patient must agree to use a form of effective birth control, including abstinence."

;; ===================== Declarations for the inclusion criterion (REQ 10) =====================
(declare-const patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a purified protein derivative (PPD) skin test now.","when_to_set_to_false":"Set to false if the patient has not undergone a purified protein derivative (PPD) skin test now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a purified protein derivative (PPD) skin test now.","meaning":"Boolean indicating whether the patient has undergone a purified protein derivative (PPD) skin test now."} // "purified protein derivative test"
(declare-const patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_now@@outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a PPD skin test now and the result is negative.","when_to_set_to_false":"Set to false if the patient has undergone a PPD skin test now and the result is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result of the PPD skin test is negative.","meaning":"Boolean indicating whether the patient has undergone a PPD skin test now and the result is negative."} // "negative purified protein derivative test"
(declare-const patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_now@@performed_using_five_tuberculin_units_intradermal_testing_per_cdc_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a PPD skin test now and the test was performed using five tuberculin units intradermal testing per CDC guidelines.","when_to_set_to_false":"Set to false if the patient has undergone a PPD skin test now and the test was not performed using five tuberculin units intradermal testing per CDC guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the test was performed using five tuberculin units intradermal testing per CDC guidelines.","meaning":"Boolean indicating whether the patient has undergone a PPD skin test now and the test was performed using five tuberculin units intradermal testing per CDC guidelines."} // "using five tuberculin units intradermal testing per CDC guidelines"
(declare-const patient_has_diagnosis_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of active tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of active tuberculosis."} // "active tuberculosis"
(declare-const patient_has_diagnosis_of_active_tuberculosis_now@@evidenced_on_chest_x_ray Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of active tuberculosis and this is evidenced on chest X-ray.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of active tuberculosis and this is not evidenced on chest X-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of active tuberculosis is evidenced on chest X-ray.","meaning":"Boolean indicating whether the patient currently has a diagnosis of active tuberculosis and this is evidenced on chest X-ray."} // "evidence of active tuberculosis on chest X-ray"
(declare-const patient_has_diagnosis_of_inactive_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of latent (inactive) tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of latent (inactive) tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of latent (inactive) tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of latent (inactive) tuberculosis."} // "latent tuberculosis"
(declare-const patient_is_currently_receiving_adequate_therapy_for_latent_tuberculosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving adequate therapy for latent tuberculosis.","when_to_set_to_false":"Set to false if the patient is not currently receiving adequate therapy for latent tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving adequate therapy for latent tuberculosis.","meaning":"Boolean indicating whether the patient is currently receiving adequate therapy for latent tuberculosis."} // "currently treated with adequate therapy for latent tuberculosis"
(declare-const patient_is_currently_receiving_adequate_therapy_for_latent_tuberculosis@@initiated_for_at_least_1_month_prior_to_first_dose_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving adequate therapy for latent tuberculosis and this therapy was initiated for at least one month prior to the first dose of study medication.","when_to_set_to_false":"Set to false if the patient is currently receiving adequate therapy for latent tuberculosis and this therapy was not initiated for at least one month prior to the first dose of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy was initiated for at least one month prior to the first dose of study medication.","meaning":"Boolean indicating whether the patient is currently receiving adequate therapy for latent tuberculosis, and this therapy was initiated for at least one month prior to the first dose of study medication."} // "initiated for ≥ one month prior to first dose of study medication"
(declare-const patient_has_completed_full_prophylaxis_regimens_for_latent_tuberculosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed full prophylaxis regimens for latent tuberculosis.","when_to_set_to_false":"Set to false if the patient has not completed full prophylaxis regimens for latent tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed full prophylaxis regimens for latent tuberculosis.","meaning":"Boolean indicating whether the patient has completed full prophylaxis regimens for latent tuberculosis."} // "completed full prophylaxis regimens"
(declare-const patient_has_undergone_bcg_vaccination_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone BCG vaccination at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone BCG vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone BCG vaccination.","meaning":"Boolean indicating whether the patient has undergone BCG vaccination at any time in the past."} // "Bacillus Calmette-Guérin-vaccinated"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_now@@outcome_is_negative
         patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_now)
     :named REQ10_AUXILIARY0)) ;; "negative purified protein derivative test"

(assert
  (! (=> patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_now@@performed_using_five_tuberculin_units_intradermal_testing_per_cdc_guidelines
         patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_now)
     :named REQ10_AUXILIARY1)) ;; "using five tuberculin units intradermal testing per CDC guidelines"

(assert
  (! (=> patient_has_diagnosis_of_active_tuberculosis_now@@evidenced_on_chest_x_ray
         patient_has_diagnosis_of_active_tuberculosis_now)
     :named REQ10_AUXILIARY2)) ;; "evidence of active tuberculosis on chest X-ray"

(assert
  (! (=> patient_is_currently_receiving_adequate_therapy_for_latent_tuberculosis@@initiated_for_at_least_1_month_prior_to_first_dose_of_study_medication
         patient_is_currently_receiving_adequate_therapy_for_latent_tuberculosis)
     :named REQ10_AUXILIARY3)) ;; "initiated for ≥ one month prior to first dose of study medication"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: ((negative PPD test (using 5 TU per CDC) AND NOT evidence of active TB on chest X-ray) OR (latent TB (positive PPD) AND currently treated with adequate therapy (initiated ≥1 month prior) AND completed full prophylaxis regimens))
(assert
  (! (or
        (and patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_now@@outcome_is_negative
             patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_now@@performed_using_five_tuberculin_units_intradermal_testing_per_cdc_guidelines
             (not patient_has_diagnosis_of_active_tuberculosis_now@@evidenced_on_chest_x_ray))
        (and patient_has_diagnosis_of_inactive_tuberculosis_now
             patient_is_currently_receiving_adequate_therapy_for_latent_tuberculosis@@initiated_for_at_least_1_month_prior_to_first_dose_of_study_medication
             patient_has_completed_full_prophylaxis_regimens_for_latent_tuberculosis))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((negative PPD test (using 5 TU per CDC) AND NOT evidence of active TB on chest X-ray) OR (latent TB (positive PPD) AND currently treated with adequate therapy (initiated ≥1 month prior) AND completed full prophylaxis regimens))"

;; Component 1: If the patient has been Bacillus Calmette-Guérin-vaccinated, the patient must also be skin-tested.
(assert
  (! (or (not patient_has_undergone_bcg_vaccination_inthehistory)
         patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_now)
     :named REQ10_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient has been Bacillus Calmette-Guérin-vaccinated, the patient must also be skin-tested"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_is_able_to_complete_study_related_questionnaires Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to complete study-related questionnaires.","when_to_set_to_false":"Set to false if the patient is not able to complete study-related questionnaires.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to complete study-related questionnaires.","meaning":"Boolean indicating whether the patient is able to complete study-related questionnaires."} // "complete study-related questionnaires"
(declare-const patient_is_able_to_understand_study_related_questionnaires Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to understand study-related questionnaires.","when_to_set_to_false":"Set to false if the patient is not able to understand study-related questionnaires.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to understand study-related questionnaires.","meaning":"Boolean indicating whether the patient is able to understand study-related questionnaires."} // "understand study-related questionnaires"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (and patient_is_able_to_understand_study_related_questionnaires
          patient_is_able_to_complete_study_related_questionnaires)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to understand AND complete study-related questionnaires."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."} // "must be able ... to give informed consent"
(declare-const patient_is_willing_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently unwilling to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to give informed consent.","meaning":"Boolean indicating whether the patient is currently willing to give informed consent."} // "must be ... willing to give informed consent"
(declare-const patient_is_willing_to_abide_with_study_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to abide with the study procedures.","when_to_set_to_false":"Set to false if the patient is currently unwilling to abide with the study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to abide with the study procedures.","meaning":"Boolean indicating whether the patient is currently willing to abide with the study procedures."} // "must ... abide with the study procedures"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (and patient_is_able_to_give_informed_consent_now
          patient_is_willing_to_give_informed_consent_now
          patient_is_willing_to_abide_with_study_procedures_now)
     :named REQ12_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be able AND willing to give informed consent AND abide with the study procedures"
