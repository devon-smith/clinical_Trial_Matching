;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_epithelial_tumor_of_low_malignant_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an epithelial tumor of low malignant potential.","when_to_set_to_false":"Set to false if the patient currently does not have an epithelial tumor of low malignant potential.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an epithelial tumor of low malignant potential.","meaning":"Boolean indicating whether the patient currently has an epithelial tumor of low malignant potential."} ;; "epithelial tumor of low malignant potential"
(declare-const patient_has_finding_of_sex_cord_tumor_of_ovary_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a stromal (sex cord) tumor of the ovary.","when_to_set_to_false":"Set to false if the patient currently does not have a stromal (sex cord) tumor of the ovary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a stromal (sex cord) tumor of the ovary.","meaning":"Boolean indicating whether the patient currently has a stromal (sex cord) tumor of the ovary."} ;; "stromal tumor of the ovary"
(declare-const patient_has_finding_of_germ_cell_tumor_of_ovary_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a germ cell tumor of the ovary.","when_to_set_to_false":"Set to false if the patient currently does not have a germ cell tumor of the ovary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a germ cell tumor of the ovary.","meaning":"Boolean indicating whether the patient currently has a germ cell tumor of the ovary."} ;; "germ cell tumor of the ovary"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_epithelial_tumor_of_low_malignant_potential_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has epithelial tumor of low malignant potential."

(assert
  (! (not patient_has_finding_of_sex_cord_tumor_of_ovary_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has stromal tumor of the ovary."

(assert
  (! (not patient_has_finding_of_germ_cell_tumor_of_ovary_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has germ cell tumor of the ovary."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disease."} ;; "disease"
(declare-const patient_has_known_standard_therapy_for_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known standard therapy available for their disease.","when_to_set_to_false":"Set to false if the patient currently does not have a known standard therapy available for their disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known standard therapy available for their disease.","meaning":"Boolean indicating whether the patient currently has a known standard therapy available for the disease the patient has."} ;; "known standard therapy for the disease of the patient"
(declare-const patient_has_known_standard_therapy_for_disease_now@@is_potentially_curative_or_extends_life_expectancy Bool) ;; {"when_to_set_to_true":"Set to true if the standard therapy is either potentially curative or definitely capable of extending life expectancy.","when_to_set_to_false":"Set to false if the standard therapy is neither potentially curative nor definitely capable of extending life expectancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the standard therapy is potentially curative or definitely capable of extending life expectancy.","meaning":"Boolean indicating that the standard therapy is either potentially curative or definitely capable of extending life expectancy."} ;; "potentially curative or definitely capable of extending life expectancy"
(declare-const patient_is_in_first_relapse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing their first relapse of the disease.","when_to_set_to_false":"Set to false if the patient is not currently experiencing their first relapse of the disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing their first relapse of the disease.","meaning":"Boolean indicating whether the patient is currently experiencing their first relapse of the disease."} ;; "this is the first relapse of the patient"
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone administration of antineoplastic agent (chemotherapy) in the past.","when_to_set_to_false":"Set to false if the patient has never undergone administration of antineoplastic agent (chemotherapy) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of antineoplastic agent (chemotherapy) in the past.","meaning":"Boolean indicating whether the patient has ever undergone administration of antineoplastic agent (chemotherapy) in the past."} ;; "chemotherapy"
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@is_primary_adjuvant_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the chemotherapy undergone by the patient was primary adjuvant chemotherapy.","when_to_set_to_false":"Set to false if the chemotherapy undergone by the patient was not primary adjuvant chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy was primary adjuvant.","meaning":"Boolean indicating whether the chemotherapy undergone was primary adjuvant chemotherapy."} ;; "primary adjuvant chemotherapy"
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@completed_more_than_6_months_before_recurrence Bool) ;; {"when_to_set_to_true":"Set to true if the chemotherapy was completed more than 6 months before the patient's recurrence.","when_to_set_to_false":"Set to false if the chemotherapy was completed 6 months or less before the patient's recurrence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy was completed more than 6 months before recurrence.","meaning":"Boolean indicating whether the chemotherapy was completed more than 6 months before recurrence."} ;; "recurred more than 6 months from completion of primary adjuvant chemotherapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable for standard therapy
(assert
(! (=> patient_has_known_standard_therapy_for_disease_now@@is_potentially_curative_or_extends_life_expectancy
      patient_has_known_standard_therapy_for_disease_now)
:named REQ1_AUXILIARY0)) ;; "potentially curative or definitely capable of extending life expectancy"

;; Qualifier variable implies stem variable for chemotherapy
(assert
(! (=> patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@is_primary_adjuvant_chemotherapy
      patient_has_undergone_administration_of_antineoplastic_agent_inthehistory)
:named REQ1_AUXILIARY1)) ;; "primary adjuvant chemotherapy"

;; Qualifier variable implies stem variable for chemotherapy (completed >6 months before recurrence)
(assert
(! (=> patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@completed_more_than_6_months_before_recurrence
      patient_has_undergone_administration_of_antineoplastic_agent_inthehistory)
:named REQ1_AUXILIARY2)) ;; "recurred more than 6 months from completion of primary adjuvant chemotherapy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and
          patient_has_known_standard_therapy_for_disease_now@@is_potentially_curative_or_extends_life_expectancy
          patient_is_in_first_relapse_now
          patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@is_primary_adjuvant_chemotherapy
          patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@completed_more_than_6_months_before_recurrence
      ))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has known standard therapy for the disease of the patient that is potentially curative or definitely capable of extending life expectancy) AND (this is the first relapse of the patient) AND (the patient has recurred more than 6 months from completion of primary adjuvant chemotherapy)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_ecog_performance_status_grade_3_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ECOG performance status grade 3.","when_to_set_to_false":"Set to false if the patient currently does not have ECOG performance status grade 3.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ECOG performance status grade 3.","meaning":"Boolean indicating whether the patient currently has ECOG performance status grade 3."} ;; "Eastern Cooperative Oncology Group (ECOG) performance status of 3"
(declare-const patient_has_finding_of_ecog_performance_status_grade_4_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ECOG performance status grade 4.","when_to_set_to_false":"Set to false if the patient currently does not have ECOG performance status grade 4.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ECOG performance status grade 4.","meaning":"Boolean indicating whether the patient currently has ECOG performance status grade 4."} ;; "Eastern Cooperative Oncology Group (ECOG) performance status of 4"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_ecog_performance_status_grade_3_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Eastern Cooperative Oncology Group (ECOG) performance status of 3."

(assert
(! (not patient_has_finding_of_ecog_performance_status_grade_4_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Eastern Cooperative Oncology Group (ECOG) performance status of 4."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_inthepast5days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a disorder due to infection within the past 5 days prior to registration.","when_to_set_to_false":"Set to false if the patient does not have a disorder due to infection within the past 5 days prior to registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a disorder due to infection within the past 5 days prior to registration.","meaning":"Boolean indicating whether the patient has a disorder due to infection within the past 5 days prior to registration."} ;; "infection within 5 days prior to registration"
(declare-const patient_has_finding_of_disorder_due_to_infection_inthepast5days@@active Bool) ;; {"when_to_set_to_true":"Set to true if the disorder due to infection within the past 5 days is active (ongoing or symptomatic).","when_to_set_to_false":"Set to false if the disorder due to infection within the past 5 days is not active (resolved or inactive).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder due to infection within the past 5 days is active.","meaning":"Boolean indicating whether the disorder due to infection within the past 5 days is active."} ;; "active infection within 5 days prior to registration"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_inthepast5days@@active
      patient_has_finding_of_disorder_due_to_infection_inthepast5days)
:named REQ3_AUXILIARY0)) ;; "active infection within 5 days prior to registration"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_inthepast5days@@active)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active infection within 5 days prior to registration."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_tuberculosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with tuberculosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with tuberculosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with tuberculosis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of tuberculosis in their history."} ;; "history of tuberculosis"
(declare-const patient_has_finding_of_mantoux_positive_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of Mantoux (PPD) test positivity at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a finding of Mantoux (PPD) test positivity at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of Mantoux (PPD) test positivity.","meaning":"Boolean indicating whether the patient has ever had a finding of Mantoux (PPD) test positivity in their history."} ;; "history of purified protein derivative test positivity"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_diagnosis_of_tuberculosis_inthehistory
            patient_has_finding_of_mantoux_positive_inthehistory))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has history of tuberculosis) OR (the patient has history of purified protein derivative test positivity)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (malignancy) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (malignancy) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient has ever been diagnosed with malignant neoplastic disease (malignancy) at any time in their history."} ;; "malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@temporalcontext_within5yearspriortoevaluation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant neoplastic disease (malignancy) occurred within 5 years prior to evaluation.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant neoplastic disease (malignancy) did not occur within 5 years prior to evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis occurred within 5 years prior to evaluation.","meaning":"Boolean indicating whether the patient's diagnosis of malignant neoplastic disease (malignancy) occurred within 5 years prior to evaluation."} ;; "history of other malignancy within 5 years"
(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplasm of skin (skin cancer) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplasm of skin (skin cancer) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplasm of skin (skin cancer).","meaning":"Boolean indicating whether the patient has ever been diagnosed with malignant neoplasm of skin (skin cancer) at any time in their history."} ;; "skin cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory@@non_melanoma_type Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant neoplasm of skin (skin cancer) is of the non-melanoma type.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant neoplasm of skin (skin cancer) is not of the non-melanoma type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is of the non-melanoma type.","meaning":"Boolean indicating whether the patient's diagnosis of malignant neoplasm of skin (skin cancer) is of the non-melanoma type."} ;; "non-melanoma skin cancer"
(declare-const patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with carcinoma in situ of uterine cervix at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with carcinoma in situ of uterine cervix at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with carcinoma in situ of uterine cervix.","meaning":"Boolean indicating whether the patient has ever been diagnosed with carcinoma in situ of uterine cervix at any time in their history."} ;; "carcinoma in situ of the cervix"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable for skin cancer
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory@@non_melanoma_type
       patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory)
   :named REQ5_AUXILIARY0)) ;; "non-melanoma skin cancer"

;; Qualifier variable implies corresponding stem variable for malignancy within 5 years
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@temporalcontext_within5yearspriortoevaluation
       patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
   :named REQ5_AUXILIARY1)) ;; "history of other malignancy within 5 years"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: history of other malignancy within 5 years, except for non-melanoma skin cancer or carcinoma in situ of the cervix
(assert
(! (not (and
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@temporalcontext_within5yearspriortoevaluation
         (not (or patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory@@non_melanoma_type
                  patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory))))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has history of other malignancy within 5 years) AND NOT ((the patient has non-melanoma skin cancer) OR (the patient has carcinoma in situ of the cervix))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_undergone_chemotherapy_inthepast3weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy within the past 3 weeks prior to study entry.","when_to_set_to_false":"Set to false if the patient has not undergone chemotherapy within the past 3 weeks prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chemotherapy within the past 3 weeks prior to study entry.","meaning":"Boolean indicating whether the patient has undergone chemotherapy within the past 3 weeks."} ;; "chemotherapy within 3 weeks prior to study entry"
(declare-const patient_has_undergone_immunological_therapy_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone immunological therapy within the past 4 weeks prior to study entry.","when_to_set_to_false":"Set to false if the patient has not undergone immunological therapy within the past 4 weeks prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone immunological therapy within the past 4 weeks prior to study entry.","meaning":"Boolean indicating whether the patient has undergone immunological therapy within the past 4 weeks."} ;; "immunotherapy within 4 weeks prior to study entry"
(declare-const patient_has_undergone_biological_treatment_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone biological treatment within the past 4 weeks prior to study entry.","when_to_set_to_false":"Set to false if the patient has not undergone biological treatment within the past 4 weeks prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone biological treatment within the past 4 weeks prior to study entry.","meaning":"Boolean indicating whether the patient has undergone biological treatment within the past 4 weeks."} ;; "biologic therapy within 4 weeks prior to study entry"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_undergone_chemotherapy_inthepast3weeks)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received chemotherapy within 3 weeks prior to study entry."

(assert
(! (not patient_has_undergone_immunological_therapy_inthepast4weeks)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received immunotherapy within 4 weeks prior to study entry."

(assert
(! (not patient_has_undergone_biological_treatment_inthepast4weeks)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received biologic therapy within 4 weeks prior to study entry."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_operation_on_abdominal_region_inthepast3weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any operation on the abdominal region within the past 3 weeks prior to study entry.","when_to_set_to_false":"Set to false if the patient has not undergone any operation on the abdominal region within the past 3 weeks prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any operation on the abdominal region within the past 3 weeks prior to study entry.","meaning":"Boolean indicating whether the patient has undergone any operation on the abdominal region within the past 3 weeks."} ;; "extensive abdominal surgery ... less than 3 weeks prior to study entry"
(declare-const patient_has_undergone_incision_of_intestine_inthepast3weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone enterotomy (incision of intestine) within the past 3 weeks prior to study entry.","when_to_set_to_false":"Set to false if the patient has not undergone enterotomy (incision of intestine) within the past 3 weeks prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone enterotomy (incision of intestine) within the past 3 weeks prior to study entry.","meaning":"Boolean indicating whether the patient has undergone enterotomy (incision of intestine) within the past 3 weeks."} ;; "enterotomy less than 3 weeks prior to study entry"
(declare-const patient_has_undergone_placement_of_peritoneal_port_a_cath_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone placement of peritoneal port-a-cath at the time of study entry.","when_to_set_to_false":"Set to false if the patient has not undergone placement of peritoneal port-a-cath at the time of study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone placement of peritoneal port-a-cath at the time of study entry.","meaning":"Boolean indicating whether the patient has undergone placement of peritoneal port-a-cath at the time of study entry."} ;; "placement of peritoneal port-a-cath at the time of study entry"
(declare-const patient_has_undergone_lysis_of_adhesions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone lysis of adhesions at the time of study entry.","when_to_set_to_false":"Set to false if the patient has not undergone lysis of adhesions at the time of study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone lysis of adhesions at the time of study entry.","meaning":"Boolean indicating whether the patient has undergone lysis of adhesions at the time of study entry."} ;; "lysis of adhesions at the time of study entry"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples: "including enterotomy" means enterotomy is an example of extensive abdominal surgery, not an exhaustive list.
(assert
(! (=> patient_has_undergone_incision_of_intestine_inthepast3weeks
     patient_has_undergone_operation_on_abdominal_region_inthepast3weeks)
:named REQ7_AUXILIARY0)) ;; "including enterotomy less than 3 weeks prior to study entry"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient has had extensive abdominal surgery (including enterotomy) <3 weeks prior to study entry AND NOT (placement of peritoneal port-a-cath OR lysis of adhesions at study entry)
(assert
(! (not (and
          patient_has_undergone_operation_on_abdominal_region_inthepast3weeks
          (not (or patient_has_undergone_placement_of_peritoneal_port_a_cath_now
                   patient_has_undergone_lysis_of_adhesions_now))))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had extensive abdominal surgery including enterotomy less than 3 weeks prior to study entry) AND NOT ((the patient has placement of peritoneal port-a-cath at the time of study entry) OR (the patient has lysis of adhesions at the time of study entry))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_received_viral_therapy_prior_to_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any viral therapy at any time prior to study entry.","when_to_set_to_false":"Set to false if it is known that the patient has not received any viral therapy at any time prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any viral therapy prior to study entry.","meaning":"Boolean indicating whether the patient has received any viral therapy at any time prior to study entry."} ;; "has received any viral therapy prior to study entry"

(declare-const patient_has_undergone_gene_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone gene therapy at any time prior to the present (including any time before study entry).","when_to_set_to_false":"Set to false if it is known that the patient has never undergone gene therapy at any time prior to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone gene therapy prior to the present.","meaning":"Boolean indicating whether the patient has ever undergone gene therapy at any time in their medical history."} ;; "has received any gene therapy prior to study entry"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_received_viral_therapy_prior_to_study_entry)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received any viral therapy prior to study entry."

(assert
(! (not patient_has_undergone_gene_therapy_inthehistory)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received any gene therapy prior to study entry."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_failed_to_fully_recover_from_acute_reversible_effects_of_prior_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has not fully recovered from acute reversible effects of prior chemotherapy.","when_to_set_to_false":"Set to false if the patient currently has fully recovered from acute reversible effects of prior chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has not fully recovered from acute reversible effects of prior chemotherapy.","meaning":"Boolean indicating whether the patient currently has not fully recovered from acute reversible effects of prior chemotherapy."} ;; "has failed to fully recover from acute reversible effects of prior chemotherapy regardless of interval since last treatment"

(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone chemotherapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone chemotherapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone chemotherapy.","meaning":"Boolean indicating whether the patient has ever undergone chemotherapy in the past."} ;; "prior chemotherapy"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_failed_to_fully_recover_from_acute_reversible_effects_of_prior_chemotherapy_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has failed to fully recover from acute reversible effects of prior chemotherapy regardless of interval since last treatment."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_nyha_classification_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has NYHA classification III.","when_to_set_to_false":"Set to false if the patient currently does not have NYHA classification III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has NYHA classification III.","meaning":"Boolean indicating whether the patient currently has NYHA classification III."} ;; "The patient is excluded if the patient has New York Heart Association (NYHA) classification III."

(declare-const patient_has_nyha_classification_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has NYHA classification IV.","when_to_set_to_false":"Set to false if the patient currently does not have NYHA classification IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has NYHA classification IV.","meaning":"Boolean indicating whether the patient currently has NYHA classification IV."} ;; "The patient is excluded if the patient has NYHA classification IV."

(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary artery disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary artery disease."} ;; "coronary artery disease"

(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of coronary artery disease is known (previously established and documented).","when_to_set_to_false":"Set to false if the diagnosis is not known or not previously established.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the diagnosis of coronary artery disease is known."} ;; "known symptomatic coronary artery disease"

(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of coronary artery disease is symptomatic (the patient is currently experiencing symptoms attributable to the disease).","when_to_set_to_false":"Set to false if the diagnosis is not symptomatic (the patient is asymptomatic).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is symptomatic.","meaning":"Boolean indicating whether the diagnosis of coronary artery disease is symptomatic."} ;; "known symptomatic coronary artery disease"

(declare-const patient_has_symptoms_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms attributable to coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms attributable to coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of coronary artery disease.","meaning":"Boolean indicating whether the patient currently has symptoms of coronary artery disease."} ;; "symptoms of coronary artery disease on systems review"

(declare-const patient_has_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has cardiac arrhythmia."} ;; "known cardiac arrhythmia"

(declare-const patient_has_cardiac_arrhythmia_now@@atrial_fibrillation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac arrhythmia is atrial fibrillation.","when_to_set_to_false":"Set to false if the patient's current cardiac arrhythmia is not atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac arrhythmia is atrial fibrillation.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia is atrial fibrillation."} ;; "atrial fibrillation"

(declare-const patient_has_cardiac_arrhythmia_now@@supraventricular_tachycardia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac arrhythmia is supraventricular tachycardia.","when_to_set_to_false":"Set to false if the patient's current cardiac arrhythmia is not supraventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac arrhythmia is supraventricular tachycardia.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia is supraventricular tachycardia."} ;; "supraventricular tachycardia"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_now@@known
      patient_has_diagnosis_of_coronary_arteriosclerosis_now)
    :named REQ10_AUXILIARY0)) ;; "known symptomatic coronary artery disease"

(assert
(! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_now@@symptomatic
      patient_has_diagnosis_of_coronary_arteriosclerosis_now)
    :named REQ10_AUXILIARY1)) ;; "known symptomatic coronary artery disease"

;; Exhaustive subcategories for cardiac arrhythmia: atrial fibrillation OR supraventricular tachycardia
(assert
(! (= patient_has_cardiac_arrhythmia_now
      (or patient_has_cardiac_arrhythmia_now@@atrial_fibrillation
          patient_has_cardiac_arrhythmia_now@@supraventricular_tachycardia))
    :named REQ10_AUXILIARY2)) ;; "known cardiac arrhythmia with exhaustive subcategories (atrial fibrillation OR supraventricular tachycardia)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_cardiac_arrhythmia_now@@atrial_fibrillation
      patient_has_cardiac_arrhythmia_now)
    :named REQ10_AUXILIARY3)) ;; "atrial fibrillation"

(assert
(! (=> patient_has_cardiac_arrhythmia_now@@supraventricular_tachycardia
      patient_has_cardiac_arrhythmia_now)
    :named REQ10_AUXILIARY4)) ;; "supraventricular tachycardia"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_nyha_classification_iii_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has New York Heart Association (NYHA) classification III."

(assert
(! (not patient_has_nyha_classification_iv_now)
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has NYHA classification IV."

(assert
(! (not (and patient_has_diagnosis_of_coronary_arteriosclerosis_now@@known
             patient_has_diagnosis_of_coronary_arteriosclerosis_now@@symptomatic))
    :named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known symptomatic coronary artery disease."

(assert
(! (not patient_has_symptoms_of_coronary_arteriosclerosis_now)
    :named REQ10_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms of coronary artery disease on systems review."

(assert
(! (not patient_has_cardiac_arrhythmia_now)
    :named REQ10_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known cardiac arrhythmia with exhaustive subcategories (atrial fibrillation OR supraventricular tachycardia)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_undergoing_support_transfusion_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing (i.e., requires and is receiving) support transfusion therapy (blood product support) now.","when_to_set_to_false":"Set to false if the patient is not currently undergoing (does not require and is not receiving) support transfusion therapy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing support transfusion therapy now.","meaning":"Boolean indicating whether the patient is currently undergoing support transfusion therapy (blood product support) now."} ;; "blood product support"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_undergoing_support_transfusion_therapy_now)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires blood product support."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_central_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has central nervous system metastases (secondary malignant neoplasm of CNS).","when_to_set_to_false":"Set to false if the patient currently does not have central nervous system metastases (secondary malignant neoplasm of CNS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has central nervous system metastases (secondary malignant neoplasm of CNS).","meaning":"Boolean indicating whether the patient currently has central nervous system metastases (secondary malignant neoplasm of CNS)."} ;; "central nervous system metastases"
(declare-const patient_has_finding_of_seizure_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a seizure disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a seizure disorder.","meaning":"Boolean indicating whether the patient currently has a seizure disorder."} ;; "seizure disorder"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (not patient_has_finding_of_secondary_malignant_neoplasm_of_central_nervous_system_now)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has central nervous system metastases."

(assert
  (! (not patient_has_finding_of_seizure_disorder_now)
     :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has seizure disorder."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_hiv_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive HIV test result (is HIV positive).","when_to_set_to_false":"Set to false if the patient currently does not have a positive HIV test result (is not HIV positive).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive HIV test result.","meaning":"Boolean indicating whether the patient currently has a positive HIV test result (is HIV positive) now."} ;; "positive human immunodeficiency virus test result"
(declare-const patient_has_finding_of_immunodeficiency_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of any immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient does not have a documented history of any immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of immunodeficiency disorder.","meaning":"Boolean indicating whether the patient has a history of any immunodeficiency disorder."} ;; "history of other immunodeficiency"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (not (or patient_has_finding_of_hiv_positive_now
              patient_has_finding_of_immunodeficiency_disorder_inthehistory))
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has positive human immunodeficiency virus test result) OR (the patient has history of other immunodeficiency)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_undergone_transplantation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a transplantation procedure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a transplantation procedure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a transplantation procedure at any time in their history."} ;; "history of organ transplantation"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_undergone_transplantation_inthehistory)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of organ transplantation."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_chronic_type_b_viral_hepatitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of chronic hepatitis B at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of chronic hepatitis B at any time prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had chronic hepatitis B.","meaning":"Boolean indicating whether the patient has ever had chronic hepatitis B in their history."} ;; "chronic hepatitis B"

(declare-const patient_has_finding_of_chronic_hepatitis_c_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of chronic hepatitis C at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of chronic hepatitis C at any time prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had chronic hepatitis C.","meaning":"Boolean indicating whether the patient has ever had chronic hepatitis C in their history."} ;; "chronic hepatitis C"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_chronic_type_b_viral_hepatitis_inthehistory)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of chronic hepatitis B."

(assert
(! (not patient_has_finding_of_chronic_hepatitis_c_inthehistory)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of chronic hepatitis C."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy."} ;; "the patient is receiving other concurrent chemotherapy"
(declare-const patient_is_undergoing_immunological_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunological therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing immunological therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing immunological therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunological therapy."} ;; "the patient is receiving concurrent immunotherapy"
(declare-const patient_is_undergoing_radiotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing radiotherapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing radiotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing radiotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing radiotherapy."} ;; "the patient is receiving concurrent radiotherapy"
(declare-const patient_is_receiving_ancillary_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any ancillary therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving any ancillary therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving any ancillary therapy.","meaning":"Boolean indicating whether the patient is currently receiving any ancillary therapy."} ;; "the patient is receiving any ancillary therapy"
(declare-const patient_is_receiving_ancillary_therapy_now@@considered_investigational_and_utilized_for_non_fda_approved_indication_and_in_context_of_research_investigation Bool) ;; {"when_to_set_to_true":"Set to true if the ancillary therapy the patient is currently receiving is considered investigational, utilized for a non-Food and Drug Administration-approved indication, and in the context of a research investigation.","when_to_set_to_false":"Set to false if the ancillary therapy the patient is currently receiving is not considered investigational, not utilized for a non-Food and Drug Administration-approved indication, or not in the context of a research investigation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ancillary therapy the patient is currently receiving is considered investigational, utilized for a non-Food and Drug Administration-approved indication, and in the context of a research investigation.","meaning":"Boolean indicating whether the ancillary therapy the patient is currently receiving is considered investigational, utilized for a non-Food and Drug Administration-approved indication, and in the context of a research investigation."} ;; "the patient is receiving any ancillary therapy considered investigational (utilized for a non-Food and Drug Administration-approved indication AND in the context of a research investigation)"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_receiving_ancillary_therapy_now@@considered_investigational_and_utilized_for_non_fda_approved_indication_and_in_context_of_research_investigation
      patient_is_receiving_ancillary_therapy_now)
   :named REQ16_AUXILIARY0)) ;; "the patient is receiving any ancillary therapy considered investigational (utilized for a non-Food and Drug Administration-approved indication AND in the context of a research investigation)"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_is_undergoing_chemotherapy_now)
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is receiving other concurrent chemotherapy"
(assert
(! (not patient_is_undergoing_immunological_therapy_now)
   :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is receiving concurrent immunotherapy"
(assert
(! (not patient_is_undergoing_radiotherapy_now)
   :named REQ16_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is receiving concurrent radiotherapy"
(assert
(! (not patient_is_receiving_ancillary_therapy_now@@considered_investigational_and_utilized_for_non_fda_approved_indication_and_in_context_of_research_investigation)
   :named REQ16_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient is receiving any ancillary therapy considered investigational (utilized for a non-Food and Drug Administration-approved indication AND in the context of a research investigation)"

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "medication"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@could_interfere_with_trial Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to could interfere with the trial.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to could not interfere with the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament could interfere with the trial.","meaning":"Boolean indicating whether the drug or medicament the patient is currently exposed to could interfere with the trial."} ;; "concurrent medication which could interfere with the trial"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@could_interfere_with_trial
      patient_is_exposed_to_drug_or_medicament_now)
    :named REQ17_AUXILIARY0)) ;; "concurrent medication which could interfere with the trial"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@could_interfere_with_trial)
    :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving any concurrent medication which could interfere with the trial."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_disorder_of_abdomen_value_recorded_now_withunit_cm Real) ;; {"when_to_set_to_value":"Set to the measured diameter in centimeters if a numeric measurement of intra-abdominal disease diameter is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current intra-abdominal disease diameter in centimeters."} ;; "intra-abdominal disease with diameter > 8 cm at the time of registration"

(declare-const patient_disorder_of_abdomen_value_recorded_now_withunit_cm@@temporalcontext_at_time_of_registration Bool) ;; {"when_to_set_to_true":"Set to true if the diameter measurement of intra-abdominal disease was taken at the time of registration.","when_to_set_to_false":"Set to false if the diameter measurement was not taken at the time of registration.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was taken at the time of registration.","meaning":"Boolean indicating whether the measurement of intra-abdominal disease diameter was taken at the time of registration."} ;; "diameter > 8 cm at the time of registration"

(declare-const patient_has_finding_of_disorder_of_abdomen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intra-abdominal disease.","when_to_set_to_false":"Set to false if the patient currently does not have intra-abdominal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intra-abdominal disease.","meaning":"Boolean indicating whether the patient currently has intra-abdominal disease."} ;; "intra-abdominal disease"

(declare-const patient_has_finding_of_disorder_of_abdomen_now@@temporalcontext_at_time_of_registration Bool) ;; {"when_to_set_to_true":"Set to true if the diameter measurement of intra-abdominal disease was taken at the time of registration.","when_to_set_to_false":"Set to false if the diameter measurement was not taken at the time of registration.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was taken at the time of registration.","meaning":"Boolean indicating whether the measurement of intra-abdominal disease diameter was taken at the time of registration."} ;; "intra-abdominal disease at the time of registration"

(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intrahepatic (liver) disease.","when_to_set_to_false":"Set to false if the patient currently does not have intrahepatic (liver) disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intrahepatic (liver) disease.","meaning":"Boolean indicating whether the patient currently has intrahepatic (liver) disease."} ;; "intrahepatic disease"

(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease.","when_to_set_to_false":"Set to false if the patient currently does not have disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disease.","meaning":"Boolean indicating whether the patient currently has disease."} ;; "disease"

(declare-const patient_has_finding_of_disease_now@@location_beyond_abdominal_cavity Bool) ;; {"when_to_set_to_true":"Set to true if the disease is located beyond the abdominal cavity.","when_to_set_to_false":"Set to false if the disease is not located beyond the abdominal cavity.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease is located beyond the abdominal cavity.","meaning":"Boolean indicating whether the patient's disease is located beyond the abdominal cavity."} ;; "disease beyond the abdominal cavity"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable for intra-abdominal disease diameter at time of registration implies intra-abdominal disease finding at time of registration
(assert
(! (=> patient_has_finding_of_disorder_of_abdomen_now@@temporalcontext_at_time_of_registration
     patient_has_finding_of_disorder_of_abdomen_now)
:named REQ18_AUXILIARY0)) ;; "intra-abdominal disease at the time of registration"

;; Qualifier variable for disease location beyond abdominal cavity implies disease finding
(assert
(! (=> patient_has_finding_of_disease_now@@location_beyond_abdominal_cavity
     patient_has_finding_of_disease_now)
:named REQ18_AUXILIARY1)) ;; "disease beyond the abdominal cavity"

;; ===================== Constraint Assertions (REQ 18) =====================
;; Exclusion 1: intra-abdominal disease with diameter > 8 cm at time of registration
(assert
(! (not (and patient_has_finding_of_disorder_of_abdomen_now@@temporalcontext_at_time_of_registration
             (> patient_disorder_of_abdomen_value_recorded_now_withunit_cm 8)))
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intra-abdominal disease with diameter > 8 cm at the time of registration."

;; Exclusion 2: intrahepatic disease
(assert
(! (not patient_has_finding_of_disease_of_liver_now)
:named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intrahepatic disease."

;; Exclusion 3: disease beyond the abdominal cavity
(assert
(! (not patient_has_finding_of_disease_now@@location_beyond_abdominal_cavity)
:named REQ18_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has disease beyond the abdominal cavity."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any corticosteroid or corticosteroid derivative containing product, regardless of route of administration.","when_to_set_to_false":"Set to false if the patient is currently not taking any corticosteroid or corticosteroid derivative containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any corticosteroid or corticosteroid derivative containing product.","meaning":"Boolean indicating whether the patient is currently taking any corticosteroid or corticosteroid derivative containing product, by any route."} ;; "corticosteroid"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_orally Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product and the route of administration is oral.","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative containing product but the route is not oral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route of administration is oral.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product and the route of administration is oral."} ;; "oral corticosteroid"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_systemically Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product and the route of administration is systemic.","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative containing product but the route is not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route of administration is systemic.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product and the route of administration is systemic."} ;; "systemic corticosteroid"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_topically_only Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product and the route of administration is exclusively topical (no other routes).","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative containing product and the route is not exclusively topical.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route of administration is exclusively topical.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product and the route of administration is exclusively topical."} ;; "only topical corticosteroid"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_by_inhalation_only Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product and the route of administration is exclusively by inhalation (no other routes).","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative containing product and the route is not exclusively by inhalation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route of administration is exclusively by inhalation.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product and the route of administration is exclusively by inhalation."} ;; "only inhaled corticosteroid"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_orally
      patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
:named REQ19_AUXILIARY0)) ;; "oral corticosteroid"

(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_systemically
      patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
:named REQ19_AUXILIARY1)) ;; "systemic corticosteroid"

(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_topically_only
      patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
:named REQ19_AUXILIARY2)) ;; "only topical corticosteroid"

(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_by_inhalation_only
      patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
:named REQ19_AUXILIARY3)) ;; "only inhaled corticosteroid"

;; ===================== Constraint Assertions (REQ 19) =====================
;; Exclusion: patient is receiving oral or systemic corticosteroid, except if ONLY topical or ONLY inhaled corticosteroid
(assert
(! (not (and
         (or patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_orally
             patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_systemically)
         (not (or patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_topically_only
                  patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_by_inhalation_only))))
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is receiving treatment with oral corticosteroid OR systemic corticosteroid) EXCEPT IF (the patient is receiving only topical corticosteroid OR only inhaled corticosteroid)."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const household_contact_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the value of the household contact's age in months if it is recorded now.","when_to_set_to_null":"Set to null if the household contact's age in months is not recorded now or cannot be determined.","meaning":"Numeric value representing the age in months of the household contact to whom the patient is currently exposed."} ;; "household contact who is 15 months old or younger"

(declare-const household_contact_has_known_immunodeficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the household contact to whom the patient is currently exposed currently has a known immunodeficiency.","when_to_set_to_false":"Set to false if the household contact to whom the patient is currently exposed does not currently have a known immunodeficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the household contact currently has a known immunodeficiency.","meaning":"Boolean indicating whether the household contact to whom the patient is currently exposed currently has a known immunodeficiency."} ;; "household contact with known immunodeficiency"

(declare-const patient_has_exposure_to_household_contact_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has exposure to a household contact.","when_to_set_to_false":"Set to false if the patient currently does not have exposure to a household contact.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has exposure to a household contact.","meaning":"Boolean indicating whether the patient currently has exposure to a household contact."} ;; "patient has exposure to household contact"

(declare-const patient_has_exposure_to_household_contact_now@@contact_age_value_recorded_now_in_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current household contact exposure is to a contact whose age in months is recorded now.","when_to_set_to_false":"Set to false if the patient's current household contact exposure is not to a contact whose age in months is recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the age in months of the household contact is recorded now.","meaning":"Boolean indicating whether the patient's current household contact exposure is to a contact whose age in months is recorded now."} ;; "exposure to household contact whose age in months is recorded now"

(declare-const patient_has_exposure_to_household_contact_now@@contact_has_known_immunodeficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current household contact exposure is to a contact who currently has a known immunodeficiency.","when_to_set_to_false":"Set to false if the patient's current household contact exposure is not to a contact who currently has a known immunodeficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the household contact currently has a known immunodeficiency.","meaning":"Boolean indicating whether the patient's current household contact exposure is to a contact who currently has a known immunodeficiency."} ;; "exposure to household contact who currently has a known immunodeficiency"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Qualifier variable for age implies exposure and age fact
(assert
(! (=> patient_has_exposure_to_household_contact_now@@contact_age_value_recorded_now_in_months
patient_has_exposure_to_household_contact_now)
:named REQ20_AUXILIARY0)) ;; "exposure to household contact whose age in months is recorded now"

;; Qualifier variable for immunodeficiency implies exposure and immunodeficiency fact
(assert
(! (=> patient_has_exposure_to_household_contact_now@@contact_has_known_immunodeficiency_now
patient_has_exposure_to_household_contact_now)
:named REQ20_AUXILIARY1)) ;; "exposure to household contact who currently has a known immunodeficiency"

;; Qualifier variable for age implies age fact
(assert
(! (=> patient_has_exposure_to_household_contact_now@@contact_age_value_recorded_now_in_months
(<= household_contact_age_value_recorded_now_in_months 15))
:named REQ20_AUXILIARY2)) ;; "household contact who is 15 months old or younger"

;; Qualifier variable for immunodeficiency implies immunodeficiency fact
(assert
(! (=> patient_has_exposure_to_household_contact_now@@contact_has_known_immunodeficiency_now
household_contact_has_known_immunodeficiency_now)
:named REQ20_AUXILIARY3)) ;; "household contact with known immunodeficiency"

;; ===================== Constraint Assertions (REQ 20) =====================
;; Exclusion: patient must NOT have exposure to household contact who is 15 months old or younger
(assert
(! (not patient_has_exposure_to_household_contact_now@@contact_age_value_recorded_now_in_months)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has exposure to household contact who is 15 months old or younger."

;; Exclusion: patient must NOT have exposure to household contact with known immunodeficiency
(assert
(! (not patient_has_exposure_to_household_contact_now@@contact_has_known_immunodeficiency_now)
:named REQ20_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has exposure to household contact with known immunodeficiency."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_allergy_to_measles_vaccine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to the measles vaccine.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to the measles vaccine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to the measles vaccine.","meaning":"Boolean indicating whether the patient currently has an allergy to the measles vaccine."} ;; "the patient has allergy to measles vaccine"
(declare-const patient_has_history_of_severe_reaction_to_measles_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of severe reaction to prior measles vaccination.","when_to_set_to_false":"Set to false if the patient does not have a documented history of severe reaction to prior measles vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of severe reaction to prior measles vaccination.","meaning":"Boolean indicating whether the patient has a history of severe reaction to prior measles vaccination."} ;; "the patient has history of severe reaction to prior measles vaccination"
(declare-const patient_has_undergone_measles_vaccination_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone measles vaccination at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone measles vaccination at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone measles vaccination.","meaning":"Boolean indicating whether the patient has ever undergone measles vaccination in the past."} ;; "measles vaccination"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not patient_has_allergy_to_measles_vaccine_now)
    :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to measles vaccine."

(assert
(! (not patient_has_history_of_severe_reaction_to_measles_vaccination)
    :named REQ21_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of severe reaction to prior measles vaccination."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_allergy_to_iodine_compound_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to iodine or iodine-containing compounds.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to iodine or iodine-containing compounds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to iodine or iodine-containing compounds.","meaning":"Boolean indicating whether the patient currently has an allergy to iodine or iodine-containing compounds."} ;; "allergy to iodine"
(declare-const patient_has_finding_of_allergy_to_contrast_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to intravenous contrast media.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to intravenous contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to intravenous contrast media.","meaning":"Boolean indicating whether the patient currently has an allergy to intravenous contrast media."} ;; "allergy is only to intravenous contrast material"
(declare-const patient_has_finding_of_allergy_to_iodine_compound_now@@excluding_allergy_to_intravenous_contrast_media_only Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current allergy to iodine or iodine-containing compounds is present, and the allergy is not limited only to intravenous contrast media.","when_to_set_to_false":"Set to false if the patient's current allergy to iodine or iodine-containing compounds is absent, or if the allergy is present but only to intravenous contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's allergy to iodine or iodine-containing compounds is present, or whether it is only to intravenous contrast media.","meaning":"Boolean indicating whether the patient currently has an allergy to iodine or iodine-containing compounds, excluding cases where the allergy is only to intravenous contrast media."} ;; "allergy to iodine, EXCEPT when the allergy is only to intravenous contrast material"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Definition: allergy to iodine, excluding cases where allergy is only to intravenous contrast media
(assert
(! (= patient_has_finding_of_allergy_to_iodine_compound_now@@excluding_allergy_to_intravenous_contrast_media_only
(and patient_has_finding_of_allergy_to_iodine_compound_now
(not (and patient_has_finding_of_allergy_to_contrast_media_now
         (not (or ; allergy to iodine is present ONLY as contrast media allergy
             (not patient_has_finding_of_allergy_to_iodine_compound_now)
             (not patient_has_finding_of_allergy_to_contrast_media_now))))))
)
:named REQ22_AUXILIARY0)) ;; "allergy to iodine, EXCEPT when the allergy is only to intravenous contrast material"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergy_to_iodine_compound_now@@excluding_allergy_to_intravenous_contrast_media_only
      patient_has_finding_of_allergy_to_iodine_compound_now)
:named REQ22_AUXILIARY1)) ;; "allergy to iodine, EXCEPT when the allergy is only to intravenous contrast material"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_finding_of_allergy_to_iodine_compound_now@@excluding_allergy_to_intravenous_contrast_media_only)
:named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to iodine, EXCEPT when the allergy is only to intravenous contrast material."
