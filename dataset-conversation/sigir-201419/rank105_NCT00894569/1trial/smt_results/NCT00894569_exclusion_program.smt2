;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_epidermal_growth_factor_urogastrone_receptor_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to epidermal growth factor urogastrone receptor (EGFR)-targeting therapy at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to epidermal growth factor urogastrone receptor (EGFR)-targeting therapy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to EGFR-targeting therapy.","meaning":"Boolean indicating whether the patient has ever been exposed to EGFR-targeting therapy at any time in their history."} ;; "previous exposure to epidermal growth factor receptor-targeting therapy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_exposed_to_epidermal_growth_factor_urogastrone_receptor_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous exposure to epidermal growth factor receptor-targeting therapy."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone chemotherapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone chemotherapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone chemotherapy.","meaning":"Boolean indicating whether the patient has ever undergone chemotherapy in their history."} ;; "previous chemotherapy"

(declare-const patient_has_undergone_chemotherapy_inthehistory@@only_adjuvant_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the only chemotherapy the patient has ever undergone in their history is adjuvant chemotherapy.","when_to_set_to_false":"Set to false if the patient has undergone chemotherapy other than adjuvant chemotherapy in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the only chemotherapy the patient has ever undergone in their history is adjuvant chemotherapy.","meaning":"Boolean indicating whether the only chemotherapy the patient has ever undergone in their history is adjuvant chemotherapy."} ;; "the only previous chemotherapy was adjuvant chemotherapy"

(declare-const patient_has_undergone_adjuvant_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone adjuvant chemotherapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone adjuvant chemotherapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone adjuvant chemotherapy.","meaning":"Boolean indicating whether the patient has ever undergone adjuvant chemotherapy in their history."} ;; "adjuvant chemotherapy"

(declare-const patient_has_finding_of_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding of disease progression at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented finding of disease progression at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a documented finding of disease progression.","meaning":"Boolean indicating whether the patient has ever had a documented finding of disease progression in their history."} ;; "progression of disease was documented"

(declare-const patient_has_finding_of_disease_inthehistory@@progression_documented_more_than_six_months_after_end_of_adjuvant_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has documented progression of disease and the documentation occurred more than six months after the end of adjuvant chemotherapy.","when_to_set_to_false":"Set to false if the patient has documented progression of disease but the documentation did not occur more than six months after the end of adjuvant chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the documentation of disease progression occurred more than six months after the end of adjuvant chemotherapy.","meaning":"Boolean indicating whether the patient's documented disease progression occurred more than six months after the end of adjuvant chemotherapy."} ;; "progression of disease was documented more than six months after the end of adjuvant chemotherapy"

(declare-const months_since_end_of_adjuvant_chemotherapy_to_documented_progression_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months between the end of adjuvant chemotherapy and the documentation of disease progression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months elapsed between the end of adjuvant chemotherapy and documentation of disease progression.","meaning":"Numeric value indicating the number of months between the end of adjuvant chemotherapy and documentation of disease progression."} ;; "more than six months after the end of adjuvant chemotherapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable for chemotherapy
(assert
(! (=> patient_has_undergone_chemotherapy_inthehistory@@only_adjuvant_chemotherapy
     patient_has_undergone_chemotherapy_inthehistory)
:named REQ1_AUXILIARY0)) ;; "the only previous chemotherapy was adjuvant chemotherapy"

;; Qualifier variable implies stem variable for disease progression
(assert
(! (=> patient_has_finding_of_disease_inthehistory@@progression_documented_more_than_six_months_after_end_of_adjuvant_chemotherapy
     patient_has_finding_of_disease_inthehistory)
:named REQ1_AUXILIARY1)) ;; "progression of disease was documented more than six months after the end of adjuvant chemotherapy"

;; Numeric definition for the qualifier variable (progression documented >6 months after adjuvant chemotherapy)
(assert
(! (= patient_has_finding_of_disease_inthehistory@@progression_documented_more_than_six_months_after_end_of_adjuvant_chemotherapy
      (and patient_has_finding_of_disease_inthehistory
           (> months_since_end_of_adjuvant_chemotherapy_to_documented_progression_value_recorded_in_months 6)))
:named REQ1_AUXILIARY2)) ;; "progression of disease was documented more than six months after the end of adjuvant chemotherapy"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: previous chemotherapy AND NOT (only adjuvant chemotherapy AND progression documented >6 months after end of adjuvant chemotherapy)
(assert
(! (not (and patient_has_undergone_chemotherapy_inthehistory
             (not (and patient_has_undergone_chemotherapy_inthehistory@@only_adjuvant_chemotherapy
                       patient_has_finding_of_disease_inthehistory@@progression_documented_more_than_six_months_after_end_of_adjuvant_chemotherapy))))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has previous chemotherapy) AND NOT ((the only previous chemotherapy was adjuvant chemotherapy AND progression of disease was documented more than six months after the end of adjuvant chemotherapy))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_received_radiotherapy_within_4_weeks_before_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received radiotherapy within the last 4 weeks before inclusion.","when_to_set_to_false":"Set to false if the patient has not received radiotherapy within the last 4 weeks before inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received radiotherapy within the last 4 weeks before inclusion.","meaning":"Boolean indicating whether the patient has received radiotherapy within the last 4 weeks before inclusion."} ;; "the patient has had radiotherapy within the last four weeks before inclusion"

(declare-const patient_has_undergone_major_abdominal_surgery_within_4_weeks_before_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone major abdominal surgery within the last 4 weeks before inclusion.","when_to_set_to_false":"Set to false if the patient has not undergone major abdominal surgery within the last 4 weeks before inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone major abdominal surgery within the last 4 weeks before inclusion.","meaning":"Boolean indicating whether the patient has undergone major abdominal surgery within the last 4 weeks before inclusion."} ;; "the patient has had major abdominal surgery within the last four weeks before inclusion"

(declare-const patient_has_undergone_major_thoracic_surgery_within_4_weeks_before_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone major thoracic surgery within the last 4 weeks before inclusion.","when_to_set_to_false":"Set to false if the patient has not undergone major thoracic surgery within the last 4 weeks before inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone major thoracic surgery within the last 4 weeks before inclusion.","meaning":"Boolean indicating whether the patient has undergone major thoracic surgery within the last 4 weeks before inclusion."} ;; "the patient has had major thoracic surgery within the last four weeks before inclusion"

(declare-const patient_has_undergone_surgical_procedure_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within the past 4 weeks.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within the past 4 weeks."} ;; "surgery"

(declare-const patient_has_undergone_surgical_procedure_inthepast4weeks@@temporalcontext_within4weeks_before_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure occurred within the past 4 weeks and specifically before the inclusion event.","when_to_set_to_false":"Set to false if the surgical procedure did not occur within the past 4 weeks before inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure occurred within the past 4 weeks before inclusion.","meaning":"Boolean indicating whether the surgical procedure occurred within the past 4 weeks before inclusion."} ;; "surgery within the last four weeks before inclusion"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_surgical_procedure_inthepast4weeks@@temporalcontext_within4weeks_before_inclusion
      patient_has_undergone_surgical_procedure_inthepast4weeks)
    :named REQ2_AUXILIARY0)) ;; "surgery within the last four weeks before inclusion"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_received_radiotherapy_within_4_weeks_before_inclusion)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has had radiotherapy within the last four weeks before inclusion"

(assert
(! (not patient_has_undergone_major_abdominal_surgery_within_4_weeks_before_inclusion)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has had major abdominal surgery within the last four weeks before inclusion"

(assert
(! (not patient_has_undergone_major_thoracic_surgery_within_4_weeks_before_inclusion)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has had major thoracic surgery within the last four weeks before inclusion"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_undergoing_immunological_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunological therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing immunological therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing immunological therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunological therapy."} ;; "the patient is receiving concurrent chronic systemic immunotherapy"
(declare-const patient_is_undergoing_immunological_therapy_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunological therapy and the therapy is chronic.","when_to_set_to_false":"Set to false if the patient is currently undergoing immunological therapy but the therapy is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunological therapy is chronic.","meaning":"Boolean indicating whether the patient is currently undergoing immunological therapy and the therapy is chronic."} ;; "chronic immunotherapy"
(declare-const patient_is_undergoing_immunological_therapy_now@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunological therapy and the therapy is systemic.","when_to_set_to_false":"Set to false if the patient is currently undergoing immunological therapy but the therapy is not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunological therapy is systemic.","meaning":"Boolean indicating whether the patient is currently undergoing immunological therapy and the therapy is systemic."} ;; "systemic immunotherapy"

(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy."} ;; "the patient is receiving concurrent chronic systemic chemotherapy"
(declare-const patient_is_undergoing_chemotherapy_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy and the therapy is chronic.","when_to_set_to_false":"Set to false if the patient is currently undergoing chemotherapy but the therapy is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy is chronic.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy and the therapy is chronic."} ;; "chronic chemotherapy"
(declare-const patient_is_undergoing_chemotherapy_now@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy and the therapy is systemic.","when_to_set_to_false":"Set to false if the patient is currently undergoing chemotherapy but the therapy is not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy is systemic.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy and the therapy is systemic."} ;; "systemic chemotherapy"

(declare-const patient_is_undergoing_hormone_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hormone therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing hormone therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing hormone therapy.","meaning":"Boolean indicating whether the patient is currently undergoing hormone therapy."} ;; "the patient is receiving concurrent chronic systemic hormone therapy"
(declare-const patient_is_undergoing_hormone_therapy_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hormone therapy and the therapy is chronic.","when_to_set_to_false":"Set to false if the patient is currently undergoing hormone therapy but the therapy is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hormone therapy is chronic.","meaning":"Boolean indicating whether the patient is currently undergoing hormone therapy and the therapy is chronic."} ;; "chronic hormone therapy"
(declare-const patient_is_undergoing_hormone_therapy_now@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hormone therapy and the therapy is systemic.","when_to_set_to_false":"Set to false if the patient is currently undergoing hormone therapy but the therapy is not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hormone therapy is systemic.","meaning":"Boolean indicating whether the patient is currently undergoing hormone therapy and the therapy is systemic."} ;; "systemic hormone therapy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_undergoing_immunological_therapy_now@@chronic
      patient_is_undergoing_immunological_therapy_now)
:named REQ3_AUXILIARY0)) ;; "chronic immunotherapy implies immunotherapy"

(assert
(! (=> patient_is_undergoing_immunological_therapy_now@@systemic
      patient_is_undergoing_immunological_therapy_now)
:named REQ3_AUXILIARY1)) ;; "systemic immunotherapy implies immunotherapy"

(assert
(! (=> patient_is_undergoing_chemotherapy_now@@chronic
      patient_is_undergoing_chemotherapy_now)
:named REQ3_AUXILIARY2)) ;; "chronic chemotherapy implies chemotherapy"

(assert
(! (=> patient_is_undergoing_chemotherapy_now@@systemic
      patient_is_undergoing_chemotherapy_now)
:named REQ3_AUXILIARY3)) ;; "systemic chemotherapy implies chemotherapy"

(assert
(! (=> patient_is_undergoing_hormone_therapy_now@@chronic
      patient_is_undergoing_hormone_therapy_now)
:named REQ3_AUXILIARY4)) ;; "chronic hormone therapy implies hormone therapy"

(assert
(! (=> patient_is_undergoing_hormone_therapy_now@@systemic
      patient_is_undergoing_hormone_therapy_now)
:named REQ3_AUXILIARY5)) ;; "systemic hormone therapy implies hormone therapy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_is_undergoing_immunological_therapy_now@@chronic
             patient_is_undergoing_immunological_therapy_now@@systemic))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving concurrent chronic systemic immunotherapy."

(assert
(! (not (and patient_is_undergoing_chemotherapy_now@@chronic
             patient_is_undergoing_chemotherapy_now@@systemic))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving concurrent chronic systemic chemotherapy."

(assert
(! (not (and patient_is_undergoing_hormone_therapy_now@@chronic
             patient_is_undergoing_hormone_therapy_now@@systemic))
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving concurrent chronic systemic hormone therapy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_received_investigational_agents_within_30_days_before_treatment_start_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received investigational agents within thirty days before treatment start in this study.","when_to_set_to_false":"Set to false if the patient has not received investigational agents within thirty days before treatment start in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received investigational agents within thirty days before treatment start in this study.","meaning":"Boolean indicating whether the patient has received investigational agents within thirty days before treatment start in this study."} ;; "the patient has received investigational agents within thirty days before treatment start in this study"

(declare-const patient_has_undergone_clinical_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever participated in a clinical trial at any time in the past.","when_to_set_to_false":"Set to false if the patient has never participated in a clinical trial at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever participated in a clinical trial.","meaning":"Boolean indicating whether the patient has ever participated in a clinical trial."} ;; "clinical trials"

(declare-const patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within30days_before_treatment_start_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's participation in a clinical trial occurred within thirty days before treatment start in this study.","when_to_set_to_false":"Set to false if the patient's participation in a clinical trial did not occur within thirty days before treatment start in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's participation in a clinical trial occurred within thirty days before treatment start in this study.","meaning":"Boolean indicating whether the patient's participation in a clinical trial occurred within thirty days before treatment start in this study."} ;; "the patient has participated in clinical trials within thirty days before treatment start in this study"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within30days_before_treatment_start_in_this_study
      patient_has_undergone_clinical_trial_inthehistory)
:named REQ4_AUXILIARY0)) ;; "clinical trial participation within thirty days before treatment start in this study""

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_received_investigational_agents_within_30_days_before_treatment_start_in_this_study
            patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within30days_before_treatment_start_in_this_study))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received investigational agents within thirty days before treatment start in this study) OR (the patient has participated in clinical trials within thirty days before treatment start in this study)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary arteriosclerosis (coronary artery disease).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary arteriosclerosis (coronary artery disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coronary arteriosclerosis (coronary artery disease).","meaning":"Boolean indicating whether the patient currently has coronary arteriosclerosis (coronary artery disease)."} ;; "coronary artery disease"

(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary arteriosclerosis (coronary artery disease) is clinically relevant.","when_to_set_to_false":"Set to false if the patient's coronary arteriosclerosis (coronary artery disease) is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary arteriosclerosis (coronary artery disease) is clinically relevant.","meaning":"Boolean indicating whether the patient's coronary arteriosclerosis (coronary artery disease) is clinically relevant."} ;; "clinically relevant coronary artery disease"

(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction in their history.","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction in their history.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction in their history."} ;; "myocardial infarction"

(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within_12_months_before_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction occurred within twelve months before study entry.","when_to_set_to_false":"Set to false if the patient's myocardial infarction did not occur within twelve months before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myocardial infarction occurred within twelve months before study entry.","meaning":"Boolean indicating whether the patient's myocardial infarction occurred within twelve months before study entry."} ;; "myocardial infarction within twelve months before study entry"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable for coronary artery disease
(assert
(! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@clinically_relevant
      patient_has_finding_of_coronary_arteriosclerosis_now)
:named REQ5_AUXILIARY0)) ;; "clinically relevant coronary artery disease"

;; Qualifier variable implies corresponding stem variable for myocardial infarction
(assert
(! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within_12_months_before_study_entry
      patient_has_finding_of_myocardial_infarction_inthehistory)
:named REQ5_AUXILIARY1)) ;; "myocardial infarction within twelve months before study entry"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have clinically relevant coronary artery disease
(assert
(! (not patient_has_finding_of_coronary_arteriosclerosis_now@@clinically_relevant)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically relevant coronary artery disease."

;; Exclusion: patient must NOT have had a myocardial infarction within twelve months before study entry
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within_12_months_before_study_entry)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a myocardial infarction within twelve months before study entry."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_possibility_of_curative_local_surgical_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the possibility of receiving a curative local surgical treatment.","when_to_set_to_false":"Set to false if the patient does not have the possibility of receiving a curative local surgical treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the possibility of receiving a curative local surgical treatment.","meaning":"Boolean indicating whether the patient has the possibility of receiving a curative local surgical treatment."} ;; "the patient has the possibility of a curative local surgical treatment"
(declare-const patient_has_possibility_of_curative_local_radiotherapy_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the possibility of receiving a curative local radiotherapy treatment.","when_to_set_to_false":"Set to false if the patient does not have the possibility of receiving a curative local radiotherapy treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the possibility of receiving a curative local radiotherapy treatment.","meaning":"Boolean indicating whether the patient has the possibility of receiving a curative local radiotherapy treatment."} ;; "the patient has the possibility of a curative local radiotherapy treatment"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_possibility_of_curative_local_surgical_treatment)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has the possibility of a curative local surgical treatment."

(assert
(! (not patient_has_possibility_of_curative_local_radiotherapy_treatment)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has the possibility of a curative local radiotherapy treatment."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as male or other at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is a woman"

(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_axillary_lymph_nodes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of secondary malignant neoplasm of axillary lymph nodes (axillary lymph node metastasis).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of secondary malignant neoplasm of axillary lymph nodes (axillary lymph node metastasis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of secondary malignant neoplasm of axillary lymph nodes (axillary lymph node metastasis).","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplasm of axillary lymph nodes (axillary lymph node metastasis)."} ;; "axillary lymph node metastasis"

(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_axillary_lymph_nodes_now@@is_predominant_tumor_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has secondary malignant neoplasm of axillary lymph nodes (axillary lymph node metastasis) and this is the predominant tumor site.","when_to_set_to_false":"Set to false if the patient currently has secondary malignant neoplasm of axillary lymph nodes (axillary lymph node metastasis) but this is not the predominant tumor site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the axillary lymph node metastasis is the predominant tumor site.","meaning":"Boolean indicating whether the patient's axillary lymph node metastasis is the predominant tumor site."} ;; "axillary lymph node metastasis as the predominant tumor site"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_axillary_lymph_nodes_now@@is_predominant_tumor_site
       patient_has_finding_of_secondary_malignant_neoplasm_of_axillary_lymph_nodes_now)
   :named REQ7_AUXILIARY0)) ;; "axillary lymph node metastasis as the predominant tumor site"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and patient_sex_is_female_now
             patient_has_finding_of_secondary_malignant_neoplasm_of_axillary_lymph_nodes_now@@is_predominant_tumor_site))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a woman) AND (the patient has axillary lymph node metastasis as the predominant tumor site)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now@@is_predominant_tumor_site Bool) ;; {"when_to_set_to_true":"Set to true if peritoneal carcinomatosis is the predominant tumor site for the patient.","when_to_set_to_false":"Set to false if peritoneal carcinomatosis is not the predominant tumor site for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether peritoneal carcinomatosis is the predominant tumor site.","meaning":"Boolean indicating whether peritoneal carcinomatosis is the predominant tumor site for the patient."} ;; "peritoneal carcinomatosis as the predominant tumor site"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now@@is_predominant_tumor_site
      patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now)
:named REQ8_AUXILIARY0)) ;; "peritoneal carcinomatosis as the predominant tumor site"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_sex_is_female_now
             patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now@@is_predominant_tumor_site))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a woman) AND (the patient has peritoneal carcinomatosis as the predominant tumor site)."
