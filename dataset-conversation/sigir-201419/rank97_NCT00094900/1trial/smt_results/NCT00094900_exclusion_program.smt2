;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_received_live_virus_vaccine_within_3_months_prior_to_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with a live virus vaccine during the three months prior to the baseline visit.","when_to_set_to_false":"Set to false if the patient has not received treatment with a live virus vaccine during the three months prior to the baseline visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with a live virus vaccine during the three months prior to the baseline visit.","meaning":"Boolean indicating whether the patient has received treatment with a live virus vaccine during the three months prior to the baseline visit."} ;; "the patient has received treatment with a live virus vaccine during the three months prior to the baseline visit"

(declare-const patient_receives_live_virus_vaccine_at_any_time_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient receives a live virus vaccine at any time throughout the course of this study.","when_to_set_to_false":"Set to false if the patient does not receive a live virus vaccine at any time throughout the course of this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient receives a live virus vaccine at any time throughout the course of this study.","meaning":"Boolean indicating whether the patient receives a live virus vaccine at any time throughout the course of this study."} ;; "the patient receives a live virus vaccine at any time throughout the course of this study"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (or patient_has_received_live_virus_vaccine_within_3_months_prior_to_baseline_visit
              patient_receives_live_virus_vaccine_at_any_time_during_study))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has received treatment with a live virus vaccine during the three months prior to the baseline visit) OR (the patient receives a live virus vaccine at any time throughout the course of this study))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_tumor_necrosis_factor_alpha_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with tumor necrosis factor alpha inhibitor.","when_to_set_to_false":"Set to false if the patient is currently not being treated with tumor necrosis factor alpha inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with tumor necrosis factor alpha inhibitor.","meaning":"Boolean indicating whether the patient is currently exposed to tumor necrosis factor alpha inhibitor."} ;; "the patient is currently being treated with tumor necrosis factor inhibitor therapy"

(declare-const patient_is_exposed_to_tumor_necrosis_factor_alpha_inhibitor_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been treated with tumor necrosis factor alpha inhibitor in the past.","when_to_set_to_false":"Set to false if the patient has never been treated with tumor necrosis factor alpha inhibitor in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been treated with tumor necrosis factor alpha inhibitor in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to tumor necrosis factor alpha inhibitor in the past."} ;; "tumor necrosis factor inhibitor"

(declare-const patient_is_exposed_to_tumor_necrosis_factor_alpha_inhibitor_inthehistory@@discontinued_less_than_five_half_lives_ago Bool) ;; {"when_to_set_to_true":"Set to true if the patient discontinued tumor necrosis factor alpha inhibitor therapy less than five half-lives ago.","when_to_set_to_false":"Set to false if the patient discontinued tumor necrosis factor alpha inhibitor therapy five or more half-lives ago, or has not discontinued therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient discontinued tumor necrosis factor alpha inhibitor therapy.","meaning":"Boolean indicating whether the patient discontinued tumor necrosis factor alpha inhibitor therapy less than five half-lives ago."} ;; "the patient has discontinued tumor necrosis factor inhibitor therapy less than five half-lives ago"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_tumor_necrosis_factor_alpha_inhibitor_inthehistory@@discontinued_less_than_five_half_lives_ago
     patient_is_exposed_to_tumor_necrosis_factor_alpha_inhibitor_inthehistory)
:named REQ1_AUXILIARY0)) ;; "discontinued tumor necrosis factor inhibitor therapy less than five half-lives ago" implies "has ever been exposed to tumor necrosis factor inhibitor"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT be currently treated with TNF inhibitor
(assert
(! (not patient_is_exposed_to_tumor_necrosis_factor_alpha_inhibitor_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is currently being treated with tumor necrosis factor inhibitor therapy"

;; Exclusion: patient must NOT have discontinued TNF inhibitor therapy less than five half-lives ago
(assert
(! (not patient_is_exposed_to_tumor_necrosis_factor_alpha_inhibitor_inthehistory@@discontinued_less_than_five_half_lives_ago)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has discontinued tumor necrosis factor inhibitor therapy less than five half-lives ago"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an active infection of any type.","when_to_set_to_false":"Set to false if the patient currently does not have an active infection of any type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an active infection.","meaning":"Boolean indicating whether the patient currently has an active infection of any type."} ;; "the patient has active infection"

(declare-const patient_has_finding_of_tuberculosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of tuberculosis infection at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of tuberculosis infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of tuberculosis infection.","meaning":"Boolean indicating whether the patient has ever had tuberculosis infection in the past."} ;; "the patient has a history of pulmonary tuberculosis infection with or without documented adequate therapy"

(declare-const patient_has_finding_of_tuberculosis_inthehistory@@anatomical_site_pulmonary Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of tuberculosis infection involved the lungs (pulmonary tuberculosis).","when_to_set_to_false":"Set to false if the patient's history of tuberculosis infection did not involve the lungs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tuberculosis infection was pulmonary.","meaning":"Boolean indicating whether the patient's tuberculosis infection was pulmonary (lung involvement)."} ;; "pulmonary tuberculosis infection"

(declare-const patient_has_finding_of_tuberculosis_inthehistory@@recent_close_exposure_to_individual_with_active_tuberculosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of tuberculosis infection is due to recent close exposure to an individual with active tuberculosis infection.","when_to_set_to_false":"Set to false if the patient's history of tuberculosis infection is not due to recent close exposure to an individual with active tuberculosis infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tuberculosis infection was due to recent close exposure to an individual with active tuberculosis infection.","meaning":"Boolean indicating whether the patient's tuberculosis infection is due to recent close exposure to an individual with active tuberculosis infection."} ;; "recent close exposure to an individual with active tuberculosis infection" (as a qualifier for history of TB)

(declare-const patient_has_finding_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active tuberculosis infection.","when_to_set_to_false":"Set to false if the patient currently does not have active tuberculosis infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active tuberculosis infection.","meaning":"Boolean indicating whether the patient currently has active tuberculosis infection."} ;; "current active tuberculosis infection"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for pulmonary TB implies history of TB
(assert
(! (=> patient_has_finding_of_tuberculosis_inthehistory@@anatomical_site_pulmonary
       patient_has_finding_of_tuberculosis_inthehistory)
    :named REQ2_AUXILIARY0)) ;; "pulmonary tuberculosis infection" implies "history of tuberculosis infection"

;; Qualifier variable for recent close exposure as cause of TB history implies history of TB
(assert
(! (=> patient_has_finding_of_tuberculosis_inthehistory@@recent_close_exposure_to_individual_with_active_tuberculosis
       patient_has_finding_of_tuberculosis_inthehistory)
    :named REQ2_AUXILIARY1)) ;; "history of tuberculosis infection due to recent close exposure" implies "history of tuberculosis infection"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have active infection of any type
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has active infection"

;; Exclusion: patient must NOT have a history of pulmonary tuberculosis infection (with or without documented adequate therapy)
(assert
(! (not patient_has_finding_of_tuberculosis_inthehistory@@anatomical_site_pulmonary)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of pulmonary tuberculosis infection with or without documented adequate therapy"

;; Exclusion: patient must NOT have current active tuberculosis infection
(assert
(! (not patient_has_finding_of_active_tuberculosis_now)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has current active tuberculosis infection"

;; Exclusion: patient must NOT have had recent close exposure to an individual with active tuberculosis infection
(assert
(! (not patient_has_finding_of_tuberculosis_inthehistory@@recent_close_exposure_to_individual_with_active_tuberculosis)
    :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has had recent close exposure to an individual with active tuberculosis infection"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_pleural_scarring_on_chest_x_ray_read_by_radiologist_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a chest x-ray read by a radiologist that shows pleural scarring.","when_to_set_to_false":"Set to false if the patient has never had a chest x-ray read by a radiologist that shows pleural scarring.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a chest x-ray read by a radiologist that shows pleural scarring.","meaning":"Boolean indicating whether the patient has ever had a chest x-ray read by a radiologist that shows pleural scarring."} ;; "the patient has a chest x-ray read by a radiologist showing pleural scarring"

(declare-const patient_has_finding_of_calcified_granuloma_consistent_with_prior_tuberculosis_infection_on_chest_x_ray_read_by_radiologist_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a chest x-ray read by a radiologist that shows a calcified granuloma consistent with prior tuberculosis infection.","when_to_set_to_false":"Set to false if the patient has never had a chest x-ray read by a radiologist that shows a calcified granuloma consistent with prior tuberculosis infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a chest x-ray read by a radiologist that shows a calcified granuloma consistent with prior tuberculosis infection.","meaning":"Boolean indicating whether the patient has ever had a chest x-ray read by a radiologist that shows a calcified granuloma consistent with prior tuberculosis infection."} ;; "the patient has a chest x-ray read by a radiologist showing calcified granuloma consistent with prior tuberculosis infection"

(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a plain chest x-ray at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a plain chest x-ray at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a plain chest x-ray.","meaning":"Boolean indicating whether the patient has ever undergone a plain chest x-ray in their history."} ;; "chest x-ray"

(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory@@read_by_radiologist Bool) ;; {"when_to_set_to_true":"Set to true if the patient's plain chest x-ray was read by a radiologist.","when_to_set_to_false":"Set to false if the patient's plain chest x-ray was not read by a radiologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's plain chest x-ray was read by a radiologist.","meaning":"Boolean indicating whether the patient's plain chest x-ray was read by a radiologist."} ;; "chest x-ray read by a radiologist"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_plain_chest_x_ray_inthehistory@@read_by_radiologist
      patient_has_undergone_plain_chest_x_ray_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "chest x-ray read by a radiologist"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_pleural_scarring_on_chest_x_ray_read_by_radiologist_ever)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a chest x-ray read by a radiologist showing pleural scarring"

(assert
(! (not patient_has_finding_of_calcified_granuloma_consistent_with_prior_tuberculosis_infection_on_chest_x_ray_read_by_radiologist_ever)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a chest x-ray read by a radiologist showing calcified granuloma consistent with prior tuberculosis infection"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_hiv_positive_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a confirmed positive test for HIV infection at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a confirmed positive test for HIV infection at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a confirmed positive test for HIV infection.","meaning":"Boolean indicating whether the patient has ever had a confirmed positive test for HIV infection at any point in their medical history."} ;; "positive test for human immunodeficiency virus infection"

(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of HIV infection at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of HIV infection at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of HIV infection.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of HIV infection at any point in their medical history."} ;; "prior history of human immunodeficiency virus infection"

(declare-const patient_has_diagnosis_of_type_b_viral_hepatitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of hepatitis B virus infection at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of hepatitis B virus infection at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of hepatitis B virus infection.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of hepatitis B virus infection at any point in their medical history."} ;; "prior history of hepatitis B virus infection"

(declare-const patient_has_diagnosis_of_viral_hepatitis_c_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of hepatitis C virus infection at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of hepatitis C virus infection at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of hepatitis C virus infection.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of hepatitis C virus infection at any point in their medical history."} ;; "prior history of hepatitis C virus infection"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_hiv_positive_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive test for human immunodeficiency virus infection."

(assert
(! (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior history of human immunodeficiency virus infection."

(assert
(! (not patient_has_diagnosis_of_type_b_viral_hepatitis_inthehistory)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior history of hepatitis B virus infection."

(assert
(! (not patient_has_diagnosis_of_viral_hepatitis_c_inthehistory)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior history of hepatitis C virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_congestive_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with congestive heart failure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with congestive heart failure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with congestive heart failure.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of congestive heart failure in their medical history."} ;; "the patient has a history of congestive heart failure"

(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congestive heart failure."} ;; "the patient has a concomitant diagnosis of congestive heart failure"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_diagnosis_of_congestive_heart_failure_inthehistory)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of congestive heart failure."

(assert
  (! (not patient_has_diagnosis_of_congestive_heart_failure_now)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concomitant diagnosis of congestive heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (malignant neoplasm) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (malignant neoplasm) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (malignant neoplasm).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (malignant neoplasm) in their history."} ;; "the patient has a history of malignant neoplasm"

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@is_superficial Bool) ;; {"when_to_set_to_true":"Set to true if the malignant neoplastic disease diagnosis refers to a superficial malignant neoplasm.","when_to_set_to_false":"Set to false if the malignant neoplastic disease diagnosis does not refer to a superficial malignant neoplasm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease diagnosis refers to a superficial malignant neoplasm.","meaning":"Boolean indicating whether the malignant neoplastic disease diagnosis is superficial."} ;; "superficial malignant neoplasm"

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@not_deemed_cured Bool) ;; {"when_to_set_to_true":"Set to true if the patient has NOT been deemed cured of the superficial malignant neoplastic disease diagnosis.","when_to_set_to_false":"Set to false if the patient has been deemed cured of the superficial malignant neoplastic disease diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been deemed cured of the superficial malignant neoplastic disease diagnosis.","meaning":"Boolean indicating whether the patient has NOT been deemed cured of the superficial malignant neoplastic disease diagnosis."} ;; "NOT deemed cured of superficial malignant neoplasm"

(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cutaneous basal cell carcinoma at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cutaneous basal cell carcinoma at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cutaneous basal cell carcinoma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cutaneous basal cell carcinoma in their history."} ;; "cutaneous basal cell carcinoma"

(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cutaneous squamous cell carcinoma at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cutaneous squamous cell carcinoma at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cutaneous squamous cell carcinoma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cutaneous squamous cell carcinoma in their history."} ;; "cutaneous squamous cell carcinoma"

(declare-const patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with carcinoma in situ of uterine cervix at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with carcinoma in situ of uterine cervix at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with carcinoma in situ of uterine cervix.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of carcinoma in situ of uterine cervix in their history."} ;; "cervical carcinoma in situ"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply superficial malignant neoplasm
(assert
(! (=> (or patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory
           patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory
           patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory)
        (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
             patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@is_superficial))
   :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (cutaneous basal cell carcinoma, cutaneous squamous cell carcinoma, cervical carcinoma in situ)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@is_superficial
       patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
   :named REQ6_AUXILIARY1)) ;; "superficial malignant neoplasm" is a type of malignant neoplasm

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient has a history of malignant neoplasm AND is NOT deemed cured of superficial malignant neoplasm
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
             (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@is_superficial)
                 patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@not_deemed_cured)))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of malignant neoplasm) AND (the patient is NOT deemed cured of superficial malignant neoplasm with non-exhaustive examples (cutaneous basal cell carcinoma, cutaneous squamous cell carcinoma, cervical carcinoma in situ)))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_hypersensitivity_to_pharmaceutical_biologic_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to any pharmaceutical biologic product.","when_to_set_to_false":"Set to false if the patient has no documented history of hypersensitivity to any pharmaceutical biologic product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to any pharmaceutical biologic product.","meaning":"Boolean indicating whether the patient has ever had known hypersensitivity to any pharmaceutical biologic product."} ;; "the patient has known hypersensitivity to Chinese hamster ovary cell derived biological product"
(declare-const patient_has_hypersensitivity_to_pharmaceutical_biologic_product_inthehistory@@derived_from_chinese_hamster_ovary_cells Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to a pharmaceutical biologic product that is derived from Chinese hamster ovary cells.","when_to_set_to_false":"Set to false if the patient has no documented history of hypersensitivity to a pharmaceutical biologic product derived from Chinese hamster ovary cells.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity is to a product derived from Chinese hamster ovary cells.","meaning":"Boolean indicating whether the patient has ever had known hypersensitivity to a pharmaceutical biologic product derived from Chinese hamster ovary cells."} ;; "the patient has known hypersensitivity to Chinese hamster ovary cell derived biological product"
(declare-const patient_has_hypersensitivity_to_recombinant_interleukin_1_receptor_antagonist_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to any recombinant interleukin-1 receptor antagonist containing product.","when_to_set_to_false":"Set to false if the patient has no documented history of hypersensitivity to any recombinant interleukin-1 receptor antagonist containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to any recombinant interleukin-1 receptor antagonist containing product.","meaning":"Boolean indicating whether the patient has ever had known hypersensitivity to any recombinant interleukin-1 receptor antagonist containing product."} ;; "the patient has known hypersensitivity to any component of interleukin-1 trap"
(declare-const patient_has_hypersensitivity_to_recombinant_interleukin_1_receptor_antagonist_containing_product_inthehistory@@to_any_component_of_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to any component of a recombinant interleukin-1 receptor antagonist containing product.","when_to_set_to_false":"Set to false if the patient has no documented history of hypersensitivity to any component of a recombinant interleukin-1 receptor antagonist containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity is to any component of the product.","meaning":"Boolean indicating whether the patient has ever had known hypersensitivity to any component of a recombinant interleukin-1 receptor antagonist containing product."} ;; "the patient has known hypersensitivity to any component of interleukin-1 trap"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable (Chinese hamster ovary cell derived biological product)
(assert
(! (=> patient_has_hypersensitivity_to_pharmaceutical_biologic_product_inthehistory@@derived_from_chinese_hamster_ovary_cells
      patient_has_hypersensitivity_to_pharmaceutical_biologic_product_inthehistory)
    :named REQ7_AUXILIARY0)) ;; "the patient has known hypersensitivity to Chinese hamster ovary cell derived biological product"

;; Qualifier variable implies corresponding stem variable (any component of interleukin-1 trap)
(assert
(! (=> patient_has_hypersensitivity_to_recombinant_interleukin_1_receptor_antagonist_containing_product_inthehistory@@to_any_component_of_product
      patient_has_hypersensitivity_to_recombinant_interleukin_1_receptor_antagonist_containing_product_inthehistory)
    :named REQ7_AUXILIARY1)) ;; "the patient has known hypersensitivity to any component of interleukin-1 trap"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have known hypersensitivity to Chinese hamster ovary cell derived biological product
(assert
(! (not patient_has_hypersensitivity_to_pharmaceutical_biologic_product_inthehistory@@derived_from_chinese_hamster_ovary_cells)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has known hypersensitivity to Chinese hamster ovary cell derived biological product"

;; Exclusion: patient must NOT have known hypersensitivity to any component of interleukin-1 trap
(assert
(! (not patient_has_hypersensitivity_to_recombinant_interleukin_1_receptor_antagonist_containing_product_inthehistory@@to_any_component_of_product)
    :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has known hypersensitivity to any component of interleukin-1 trap"

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_rheumatic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a rheumatic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a rheumatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a rheumatic disease.","meaning":"Boolean indicating whether the patient currently has a rheumatic disease."} ;; "the patient has any additional rheumatic disease"
(declare-const patient_has_finding_of_rheumatic_disease_now@@additional Bool) ;; {"when_to_set_to_true":"Set to true if the patient's rheumatic disease is additional to the patient's autoinflammatory disease.","when_to_set_to_false":"Set to false if the patient's rheumatic disease is not additional to the patient's autoinflammatory disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's rheumatic disease is additional to the patient's autoinflammatory disease.","meaning":"Boolean indicating that the rheumatic disease is additional to the patient's autoinflammatory disease."} ;; "any additional rheumatic disease"
(declare-const patient_has_finding_of_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a systemic disease.","meaning":"Boolean indicating whether the patient currently has a systemic disease."} ;; "significant systemic disease"
(declare-const patient_has_finding_of_systemic_disease_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's systemic disease is significant.","when_to_set_to_false":"Set to false if the patient's systemic disease is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's systemic disease is significant.","meaning":"Boolean indicating whether the patient's systemic disease is significant."} ;; "significant systemic disease"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infectious disease is chronic.","when_to_set_to_false":"Set to false if the patient's infectious disease is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's infectious disease is chronic.","meaning":"Boolean indicating whether the patient's infectious disease is chronic."} ;; "major chronic infectious disease"
(declare-const patient_has_finding_of_inflammatory_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inflammatory disease.","when_to_set_to_false":"Set to false if the patient currently does not have an inflammatory disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inflammatory disease.","meaning":"Boolean indicating whether the patient currently has an inflammatory disease."} ;; "major chronic inflammatory disease"
(declare-const patient_has_finding_of_inflammatory_disorder_now@@major Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inflammatory disease is major.","when_to_set_to_false":"Set to false if the patient's inflammatory disease is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inflammatory disease is major.","meaning":"Boolean indicating whether the patient's inflammatory disease is major."} ;; "major chronic inflammatory disease"
(declare-const patient_has_finding_of_inflammatory_disorder_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inflammatory disease is chronic.","when_to_set_to_false":"Set to false if the patient's inflammatory disease is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inflammatory disease is chronic.","meaning":"Boolean indicating whether the patient's inflammatory disease is chronic."} ;; "major chronic inflammatory disease"
(declare-const patient_has_finding_of_major_chronic_immunologic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a major chronic immunologic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a major chronic immunologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a major chronic immunologic disease.","meaning":"Boolean indicating whether the patient currently has a major chronic immunologic disease."} ;; "major chronic immunologic disease"
(declare-const patient_has_finding_of_inflammatory_bowel_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inflammatory bowel disease.","when_to_set_to_false":"Set to false if the patient currently does not have inflammatory bowel disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inflammatory bowel disease.","meaning":"Boolean indicating whether the patient currently has inflammatory bowel disease."} ;; "inflammatory bowel disease"
(declare-const patient_has_finding_of_psoriatic_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psoriatic arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have psoriatic arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psoriatic arthritis.","meaning":"Boolean indicating whether the patient currently has psoriatic arthritis."} ;; "psoriatic arthritis"
(declare-const patient_has_finding_of_disorder_of_joint_of_spine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has spondyloarthropathy.","when_to_set_to_false":"Set to false if the patient currently does not have spondyloarthropathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has spondyloarthropathy.","meaning":"Boolean indicating whether the patient currently has spondyloarthropathy."} ;; "spondyloarthropathy"
(declare-const patient_has_finding_of_systemic_lupus_erythematosus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systemic lupus erythematosus.","when_to_set_to_false":"Set to false if the patient currently does not have systemic lupus erythematosus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systemic lupus erythematosus.","meaning":"Boolean indicating whether the patient currently has systemic lupus erythematosus."} ;; "systemic lupus erythematosus"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_rheumatic_disease_now@@additional
      patient_has_finding_of_rheumatic_disease_now)
:named REQ8_AUXILIARY0)) ;; "any additional rheumatic disease"

(assert
(! (=> patient_has_finding_of_systemic_disease_now@@significant
      patient_has_finding_of_systemic_disease_now)
:named REQ8_AUXILIARY1)) ;; "significant systemic disease"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@major
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ8_AUXILIARY2)) ;; "major chronic infectious disease"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@chronic
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ8_AUXILIARY3)) ;; "major chronic infectious disease"

(assert
(! (=> patient_has_finding_of_inflammatory_disorder_now@@major
      patient_has_finding_of_inflammatory_disorder_now)
:named REQ8_AUXILIARY4)) ;; "major chronic inflammatory disease"

(assert
(! (=> patient_has_finding_of_inflammatory_disorder_now@@chronic
      patient_has_finding_of_inflammatory_disorder_now)
:named REQ8_AUXILIARY5)) ;; "major chronic inflammatory disease"

;; Non-exhaustive examples: listed diseases imply major chronic immunologic disease
(assert
(! (=> (or patient_has_finding_of_inflammatory_bowel_disease_now
          patient_has_finding_of_psoriatic_arthritis_now
          patient_has_finding_of_disorder_of_joint_of_spine_now
          patient_has_finding_of_systemic_lupus_erythematosus_now)
      patient_has_finding_of_major_chronic_immunologic_disease_now)
:named REQ8_AUXILIARY6)) ;; "major chronic immunologic disease such as inflammatory bowel disease, psoriatic arthritis, spondyloarthropathy, or systemic lupus erythematosus"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have any additional rheumatic disease
(assert
(! (not patient_has_finding_of_rheumatic_disease_now@@additional)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any additional rheumatic disease."

;; Exclusion: patient must NOT have significant systemic disease in addition to autoinflammatory disease
(assert
(! (not (or patient_has_finding_of_systemic_disease_now@@significant
            patient_has_finding_of_disorder_due_to_infection_now@@major
            patient_has_finding_of_disorder_due_to_infection_now@@chronic
            patient_has_finding_of_inflammatory_disorder_now@@major
            patient_has_finding_of_inflammatory_disorder_now@@chronic
            patient_has_finding_of_major_chronic_immunologic_disease_now))
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant systemic disease with non-exhaustive examples (major chronic infectious disease, major chronic inflammatory disease, major chronic immunologic disease such as inflammatory bowel disease, psoriatic arthritis, spondyloarthropathy, or systemic lupus erythematosus) in addition to autoinflammatory disease."
