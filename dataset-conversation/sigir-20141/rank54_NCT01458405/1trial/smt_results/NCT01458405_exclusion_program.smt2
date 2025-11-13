;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of undergoing coronary artery bypass graft surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of undergoing coronary artery bypass graft surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has a history of coronary artery bypass graft surgery."} ;; "the patient has a history of coronary artery bypass surgery"

(declare-const patient_has_undergone_arterial_bypass_graft_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an arterial bypass graft.","when_to_set_to_false":"Set to false if the patient does not currently have an arterial bypass graft.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an arterial bypass graft.","meaning":"Boolean indicating whether the patient currently has an arterial bypass graft."} ;; "arterial graft"

(declare-const patient_has_undergone_arterial_bypass_graft_now@@is_patent Bool) ;; {"when_to_set_to_true":"Set to true if the arterial bypass graft is patent (open and functional).","when_to_set_to_false":"Set to false if the arterial bypass graft is not patent (occluded or nonfunctional).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the arterial bypass graft is patent.","meaning":"Boolean indicating whether the arterial bypass graft is patent."} ;; "patent arterial graft"

(declare-const patient_has_undergone_arterial_bypass_graft_now@@attached_to_coronary_artery_to_be_infused Bool) ;; {"when_to_set_to_true":"Set to true if the arterial bypass graft is attached to the coronary artery to be infused.","when_to_set_to_false":"Set to false if the arterial bypass graft is not attached to the coronary artery to be infused.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the arterial bypass graft is attached to the coronary artery to be infused.","meaning":"Boolean indicating whether the arterial bypass graft is attached to the coronary artery to be infused."} ;; "arterial graft attached to the coronary artery to be infused"

(declare-const patient_is_exposed_to_saphenous_vein_graft_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a saphenous vein graft.","when_to_set_to_false":"Set to false if the patient does not currently have a saphenous vein graft.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a saphenous vein graft.","meaning":"Boolean indicating whether the patient currently has a saphenous vein graft."} ;; "saphenous vein graft"

(declare-const patient_is_exposed_to_saphenous_vein_graft_now@@is_patent Bool) ;; {"when_to_set_to_true":"Set to true if the saphenous vein graft is patent (open and functional).","when_to_set_to_false":"Set to false if the saphenous vein graft is not patent (occluded or nonfunctional).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the saphenous vein graft is patent.","meaning":"Boolean indicating whether the saphenous vein graft is patent."} ;; "patent saphenous vein graft"

(declare-const patient_is_exposed_to_saphenous_vein_graft_now@@attached_to_coronary_artery_to_be_infused Bool) ;; {"when_to_set_to_true":"Set to true if the saphenous vein graft is attached to the coronary artery to be infused.","when_to_set_to_false":"Set to false if the saphenous vein graft is not attached to the coronary artery to be infused.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the saphenous vein graft is attached to the coronary artery to be infused.","meaning":"Boolean indicating whether the saphenous vein graft is attached to the coronary artery to be infused."} ;; "saphenous vein graft attached to the coronary artery to be infused"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_arterial_bypass_graft_now@@is_patent
      patient_has_undergone_arterial_bypass_graft_now)
:named REQ0_AUXILIARY0)) ;; "patent arterial graft"

(assert
(! (=> patient_has_undergone_arterial_bypass_graft_now@@attached_to_coronary_artery_to_be_infused
      patient_has_undergone_arterial_bypass_graft_now)
:named REQ0_AUXILIARY1)) ;; "arterial graft attached to the coronary artery to be infused"

(assert
(! (=> patient_is_exposed_to_saphenous_vein_graft_now@@is_patent
      patient_is_exposed_to_saphenous_vein_graft_now)
:named REQ0_AUXILIARY2)) ;; "patent saphenous vein graft"

(assert
(! (=> patient_is_exposed_to_saphenous_vein_graft_now@@attached_to_coronary_artery_to_be_infused
      patient_is_exposed_to_saphenous_vein_graft_now)
:named REQ0_AUXILIARY3)) ;; "saphenous vein graft attached to the coronary artery to be infused"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: history of coronary artery bypass surgery AND (patent arterial graft attached to coronary artery to be infused OR patent saphenous vein graft attached to coronary artery to be infused)
(assert
(! (not (and
         patient_has_undergone_coronary_artery_bypass_graft_inthehistory
         (or
           (and patient_has_undergone_arterial_bypass_graft_now@@is_patent
                patient_has_undergone_arterial_bypass_graft_now@@attached_to_coronary_artery_to_be_infused)
           (and patient_is_exposed_to_saphenous_vein_graft_now@@is_patent
                patient_is_exposed_to_saphenous_vein_graft_now@@attached_to_coronary_artery_to_be_infused)
         )
       ))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of coronary artery bypass surgery) AND ((the patient has a patent arterial graft attached to the coronary artery to be infused) OR (the patient has a patent saphenous vein graft attached to the coronary artery to be infused)))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_myocarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of myocarditis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of myocarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of myocarditis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of myocarditis."} ;; "the patient has diagnosed myocarditis"
(declare-const patient_has_suspicion_of_myocarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have myocarditis.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have myocarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have myocarditis.","meaning":"Boolean indicating whether the patient is currently suspected to have myocarditis."} ;; "the patient has suspected myocarditis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_diagnosis_of_myocarditis_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diagnosed myocarditis."

(assert
  (! (not patient_has_suspicion_of_myocarditis_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected myocarditis."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_neoplasm_of_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with neoplasm of the heart (cardiac tumor) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with neoplasm of the heart (cardiac tumor) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of neoplasm of the heart.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of neoplasm of the heart (cardiac tumor) in their history."} ;; "the patient has a history of cardiac tumor"
(declare-const patient_has_finding_of_neoplasm_of_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a neoplasm of the heart (cardiac tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a neoplasm of the heart (cardiac tumor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neoplasm of the heart.","meaning":"Boolean indicating whether the patient currently has a neoplasm of the heart (cardiac tumor)."} ;; "the patient has a cardiac tumor demonstrated on screening magnetic resonance imaging"
(declare-const patient_has_finding_of_neoplasm_of_heart_now@@demonstrated_on_screening_magnetic_resonance_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current neoplasm of the heart (cardiac tumor) is demonstrated on screening magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient's current neoplasm of the heart (cardiac tumor) is not demonstrated on screening magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current neoplasm of the heart is demonstrated on screening magnetic resonance imaging.","meaning":"Boolean indicating whether the patient's current neoplasm of the heart (cardiac tumor) is demonstrated on screening magnetic resonance imaging."} ;; "the patient has a cardiac tumor demonstrated on screening magnetic resonance imaging"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_neoplasm_of_heart_now@@demonstrated_on_screening_magnetic_resonance_imaging
       patient_has_finding_of_neoplasm_of_heart_now)
   :named REQ2_AUXILIARY0)) ;; "the patient has a cardiac tumor demonstrated on screening magnetic resonance imaging"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_diagnosis_of_neoplasm_of_heart_inthehistory
            patient_has_finding_of_neoplasm_of_heart_now@@demonstrated_on_screening_magnetic_resonance_imaging))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of cardiac tumor) OR (the patient has a cardiac tumor demonstrated on screening magnetic resonance imaging))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of acute coronary syndrome at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of acute coronary syndrome at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of acute coronary syndrome.","meaning":"Boolean indicating whether the patient has a history of acute coronary syndrome at any time in the past."} ;; "acute coronary syndrome"
(declare-const patient_has_finding_of_acute_coronary_syndrome_inthehistory@@temporalcontext_within4weeks_before_study_infusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of acute coronary syndrome occurred within 4 weeks prior to the study infusion.","when_to_set_to_false":"Set to false if the patient's history of acute coronary syndrome did not occur within 4 weeks prior to the study infusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of acute coronary syndrome occurred within 4 weeks prior to the study infusion.","meaning":"Boolean indicating whether the patient's history of acute coronary syndrome occurred within 4 weeks prior to the study infusion."} ;; "history of acute coronary syndrome within 4 weeks prior to study infusion"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_acute_coronary_syndrome_inthehistory@@temporalcontext_within4weeks_before_study_infusion
      patient_has_finding_of_acute_coronary_syndrome_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "history of acute coronary syndrome within 4 weeks prior to study infusion" implies "history of acute coronary syndrome"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_acute_coronary_syndrome_inthehistory@@temporalcontext_within4weeks_before_study_infusion)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of acute coronary syndrome within 4 weeks prior to study infusion."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_history_of_stem_cell_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of previous stem cell therapy.","when_to_set_to_false":"Set to false if the patient does not have a documented history of previous stem cell therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of previous stem cell therapy.","meaning":"Boolean indicating whether the patient has a history of previous stem cell therapy."} ;; "the patient has a history of previous stem cell therapy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_history_of_stem_cell_therapy)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of previous stem cell therapy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_history_of_radiation_treatment_to_central_thorax Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of radiation treatment delivered to the central thorax.","when_to_set_to_false":"Set to false if the patient does not have a history of radiation treatment delivered to the central thorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of radiation treatment delivered to the central thorax.","meaning":"Boolean indicating whether the patient has a history of radiation treatment delivered to the central thorax."} ;; "the patient has a history of radiation treatment to the central thorax"
(declare-const patient_has_history_of_radiation_treatment_to_left_side_of_thorax Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of radiation treatment delivered to the left side of thorax.","when_to_set_to_false":"Set to false if the patient does not have a history of radiation treatment delivered to the left side of thorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of radiation treatment delivered to the left side of thorax.","meaning":"Boolean indicating whether the patient has a history of radiation treatment delivered to the left side of thorax."} ;; "the patient has a history of radiation treatment to the left side of thorax"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_history_of_radiation_treatment_to_central_thorax)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of radiation treatment to the central thorax."

(assert
(! (not patient_has_history_of_radiation_treatment_to_left_side_of_thorax)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of radiation treatment to the left side of thorax."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_autoimmune_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of autoimmune disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of autoimmune disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of autoimmune disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of autoimmune disease."} ;; "the patient has current systemic autoimmune disease"
(declare-const patient_has_finding_of_autoimmune_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis or finding of autoimmune disease at any time within the previous 5 years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis or finding of autoimmune disease within the previous 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis or finding of autoimmune disease within the previous 5 years.","meaning":"Boolean indicating whether the patient has had a diagnosis or finding of autoimmune disease within the previous 5 years."} ;; "the patient has a history of systemic autoimmune disease within the previous 5 years"
(declare-const patient_has_finding_of_disorder_of_connective_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of connective tissue disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of connective tissue disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of connective tissue disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of connective tissue disease."} ;; "the patient has current connective tissue disease"
(declare-const patient_has_finding_of_disorder_of_connective_tissue_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis or finding of connective tissue disease at any time within the previous 5 years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis or finding of connective tissue disease within the previous 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis or finding of connective tissue disease within the previous 5 years.","meaning":"Boolean indicating whether the patient has had a diagnosis or finding of connective tissue disease within the previous 5 years."} ;; "the patient has a history of connective tissue disease within the previous 5 years"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella terms (for both autoimmune and connective tissue disease)
;; "including but not limited to giant cell myocarditis, cardiac sarcoidosis, systemic sarcoidosis, Dressler's syndrome, chronic recurrent pericarditis, or persistent pericarditis"
(declare-const patient_has_finding_of_giant_cell_myocarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of giant cell myocarditis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of giant cell myocarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of giant cell myocarditis.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of giant cell myocarditis."} ;; "giant cell myocarditis"
(declare-const patient_has_finding_of_cardiac_sarcoidosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of cardiac sarcoidosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of cardiac sarcoidosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of cardiac sarcoidosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of cardiac sarcoidosis."} ;; "cardiac sarcoidosis"
(declare-const patient_has_finding_of_systemic_sarcoidosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of systemic sarcoidosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of systemic sarcoidosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of systemic sarcoidosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of systemic sarcoidosis."} ;; "systemic sarcoidosis"
(declare-const patient_has_finding_of_dresslers_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of Dressler's syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of Dressler's syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of Dressler's syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of Dressler's syndrome."} ;; "Dressler's syndrome"
(declare-const patient_has_finding_of_chronic_recurrent_pericarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of chronic recurrent pericarditis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of chronic recurrent pericarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of chronic recurrent pericarditis.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of chronic recurrent pericarditis."} ;; "chronic recurrent pericarditis"
(declare-const patient_has_finding_of_persistent_pericarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of persistent pericarditis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of persistent pericarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of persistent pericarditis.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of persistent pericarditis."} ;; "persistent pericarditis"

;; Non-exhaustive examples: each example implies either autoimmune or connective tissue disease
(assert
(! (=> (or patient_has_finding_of_giant_cell_myocarditis_now
          patient_has_finding_of_cardiac_sarcoidosis_now
          patient_has_finding_of_systemic_sarcoidosis_now
          patient_has_finding_of_dresslers_syndrome_now
          patient_has_finding_of_chronic_recurrent_pericarditis_now
          patient_has_finding_of_persistent_pericarditis_now)
     (or patient_has_finding_of_autoimmune_disease_now
         patient_has_finding_of_disorder_of_connective_tissue_now))
:named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (giant cell myocarditis, cardiac sarcoidosis, systemic sarcoidosis, Dressler's syndrome, chronic recurrent pericarditis, persistent pericarditis)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_autoimmune_disease_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has current systemic autoimmune disease"

(assert
(! (not patient_has_finding_of_autoimmune_disease_inthepast5years)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of systemic autoimmune disease within the previous 5 years"

(assert
(! (not patient_has_finding_of_disorder_of_connective_tissue_now)
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has current connective tissue disease"

(assert
(! (not patient_has_finding_of_disorder_of_connective_tissue_inthepast5years)
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has a history of connective tissue disease within the previous 5 years"

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_immunosuppressant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to immunosuppressant substances at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been exposed to immunosuppressant substances prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to immunosuppressant substances.","meaning":"Boolean indicating whether the patient has a history of exposure to immunosuppressant substances."} ;; "the patient has a history of treatment with immunosuppressive agents"
(declare-const patient_is_exposed_to_immunosuppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to immunosuppressant substances.","when_to_set_to_false":"Set to false if the patient is not currently exposed to immunosuppressant substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to immunosuppressant substances.","meaning":"Boolean indicating whether the patient is currently exposed to immunosuppressant substances."} ;; "the patient has current treatment with immunosuppressive agents"
(declare-const patient_is_exposed_to_anti_inflammatory_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to anti-inflammatory agents at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been exposed to anti-inflammatory agents prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to anti-inflammatory agents.","meaning":"Boolean indicating whether the patient has a history of exposure to anti-inflammatory agents."} ;; "the patient has a history of treatment with anti-inflammatory agents"
(declare-const patient_is_exposed_to_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to anti-inflammatory agents.","when_to_set_to_false":"Set to false if the patient is not currently exposed to anti-inflammatory agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to anti-inflammatory agents.","meaning":"Boolean indicating whether the patient is currently exposed to anti-inflammatory agents."} ;; "the patient has current treatment with anti-inflammatory agents"
(declare-const patient_is_exposed_to_other_agent_for_systemic_immunologic_reaction_inthehistory_within_3_months_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment.","when_to_set_to_false":"Set to false if the patient does not have a history of treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment.","meaning":"Boolean indicating whether the patient has a history of treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment."} ;; "the patient has a history of treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment"
(declare-const patient_is_exposed_to_other_agent_for_systemic_immunologic_reaction_now_within_3_months_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment.","when_to_set_to_false":"Set to false if the patient is not currently receiving treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment.","meaning":"Boolean indicating whether the patient is currently receiving treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment."} ;; "the patient has current treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking corticosteroid or corticosteroid derivative containing products.","when_to_set_to_false":"Set to false if the patient is not currently taking corticosteroid or corticosteroid derivative containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking corticosteroid or corticosteroid derivative containing products.","meaning":"Boolean indicating whether the patient is currently taking corticosteroid or corticosteroid derivative containing products."} ;; "chronic systemic corticosteroids"
(declare-const patient_is_taking_pharmaceutical_biologic_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking pharmaceutical biologic products.","when_to_set_to_false":"Set to false if the patient is not currently taking pharmaceutical biologic products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking pharmaceutical biologic products.","meaning":"Boolean indicating whether the patient is currently taking pharmaceutical biologic products."} ;; "biologic agents targeting the immune system"
(declare-const patient_is_taking_pharmaceutical_biologic_product_now@@targets_immune_system Bool) ;; {"when_to_set_to_true":"Set to true if the pharmaceutical biologic products currently taken by the patient target the immune system.","when_to_set_to_false":"Set to false if the pharmaceutical biologic products currently taken by the patient do not target the immune system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pharmaceutical biologic products currently taken by the patient target the immune system.","meaning":"Boolean indicating whether the pharmaceutical biologic products currently taken by the patient target the immune system."} ;; "biologic agents targeting the immune system"
(declare-const patient_is_exposed_to_antineoplastic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antineoplastic agents.","when_to_set_to_false":"Set to false if the patient is not currently exposed to antineoplastic agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antineoplastic agents.","meaning":"Boolean indicating whether the patient is currently exposed to antineoplastic agents."} ;; "anti-tumor drugs"
(declare-const patient_is_exposed_to_anti_neoplastic_drug_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to anti-neoplastic drugs at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been exposed to anti-neoplastic drugs prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to anti-neoplastic drugs.","meaning":"Boolean indicating whether the patient has a history of exposure to anti-neoplastic drugs."} ;; "anti-neoplastic drugs"
(declare-const patient_is_exposed_to_anti_neoplastic_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to anti-neoplastic drugs.","when_to_set_to_false":"Set to false if the patient is not currently exposed to anti-neoplastic drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to anti-neoplastic drugs.","meaning":"Boolean indicating whether the patient is currently exposed to anti-neoplastic drugs."} ;; "anti-neoplastic drugs"
(declare-const patient_is_exposed_to_chemotherapeutic_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to chemotherapeutic agents at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been exposed to chemotherapeutic agents prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to chemotherapeutic agents.","meaning":"Boolean indicating whether the patient has a history of exposure to chemotherapeutic agents."} ;; "chemotherapeutic agents"
(declare-const patient_is_exposed_to_chemotherapeutic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to chemotherapeutic agents.","when_to_set_to_false":"Set to false if the patient is not currently exposed to chemotherapeutic agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to chemotherapeutic agents.","meaning":"Boolean indicating whether the patient is currently exposed to chemotherapeutic agents."} ;; "chemotherapeutic agents"
(declare-const patient_is_exposed_to_angiogenesis_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to angiogenesis inhibitors.","when_to_set_to_false":"Set to false if the patient is not currently exposed to angiogenesis inhibitors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to angiogenesis inhibitors.","meaning":"Boolean indicating whether the patient is currently exposed to angiogenesis inhibitors."} ;; "anti-vascular endothelial growth factor drugs"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply the "other agents to treat manifestations of systemic immunologic reactions" category
(assert
(! (=> (or patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now
           patient_is_taking_pharmaceutical_biologic_product_now@@targets_immune_system
           patient_is_exposed_to_antineoplastic_agent_now
           patient_is_exposed_to_anti_neoplastic_drug_now
           patient_is_exposed_to_angiogenesis_inhibitor_now
           patient_is_exposed_to_chemotherapeutic_agent_now)
        patient_is_exposed_to_other_agent_for_systemic_immunologic_reaction_now_within_3_months_prior_to_enrollment)
   :named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (chronic systemic corticosteroids, biologic agents targeting the immune system, anti-tumor drugs, anti-neoplastic drugs, anti-vascular endothelial growth factor drugs, chemotherapeutic agents)"

;; Qualifier variable implies stem variable for biologic agents
(assert
(! (=> patient_is_taking_pharmaceutical_biologic_product_now@@targets_immune_system
       patient_is_taking_pharmaceutical_biologic_product_now)
   :named REQ7_AUXILIARY1)) ;; "biologic agents targeting the immune system"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_immunosuppressant_inthehistory)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of treatment with immunosuppressive agents."

(assert
(! (not patient_is_exposed_to_immunosuppressant_now)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current treatment with immunosuppressive agents."

(assert
(! (not patient_is_exposed_to_anti_inflammatory_agent_inthehistory)
   :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of treatment with anti-inflammatory agents."

(assert
(! (not patient_is_exposed_to_anti_inflammatory_agent_now)
   :named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current treatment with anti-inflammatory agents."

(assert
(! (not patient_is_exposed_to_other_agent_for_systemic_immunologic_reaction_inthehistory_within_3_months_prior_to_enrollment)
   :named REQ7_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment."

(assert
(! (not patient_is_exposed_to_other_agent_for_systemic_immunologic_reaction_now_within_3_months_prior_to_enrollment)
   :named REQ7_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current treatment with other agents to treat manifestations of systemic immunologic reactions within 3 months prior to enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_implantation_of_internal_cardiac_defibrillator_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone implantation of an internal cardiac defibrillator (ICD) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone implantation of an internal cardiac defibrillator (ICD) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone implantation of an internal cardiac defibrillator (ICD).","meaning":"Boolean indicating whether the patient has ever undergone implantation of an internal cardiac defibrillator (ICD) at any time in the past."} ;; "prior implantable cardioverter-defibrillator placement"
(declare-const patient_has_undergone_insertion_of_intracardiac_pacemaker_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone insertion of an intracardiac pacemaker at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone insertion of an intracardiac pacemaker at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone insertion of an intracardiac pacemaker.","meaning":"Boolean indicating whether the patient has ever undergone insertion of an intracardiac pacemaker at any time in the past."} ;; "prior pacemaker placement"
(declare-const patient_can_undergo_cardiac_mri_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo cardiac magnetic resonance imaging (MRI).","when_to_set_to_false":"Set to false if the patient cannot currently undergo cardiac magnetic resonance imaging (MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo cardiac magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient can currently undergo cardiac magnetic resonance imaging (MRI)."} ;; "cardiac magnetic resonance imaging"
(declare-const patient_can_undergo_cardiac_mri_now@@site_trained_and_certified_for_protocol_in_subjects_with_icd_or_pacemaker Bool) ;; {"when_to_set_to_true":"Set to true if the study imaging site has been trained and certified specifically for this protocol to conduct cardiac MRI in subjects with ICD or pacemaker placement.","when_to_set_to_false":"Set to false if the study imaging site has NOT been trained and certified specifically for this protocol to conduct cardiac MRI in subjects with ICD or pacemaker placement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the study imaging site has been trained and certified for this protocol in subjects with ICD or pacemaker placement.","meaning":"Boolean indicating whether the study imaging site has been trained and certified specifically for this protocol in subjects with ICD or pacemaker placement."} ;; "the study imaging site has NOT been trained AND certified specifically for this protocol to conduct cardiac magnetic resonance imaging in subjects with implantable cardioverter-defibrillator placement OR pacemaker placement"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_can_undergo_cardiac_mri_now@@site_trained_and_certified_for_protocol_in_subjects_with_icd_or_pacemaker
       patient_can_undergo_cardiac_mri_now)
   :named REQ8_AUXILIARY0)) ;; "the study imaging site has been trained and certified specifically for this protocol to conduct cardiac MRI in subjects with ICD or pacemaker placement"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion 1: prior ICD placement
(assert
(! (not patient_has_undergone_implantation_of_internal_cardiac_defibrillator_inthehistory)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior implantable cardioverter-defibrillator placement."

;; Exclusion 2: prior pacemaker placement AND site NOT trained/certified for protocol
(assert
(! (not (and patient_has_undergone_insertion_of_intracardiac_pacemaker_inthehistory
             (not patient_can_undergo_cardiac_mri_now@@site_trained_and_certified_for_protocol_in_subjects_with_icd_or_pacemaker)))
   :named REQ8_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has prior pacemaker placement AND the study imaging site has NOT been trained AND certified specifically for this protocol to conduct cardiac magnetic resonance imaging in subjects with implantable cardioverter-defibrillator placement OR pacemaker placement."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_pacemaker_generator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pacemaker generator implanted.","when_to_set_to_false":"Set to false if the patient currently does not have a pacemaker generator implanted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pacemaker generator implanted.","meaning":"Boolean indicating whether the patient currently has a pacemaker generator implanted."} ;; "the patient has a pacemaker generator"

(declare-const patient_has_implantable_cardioverter_defibrillator_generator_with_any_mri_contraindicating_limitation_or_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implantable cardioverter-defibrillator generator with any limitation or condition that would contraindicate MRI, including: manufactured before the year 2000, leads implanted less than 6 weeks prior to signing informed consent, non-transvenous epicardial leads, abandoned leads, no-fixation leads, subcutaneous ICDs, leadless pacemakers, or any other condition that, in the judgement of device-trained staff, would deem MRI contraindicated.","when_to_set_to_false":"Set to false if the patient currently has an implantable cardioverter-defibrillator generator and none of the listed limitations or conditions are present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implantable cardioverter-defibrillator generator with any MRI contraindicating limitation or condition.","meaning":"Boolean indicating whether the patient currently has an implantable cardioverter-defibrillator generator with any MRI contraindicating limitation or condition."} ;; "the patient has an implantable cardioverter-defibrillator generator with any of the following limitations or conditions: ..."

(declare-const icd_generator_year_of_manufacture_value_recorded_now_withunit_year Real) ;; {"when_to_set_to_value":"Set to the year (in 4-digit format, e.g., 1999) in which the patient's current ICD generator was manufactured.","when_to_set_to_null":"Set to null if the year of manufacture of the patient's current ICD generator is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the year of manufacture of the patient's current ICD generator."} ;; "manufactured before the year 2000"

(declare-const icd_lead_implantation_to_consent_interval_value_recorded_now_withunit_week Real) ;; {"when_to_set_to_value":"Set to the number of weeks between the implantation of the ICD leads and the signing of informed consent.","when_to_set_to_null":"Set to null if the interval in weeks between ICD lead implantation and signing of informed consent is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of weeks between ICD lead implantation and signing of informed consent."} ;; "leads implanted less than 6 weeks prior to signing informed consent"

(declare-const patient_has_nontransvenous_epicardial_icd_leads_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has non-transvenous epicardial ICD leads.","when_to_set_to_false":"Set to false if the patient currently does not have non-transvenous epicardial ICD leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has non-transvenous epicardial ICD leads.","meaning":"Boolean indicating whether the patient currently has non-transvenous epicardial ICD leads."} ;; "non-transvenous epicardial leads"

(declare-const patient_has_abandoned_icd_leads_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abandoned ICD leads.","when_to_set_to_false":"Set to false if the patient currently does not have abandoned ICD leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abandoned ICD leads.","meaning":"Boolean indicating whether the patient currently has abandoned ICD leads."} ;; "abandoned leads"

(declare-const patient_has_no_fixation_icd_leads_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has no-fixation ICD leads.","when_to_set_to_false":"Set to false if the patient currently does not have no-fixation ICD leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has no-fixation ICD leads.","meaning":"Boolean indicating whether the patient currently has no-fixation ICD leads."} ;; "no-fixation leads"

(declare-const patient_has_subcutaneous_icd_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a subcutaneous ICD.","when_to_set_to_false":"Set to false if the patient currently does not have a subcutaneous ICD.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a subcutaneous ICD.","meaning":"Boolean indicating whether the patient currently has a subcutaneous ICD."} ;; "subcutaneous implantable cardioverter-defibrillators"

(declare-const patient_has_leadless_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a leadless pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a leadless pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a leadless pacemaker.","meaning":"Boolean indicating whether the patient currently has a leadless pacemaker."} ;; "leadless pacemakers"

(declare-const patient_has_icd_with_other_mri_contraindicating_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an ICD with any other condition that, in the judgement of device-trained staff, would deem MRI contraindicated.","when_to_set_to_false":"Set to false if the patient currently has an ICD and there is no other condition that would deem MRI contraindicated in the judgement of device-trained staff.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an ICD with any other MRI contraindicating condition in the judgement of device-trained staff.","meaning":"Boolean indicating whether the patient currently has an ICD with any other MRI contraindicating condition in the judgement of device-trained staff."} ;; "any other condition that, in the judgement of device-trained staff, would deem a magnetic resonance imaging contraindicated"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition: ICD generator with any MRI contraindicating limitation or condition
(assert
(! (= patient_has_implantable_cardioverter_defibrillator_generator_with_any_mri_contraindicating_limitation_or_condition_now
     (or
       (< icd_generator_year_of_manufacture_value_recorded_now_withunit_year 2000) ;; "manufactured before the year 2000"
       (< icd_lead_implantation_to_consent_interval_value_recorded_now_withunit_week 6) ;; "leads implanted less than 6 weeks prior to signing informed consent"
       patient_has_nontransvenous_epicardial_icd_leads_now ;; "non-transvenous epicardial leads"
       patient_has_abandoned_icd_leads_now ;; "abandoned leads"
       patient_has_no_fixation_icd_leads_now ;; "no-fixation leads"
       patient_has_subcutaneous_icd_now ;; "subcutaneous implantable cardioverter-defibrillators"
       patient_has_leadless_pacemaker_now ;; "leadless pacemakers"
       patient_has_icd_with_other_mri_contraindicating_condition_now ;; "any other condition that, in the judgement of device-trained staff, would deem a magnetic resonance imaging contraindicated"
     ))
:named REQ9_AUXILIARY0)) ;; "with any of the following limitations or conditions: ..."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_pacemaker_generator_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a pacemaker generator."

(assert
(! (not patient_has_implantable_cardioverter_defibrillator_generator_with_any_mri_contraindicating_limitation_or_condition_now)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an implantable cardioverter-defibrillator generator with any of the following limitations or conditions: ..."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_pacemaker_dependent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pacemaker-dependent.","when_to_set_to_false":"Set to false if the patient is currently not pacemaker-dependent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pacemaker-dependent.","meaning":"Boolean indicating whether the patient is currently pacemaker-dependent."} ;; "the patient is pacemaker-dependent"
(declare-const patient_has_implantable_cardioverter_defibrillator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implantable cardioverter-defibrillator.","when_to_set_to_false":"Set to false if the patient currently does not have an implantable cardioverter-defibrillator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implantable cardioverter-defibrillator.","meaning":"Boolean indicating whether the patient currently has an implantable cardioverter-defibrillator."} ;; "the patient has an implantable cardioverter-defibrillator"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (and patient_is_pacemaker_dependent_now
             patient_has_implantable_cardioverter_defibrillator_now))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pacemaker-dependent) AND (the patient has an implantable cardioverter-defibrillator)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const cardiac_resynchronization_therapy_device_implantation_to_informed_consent_interval_value_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months between the date of cardiac resynchronization therapy device implantation and the date of signing informed consent.","when_to_set_to_null":"Set to null if either date is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the interval in months between cardiac resynchronization therapy device implantation and signing informed consent."} ;; "implanted less than three months prior to signing informed consent"
(declare-const patient_has_cardiac_resynchronization_therapy_device_implanted_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a cardiac resynchronization therapy device implanted at any time in the history.","when_to_set_to_false":"Set to false if the patient has never had a cardiac resynchronization therapy device implanted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a cardiac resynchronization therapy device implanted in the history.","meaning":"Boolean indicating whether the patient has a cardiac resynchronization therapy device implanted in the history."} ;; "has a cardiac resynchronization therapy device implanted"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (and patient_has_cardiac_resynchronization_therapy_device_implanted_in_the_history
             (< cardiac_resynchronization_therapy_device_implantation_to_informed_consent_interval_value_in_months 3)))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cardiac resynchronization therapy device implanted less than three months prior to signing informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's glomerular filtration rate (GFR) in milliliters per minute is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's glomerular filtration rate (GFR) measured now, in milliliters per minute."} ;; "glomerular filtration rate"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute 30))
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an estimated glomerular filtration rate less than thirty milliliters per minute."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to a drug or medicament."} ;; "drug"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@is_experimental_and_studied_in_ongoing_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament that is experimental and is being studied in an ongoing protocol.","when_to_set_to_false":"Set to false if the patient is currently exposed to a drug or medicament that is not experimental or not being studied in an ongoing protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug is experimental and being studied in an ongoing protocol.","meaning":"Boolean indicating whether the patient is currently exposed to a drug or medicament that is experimental and is being studied in an ongoing protocol."} ;; "the patient is participating in an ongoing protocol studying an experimental drug"
(declare-const patient_is_exposed_to_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a device.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a device.","meaning":"Boolean indicating whether the patient is currently exposed to a device."} ;; "device"
(declare-const patient_is_exposed_to_device_now@@is_experimental_and_studied_in_ongoing_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a device that is experimental and is being studied in an ongoing protocol.","when_to_set_to_false":"Set to false if the patient is currently exposed to a device that is not experimental or not being studied in an ongoing protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the device is experimental and being studied in an ongoing protocol.","meaning":"Boolean indicating whether the patient is currently exposed to a device that is experimental and is being studied in an ongoing protocol."} ;; "the patient is participating in an ongoing protocol studying an experimental device"
(declare-const patient_has_undergone_clinical_trial_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical trial within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical trial within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical trial within the past thirty days.","meaning":"Boolean indicating whether the patient has undergone a clinical trial within the past thirty days."} ;; "clinical trial"
(declare-const patient_has_undergone_clinical_trial_inthepast30days@@is_interventional Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an interventional clinical trial within the past thirty days.","when_to_set_to_false":"Set to false if the patient has undergone a clinical trial within the past thirty days that is not interventional.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial is interventional.","meaning":"Boolean indicating whether the patient has undergone an interventional clinical trial within the past thirty days."} ;; "the patient has participated in an interventional clinical trial within the last thirty days"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@is_experimental_and_studied_in_ongoing_protocol
      patient_is_exposed_to_drug_or_medicament_now)
    :named REQ13_AUXILIARY0)) ;; "the patient is participating in an ongoing protocol studying an experimental drug"

(assert
(! (=> patient_is_exposed_to_device_now@@is_experimental_and_studied_in_ongoing_protocol
      patient_is_exposed_to_device_now)
    :named REQ13_AUXILIARY1)) ;; "the patient is participating in an ongoing protocol studying an experimental device"

(assert
(! (=> patient_has_undergone_clinical_trial_inthepast30days@@is_interventional
      patient_has_undergone_clinical_trial_inthepast30days)
    :named REQ13_AUXILIARY2)) ;; "the patient has participated in an interventional clinical trial within the last thirty days"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_now@@is_experimental_and_studied_in_ongoing_protocol
            patient_is_exposed_to_device_now@@is_experimental_and_studied_in_ongoing_protocol
            patient_has_undergone_clinical_trial_inthepast30days@@is_interventional))
    :named REQ13_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is participating in an ongoing protocol studying an experimental drug) OR (the patient is participating in an ongoing protocol studying an experimental device) OR (the patient has participated in an interventional clinical trial within the last thirty days)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_diagnosis_of_arrhythmogenic_right_ventricular_dysplasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of arrhythmogenic right ventricular dysplasia (ARVD/ARVC).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of arrhythmogenic right ventricular dysplasia (ARVD/ARVC).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of arrhythmogenic right ventricular dysplasia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of arrhythmogenic right ventricular dysplasia."} ;; "arrhythmogenic right ventricular cardiomyopathy"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_diagnosis_of_arrhythmogenic_right_ventricular_dysplasia_now)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of arrhythmogenic right ventricular cardiomyopathy."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "the patient has current alcohol abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has drug abuse.","meaning":"Boolean indicating whether the patient currently has drug abuse."} ;; "the patient has current drug abuse"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current alcohol abuse."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current drug abuse."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is nursing"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented or reported as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented or reported as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is a woman"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently considered not to have childbearing potential as documented or reported.","when_to_set_to_null":"Set to null if the patient's current childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is a woman of child-bearing potential"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@at_least_two_forms_used Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using at least two forms of contraception.","when_to_set_to_false":"Set to false if the patient is currently using fewer than two forms of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using at least two forms of contraception.","meaning":"Boolean indicating whether the patient is currently using at least two forms of contraception."} ;; "at least two forms of contraception"
(declare-const patient_has_finding_of_contraception_now@@active_and_highly_reliable Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and the methods used are active and highly reliable.","when_to_set_to_false":"Set to false if the patient is currently using contraception but the methods are not active and highly reliable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception methods used are active and highly reliable.","meaning":"Boolean indicating whether the contraception methods used are active and highly reliable."} ;; "active and highly reliable contraception"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_contraception_now@@at_least_two_forms_used
      patient_has_finding_of_contraception_now)
:named REQ16_AUXILIARY0)) ;; "at least two forms of contraception"

(assert
(! (=> patient_has_finding_of_contraception_now@@active_and_highly_reliable
      patient_has_finding_of_contraception_now)
:named REQ16_AUXILIARY1)) ;; "active and highly reliable contraception"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: patient is pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; Exclusion: patient is nursing
(assert
(! (not patient_is_breastfeeding_now)
:named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing."

;; Exclusion: patient is a woman of child-bearing potential AND does NOT agree to use at least two forms of active and highly reliable contraception
(assert
(! (not (and patient_sex_is_female_now
             patient_has_childbearing_potential_now
             (not (and patient_has_finding_of_contraception_now@@at_least_two_forms_used
                       patient_has_finding_of_contraception_now@@active_and_highly_reliable))))
:named REQ16_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a woman of child-bearing potential AND the patient does NOT agree to use at least two forms of active and highly reliable contraception."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Human Immunodeficiency Virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Human Immunodeficiency Virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Human Immunodeficiency Virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Human Immunodeficiency Virus infection."} ;; "Human Immunodeficiency Virus infection"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
  (! (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now)
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Human Immunodeficiency Virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_diagnosis_of_viral_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of viral hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of viral hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of viral hepatitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of viral hepatitis."} ;; "viral hepatitis"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_diagnosis_of_viral_hepatitis_now)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has viral hepatitis."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const hemoglobin_a1c_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the value of the patient's most recent hemoglobin A1c measurement in percent (%).","when_to_set_to_null":"Set to null if the patient's most recent hemoglobin A1c measurement is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's most recent hemoglobin A1c measurement in percent (%)."} ;; "hemoglobin A1c greater than nine percent"

(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncontrolled diabetes (poorly controlled diabetes).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncontrolled diabetes (poorly controlled diabetes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled diabetes (poorly controlled diabetes).","meaning":"Boolean indicating whether the patient currently has uncontrolled diabetes (poorly controlled diabetes)."} ;; "uncontrolled diabetes"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Definition: uncontrolled diabetes = hemoglobin A1c > 9%
(assert
(! (= patient_has_finding_of_diabetic_poor_control_now
     (> hemoglobin_a1c_value_recorded_now_withunit_percent 9))
   :named REQ19_AUXILIARY0)) ;; "uncontrolled diabetes (hemoglobin A1c greater than nine percent)."

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_diabetic_poor_control_now)
   :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled diabetes (hemoglobin A1c greater than nine percent)."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const sgpt_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the patient's current SGPT value in U/L if available.","when_to_set_to_null":"Set to null if the patient's current SGPT value in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current SGPT in U/L."} ;; "serum glutamic pyruvic transaminase [SGPT] > 3 times the upper reference range"
(declare-const sgpt_upper_reference_range_value_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the upper reference range value for SGPT in U/L if available.","when_to_set_to_null":"Set to null if the upper reference range value for SGPT in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the upper reference range for SGPT in U/L."} ;; "serum glutamic pyruvic transaminase [SGPT] > 3 times the upper reference range"
(declare-const alt_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the patient's current ALT value in U/L if available.","when_to_set_to_null":"Set to null if the patient's current ALT value in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current ALT in U/L."} ;; "alanine aminotransferase [ALT] > 3 times the upper reference range"
(declare-const alt_upper_reference_range_value_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the upper reference range value for ALT in U/L if available.","when_to_set_to_null":"Set to null if the upper reference range value for ALT in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the upper reference range for ALT in U/L."} ;; "alanine aminotransferase [ALT] > 3 times the upper reference range"
(declare-const patient_has_finding_of_abnormal_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abnormal liver function.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abnormal liver function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal liver function.","meaning":"Boolean indicating whether the patient currently has abnormal liver function."} ;; "abnormal liver function"
(declare-const patient_has_finding_of_abnormal_liver_function_now@@abnormality_does_not_have_reversible_identifiable_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal liver function does NOT have a reversible, identifiable cause.","when_to_set_to_false":"Set to false if the patient's abnormal liver function does have a reversible, identifiable cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal liver function has a reversible, identifiable cause.","meaning":"Boolean indicating whether the patient's abnormal liver function does NOT have a reversible, identifiable cause."} ;; "the abnormality does NOT have a reversible, identifiable cause"
(declare-const hematocrit_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the patient's current hematocrit value in percent if available.","when_to_set_to_null":"Set to null if the patient's current hematocrit value in percent is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current hematocrit in percent."} ;; "hematocrit < 25%"
(declare-const wbc_count_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the patient's current WBC count in cells per microliter if available.","when_to_set_to_null":"Set to null if the patient's current WBC count in cells per microliter is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current WBC count in cells per microliter."} ;; "white blood cell count < 3000 per microliter"
(declare-const platelet_count_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the patient's current platelet count in cells per microliter if available.","when_to_set_to_null":"Set to null if the patient's current platelet count in cells per microliter is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current platelet count in cells per microliter."} ;; "platelet count < 100,000 per microliter"
(declare-const patient_has_finding_of_abnormal_blood_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abnormal hematology studies.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abnormal hematology studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal hematology studies.","meaning":"Boolean indicating whether the patient currently has abnormal hematology studies."} ;; "abnormal hematology studies"
(declare-const patient_has_finding_of_abnormal_blood_test_now@@abnormality_does_not_have_reversible_identifiable_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal hematology studies do NOT have a reversible, identifiable cause.","when_to_set_to_false":"Set to false if the patient's abnormal hematology studies do have a reversible, identifiable cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal hematology studies have a reversible, identifiable cause.","meaning":"Boolean indicating whether the patient's abnormal hematology studies do NOT have a reversible, identifiable cause."} ;; "the abnormality does NOT have a reversible, identifiable cause"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Abnormal liver function defined by SGPT or ALT criteria
(assert
(! (= patient_has_finding_of_abnormal_liver_function_now
(or (> sgpt_value_recorded_now_withunit_u_per_l (* 3 sgpt_upper_reference_range_value_withunit_u_per_l))
    (> alt_value_recorded_now_withunit_u_per_l (* 3 alt_upper_reference_range_value_withunit_u_per_l))))
:named REQ20_AUXILIARY0)) ;; "serum glutamic pyruvic transaminase [SGPT] > 3 times the upper reference range OR alanine aminotransferase [ALT] > 3 times the upper reference range"

;; Abnormal hematology studies defined by any of the three criteria
(assert
(! (= patient_has_finding_of_abnormal_blood_test_now
(or (< hematocrit_value_recorded_now_withunit_percent 25)
    (< wbc_count_value_recorded_now_withunit_per_microliter 3000)
    (< platelet_count_value_recorded_now_withunit_per_microliter 100000)))
:named REQ20_AUXILIARY1)) ;; "hematocrit < 25% OR white blood cell count < 3000 per microliter OR platelet count < 100,000 per microliter"

;; Qualifier variables imply corresponding stem variables (liver function)
(assert
(! (=> patient_has_finding_of_abnormal_liver_function_now@@abnormality_does_not_have_reversible_identifiable_cause
       patient_has_finding_of_abnormal_liver_function_now)
:named REQ20_AUXILIARY2)) ;; "the abnormality does NOT have a reversible, identifiable cause (liver function)"

;; Qualifier variables imply corresponding stem variables (hematology)
(assert
(! (=> patient_has_finding_of_abnormal_blood_test_now@@abnormality_does_not_have_reversible_identifiable_cause
       patient_has_finding_of_abnormal_blood_test_now)
:named REQ20_AUXILIARY3)) ;; "the abnormality does NOT have a reversible, identifiable cause (hematology)"

;; ===================== Constraint Assertions (REQ 20) =====================
;; Exclusion: patient must NOT have abnormal liver function without reversible, identifiable cause
(assert
(! (not patient_has_finding_of_abnormal_liver_function_now@@abnormality_does_not_have_reversible_identifiable_cause)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormal liver function ... AND the abnormality does NOT have a reversible, identifiable cause."

;; Exclusion: patient must NOT have abnormal hematology studies without reversible, identifiable cause
(assert
(! (not patient_has_finding_of_abnormal_blood_test_now@@abnormality_does_not_have_reversible_identifiable_cause)
:named REQ20_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormal hematology studies ... AND the abnormality does NOT have a reversible, identifiable cause."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_finding_of_sustained_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sustained ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sustained ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sustained ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has sustained ventricular tachycardia."} ;; "sustained ventricular tachycardia"

(declare-const patient_has_finding_of_nonsustained_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of non-sustained ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of non-sustained ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has non-sustained ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has non-sustained ventricular tachycardia."} ;; "non-sustained ventricular tachycardia"

(declare-const patient_nonsustained_ventricular_tachycardia_value_recorded_now_withunit_beats Real) ;; {"when_to_set_to_value":"Set to the measured number of beats if a numeric measurement of non-sustained ventricular tachycardia episode is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the number of beats in the patient's current episode of non-sustained ventricular tachycardia."} ;; "non-sustained ventricular tachycardia greater than 30 beats"

(declare-const patient_has_finding_of_nonsustained_ventricular_tachycardia_now@@not_associated_with_acute_phase_of_previous_myocardial_infarction_within_48_hours_after_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current non-sustained ventricular tachycardia episode is NOT associated with the acute phase of a previous myocardial infarction (within 48 hours after onset).","when_to_set_to_false":"Set to false if the episode IS associated with the acute phase of a previous myocardial infarction (within 48 hours after onset).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the episode is associated with the acute phase of a previous myocardial infarction (within 48 hours after onset).","meaning":"Boolean indicating whether the patient's current non-sustained ventricular tachycardia episode is NOT associated with the acute phase of a previous myocardial infarction (within 48 hours after onset)."} ;; "the non-sustained ventricular tachycardia is NOT associated with the acute phase of a previous myocardial infarction (defined as within 48 hours after the myocardial infarction onset)"

(declare-const patient_has_finding_of_nonsustained_ventricular_tachycardia_now@@not_associated_with_new_acute_ischemic_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current non-sustained ventricular tachycardia episode is NOT associated with a new acute ischemic episode.","when_to_set_to_false":"Set to false if the episode IS associated with a new acute ischemic episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the episode is associated with a new acute ischemic episode.","meaning":"Boolean indicating whether the patient's current non-sustained ventricular tachycardia episode is NOT associated with a new acute ischemic episode."} ;; "the non-sustained ventricular tachycardia is NOT associated with a new acute ischemic episode"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_nonsustained_ventricular_tachycardia_now@@not_associated_with_acute_phase_of_previous_myocardial_infarction_within_48_hours_after_onset
      patient_has_finding_of_nonsustained_ventricular_tachycardia_now)
    :named REQ21_AUXILIARY0)) ;; "the non-sustained ventricular tachycardia is NOT associated with the acute phase of a previous myocardial infarction (defined as within 48 hours after the myocardial infarction onset)"

(assert
(! (=> patient_has_finding_of_nonsustained_ventricular_tachycardia_now@@not_associated_with_new_acute_ischemic_episode
      patient_has_finding_of_nonsustained_ventricular_tachycardia_now)
    :named REQ21_AUXILIARY1)) ;; "the non-sustained ventricular tachycardia is NOT associated with a new acute ischemic episode"

;; ===================== Constraint Assertions (REQ 21) =====================
;; Exclusion 1: sustained ventricular tachycardia
(assert
(! (not patient_has_finding_of_sustained_ventricular_tachycardia_now)
    :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sustained ventricular tachycardia."

;; Exclusion 2: non-sustained VT >30 beats, not associated with acute MI phase or new acute ischemic episode
(assert
(! (not (and patient_has_finding_of_nonsustained_ventricular_tachycardia_now
             (> patient_nonsustained_ventricular_tachycardia_value_recorded_now_withunit_beats 30)
             patient_has_finding_of_nonsustained_ventricular_tachycardia_now@@not_associated_with_acute_phase_of_previous_myocardial_infarction_within_48_hours_after_onset
             patient_has_finding_of_nonsustained_ventricular_tachycardia_now@@not_associated_with_new_acute_ischemic_episode))
    :named REQ21_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-sustained ventricular tachycardia greater than 30 beats AND the non-sustained ventricular tachycardia is NOT associated with the acute phase of a previous myocardial infarction (defined as within 48 hours after the myocardial infarction onset) AND the non-sustained ventricular tachycardia is NOT associated with a new acute ischemic episode."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_ventricular_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventricular fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventricular fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ventricular fibrillation.","meaning":"Boolean indicating whether the patient currently has ventricular fibrillation."} ;; "the patient has ventricular fibrillation"
(declare-const patient_has_finding_of_ventricular_fibrillation_now@@not_associated_with_new_acute_ischemic_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ventricular fibrillation is NOT associated with a new acute ischemic episode.","when_to_set_to_false":"Set to false if the patient's current ventricular fibrillation IS associated with a new acute ischemic episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ventricular fibrillation is associated with a new acute ischemic episode.","meaning":"Boolean indicating whether the patient's current ventricular fibrillation is NOT associated with a new acute ischemic episode."} ;; "the ventricular fibrillation is NOT associated with a new acute ischemic episode"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_ventricular_fibrillation_now@@not_associated_with_new_acute_ischemic_episode
      patient_has_finding_of_ventricular_fibrillation_now)
   :named REQ22_AUXILIARY0)) ;; "the ventricular fibrillation is NOT associated with a new acute ischemic episode"

;; ===================== Constraint Assertions (REQ 22) =====================
;; Exclusion: patient must NOT have ventricular fibrillation not associated with a new acute ischemic episode
(assert
(! (not (and patient_has_finding_of_ventricular_fibrillation_now
             patient_has_finding_of_ventricular_fibrillation_now@@not_associated_with_new_acute_ischemic_episode))
   :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has ventricular fibrillation) AND (the ventricular fibrillation is NOT associated with a new acute ischemic episode))."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congestive heart failure is classified as New York Heart Association Class IV.","when_to_set_to_false":"Set to false if the patient's congestive heart failure is not classified as New York Heart Association Class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure is classified as NYHA Class IV.","meaning":"Boolean indicating whether the patient's congestive heart failure is classified as New York Heart Association Class IV."} ;; "New York Heart Association Class IV congestive heart failure"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@nyha_class_iv
      patient_has_finding_of_congestive_heart_failure_now)
:named REQ23_AUXILIARY0)) ;; "New York Heart Association Class IV congestive heart failure"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not patient_has_finding_of_congestive_heart_failure_now@@nyha_class_iv)
:named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has New York Heart Association Class IV congestive heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_has_finding_of_tumor_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of a tumor.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of a tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of a tumor.","meaning":"Boolean indicating whether the patient currently has evidence of a tumor."} ;; "tumor"

(declare-const patient_has_finding_of_tumor_finding_now@@detected_on_screening_chest_computed_tomography_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tumor finding is detected on a screening chest computed tomography scan.","when_to_set_to_false":"Set to false if the patient's tumor finding is not detected on a screening chest computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumor finding is detected on a screening chest computed tomography scan.","meaning":"Boolean indicating whether the patient's tumor finding is detected on a screening chest computed tomography scan."} ;; "the patient has evidence of tumor on screening chest computed tomography scan"

(declare-const patient_has_finding_of_tumor_finding_now@@detected_on_screening_abdominal_computed_tomography_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tumor finding is detected on a screening abdominal computed tomography scan.","when_to_set_to_false":"Set to false if the patient's tumor finding is not detected on a screening abdominal computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumor finding is detected on a screening abdominal computed tomography scan.","meaning":"Boolean indicating whether the patient's tumor finding is detected on a screening abdominal computed tomography scan."} ;; "the patient has evidence of tumor on screening abdominal computed tomography scan"

(declare-const patient_has_finding_of_tumor_finding_now@@detected_on_screening_pelvic_computed_tomography_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tumor finding is detected on a screening pelvic computed tomography scan.","when_to_set_to_false":"Set to false if the patient's tumor finding is not detected on a screening pelvic computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumor finding is detected on a screening pelvic computed tomography scan.","meaning":"Boolean indicating whether the patient's tumor finding is detected on a screening pelvic computed tomography scan."} ;; "the patient has evidence of tumor on screening pelvic computed tomography scan"

;; ===================== Auxiliary Assertions (REQ 24) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_tumor_finding_now@@detected_on_screening_chest_computed_tomography_scan
      patient_has_finding_of_tumor_finding_now)
:named REQ24_AUXILIARY0)) ;; "the patient has evidence of tumor on screening chest computed tomography scan"

(assert
(! (=> patient_has_finding_of_tumor_finding_now@@detected_on_screening_abdominal_computed_tomography_scan
      patient_has_finding_of_tumor_finding_now)
:named REQ24_AUXILIARY1)) ;; "the patient has evidence of tumor on screening abdominal computed tomography scan"

(assert
(! (=> patient_has_finding_of_tumor_finding_now@@detected_on_screening_pelvic_computed_tomography_scan
      patient_has_finding_of_tumor_finding_now)
:named REQ24_AUXILIARY2)) ;; "the patient has evidence of tumor on screening pelvic computed tomography scan"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_has_finding_of_tumor_finding_now@@detected_on_screening_chest_computed_tomography_scan)
:named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of tumor on screening chest computed tomography scan."

(assert
(! (not patient_has_finding_of_tumor_finding_now@@detected_on_screening_abdominal_computed_tomography_scan)
:named REQ24_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of tumor on screening abdominal computed tomography scan."

(assert
(! (not patient_has_finding_of_tumor_finding_now@@detected_on_screening_pelvic_computed_tomography_scan)
:named REQ24_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of tumor on screening pelvic computed tomography scan."
