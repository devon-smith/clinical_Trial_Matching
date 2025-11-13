;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_received_investigational_therapy_within_1_month_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any investigational therapy at any time within 1 month prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not received any investigational therapy within 1 month prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any investigational therapy within 1 month prior to the screening visit.","meaning":"Boolean indicating whether the patient has received any investigational therapy within 1 month prior to screening."} ;; "previously treated with any investigational therapy within 1 month prior to screening"

(declare-const time_since_last_investigational_therapy_prior_to_screening_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months between the patient's most recent investigational therapy and the screening visit, if the patient has ever received investigational therapy prior to screening.","when_to_set_to_null":"Set to null if the patient has never received investigational therapy prior to screening, or if the timing is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months since the patient's last investigational therapy prior to screening."} ;; "number of months between the patient's most recent investigational therapy and the screening visit"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_received_investigational_therapy_within_1_month_prior_to_screening)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was previously treated with any investigational therapy within 1 month prior to screening."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant mesothelioma of the pleura.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant mesothelioma of the pleura.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant mesothelioma of the pleura.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant mesothelioma of the pleura."} ;; "malignant pleural mesothelioma"

(declare-const patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@sarcomatoid_histology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant mesothelioma of the pleura is of sarcomatoid histology.","when_to_set_to_false":"Set to false if the patient's malignant mesothelioma of the pleura is not of sarcomatoid histology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the histology is sarcomatoid.","meaning":"Boolean indicating whether the patient's malignant mesothelioma of the pleura is of sarcomatoid histology."} ;; "sarcomatoid malignant pleural mesothelioma histology"

(declare-const patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@does_not_express_mesothelin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant mesothelioma of the pleura does NOT express mesothelin.","when_to_set_to_false":"Set to false if the patient's malignant mesothelioma of the pleura does express mesothelin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumor expresses mesothelin.","meaning":"Boolean indicating whether the patient's malignant mesothelioma of the pleura does NOT express mesothelin."} ;; "does NOT express mesothelin"

(declare-const patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@sarcomatoid_histology@@does_not_express_mesothelin Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant mesothelioma of the pleura, the histology is sarcomatoid, and the tumor does NOT express mesothelin.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malignant mesothelioma of the pleura, the histology is sarcomatoid, and the tumor DOES express mesothelin, or if the patient does not have sarcomatoid histology, or if the patient does not have malignant mesothelioma of the pleura.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant mesothelioma of the pleura with sarcomatoid histology and the tumor does NOT express mesothelin.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant mesothelioma of the pleura, with sarcomatoid histology, and the tumor does NOT express mesothelin."} ;; "sarcomatoid malignant pleural mesothelioma histology which does NOT express mesothelin"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definitional: The triple-qualifier variable is true iff all three conditions are true
(assert
(! (= patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@sarcomatoid_histology@@does_not_express_mesothelin
     (and patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now
          patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@sarcomatoid_histology
          patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@does_not_express_mesothelin))
:named REQ1_AUXILIARY0)) ;; "sarcomatoid malignant pleural mesothelioma histology which does NOT express mesothelin"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@sarcomatoid_histology
       patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now)
:named REQ1_AUXILIARY1)) ;; "sarcomatoid histology" implies "malignant pleural mesothelioma"

(assert
(! (=> patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@does_not_express_mesothelin
       patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now)
:named REQ1_AUXILIARY2)) ;; "does NOT express mesothelin" implies "malignant pleural mesothelioma"

(assert
(! (=> patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@sarcomatoid_histology@@does_not_express_mesothelin
       patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@sarcomatoid_histology)
:named REQ1_AUXILIARY3)) ;; triple qualifier implies sarcomatoid histology

(assert
(! (=> patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@sarcomatoid_histology@@does_not_express_mesothelin
       patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@does_not_express_mesothelin)
:named REQ1_AUXILIARY4)) ;; triple qualifier implies does NOT express mesothelin

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_mesothelioma_of_pleura_now@@sarcomatoid_histology@@does_not_express_mesothelin)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sarcomatoid malignant pleural mesothelioma histology which does NOT express mesothelin."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a malignant neoplastic disease (invasive malignancy) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a malignant neoplastic disease (invasive malignancy) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a malignant neoplastic disease (invasive malignancy).","meaning":"Boolean indicating whether the patient has ever had a malignant neoplastic disease (invasive malignancy) in their history."} ;; "prior invasive malignancy"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@not_surgically_cured Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior malignant neoplastic disease (invasive malignancy) was NOT surgically cured.","when_to_set_to_false":"Set to false if the patient's prior malignant neoplastic disease (invasive malignancy) was surgically cured.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prior malignant neoplastic disease (invasive malignancy) was surgically cured.","meaning":"Boolean indicating whether the patient's prior malignant neoplastic disease (invasive malignancy) was NOT surgically cured."} ;; "prior invasive malignancy was NOT surgically cured"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@not_medically_cured_without_evidence_of_recurrent_disease_for_5_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior malignant neoplastic disease (invasive malignancy) was NOT medically cured without evidence of recurrent disease for 5 years.","when_to_set_to_false":"Set to false if the patient's prior malignant neoplastic disease (invasive malignancy) was medically cured and there is no evidence of recurrent disease for 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prior malignant neoplastic disease (invasive malignancy) was medically cured without evidence of recurrent disease for 5 years.","meaning":"Boolean indicating whether the patient's prior malignant neoplastic disease (invasive malignancy) was NOT medically cured without evidence of recurrent disease for 5 years."} ;; "prior invasive malignancy was NOT medically cured without evidence of recurrent disease for 5 years"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@is_non_melanoma_skin_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior malignant neoplastic disease (invasive malignancy) is non-melanoma skin cancer.","when_to_set_to_false":"Set to false if the patient's prior malignant neoplastic disease (invasive malignancy) is not non-melanoma skin cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prior malignant neoplastic disease (invasive malignancy) is non-melanoma skin cancer.","meaning":"Boolean indicating whether the patient's prior malignant neoplastic disease (invasive malignancy) is non-melanoma skin cancer."} ;; "prior invasive malignancy is non-melanoma skin cancer"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@is_prostate_cancer_with_psa_less_than_1_0 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior malignant neoplastic disease (invasive malignancy) is prostate cancer and the prostate-specific antigen level is less than 1.0.","when_to_set_to_false":"Set to false if the patient's prior malignant neoplastic disease (invasive malignancy) is not prostate cancer with PSA < 1.0.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prior malignant neoplastic disease (invasive malignancy) is prostate cancer with PSA < 1.0.","meaning":"Boolean indicating whether the patient's prior malignant neoplastic disease (invasive malignancy) is prostate cancer with PSA < 1.0."} ;; "prior invasive malignancy is prostate cancer with prostate-specific antigen level < 1.0"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@not_surgically_cured
      patient_has_finding_of_malignant_neoplastic_disease_inthehistory)
:named REQ2_AUXILIARY0)) ;; "prior invasive malignancy was NOT surgically cured"

(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@not_medically_cured_without_evidence_of_recurrent_disease_for_5_years
      patient_has_finding_of_malignant_neoplastic_disease_inthehistory)
:named REQ2_AUXILIARY1)) ;; "prior invasive malignancy was NOT medically cured without evidence of recurrent disease for 5 years"

(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@is_non_melanoma_skin_cancer
      patient_has_finding_of_malignant_neoplastic_disease_inthehistory)
:named REQ2_AUXILIARY2)) ;; "prior invasive malignancy is non-melanoma skin cancer"

(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@is_prostate_cancer_with_psa_less_than_1_0
      patient_has_finding_of_malignant_neoplastic_disease_inthehistory)
:named REQ2_AUXILIARY3)) ;; "prior invasive malignancy is prostate cancer with prostate-specific antigen level < 1.0"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT satisfy the exclusion condition
;; The exclusion condition is:
;; (patient has prior invasive malignancy)
;; AND (prior invasive malignancy was NOT surgically cured OR prior invasive malignancy was NOT medically cured without evidence of recurrent disease for 5 years)
;; EXCEPT if prior invasive malignancy is non-melanoma skin cancer OR prostate cancer with PSA < 1.0

(assert
(! (not
    (and
      patient_has_finding_of_malignant_neoplastic_disease_inthehistory
      (or patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@not_surgically_cured
          patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@not_medically_cured_without_evidence_of_recurrent_disease_for_5_years)
      (not
        (or patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@is_non_melanoma_skin_cancer
            patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@is_prostate_cancer_with_psa_less_than_1_0))
    ))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has prior invasive malignancy) AND (the prior invasive malignancy was NOT surgically cured OR the prior invasive malignancy was NOT medically cured without evidence of recurrent disease for 5 years) EXCEPT if the prior invasive malignancy is non-melanoma skin cancer OR prostate cancer with prostate-specific antigen level < 1.0."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant tumor of lymphoid, hemopoietic, and related tissue (hematologic malignancy) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant tumor of lymphoid, hemopoietic, and related tissue (hematologic malignancy) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant tumor of lymphoid, hemopoietic, and related tissue (hematologic malignancy).","meaning":"Boolean indicating whether the patient has ever been diagnosed with malignant tumor of lymphoid, hemopoietic, and related tissue (hematologic malignancy) at any time in the past."} ;; "hematologic malignancy"

(declare-const patient_has_undergone_bone_marrow_transplantation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone bone marrow transplantation at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone bone marrow transplantation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone bone marrow transplantation.","meaning":"Boolean indicating whether the patient has ever undergone bone marrow transplantation at any time in the past."} ;; "bone marrow transplantation"

(declare-const patient_has_undergone_immunological_therapy_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone immunological therapy (immune modifying therapy) within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone immunological therapy (immune modifying therapy) within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone immunological therapy (immune modifying therapy) within the past 4 weeks.","meaning":"Boolean indicating whether the patient has undergone immunological therapy (immune modifying therapy) within the past 4 weeks."} ;; "immune modifying therapy within the past 4 weeks"

(declare-const patient_has_undergone_immunological_therapy_inthepast4weeks@@limited_to_thyroid_replacement_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunological therapy (immune modifying therapy) within the past 4 weeks is limited to thyroid replacement therapy.","when_to_set_to_false":"Set to false if the patient's immunological therapy (immune modifying therapy) within the past 4 weeks is not limited to thyroid replacement therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's immunological therapy (immune modifying therapy) within the past 4 weeks is limited to thyroid replacement therapy.","meaning":"Boolean indicating whether the patient's immunological therapy (immune modifying therapy) within the past 4 weeks is limited to thyroid replacement therapy."} ;; "immune modifying therapy is limited to thyroid replacement therapy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_immunological_therapy_inthepast4weeks@@limited_to_thyroid_replacement_therapy
       patient_has_undergone_immunological_therapy_inthepast4weeks)
:named REQ3_AUXILIARY0)) ;; "immune modifying therapy is limited to thyroid replacement therapy"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion 1: prior hematologic malignancy with bone marrow transplantation
(assert
(! (not (and patient_has_diagnosis_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_inthehistory
             patient_has_undergone_bone_marrow_transplantation_inthehistory))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior hematologic malignancy with bone marrow transplantation."

;; Exclusion 2: prior hematologic malignancy with immune modifying therapy within the past 4 weeks, except if limited to thyroid replacement therapy
(assert
(! (not (and patient_has_diagnosis_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_inthehistory
             patient_has_undergone_immunological_therapy_inthepast4weeks
             (not patient_has_undergone_immunological_therapy_inthepast4weeks@@limited_to_thyroid_replacement_therapy)))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior hematologic malignancy with immune modifying therapy within the past 4 weeks, EXCEPT if the immune modifying therapy is limited to thyroid replacement therapy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_will_undergo_immunosuppressive_therapy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected or planned to undergo immunosuppressive therapy in the future (anticipated use).","when_to_set_to_false":"Set to false if the patient is not expected or planned to undergo immunosuppressive therapy in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected or planned to undergo immunosuppressive therapy in the future.","meaning":"Boolean indicating whether the patient is anticipated to undergo immunosuppressive therapy in the future."} ;; "anticipated use of immunosuppressive agent therapy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_undergone_immunological_therapy_inthepast4weeks
            patient_will_undergo_immunosuppressive_therapy_inthefuture))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient used immunosuppressive drug therapy within 4 weeks prior to study entry) OR (the patient has anticipated use of immunosuppressive agent therapy)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_pericardial_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pericardial effusion.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pericardial effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pericardial effusion.","meaning":"Boolean indicating whether the patient currently has pericardial effusion."} ;; "pericardial effusion"
(declare-const patient_has_finding_of_pericardial_effusion_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pericardial effusion is clinically significant.","when_to_set_to_false":"Set to false if the patient's pericardial effusion is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pericardial effusion is clinically significant.","meaning":"Boolean indicating whether the patient's pericardial effusion is clinically significant."} ;; "clinically-significant pericardial effusion"
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congestive heart failure is New York Heart Association Grade II.","when_to_set_to_false":"Set to false if the patient's congestive heart failure is not New York Heart Association Grade II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure is New York Heart Association Grade II.","meaning":"Boolean indicating whether the patient's congestive heart failure is New York Heart Association Grade II."} ;; "congestive heart failure (New York Heart Association Grade II)"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congestive heart failure is New York Heart Association Grade III.","when_to_set_to_false":"Set to false if the patient's congestive heart failure is not New York Heart Association Grade III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure is New York Heart Association Grade III.","meaning":"Boolean indicating whether the patient's congestive heart failure is New York Heart Association Grade III."} ;; "congestive heart failure (New York Heart Association Grade III)"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congestive heart failure is New York Heart Association Grade IV.","when_to_set_to_false":"Set to false if the patient's congestive heart failure is not New York Heart Association Grade IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure is New York Heart Association Grade IV.","meaning":"Boolean indicating whether the patient's congestive heart failure is New York Heart Association Grade IV."} ;; "congestive heart failure (New York Heart Association Grade IV)"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of a disorder of the cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of a disorder of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a disorder of the cardiovascular system."} ;; "cardiovascular condition"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_pericardial_effusion_now@@clinically_significant
      patient_has_finding_of_pericardial_effusion_now)
    :named REQ5_AUXILIARY0)) ;; "clinically-significant pericardial effusion"

(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_ii
      patient_has_finding_of_congestive_heart_failure_now)
    :named REQ5_AUXILIARY1)) ;; "congestive heart failure (New York Heart Association Grade II)"

(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_iii
      patient_has_finding_of_congestive_heart_failure_now)
    :named REQ5_AUXILIARY2)) ;; "congestive heart failure (New York Heart Association Grade III)"

(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_iv
      patient_has_finding_of_congestive_heart_failure_now)
    :named REQ5_AUXILIARY3)) ;; "congestive heart failure (New York Heart Association Grade IV)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_pericardial_effusion_now@@clinically_significant)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically-significant pericardial effusion."

(assert
(! (not patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_ii)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure (New York Heart Association Grade II)."

(assert
(! (not patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_iii)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure (New York Heart Association Grade III)."

(assert
(! (not patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_iv)
    :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure (New York Heart Association Grade IV)."

(assert
(! (not patient_has_finding_of_disorder_of_cardiovascular_system_now)
    :named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiovascular condition."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_pleural_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pleural effusion.","when_to_set_to_false":"Set to false if the patient currently does not have pleural effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleural effusion.","meaning":"Boolean indicating whether the patient currently has pleural effusion."} ;; "pleural effusion"
(declare-const patient_has_finding_of_pleural_effusion_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pleural effusion and the pleural effusion is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has pleural effusion but it is not clinically significant, or if the patient does not have pleural effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pleural effusion is clinically significant.","meaning":"Boolean indicating whether the patient's pleural effusion is clinically significant."} ;; "clinically-significant pleural effusion"
(declare-const patient_has_finding_of_ascites_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ascites.","when_to_set_to_false":"Set to false if the patient currently does not have ascites.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ascites.","meaning":"Boolean indicating whether the patient currently has ascites."} ;; "ascites"
(declare-const patient_has_finding_of_ascites_now@@cannot_be_drained_by_standard_or_pre_enrollment_dwelling_device Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ascites and the ascites cannot be drained with standard approaches or with pre-enrollment in dwelling drainage device placement.","when_to_set_to_false":"Set to false if the patient currently has ascites and the ascites can be drained with standard approaches or with pre-enrollment in dwelling drainage device placement, or if the patient does not have ascites.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ascites can be drained with standard approaches or pre-enrollment dwelling drainage device placement.","meaning":"Boolean indicating whether the patient's ascites cannot be drained by standard approaches or pre-enrollment dwelling drainage device placement."} ;; "ascites that cannot be drained with standard approaches OR with pre-enrollment in dwelling drainage device placement"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable for pleural effusion
(assert
(! (=> patient_has_finding_of_pleural_effusion_now@@clinically_significant
      patient_has_finding_of_pleural_effusion_now)
    :named REQ6_AUXILIARY0)) ;; "clinically-significant pleural effusion"

;; Qualifier variable implies corresponding stem variable for ascites
(assert
(! (=> patient_has_finding_of_ascites_now@@cannot_be_drained_by_standard_or_pre_enrollment_dwelling_device
      patient_has_finding_of_ascites_now)
    :named REQ6_AUXILIARY1)) ;; "ascites that cannot be drained with standard approaches OR with pre-enrollment in dwelling drainage device placement"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have any clinically-significant pleural effusion
(assert
(! (not patient_has_finding_of_pleural_effusion_now@@clinically_significant)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically-significant pleural effusion."

;; Exclusion: patient must NOT have ascites that cannot be drained with standard approaches OR with pre-enrollment in dwelling drainage device placement
(assert
(! (not patient_has_finding_of_ascites_now@@cannot_be_drained_by_standard_or_pre_enrollment_dwelling_device)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ascites that cannot be drained with standard approaches OR with pre-enrollment in dwelling drainage device placement."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_forced_vital_capacity_value_recorded_now_withunit_percent_predicted Real) ;; {"when_to_set_to_value":"Set to the measured percent predicted value if a current forced vital capacity measurement is available.","when_to_set_to_null":"Set to null if no current forced vital capacity measurement is available or the value is indeterminate.","meaning":"Numeric percent predicted value of the patient's current forced vital capacity."} ;; "forced vital capacity < 50 percent predicted"
(declare-const patient_carbon_monoxide_diffusing_capacity_measurement_value_recorded_now_withunit_percent_predicted Real) ;; {"when_to_set_to_value":"Set to the measured percent predicted value if a current diffusing capacity of the lung for carbon monoxide measurement is available.","when_to_set_to_null":"Set to null if no current diffusing capacity of the lung for carbon monoxide measurement is available or the value is indeterminate.","meaning":"Numeric percent predicted value of the patient's current diffusing capacity of the lung for carbon monoxide."} ;; "diffusing capacity of the lung for carbon monoxide < 40 percent predicted"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (< patient_forced_vital_capacity_value_recorded_now_withunit_percent_predicted 50))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has forced vital capacity < 50 percent predicted."

(assert
(! (not (< patient_carbon_monoxide_diffusing_capacity_measurement_value_recorded_now_withunit_percent_predicted 40))
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diffusing capacity of the lung for carbon monoxide < 40 percent predicted."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the lung.","meaning":"Boolean indicating whether the patient currently has a disorder of the lung."} ;; "lung disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@underlying Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the lung is underlying.","when_to_set_to_false":"Set to false if the patient's current disorder of the lung is not underlying.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the lung is underlying.","meaning":"Boolean indicating whether the patient's current disorder of the lung is underlying."} ;; "underlying lung disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@requires_supplemental_oxygen_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the lung requires supplemental oxygen therapy.","when_to_set_to_false":"Set to false if the patient's current disorder of the lung does not require supplemental oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the lung requires supplemental oxygen therapy.","meaning":"Boolean indicating whether the patient's current disorder of the lung requires supplemental oxygen therapy."} ;; "lung disease requiring supplemental oxygen therapy"
(declare-const patient_has_finding_of_disorder_of_lung_now@@underlying@@requires_supplemental_oxygen_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an underlying disorder of the lung and that disorder requires supplemental oxygen therapy.","when_to_set_to_false":"Set to false if the patient currently does not have an underlying disorder of the lung that requires supplemental oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an underlying disorder of the lung that requires supplemental oxygen therapy.","meaning":"Boolean indicating whether the patient currently has an underlying disorder of the lung that requires supplemental oxygen therapy."} ;; "underlying lung disease requiring supplemental oxygen therapy"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@underlying
      patient_has_finding_of_disorder_of_lung_now)
:named REQ8_AUXILIARY0)) ;; "underlying lung disease"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@requires_supplemental_oxygen_therapy
      patient_has_finding_of_disorder_of_lung_now)
:named REQ8_AUXILIARY1)) ;; "lung disease requiring supplemental oxygen therapy"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@underlying@@requires_supplemental_oxygen_therapy
      (and patient_has_finding_of_disorder_of_lung_now@@underlying
           patient_has_finding_of_disorder_of_lung_now@@requires_supplemental_oxygen_therapy))
:named REQ8_AUXILIARY2)) ;; "underlying lung disease requiring supplemental oxygen therapy"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_disorder_of_lung_now@@underlying@@requires_supplemental_oxygen_therapy)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has underlying lung disease requiring supplemental oxygen therapy."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} ;; "immunodeficiency disease"

(declare-const patient_has_finding_of_immunodeficiency_disorder_now@@recognized Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder and it is recognized.","when_to_set_to_false":"Set to false if the patient currently has an immunodeficiency disorder but it is not recognized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunodeficiency disorder is recognized.","meaning":"Boolean indicating whether the patient's immunodeficiency disorder is recognized."} ;; "recognized immunodeficiency disease"

(declare-const patient_has_finding_of_immunodeficiency_disorder_now@@acquired Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acquired immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently has an immunodeficiency disorder but it is not acquired.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunodeficiency disorder is acquired.","meaning":"Boolean indicating whether the patient's immunodeficiency disorder is acquired."} ;; "acquired immunodeficiency disease"

(declare-const patient_has_finding_of_immunodeficiency_disorder_now@@hereditary Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hereditary immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently has an immunodeficiency disorder but it is not hereditary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunodeficiency disorder is hereditary.","meaning":"Boolean indicating whether the patient's immunodeficiency disorder is hereditary."} ;; "hereditary immunodeficiency disease"

(declare-const patient_has_finding_of_congenital_immunodeficiency_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a congenital immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a congenital immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a congenital immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has a congenital immunodeficiency disorder."} ;; "congenital immunodeficiency disease"

(declare-const patient_has_finding_of_cellular_immunodeficiency_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cellular immunodeficiency disease.","when_to_set_to_false":"Set to false if the patient currently does not have cellular immunodeficiency disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cellular immunodeficiency disease.","meaning":"Boolean indicating whether the patient currently has cellular immunodeficiency disease."} ;; "cellular immunodeficiency disease"

(declare-const patient_has_finding_of_hypogammaglobulinemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypogammaglobulinemia.","when_to_set_to_false":"Set to false if the patient currently does not have hypogammaglobulinemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypogammaglobulinemia.","meaning":"Boolean indicating whether the patient currently has hypogammaglobulinemia."} ;; "hypogammaglobulinemia"

(declare-const patient_has_finding_of_dysgammaglobulinemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dysgammaglobulinemia.","when_to_set_to_false":"Set to false if the patient currently does not have dysgammaglobulinemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dysgammaglobulinemia.","meaning":"Boolean indicating whether the patient currently has dysgammaglobulinemia."} ;; "dysgammaglobulinemia"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply recognized immunodeficiency disease
(assert
(! (=> (or patient_has_finding_of_cellular_immunodeficiency_disease_now
          patient_has_finding_of_hypogammaglobulinemia_now
          patient_has_finding_of_dysgammaglobulinemia_now)
    patient_has_finding_of_immunodeficiency_disorder_now@@recognized)
:named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (cellular immunodeficiency disease, hypogammaglobulinemia, dysgammaglobulinemia)"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_immunodeficiency_disorder_now@@recognized
    patient_has_finding_of_immunodeficiency_disorder_now)
:named REQ9_AUXILIARY1)) ;; "recognized immunodeficiency disease"

(assert
(! (=> patient_has_finding_of_immunodeficiency_disorder_now@@acquired
    patient_has_finding_of_immunodeficiency_disorder_now)
:named REQ9_AUXILIARY2)) ;; "acquired immunodeficiency disease"

(assert
(! (=> patient_has_finding_of_immunodeficiency_disorder_now@@hereditary
    patient_has_finding_of_immunodeficiency_disorder_now)
:named REQ9_AUXILIARY3)) ;; "hereditary immunodeficiency disease"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have recognized immunodeficiency disease
(assert
(! (not patient_has_finding_of_immunodeficiency_disorder_now@@recognized)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "recognized immunodeficiency disease with non-exhaustive examples (cellular immunodeficiency disease, hypogammaglobulinemia, dysgammaglobulinemia)"

;; Exclusion: patient must NOT have acquired immunodeficiency disease
(assert
(! (not patient_has_finding_of_immunodeficiency_disorder_now@@acquired)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "acquired immunodeficiency disease"

;; Exclusion: patient must NOT have hereditary immunodeficiency disease
(assert
(! (not patient_has_finding_of_immunodeficiency_disorder_now@@hereditary)
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "hereditary immunodeficiency disease"

;; Exclusion: patient must NOT have congenital immunodeficiency disease
(assert
(! (not patient_has_finding_of_congenital_immunodeficiency_disease_now)
:named REQ9_COMPONENT3_OTHER_REQUIREMENTS)) ;; "congenital immunodeficiency disease"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "viral infection with human immunodeficiency virus"
(declare-const patient_has_diagnosis_of_viral_hepatitis_c_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hepatitis C viral infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hepatitis C viral infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hepatitis C viral infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hepatitis C viral infection."} ;; "viral infection with hepatitis C virus"
(declare-const patient_has_diagnosis_of_type_b_viral_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hepatitis B viral infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hepatitis B viral infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hepatitis B viral infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hepatitis B viral infection."} ;; "viral infection with hepatitis B virus"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has viral infection with human immunodeficiency virus."

(assert
(! (not patient_has_diagnosis_of_viral_hepatitis_c_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has viral infection with hepatitis C virus."

(assert
(! (not patient_has_diagnosis_of_type_b_viral_hepatitis_now)
:named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has viral infection with hepatitis B virus."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_genetic_transfection_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of genetic transfection in target lymphocytes is recorded during screening.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's genetic transfection in target lymphocytes measured during screening."} ;; "transfection of target lymphocytes < 30 % during screening"

(declare-const patient_genetically_modified_t_cell_value_recorded_now_withunit_fold Real) ;; {"when_to_set_to_value":"Set to the measured fold expansion value if a numeric measurement of expansion in genetically modified T cells in response to CD3/CD28 costimulation is recorded during screening.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's fold expansion of genetically modified T cells in response to CD3/CD28 costimulation measured during screening."} ;; "expansion in modified chimeric immune receptor T cells in response to CD3/CD28 costimulation < 5-fold during screening"

(declare-const patient_genetically_modified_t_cell_value_recorded_now_withunit_fold@@in_response_to_cd3_cd28_costimulation Bool) ;; {"when_to_set_to_true":"Set to true if the measured fold expansion of genetically modified T cells is specifically in response to CD3/CD28 costimulation.","when_to_set_to_false":"Set to false if the measured fold expansion is not in response to CD3/CD28 costimulation.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement is in response to CD3/CD28 costimulation.","meaning":"Boolean indicating whether the measured fold expansion of genetically modified T cells is in response to CD3/CD28 costimulation."} ;; "expansion in modified chimeric immune receptor T cells in response to CD3/CD28 costimulation"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_genetically_modified_t_cell_value_recorded_now_withunit_fold@@in_response_to_cd3_cd28_costimulation
     true)
:named REQ12_AUXILIARY0)) ;; "expansion in modified chimeric immune receptor T cells in response to CD3/CD28 costimulation"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: patient must NOT have transfection of target lymphocytes < 30% OR expansion in modified chimeric immune receptor T cells in response to CD3/CD28 costimulation < 5-fold
(assert
(! (not (or
         (< patient_genetic_transfection_value_recorded_now_withunit_percent 30) ;; "transfection of target lymphocytes < 30 %"
         (and patient_genetically_modified_t_cell_value_recorded_now_withunit_fold@@in_response_to_cd3_cd28_costimulation
              (< patient_genetically_modified_t_cell_value_recorded_now_withunit_fold 5)) ;; "expansion in modified chimeric immune receptor T cells in response to CD3/CD28 costimulation < 5-fold"
     ))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the feasibility assessment during screening demonstrates transfection of target lymphocytes < 30 %) OR (the feasibility assessment during screening demonstrates expansion in modified chimeric immune receptor T cells in response to CD3/CD28 costimulation < 5-fold)."
