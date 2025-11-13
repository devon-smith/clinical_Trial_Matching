;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_primary_progressive_multiple_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of primary progressive multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of primary progressive multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of primary progressive multiple sclerosis.","meaning":"Boolean indicating whether the patient currently has primary progressive multiple sclerosis."} ;; "primary progressive multiple sclerosis"
(declare-const patient_has_finding_of_secondary_progressive_multiple_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of secondary progressive multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of secondary progressive multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of secondary progressive multiple sclerosis.","meaning":"Boolean indicating whether the patient currently has secondary progressive multiple sclerosis."} ;; "secondary progressive multiple sclerosis"
(declare-const patient_has_finding_of_progressive_relapsing_multiple_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of progressive relapsing multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of progressive relapsing multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of progressive relapsing multiple sclerosis.","meaning":"Boolean indicating whether the patient currently has progressive relapsing multiple sclerosis."} ;; "progressive relapsing multiple sclerosis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_primary_progressive_multiple_sclerosis_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has primary progressive multiple sclerosis as defined by Lublin and Reingold (Lublin and Reingold 1996)."

(assert
  (! (not patient_has_finding_of_secondary_progressive_multiple_sclerosis_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary progressive multiple sclerosis as defined by Lublin and Reingold (Lublin and Reingold 1996)."

(assert
  (! (not patient_has_finding_of_progressive_relapsing_multiple_sclerosis_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has progressive relapsing multiple sclerosis as defined by Lublin and Reingold (Lublin and Reingold 1996)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_received_disease_modifying_treatment_for_multiple_sclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received disease modifying treatment for multiple sclerosis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received disease modifying treatment for multiple sclerosis at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received disease modifying treatment for multiple sclerosis.","meaning":"Boolean indicating whether the patient has ever received disease modifying treatment for multiple sclerosis at any time in the past."} ;; "the patient has received previous disease modifying treatment for multiple sclerosis"

(declare-const patient_has_undergone_immunosuppressive_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone immunosuppressive therapy at any time in the past, regardless of indication.","when_to_set_to_false":"Set to false if the patient has never undergone immunosuppressive therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone immunosuppressive therapy.","meaning":"Boolean indicating whether the patient has ever undergone immunosuppressive therapy at any time in the past."} ;; "immunosuppressive treatment"

(declare-const patient_has_undergone_immunosuppressive_therapy_inthehistory@@indication_multiple_sclerosis Bool) ;; {"when_to_set_to_true":"Set to true if the immunosuppressive therapy undergone by the patient in the past was specifically for multiple sclerosis.","when_to_set_to_false":"Set to false if the immunosuppressive therapy undergone by the patient in the past was not for multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunosuppressive therapy was for multiple sclerosis.","meaning":"Boolean indicating whether the immunosuppressive therapy undergone in the past was for multiple sclerosis."} ;; "immunosuppressive treatment for multiple sclerosis"

(declare-const patient_has_received_t_cell_vaccination_for_multiple_sclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received T-cell vaccination for multiple sclerosis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received T-cell vaccination for multiple sclerosis at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received T-cell vaccination for multiple sclerosis.","meaning":"Boolean indicating whether the patient has ever received T-cell vaccination for multiple sclerosis at any time in the past."} ;; "T-cell vaccination for multiple sclerosis"

(declare-const patient_has_received_t_cell_receptor_vaccination_for_multiple_sclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received T-cell receptor vaccination for multiple sclerosis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received T-cell receptor vaccination for multiple sclerosis at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received T-cell receptor vaccination for multiple sclerosis.","meaning":"Boolean indicating whether the patient has ever received T-cell receptor vaccination for multiple sclerosis at any time in the past."} ;; "T-cell receptor vaccination for multiple sclerosis"

(declare-const patient_is_exposed_to_monoclonal_antibody_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to a monoclonal antibody at any time in the past, regardless of therapeutic intent.","when_to_set_to_false":"Set to false if the patient has never been exposed to a monoclonal antibody at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to a monoclonal antibody.","meaning":"Boolean indicating whether the patient has ever been exposed to a monoclonal antibody at any time in the past."} ;; "any therapeutic monoclonal antibody treatment"

(declare-const patient_is_exposed_to_monoclonal_antibody_inthehistory@@therapeutic_intent Bool) ;; {"when_to_set_to_true":"Set to true if the monoclonal antibody exposure was as a therapeutic treatment.","when_to_set_to_false":"Set to false if the monoclonal antibody exposure was not as a therapeutic treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the monoclonal antibody exposure was as a therapeutic treatment.","meaning":"Boolean indicating whether the monoclonal antibody exposure was as a therapeutic treatment."} ;; "any therapeutic monoclonal antibody treatment"

(declare-const patient_is_exposed_to_mitoxantrone_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to mitoxantrone at any time in the past, regardless of intent.","when_to_set_to_false":"Set to false if the patient has never been exposed to mitoxantrone at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to mitoxantrone.","meaning":"Boolean indicating whether the patient has ever been exposed to mitoxantrone at any time in the past."} ;; "mitoxantrone treatment"

(declare-const patient_is_exposed_to_mitoxantrone_inthehistory@@treatment_intent Bool) ;; {"when_to_set_to_true":"Set to true if the mitoxantrone exposure was as a treatment.","when_to_set_to_false":"Set to false if the mitoxantrone exposure was not as a treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mitoxantrone exposure was as a treatment.","meaning":"Boolean indicating whether the mitoxantrone exposure was as a treatment."} ;; "mitoxantrone treatment"

(declare-const patient_has_undergone_cyclophosphamide_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone cyclophosphamide therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone cyclophosphamide therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone cyclophosphamide therapy.","meaning":"Boolean indicating whether the patient has ever undergone cyclophosphamide therapy at any time in the past."} ;; "cyclophosphamide treatment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term for immunosuppressive treatment for multiple sclerosis
(assert
(! (=> (or patient_has_received_t_cell_vaccination_for_multiple_sclerosis_inthehistory
          patient_has_received_t_cell_receptor_vaccination_for_multiple_sclerosis_inthehistory
          patient_is_exposed_to_monoclonal_antibody_inthehistory@@therapeutic_intent
          patient_is_exposed_to_mitoxantrone_inthehistory@@treatment_intent
          patient_has_undergone_cyclophosphamide_therapy_inthehistory)
    patient_has_undergone_immunosuppressive_therapy_inthehistory@@indication_multiple_sclerosis)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (T-cell vaccination, T-cell receptor vaccination, any therapeutic monoclonal antibody treatment, mitoxantrone treatment, cyclophosphamide treatment)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_immunosuppressive_therapy_inthehistory@@indication_multiple_sclerosis
       patient_has_undergone_immunosuppressive_therapy_inthehistory)
:named REQ1_AUXILIARY1)) ;; "immunosuppressive treatment for multiple sclerosis"

(assert
(! (=> patient_is_exposed_to_monoclonal_antibody_inthehistory@@therapeutic_intent
       patient_is_exposed_to_monoclonal_antibody_inthehistory)
:named REQ1_AUXILIARY2)) ;; "any therapeutic monoclonal antibody treatment"

(assert
(! (=> patient_is_exposed_to_mitoxantrone_inthehistory@@treatment_intent
       patient_is_exposed_to_mitoxantrone_inthehistory)
:named REQ1_AUXILIARY3)) ;; "mitoxantrone treatment"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have received previous disease modifying treatment for multiple sclerosis
(assert
(! (not patient_has_received_disease_modifying_treatment_for_multiple_sclerosis_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received previous disease modifying treatment for multiple sclerosis."

;; Exclusion: patient must NOT have received previous immunosuppressive treatment for multiple sclerosis (umbrella term, including non-exhaustive examples)
(assert
(! (not patient_has_undergone_immunosuppressive_therapy_inthehistory@@indication_multiple_sclerosis)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received previous immunosuppressive treatment for multiple sclerosis with non-exhaustive examples (T-cell vaccination, T-cell receptor vaccination, any therapeutic monoclonal antibody treatment, mitoxantrone treatment, cyclophosphamide treatment)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_received_fumaderm_as_previous_treatment_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received Fumaderm as previous treatment at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never received Fumaderm as previous treatment at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received Fumaderm as previous treatment in their history.","meaning":"Boolean indicating whether the patient has ever received Fumaderm as previous treatment in their history."} ;; "the patient has received previous treatment with Fumaderm"
(declare-const patient_has_taken_dimethyl_fumarate_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received treatment with a dimethyl fumarate-containing product at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never received treatment with a dimethyl fumarate-containing product at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received treatment with a dimethyl fumarate-containing product.","meaning":"Boolean indicating whether the patient has ever received treatment with a dimethyl fumarate-containing product in their history."} ;; "the patient has received previous treatment with dimethyl fumarate"
(declare-const patient_has_received_other_fumarates_as_previous_treatment_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received other fumarates (excluding Fumaderm and dimethyl fumarate) as previous treatment at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never received other fumarates (excluding Fumaderm and dimethyl fumarate) as previous treatment at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received other fumarates as previous treatment in their history.","meaning":"Boolean indicating whether the patient has ever received other fumarates as previous treatment in their history."} ;; "the patient has received previous treatment with other fumarates"
(declare-const patient_is_exposed_to_fumarate_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any fumarate substance at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been exposed to any fumarate substance at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any fumarate substance.","meaning":"Boolean indicating whether the patient has ever been exposed to any fumarate substance in their history."} ;; "the patient has received previous treatment with fumarates"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; The umbrella variable for fumarate exposure is true if any of the three subtypes is true (exhaustive subcategories: Fumaderm, dimethyl fumarate, other fumarates)
(assert
(! (= patient_is_exposed_to_fumarate_inthehistory
(or patient_has_received_fumaderm_as_previous_treatment_in_the_history
    patient_has_taken_dimethyl_fumarate_containing_product_inthehistory
    patient_has_received_other_fumarates_as_previous_treatment_in_the_history))
:named REQ2_AUXILIARY0)) ;; "previous treatment with Fumaderm OR dimethyl fumarate OR other fumarates" (exhaustive subcategories for fumarate exposure)

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_received_fumaderm_as_previous_treatment_in_the_history)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received previous treatment with Fumaderm."

(assert
(! (not patient_has_taken_dimethyl_fumarate_containing_product_inthehistory)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received previous treatment with dimethyl fumarate."

(assert
(! (not patient_has_received_other_fumarates_as_previous_treatment_in_the_history)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received previous treatment with other fumarates."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (malignancy) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (malignancy) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (malignancy) in their history."} ;; "malignancy"

(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with basal cell carcinoma of skin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with basal cell carcinoma of skin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of basal cell carcinoma of skin.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of basal cell carcinoma of skin in their history."} ;; "basal cell carcinoma"

(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory@@completely_excised_prior_to_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's basal cell carcinoma of skin has been completely excised prior to study enrollment.","when_to_set_to_false":"Set to false if the patient's basal cell carcinoma of skin has not been completely excised prior to study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's basal cell carcinoma of skin has been completely excised prior to study enrollment.","meaning":"Boolean indicating whether the patient's basal cell carcinoma of skin has been completely excised prior to study enrollment."} ;; "basal cell carcinoma that has been completely excised prior to study enrollment"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory@@completely_excised_prior_to_study_enrollment
      patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory)
:named REQ3_AUXILIARY0)) ;; "basal cell carcinoma that has been completely excised prior to study enrollment"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: history of malignancy, except if the only malignancy is basal cell carcinoma that has been completely excised prior to study enrollment
(assert
(! (not (and
          patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
          (not (and
                  patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory@@completely_excised_prior_to_study_enrollment
                  (= patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
                     patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory)
              ))
      ))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of malignancy) AND NOT (the only malignancy is basal cell carcinoma that has been completely excised prior to study enrollment)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergic_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergic reaction at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had an allergic reaction in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergic reaction.","meaning":"Boolean indicating whether the patient has ever had an allergic reaction in their medical history."} ;; "allergic reaction"
(declare-const patient_has_finding_of_allergic_reaction_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the allergic reaction was severe.","when_to_set_to_false":"Set to false if the allergic reaction was not severe.","when_to_set_to_null":"Set to null if the severity of the allergic reaction is unknown or not documented.","meaning":"Boolean indicating whether the allergic reaction was severe."} ;; "severe allergic reaction"
(declare-const patient_has_finding_of_anaphylaxis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an anaphylactic reaction at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had an anaphylactic reaction in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an anaphylactic reaction.","meaning":"Boolean indicating whether the patient has ever had an anaphylactic reaction in their medical history."} ;; "anaphylactic reaction"
(declare-const patient_has_finding_of_anaphylaxis_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the anaphylactic reaction was severe.","when_to_set_to_false":"Set to false if the anaphylactic reaction was not severe.","when_to_set_to_null":"Set to null if the severity of the anaphylactic reaction is unknown or not documented.","meaning":"Boolean indicating whether the anaphylactic reaction was severe."} ;; "severe anaphylactic reaction"
(declare-const patient_has_finding_of_allergic_reaction_to_drug_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergic reaction to a drug (drug hypersensitivity) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had an allergic reaction to a drug in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergic reaction to a drug.","meaning":"Boolean indicating whether the patient has ever had an allergic reaction to a drug (drug hypersensitivity) in their medical history."} ;; "drug hypersensitivity"
(declare-const patient_has_finding_of_allergic_reaction_to_drug_inthehistory@@known Bool) ;; {"when_to_set_to_true":"Set to true if the drug hypersensitivity is known/documented.","when_to_set_to_false":"Set to false if the drug hypersensitivity is not known/documented.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the drug hypersensitivity is known.","meaning":"Boolean indicating whether the drug hypersensitivity is known/documented."} ;; "known drug hypersensitivity"
(declare-const patient_has_allergy_to_gadolinium_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to gadolinium at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had an allergy to gadolinium in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to gadolinium.","meaning":"Boolean indicating whether the patient has ever had an allergy to gadolinium in their medical history."} ;; "allergy to gadolinium"
(declare-const patient_has_allergy_to_gadolinium_inthehistory@@known Bool) ;; {"when_to_set_to_true":"Set to true if the allergy to gadolinium is known/documented.","when_to_set_to_false":"Set to false if the allergy to gadolinium is not known/documented.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the allergy to gadolinium is known.","meaning":"Boolean indicating whether the allergy to gadolinium is known/documented."} ;; "known allergy to gadolinium"
(declare-const patient_has_hypersensitivity_to_gadolinium_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity to gadolinium at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a hypersensitivity to gadolinium in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypersensitivity to gadolinium.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity to gadolinium in their medical history."} ;; "hypersensitivity to gadolinium"
(declare-const patient_has_hypersensitivity_to_gadolinium_inthehistory@@known Bool) ;; {"when_to_set_to_true":"Set to true if the hypersensitivity to gadolinium is known/documented.","when_to_set_to_false":"Set to false if the hypersensitivity to gadolinium is not known/documented.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the hypersensitivity to gadolinium is known.","meaning":"Boolean indicating whether the hypersensitivity to gadolinium is known/documented."} ;; "known hypersensitivity to gadolinium"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_allergic_reaction_inthehistory@@severe
       patient_has_finding_of_allergic_reaction_inthehistory)
   :named REQ4_AUXILIARY0)) ;; "severe allergic reaction"

(assert
(! (=> patient_has_finding_of_anaphylaxis_inthehistory@@severe
       patient_has_finding_of_anaphylaxis_inthehistory)
   :named REQ4_AUXILIARY1)) ;; "severe anaphylactic reaction"

(assert
(! (=> patient_has_finding_of_allergic_reaction_to_drug_inthehistory@@known
       patient_has_finding_of_allergic_reaction_to_drug_inthehistory)
   :named REQ4_AUXILIARY2)) ;; "known drug hypersensitivity"

(assert
(! (=> patient_has_allergy_to_gadolinium_inthehistory@@known
       patient_has_allergy_to_gadolinium_inthehistory)
   :named REQ4_AUXILIARY3)) ;; "known allergy to gadolinium"

(assert
(! (=> patient_has_hypersensitivity_to_gadolinium_inthehistory@@known
       patient_has_hypersensitivity_to_gadolinium_inthehistory)
   :named REQ4_AUXILIARY4)) ;; "known hypersensitivity to gadolinium"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_allergic_reaction_inthehistory@@severe)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe allergic reaction."

(assert
(! (not patient_has_finding_of_anaphylaxis_inthehistory@@severe)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe anaphylactic reaction."

(assert
(! (not patient_has_finding_of_allergic_reaction_to_drug_inthehistory@@known)
   :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of known drug hypersensitivity."

(assert
(! (not patient_has_allergy_to_gadolinium_inthehistory@@known)
   :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to gadolinium."

(assert
(! (not patient_has_hypersensitivity_to_gadolinium_inthehistory@@known)
   :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to gadolinium."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_problem_abnormal_test_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an abnormal laboratory result at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an abnormal laboratory result at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an abnormal laboratory result.","meaning":"Boolean indicating whether the patient has ever had an abnormal laboratory result in their history."} ;; "abnormal laboratory result"

(declare-const patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_endocrinologic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal laboratory result in the patient's history is indicative of significant endocrinologic disease.","when_to_set_to_false":"Set to false if the abnormal laboratory result in the patient's history is not indicative of significant endocrinologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal laboratory result is indicative of significant endocrinologic disease.","meaning":"Boolean indicating whether the abnormal laboratory result is indicative of significant endocrinologic disease."} ;; "abnormal laboratory result indicative of significant endocrinologic disease"

(declare-const patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_hematologic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal laboratory result in the patient's history is indicative of significant hematologic disease.","when_to_set_to_false":"Set to false if the abnormal laboratory result in the patient's history is not indicative of significant hematologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal laboratory result is indicative of significant hematologic disease.","meaning":"Boolean indicating whether the abnormal laboratory result is indicative of significant hematologic disease."} ;; "abnormal laboratory result indicative of significant hematologic disease"

(declare-const patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_hepatic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal laboratory result in the patient's history is indicative of significant hepatic disease.","when_to_set_to_false":"Set to false if the abnormal laboratory result in the patient's history is not indicative of significant hepatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal laboratory result is indicative of significant hepatic disease.","meaning":"Boolean indicating whether the abnormal laboratory result is indicative of significant hepatic disease."} ;; "abnormal laboratory result indicative of significant hepatic disease"

(declare-const patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_immunologic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal laboratory result in the patient's history is indicative of significant immunologic disease.","when_to_set_to_false":"Set to false if the abnormal laboratory result in the patient's history is not indicative of significant immunologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal laboratory result is indicative of significant immunologic disease.","meaning":"Boolean indicating whether the abnormal laboratory result is indicative of significant immunologic disease."} ;; "abnormal laboratory result indicative of significant immunologic disease"

(declare-const patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_metabolic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal laboratory result in the patient's history is indicative of significant metabolic disease.","when_to_set_to_false":"Set to false if the abnormal laboratory result in the patient's history is not indicative of significant metabolic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal laboratory result is indicative of significant metabolic disease.","meaning":"Boolean indicating whether the abnormal laboratory result is indicative of significant metabolic disease."} ;; "abnormal laboratory result indicative of significant metabolic disease"

(declare-const patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_urologic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal laboratory result in the patient's history is indicative of significant urologic disease.","when_to_set_to_false":"Set to false if the abnormal laboratory result in the patient's history is not indicative of significant urologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal laboratory result is indicative of significant urologic disease.","meaning":"Boolean indicating whether the abnormal laboratory result is indicative of significant urologic disease."} ;; "abnormal laboratory result indicative of significant urologic disease"

(declare-const patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_renal_disease Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal laboratory result in the patient's history is indicative of significant renal disease.","when_to_set_to_false":"Set to false if the abnormal laboratory result in the patient's history is not indicative of significant renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal laboratory result is indicative of significant renal disease.","meaning":"Boolean indicating whether the abnormal laboratory result is indicative of significant renal disease."} ;; "abnormal laboratory result indicative of significant renal disease"

(declare-const patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_other_major_disease_precluding_trial_per_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal laboratory result in the patient's history is indicative of another major disease (not otherwise specified) that, in the opinion of the Investigator, would preclude participation in a clinical trial.","when_to_set_to_false":"Set to false if the abnormal laboratory result in the patient's history is not indicative of such a disease or if the Investigator does not believe it would preclude participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal laboratory result is indicative of such a disease or whether the Investigator would preclude participation.","meaning":"Boolean indicating whether the abnormal laboratory result is indicative of another major disease that, in the Investigator's opinion, would preclude trial participation."} ;; "abnormal laboratory result indicative of other major disease that in the opinion of the Investigator would preclude participation in a clinical trial"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_endocrinologic_disease
      patient_has_finding_of_problem_abnormal_test_inthehistory)
    :named REQ5_AUXILIARY0)) ;; "abnormal laboratory result indicative of significant endocrinologic disease"

(assert
(! (=> patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_hematologic_disease
      patient_has_finding_of_problem_abnormal_test_inthehistory)
    :named REQ5_AUXILIARY1)) ;; "abnormal laboratory result indicative of significant hematologic disease"

(assert
(! (=> patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_hepatic_disease
      patient_has_finding_of_problem_abnormal_test_inthehistory)
    :named REQ5_AUXILIARY2)) ;; "abnormal laboratory result indicative of significant hepatic disease"

(assert
(! (=> patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_immunologic_disease
      patient_has_finding_of_problem_abnormal_test_inthehistory)
    :named REQ5_AUXILIARY3)) ;; "abnormal laboratory result indicative of significant immunologic disease"

(assert
(! (=> patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_metabolic_disease
      patient_has_finding_of_problem_abnormal_test_inthehistory)
    :named REQ5_AUXILIARY4)) ;; "abnormal laboratory result indicative of significant metabolic disease"

(assert
(! (=> patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_urologic_disease
      patient_has_finding_of_problem_abnormal_test_inthehistory)
    :named REQ5_AUXILIARY5)) ;; "abnormal laboratory result indicative of significant urologic disease"

(assert
(! (=> patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_renal_disease
      patient_has_finding_of_problem_abnormal_test_inthehistory)
    :named REQ5_AUXILIARY6)) ;; "abnormal laboratory result indicative of significant renal disease"

(assert
(! (=> patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_other_major_disease_precluding_trial_per_investigator_opinion
      patient_has_finding_of_problem_abnormal_test_inthehistory)
    :named REQ5_AUXILIARY7)) ;; "abnormal laboratory result indicative of other major disease that in the opinion of the Investigator would preclude participation in a clinical trial"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_endocrinologic_disease)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of abnormal laboratory result indicative of significant endocrinologic disease."

(assert
(! (not patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_hematologic_disease)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of abnormal laboratory result indicative of significant hematologic disease."

(assert
(! (not patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_hepatic_disease)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of abnormal laboratory result indicative of significant hepatic disease."

(assert
(! (not patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_immunologic_disease)
    :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of abnormal laboratory result indicative of significant immunologic disease."

(assert
(! (not patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_metabolic_disease)
    :named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of abnormal laboratory result indicative of significant metabolic disease."

(assert
(! (not patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_urologic_disease)
    :named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of abnormal laboratory result indicative of significant urologic disease."

(assert
(! (not patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_significant_renal_disease)
    :named REQ5_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of abnormal laboratory result indicative of significant renal disease."

(assert
(! (not patient_has_finding_of_problem_abnormal_test_inthehistory@@indicative_of_other_major_disease_precluding_trial_per_investigator_opinion)
    :named REQ5_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of abnormal laboratory result indicative of other major disease that in the opinion of the Investigator would preclude participation in a clinical trial."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with human immunodeficiency virus infection at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient has a history of human immunodeficiency virus infection."} ;; "the patient has a history of human immunodeficiency virus infection"

(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of human immunodeficiency virus infection (i.e., positive test result at screening).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a finding of human immunodeficiency virus infection."} ;; "the patient has a positive test result at screening for human immunodeficiency virus infection"

(declare-const patients_antibody_to_hepatitis_c_virus_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive test result for antibody to hepatitis C virus.","when_to_set_to_false":"Set to false if the patient currently does not have a positive test result for antibody to hepatitis C virus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive test result for antibody to hepatitis C virus.","meaning":"Boolean indicating whether the patient currently has a positive test result for antibody to hepatitis C virus."} ;; "the patient is positive for hepatitis C antibody at screening"

(declare-const patients_hepatitis_b_surface_antigen_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive test result for hepatitis B surface antigen.","when_to_set_to_false":"Set to false if the patient currently does not have a positive test result for hepatitis B surface antigen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive test result for hepatitis B surface antigen.","meaning":"Boolean indicating whether the patient currently has a positive test result for hepatitis B surface antigen."} ;; "the patient is positive for hepatitis B surface antigen at screening"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of human immunodeficiency virus infection."

(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_infection_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive test result at screening for human immunodeficiency virus infection."

(assert
(! (not patients_antibody_to_hepatitis_c_virus_is_positive_now)
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is positive for hepatitis C antibody at screening."

(assert
(! (not patients_hepatitis_b_surface_antigen_is_positive_now)
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is positive for hepatitis B surface antigen at screening."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcohol abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse at any time in the past."} ;; "alcohol abuse"

(declare-const patient_has_finding_of_alcohol_abuse_inthehistory@@temporalcontext_within2years_prior_to_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of alcohol abuse occurred within the two years prior to inclusion.","when_to_set_to_false":"Set to false if the patient's history of alcohol abuse did not occur within the two years prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of alcohol abuse occurred within the two years prior to inclusion.","meaning":"Boolean indicating whether the patient's history of alcohol abuse occurred within the two years prior to inclusion."} ;; "history of alcohol abuse within the two years prior to inclusion"

(declare-const patient_has_finding_of_drug_abuse_inthehistory@@temporalcontext_within2years_prior_to_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of drug abuse occurred within the two years prior to inclusion.","when_to_set_to_false":"Set to false if the patient's history of drug abuse did not occur within the two years prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of drug abuse occurred within the two years prior to inclusion.","meaning":"Boolean indicating whether the patient's history of drug abuse occurred within the two years prior to inclusion."} ;; "history of drug abuse within the two years prior to inclusion"

(declare-const patient_has_finding_of_drug_abuse_inthehistory@@temporalcontext_within2years_prior_to_inclusion@@as_defined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of drug abuse within the two years prior to inclusion is as defined by the Investigator.","when_to_set_to_false":"Set to false if the patient's history of drug abuse within the two years prior to inclusion is not as defined by the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of drug abuse within the two years prior to inclusion is as defined by the Investigator.","meaning":"Boolean indicating whether the patient's history of drug abuse within the two years prior to inclusion is as defined by the Investigator."} ;; "history of drug abuse as defined by the Investigator within the two years prior to inclusion"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable for alcohol abuse
(assert
(! (=> patient_has_finding_of_alcohol_abuse_inthehistory@@temporalcontext_within2years_prior_to_inclusion
      patient_has_finding_of_alcohol_abuse_inthehistory)
:named REQ7_AUXILIARY0)) ;; "history of alcohol abuse within the two years prior to inclusion"

;; Qualifier variable implies corresponding stem variable for drug abuse
(assert
(! (=> patient_has_finding_of_drug_abuse_inthehistory@@temporalcontext_within2years_prior_to_inclusion@@as_defined_by_investigator
      patient_has_finding_of_drug_abuse_inthehistory@@temporalcontext_within2years_prior_to_inclusion)
:named REQ7_AUXILIARY1)) ;; "history of drug abuse as defined by the Investigator within the two years prior to inclusion"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have a history of drug abuse as defined by the Investigator within the two years prior to inclusion
(assert
(! (not patient_has_finding_of_drug_abuse_inthehistory@@temporalcontext_within2years_prior_to_inclusion@@as_defined_by_investigator)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug abuse as defined by the Investigator within the two years prior to inclusion."

;; Exclusion: patient must NOT have a history of alcohol abuse within the two years prior to inclusion
(assert
(! (not patient_has_finding_of_alcohol_abuse_inthehistory@@temporalcontext_within2years_prior_to_inclusion)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse as defined by the Investigator within the two years prior to inclusion."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_exacerbation_of_multiple_sclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an exacerbation (relapse) of multiple sclerosis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an exacerbation (relapse) of multiple sclerosis in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an exacerbation (relapse) of multiple sclerosis in the past.","meaning":"Boolean indicating whether the patient has had an exacerbation (relapse) of multiple sclerosis at any time in the past."} ;; "multiple sclerosis relapse"
(declare-const patient_has_finding_of_exacerbation_of_multiple_sclerosis_inthehistory@@not_stabilized_from_previous_relapse_prior_to_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an exacerbation (relapse) of multiple sclerosis in the past and has not stabilized from the previous relapse prior to inclusion.","when_to_set_to_false":"Set to false if the patient has had an exacerbation (relapse) of multiple sclerosis in the past and has stabilized from the previous relapse prior to inclusion, or if the patient has not had a relapse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has stabilized from the previous relapse prior to inclusion.","meaning":"Boolean indicating whether the patient has had an exacerbation (relapse) of multiple sclerosis in the past and has not stabilized from the previous relapse prior to inclusion."} ;; "has not stabilized from a previous multiple sclerosis relapse prior to inclusion"
(declare-const patient_has_finding_of_exacerbation_of_multiple_sclerosis_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an exacerbation (relapse) of multiple sclerosis within the past 30 days prior to inclusion (screening).","when_to_set_to_false":"Set to false if the patient has not had an exacerbation (relapse) of multiple sclerosis within the past 30 days prior to inclusion (screening).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an exacerbation (relapse) of multiple sclerosis within the past 30 days prior to inclusion (screening).","meaning":"Boolean indicating whether the patient has had an exacerbation (relapse) of multiple sclerosis within the past 30 days prior to inclusion (screening)."} ;; "multiple sclerosis relapse that has occurred within the thirty days prior to inclusion (screening)"
(declare-const patient_has_finding_of_exacerbation_of_multiple_sclerosis_inthepast30days@@temporalcontext_within30days_before_inclusion_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an exacerbation (relapse) of multiple sclerosis within the 30 days before the inclusion (screening) event.","when_to_set_to_false":"Set to false if the patient has not had an exacerbation (relapse) of multiple sclerosis within the 30 days before the inclusion (screening) event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an exacerbation (relapse) of multiple sclerosis within the 30 days before the inclusion (screening) event.","meaning":"Boolean indicating whether the patient has had an exacerbation (relapse) of multiple sclerosis within the 30 days before the inclusion (screening) event."} ;; "multiple sclerosis relapse that has occurred within the thirty days prior to inclusion (screening)"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_exacerbation_of_multiple_sclerosis_inthehistory@@not_stabilized_from_previous_relapse_prior_to_inclusion
      patient_has_finding_of_exacerbation_of_multiple_sclerosis_inthehistory)
:named REQ8_AUXILIARY0)) ;; "has not stabilized from a previous multiple sclerosis relapse prior to inclusion"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_exacerbation_of_multiple_sclerosis_inthepast30days@@temporalcontext_within30days_before_inclusion_screening
      patient_has_finding_of_exacerbation_of_multiple_sclerosis_inthepast30days)
:named REQ8_AUXILIARY1)) ;; "multiple sclerosis relapse that has occurred within the thirty days prior to inclusion (screening)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_exacerbation_of_multiple_sclerosis_inthepast30days)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has had a multiple sclerosis relapse that has occurred within the thirty days prior to inclusion (screening)"

(assert
(! (not patient_has_finding_of_exacerbation_of_multiple_sclerosis_inthehistory@@not_stabilized_from_previous_relapse_prior_to_inclusion)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has not stabilized from a previous multiple sclerosis relapse prior to inclusion"
