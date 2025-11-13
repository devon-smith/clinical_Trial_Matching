;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "heart disease"
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung (lung disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the lung (lung disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the lung (lung disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the lung (lung disease)."} ;; "lung disease"
(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the nervous system (nervous system disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the nervous system (nervous system disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the nervous system (nervous system disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the nervous system (nervous system disease)."} ;; "nervous system disease"
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "kidney disease"
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease of the liver (liver disease).","when_to_set_to_false":"Set to false if the patient currently does not have disease of the liver (liver disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disease of the liver (liver disease).","meaning":"Boolean indicating whether the patient currently has disease of the liver (liver disease)."} ;; "liver disease"
(declare-const patient_has_finding_of_disorder_of_stomach_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the stomach (stomach disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the stomach (stomach disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the stomach (stomach disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the stomach (stomach disease)."} ;; "stomach disease"
(declare-const patient_has_finding_of_disorder_of_intestine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the intestine (intestinal disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the intestine (intestinal disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the intestine (intestinal disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the intestine (intestinal disease)."} ;; "intestinal disease"
(declare-const patient_has_finding_of_other_disease_that_may_place_patient_at_risk_if_participating_in_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other disease that may place the patient at risk if participating in the trial.","when_to_set_to_false":"Set to false if the patient currently does not have any other disease that may place the patient at risk if participating in the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other disease that may place the patient at risk if participating in the trial.","meaning":"Boolean indicating whether the patient currently has any other disease that may place the patient at risk if participating in the trial."} ;; "other disease that may place the patient at risk if participating in the trial"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_heart_disease_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart disease."

(assert
(! (not patient_has_finding_of_disorder_of_lung_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lung disease."

(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_now)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nervous system disease."

(assert
(! (not patient_has_finding_of_kidney_disease_now)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has kidney disease."

(assert
(! (not patient_has_finding_of_disease_of_liver_now)
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver disease."

(assert
(! (not patient_has_finding_of_disorder_of_stomach_now)
:named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has stomach disease."

(assert
(! (not patient_has_finding_of_disorder_of_intestine_now)
:named REQ1_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intestinal disease."

(assert
(! (not patient_has_finding_of_other_disease_that_may_place_patient_at_risk_if_participating_in_trial_now)
:named REQ1_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other disease that may place the patient at risk if participating in the trial."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cranial_nerve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cranial neuropathy (cranial nerve disorder).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cranial neuropathy (cranial nerve disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cranial neuropathy (cranial nerve disorder).","meaning":"Boolean indicating whether the patient currently has cranial neuropathy (cranial nerve disorder)."} ;; "cranial neuropathy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_cranial_nerve_disorder_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cranial neuropathy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_on_blood_thinning_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving a blood-thinning agent to prevent blood clotting.","when_to_set_to_false":"Set to false if the patient is not currently receiving a blood-thinning agent to prevent blood clotting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving a blood-thinning agent to prevent blood clotting.","meaning":"Boolean indicating whether the patient is currently on a blood-thinning agent to prevent blood clotting."} ;; "The patient is excluded if the patient is on blood-thinning agent to prevent blood clotting."

(declare-const patients_hemostatic_function_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hemostatic function (blood clotting) is currently positive (present or normal).","when_to_set_to_false":"Set to false if the patient's hemostatic function (blood clotting) is currently not positive (i.e., absent, reduced, or abnormal).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hemostatic function (blood clotting) is currently positive.","meaning":"Boolean indicating whether the patient's hemostatic function (blood clotting) is currently positive (present or normal)."} ;; "blood clotting"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_on_blood_thinning_agent_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on blood-thinning agent to prevent blood clotting."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_other_disease_that_may_place_patient_at_risk_if_participating_in_trial_now@@serious_skin_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a skin disease and that disease is serious.","when_to_set_to_false":"Set to false if the patient currently has a skin disease but it is not serious, or does not have a skin disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious skin disease.","meaning":"Boolean indicating whether the patient currently has a serious skin disease."} ;; "serious skin disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_other_disease_that_may_place_patient_at_risk_if_participating_in_trial_now@@serious_skin_disease)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serious skin disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_heart_disease_now@@of_certain_class Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease and the heart disease is of a certain class as specified by the exclusion criterion.","when_to_set_to_false":"Set to false if the patient currently has heart disease but it is not of a certain class, or if the patient does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart disease is of a certain class.","meaning":"Boolean indicating whether the patient's current heart disease is of a certain class as required for exclusion."} ;; "certain class of heart disease"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_disease_now@@of_certain_class
       patient_has_finding_of_heart_disease_now)
   :named REQ5_AUXILIARY0)) ;; "of certain class" implies "heart disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_heart_disease_now@@of_certain_class)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has certain class of heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer) in their history."} ;; "the patient has had cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_surgically_cured_basal_cell_carcinoma_or_cervical_dysplasia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of malignant neoplastic disease excludes cases where the only cancer was surgically cured basal cell carcinoma or surgically cured cervical dysplasia.","when_to_set_to_false":"Set to false if the patient's history of malignant neoplastic disease consists only of surgically cured basal cell carcinoma or surgically cured cervical dysplasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of malignant neoplastic disease excludes surgically cured basal cell carcinoma or cervical dysplasia.","meaning":"Boolean indicating whether the patient's history of malignant neoplastic disease excludes surgically cured basal cell carcinoma or cervical dysplasia."} ;; "the cancer was NOT (surgically cured basal cell carcinoma OR surgically cured cervical dysplasia)"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_surgically_cured_basal_cell_carcinoma_or_cervical_dysplasia
      patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
:named REQ6_AUXILIARY0)) ;; "the cancer was NOT (surgically cured basal cell carcinoma OR surgically cured cervical dysplasia)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
             patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_surgically_cured_basal_cell_carcinoma_or_cervical_dysplasia))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had cancer) AND (the cancer was NOT (surgically cured basal cell carcinoma OR surgically cured cervical dysplasia))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_serious_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a serious infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a serious infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a serious infectious disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a serious infectious disease."} ;; "the patient has long term serious infectious disease"

(declare-const patient_has_diagnosis_of_serious_infectious_disease_now@@serious_and_long_term Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a serious infectious disease that is serious and long-term.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of a serious infectious disease that is not serious and/or not long-term.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's serious infectious disease is serious and long-term.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a serious infectious disease that is serious and long-term."} ;; "long term serious infectious disease"

(declare-const patient_has_diagnosis_of_serious_infectious_disease_now@@active_or_was_active_within_2_years_of_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active serious infectious disease or had active serious infectious disease within two years prior to the baseline visit.","when_to_set_to_false":"Set to false if the patient has never had active serious infectious disease or only had inactive serious infectious disease more than two years prior to the baseline visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active serious infectious disease or had active serious infectious disease within two years prior to the baseline visit.","meaning":"Boolean indicating whether the patient currently has active serious infectious disease or had active serious infectious disease within two years prior to the baseline visit."} ;; "the disease is now active OR the disease was active within two years of the baseline visit"

(declare-const patient_has_diagnosis_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of tuberculosis."} ;; "tuberculosis"

(declare-const patient_has_diagnosis_of_tuberculosis_now@@active_or_was_active_within_2_years_of_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active tuberculosis or had active tuberculosis within two years prior to the baseline visit.","when_to_set_to_false":"Set to false if the patient has never had active tuberculosis or only had inactive tuberculosis more than two years prior to the baseline visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active tuberculosis or had active tuberculosis within two years prior to the baseline visit.","meaning":"Boolean indicating whether the patient currently has active tuberculosis or had active tuberculosis within two years prior to the baseline visit."} ;; "tuberculosis is now active OR was active within two years of the baseline visit"

(declare-const patient_has_diagnosis_of_mycosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mycosis (fungal infection).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mycosis (fungal infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mycosis (fungal infection).","meaning":"Boolean indicating whether the patient currently has a diagnosis of mycosis (fungal infection)."} ;; "fungal infection"

(declare-const patient_has_diagnosis_of_mycosis_now@@serious_and_long_term Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mycosis (fungal infection) that is serious and long-term.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of mycosis (fungal infection) that is not serious and/or not long-term.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's mycosis (fungal infection) is serious and long-term.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mycosis (fungal infection) that is serious and long-term."} ;; "fungal infection that is serious and long-term"

(declare-const patient_has_diagnosis_of_mycosis_now@@active_or_was_active_within_2_years_of_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active mycosis (fungal infection) or had active mycosis within two years prior to the baseline visit.","when_to_set_to_false":"Set to false if the patient has never had active mycosis or only had inactive mycosis more than two years prior to the baseline visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active mycosis or had active mycosis within two years prior to the baseline visit.","meaning":"Boolean indicating whether the patient currently has active mycosis (fungal infection) or had active mycosis within two years prior to the baseline visit."} ;; "fungal infection is now active OR was active within two years of the baseline visit"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples: tuberculosis and fungal infection are examples of long term serious infectious disease
(assert
(! (=> (or patient_has_diagnosis_of_tuberculosis_now
          patient_has_diagnosis_of_mycosis_now)
     patient_has_diagnosis_of_serious_infectious_disease_now)
:named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (tuberculosis, fungal infection)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_serious_infectious_disease_now@@serious_and_long_term
       patient_has_diagnosis_of_serious_infectious_disease_now)
:named REQ7_AUXILIARY1)) ;; "serious and long-term"

(assert
(! (=> patient_has_diagnosis_of_serious_infectious_disease_now@@active_or_was_active_within_2_years_of_baseline_visit
       patient_has_diagnosis_of_serious_infectious_disease_now)
:named REQ7_AUXILIARY2)) ;; "active or was active within two years of the baseline visit"

(assert
(! (=> patient_has_diagnosis_of_tuberculosis_now@@active_or_was_active_within_2_years_of_baseline_visit
       patient_has_diagnosis_of_tuberculosis_now)
:named REQ7_AUXILIARY3)) ;; "tuberculosis is now active or was active within two years of the baseline visit"

(assert
(! (=> patient_has_diagnosis_of_mycosis_now@@serious_and_long_term
       patient_has_diagnosis_of_mycosis_now)
:named REQ7_AUXILIARY4)) ;; "fungal infection that is serious and long-term"

(assert
(! (=> patient_has_diagnosis_of_mycosis_now@@active_or_was_active_within_2_years_of_baseline_visit
       patient_has_diagnosis_of_mycosis_now)
:named REQ7_AUXILIARY5)) ;; "fungal infection is now active or was active within two years of the baseline visit"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have long term serious infectious disease (with non-exhaustive examples) AND (disease is now active OR was active within two years of baseline visit)
(assert
(! (not (and patient_has_diagnosis_of_serious_infectious_disease_now@@serious_and_long_term
             patient_has_diagnosis_of_serious_infectious_disease_now@@active_or_was_active_within_2_years_of_baseline_visit))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has long term serious infectious disease with non-exhaustive examples (tuberculosis, fungal infection)) AND ((the disease is now active) OR (the disease was active within two years of the baseline visit))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with human immunodeficiency virus infection at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with human immunodeficiency virus infection at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of human immunodeficiency virus infection in their history."} ;; "human immunodeficiency virus infection"

(declare-const patient_has_finding_of_immunosuppression_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of immunosuppression (immunosuppressive state) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a finding of immunosuppression (immunosuppressive state) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of immunosuppression (immunosuppressive state).","meaning":"Boolean indicating whether the patient has ever had a finding of immunosuppression in their history."} ;; "immunosuppressive state"

(declare-const patient_has_history_of_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had chemotherapy at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had chemotherapy at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had chemotherapy in their history.","meaning":"Boolean indicating whether the patient has ever had a history of chemotherapy in their history."} ;; "chemotherapy"

(declare-const patient_has_history_of_radiation_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had radiation therapy at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had radiation therapy at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had radiation therapy in their history.","meaning":"Boolean indicating whether the patient has ever had a history of radiation therapy in their history."} ;; "radiation therapy"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_history_of_chemotherapy_inthehistory
          patient_has_history_of_radiation_therapy_inthehistory)
     patient_has_finding_of_immunosuppression_inthehistory)
:named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples (chemotherapy, radiation therapy)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory
            patient_has_finding_of_immunosuppression_inthehistory))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had human immunodeficiency virus infection) OR (the patient has had immunosuppressive state with non-exhaustive examples (chemotherapy, radiation therapy))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const days_since_last_experimental_drug_received_before_baseline_visit Real) ;; {"when_to_set_to_value":"Set to the number of days between the patient's last receipt of an experimental drug and the baseline visit, if known.","when_to_set_to_null":"Set to null if the number of days since last experimental drug receipt before baseline visit is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days between the patient's last receipt of an experimental drug and the baseline visit."} ;; "number of days between last experimental drug and baseline visit"

(declare-const patient_has_received_experimental_drug_within_30_days_of_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received an experimental drug within thirty days prior to the baseline visit.","when_to_set_to_false":"Set to false if the patient has not received an experimental drug within thirty days prior to the baseline visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received an experimental drug within thirty days prior to the baseline visit.","meaning":"Boolean indicating whether the patient has received an experimental drug within thirty days prior to the baseline visit."} ;; "has received experimental drug within thirty days of the baseline visit"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition: patient_has_received_experimental_drug_within_30_days_of_baseline_visit is true iff days_since_last_experimental_drug_received_before_baseline_visit < 30
(assert
(! (= patient_has_received_experimental_drug_within_30_days_of_baseline_visit
    (< days_since_last_experimental_drug_received_before_baseline_visit 30))
:named REQ9_AUXILIARY0)) ;; "has received experimental drug within thirty days of the baseline visit"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_received_experimental_drug_within_30_days_of_baseline_visit)
:named REQ9_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received experimental drug within thirty days of the baseline visit."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_exposed_to_monoclonal_antibody_inthehistory@@temporalcontext_within3months_of_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to monoclonal antibody occurred within three months of the baseline visit.","when_to_set_to_false":"Set to false if the patient's exposure to monoclonal antibody did not occur within three months of the baseline visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within three months of the baseline visit.","meaning":"Boolean indicating whether the patient's exposure to monoclonal antibody occurred within three months of the baseline visit."} ;; "the patient has received monoclonal antibody within three months of the baseline visit"
(declare-const patient_is_exposed_to_similar_medication_inthehistory@@temporalcontext_within3months_of_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to similar medication occurred within three months of the baseline visit.","when_to_set_to_false":"Set to false if the patient's exposure to similar medication did not occur within three months of the baseline visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within three months of the baseline visit.","meaning":"Boolean indicating whether the patient's exposure to similar medication occurred within three months of the baseline visit."} ;; "the patient has received similar medication within three months of the baseline visit"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_exposed_to_monoclonal_antibody_inthehistory@@temporalcontext_within3months_of_baseline_visit)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received monoclonal antibody within three months of the baseline visit."

(assert
(! (not patient_is_exposed_to_similar_medication_inthehistory@@temporalcontext_within3months_of_baseline_visit)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received similar medication within three months of the baseline visit."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_undergone_intravenous_steroid_injection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone intravenous injection of corticosteroid at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone intravenous injection of corticosteroid at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone intravenous injection of corticosteroid.","meaning":"Boolean indicating whether the patient has ever undergone intravenous injection of corticosteroid."} ;; "intravenous injection of corticosteroid"
(declare-const patient_has_undergone_intravenous_steroid_injection_inthehistory@@temporalcontext_within4weeks_of_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone intravenous injection of corticosteroid within four weeks of the baseline visit.","when_to_set_to_false":"Set to false if the patient has not undergone intravenous injection of corticosteroid within four weeks of the baseline visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone intravenous injection of corticosteroid within four weeks of the baseline visit.","meaning":"Boolean indicating whether the patient has undergone intravenous injection of corticosteroid within four weeks of the baseline visit."} ;; "intravenous injection of corticosteroid within four weeks of the baseline visit"
(declare-const patient_has_undergone_injection_of_steroid_into_joint_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone joint injection of corticosteroid at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone joint injection of corticosteroid at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone joint injection of corticosteroid.","meaning":"Boolean indicating whether the patient has ever undergone joint injection of corticosteroid."} ;; "joint injection of corticosteroid"
(declare-const patient_has_undergone_injection_of_steroid_into_joint_inthehistory@@temporalcontext_within4weeks_of_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone joint injection of corticosteroid within four weeks of the baseline visit.","when_to_set_to_false":"Set to false if the patient has not undergone joint injection of corticosteroid within four weeks of the baseline visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone joint injection of corticosteroid within four weeks of the baseline visit.","meaning":"Boolean indicating whether the patient has undergone joint injection of corticosteroid within four weeks of the baseline visit."} ;; "joint injection of corticosteroid within four weeks of the baseline visit"
(declare-const patient_has_undergone_intramuscular_infiltration_of_steroid_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone muscle injection of corticosteroid at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone muscle injection of corticosteroid at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone muscle injection of corticosteroid.","meaning":"Boolean indicating whether the patient has ever undergone muscle injection of corticosteroid."} ;; "muscle injection of corticosteroid"
(declare-const patient_has_undergone_intramuscular_infiltration_of_steroid_inthehistory@@temporalcontext_within4weeks_of_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone muscle injection of corticosteroid within four weeks of the baseline visit.","when_to_set_to_false":"Set to false if the patient has not undergone muscle injection of corticosteroid within four weeks of the baseline visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone muscle injection of corticosteroid within four weeks of the baseline visit.","meaning":"Boolean indicating whether the patient has undergone muscle injection of corticosteroid within four weeks of the baseline visit."} ;; "muscle injection of corticosteroid within four weeks of the baseline visit"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_intravenous_steroid_injection_inthehistory@@temporalcontext_within4weeks_of_baseline_visit
      patient_has_undergone_intravenous_steroid_injection_inthehistory)
    :named REQ11_AUXILIARY0)) ;; "intravenous injection of corticosteroid within four weeks of the baseline visit"

(assert
(! (=> patient_has_undergone_injection_of_steroid_into_joint_inthehistory@@temporalcontext_within4weeks_of_baseline_visit
      patient_has_undergone_injection_of_steroid_into_joint_inthehistory)
    :named REQ11_AUXILIARY1)) ;; "joint injection of corticosteroid within four weeks of the baseline visit"

(assert
(! (=> patient_has_undergone_intramuscular_infiltration_of_steroid_inthehistory@@temporalcontext_within4weeks_of_baseline_visit
      patient_has_undergone_intramuscular_infiltration_of_steroid_inthehistory)
    :named REQ11_AUXILIARY2)) ;; "muscle injection of corticosteroid within four weeks of the baseline visit"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_undergone_intravenous_steroid_injection_inthehistory@@temporalcontext_within4weeks_of_baseline_visit)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has received intravenous injection of corticosteroid within four weeks of the baseline visit"

(assert
(! (not patient_has_undergone_injection_of_steroid_into_joint_inthehistory@@temporalcontext_within4weeks_of_baseline_visit)
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has received joint injection of corticosteroid within four weeks of the baseline visit"

(assert
(! (not patient_has_undergone_intramuscular_infiltration_of_steroid_inthehistory@@temporalcontext_within4weeks_of_baseline_visit)
    :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has received muscle injection of corticosteroid within four weeks of the baseline visit"

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of alcohol abuse."} ;; "abuses alcohol"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis relating to drug misuse behavior.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis relating to drug misuse behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis relating to drug misuse behavior.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis relating to drug misuse behavior."} ;; "abuses drugs"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient abuses alcohol."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient abuses drugs."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_unwilling_to_follow_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to follow the study protocol.","when_to_set_to_false":"Set to false if the patient is currently willing to follow the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to follow the study protocol.","meaning":"Boolean indicating whether the patient is currently unwilling to follow the study protocol."} ;; "the patient is unwilling to follow the protocol"
(declare-const patient_is_unable_to_follow_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to follow the study protocol.","when_to_set_to_false":"Set to false if the patient is currently able to follow the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to follow the study protocol.","meaning":"Boolean indicating whether the patient is currently unable to follow the study protocol."} ;; "the patient is unable to follow the protocol"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_unwilling_to_follow_protocol_now)
:named REQ13_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to follow the protocol."

(assert
(! (not patient_is_unable_to_follow_protocol_now)
:named REQ13_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to follow the protocol."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_difficult_venous_access_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of difficult venous access (poor veins for receiving injection).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of difficult venous access.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficult venous access.","meaning":"Boolean indicating whether the patient currently has difficult venous access."} ;; "poor veins for receiving injection"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_difficult_venous_access_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poor veins for receiving injection."
