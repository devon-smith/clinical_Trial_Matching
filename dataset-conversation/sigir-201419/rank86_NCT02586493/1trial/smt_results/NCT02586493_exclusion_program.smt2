;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "has a current primary diagnosis of asthma."
(declare-const patient_has_diagnosis_of_asthma_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of asthma is the primary diagnosis.","when_to_set_to_false":"Set to false if the patient's current diagnosis of asthma is not the primary diagnosis (e.g., it is a secondary or comorbid diagnosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of asthma is primary.","meaning":"Boolean indicating whether the patient's current diagnosis of asthma is the primary diagnosis."} ;; "has a current primary diagnosis of asthma."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_asthma_now@@primary_diagnosis
      patient_has_diagnosis_of_asthma_now)
:named REQ0_AUXILIARY0)) ;; "primary diagnosis of asthma" implies "diagnosis of asthma"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_asthma_now@@primary_diagnosis)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current primary diagnosis of asthma."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive lung disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive lung disease."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@treated_as_daily_therapy_either_as_needed_or_regularly_scheduled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive lung disease and is treated as daily therapy, either as needed or regularly scheduled.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of chronic obstructive lung disease but is not treated as daily therapy, or not as needed/regularly scheduled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is treated as daily therapy, either as needed or regularly scheduled.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive lung disease and is treated as daily therapy, either as needed or regularly scheduled."} ;; "as daily chronic obstructive pulmonary disease therapy (as needed OR regularly scheduled)"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@maintenance_therapy_changed_within_4_weeks_prior_to_screening_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive lung disease and has changed maintenance therapy within four weeks prior to Screening/Visit 1.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of chronic obstructive lung disease but has not changed maintenance therapy within four weeks prior to Screening/Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has changed maintenance therapy within four weeks prior to Screening/Visit 1.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive lung disease and has changed maintenance therapy within four weeks prior to Screening/Visit 1."} ;; "has changed maintenance chronic obstructive pulmonary disease treatment within four weeks prior to Screening/Visit 1"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@treatment_planned_to_be_changed_within_4_weeks_of_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive lung disease and plans to change treatment within four weeks of Visit 1.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of chronic obstructive lung disease but does not plan to change treatment within four weeks of Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient plans to change treatment within four weeks of Visit 1.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive lung disease and plans to change treatment within four weeks of Visit 1."} ;; "plans to change chronic obstructive pulmonary disease treatment within four weeks of Visit 1"
(declare-const patient_is_exposed_to_albuterol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to albuterol.","when_to_set_to_false":"Set to false if the patient is currently not exposed to albuterol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to albuterol.","meaning":"Boolean indicating whether the patient is currently exposed to albuterol."} ;; "albuterol"
(declare-const patient_is_exposed_to_albuterol_now@@as_inhaled_short_acting_beta_adrenergic_agonist_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to albuterol specifically as inhaled short-acting beta-adrenergic agonist therapy.","when_to_set_to_false":"Set to false if the patient is currently exposed to albuterol but not as inhaled short-acting beta-adrenergic agonist therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to albuterol is as inhaled short-acting beta-adrenergic agonist therapy.","meaning":"Boolean indicating whether the patient is currently exposed to albuterol specifically as inhaled short-acting beta-adrenergic agonist therapy."} ;; "inhaled short-acting beta-adrenergic agonist therapy"
(declare-const patient_is_exposed_to_albuterol_now@@as_daily_copd_therapy_either_as_needed_or_regularly_scheduled Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to albuterol as daily therapy for chronic obstructive pulmonary disease, either as needed or regularly scheduled.","when_to_set_to_false":"Set to false if the patient is currently exposed to albuterol but not as daily therapy for chronic obstructive pulmonary disease, or not as needed/regularly scheduled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to albuterol is as daily therapy for chronic obstructive pulmonary disease, either as needed or regularly scheduled.","meaning":"Boolean indicating whether the patient is currently exposed to albuterol as daily therapy for chronic obstructive pulmonary disease, either as needed or regularly scheduled."} ;; "as daily chronic obstructive pulmonary disease therapy (as needed OR regularly scheduled)"
(declare-const patient_is_receiving_only_inhaled_short_acting_beta_adrenergic_agonist_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving only inhaled short-acting beta-adrenergic agonist therapy and no other chronic obstructive pulmonary disease therapy.","when_to_set_to_false":"Set to false if the patient is currently receiving inhaled short-acting beta-adrenergic agonist therapy along with other chronic obstructive pulmonary disease therapies, or is not receiving inhaled short-acting beta-adrenergic agonist therapy at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving only inhaled short-acting beta-adrenergic agonist therapy.","meaning":"Boolean indicating whether the patient is currently receiving only inhaled short-acting beta-adrenergic agonist therapy (and no other chronic obstructive pulmonary disease therapy)."} ;; "receiving only inhaled short-acting beta-adrenergic agonist therapy"
(declare-const patient_is_receiving_only_inhaled_short_acting_beta_adrenergic_agonist_therapy_now@@as_daily_copd_therapy_either_as_needed_or_regularly_scheduled Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving only inhaled short-acting beta-adrenergic agonist therapy as daily chronic obstructive pulmonary disease therapy, either as needed or regularly scheduled.","when_to_set_to_false":"Set to false if the patient is currently receiving only inhaled short-acting beta-adrenergic agonist therapy but not as daily chronic obstructive pulmonary disease therapy, or not as needed/regularly scheduled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy is used as daily chronic obstructive pulmonary disease therapy, either as needed or regularly scheduled.","meaning":"Boolean indicating whether the patient is currently receiving only inhaled short-acting beta-adrenergic agonist therapy as daily chronic obstructive pulmonary disease therapy, either as needed or regularly scheduled."} ;; "as daily chronic obstructive pulmonary disease therapy (as needed OR regularly scheduled)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Exhaustive subcategories: "only inhaled short-acting beta-adrenergic agonist therapy" ≡ "only albuterol as inhaled short-acting beta-adrenergic agonist therapy"
(assert
(! (= patient_is_receiving_only_inhaled_short_acting_beta_adrenergic_agonist_therapy_now
     patient_is_exposed_to_albuterol_now@@as_inhaled_short_acting_beta_adrenergic_agonist_therapy)
:named REQ1_AUXILIARY0)) ;; "with exhaustive subcategories (albuterol therapy)"

;; Qualifier variable implies stem variable for albuterol exposure
(assert
(! (=> patient_is_exposed_to_albuterol_now@@as_inhaled_short_acting_beta_adrenergic_agonist_therapy
       patient_is_exposed_to_albuterol_now)
:named REQ1_AUXILIARY1)) ;; "albuterol as inhaled short-acting beta-adrenergic agonist therapy"

;; Qualifier variable implies stem variable for albuterol as daily COPD therapy
(assert
(! (=> patient_is_exposed_to_albuterol_now@@as_daily_copd_therapy_either_as_needed_or_regularly_scheduled
       patient_is_exposed_to_albuterol_now)
:named REQ1_AUXILIARY2)) ;; "albuterol as daily chronic obstructive pulmonary disease therapy (as needed OR regularly scheduled)"

;; Qualifier variable implies stem variable for only inhaled SABA as daily COPD therapy
(assert
(! (=> patient_is_receiving_only_inhaled_short_acting_beta_adrenergic_agonist_therapy_now@@as_daily_copd_therapy_either_as_needed_or_regularly_scheduled
       patient_is_receiving_only_inhaled_short_acting_beta_adrenergic_agonist_therapy_now)
:named REQ1_AUXILIARY3)) ;; "only inhaled short-acting beta-adrenergic agonist therapy as daily chronic obstructive pulmonary disease therapy (as needed OR regularly scheduled)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is excluded if any of the following is true:
;; (1) patient is receiving only inhaled SABA as daily COPD therapy (as needed or regularly scheduled)
;; (2) patient has changed maintenance COPD therapy within 4 weeks prior to Screening/Visit 1
;; (3) patient plans to change COPD therapy within 4 weeks of Visit 1
(assert
(! (not (or patient_is_receiving_only_inhaled_short_acting_beta_adrenergic_agonist_therapy_now@@as_daily_copd_therapy_either_as_needed_or_regularly_scheduled
            patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@maintenance_therapy_changed_within_4_weeks_prior_to_screening_visit_1
            patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@treatment_planned_to_be_changed_within_4_weeks_of_visit_1))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is receiving only inhaled short-acting beta-adrenergic agonist therapy with exhaustive subcategories (albuterol therapy) as daily chronic obstructive pulmonary disease therapy (as needed OR regularly scheduled)) OR (the patient has changed maintenance chronic obstructive pulmonary disease treatment within four weeks prior to Screening/Visit 1) OR (the patient plans to change chronic obstructive pulmonary disease treatment within four weeks of Visit 1))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of chronic obstructive pulmonary disease (COPD) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of chronic obstructive pulmonary disease (COPD) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of chronic obstructive pulmonary disease (COPD) in the past."} ;; "chronic obstructive pulmonary disease"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an acute exacerbation of chronic obstructive pulmonary disease (COPD) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an acute exacerbation of chronic obstructive pulmonary disease (COPD) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an acute exacerbation of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient has ever had an acute exacerbation of chronic obstructive pulmonary disease (COPD) in the past."} ;; "chronic obstructive pulmonary disease exacerbation"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within4weeks_of_visit1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute exacerbation of COPD occurred within four weeks of Visit 1.","when_to_set_to_false":"Set to false if the patient's acute exacerbation of COPD did not occur within four weeks of Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute exacerbation of COPD occurred within four weeks of Visit 1.","meaning":"Boolean indicating whether the patient's acute exacerbation of COPD occurred within four weeks of Visit 1."} ;; "within four weeks of Visit 1"

(declare-const patient_has_undergone_administration_of_steroid_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone administration of systemic corticosteroid therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone administration of systemic corticosteroid therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of systemic corticosteroid therapy.","meaning":"Boolean indicating whether the patient has ever undergone administration of systemic corticosteroid therapy in the past."} ;; "corticosteroid therapy"

(declare-const patient_has_undergone_administration_of_steroid_inthehistory@@route_oral Bool) ;; {"when_to_set_to_true":"Set to true if the patient's administration of systemic corticosteroid therapy was by the oral route.","when_to_set_to_false":"Set to false if the patient's administration of systemic corticosteroid therapy was not by the oral route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration of systemic corticosteroid therapy was by the oral route.","meaning":"Boolean indicating whether the administration of systemic corticosteroid therapy was by the oral route."} ;; "oral corticosteroid therapy"

(declare-const patient_has_undergone_administration_of_steroid_inthehistory@@route_parenteral Bool) ;; {"when_to_set_to_true":"Set to true if the patient's administration of systemic corticosteroid therapy was by the parenteral route.","when_to_set_to_false":"Set to false if the patient's administration of systemic corticosteroid therapy was not by the parenteral route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration of systemic corticosteroid therapy was by the parenteral route.","meaning":"Boolean indicating whether the administration of systemic corticosteroid therapy was by the parenteral route."} ;; "parenteral corticosteroid therapy"

(declare-const patient_has_undergone_administration_of_steroid_inthehistory@@route_depot Bool) ;; {"when_to_set_to_true":"Set to true if the patient's administration of systemic corticosteroid therapy was by the depot route.","when_to_set_to_false":"Set to false if the patient's administration of systemic corticosteroid therapy was not by the depot route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration of systemic corticosteroid therapy was by the depot route.","meaning":"Boolean indicating whether the administration of systemic corticosteroid therapy was by the depot route."} ;; "depot corticosteroid therapy"

(declare-const patient_has_undergone_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone antibiotic therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone antibiotic therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone antibiotic therapy.","meaning":"Boolean indicating whether the patient has ever undergone antibiotic therapy in the past."} ;; "antibiotic therapy"

(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within4weeks_of_visit1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's antibiotic therapy occurred within four weeks of Visit 1.","when_to_set_to_false":"Set to false if the patient's antibiotic therapy did not occur within four weeks of Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy occurred within four weeks of Visit 1.","meaning":"Boolean indicating whether the patient's antibiotic therapy occurred within four weeks of Visit 1."} ;; "antibiotic therapy within four weeks of Visit 1"

(declare-const patient_has_undergone_hospitalization_for_chronic_obstructive_pulmonary_disease_inthehistory@@temporalcontext_within3months_prior_to_visit1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hospitalization for chronic obstructive pulmonary disease within three months prior to Visit 1.","when_to_set_to_false":"Set to false if the patient has not undergone hospitalization for chronic obstructive pulmonary disease within three months prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hospitalization for chronic obstructive pulmonary disease within three months prior to Visit 1.","meaning":"Boolean indicating whether the patient has undergone hospitalization for chronic obstructive pulmonary disease within three months prior to Visit 1."} ;; "hospitalization for chronic obstructive pulmonary disease within three months prior to Visit 1"

(declare-const patient_has_uncontrolled_chronic_obstructive_pulmonary_disease_now@@in_investigators_judgment_affecting_ability_to_evaluate_ease_and_correct_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncontrolled chronic obstructive pulmonary disease, in the investigator's judgment, that would affect the patient's ability to evaluate ease of use and correct use.","when_to_set_to_false":"Set to false if the patient currently does not have uncontrolled chronic obstructive pulmonary disease, in the investigator's judgment, that would affect the patient's ability to evaluate ease of use and correct use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled chronic obstructive pulmonary disease, in the investigator's judgment, that would affect the patient's ability to evaluate ease of use and correct use.","meaning":"Boolean indicating whether the patient currently has uncontrolled chronic obstructive pulmonary disease, in the investigator's judgment, that would affect the patient's ability to evaluate ease of use and correct use."} ;; "uncontrolled chronic obstructive pulmonary disease, in the investigator's judgment, that would affect the patient's ability to evaluate ease of use and correct use"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Exhaustive subcategories for systemic corticosteroid therapy
(assert
(! (= patient_has_undergone_administration_of_steroid_inthehistory
(or patient_has_undergone_administration_of_steroid_inthehistory@@route_oral
    patient_has_undergone_administration_of_steroid_inthehistory@@route_parenteral
    patient_has_undergone_administration_of_steroid_inthehistory@@route_depot))
:named REQ2_AUXILIARY0)) ;; "systemic corticosteroid therapy with exhaustive subcategories (oral corticosteroid therapy OR parenteral corticosteroid therapy OR depot corticosteroid therapy)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_administration_of_steroid_inthehistory@@route_oral
       patient_has_undergone_administration_of_steroid_inthehistory)
:named REQ2_AUXILIARY1)) ;; "oral corticosteroid therapy is a type of systemic corticosteroid therapy"

(assert
(! (=> patient_has_undergone_administration_of_steroid_inthehistory@@route_parenteral
       patient_has_undergone_administration_of_steroid_inthehistory)
:named REQ2_AUXILIARY2)) ;; "parenteral corticosteroid therapy is a type of systemic corticosteroid therapy"

(assert
(! (=> patient_has_undergone_administration_of_steroid_inthehistory@@route_depot
       patient_has_undergone_administration_of_steroid_inthehistory)
:named REQ2_AUXILIARY3)) ;; "depot corticosteroid therapy is a type of systemic corticosteroid therapy"

;; Qualifier variables for antibiotic therapy imply stem variable
(assert
(! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within4weeks_of_visit1
       patient_has_undergone_antibiotic_therapy_inthehistory)
:named REQ2_AUXILIARY4)) ;; "antibiotic therapy within four weeks of Visit 1"

;; Qualifier variables for acute exacerbation imply stem variable
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within4weeks_of_visit1
       patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
:named REQ2_AUXILIARY5)) ;; "acute exacerbation of COPD within four weeks of Visit 1"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: (COPD exacerbation requiring systemic corticosteroid therapy (any route) OR antibiotic therapy) within 4 weeks of Visit 1
(assert
(! (not (or
         (and patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within4weeks_of_visit1
              (or patient_has_undergone_administration_of_steroid_inthehistory@@route_oral
                  patient_has_undergone_administration_of_steroid_inthehistory@@route_parenteral
                  patient_has_undergone_administration_of_steroid_inthehistory@@route_depot))
         patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within4weeks_of_visit1))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "chronic obstructive pulmonary disease exacerbation requiring systemic corticosteroid therapy (oral, parenteral, or depot) OR antibiotic therapy within four weeks of Visit 1"

;; Exclusion: any hospitalization for COPD within 3 months prior to Visit 1
(assert
(! (not patient_has_undergone_hospitalization_for_chronic_obstructive_pulmonary_disease_inthehistory@@temporalcontext_within3months_prior_to_visit1)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "any hospitalization for chronic obstructive pulmonary disease within three months prior to Visit 1"

;; Exclusion: uncontrolled COPD, in investigator's judgment, affecting ability to evaluate ease/correct use
(assert
(! (not patient_has_uncontrolled_chronic_obstructive_pulmonary_disease_now@@in_investigators_judgment_affecting_ability_to_evaluate_ease_and_correct_use)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "uncontrolled chronic obstructive pulmonary disease, in the investigator's judgment, that would affect the patient's ability to evaluate ease of use and correct use"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active tuberculosis.","meaning":"Boolean indicating whether the patient currently has active tuberculosis."} ;; "active tuberculosis"
(declare-const patient_has_finding_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bronchiectasis.","meaning":"Boolean indicating whether the patient currently has bronchiectasis."} ;; "bronchiectasis"
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder of lung (pulmonary disease).","when_to_set_to_false":"Set to false if the patient currently does not have any disorder of lung (pulmonary disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder of lung (pulmonary disease).","meaning":"Boolean indicating whether the patient currently has any disorder of lung (pulmonary disease)."} ;; "pulmonary disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an active disorder of lung (pulmonary disease).","when_to_set_to_false":"Set to false if the patient currently has a disorder of lung (pulmonary disease) but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of lung (pulmonary disease) is active.","meaning":"Boolean indicating whether the patient currently has an active disorder of lung (pulmonary disease)."} ;; "other active pulmonary disease"
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder of the respiratory system.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder of the respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder of the respiratory system.","meaning":"Boolean indicating whether the patient currently has any disorder of the respiratory system."} ;; "other respiratory disorders"
(declare-const patient_has_finding_of_fibrosis_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fibrosis of lung (lung fibrosis).","when_to_set_to_false":"Set to false if the patient currently does not have fibrosis of lung (lung fibrosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fibrosis of lung (lung fibrosis).","meaning":"Boolean indicating whether the patient currently has fibrosis of lung (lung fibrosis)."} ;; "lung fibrosis"
(declare-const patient_has_finding_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has interstitial lung disease."} ;; "interstitial lung disease"
(declare-const patient_has_finding_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has primary malignant neoplasm of lung (lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have primary malignant neoplasm of lung (lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has primary malignant neoplasm of lung (lung cancer).","meaning":"Boolean indicating whether the patient currently has primary malignant neoplasm of lung (lung cancer)."} ;; "lung cancer"
(declare-const patient_has_finding_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary hypertension."} ;; "pulmonary hypertension"
(declare-const patient_has_finding_of_sarcoidosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sarcoidosis.","when_to_set_to_false":"Set to false if the patient currently does not have sarcoidosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sarcoidosis.","meaning":"Boolean indicating whether the patient currently has sarcoidosis."} ;; "sarcoidosis"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_active_tuberculosis_now
           patient_has_finding_of_primary_malignant_neoplasm_of_lung_now
           patient_has_finding_of_bronchiectasis_now
           patient_has_finding_of_sarcoidosis_now
           patient_has_finding_of_fibrosis_of_lung_now
           patient_has_finding_of_pulmonary_hypertension_now
           patient_has_finding_of_interstitial_lung_disease_now
           patient_has_finding_of_disorder_of_lung_now@@active)
      patient_has_finding_of_disorder_of_respiratory_system_now)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (active tuberculosis, lung cancer, bronchiectasis, sarcoidosis, lung fibrosis, pulmonary hypertension, interstitial lung disease, other active pulmonary disease)."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@active
       patient_has_finding_of_disorder_of_lung_now)
:named REQ3_AUXILIARY1)) ;; "other active pulmonary disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disorder_of_respiratory_system_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other respiratory disorders with non-exhaustive examples (active tuberculosis, lung cancer, bronchiectasis, sarcoidosis, lung fibrosis, pulmonary hypertension, interstitial lung disease, other active pulmonary disease)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_lung_volume_reduction_surgery_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone lung volume reduction surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone lung volume reduction surgery at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone lung volume reduction surgery.","meaning":"Boolean indicating whether the patient has ever undergone lung volume reduction surgery in the past."} ;; "lung volume reduction surgery"
(declare-const patient_has_undergone_lung_volume_reduction_surgery_inthehistory@@temporalcontext_within_12_months_prior_to_screening_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone lung volume reduction surgery within the twelve months prior to Screening/Visit 1.","when_to_set_to_false":"Set to false if the patient has not undergone lung volume reduction surgery within the twelve months prior to Screening/Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone lung volume reduction surgery within the twelve months prior to Screening/Visit 1.","meaning":"Boolean indicating whether the patient has undergone lung volume reduction surgery within the twelve months prior to Screening/Visit 1."} ;; "lung volume reduction surgery within the twelve months prior to Screening/Visit 1"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_lung_volume_reduction_surgery_inthehistory@@temporalcontext_within_12_months_prior_to_screening_visit_1
      patient_has_undergone_lung_volume_reduction_surgery_inthehistory)
:named REQ4_AUXILIARY0)) ;; "lung volume reduction surgery within the twelve months prior to Screening/Visit 1" implies "lung volume reduction surgery in the history"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_lung_volume_reduction_surgery_inthehistory@@temporalcontext_within_12_months_prior_to_screening_visit_1)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had lung volume reduction surgery within the twelve months prior to Screening/Visit 1."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_undergoing_long_term_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing long-term oxygen therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing long-term oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing long-term oxygen therapy.","meaning":"Boolean indicating whether the patient is currently undergoing long-term oxygen therapy."} ;; "long-term oxygen therapy"
(declare-const patient_is_undergoing_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oxygen therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing oxygen therapy.","meaning":"Boolean indicating whether the patient is currently undergoing oxygen therapy."} ;; "oxygen therapy"
(declare-const patient_is_undergoing_oxygen_therapy_now@@nocturnal Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oxygen therapy and the therapy is administered nocturnally (during nighttime/sleep).","when_to_set_to_false":"Set to false if the patient is currently undergoing oxygen therapy but it is not administered nocturnally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the oxygen therapy is administered nocturnally.","meaning":"Boolean indicating whether the patient's current oxygen therapy is administered nocturnally (during nighttime/sleep)."} ;; "nocturnal oxygen therapy"
(declare-const patient_is_undergoing_oxygen_therapy_now@@prescribed_duration_hours_per_day Real) ;; {"when_to_set_to_value":"Set to the number of hours per day for which the patient's current oxygen therapy is prescribed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours per day the patient's current oxygen therapy is prescribed for.","meaning":"Numeric value indicating the number of hours per day for which the patient's current oxygen therapy is prescribed."} ;; "oxygen therapy prescribed for greater than twelve hours per day"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: long-term oxygen therapy = oxygen therapy prescribed for greater than twelve hours per day
(assert
(! (= patient_is_undergoing_long_term_oxygen_therapy_now
(and patient_is_undergoing_oxygen_therapy_now
    (> patient_is_undergoing_oxygen_therapy_now@@prescribed_duration_hours_per_day 12)))
:named REQ5_AUXILIARY0)) ;; "long-term oxygen therapy (defined as oxygen therapy prescribed for greater than twelve hours per day)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_oxygen_therapy_now@@nocturnal
    patient_is_undergoing_oxygen_therapy_now)
:named REQ5_AUXILIARY1)) ;; "nocturnal oxygen therapy"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT be using long-term oxygen therapy
(assert
(! (not patient_is_undergoing_long_term_oxygen_therapy_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses long-term oxygen therapy (defined as oxygen therapy prescribed for greater than twelve hours per day)."

;; Exclusion: patient must NOT be using nocturnal oxygen therapy
(assert
(! (not patient_is_undergoing_oxygen_therapy_now@@nocturnal)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses nocturnal oxygen therapy."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever (historically or currently) been diagnosed with a cardiovascular system abnormality.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a cardiovascular system abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a cardiovascular system abnormality.","meaning":"Boolean indicating whether the patient has ever (historically or currently) been diagnosed with a cardiovascular system abnormality."} ;; "cardiovascular abnormality"
(declare-const patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the cardiovascular abnormality is considered clinically significant as defined in the protocol.","when_to_set_to_false":"Set to false if the cardiovascular abnormality is not considered clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiovascular abnormality is clinically significant.","meaning":"Boolean indicating whether the cardiovascular abnormality is clinically significant."} ;; "clinically significant cardiovascular abnormality"
(declare-const patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory@@rapidly_progressing Bool) ;; {"when_to_set_to_true":"Set to true if the cardiovascular abnormality is rapidly progressing.","when_to_set_to_false":"Set to false if the cardiovascular abnormality is not rapidly progressing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiovascular abnormality is rapidly progressing.","meaning":"Boolean indicating whether the cardiovascular abnormality is rapidly progressing."} ;; "rapidly progressing cardiovascular abnormality"
(declare-const patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the cardiovascular abnormality is unstable.","when_to_set_to_false":"Set to false if the cardiovascular abnormality is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiovascular abnormality is unstable.","meaning":"Boolean indicating whether the cardiovascular abnormality is unstable."} ;; "unstable cardiovascular abnormality"

(declare-const patient_has_diagnosis_of_neurological_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever (historically or currently) been diagnosed with a neurological abnormality.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a neurological abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a neurological abnormality.","meaning":"Boolean indicating whether the patient has ever (historically or currently) been diagnosed with a neurological abnormality."} ;; "neurological abnormality"
(declare-const patient_has_diagnosis_of_neurological_abnormality_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the neurological abnormality is considered clinically significant as defined in the protocol.","when_to_set_to_false":"Set to false if the neurological abnormality is not considered clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neurological abnormality is clinically significant.","meaning":"Boolean indicating whether the neurological abnormality is clinically significant."} ;; "clinically significant neurological abnormality"
(declare-const patient_has_diagnosis_of_neurological_abnormality_inthehistory@@rapidly_progressing Bool) ;; {"when_to_set_to_true":"Set to true if the neurological abnormality is rapidly progressing.","when_to_set_to_false":"Set to false if the neurological abnormality is not rapidly progressing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neurological abnormality is rapidly progressing.","meaning":"Boolean indicating whether the neurological abnormality is rapidly progressing."} ;; "rapidly progressing neurological abnormality"
(declare-const patient_has_diagnosis_of_neurological_abnormality_inthehistory@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the neurological abnormality is unstable.","when_to_set_to_false":"Set to false if the neurological abnormality is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neurological abnormality is unstable.","meaning":"Boolean indicating whether the neurological abnormality is unstable."} ;; "unstable neurological abnormality"

(declare-const patient_has_diagnosis_of_renal_alteration_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever (historically or currently) been diagnosed with a renal abnormality.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a renal abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a renal abnormality.","meaning":"Boolean indicating whether the patient has ever (historically or currently) been diagnosed with a renal abnormality."} ;; "renal abnormality"
(declare-const patient_has_diagnosis_of_renal_alteration_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the renal abnormality is considered clinically significant as defined in the protocol.","when_to_set_to_false":"Set to false if the renal abnormality is not considered clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal abnormality is clinically significant.","meaning":"Boolean indicating whether the renal abnormality is clinically significant."} ;; "clinically significant renal abnormality"
(declare-const patient_has_diagnosis_of_renal_alteration_inthehistory@@rapidly_progressing Bool) ;; {"when_to_set_to_true":"Set to true if the renal abnormality is rapidly progressing.","when_to_set_to_false":"Set to false if the renal abnormality is not rapidly progressing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal abnormality is rapidly progressing.","meaning":"Boolean indicating whether the renal abnormality is rapidly progressing."} ;; "rapidly progressing renal abnormality"
(declare-const patient_has_diagnosis_of_renal_alteration_inthehistory@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the renal abnormality is unstable.","when_to_set_to_false":"Set to false if the renal abnormality is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal abnormality is unstable.","meaning":"Boolean indicating whether the renal abnormality is unstable."} ;; "unstable renal abnormality"

(declare-const patient_has_diagnosis_of_hepatic_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever (historically or currently) been diagnosed with a hepatic abnormality.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a hepatic abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a hepatic abnormality.","meaning":"Boolean indicating whether the patient has ever (historically or currently) been diagnosed with a hepatic abnormality."} ;; "hepatic abnormality"
(declare-const patient_has_diagnosis_of_hepatic_abnormality_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the hepatic abnormality is considered clinically significant as defined in the protocol.","when_to_set_to_false":"Set to false if the hepatic abnormality is not considered clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic abnormality is clinically significant.","meaning":"Boolean indicating whether the hepatic abnormality is clinically significant."} ;; "clinically significant hepatic abnormality"
(declare-const patient_has_diagnosis_of_hepatic_abnormality_inthehistory@@rapidly_progressing Bool) ;; {"when_to_set_to_true":"Set to true if the hepatic abnormality is rapidly progressing.","when_to_set_to_false":"Set to false if the hepatic abnormality is not rapidly progressing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic abnormality is rapidly progressing.","meaning":"Boolean indicating whether the hepatic abnormality is rapidly progressing."} ;; "rapidly progressing hepatic abnormality"
(declare-const patient_has_diagnosis_of_hepatic_abnormality_inthehistory@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the hepatic abnormality is unstable.","when_to_set_to_false":"Set to false if the hepatic abnormality is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic abnormality is unstable.","meaning":"Boolean indicating whether the hepatic abnormality is unstable."} ;; "unstable hepatic abnormality"

(declare-const patient_has_diagnosis_of_immunological_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever (historically or currently) been diagnosed with an immunological abnormality.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with an immunological abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with an immunological abnormality.","meaning":"Boolean indicating whether the patient has ever (historically or currently) been diagnosed with an immunological abnormality."} ;; "immunological abnormality"
(declare-const patient_has_diagnosis_of_immunological_abnormality_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the immunological abnormality is considered clinically significant as defined in the protocol.","when_to_set_to_false":"Set to false if the immunological abnormality is not considered clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunological abnormality is clinically significant.","meaning":"Boolean indicating whether the immunological abnormality is clinically significant."} ;; "clinically significant immunological abnormality"
(declare-const patient_has_diagnosis_of_immunological_abnormality_inthehistory@@rapidly_progressing Bool) ;; {"when_to_set_to_true":"Set to true if the immunological abnormality is rapidly progressing.","when_to_set_to_false":"Set to false if the immunological abnormality is not rapidly progressing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunological abnormality is rapidly progressing.","meaning":"Boolean indicating whether the immunological abnormality is rapidly progressing."} ;; "rapidly progressing immunological abnormality"
(declare-const patient_has_diagnosis_of_immunological_abnormality_inthehistory@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the immunological abnormality is unstable.","when_to_set_to_false":"Set to false if the immunological abnormality is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunological abnormality is unstable.","meaning":"Boolean indicating whether the immunological abnormality is unstable."} ;; "unstable immunological abnormality"

(declare-const patient_has_diagnosis_of_endocrine_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever (historically or currently) been diagnosed with an endocrine abnormality.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with an endocrine abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with an endocrine abnormality.","meaning":"Boolean indicating whether the patient has ever (historically or currently) been diagnosed with an endocrine abnormality."} ;; "endocrine abnormality"
(declare-const patient_has_diagnosis_of_endocrine_abnormality_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the endocrine abnormality is considered clinically significant as defined in the protocol.","when_to_set_to_false":"Set to false if the endocrine abnormality is not considered clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the endocrine abnormality is clinically significant.","meaning":"Boolean indicating whether the endocrine abnormality is clinically significant."} ;; "clinically significant endocrine abnormality"
(declare-const patient_has_diagnosis_of_endocrine_abnormality_inthehistory@@rapidly_progressing Bool) ;; {"when_to_set_to_true":"Set to true if the endocrine abnormality is rapidly progressing.","when_to_set_to_false":"Set to false if the endocrine abnormality is not rapidly progressing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the endocrine abnormality is rapidly progressing.","meaning":"Boolean indicating whether the endocrine abnormality is rapidly progressing."} ;; "rapidly progressing endocrine abnormality"
(declare-const patient_has_diagnosis_of_endocrine_abnormality_inthehistory@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the endocrine abnormality is unstable.","when_to_set_to_false":"Set to false if the endocrine abnormality is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the endocrine abnormality is unstable.","meaning":"Boolean indicating whether the endocrine abnormality is unstable."} ;; "unstable endocrine abnormality"

(declare-const patient_has_diagnosis_of_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever (historically or currently) been diagnosed with diabetes mellitus.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with diabetes mellitus.","meaning":"Boolean indicating whether the patient has ever (historically or currently) been diagnosed with diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_inthehistory@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the diabetes mellitus is uncontrolled.","when_to_set_to_false":"Set to false if the diabetes mellitus is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diabetes mellitus is uncontrolled.","meaning":"Boolean indicating whether the diabetes mellitus is uncontrolled."} ;; "uncontrolled diabetes mellitus"

(declare-const patient_has_diagnosis_of_disorder_of_thyroid_gland_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever (historically or currently) been diagnosed with a disorder of the thyroid gland.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the thyroid gland.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the thyroid gland.","meaning":"Boolean indicating whether the patient has ever (historically or currently) been diagnosed with a disorder of the thyroid gland."} ;; "thyroid disease"

(declare-const patient_has_diagnosis_of_haematological_abnormality_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever (historically or currently) been diagnosed with a haematological abnormality.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a haematological abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a haematological abnormality.","meaning":"Boolean indicating whether the patient has ever (historically or currently) been diagnosed with a haematological abnormality."} ;; "haematological abnormality"
(declare-const patient_has_diagnosis_of_haematological_abnormality_inthehistory@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the haematological abnormality is uncontrolled.","when_to_set_to_false":"Set to false if the haematological abnormality is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the haematological abnormality is uncontrolled.","meaning":"Boolean indicating whether the haematological abnormality is uncontrolled."} ;; "uncontrolled haematological abnormality"

(declare-const patient_has_diagnosis_of_mental_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever (historically or currently) been diagnosed with a mental disorder.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a mental disorder.","meaning":"Boolean indicating whether the patient has ever (historically or currently) been diagnosed with a mental disorder."} ;; "psychiatric disease"

(declare-const patient_has_diagnosis_of_intellectual_disability_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever (historically or currently) been diagnosed with intellectual disability.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with intellectual disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with intellectual disability.","meaning":"Boolean indicating whether the patient has ever (historically or currently) been diagnosed with intellectual disability."} ;; "intellectual deficiency"

(declare-const patient_has_poor_motivation_limiting_validity_of_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has poor motivation that will limit the validity of informed consent to participate in the study.","when_to_set_to_false":"Set to false if the patient does not have poor motivation that will limit the validity of informed consent to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has poor motivation that will limit the validity of informed consent to participate in the study.","meaning":"Boolean indicating whether the patient has poor motivation that will limit the validity of informed consent to participate in the study."} ;; "poor motivation limiting validity of informed consent"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory@@clinically_significant
      patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory)
:named REQ6_AUXILIARY0)) ;; "clinically significant cardiovascular abnormality"

(assert
(! (=> patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory@@rapidly_progressing
      patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory)
:named REQ6_AUXILIARY1)) ;; "rapidly progressing cardiovascular abnormality"

(assert
(! (=> patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory@@unstable
      patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory)
:named REQ6_AUXILIARY2)) ;; "unstable cardiovascular abnormality"

(assert
(! (=> patient_has_diagnosis_of_neurological_abnormality_inthehistory@@clinically_significant
      patient_has_diagnosis_of_neurological_abnormality_inthehistory)
:named REQ6_AUXILIARY3)) ;; "clinically significant neurological abnormality"

(assert
(! (=> patient_has_diagnosis_of_neurological_abnormality_inthehistory@@rapidly_progressing
      patient_has_diagnosis_of_neurological_abnormality_inthehistory)
:named REQ6_AUXILIARY4)) ;; "rapidly progressing neurological abnormality"

(assert
(! (=> patient_has_diagnosis_of_neurological_abnormality_inthehistory@@unstable
      patient_has_diagnosis_of_neurological_abnormality_inthehistory)
:named REQ6_AUXILIARY5)) ;; "unstable neurological abnormality"

(assert
(! (=> patient_has_diagnosis_of_renal_alteration_inthehistory@@clinically_significant
      patient_has_diagnosis_of_renal_alteration_inthehistory)
:named REQ6_AUXILIARY6)) ;; "clinically significant renal abnormality"

(assert
(! (=> patient_has_diagnosis_of_renal_alteration_inthehistory@@rapidly_progressing
      patient_has_diagnosis_of_renal_alteration_inthehistory)
:named REQ6_AUXILIARY7)) ;; "rapidly progressing renal abnormality"

(assert
(! (=> patient_has_diagnosis_of_renal_alteration_inthehistory@@unstable
      patient_has_diagnosis_of_renal_alteration_inthehistory)
:named REQ6_AUXILIARY8)) ;; "unstable renal abnormality"

(assert
(! (=> patient_has_diagnosis_of_hepatic_abnormality_inthehistory@@clinically_significant
      patient_has_diagnosis_of_hepatic_abnormality_inthehistory)
:named REQ6_AUXILIARY9)) ;; "clinically significant hepatic abnormality"

(assert
(! (=> patient_has_diagnosis_of_hepatic_abnormality_inthehistory@@rapidly_progressing
      patient_has_diagnosis_of_hepatic_abnormality_inthehistory)
:named REQ6_AUXILIARY10)) ;; "rapidly progressing hepatic abnormality"

(assert
(! (=> patient_has_diagnosis_of_hepatic_abnormality_inthehistory@@unstable
      patient_has_diagnosis_of_hepatic_abnormality_inthehistory)
:named REQ6_AUXILIARY11)) ;; "unstable hepatic abnormality"

(assert
(! (=> patient_has_diagnosis_of_immunological_abnormality_inthehistory@@clinically_significant
      patient_has_diagnosis_of_immunological_abnormality_inthehistory)
:named REQ6_AUXILIARY12)) ;; "clinically significant immunological abnormality"

(assert
(! (=> patient_has_diagnosis_of_immunological_abnormality_inthehistory@@rapidly_progressing
      patient_has_diagnosis_of_immunological_abnormality_inthehistory)
:named REQ6_AUXILIARY13)) ;; "rapidly progressing immunological abnormality"

(assert
(! (=> patient_has_diagnosis_of_immunological_abnormality_inthehistory@@unstable
      patient_has_diagnosis_of_immunological_abnormality_inthehistory)
:named REQ6_AUXILIARY14)) ;; "unstable immunological abnormality"

(assert
(! (=> patient_has_diagnosis_of_endocrine_abnormality_inthehistory@@clinically_significant
      patient_has_diagnosis_of_endocrine_abnormality_inthehistory)
:named REQ6_AUXILIARY15)) ;; "clinically significant endocrine abnormality"

(assert
(! (=> patient_has_diagnosis_of_endocrine_abnormality_inthehistory@@rapidly_progressing
      patient_has_diagnosis_of_endocrine_abnormality_inthehistory)
:named REQ6_AUXILIARY16)) ;; "rapidly progressing endocrine abnormality"

(assert
(! (=> patient_has_diagnosis_of_endocrine_abnormality_inthehistory@@unstable
      patient_has_diagnosis_of_endocrine_abnormality_inthehistory)
:named REQ6_AUXILIARY17)) ;; "unstable endocrine abnormality"

(assert
(! (=> patient_has_diagnosis_of_diabetes_mellitus_inthehistory@@uncontrolled
      patient_has_diagnosis_of_diabetes_mellitus_inthehistory)
:named REQ6_AUXILIARY18)) ;; "uncontrolled diabetes mellitus"

(assert
(! (=> patient_has_diagnosis_of_haematological_abnormality_inthehistory@@uncontrolled
      patient_has_diagnosis_of_haematological_abnormality_inthehistory)
:named REQ6_AUXILIARY19)) ;; "uncontrolled haematological abnormality"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have any of the listed historical or current abnormalities (with qualifiers) OR any of the listed psychiatric/consent-limiting conditions
(assert
(! (not
     (or
       ;; Cardiovascular abnormality (any of the qualifiers)
       patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory@@clinically_significant
       patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory@@rapidly_progressing
       patient_has_diagnosis_of_cardiovascular_system_alteration_inthehistory@@unstable

       ;; Neurological abnormality (any of the qualifiers)
       patient_has_diagnosis_of_neurological_abnormality_inthehistory@@clinically_significant
       patient_has_diagnosis_of_neurological_abnormality_inthehistory@@rapidly_progressing
       patient_has_diagnosis_of_neurological_abnormality_inthehistory@@unstable

       ;; Renal abnormality (any of the qualifiers)
       patient_has_diagnosis_of_renal_alteration_inthehistory@@clinically_significant
       patient_has_diagnosis_of_renal_alteration_inthehistory@@rapidly_progressing
       patient_has_diagnosis_of_renal_alteration_inthehistory@@unstable

       ;; Hepatic abnormality (any of the qualifiers)
       patient_has_diagnosis_of_hepatic_abnormality_inthehistory@@clinically_significant
       patient_has_diagnosis_of_hepatic_abnormality_inthehistory@@rapidly_progressing
       patient_has_diagnosis_of_hepatic_abnormality_inthehistory@@unstable

       ;; Immunological abnormality (any of the qualifiers)
       patient_has_diagnosis_of_immunological_abnormality_inthehistory@@clinically_significant
       patient_has_diagnosis_of_immunological_abnormality_inthehistory@@rapidly_progressing
       patient_has_diagnosis_of_immunological_abnormality_inthehistory@@unstable

       ;; Endocrine abnormality (any of the qualifiers)
       patient_has_diagnosis_of_endocrine_abnormality_inthehistory@@clinically_significant
       patient_has_diagnosis_of_endocrine_abnormality_inthehistory@@rapidly_progressing
       patient_has_diagnosis_of_endocrine_abnormality_inthehistory@@unstable

       ;; Diabetes mellitus (uncontrolled)
       patient_has_diagnosis_of_diabetes_mellitus_inthehistory@@uncontrolled

       ;; Thyroid disease (any historical or current diagnosis)
       patient_has_diagnosis_of_disorder_of_thyroid_gland_inthehistory

       ;; Haematological abnormality (uncontrolled)
       patient_has_diagnosis_of_haematological_abnormality_inthehistory@@uncontrolled
     )
   )
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has historical or current evidence of clinically significant OR rapidly progressing OR unstable cardiovascular abnormality OR neurological abnormality OR renal abnormality OR hepatic abnormality OR immunological abnormality OR endocrine abnormality (including uncontrolled diabetes mellitus OR thyroid disease) OR haematological abnormality that is uncontrolled, where clinically significant is defined as any disease that, in the opinion of the investigator, would put the safety of the patient at risk through participation OR which would affect the analysis if the disease or condition exacerbated during the study."

(assert
(! (not
     (or
       patient_has_diagnosis_of_mental_disorder_inthehistory
       patient_has_diagnosis_of_intellectual_disability_inthehistory
       patient_has_poor_motivation_limiting_validity_of_informed_consent
     )
   )
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psychiatric disease OR intellectual deficiency OR poor motivation OR other condition that will limit the validity of informed consent to participate in the study."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_at_risk_of_non_compliance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to be at risk of non-compliance with study procedures or medication therapy.","when_to_set_to_false":"Set to false if the patient is currently assessed not to be at risk of non-compliance with study procedures or medication therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at risk of non-compliance with study procedures or medication therapy.","meaning":"Boolean indicating whether the patient is currently at risk of non-compliance with study procedures or medication therapy."} ;; "the patient is at risk of non-compliance"

(declare-const patient_is_unable_to_comply_with_study_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to comply with the study procedures.","when_to_set_to_false":"Set to false if the patient is currently able to comply with the study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to comply with the study procedures.","meaning":"Boolean indicating whether the patient is currently unable to comply with the study procedures."} ;; "the patient is unable to comply with the study procedures"

(declare-const patient_is_unable_to_continue_current_chronic_obstructive_pulmonary_disease_medication_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to continue their current chronic obstructive pulmonary disease medication therapy.","when_to_set_to_false":"Set to false if the patient is currently able to continue their current chronic obstructive pulmonary disease medication therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to continue their current chronic obstructive pulmonary disease medication therapy.","meaning":"Boolean indicating whether the patient is currently unable to continue their current chronic obstructive pulmonary disease medication therapy."} ;; "the patient is unable to continue current chronic obstructive pulmonary disease medication therapy"

(declare-const patient_is_undergoing_administration_of_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of medication therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing administration of medication therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing administration of medication therapy.","meaning":"Boolean indicating whether the patient is currently undergoing administration of medication therapy."} ;; "medication therapy"

(declare-const patient_is_undergoing_administration_of_medication_now@@for_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of medication therapy and the therapy is for chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient is currently undergoing administration of medication therapy but the therapy is not for chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication therapy is for chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's current medication therapy is for chronic obstructive pulmonary disease."} ;; "medication therapy for chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_administration_of_medication_now@@for_chronic_obstructive_pulmonary_disease
      patient_is_undergoing_administration_of_medication_now)
:named REQ7_AUXILIARY0)) ;; "medication therapy for chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_at_risk_of_non_compliance_now)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is at risk of non-compliance"

(assert
(! (not patient_is_unable_to_comply_with_study_procedures_now)
:named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is unable to comply with the study procedures"

(assert
(! (not patient_is_unable_to_continue_current_chronic_obstructive_pulmonary_disease_medication_therapy_now)
:named REQ7_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is unable to continue current chronic obstructive pulmonary disease medication therapy"

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a known or suspected history of alcohol abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient has no known or suspected history of alcohol abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse.","meaning":"Boolean indicating whether the patient has a known or suspected history of alcohol abuse at any time in the past."} ;; "alcohol abuse"

(declare-const patient_has_finding_of_finding_relating_to_alcohol_misuse_behavior_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a known or suspected history of alcohol abuse within the past two years.","when_to_set_to_false":"Set to false if the patient has no known or suspected history of alcohol abuse within the past two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse within the past two years.","meaning":"Boolean indicating whether the patient has a known or suspected history of alcohol abuse within the past two years."} ;; "alcohol abuse within the last two years"

(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a known or suspected history of drug abuse within the past two years.","when_to_set_to_false":"Set to false if the patient has no known or suspected history of drug abuse within the past two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse within the past two years.","meaning":"Boolean indicating whether the patient has a known or suspected history of drug abuse within the past two years."} ;; "drug abuse within the last two years"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not (or patient_has_finding_of_finding_relating_to_alcohol_misuse_behavior_inthepast2years
              patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known OR suspected history of alcohol abuse OR drug abuse within the last two years."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of hypersensitivity condition.","when_to_set_to_false":"Set to false if the patient has never had a history of hypersensitivity condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of hypersensitivity condition.","meaning":"Boolean indicating whether the patient has ever had a history of hypersensitivity condition."} ;; "history of hypersensitivity"
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_component_of_study_inhaler Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of hypersensitivity condition and the hypersensitivity was to any component of the study inhaler.","when_to_set_to_false":"Set to false if the patient has ever had a history of hypersensitivity condition but not to any component of the study inhaler.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity was to any component of the study inhaler.","meaning":"Boolean indicating whether the patient's history of hypersensitivity condition was to any component of the study inhaler."} ;; "history of hypersensitivity to any component of the study inhaler"
(declare-const patient_has_hypersensitivity_to_lactose_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of hypersensitivity to lactose.","when_to_set_to_false":"Set to false if the patient has never had a history of hypersensitivity to lactose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of hypersensitivity to lactose.","meaning":"Boolean indicating whether the patient has ever had a history of hypersensitivity to lactose."} ;; "lactose"
(declare-const patient_has_hypersensitivity_to_magnesium_stearate_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of hypersensitivity to magnesium stearate.","when_to_set_to_false":"Set to false if the patient has never had a history of hypersensitivity to magnesium stearate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of hypersensitivity to magnesium stearate.","meaning":"Boolean indicating whether the patient has ever had a history of hypersensitivity to magnesium stearate."} ;; "magnesium stearate"
(declare-const patient_has_allergy_to_milk_protein_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of allergy to milk protein.","when_to_set_to_false":"Set to false if the patient has never had a history of allergy to milk protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to milk protein.","meaning":"Boolean indicating whether the patient has ever had a history of allergy to milk protein."} ;; "milk protein"
(declare-const patient_has_allergy_to_milk_protein_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of allergy to milk protein and the allergy was severe.","when_to_set_to_false":"Set to false if the patient has ever had a history of allergy to milk protein but the allergy was not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to milk protein was severe.","meaning":"Boolean indicating whether the patient's history of allergy to milk protein was severe."} ;; "severe milk protein allergy"
(declare-const patient_has_allergy_to_milk_protein_inthehistory@@contraindicates_participation_in_opinion_of_study_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of allergy to milk protein and, in the opinion of the study physician, the allergy contraindicates participation.","when_to_set_to_false":"Set to false if the patient has ever had a history of allergy to milk protein but, in the opinion of the study physician, the allergy does not contraindicate participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the study physician, the allergy contraindicates participation.","meaning":"Boolean indicating whether, in the opinion of the study physician, the patient's history of allergy to milk protein contraindicates participation."} ;; "in the opinion of the study physician, contraindicates participation"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply umbrella term for hypersensitivity to any component of study inhaler
(assert
(! (=> (or patient_has_hypersensitivity_to_lactose_inthehistory
          patient_has_hypersensitivity_to_magnesium_stearate_inthehistory)
       patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_component_of_study_inhaler)
   :named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (lactose, magnesium stearate)"

;; Qualifier variable implies corresponding stem variable for hypersensitivity
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_component_of_study_inhaler
       patient_has_finding_of_hypersensitivity_condition_inthehistory)
   :named REQ9_AUXILIARY1)) ;; "history of hypersensitivity to any component of the study inhaler"

;; Qualifier variable implies corresponding stem variable for milk protein allergy
(assert
(! (=> patient_has_allergy_to_milk_protein_inthehistory@@severe
       patient_has_allergy_to_milk_protein_inthehistory)
   :named REQ9_AUXILIARY2)) ;; "severe milk protein allergy"

(assert
(! (=> patient_has_allergy_to_milk_protein_inthehistory@@contraindicates_participation_in_opinion_of_study_physician
       patient_has_allergy_to_milk_protein_inthehistory)
   :named REQ9_AUXILIARY3)) ;; "in the opinion of the study physician, contraindicates participation"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: history of hypersensitivity to any component of the study inhaler
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_component_of_study_inhaler)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to any component of the study inhaler with non-exhaustive examples (lactose, magnesium stearate)."

;; Exclusion: history of severe milk protein allergy that, in the opinion of the study physician, contraindicates participation
(assert
(! (not (and patient_has_allergy_to_milk_protein_inthehistory@@severe
             patient_has_allergy_to_milk_protein_inthehistory@@contraindicates_participation_in_opinion_of_study_physician))
   :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe milk protein allergy that, in the opinion of the study physician, contraindicates participation."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_prior_use_of_commercially_available_ellipta_inhaler Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used a commercially available ELLIPTA inhaler at any time prior to study entry.","when_to_set_to_false":"Set to false if the patient has never used a commercially available ELLIPTA inhaler prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used a commercially available ELLIPTA inhaler prior to study entry.","meaning":"Boolean indicating whether the patient has used a commercially available ELLIPTA inhaler prior to study entry."} ;; "prior use of commercially available ELLIPTA inhaler (including commercially available ELLIPTA inhaler)"
(declare-const patient_has_prior_use_of_investigational_ellipta_inhaler Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used an investigational ELLIPTA inhaler at any time prior to study entry.","when_to_set_to_false":"Set to false if the patient has never used an investigational ELLIPTA inhaler prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used an investigational ELLIPTA inhaler prior to study entry.","meaning":"Boolean indicating whether the patient has used an investigational ELLIPTA inhaler prior to study entry."} ;; "prior use of investigational ELLIPTA inhaler (including investigational ELLIPTA inhaler)"
(declare-const patient_has_ongoing_use_of_commercially_available_ellipta_inhaler_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a commercially available ELLIPTA inhaler at the time of study entry.","when_to_set_to_false":"Set to false if the patient is not currently using a commercially available ELLIPTA inhaler at the time of study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a commercially available ELLIPTA inhaler at the time of study entry.","meaning":"Boolean indicating whether the patient is currently using a commercially available ELLIPTA inhaler at the time of study entry."} ;; "ongoing use of commercially available ELLIPTA inhaler (including commercially available ELLIPTA inhaler)"
(declare-const patient_has_ongoing_use_of_investigational_ellipta_inhaler_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an investigational ELLIPTA inhaler at the time of study entry.","when_to_set_to_false":"Set to false if the patient is not currently using an investigational ELLIPTA inhaler at the time of study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an investigational ELLIPTA inhaler at the time of study entry.","meaning":"Boolean indicating whether the patient is currently using an investigational ELLIPTA inhaler at the time of study entry."} ;; "ongoing use of investigational ELLIPTA inhaler (including investigational ELLIPTA inhaler)"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have prior use of ELLIPTA inhaler (including investigational and commercially available) OR ongoing use of ELLIPTA inhaler (including investigational and commercially available)
(assert
(! (not (or
          patient_has_prior_use_of_commercially_available_ellipta_inhaler
          patient_has_prior_use_of_investigational_ellipta_inhaler
          patient_has_ongoing_use_of_commercially_available_ellipta_inhaler_now
          patient_has_ongoing_use_of_investigational_ellipta_inhaler_now))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior use of the ELLIPTA inhaler (including investigational ELLIPTA inhaler and commercially available ELLIPTA inhaler) OR ongoing use of the ELLIPTA inhaler (including investigational ELLIPTA inhaler and commercially available ELLIPTA inhaler)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a drug or medicament within the past 30 days prior to entry into the study.","when_to_set_to_false":"Set to false if the patient has not been exposed to a drug or medicament within the past 30 days prior to entry into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a drug or medicament within the past 30 days prior to entry into the study.","meaning":"Boolean indicating whether the patient has been exposed to a drug or medicament within the past 30 days."} ;; "has received an investigational drug within thirty days prior to entry into this study (Screening/Visit 1)"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the past 30 days is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the past 30 days is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient was exposed within the past 30 days is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed within the past 30 days is investigational."} ;; "has received an investigational drug within thirty days prior to entry into this study (Screening/Visit 1)"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a drug or medicament in the past (with further temporal context specified by qualifier).","when_to_set_to_false":"Set to false if the patient has not been exposed to a drug or medicament in the past (with further temporal context specified by qualifier).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a drug or medicament in the past (with further temporal context specified by qualifier).","meaning":"Boolean indicating whether the patient has ever been exposed to a drug or medicament in the past (with further temporal context specified by qualifier)."} ;; "has received an investigational drug within five drug half-lives of the investigational drug prior to entry into this study (Screening/Visit 1)"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed in the past is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed in the past is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient was exposed in the past is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed in the past is investigational."} ;; "has received an investigational drug within five drug half-lives of the investigational drug prior to entry into this study (Screening/Visit 1)"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@temporalcontext_within_five_drug_half_lives_prior_to_entry_into_study Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to the investigational drug occurred within five drug half-lives prior to entry into this study.","when_to_set_to_false":"Set to false if the exposure to the investigational drug did not occur within five drug half-lives prior to entry into this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to the investigational drug occurred within five drug half-lives prior to entry into this study.","meaning":"Boolean indicating whether the exposure to the investigational drug occurred within five drug half-lives prior to entry into this study."} ;; "has received an investigational drug within five drug half-lives of the investigational drug prior to entry into this study (Screening/Visit 1)"
(declare-const patient_has_received_investigational_medical_device_in_the_past_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received an investigational medical device within thirty days prior to entry into this study (Screening/Visit 1).","when_to_set_to_false":"Set to false if the patient has not received an investigational medical device within thirty days prior to entry into this study (Screening/Visit 1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received an investigational medical device within thirty days prior to entry into this study (Screening/Visit 1).","meaning":"Boolean indicating whether the patient has received an investigational medical device within thirty days prior to entry into this study (Screening/Visit 1)."} ;; "has received an investigational medical device within thirty days prior to entry into this study (Screening/Visit 1)"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable for drug exposure within 30 days
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
    :named REQ11_AUXILIARY0)) ;; "drug or medicament to which the patient was exposed within the past 30 days is investigational"

;; Qualifier variable implies corresponding stem variable for drug exposure in history
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthehistory@@investigational
      patient_is_exposed_to_drug_or_medicament_inthehistory)
    :named REQ11_AUXILIARY1)) ;; "drug or medicament to which the patient was exposed in the past is investigational"

;; Qualifier variable for five half-lives implies investigational drug exposure in history
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthehistory@@temporalcontext_within_five_drug_half_lives_prior_to_entry_into_study
      (and patient_is_exposed_to_drug_or_medicament_inthehistory
           patient_is_exposed_to_drug_or_medicament_inthehistory@@investigational))
    :named REQ11_AUXILIARY2)) ;; "exposure to the investigational drug occurred within five drug half-lives prior to entry into this study"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT have received an investigational drug within the longer of (30 days OR 5 half-lives) prior to entry
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational
            patient_is_exposed_to_drug_or_medicament_inthehistory@@temporalcontext_within_five_drug_half_lives_prior_to_entry_into_study))
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "has received an investigational drug within thirty days prior to entry into this study (Screening/Visit 1) OR within five drug half-lives of the investigational drug prior to entry into this study (Screening/Visit 1), whichever duration is longer"

;; Exclusion: patient must NOT have received an investigational medical device within 30 days prior to entry
(assert
(! (not patient_has_received_investigational_medical_device_in_the_past_30_days)
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "has received an investigational medical device within thirty days prior to entry into this study (Screening/Visit 1)"
