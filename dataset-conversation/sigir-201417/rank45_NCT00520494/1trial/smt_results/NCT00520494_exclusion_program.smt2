;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of disorder due to infection at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of disorder due to infection at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of disorder due to infection.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of disorder due to infection in their history."} ;; "infection"
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_inthehistory@@serious_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of disorder due to infection in their history and the infection is serious.","when_to_set_to_false":"Set to false if the patient has ever had a diagnosis of disorder due to infection in their history and the infection is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is serious.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of disorder due to infection in their history and the infection is serious."} ;; "serious infection"
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_inthehistory@@temporalcontext_between_screening_and_first_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of disorder due to infection in their history and the infection occurred between screening and first treatment.","when_to_set_to_false":"Set to false if the patient has ever had a diagnosis of disorder due to infection in their history and the infection did not occur between screening and first treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection occurred between screening and first treatment.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of disorder due to infection in their history and the infection occurred between screening and first treatment."} ;; "between screening and first treatment"
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_inthehistory@@serious_infection@@temporalcontext_between_screening_and_first_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of disorder due to infection in their history, the infection is serious, and the infection occurred between screening and first treatment.","when_to_set_to_false":"Set to false if the patient has ever had a diagnosis of disorder due to infection in their history, but either the infection is not serious or it did not occur between screening and first treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of disorder due to serious infection in their history and the infection occurred between screening and first treatment.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of disorder due to serious infection in their history and the infection occurred between screening and first treatment."} ;; "serious infection between screening and first treatment"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_inthehistory@@serious_infection
     patient_has_diagnosis_of_disorder_due_to_infection_inthehistory)
:named REQ0_AUXILIARY0)) ;; "serious infection"

(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_inthehistory@@temporalcontext_between_screening_and_first_treatment
     patient_has_diagnosis_of_disorder_due_to_infection_inthehistory)
:named REQ0_AUXILIARY1)) ;; "between screening and first treatment"

(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_inthehistory@@serious_infection@@temporalcontext_between_screening_and_first_treatment
     (and patient_has_diagnosis_of_disorder_due_to_infection_inthehistory@@serious_infection
          patient_has_diagnosis_of_disorder_due_to_infection_inthehistory@@temporalcontext_between_screening_and_first_treatment))
:named REQ0_AUXILIARY2)) ;; "serious infection between screening and first treatment"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_due_to_infection_inthehistory@@serious_infection@@temporalcontext_between_screening_and_first_treatment)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of a serious infection between screening and first treatment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of blood coagulation disorder (bleeding disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of blood coagulation disorder (bleeding disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of blood coagulation disorder (bleeding disorder).","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (bleeding disorder)."} ;; "bleeding disorder"
(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@requires_medical_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (bleeding disorder) and that disorder requires medical treatment.","when_to_set_to_false":"Set to false if the patient currently has a blood coagulation disorder (bleeding disorder) but that disorder does not require medical treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's blood coagulation disorder (bleeding disorder) requires medical treatment.","meaning":"Boolean indicating whether the patient's current blood coagulation disorder (bleeding disorder) requires medical treatment."} ;; "bleeding disorder that requires a medical treatment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_now@@requires_medical_treatment
      patient_has_finding_of_blood_coagulation_disorder_now)
:named REQ1_AUXILIARY0)) ;; "bleeding disorder that requires a medical treatment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now@@requires_medical_treatment)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a bleeding disorder that requires a medical treatment."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_secondary_immune_deficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary immune deficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary immune deficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary immune deficiency disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary immune deficiency disorder."} ;; "any medical disorder causing a secondary immune disorder"
(declare-const patient_has_diagnosis_of_autoimmune_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of autoimmune neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of autoimmune neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of autoimmune neutropenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of autoimmune neutropenia."} ;; "autoimmune neutropenia"
(declare-const patient_has_finding_of_cellular_immune_defect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a defect in cell mediated immunity.","when_to_set_to_false":"Set to false if the patient currently does not have a defect in cell mediated immunity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a defect in cell mediated immunity.","meaning":"Boolean indicating whether the patient currently has a defect in cell mediated immunity."} ;; "defect in cell mediated immunity"
(declare-const patient_has_finding_of_cellular_immune_defect_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's defect in cell mediated immunity is clinically significant.","when_to_set_to_false":"Set to false if the patient's defect in cell mediated immunity is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the defect in cell mediated immunity is clinically significant.","meaning":"Boolean indicating whether the patient's defect in cell mediated immunity is clinically significant."} ;; "clinically significant defect in cell mediated immunity"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cellular_immune_defect_now@@clinically_significant
      patient_has_finding_of_cellular_immune_defect_now)
:named REQ2_AUXILIARY0)) ;; "clinically significant defect in cell mediated immunity""

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_secondary_immune_deficiency_disorder_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "any medical disorder causing a secondary immune disorder"

(assert
(! (not patient_has_diagnosis_of_autoimmune_neutropenia_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "autoimmune neutropenia"

(assert
(! (not patient_has_finding_of_cellular_immune_defect_now@@clinically_significant)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "clinically significant defect in cell mediated immunity"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "condition"

(declare-const patient_has_finding_of_disease_condition_finding_now@@likely_to_interfere_with_evaluation_of_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding that is likely to interfere with evaluation of the study drug.","when_to_set_to_false":"Set to false if the patient currently has a disease, condition, or clinical finding that is not likely to interfere with evaluation of the study drug, or does not have any such finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disease, condition, or clinical finding is likely to interfere with evaluation of the study drug.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding is likely to interfere with evaluation of the study drug."} ;; "likely to interfere with evaluation of the study drug"

(declare-const patient_has_finding_of_disease_condition_finding_now@@likely_to_interfere_with_satisfactory_conduct_of_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding that is likely to interfere with satisfactory conduct of the trial.","when_to_set_to_false":"Set to false if the patient currently has a disease, condition, or clinical finding that is not likely to interfere with satisfactory conduct of the trial, or does not have any such finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disease, condition, or clinical finding is likely to interfere with satisfactory conduct of the trial.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding is likely to interfere with satisfactory conduct of the trial."} ;; "likely to interfere with satisfactory conduct of the trial"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@likely_to_interfere_with_evaluation_of_study_drug
      patient_has_finding_of_disease_condition_finding_now)
:named REQ3_AUXILIARY0)) ;; "condition likely to interfere with evaluation of the study drug"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@likely_to_interfere_with_satisfactory_conduct_of_trial
      patient_has_finding_of_disease_condition_finding_now)
:named REQ3_AUXILIARY1)) ;; "condition likely to interfere with satisfactory conduct of the trial"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@likely_to_interfere_with_evaluation_of_study_drug)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition likely to interfere with evaluation of the study drug."

(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@likely_to_interfere_with_satisfactory_conduct_of_trial)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition likely to interfere with satisfactory conduct of the trial."
