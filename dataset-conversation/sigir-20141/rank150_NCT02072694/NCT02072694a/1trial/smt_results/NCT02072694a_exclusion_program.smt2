;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypertensive disorder (high blood pressure).","when_to_set_to_false":"Set to false if the patient currently does not have a hypertensive disorder (high blood pressure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypertensive disorder (high blood pressure).","meaning":"Boolean indicating whether the patient currently has a hypertensive disorder (high blood pressure)."} ;; "high blood pressure"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_finding_of_glucose_intolerance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has glucose intolerance.","when_to_set_to_false":"Set to false if the patient currently does not have glucose intolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has glucose intolerance.","meaning":"Boolean indicating whether the patient currently has glucose intolerance."} ;; "glucose intolerance"
(declare-const patient_has_finding_of_impaired_fasting_glycaemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impaired fasting glycaemia.","when_to_set_to_false":"Set to false if the patient currently does not have impaired fasting glycaemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired fasting glycaemia.","meaning":"Boolean indicating whether the patient currently has impaired fasting glycaemia."} ;; "impaired fasting glycemia"
(declare-const patient_has_finding_of_metabolic_syndrome_x_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has metabolic syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have metabolic syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metabolic syndrome.","meaning":"Boolean indicating whether the patient currently has metabolic syndrome."} ;; "metabolic syndrome"
(declare-const patient_has_finding_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypothyroidism.","meaning":"Boolean indicating whether the patient currently has hypothyroidism."} ;; "hypothyroidism"
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "kidney disease"
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "liver disease"
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "heart disease"
(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the nervous system (neurologic disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the nervous system (neurologic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the nervous system (neurologic disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the nervous system (neurologic disease)."} ;; "neurologic disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_hypertensive_disorder_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has high blood pressure."

(assert
(! (not patient_has_finding_of_diabetes_mellitus_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

(assert
(! (not patient_has_finding_of_glucose_intolerance_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has glucose intolerance."

(assert
(! (not patient_has_finding_of_impaired_fasting_glycaemia_now)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has impaired fasting glycemia."

(assert
(! (not patient_has_finding_of_metabolic_syndrome_x_now)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has metabolic syndrome."

(assert
(! (not patient_has_finding_of_hypothyroidism_now)
:named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypothyroidism."

(assert
(! (not patient_has_finding_of_kidney_disease_now)
:named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has kidney disease."

(assert
(! (not patient_has_finding_of_disease_of_liver_now)
:named REQ0_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver disease."

(assert
(! (not patient_has_finding_of_heart_disease_now)
:named REQ0_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart disease."

(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_now)
:named REQ0_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neurologic disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mental disorder (psychiatric disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mental disorder (psychiatric disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mental disorder (psychiatric disorder).","meaning":"Boolean indicating whether the patient currently has a diagnosis of mental disorder."} ;; "psychiatric disorder"
(declare-const patient_has_diagnosis_of_alcoholism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of alcoholism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of alcoholism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of alcoholism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of alcoholism."} ;; "alcoholism"
(declare-const patient_smokes_tobacco_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently smokes tobacco.","when_to_set_to_false":"Set to false if the patient currently does not smoke tobacco.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently smokes tobacco.","meaning":"Boolean indicating whether the patient currently smokes tobacco."} ;; "smokes tobacco"
(declare-const patient_abuses_illicit_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently abuses illicit drugs.","when_to_set_to_false":"Set to false if the patient currently does not abuse illicit drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently abuses illicit drugs.","meaning":"Boolean indicating whether the patient currently abuses illicit drugs."} ;; "abuses illicit drug"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_diagnosis_of_mental_disorder_now
            patient_has_diagnosis_of_alcoholism_now
            patient_smokes_tobacco_now
            patient_abuses_illicit_drug_now))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has psychiatric disorder) OR (the patient has alcoholism) OR (the patient smokes tobacco) OR (the patient abuses illicit drug))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_has_desire_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently expresses a desire to become pregnant.","when_to_set_to_false":"Set to false if the patient currently does not express a desire to become pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a desire to become pregnant.","meaning":"Boolean indicating whether the patient currently has a desire to become pregnant."} ;; "the patient has desire to be pregnant"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to become pregnant (has childbearing potential).","when_to_set_to_false":"Set to false if the patient is currently not able to become pregnant (no childbearing potential).","when_to_set_to_null":"Set to null if the patient's ability to become pregnant is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently able to become pregnant."} ;; "the patient is able to be pregnant"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_is_pregnant_now patient_has_desire_to_be_pregnant_now))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is pregnant) OR (the patient has desire to be pregnant))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or exposed to any drug or medicament (medication).","when_to_set_to_false":"Set to false if the patient is currently not using or exposed to any drug or medicament (medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using or exposed to any drug or medicament (medication).","meaning":"Boolean indicating whether the patient is currently using or exposed to any drug or medicament (medication)."} ;; "medication"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@not_contraceptive_medication Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is exposed to is NOT a contraceptive medication.","when_to_set_to_false":"Set to false if the drug or medicament the patient is exposed to IS a contraceptive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is a contraceptive medication.","meaning":"Boolean indicating whether the drug or medicament the patient is exposed to is NOT a contraceptive medication."} ;; "the medication is NOT a contraceptive medication"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@not_contraceptive_medication
     patient_is_exposed_to_drug_or_medicament_now)
:named REQ3_AUXILIARY0)) ;; "the medication is NOT a contraceptive medication""

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient uses medication AND the medication is NOT a contraceptive medication
(assert
(! (not (and patient_is_exposed_to_drug_or_medicament_now
             patient_is_exposed_to_drug_or_medicament_now@@not_contraceptive_medication))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient uses medication) AND (the medication is NOT a contraceptive medication))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_contraindication_for_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication for magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication for magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication for magnetic resonance imaging.","meaning":"Boolean indicating whether the patient currently has a contraindication for magnetic resonance imaging."} ;; "contraindication for magnetic resonance imaging"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_contraindication_for_magnetic_resonance_imaging_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindication for magnetic resonance imaging."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_in_treatment_for_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing treatment for obesity.","when_to_set_to_false":"Set to false if the patient is not currently undergoing treatment for obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing treatment for obesity.","meaning":"Boolean indicating whether the patient is currently undergoing treatment for obesity."} ;; "the patient is in treatment for obesity"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_in_treatment_for_obesity_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is in treatment for obesity."
