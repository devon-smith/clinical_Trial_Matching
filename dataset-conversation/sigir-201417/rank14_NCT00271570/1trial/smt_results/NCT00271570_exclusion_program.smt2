;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_administration_of_steroid_value_recorded_now_withunit_milligram_per_kilogram_prednisone_equivalent_daily Real) ;; {"when_to_set_to_value":"Set to the measured or documented daily dose (in mg/kg prednisone equivalent) if the patient is currently receiving corticosteroid therapy via any route.","when_to_set_to_null":"Set to null if the patient is not currently receiving corticosteroid therapy, or if the dose is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current daily dose of corticosteroid therapy, expressed in milligrams per kilogram prednisone equivalent."} ;; "corticosteroid therapy (via any route) at doses greater than 1 milligram per kilogram prednisone equivalent daily."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (> patient_administration_of_steroid_value_recorded_now_withunit_milligram_per_kilogram_prednisone_equivalent_daily 1))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been receiving corticosteroid therapy (via any route) at doses greater than 1 milligram per kilogram prednisone equivalent daily."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_tuberculosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with tuberculosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with tuberculosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with tuberculosis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of tuberculosis in their history."} ;; "the patient has a history of tuberculosis"
(declare-const patient_has_finding_of_tuberculosis_exposure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of exposure to tuberculosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented history of exposure to tuberculosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of exposure to tuberculosis.","meaning":"Boolean indicating whether the patient has ever had a history of exposure to tuberculosis in their history."} ;; "the patient has a history of tuberculosis exposure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_diagnosis_of_tuberculosis_inthehistory)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of tuberculosis."

(assert
  (! (not patient_has_finding_of_tuberculosis_exposure_inthehistory)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of tuberculosis exposure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_histoplasmosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with histoplasmosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with histoplasmosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with histoplasmosis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with histoplasmosis in their medical history."} ;; "the patient has a history of histoplasmosis"
(declare-const patient_has_diagnosis_of_coccidioidomycosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with coccidioidomycosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with coccidioidomycosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with coccidioidomycosis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with coccidioidomycosis in their medical history."} ;; "the patient has a history of coccidiomycosis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_histoplasmosis_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of histoplasmosis."

(assert
(! (not patient_has_diagnosis_of_coccidioidomycosis_inthehistory)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of coccidiomycosis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_taken_anakinra_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken anakinra-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken anakinra-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken anakinra-containing product.","meaning":"Boolean indicating whether the patient has ever taken anakinra-containing product at any time in the past."} ;; "anakinra"
(declare-const patient_has_taken_anakinra_containing_product_inthehistory@@temporalcontext_within1month_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken anakinra-containing product within 1 month prior to first study drug administration.","when_to_set_to_false":"Set to false if the patient has not taken anakinra-containing product within 1 month prior to first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken anakinra-containing product within 1 month prior to first study drug administration.","meaning":"Boolean indicating whether the patient has taken anakinra-containing product within 1 month prior to first study drug administration."} ;; "anakinra therapy within 1 month prior to first study drug administration"
(declare-const patient_has_taken_etanercept_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken etanercept-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken etanercept-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken etanercept-containing product.","meaning":"Boolean indicating whether the patient has ever taken etanercept-containing product at any time in the past."} ;; "etanercept"
(declare-const patient_has_taken_etanercept_containing_product_inthehistory@@temporalcontext_within1month_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken etanercept-containing product within 1 month prior to first study drug administration.","when_to_set_to_false":"Set to false if the patient has not taken etanercept-containing product within 1 month prior to first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken etanercept-containing product within 1 month prior to first study drug administration.","meaning":"Boolean indicating whether the patient has taken etanercept-containing product within 1 month prior to first study drug administration."} ;; "etanercept therapy within 1 month prior to first study drug administration"
(declare-const patient_has_taken_adalimumab_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken adalimumab-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken adalimumab-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken adalimumab-containing product.","meaning":"Boolean indicating whether the patient has ever taken adalimumab-containing product at any time in the past."} ;; "adalimumab"
(declare-const patient_has_taken_adalimumab_containing_product_inthehistory@@temporalcontext_within1month_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken adalimumab-containing product within 1 month prior to first study drug administration.","when_to_set_to_false":"Set to false if the patient has not taken adalimumab-containing product within 1 month prior to first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken adalimumab-containing product within 1 month prior to first study drug administration.","meaning":"Boolean indicating whether the patient has taken adalimumab-containing product within 1 month prior to first study drug administration."} ;; "adalimumab therapy within 1 month prior to first study drug administration"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_taken_anakinra_containing_product_inthehistory@@temporalcontext_within1month_before_first_study_drug_administration
      patient_has_taken_anakinra_containing_product_inthehistory)
:named REQ3_AUXILIARY0)) ;; "anakinra therapy within 1 month prior to first study drug administration"

(assert
(! (=> patient_has_taken_etanercept_containing_product_inthehistory@@temporalcontext_within1month_before_first_study_drug_administration
      patient_has_taken_etanercept_containing_product_inthehistory)
:named REQ3_AUXILIARY1)) ;; "etanercept therapy within 1 month prior to first study drug administration"

(assert
(! (=> patient_has_taken_adalimumab_containing_product_inthehistory@@temporalcontext_within1month_before_first_study_drug_administration
      patient_has_taken_adalimumab_containing_product_inthehistory)
:named REQ3_AUXILIARY2)) ;; "adalimumab therapy within 1 month prior to first study drug administration"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_taken_anakinra_containing_product_inthehistory@@temporalcontext_within1month_before_first_study_drug_administration)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received anakinra therapy within 1 month prior to first study drug administration."

(assert
(! (not patient_has_taken_etanercept_containing_product_inthehistory@@temporalcontext_within1month_before_first_study_drug_administration)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received etanercept therapy within 1 month prior to first study drug administration."

(assert
(! (not patient_has_taken_adalimumab_containing_product_inthehistory@@temporalcontext_within1month_before_first_study_drug_administration)
:named REQ3_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received adalimumab therapy within 1 month prior to first study drug administration."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_chronic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any chronic disease documented in their history, regardless of current status.","when_to_set_to_false":"Set to false if the patient does not have any chronic disease documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any chronic disease in their history.","meaning":"Boolean indicating whether the patient has any chronic disease in their history."} ;; "chronic disease"
(declare-const patient_has_diagnosis_of_chronic_disease_inthehistory@@excluding_asthma_atopic_dermatitis_controlled_seizure_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any chronic disease in their history, but none of the chronic diseases present are asthma, atopic dermatitis, or controlled seizure disorder.","when_to_set_to_false":"Set to false if the patient has only asthma, atopic dermatitis, or controlled seizure disorder as chronic diseases in their history, or has no chronic disease at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any chronic disease in their history, or if the presence of exceptions cannot be determined.","meaning":"Boolean indicating whether the patient has any chronic disease in their history, excluding asthma, atopic dermatitis, or controlled seizure disorder."} ;; "any chronic disease, except asthma, atopic dermatitis, or controlled seizure disorder"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_chronic_disease_inthehistory@@excluding_asthma_atopic_dermatitis_controlled_seizure_disorder
      patient_has_diagnosis_of_chronic_disease_inthehistory)
:named REQ4_AUXILIARY0)) ;; "any chronic disease, except asthma, atopic dermatitis, or controlled seizure disorder"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_disease_inthehistory@@excluding_asthma_atopic_dermatitis_controlled_seizure_disorder)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has any chronic disease, except asthma, atopic dermatitis, or controlled seizure disorder."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_type_b_viral_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatitis B infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatitis B infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatitis B infection.","meaning":"Boolean indicating whether the patient currently has hepatitis B infection."} ;; "hepatitis B infection"
(declare-const patient_has_finding_of_type_b_viral_hepatitis_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hepatitis B infection is active.","when_to_set_to_false":"Set to false if the patient's current hepatitis B infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hepatitis B infection is active.","meaning":"Boolean indicating whether the patient's current hepatitis B infection is active."} ;; "active hepatitis B infection"
(declare-const patient_has_finding_of_type_b_viral_hepatitis_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hepatitis B infection is documented.","when_to_set_to_false":"Set to false if the patient's current hepatitis B infection is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hepatitis B infection is documented.","meaning":"Boolean indicating whether the patient's current hepatitis B infection is documented."} ;; "documented hepatitis B infection"
(declare-const patient_has_finding_of_viral_hepatitis_c_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of hepatitis C infection in their history.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of hepatitis C infection in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had hepatitis C infection.","meaning":"Boolean indicating whether the patient has a history of hepatitis C infection."} ;; "hepatitis C infection"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable for hepatitis B infection
(assert
(! (=> patient_has_finding_of_type_b_viral_hepatitis_now@@active
      patient_has_finding_of_type_b_viral_hepatitis_now)
:named REQ5_AUXILIARY0)) ;; "active hepatitis B infection" implies "hepatitis B infection"

(assert
(! (=> patient_has_finding_of_type_b_viral_hepatitis_now@@documented
      patient_has_finding_of_type_b_viral_hepatitis_now)
:named REQ5_AUXILIARY1)) ;; "documented hepatitis B infection" implies "hepatitis B infection"

;; Documented AND active hepatitis B infection defines the exclusion component
(assert
(! (= patient_has_finding_of_type_b_viral_hepatitis_now@@documented
      (and patient_has_finding_of_type_b_viral_hepatitis_now@@active
           patient_has_finding_of_type_b_viral_hepatitis_now@@documented))
:named REQ5_AUXILIARY2)) ;; "documented history of current active hepatitis B infection"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have documented history of current active hepatitis B infection
(assert
(! (not (and patient_has_finding_of_type_b_viral_hepatitis_now@@active
             patient_has_finding_of_type_b_viral_hepatitis_now@@documented))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a documented history of current active hepatitis B infection."

;; Exclusion: patient must NOT have a history of hepatitis C infection
(assert
(! (not patient_has_finding_of_viral_hepatitis_c_inthehistory)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hepatitis C infection."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of human immunodeficiency virus infection at any time in the past (i.e., a history of HIV infection).","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of human immunodeficiency virus infection at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of human immunodeficiency virus infection (HIV) in their history."} ;; "The patient is excluded if the patient has a documented history of human immunodeficiency virus infection."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a documented history of human immunodeficiency virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_received_transplanted_organ_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received a transplanted organ at any time in the past, regardless of organ type.","when_to_set_to_false":"Set to false if the patient has never received a transplanted organ at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received a transplanted organ.","meaning":"Boolean indicating whether the patient has ever received a transplanted organ in the past."} ;; "the patient has received a transplanted organ"

(declare-const patient_has_received_transplanted_organ_in_the_history@@organ_type_corneal Bool) ;; {"when_to_set_to_true":"Set to true if the transplanted organ received by the patient is a cornea.","when_to_set_to_false":"Set to false if the transplanted organ received by the patient is not a cornea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the transplanted organ received by the patient is a cornea.","meaning":"Boolean indicating whether the transplanted organ received by the patient is a cornea."} ;; "the transplanted organ is a corneal transplant"

(declare-const patient_has_received_transplanted_organ_in_the_history@@temporalcontext_more_than_3_months_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the transplanted organ was received more than 3 months before the first study drug administration.","when_to_set_to_false":"Set to false if the transplanted organ was received 3 months or less before the first study drug administration, or after the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the transplanted organ was received more than 3 months before the first study drug administration.","meaning":"Boolean indicating whether the transplanted organ was received more than 3 months before the first study drug administration."} ;; "the transplanted organ is NOT a corneal transplant performed more than 3 months prior to first study drug administration"

(declare-const patient_has_undergone_corneal_transplant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a corneal transplant at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a corneal transplant at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a corneal transplant.","meaning":"Boolean indicating whether the patient has ever undergone a corneal transplant in the past."} ;; "corneal transplant"

(declare-const patient_has_undergone_corneal_transplant_inthehistory@@temporalcontext_more_than_3_months_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's corneal transplant was performed more than 3 months before the first study drug administration.","when_to_set_to_false":"Set to false if the patient's corneal transplant was performed 3 months or less before the first study drug administration, or after the first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the corneal transplant was performed more than 3 months before the first study drug administration.","meaning":"Boolean indicating whether the patient's corneal transplant was performed more than 3 months before the first study drug administration."} ;; "corneal transplant performed more than 3 months prior to first study drug administration"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_received_transplanted_organ_in_the_history@@organ_type_corneal
      patient_has_received_transplanted_organ_in_the_history)
    :named REQ7_AUXILIARY0)) ;; "the transplanted organ is a corneal transplant"

(assert
(! (=> patient_has_received_transplanted_organ_in_the_history@@temporalcontext_more_than_3_months_before_first_study_drug_administration
      patient_has_received_transplanted_organ_in_the_history)
    :named REQ7_AUXILIARY1)) ;; "the transplanted organ was received more than 3 months before first study drug administration"

(assert
(! (=> patient_has_undergone_corneal_transplant_inthehistory@@temporalcontext_more_than_3_months_before_first_study_drug_administration
      patient_has_undergone_corneal_transplant_inthehistory)
    :named REQ7_AUXILIARY2)) ;; "corneal transplant performed more than 3 months prior to first study drug administration"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have received a transplanted organ, unless it is a corneal transplant performed >3 months before first study drug administration
(assert
(! (not (and patient_has_received_transplanted_organ_in_the_history
             (not (and patient_has_received_transplanted_organ_in_the_history@@organ_type_corneal
                       patient_has_received_transplanted_organ_in_the_history@@temporalcontext_more_than_3_months_before_first_study_drug_administration))))
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received a transplanted organ) AND (the transplanted organ is NOT a corneal transplant performed more than 3 months prior to first study drug administration)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (malignancy)."} ;; "the patient has a known malignancy"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@temporalcontext_within5years_before_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a malignant neoplastic disease (malignancy) within the 5-year period prior to first study drug administration.","when_to_set_to_false":"Set to false if the patient has not had a malignant neoplastic disease (malignancy) within the 5-year period prior to first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a malignant neoplastic disease (malignancy) within the 5-year period prior to first study drug administration.","meaning":"Boolean indicating whether the patient has ever had a malignant neoplastic disease (malignancy) in their history, specifically within the 5-year period prior to first study drug administration."} ;; "history of malignancy within the 5-year period prior to first study drug administration"

(declare-const patient_has_finding_of_squamous_cell_carcinoma_of_skin_inthehistory@@completely_excised_without_evidence_of_recurrence Bool) ;; {"when_to_set_to_true":"Set to true if the patient's squamous cell carcinoma of the skin has been completely excised and there is no evidence of recurrence.","when_to_set_to_false":"Set to false if the patient's squamous cell carcinoma of the skin has not been completely excised or there is evidence of recurrence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's squamous cell carcinoma of the skin has been completely excised without evidence of recurrence.","meaning":"Boolean indicating whether the patient has ever had squamous cell carcinoma of the skin in their history, and the carcinoma has been completely excised without evidence of recurrence."} ;; "squamous cell carcinoma of the skin that has been completely excised without evidence of recurrence"

(declare-const patient_has_finding_of_basal_cell_carcinoma_of_skin_inthehistory@@completely_excised_without_evidence_of_recurrence Bool) ;; {"when_to_set_to_true":"Set to true if the patient's basal cell carcinoma of the skin has been completely excised and there is no evidence of recurrence.","when_to_set_to_false":"Set to false if the patient's basal cell carcinoma of the skin has not been completely excised or there is evidence of recurrence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's basal cell carcinoma of the skin has been completely excised without evidence of recurrence.","meaning":"Boolean indicating whether the patient has ever had basal cell carcinoma of the skin in their history, and the carcinoma has been completely excised without evidence of recurrence."} ;; "basal cell carcinoma of the skin that has been completely excised without evidence of recurrence"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_squamous_cell_carcinoma_of_skin_inthehistory@@completely_excised_without_evidence_of_recurrence
      patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@temporalcontext_within5years_before_first_study_drug_administration)
:named REQ8_AUXILIARY0)) ;; "the malignancy is squamous cell carcinoma of the skin that has been completely excised without evidence of recurrence"

(assert
(! (=> patient_has_finding_of_basal_cell_carcinoma_of_skin_inthehistory@@completely_excised_without_evidence_of_recurrence
      patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@temporalcontext_within5years_before_first_study_drug_administration)
:named REQ8_AUXILIARY1)) ;; "the malignancy is basal cell carcinoma of the skin that has been completely excised without evidence of recurrence"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient has a known malignancy
(assert
(! (not (not patient_has_finding_of_malignant_neoplastic_disease_now))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known malignancy."

;; Exclusion: patient has a history of malignancy within 5 years prior to first study drug administration,
;; AND the malignancy is NOT squamous cell carcinoma of the skin that has been completely excised without evidence of recurrence,
;; AND the malignancy is NOT basal cell carcinoma of the skin that has been completely excised without evidence of recurrence.
(assert
(! (not (and
         patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@temporalcontext_within5years_before_first_study_drug_administration
         (not patient_has_finding_of_squamous_cell_carcinoma_of_skin_inthehistory@@completely_excised_without_evidence_of_recurrence)
         (not patient_has_finding_of_basal_cell_carcinoma_of_skin_inthehistory@@completely_excised_without_evidence_of_recurrence)))
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of malignancy within the 5-year period prior to first study drug administration AND the malignancy is NOT squamous cell carcinoma of the skin that has been completely excised without evidence of recurrence AND the malignancy is NOT basal cell carcinoma of the skin that has been completely excised without evidence of recurrence."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_malignant_lymphoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant lymphoma at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant lymphoma at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant lymphoma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant lymphoma in their history."} ;; "lymphoma"
(declare-const patient_has_history_of_lymphoproliferative_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any lymphoproliferative disease, including lymphoma, at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any lymphoproliferative disease, including lymphoma, at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any lymphoproliferative disease, including lymphoma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of any lymphoproliferative disease in their history, including lymphoma."} ;; "history of prior lymphoproliferative disease including lymphoma"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive example: lymphoma implies lymphoproliferative disease
(assert
(! (=> patient_has_diagnosis_of_malignant_lymphoma_inthehistory
       patient_has_history_of_lymphoproliferative_disease)
   :named REQ9_AUXILIARY0)) ;; "including lymphoma with non-exhaustive examples (lymphoma)."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_history_of_lymphoproliferative_disease)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of prior lymphoproliferative disease including lymphoma with non-exhaustive examples (lymphoma)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_multiple_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of multiple sclerosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of multiple sclerosis."} ;; "the patient has multiple sclerosis"

(declare-const patient_has_diagnosis_of_demyelinating_disease_of_central_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a demyelinating disease of the central nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a demyelinating disease of the central nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a demyelinating disease of the central nervous system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a demyelinating disease of the central nervous system."} ;; "central demyelinating disorder"

(declare-const patient_has_diagnosis_of_demyelinating_disease_of_central_nervous_system_now@@not_multiple_sclerosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a demyelinating disease of the central nervous system and that diagnosis is not multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of a demyelinating disease of the central nervous system and that diagnosis is multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is or is not multiple sclerosis.","meaning":"Boolean indicating that the diagnosis of demyelinating disease of the central nervous system is not multiple sclerosis."} ;; "another central demyelinating disorder"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_demyelinating_disease_of_central_nervous_system_now@@not_multiple_sclerosis
      patient_has_diagnosis_of_demyelinating_disease_of_central_nervous_system_now)
:named REQ10_AUXILIARY0)) ;; "another central demyelinating disorder" (qualifier variable implies stem variable)

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have multiple sclerosis
(assert
(! (not patient_has_diagnosis_of_multiple_sclerosis_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has multiple sclerosis"

;; Exclusion: patient must NOT have another central demyelinating disorder (i.e., demyelinating disease of CNS that is not multiple sclerosis)
(assert
(! (not patient_has_diagnosis_of_demyelinating_disease_of_central_nervous_system_now@@not_multiple_sclerosis)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has another central demyelinating disorder"

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_undergone_infliximab_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone infliximab therapy at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone infliximab therapy at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone infliximab therapy.","meaning":"Boolean indicating whether the patient has ever undergone infliximab therapy at any time in their medical history."} ;; "the patient has received any previous treatment with infliximab therapy"

(declare-const patient_has_undergone_monoclonal_antibody_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone monoclonal antibody therapy at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone monoclonal antibody therapy at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone monoclonal antibody therapy.","meaning":"Boolean indicating whether the patient has ever undergone monoclonal antibody therapy at any time in their medical history."} ;; "the patient has received any previous treatment with monoclonal antibody therapy"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not (or patient_has_undergone_infliximab_therapy_inthehistory
              patient_has_undergone_monoclonal_antibody_therapy_inthehistory))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received any previous treatment with infliximab therapy) OR (the patient has received any previous treatment with monoclonal antibody therapy)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const investigational_agent_half_life_value_recorded_prior_to_first_study_drug_administration_in_days Real) ;; {"when_to_set_to_value":"Set to the value of the investigational agent's half-life in days, as recorded prior to first study drug administration.","when_to_set_to_null":"Set to null if the half-life of the investigational agent prior to first study drug administration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the half-life of the investigational agent in days, prior to first study drug administration."} ;; "half-lives of the investigational agent prior to first study drug administration"

(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any drug or medicament at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any drug or medicament at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient has ever been exposed to any drug or medicament in the past."} ;; "drug"

(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@investigational_agent_within_exclusion_window_prior_to_first_study_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an investigational agent within the longer of 1 month or 5 half-lives prior to first study drug administration.","when_to_set_to_false":"Set to false if the patient has not been exposed to an investigational agent within the longer of 1 month or 5 half-lives prior to first study drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to an investigational agent within the specified window.","meaning":"Boolean indicating whether the patient has been exposed to an investigational agent within the longer of 1 month or 5 half-lives prior to first study drug administration."} ;; "investigational agent within the longer of 1 month or 5 half-lives prior to first study drug administration"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Definition of the exclusion window: longer of 1 month or 5 half-lives
(assert
(! (= patient_is_exposed_to_drug_or_medicament_inthehistory@@investigational_agent_within_exclusion_window_prior_to_first_study_drug_administration
     ;; This variable is set externally based on whether the patient was exposed to an investigational agent within the longer of 1 month or 5 half-lives prior to first study drug administration.
     patient_is_exposed_to_drug_or_medicament_inthehistory@@investigational_agent_within_exclusion_window_prior_to_first_study_drug_administration)
:named REQ12_AUXILIARY0)) ;; "within the longer of (1 month prior to first study drug administration) OR (5 half-lives of the investigational agent prior to first study drug administration)"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthehistory@@investigational_agent_within_exclusion_window_prior_to_first_study_drug_administration
       patient_is_exposed_to_drug_or_medicament_inthehistory)
:named REQ12_AUXILIARY1)) ;; "investigational agent is a drug or medicament"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthehistory@@investigational_agent_within_exclusion_window_prior_to_first_study_drug_administration)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any investigational drug within the longer of (1 month prior to first study drug administration) OR (5 half-lives of the investigational agent prior to first study drug administration)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_participating_in_investigative_trial_involving_investigational_agent_therapy_during_participation_in_this_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in another investigative trial involving investigational agent therapy, and this participation overlaps with the patient's participation in this trial.","when_to_set_to_false":"Set to false if the patient is not currently participating in another investigative trial involving investigational agent therapy during participation in this trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is participating in another investigative trial involving investigational agent therapy during participation in this trial.","meaning":"Boolean indicating whether the patient is currently participating in another investigative trial involving investigational agent therapy during participation in this trial."} ;; "The patient is excluded if the patient is participating in another investigative trial involving investigational agent therapy during participation in this trial."

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_participating_in_investigative_trial_involving_investigational_agent_therapy_during_participation_in_this_trial)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is participating in another investigative trial involving investigational agent therapy during participation in this trial."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_substance_misuse_behavior_inthepast3years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of substance misuse behavior (including drug or alcohol abuse) that occurred within the past 3 years.","when_to_set_to_false":"Set to false if the patient does not have a documented history of substance misuse behavior within the past 3 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has substance misuse behavior within the past 3 years.","meaning":"Boolean indicating whether the patient has substance misuse behavior documented as occurring within the past 3 years."} ;; "substance abuse with non-exhaustive examples (drug abuse, alcohol abuse) within the previous 3 years."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_substance_misuse_behavior_inthepast3years)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of substance abuse with non-exhaustive examples (drug abuse, alcohol abuse) within the previous 3 years."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be pregnant at the current time (during the trial).","when_to_set_to_false":"Set to false if the patient is confirmed not to be pregnant at the current time (during the trial).","when_to_set_to_null":"Set to null if the pregnancy status of the patient at the current time (during the trial) is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is pregnant at the current time (i.e., during the trial)."} ;; "the patient is pregnant during the trial"
(declare-const patient_is_pregnant_inthefuture6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be pregnant at any time within the 6 months following the trial.","when_to_set_to_false":"Set to false if the patient is confirmed not to be pregnant at any time within the 6 months following the trial.","when_to_set_to_null":"Set to null if the pregnancy status of the patient within the 6 months following the trial is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is pregnant at any time within the 6 months following the trial."} ;; "the patient is pregnant ... within the 6-month period thereafter"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be breastfeeding at the current time (during the trial).","when_to_set_to_false":"Set to false if the patient is confirmed not to be breastfeeding at the current time (during the trial).","when_to_set_to_null":"Set to null if the breastfeeding status of the patient at the current time (during the trial) is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is breastfeeding at the current time (i.e., during the trial)."} ;; "the patient is nursing during the trial"
(declare-const patient_is_breastfeeding_inthefuture6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be breastfeeding at any time within the 6 months following the trial.","when_to_set_to_false":"Set to false if the patient is confirmed not to be breastfeeding at any time within the 6 months following the trial.","when_to_set_to_null":"Set to null if the breastfeeding status of the patient within the 6 months following the trial is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is breastfeeding at any time within the 6 months following the trial."} ;; "the patient is nursing ... within the 6-month period thereafter"
(declare-const patient_is_planning_pregnancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to become pregnant at the current time (during the trial).","when_to_set_to_false":"Set to false if the patient is not planning to become pregnant at the current time (during the trial).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is planning to become pregnant at the current time (during the trial).","meaning":"Boolean value indicating whether the patient is planning to become pregnant at the current time (i.e., during the trial)."} ;; "the patient is planning pregnancy during the trial"
(declare-const patient_is_planning_pregnancy_inthefuture6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to become pregnant at any time within the 6 months following the trial.","when_to_set_to_false":"Set to false if the patient is not planning to become pregnant at any time within the 6 months following the trial.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is planning to become pregnant at any time within the 6 months following the trial.","meaning":"Boolean value indicating whether the patient is planning to become pregnant at any time within the 6 months following the trial."} ;; "the patient is planning pregnancy ... within the 6-month period thereafter"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to become pregnant at the current time (during the trial).","when_to_set_to_false":"Set to false if the patient is not able to become pregnant at the current time (during the trial).","when_to_set_to_null":"Set to null if the ability of the patient to become pregnant at the current time (during the trial) is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is able to become pregnant at the current time (i.e., during the trial)."} ;; "the patient is planning pregnancy during the trial"
(declare-const patient_is_able_to_be_pregnant_inthefuture6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to become pregnant at any time within the 6 months following the trial.","when_to_set_to_false":"Set to false if the patient is not able to become pregnant at any time within the 6 months following the trial.","when_to_set_to_null":"Set to null if the ability of the patient to become pregnant within the 6 months following the trial is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is able to become pregnant at any time within the 6 months following the trial."} ;; "the patient is planning pregnancy ... within the 6-month period thereafter"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion: patient is pregnant during the trial or within 6 months thereafter
(assert
(! (not (or patient_is_pregnant_now patient_is_pregnant_inthefuture6months))
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant during the trial or within the 6-month period thereafter."

;; Exclusion: patient is nursing during the trial or within 6 months thereafter
(assert
(! (not (or patient_is_breastfeeding_now patient_is_breastfeeding_inthefuture6months))
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing during the trial or within the 6-month period thereafter."

;; Exclusion: patient is planning pregnancy during the trial or within 6 months thereafter
(assert
(! (not (or patient_is_planning_pregnancy_now patient_is_planning_pregnancy_inthefuture6months))
:named REQ15_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is planning pregnancy during the trial or within the 6-month period thereafter."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_known_allergy_to_murine_protein Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or otherwise known allergy to murine protein.","when_to_set_to_false":"Set to false if the patient does not have a documented or known allergy to murine protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known allergy to murine protein.","meaning":"Boolean indicating whether the patient has a known allergy to murine protein."} ;; "the patient has a known allergy to murine protein"
(declare-const patient_has_known_allergy_to_chimeric_protein Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or otherwise known allergy to chimeric protein.","when_to_set_to_false":"Set to false if the patient does not have a documented or known allergy to chimeric protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known allergy to chimeric protein.","meaning":"Boolean indicating whether the patient has a known allergy to chimeric protein."} ;; "the patient has a known allergy to chimeric protein"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
  (! (not patient_has_known_allergy_to_murine_protein)
     :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to murine protein."

(assert
  (! (not patient_has_known_allergy_to_chimeric_protein)
     :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to chimeric protein."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_ischemic_congestive_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ischemic congestive cardiomyopathy (ischemic congestive heart failure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ischemic congestive cardiomyopathy (ischemic congestive heart failure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ischemic congestive cardiomyopathy (ischemic congestive heart failure).","meaning":"Boolean indicating whether the patient currently has ischemic congestive cardiomyopathy (ischemic congestive heart failure)."} ;; "ischemic congestive heart failure"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_ischemic_congestive_cardiomyopathy_now)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ischemic congestive heart failure."
