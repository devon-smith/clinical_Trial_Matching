;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_surgical_procedure_inthepast8weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within the past eight weeks.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure within the past eight weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within the past eight weeks.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within the past eight weeks."} ;; "major surgery within eight weeks prior to screening"
(declare-const patient_has_undergone_operation_on_joint_inthepast8weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an operation on a joint within the past eight weeks.","when_to_set_to_false":"Set to false if the patient has not undergone an operation on a joint within the past eight weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an operation on a joint within the past eight weeks.","meaning":"Boolean indicating whether the patient has undergone an operation on a joint within the past eight weeks."} ;; "joint surgery within eight weeks prior to screening"
(declare-const patient_will_undergo_surgical_procedure_inthefuture6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled or planned to undergo a surgical procedure within the next six months.","when_to_set_to_false":"Set to false if the patient is not scheduled or planned to undergo a surgical procedure within the next six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo a surgical procedure within the next six months.","meaning":"Boolean indicating whether the patient will undergo a surgical procedure within the next six months."} ;; "planned major surgery within six months following randomization"
(declare-const patient_will_undergo_operation_on_joint_inthefuture6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled or planned to undergo an operation on a joint within the next six months.","when_to_set_to_false":"Set to false if the patient is not scheduled or planned to undergo an operation on a joint within the next six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo an operation on a joint within the next six months.","meaning":"Boolean indicating whether the patient will undergo an operation on a joint within the next six months."} ;; "planned joint surgery within six months following randomization"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthepast8weeks)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had major surgery within eight weeks prior to screening."

(assert
(! (not patient_has_undergone_operation_on_joint_inthepast8weeks)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had joint surgery within eight weeks prior to screening."

(assert
(! (not patient_will_undergo_surgical_procedure_inthefuture6months)
:named REQ0_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has planned major surgery within six months following randomization."

(assert
(! (not patient_will_undergo_operation_on_joint_inthefuture6months)
:named REQ0_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has planned joint surgery within six months following randomization."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_rheumatic_autoimmune_disease_now@@other_than_rheumatoid_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a rheumatic autoimmune disease and it is not rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a rheumatic autoimmune disease, or only has rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a rheumatic autoimmune disease other than rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has a rheumatic autoimmune disease other than rheumatoid arthritis."} ;; "rheumatic autoimmune disease other than rheumatoid arthritis"
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of systemic lupus erythematosus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of systemic lupus erythematosus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of systemic lupus erythematosus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of systemic lupus erythematosus."} ;; "systemic lupus erythematosus"
(declare-const patient_has_diagnosis_of_mixed_connective_tissue_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mixed connective tissue disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mixed connective tissue disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mixed connective tissue disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mixed connective tissue disease."} ;; "mixed connective tissue disease"
(declare-const patient_has_diagnosis_of_systemic_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of systemic sclerosis (scleroderma).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of systemic sclerosis (scleroderma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of systemic sclerosis (scleroderma).","meaning":"Boolean indicating whether the patient currently has a diagnosis of systemic sclerosis (scleroderma)."} ;; "scleroderma"
(declare-const patient_has_diagnosis_of_polymyositis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of polymyositis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of polymyositis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of polymyositis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of polymyositis."} ;; "polymyositis"
(declare-const patient_has_diagnosis_of_rheumatoid_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of rheumatoid arthritis."} ;; "rheumatoid arthritis"
(declare-const patient_has_significant_systemic_involvement_now@@secondary_to_rheumatoid_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has significant systemic involvement and it is secondary to rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have significant systemic involvement, or if it is not secondary to rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant systemic involvement secondary to rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has significant systemic involvement that is secondary to rheumatoid arthritis."} ;; "significant systemic involvement secondary to rheumatoid arthritis"
(declare-const patient_has_finding_of_vasculitis_now@@secondary_to_rheumatoid_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's vasculitis is secondary to rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient's vasculitis is not secondary to rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's vasculitis is secondary to rheumatoid arthritis.","meaning":"Boolean indicating whether the patient's vasculitis is secondary to rheumatoid arthritis."} ;; "vasculitis secondary to rheumatoid arthritis"
(declare-const patient_has_finding_of_fibrosis_of_lung_now@@secondary_to_rheumatoid_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary fibrosis is secondary to rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient's pulmonary fibrosis is not secondary to rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary fibrosis is secondary to rheumatoid arthritis.","meaning":"Boolean indicating whether the patient's pulmonary fibrosis is secondary to rheumatoid arthritis."} ;; "pulmonary fibrosis secondary to rheumatoid arthritis"
(declare-const patient_has_finding_of_felty_s_syndrome_now@@secondary_to_rheumatoid_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Felty syndrome is secondary to rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient's Felty syndrome is not secondary to rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Felty syndrome is secondary to rheumatoid arthritis.","meaning":"Boolean indicating whether the patient's Felty syndrome is secondary to rheumatoid arthritis."} ;; "Felty syndrome secondary to rheumatoid arthritis"
(declare-const patient_has_finding_of_sj_gren_s_syndrome_now@@secondary_to_rheumatoid_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Sjögren syndrome is secondary to rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient's Sjögren syndrome is not secondary to rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Sjögren syndrome is secondary to rheumatoid arthritis.","meaning":"Boolean indicating whether the patient's Sjögren syndrome is secondary to rheumatoid arthritis."} ;; "Sjögren syndrome secondary to rheumatoid arthritis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term for rheumatic autoimmune disease other than rheumatoid arthritis
(assert
(! (=> (or patient_has_diagnosis_of_systemic_lupus_erythematosus_now
          patient_has_diagnosis_of_mixed_connective_tissue_disease_now
          patient_has_diagnosis_of_systemic_sclerosis_now
          patient_has_diagnosis_of_polymyositis_now)
    patient_has_rheumatic_autoimmune_disease_now@@other_than_rheumatoid_arthritis)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (systemic lupus erythematosus, mixed connective tissue disease, scleroderma, polymyositis)"

;; Non-exhaustive examples imply umbrella term for significant systemic involvement secondary to rheumatoid arthritis
(assert
(! (=> (or patient_has_finding_of_vasculitis_now@@secondary_to_rheumatoid_arthritis
          patient_has_finding_of_fibrosis_of_lung_now@@secondary_to_rheumatoid_arthritis
          patient_has_finding_of_felty_s_syndrome_now@@secondary_to_rheumatoid_arthritis)
    patient_has_significant_systemic_involvement_now@@secondary_to_rheumatoid_arthritis)
:named REQ1_AUXILIARY1)) ;; "with non-exhaustive examples (vasculitis, pulmonary fibrosis, Felty syndrome)"

;; Sjögren syndrome secondary to rheumatoid arthritis is allowable (does NOT count as exclusion)
(assert
(! (=> patient_has_finding_of_sj_gren_s_syndrome_now@@secondary_to_rheumatoid_arthritis
     (not patient_has_significant_systemic_involvement_now@@secondary_to_rheumatoid_arthritis))
:named REQ1_AUXILIARY2)) ;; "The patient is NOT excluded if the patient has Sjögren syndrome secondary to rheumatoid arthritis."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have a rheumatic autoimmune disease other than rheumatoid arthritis
(assert
(! (not patient_has_rheumatic_autoimmune_disease_now@@other_than_rheumatoid_arthritis)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a rheumatic autoimmune disease other than rheumatoid arthritis..."

;; Exclusion: patient must NOT have significant systemic involvement secondary to rheumatoid arthritis
(assert
(! (not patient_has_significant_systemic_involvement_now@@secondary_to_rheumatoid_arthritis)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant systemic involvement secondary to rheumatoid arthritis..."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_classified_as_functional_class_iv_by_acr_rheumatoid_arthritis_functional_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as functional class IV according to the American College of Rheumatology classification of functional status in rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient is currently not classified as functional class IV according to the American College of Rheumatology classification of functional status in rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as functional class IV according to the American College of Rheumatology classification of functional status in rheumatoid arthritis.","meaning":"Boolean indicating whether the patient is currently classified as functional class IV according to the American College of Rheumatology classification of functional status in rheumatoid arthritis."} ;; "classified as functional class IV according to the American College of Rheumatology classification of functional status in rheumatoid arthritis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_is_classified_as_functional_class_iv_by_acr_rheumatoid_arthritis_functional_status_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is classified as functional class IV according to the American College of Rheumatology classification of functional status in rheumatoid arthritis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_prior_history_of_inflammatory_joint_disease@@other_than_rheumatoid_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a prior history of inflammatory joint disease other than rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient does not have a prior history of inflammatory joint disease other than rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a prior history of inflammatory joint disease other than rheumatoid arthritis.","meaning":"Boolean indicating whether the patient has a prior history of inflammatory joint disease, excluding rheumatoid arthritis."} ;; "prior history of inflammatory joint disease other than rheumatoid arthritis"

(declare-const patient_has_current_inflammatory_joint_disease@@other_than_rheumatoid_arthritis Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inflammatory joint disease other than rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have inflammatory joint disease other than rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inflammatory joint disease other than rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has inflammatory joint disease, excluding rheumatoid arthritis."} ;; "current inflammatory joint disease other than rheumatoid arthritis"

(declare-const patient_has_diagnosis_of_gout_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gout.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gout.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gout.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gout."} ;; "gout"

(declare-const patient_has_diagnosis_of_reactive_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of reactive arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of reactive arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of reactive arthritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of reactive arthritis."} ;; "reactive arthritis"

(declare-const patient_has_diagnosis_of_psoriatic_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of psoriatic arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of psoriatic arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of psoriatic arthritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of psoriatic arthritis."} ;; "psoriatic arthritis"

(declare-const patient_has_diagnosis_of_ankylosing_spondylitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ankylosing spondylitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ankylosing spondylitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ankylosing spondylitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ankylosing spondylitis."} ;; "ankylosing spondylitis"

(declare-const patient_has_diagnosis_of_lyme_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Lyme disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Lyme disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Lyme disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Lyme disease."} ;; "Lyme disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_gout_now
           patient_has_diagnosis_of_reactive_arthritis_now
           patient_has_diagnosis_of_psoriatic_arthritis_now
           patient_has_diagnosis_of_ankylosing_spondylitis_now
           patient_has_diagnosis_of_lyme_disease_now)
       patient_has_current_inflammatory_joint_disease@@other_than_rheumatoid_arthritis)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (gout, reactive arthritis, psoriatic arthritis, ankylosing spondylitis, Lyme disease)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_prior_history_of_inflammatory_joint_disease@@other_than_rheumatoid_arthritis
            patient_has_current_inflammatory_joint_disease@@other_than_rheumatoid_arthritis))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a prior history of inflammatory joint disease other than rheumatoid arthritis) OR (the patient has current inflammatory joint disease other than rheumatoid arthritis with non-exhaustive examples (gout, reactive arthritis, psoriatic arthritis, ankylosing spondylitis, Lyme disease)))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const adequate_washout_occurred_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if adequate washout has occurred prior to randomization.","when_to_set_to_false":"Set to false if adequate washout has not occurred prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether adequate washout has occurred prior to randomization.","meaning":"Boolean indicating whether adequate washout has occurred prior to randomization."} ;; "adequate washout prior to randomization"

(declare-const patient_has_received_disease_modifying_antirheumatic_drug_other_than_methotrexate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with any disease-modifying antirheumatic drug other than methotrexate.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment with any disease-modifying antirheumatic drug other than methotrexate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with any disease-modifying antirheumatic drug other than methotrexate.","meaning":"Boolean indicating whether the patient is currently receiving treatment with disease-modifying antirheumatic drugs other than methotrexate."} ;; "receiving treatment with disease-modifying antirheumatic drugs other than methotrexate"

(declare-const patient_has_taken_biologic_disease_modifying_antirheumatic_drug_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously used any biologic disease-modifying antirheumatic drug.","when_to_set_to_false":"Set to false if the patient has not previously used any biologic disease-modifying antirheumatic drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously used any biologic disease-modifying antirheumatic drug.","meaning":"Boolean indicating whether the patient has previously used any biologic disease-modifying antirheumatic drug."} ;; "previous use of biologic disease-modifying antirheumatic drugs"

(declare-const patient_has_taken_disease_modifying_antirheumatic_drug_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously used any disease-modifying antirheumatic drug.","when_to_set_to_false":"Set to false if the patient has not previously used any disease-modifying antirheumatic drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously used any disease-modifying antirheumatic drug.","meaning":"Boolean indicating whether the patient has previously used any disease-modifying antirheumatic drug."} ;; "previous use of disease-modifying antirheumatic drugs"

(declare-const patient_has_taken_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken any drug or medicament in the past.","when_to_set_to_false":"Set to false if the patient has never taken any drug or medicament in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken any drug or medicament in the past.","meaning":"Boolean indicating whether the patient has ever taken any drug or medicament in the past."} ;; "drug"

(declare-const patient_has_taken_pharmaceutical_biologic_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken any pharmaceutical biologic product in the past.","when_to_set_to_false":"Set to false if the patient has never taken any pharmaceutical biologic product in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken any pharmaceutical biologic product in the past.","meaning":"Boolean indicating whether the patient has ever taken any pharmaceutical biologic product in the past."} ;; "biologic"

(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "drug"

(declare-const patient_is_taking_pharmaceutical_biologic_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any pharmaceutical biologic product.","when_to_set_to_false":"Set to false if the patient is currently not taking any pharmaceutical biologic product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any pharmaceutical biologic product.","meaning":"Boolean indicating whether the patient is currently taking any pharmaceutical biologic product."} ;; "biologic"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example: biologic DMARDs are examples of DMARDs other than methotrexate
(assert
(! (=> patient_is_taking_pharmaceutical_biologic_product_now
       patient_has_received_disease_modifying_antirheumatic_drug_other_than_methotrexate_now)
    :named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (biologic disease-modifying antirheumatic drugs)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion if currently receiving DMARDs other than methotrexate (including biologics)
(assert
(! (not patient_has_received_disease_modifying_antirheumatic_drug_other_than_methotrexate_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving treatment with disease-modifying antirheumatic drugs other than methotrexate with non-exhaustive examples (biologic disease-modifying antirheumatic drugs)."

;; Exclusion if previous use of DMARDs or biologic DMARDs AND no adequate washout prior to randomization
(assert
(! (not (and (or patient_has_taken_disease_modifying_antirheumatic_drug_in_the_history
                 patient_has_taken_biologic_disease_modifying_antirheumatic_drug_in_the_history)
             (not adequate_washout_occurred_prior_to_randomization)))
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has previous use of disease-modifying antirheumatic drugs OR biologic disease-modifying antirheumatic drugs) AND (the patient has NOT had adequate washout prior to randomization))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_decreased_therapeutic_response_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an inadequate response to treatment at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an inadequate response to treatment at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an inadequate response to treatment.","meaning":"Boolean indicating whether the patient has ever had an inadequate response to treatment in the past."} ;; "inadequate response to treatment"
(declare-const patient_has_finding_of_decreased_therapeutic_response_inthehistory@@occurred_with_anti_tumor_necrosis_factor_agent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inadequate response to treatment in the past occurred with an anti-tumor necrosis factor agent.","when_to_set_to_false":"Set to false if the patient's inadequate response to treatment in the past did not occur with an anti-tumor necrosis factor agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inadequate response occurred with an anti-tumor necrosis factor agent.","meaning":"Boolean indicating whether the patient's inadequate response to treatment in the past occurred with an anti-tumor necrosis factor agent."} ;; "inadequate response to treatment with an anti-tumor necrosis factor agent"
(declare-const patient_terminated_anti_tumor_necrosis_factor_treatment_due_to_cost_or_safety_reasons_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever terminated previous anti-tumor necrosis factor treatment due to cost or safety reasons at any time in the past.","when_to_set_to_false":"Set to false if the patient has never terminated previous anti-tumor necrosis factor treatment due to cost or safety reasons at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever terminated previous anti-tumor necrosis factor treatment due to cost or safety reasons at any time in the past.","meaning":"Boolean indicating whether the patient has ever terminated previous anti-tumor necrosis factor treatment due to cost or safety reasons at any time in the past."} ;; "terminated previous anti-tumor necrosis factor treatment due to cost or safety reasons"
(declare-const patient_terminated_anti_tumor_necrosis_factor_treatment_due_to_cost_or_safety_reasons_inthehistory@@example_discomfort_with_subcutaneous_injections Bool) ;; {"when_to_set_to_true":"Set to true if discomfort with subcutaneous injections is an example of a safety reason for the patient's termination of previous anti-tumor necrosis factor treatment.","when_to_set_to_false":"Set to false if discomfort with subcutaneous injections is not an example of a safety reason for the patient's termination of previous anti-tumor necrosis factor treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether discomfort with subcutaneous injections is an example of a safety reason for the patient's termination of previous anti-tumor necrosis factor treatment.","meaning":"Boolean indicating that discomfort with subcutaneous injections is an example of a safety reason for termination of previous anti-tumor necrosis factor treatment."} ;; "discomfort with subcutaneous injections (example of safety reason for termination)"
(assert
(! (=> patient_has_finding_of_decreased_therapeutic_response_inthehistory@@occurred_with_anti_tumor_necrosis_factor_agent
      patient_has_finding_of_decreased_therapeutic_response_inthehistory)
:named REQ5_AUXILIARY0)) ;; "inadequate response to treatment with an anti-tumor necrosis factor agent"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_terminated_anti_tumor_necrosis_factor_treatment_due_to_cost_or_safety_reasons_inthehistory@@example_discomfort_with_subcutaneous_injections
      patient_terminated_anti_tumor_necrosis_factor_treatment_due_to_cost_or_safety_reasons_inthehistory)
:named REQ5_AUXILIARY1)) ;; "discomfort with subcutaneous injections (example of safety reason for termination)"

;; Non-exhaustive example: discomfort with subcutaneous injections is an example of safety reason for termination
(assert
(! (=> patient_terminated_anti_tumor_necrosis_factor_treatment_due_to_cost_or_safety_reasons_inthehistory@@example_discomfort_with_subcutaneous_injections
      patient_terminated_anti_tumor_necrosis_factor_treatment_due_to_cost_or_safety_reasons_inthehistory)
:named REQ5_AUXILIARY2)) ;; "with non-exhaustive examples (discomfort with subcutaneous injections)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient has had an inadequate response to anti-TNF agent AND NOT (terminated previous anti-TNF due to cost/safety AND had adequate washout)
(assert
(! (not (and
          patient_has_finding_of_decreased_therapeutic_response_inthehistory@@occurred_with_anti_tumor_necrosis_factor_agent
          (not (and patient_terminated_anti_tumor_necrosis_factor_treatment_due_to_cost_or_safety_reasons_inthehistory
                    adequate_washout_occurred_prior_to_randomization))))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has had an inadequate response to treatment with an anti-tumor necrosis factor agent) AND NOT ((the patient terminated previous anti-tumor necrosis factor treatment due to cost or safety reasons with non-exhaustive examples (discomfort with subcutaneous injections)) AND (the patient has had adequate washout)))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const investigational_drug_half_life_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the value of the investigational drug's half-life in days if known.","when_to_set_to_null":"Set to null if the half-life of the investigational drug is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the half-life of the investigational drug in days."} ;; "five half-lives of the investigational drug"

(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any drug or medicament at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any drug or medicament at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient has ever been exposed to any drug or medicament in the past."} ;; "has received treatment with any investigational agent"

(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@is_investigational_agent Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed is an investigational agent.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed is not an investigational agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is an investigational agent.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed is an investigational agent."} ;; "investigational agent"

(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@within_exclusionary_window_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any drug or medicament occurred within the exclusionary window prior to screening (the longer of four weeks or five half-lives of the investigational drug).","when_to_set_to_false":"Set to false if the patient's exposure to any drug or medicament did not occur within the exclusionary window prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within the exclusionary window prior to screening.","meaning":"Boolean indicating whether the patient's exposure to any drug or medicament occurred within the exclusionary window prior to screening (the longer of four weeks or five half-lives of the investigational drug)."} ;; "within ((four weeks of screening) OR (five half-lives of the investigational drug, whichever is longer, prior to screening))"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthehistory@@is_investigational_agent
      patient_is_exposed_to_drug_or_medicament_inthehistory)
:named REQ6_AUXILIARY0)) ;; "investigational agent"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthehistory@@within_exclusionary_window_prior_to_screening
      patient_is_exposed_to_drug_or_medicament_inthehistory)
:named REQ6_AUXILIARY1)) ;; "within ((four weeks of screening) OR (five half-lives of the investigational drug, whichever is longer, prior to screening))"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have received treatment with any investigational agent within the exclusionary window prior to screening
(assert
(! (not (and patient_is_exposed_to_drug_or_medicament_inthehistory@@is_investigational_agent
             patient_is_exposed_to_drug_or_medicament_inthehistory@@within_exclusionary_window_prior_to_screening))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with any investigational agent within ((four weeks of screening) OR (five half-lives of the investigational drug, whichever is longer, prior to screening))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_received_cell_depleting_therapy_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received any cell depleting therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received any cell depleting therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received any cell depleting therapy in the past.","meaning":"Boolean indicating whether the patient has ever received any cell depleting therapy at any time in the past."} ;; "has received previous treatment with any cell depleting therapy"
(declare-const patient_has_received_cell_depleting_therapy_in_the_history@@is_investigational_agent Bool) ;; {"when_to_set_to_true":"Set to true if the cell depleting therapy received by the patient is an investigational agent.","when_to_set_to_false":"Set to false if the cell depleting therapy received by the patient is not an investigational agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cell depleting therapy received by the patient is an investigational agent.","meaning":"Boolean indicating whether the cell depleting therapy received by the patient is an investigational agent."} ;; "investigational agents (non-exhaustive example of cell depleting therapy)"
(declare-const patient_has_undergone_therapeutic_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any therapeutic procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone any therapeutic procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone any therapeutic procedure in the past.","meaning":"Boolean indicating whether the patient has ever undergone any therapeutic procedure at any time in the past."} ;; "therapy"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive example: investigational agents are a type of cell depleting therapy
(assert
(! (=> patient_has_received_cell_depleting_therapy_in_the_history@@is_investigational_agent
      patient_has_received_cell_depleting_therapy_in_the_history)
    :named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (investigational agents)."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_received_cell_depleting_therapy_in_the_history
      patient_has_undergone_therapeutic_procedure_inthehistory)
    :named REQ7_AUXILIARY1)) ;; "cell depleting therapy" is a type of therapeutic procedure

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_received_cell_depleting_therapy_in_the_history)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received previous treatment with any cell depleting therapy with non-exhaustive examples (investigational agents)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_gamma_globulin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to gamma globulin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to gamma globulin at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to gamma globulin.","meaning":"Boolean indicating whether the patient has ever been exposed to gamma globulin."} ;; "the patient has received treatment with intravenous gamma globulin"
(declare-const patient_is_exposed_to_gamma_globulin_inthehistory@@temporalcontext_within6months_of_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to gamma globulin occurred within six months of baseline.","when_to_set_to_false":"Set to false if the patient's exposure to gamma globulin did not occur within six months of baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to gamma globulin occurred within six months of baseline.","meaning":"Boolean indicating whether the patient's exposure to gamma globulin occurred within six months of baseline."} ;; "the patient has received treatment with intravenous gamma globulin within six months of baseline"
(declare-const patient_has_undergone_plasmapheresis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone plasmapheresis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone plasmapheresis at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone plasmapheresis.","meaning":"Boolean indicating whether the patient has ever undergone plasmapheresis."} ;; "the patient has received treatment with plasmapheresis"
(declare-const patient_has_undergone_plasmapheresis_inthehistory@@temporalcontext_within6months_of_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's plasmapheresis occurred within six months of baseline.","when_to_set_to_false":"Set to false if the patient's plasmapheresis did not occur within six months of baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's plasmapheresis occurred within six months of baseline.","meaning":"Boolean indicating whether the patient's plasmapheresis occurred within six months of baseline."} ;; "the patient has received treatment with plasmapheresis within six months of baseline"
(declare-const patient_has_received_prosorba_column_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received treatment with Prosorba column at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received treatment with Prosorba column at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received treatment with Prosorba column.","meaning":"Boolean indicating whether the patient has ever received treatment with Prosorba column."} ;; "the patient has received treatment with Prosorba column"
(declare-const patient_has_received_prosorba_column_inthehistory@@temporalcontext_within6months_of_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's treatment with Prosorba column occurred within six months of baseline.","when_to_set_to_false":"Set to false if the patient's treatment with Prosorba column did not occur within six months of baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's treatment with Prosorba column occurred within six months of baseline.","meaning":"Boolean indicating whether the patient's treatment with Prosorba column occurred within six months of baseline."} ;; "the patient has received treatment with Prosorba column within six months of baseline"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_gamma_globulin_inthehistory@@temporalcontext_within6months_of_baseline
      patient_is_exposed_to_gamma_globulin_inthehistory)
    :named REQ8_AUXILIARY0)) ;; "the patient has received treatment with intravenous gamma globulin within six months of baseline"

(assert
(! (=> patient_has_undergone_plasmapheresis_inthehistory@@temporalcontext_within6months_of_baseline
      patient_has_undergone_plasmapheresis_inthehistory)
    :named REQ8_AUXILIARY1)) ;; "the patient has received treatment with plasmapheresis within six months of baseline"

(assert
(! (=> patient_has_received_prosorba_column_inthehistory@@temporalcontext_within6months_of_baseline
      patient_has_received_prosorba_column_inthehistory)
    :named REQ8_AUXILIARY2)) ;; "the patient has received treatment with Prosorba column within six months of baseline"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_exposed_to_gamma_globulin_inthehistory@@temporalcontext_within6months_of_baseline)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has received treatment with intravenous gamma globulin within six months of baseline"

(assert
(! (not patient_has_undergone_plasmapheresis_inthehistory@@temporalcontext_within6months_of_baseline)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has received treatment with plasmapheresis within six months of baseline"

(assert
(! (not patient_has_received_prosorba_column_inthehistory@@temporalcontext_within6months_of_baseline)
    :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has received treatment with Prosorba column within six months of baseline"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any corticosteroid or corticosteroid derivative-containing product within the past 6 weeks.","when_to_set_to_false":"Set to false if the patient has not taken any corticosteroid or corticosteroid derivative-containing product within the past 6 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any corticosteroid or corticosteroid derivative-containing product within the past 6 weeks.","meaning":"Boolean indicating whether the patient has taken any corticosteroid or corticosteroid derivative-containing product within the past 6 weeks."} ;; "corticosteroids"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6weeks@@administered_intra_articularly Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid or corticosteroid derivative-containing product taken within the past 6 weeks was administered intra-articularly.","when_to_set_to_false":"Set to false if the corticosteroid or corticosteroid derivative-containing product taken within the past 6 weeks was not administered intra-articularly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product was administered intra-articularly.","meaning":"Boolean indicating whether the corticosteroid or corticosteroid derivative-containing product taken within the past 6 weeks was administered intra-articularly."} ;; "the patient has received intra-articular corticosteroids within six weeks prior to randomization"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6weeks@@administered_parenterally Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid or corticosteroid derivative-containing product taken within the past 6 weeks was administered parenterally.","when_to_set_to_false":"Set to false if the corticosteroid or corticosteroid derivative-containing product taken within the past 6 weeks was not administered parenterally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product was administered parenterally.","meaning":"Boolean indicating whether the corticosteroid or corticosteroid derivative-containing product taken within the past 6 weeks was administered parenterally."} ;; "the patient has received parenteral corticosteroids within six weeks prior to randomization"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply the stem variable
(assert
(! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6weeks@@administered_intra_articularly
      patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6weeks)
   :named REQ9_AUXILIARY0)) ;; "the patient has received intra-articular corticosteroids within six weeks prior to randomization"

(assert
(! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6weeks@@administered_parenterally
      patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6weeks)
   :named REQ9_AUXILIARY1)) ;; "the patient has received parenteral corticosteroids within six weeks prior to randomization"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6weeks@@administered_intra_articularly)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received intra-articular corticosteroids within six weeks prior to randomization."

(assert
(! (not patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6weeks@@administered_parenterally)
   :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received parenteral corticosteroids within six weeks prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_exposed_to_alkylating_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any alkylating agent at any time in the past, including as part of previous treatment.","when_to_set_to_false":"Set to false if the patient has never been exposed to any alkylating agent at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any alkylating agent.","meaning":"Boolean indicating whether the patient has ever been exposed to any alkylating agent at any time in the past."} ;; "the patient has received any previous treatment with alkylating agents (with non-exhaustive examples: cyclophosphamide, chlorambucil)"

(declare-const patient_has_received_total_lymphoid_irradiation_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received total lymphoid irradiation at any time in the past, including as part of previous treatment.","when_to_set_to_false":"Set to false if the patient has never received total lymphoid irradiation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received total lymphoid irradiation.","meaning":"Boolean indicating whether the patient has ever received total lymphoid irradiation at any time in the past, including as part of previous treatment."} ;; "the patient has received previous treatment with total lymphoid irradiation"

(declare-const patient_is_exposed_to_cyclophosphamide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to cyclophosphamide at any time in the past, including as part of previous treatment.","when_to_set_to_false":"Set to false if the patient has never been exposed to cyclophosphamide at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to cyclophosphamide.","meaning":"Boolean indicating whether the patient has ever been exposed to cyclophosphamide at any time in the past."} ;; "non-exhaustive example: cyclophosphamide"

(declare-const patient_is_exposed_to_chlorambucil_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to chlorambucil at any time in the past, including as part of previous treatment.","when_to_set_to_false":"Set to false if the patient has never been exposed to chlorambucil at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to chlorambucil.","meaning":"Boolean indicating whether the patient has ever been exposed to chlorambucil at any time in the past."} ;; "non-exhaustive example: chlorambucil"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_cyclophosphamide_inthehistory
           patient_is_exposed_to_chlorambucil_inthehistory)
       patient_is_exposed_to_alkylating_agent_inthehistory)
   :named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples: cyclophosphamide, chlorambucil"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (or patient_is_exposed_to_alkylating_agent_inthehistory
            patient_has_received_total_lymphoid_irradiation_in_the_history))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has received any previous treatment with alkylating agents (with non-exhaustive examples: cyclophosphamide, chlorambucil)) OR (the patient has received previous treatment with total lymphoid irradiation))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is a mother who is nursing (breast feeding)"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a mother who is nursing (breast feeding)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the cardiovascular system."} ;; "evidence of serious uncontrolled concomitant cardiovascular disease"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the cardiovascular system is serious.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the cardiovascular system is not serious.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is serious.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the cardiovascular system is serious."} ;; "serious"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the cardiovascular system is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the cardiovascular system is controlled.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is uncontrolled.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the cardiovascular system is uncontrolled."} ;; "uncontrolled"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the cardiovascular system is concomitant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the cardiovascular system is not concomitant.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is concomitant.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the cardiovascular system is concomitant."} ;; "concomitant"

(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the nervous system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the nervous system."} ;; "evidence of serious uncontrolled concomitant nervous system disease"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the nervous system is serious.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the nervous system is not serious.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is serious.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the nervous system is serious."} ;; "serious"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the nervous system is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the nervous system is controlled.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is uncontrolled.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the nervous system is uncontrolled."} ;; "uncontrolled"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the nervous system is concomitant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the nervous system is not concomitant.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is concomitant.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the nervous system is concomitant."} ;; "concomitant"

(declare-const patient_has_diagnosis_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the lung."} ;; "evidence of serious uncontrolled concomitant pulmonary disease"
(declare-const patient_has_diagnosis_of_disorder_of_lung_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the lung is serious.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the lung is not serious.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is serious.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the lung is serious."} ;; "serious"
(declare-const patient_has_diagnosis_of_disorder_of_lung_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the lung is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the lung is controlled.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is uncontrolled.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the lung is uncontrolled."} ;; "uncontrolled"
(declare-const patient_has_diagnosis_of_disorder_of_lung_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the lung is concomitant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the lung is not concomitant.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is concomitant.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the lung is concomitant."} ;; "concomitant"

(declare-const patient_has_diagnosis_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of kidney disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of kidney disease."} ;; "evidence of serious uncontrolled concomitant renal disease"
(declare-const patient_has_diagnosis_of_kidney_disease_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of kidney disease is serious.","when_to_set_to_false":"Set to false if the patient's current diagnosis of kidney disease is not serious.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease is serious.","meaning":"Boolean indicating whether the patient's current diagnosis of kidney disease is serious."} ;; "serious"
(declare-const patient_has_diagnosis_of_kidney_disease_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of kidney disease is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current diagnosis of kidney disease is controlled.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease is uncontrolled.","meaning":"Boolean indicating whether the patient's current diagnosis of kidney disease is uncontrolled."} ;; "uncontrolled"
(declare-const patient_has_diagnosis_of_kidney_disease_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of kidney disease is concomitant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of kidney disease is not concomitant.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease is concomitant.","meaning":"Boolean indicating whether the patient's current diagnosis of kidney disease is concomitant."} ;; "concomitant"

(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disease of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disease of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disease of the liver.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disease of the liver."} ;; "evidence of serious uncontrolled concomitant hepatic disease"
(declare-const patient_has_diagnosis_of_disease_of_liver_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of disease of the liver is serious.","when_to_set_to_false":"Set to false if the patient's current diagnosis of disease of the liver is not serious.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease is serious.","meaning":"Boolean indicating whether the patient's current diagnosis of disease of the liver is serious."} ;; "serious"
(declare-const patient_has_diagnosis_of_disease_of_liver_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of disease of the liver is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current diagnosis of disease of the liver is controlled.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease is uncontrolled.","meaning":"Boolean indicating whether the patient's current diagnosis of disease of the liver is uncontrolled."} ;; "uncontrolled"
(declare-const patient_has_diagnosis_of_disease_of_liver_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of disease of the liver is concomitant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of disease of the liver is not concomitant.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease is concomitant.","meaning":"Boolean indicating whether the patient's current diagnosis of disease of the liver is concomitant."} ;; "concomitant"

(declare-const patient_has_diagnosis_of_endocrine_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of endocrine disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of endocrine disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of endocrine disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of endocrine disease."} ;; "evidence of serious uncontrolled concomitant endocrine disease"
(declare-const patient_has_diagnosis_of_endocrine_disease_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of endocrine disease is serious.","when_to_set_to_false":"Set to false if the patient's current diagnosis of endocrine disease is not serious.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the endocrine disease is serious.","meaning":"Boolean indicating whether the patient's current diagnosis of endocrine disease is serious."} ;; "serious"
(declare-const patient_has_diagnosis_of_endocrine_disease_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of endocrine disease is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current diagnosis of endocrine disease is controlled.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the endocrine disease is uncontrolled.","meaning":"Boolean indicating whether the patient's current diagnosis of endocrine disease is uncontrolled."} ;; "uncontrolled"
(declare-const patient_has_diagnosis_of_endocrine_disease_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of endocrine disease is concomitant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of endocrine disease is not concomitant.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the endocrine disease is concomitant.","meaning":"Boolean indicating whether the patient's current diagnosis of endocrine disease is concomitant."} ;; "concomitant"

(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the gastrointestinal tract."} ;; "evidence of serious uncontrolled concomitant gastrointestinal disease"
(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the gastrointestinal tract is serious.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the gastrointestinal tract is not serious.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is serious.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the gastrointestinal tract is serious."} ;; "serious"
(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the gastrointestinal tract is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the gastrointestinal tract is controlled.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is uncontrolled.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the gastrointestinal tract is uncontrolled."} ;; "uncontrolled"
(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the gastrointestinal tract is concomitant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the gastrointestinal tract is not concomitant.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder is concomitant.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the gastrointestinal tract is concomitant."} ;; "concomitant"

;; Pulmonary disease non-exhaustive examples
(declare-const patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of severe chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of severe chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of severe chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of severe chronic obstructive pulmonary disease."} ;; "severe chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_very_severe_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of very severe chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of very severe chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of very severe chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of very severe chronic obstructive pulmonary disease."} ;; "very severe chronic obstructive pulmonary disease"

;; Endocrine disease non-exhaustive example
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "uncontrolled diabetes mellitus"
(declare-const hemoglobin_a1c_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the value of the patient's most recent hemoglobin A1c measurement, in percent, if available now.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's most recent hemoglobin A1c measurement, recorded now, in percent."} ;; "hemoglobin A1c greater than 9.0 percent"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@serious
      patient_has_diagnosis_of_disorder_of_cardiovascular_system_now)
:named REQ12_AUXILIARY0)) ;; "serious uncontrolled concomitant cardiovascular disease"
(assert
(! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@uncontrolled
      patient_has_diagnosis_of_disorder_of_cardiovascular_system_now)
:named REQ12_AUXILIARY1)) ;; "serious uncontrolled concomitant cardiovascular disease"
(assert
(! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@concomitant
      patient_has_diagnosis_of_disorder_of_cardiovascular_system_now)
:named REQ12_AUXILIARY2)) ;; "serious uncontrolled concomitant cardiovascular disease"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_now@@serious
      patient_has_diagnosis_of_disorder_of_nervous_system_now)
:named REQ12_AUXILIARY3)) ;; "serious uncontrolled concomitant nervous system disease"
(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_now@@uncontrolled
      patient_has_diagnosis_of_disorder_of_nervous_system_now)
:named REQ12_AUXILIARY4)) ;; "serious uncontrolled concomitant nervous system disease"
(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_now@@concomitant
      patient_has_diagnosis_of_disorder_of_nervous_system_now)
:named REQ12_AUXILIARY5)) ;; "serious uncontrolled concomitant nervous system disease"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_lung_now@@serious
      patient_has_diagnosis_of_disorder_of_lung_now)
:named REQ12_AUXILIARY6)) ;; "serious uncontrolled concomitant pulmonary disease"
(assert
(! (=> patient_has_diagnosis_of_disorder_of_lung_now@@uncontrolled
      patient_has_diagnosis_of_disorder_of_lung_now)
:named REQ12_AUXILIARY7)) ;; "serious uncontrolled concomitant pulmonary disease"
(assert
(! (=> patient_has_diagnosis_of_disorder_of_lung_now@@concomitant
      patient_has_diagnosis_of_disorder_of_lung_now)
:named REQ12_AUXILIARY8)) ;; "serious uncontrolled concomitant pulmonary disease"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_now@@serious
      patient_has_diagnosis_of_kidney_disease_now)
:named REQ12_AUXILIARY9)) ;; "serious uncontrolled concomitant renal disease"
(assert
(! (=> patient_has_diagnosis_of_kidney_disease_now@@uncontrolled
      patient_has_diagnosis_of_kidney_disease_now)
:named REQ12_AUXILIARY10)) ;; "serious uncontrolled concomitant renal disease"
(assert
(! (=> patient_has_diagnosis_of_kidney_disease_now@@concomitant
      patient_has_diagnosis_of_kidney_disease_now)
:named REQ12_AUXILIARY11)) ;; "serious uncontrolled concomitant renal disease"

(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_now@@serious
      patient_has_diagnosis_of_disease_of_liver_now)
:named REQ12_AUXILIARY12)) ;; "serious uncontrolled concomitant hepatic disease"
(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_now@@uncontrolled
      patient_has_diagnosis_of_disease_of_liver_now)
:named REQ12_AUXILIARY13)) ;; "serious uncontrolled concomitant hepatic disease"
(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_now@@concomitant
      patient_has_diagnosis_of_disease_of_liver_now)
:named REQ12_AUXILIARY14)) ;; "serious uncontrolled concomitant hepatic disease"

(assert
(! (=> patient_has_diagnosis_of_endocrine_disease_now@@serious
      patient_has_diagnosis_of_endocrine_disease_now)
:named REQ12_AUXILIARY15)) ;; "serious uncontrolled concomitant endocrine disease"
(assert
(! (=> patient_has_diagnosis_of_endocrine_disease_now@@uncontrolled
      patient_has_diagnosis_of_endocrine_disease_now)
:named REQ12_AUXILIARY16)) ;; "serious uncontrolled concomitant endocrine disease"
(assert
(! (=> patient_has_diagnosis_of_endocrine_disease_now@@concomitant
      patient_has_diagnosis_of_endocrine_disease_now)
:named REQ12_AUXILIARY17)) ;; "serious uncontrolled concomitant endocrine disease"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@serious
      patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now)
:named REQ12_AUXILIARY18)) ;; "serious uncontrolled concomitant gastrointestinal disease"
(assert
(! (=> patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@uncontrolled
      patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now)
:named REQ12_AUXILIARY19)) ;; "serious uncontrolled concomitant gastrointestinal disease"
(assert
(! (=> patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@concomitant
      patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now)
:named REQ12_AUXILIARY20)) ;; "serious uncontrolled concomitant gastrointestinal disease"

;; Pulmonary disease non-exhaustive examples imply umbrella
(assert
(! (=> (or patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_now
          patient_has_diagnosis_of_very_severe_chronic_obstructive_pulmonary_disease_now)
      patient_has_diagnosis_of_disorder_of_lung_now@@serious)
:named REQ12_AUXILIARY21)) ;; "with non-exhaustive examples ((severe chronic obstructive pulmonary disease) OR (very severe chronic obstructive pulmonary disease))"

(assert
(! (=> (or patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_now
          patient_has_diagnosis_of_very_severe_chronic_obstructive_pulmonary_disease_now)
      patient_has_diagnosis_of_disorder_of_lung_now@@uncontrolled)
:named REQ12_AUXILIARY22)) ;; "with non-exhaustive examples ((severe chronic obstructive pulmonary disease) OR (very severe chronic obstructive pulmonary disease))"

(assert
(! (=> (or patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_now
          patient_has_diagnosis_of_very_severe_chronic_obstructive_pulmonary_disease_now)
      patient_has_diagnosis_of_disorder_of_lung_now@@concomitant)
:named REQ12_AUXILIARY23)) ;; "with non-exhaustive examples ((severe chronic obstructive pulmonary disease) OR (very severe chronic obstructive pulmonary disease))"

;; Endocrine disease non-exhaustive example: uncontrolled diabetes mellitus as defined by hemoglobin A1c > 9.0%
(assert
(! (= patient_has_diagnosis_of_endocrine_disease_now@@uncontrolled
      (or patient_has_diagnosis_of_endocrine_disease_now@@uncontrolled
          (and patient_has_diagnosis_of_diabetes_mellitus_now
               (> hemoglobin_a1c_value_recorded_now_withunit_percent 9.0))))
:named REQ12_AUXILIARY24)) ;; "uncontrolled diabetes mellitus as defined by hemoglobin A1c greater than 9.0 percent"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (and patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@serious
             patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@uncontrolled
             patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@concomitant))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "evidence of serious uncontrolled concomitant cardiovascular disease"

(assert
(! (not (and patient_has_diagnosis_of_disorder_of_nervous_system_now@@serious
             patient_has_diagnosis_of_disorder_of_nervous_system_now@@uncontrolled
             patient_has_diagnosis_of_disorder_of_nervous_system_now@@concomitant))
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "evidence of serious uncontrolled concomitant nervous system disease"

(assert
(! (not (and patient_has_diagnosis_of_disorder_of_lung_now@@serious
             patient_has_diagnosis_of_disorder_of_lung_now@@uncontrolled
             patient_has_diagnosis_of_disorder_of_lung_now@@concomitant))
:named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "evidence of serious uncontrolled concomitant pulmonary disease"

(assert
(! (not (and patient_has_diagnosis_of_kidney_disease_now@@serious
             patient_has_diagnosis_of_kidney_disease_now@@uncontrolled
             patient_has_diagnosis_of_kidney_disease_now@@concomitant))
:named REQ12_COMPONENT3_OTHER_REQUIREMENTS)) ;; "evidence of serious uncontrolled concomitant renal disease"

(assert
(! (not (and patient_has_diagnosis_of_disease_of_liver_now@@serious
             patient_has_diagnosis_of_disease_of_liver_now@@uncontrolled
             patient_has_diagnosis_of_disease_of_liver_now@@concomitant))
:named REQ12_COMPONENT4_OTHER_REQUIREMENTS)) ;; "evidence of serious uncontrolled concomitant hepatic disease"

(assert
(! (not (and patient_has_diagnosis_of_endocrine_disease_now@@serious
             patient_has_diagnosis_of_endocrine_disease_now@@uncontrolled
             patient_has_diagnosis_of_endocrine_disease_now@@concomitant))
:named REQ12_COMPONENT5_OTHER_REQUIREMENTS)) ;; "evidence of serious uncontrolled concomitant endocrine disease"

(assert
(! (not (and patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@serious
             patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@uncontrolled
             patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@concomitant))
:named REQ12_COMPONENT6_OTHER_REQUIREMENTS)) ;; "evidence of serious uncontrolled concomitant gastrointestinal disease"

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_disease_condition_determination_uncontrolled_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any uncontrolled disease condition.","when_to_set_to_false":"Set to false if the patient currently does not have any uncontrolled disease condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any uncontrolled disease condition.","meaning":"Boolean indicating whether the patient currently has any uncontrolled disease condition."} ;; "uncontrolled disease states"

(declare-const patient_has_diagnosis_of_disease_of_skin_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an uncontrolled disease of the skin (e.g., psoriasis).","when_to_set_to_false":"Set to false if the patient currently does not have an uncontrolled disease of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an uncontrolled disease of the skin.","meaning":"Boolean indicating whether the patient currently has an uncontrolled disease of the skin, such as psoriasis."} ;; "psoriasis"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any corticosteroid or corticosteroid derivative-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any corticosteroid or corticosteroid derivative-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any corticosteroid or corticosteroid derivative-containing product.","meaning":"Boolean indicating whether the patient is currently taking any corticosteroid or corticosteroid derivative-containing product."} ;; "corticosteroids"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_orally Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any corticosteroid or corticosteroid derivative-containing product administered orally.","when_to_set_to_false":"Set to false if the patient is currently taking corticosteroids but not administered orally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the corticosteroid product is administered orally.","meaning":"Boolean indicating whether the patient is currently taking any corticosteroid or corticosteroid derivative-containing product administered orally."} ;; "oral corticosteroids"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_parenterally Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any corticosteroid or corticosteroid derivative-containing product administered parenterally.","when_to_set_to_false":"Set to false if the patient is currently taking corticosteroids but not administered parenterally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the corticosteroid product is administered parenterally.","meaning":"Boolean indicating whether the patient is currently taking any corticosteroid or corticosteroid derivative-containing product administered parenterally."} ;; "parenteral corticosteroids"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_disorder_of_lung_now@@uncontrolled
           patient_has_diagnosis_of_disease_of_skin_now@@uncontrolled
           patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@uncontrolled)
       patient_has_finding_of_disease_condition_determination_uncontrolled_now)
   :named REQ13_AUXILIARY0)) ;; "with non-exhaustive examples ((asthma, psoriasis, inflammatory bowel disease))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disorder_of_lung_now@@uncontrolled
       patient_has_finding_of_disease_condition_determination_uncontrolled_now)
   :named REQ13_AUXILIARY1)) ;; "asthma"

(assert
(! (=> patient_has_diagnosis_of_disease_of_skin_now@@uncontrolled
       patient_has_finding_of_disease_condition_determination_uncontrolled_now)
   :named REQ13_AUXILIARY2)) ;; "psoriasis"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@uncontrolled
       patient_has_finding_of_disease_condition_determination_uncontrolled_now)
   :named REQ13_AUXILIARY3)) ;; "inflammatory bowel disease"

;; Administration route qualifiers imply stem variable
(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_orally
       patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
   :named REQ13_AUXILIARY4)) ;; "oral corticosteroids"

(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_parenterally
       patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
   :named REQ13_AUXILIARY5)) ;; "parenteral corticosteroids"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (and patient_has_finding_of_disease_condition_determination_uncontrolled_now
             (or patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_orally
                 patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_parenterally)))
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled disease states with non-exhaustive examples ((asthma, psoriasis, inflammatory bowel disease)), where flares of these diseases are commonly treated with oral corticosteroids OR parenteral corticosteroids."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_bacterial_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bacterial infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a bacterial infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a bacterial infectious disease.","meaning":"Boolean indicating whether the patient currently has a bacterial infectious disease."} ;; "the patient has known active current bacterial infection"

(declare-const patient_has_finding_of_viral_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a viral infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a viral infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a viral infectious disease.","meaning":"Boolean indicating whether the patient currently has a viral infectious disease."} ;; "the patient has known active current viral infection"

(declare-const patient_has_finding_of_mycosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a fungal infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a fungal infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a fungal infectious disease.","meaning":"Boolean indicating whether the patient currently has a fungal infectious disease."} ;; "the patient has known active current fungal infection"

(declare-const patient_has_finding_of_mycobacteriosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mycobacterial infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a mycobacterial infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mycobacterial infectious disease.","meaning":"Boolean indicating whether the patient currently has a mycobacterial infectious disease."} ;; "the patient has known active current mycobacterial infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infectious disease (other type).","when_to_set_to_false":"Set to false if the patient currently does not have an infectious disease (other type).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infectious disease (other type).","meaning":"Boolean indicating whether the patient currently has an infectious disease (other type)."} ;; "the patient has known active current other infection"

(declare-const patient_has_finding_of_bacterial_infectious_disease_recurrent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of recurrent bacterial infectious disease.","when_to_set_to_false":"Set to false if the patient does not have a history of recurrent bacterial infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of recurrent bacterial infectious disease.","meaning":"Boolean indicating whether the patient has a history of recurrent bacterial infectious disease."} ;; "the patient has history of recurrent bacterial infection"

(declare-const patient_has_finding_of_viral_disease_recurrent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of recurrent viral infectious disease.","when_to_set_to_false":"Set to false if the patient does not have a history of recurrent viral infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of recurrent viral infectious disease.","meaning":"Boolean indicating whether the patient has a history of recurrent viral infectious disease."} ;; "the patient has history of recurrent viral infection"

(declare-const patient_has_finding_of_mycosis_recurrent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of recurrent fungal infectious disease.","when_to_set_to_false":"Set to false if the patient does not have a history of recurrent fungal infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of recurrent fungal infectious disease.","meaning":"Boolean indicating whether the patient has a history of recurrent fungal infectious disease."} ;; "the patient has history of recurrent fungal infection"

(declare-const patient_has_finding_of_mycobacteriosis_recurrent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of recurrent mycobacterial infectious disease.","when_to_set_to_false":"Set to false if the patient does not have a history of recurrent mycobacterial infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of recurrent mycobacterial infectious disease.","meaning":"Boolean indicating whether the patient has a history of recurrent mycobacterial infectious disease."} ;; "the patient has history of recurrent mycobacterial infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_recurrent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of recurrent other infectious disease (including tuberculosis, atypical mycobacterial disease, hepatitis B, hepatitis C, herpes zoster, but excluding onychomycosis).","when_to_set_to_false":"Set to false if the patient does not have a history of recurrent other infectious disease (including tuberculosis, atypical mycobacterial disease, hepatitis B, hepatitis C, herpes zoster, but excluding onychomycosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of recurrent other infectious disease (including tuberculosis, atypical mycobacterial disease, hepatitis B, hepatitis C, herpes zoster, but excluding onychomycosis).","meaning":"Boolean indicating whether the patient has a history of recurrent other infectious disease (including tuberculosis, atypical mycobacterial disease, hepatitis B, hepatitis C, herpes zoster, but excluding onychomycosis)."} ;; "the patient has history of recurrent other infection with non-exhaustive examples (tuberculosis, atypical mycobacterial disease, hepatitis B, hepatitis C, herpes zoster), but excluding onychomycosis"

(declare-const patient_has_finding_of_disorder_due_to_infection_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an infectious disease episode in the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not had an infectious disease episode in the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an infectious disease episode in the past 4 weeks.","meaning":"Boolean indicating whether the patient has had an infectious disease episode in the past 4 weeks."} ;; "the patient has had any major episode of infection ... within four weeks of screening"

(declare-const patient_has_finding_of_disorder_due_to_infection_inthepast4weeks@@required_hospitalization_or_antibiotic_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the infectious disease episode in the past 4 weeks required hospitalization or treatment with intravenous or oral antibiotics.","when_to_set_to_false":"Set to false if the infectious disease episode in the past 4 weeks did not require hospitalization or treatment with intravenous or oral antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infectious disease episode in the past 4 weeks required hospitalization or treatment with intravenous or oral antibiotics.","meaning":"Boolean indicating whether the infectious disease episode in the past 4 weeks required hospitalization or treatment with intravenous or oral antibiotics."} ;; "the patient has had any major episode of infection requiring hospitalization OR treatment with intravenous antibiotics OR treatment with oral antibiotics within four weeks of screening"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Non-exhaustive examples for "other infection" (tuberculosis, atypical mycobacterial disease, hepatitis B, hepatitis C, herpes zoster) imply "other infection"
;; (No explicit variables for these examples, so no auxiliary assertion needed.)

;; Qualifier variable for "required hospitalization or antibiotic treatment" implies stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_inthepast4weeks@@required_hospitalization_or_antibiotic_treatment
       patient_has_finding_of_disorder_due_to_infection_inthepast4weeks)
:named REQ14_AUXILIARY0)) ;; "the patient has had any major episode of infection requiring hospitalization OR treatment with intravenous antibiotics OR treatment with oral antibiotics within four weeks of screening"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_bacterial_infectious_disease_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has known active current bacterial infection"

(assert
(! (not patient_has_finding_of_viral_disease_now)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has known active current viral infection"

(assert
(! (not patient_has_finding_of_mycosis_now)
:named REQ14_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has known active current fungal infection"

(assert
(! (not patient_has_finding_of_mycobacteriosis_now)
:named REQ14_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has known active current mycobacterial infection"

(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now)
:named REQ14_COMPONENT4_OTHER_REQUIREMENTS)) ;; "the patient has known active current other infection with non-exhaustive examples (tuberculosis, atypical mycobacterial disease, hepatitis B, hepatitis C, herpes zoster), but excluding onychomycosis"

(assert
(! (not patient_has_finding_of_bacterial_infectious_disease_recurrent_inthehistory)
:named REQ14_COMPONENT5_OTHER_REQUIREMENTS)) ;; "the patient has history of recurrent bacterial infection"

(assert
(! (not patient_has_finding_of_viral_disease_recurrent_inthehistory)
:named REQ14_COMPONENT6_OTHER_REQUIREMENTS)) ;; "the patient has history of recurrent viral infection"

(assert
(! (not patient_has_finding_of_mycosis_recurrent_inthehistory)
:named REQ14_COMPONENT7_OTHER_REQUIREMENTS)) ;; "the patient has history of recurrent fungal infection"

(assert
(! (not patient_has_finding_of_mycobacteriosis_recurrent_inthehistory)
:named REQ14_COMPONENT8_OTHER_REQUIREMENTS)) ;; "the patient has history of recurrent mycobacterial infection"

(assert
(! (not patient_has_finding_of_disorder_due_to_infection_recurrent_inthehistory)
:named REQ14_COMPONENT9_OTHER_REQUIREMENTS)) ;; "the patient has history of recurrent other infection with non-exhaustive examples (tuberculosis, atypical mycobacterial disease, hepatitis B, hepatitis C, herpes zoster), but excluding onychomycosis"

(assert
(! (not patient_has_finding_of_disorder_due_to_infection_inthepast4weeks@@required_hospitalization_or_antibiotic_treatment)
:named REQ14_COMPONENT10_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has had any major episode of infection requiring hospitalization OR treatment with intravenous antibiotics OR treatment with oral antibiotics within four weeks of screening"

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of human immunodeficiency virus infection at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of human immunodeficiency virus infection at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient has ever had human immunodeficiency virus infection in their history."} ;; "history of positive human immunodeficiency virus infection"

(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory@@positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a positive human immunodeficiency virus infection in their history.","when_to_set_to_false":"Set to false if the patient has never had a positive human immunodeficiency virus infection in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a positive human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient has ever had a positive human immunodeficiency virus infection in their history."} ;; "history of positive human immunodeficiency virus infection"

(declare-const patient_has_finding_of_congenital_immunodeficiency_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of congenital immunodeficiency disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of congenital immunodeficiency disease at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had congenital immunodeficiency disease.","meaning":"Boolean indicating whether the patient has ever had congenital immunodeficiency disease in their history."} ;; "congenital immunodeficiency"

(declare-const patient_has_finding_of_acquired_immunodeficiency_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of acquired immunodeficiency at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of acquired immunodeficiency at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had acquired immunodeficiency.","meaning":"Boolean indicating whether the patient has ever had acquired immunodeficiency in their history."} ;; "acquired immunodeficiency"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory@@positive
      patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory)
    :named REQ15_AUXILIARY0)) ;; "history of positive human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion: patient must NOT have any of the following:
;; (1) history of positive human immunodeficiency virus infection
;; (2) congenital immunodeficiency
;; (3) acquired immunodeficiency (with non-exhaustive examples: common variable immunodeficiency disease)
(assert
(! (not (or patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory@@positive
            patient_has_finding_of_congenital_immunodeficiency_disease_inthehistory
            patient_has_finding_of_acquired_immunodeficiency_inthehistory))
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of positive human immunodeficiency virus infection) OR (the patient has congenital immunodeficiency) OR (the patient has acquired immunodeficiency with non-exhaustive examples (common variable immunodeficiency disease)))."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented history of malignant neoplastic disease (malignancy), including solid tumors or hematologic malignancies, at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of malignant neoplastic disease (malignancy) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient has a history of malignant neoplastic disease (malignancy)."} ;; "malignancy, including history of solid tumor and history of hematologic malignancy"

(declare-const patient_has_finding_of_basal_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented history of basal cell carcinoma of the skin at any time in the past, regardless of whether it has been excised and cured.","when_to_set_to_false":"Set to false if the patient has no documented history of basal cell carcinoma of the skin at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of basal cell carcinoma of the skin.","meaning":"Boolean indicating whether the patient has a history of basal cell carcinoma of the skin."} ;; "basal cell carcinoma of the skin"

(declare-const patient_has_finding_of_basal_cell_carcinoma_of_skin_inthehistory@@excised_and_cured Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of basal cell carcinoma of the skin is limited to cases that have been excised and cured.","when_to_set_to_false":"Set to false if the patient's history of basal cell carcinoma of the skin includes cases that have not been excised and cured.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the basal cell carcinoma of the skin has been excised and cured.","meaning":"Boolean indicating whether the patient's history of basal cell carcinoma of the skin is limited to cases that have been excised and cured."} ;; "basal cell carcinoma of the skin that has been excised and cured"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_basal_cell_carcinoma_of_skin_inthehistory@@excised_and_cured
       patient_has_finding_of_basal_cell_carcinoma_of_skin_inthehistory)
   :named REQ16_AUXILIARY0)) ;; "basal cell carcinoma of the skin that has been excised and cured"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: patient has a history of malignancy (including solid tumor and hematologic malignancy) AND NOT (only history of basal cell carcinoma of the skin that has been excised and cured)
(assert
(! (not (and patient_has_finding_of_malignant_neoplastic_disease_inthehistory
             (not (and patient_has_finding_of_basal_cell_carcinoma_of_skin_inthehistory@@excised_and_cured
                       (not (or (not patient_has_finding_of_basal_cell_carcinoma_of_skin_inthehistory)
                                (not patient_has_finding_of_malignant_neoplastic_disease_inthehistory))))))
   )
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of malignancy, including history of solid tumor and history of hematologic malignancy) AND NOT (the patient has only a history of basal cell carcinoma of the skin that has been excised and cured))."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcohol abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse at any time in the past."} ;; "alcohol abuse"
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory@@temporalcontext_within6months_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of alcohol abuse occurred within the six months prior to the screening event.","when_to_set_to_false":"Set to false if the patient's history of alcohol abuse did not occur within the six months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of alcohol abuse occurred within the six months prior to screening.","meaning":"Boolean indicating whether the patient's history of alcohol abuse occurred within the six months prior to screening."} ;; "history of alcohol abuse within the six months prior to screening"
(declare-const patient_has_finding_of_drug_abuse_inthehistory@@temporalcontext_within6months_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of drug abuse occurred within the six months prior to the screening event.","when_to_set_to_false":"Set to false if the patient's history of drug abuse did not occur within the six months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of drug abuse occurred within the six months prior to screening.","meaning":"Boolean indicating whether the patient's history of drug abuse occurred within the six months prior to screening."} ;; "history of drug abuse within the six months prior to screening"
(declare-const patient_has_finding_of_chemical_abuse_inthehistory@@temporalcontext_within6months_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of chemical abuse occurred within the six months prior to the screening event.","when_to_set_to_false":"Set to false if the patient's history of chemical abuse did not occur within the six months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of chemical abuse occurred within the six months prior to screening.","meaning":"Boolean indicating whether the patient's history of chemical abuse occurred within the six months prior to screening."} ;; "history of chemical abuse within the six months prior to screening"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variable implies corresponding stem variable for alcohol abuse
(assert
(! (=> patient_has_finding_of_alcohol_abuse_inthehistory@@temporalcontext_within6months_prior_to_screening
      patient_has_finding_of_alcohol_abuse_inthehistory)
:named REQ17_AUXILIARY0)) ;; "history of alcohol abuse within the six months prior to screening"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not (or patient_has_finding_of_alcohol_abuse_inthehistory@@temporalcontext_within6months_prior_to_screening
            patient_has_finding_of_drug_abuse_inthehistory@@temporalcontext_within6months_prior_to_screening
            patient_has_finding_of_chemical_abuse_inthehistory@@temporalcontext_within6months_prior_to_screening))
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of alcohol abuse within the six months prior to screening) OR (the patient has a history of drug abuse within the six months prior to screening) OR (the patient has a history of chemical abuse within the six months prior to screening))."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease, condition, or finding (medical condition).","when_to_set_to_false":"Set to false if the patient currently does not have a disease, condition, or finding (medical condition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease, condition, or finding (medical condition).","meaning":"Boolean indicating whether the patient currently has a disease, condition, or finding (medical condition)."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition is significant.","when_to_set_to_false":"Set to false if the patient's current medical condition is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition is significant.","meaning":"Boolean indicating whether the patient's current medical condition is significant."} ;; "significant medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@would_prevent_participation_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition would prevent the patient from participating in the study.","when_to_set_to_false":"Set to false if the patient's current medical condition would not prevent the patient from participating in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition would prevent participation in the study.","meaning":"Boolean indicating whether the patient's current medical condition would prevent participation in the study."} ;; "that would prevent the patient from participating in the study"
(declare-const patient_has_finding_of_laboratory_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a laboratory abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have a laboratory abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a laboratory abnormality.","meaning":"Boolean indicating whether the patient currently has a laboratory abnormality."} ;; "laboratory abnormality"
(declare-const patient_has_finding_of_laboratory_abnormality_now@@would_prevent_participation_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current laboratory abnormality would prevent the patient from participating in the study.","when_to_set_to_false":"Set to false if the patient's current laboratory abnormality would not prevent the patient from participating in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current laboratory abnormality would prevent participation in the study.","meaning":"Boolean indicating whether the patient's current laboratory abnormality would prevent participation in the study."} ;; "that would prevent the patient from participating in the study"
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder (psychiatric illness).","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder (psychiatric illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder (psychiatric illness).","meaning":"Boolean indicating whether the patient currently has a mental disorder (psychiatric illness)."} ;; "psychiatric illness"
(declare-const patient_has_finding_of_mental_disorder_now@@would_prevent_participation_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychiatric illness would prevent the patient from participating in the study.","when_to_set_to_false":"Set to false if the patient's current psychiatric illness would not prevent the patient from participating in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychiatric illness would prevent participation in the study.","meaning":"Boolean indicating whether the patient's current psychiatric illness would prevent participation in the study."} ;; "that would prevent the patient from participating in the study"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@is_significant
       patient_has_finding_of_disease_condition_finding_now)
    :named REQ18_AUXILIARY0)) ;; "significant medical condition"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@would_prevent_participation_in_study
       patient_has_finding_of_disease_condition_finding_now)
    :named REQ18_AUXILIARY1)) ;; "medical condition that would prevent the patient from participating in the study"

(assert
(! (=> patient_has_finding_of_laboratory_abnormality_now@@would_prevent_participation_in_study
       patient_has_finding_of_laboratory_abnormality_now)
    :named REQ18_AUXILIARY2)) ;; "laboratory abnormality that would prevent the patient from participating in the study"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@would_prevent_participation_in_study
       patient_has_finding_of_mental_disorder_now)
    :named REQ18_AUXILIARY3)) ;; "psychiatric illness that would prevent the patient from participating in the study"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (and patient_has_finding_of_disease_condition_finding_now@@is_significant
             patient_has_finding_of_disease_condition_finding_now@@would_prevent_participation_in_study))
    :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any significant medical condition that would prevent the patient from participating in the study."

(assert
(! (not patient_has_finding_of_laboratory_abnormality_now@@would_prevent_participation_in_study)
    :named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any laboratory abnormality that would prevent the patient from participating in the study."

(assert
(! (not patient_has_finding_of_mental_disorder_now@@would_prevent_participation_in_study)
    :named REQ18_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any psychiatric illness that would prevent the patient from participating in the study."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_laboratory_abnormality_now@@places_patient_at_unacceptable_risk_if_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any laboratory abnormality, and that abnormality places the patient at unacceptable risk if they were to participate in the study.","when_to_set_to_false":"Set to false if the patient currently has any laboratory abnormality, but that abnormality does not place the patient at unacceptable risk if they were to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the laboratory abnormality places the patient at unacceptable risk if they were to participate in the study.","meaning":"Boolean indicating whether the patient's current laboratory abnormality places them at unacceptable risk if they participate in the study."} ;; "the presence of laboratory abnormalities ... which places the patient at unacceptable risk if the patient were to participate in the study"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Non-exhaustive example: laboratory abnormality is an example of a condition that places patient at unacceptable risk
(assert
(! (=> patient_has_finding_of_laboratory_abnormality_now@@places_patient_at_unacceptable_risk_if_participate_in_study
      patient_has_finding_of_disease_condition_finding_now@@places_patient_at_unacceptable_risk_if_participate_in_study)
:named REQ19_AUXILIARY0)) ;; "with non-exhaustive examples (the presence of laboratory abnormalities) which places the patient at unacceptable risk..."

;; Qualifier variable implies corresponding stem variable (disease condition)
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@places_patient_at_unacceptable_risk_if_participate_in_study
      patient_has_finding_of_disease_condition_finding_now)
:named REQ19_AUXILIARY1)) ;; "any condition ... which places the patient at unacceptable risk..."

;; Qualifier variable implies corresponding stem variable (laboratory abnormality)
(assert
(! (=> patient_has_finding_of_laboratory_abnormality_now@@places_patient_at_unacceptable_risk_if_participate_in_study
      patient_has_finding_of_laboratory_abnormality_now)
:named REQ19_AUXILIARY2)) ;; "the presence of laboratory abnormalities ... which places the patient at unacceptable risk..."

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@places_patient_at_unacceptable_risk_if_participate_in_study)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition ... which places the patient at unacceptable risk if the patient were to participate in the study."
