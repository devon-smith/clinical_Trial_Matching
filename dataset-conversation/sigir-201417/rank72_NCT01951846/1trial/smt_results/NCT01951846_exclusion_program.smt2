;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within_4_weeks_before_treatment_with_trial_drug Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure occurred within the last four weeks before the patient started treatment with the trial drug.","when_to_set_to_false":"Set to false if the surgical procedure did not occur within the last four weeks before treatment with the trial drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure occurred within the last four weeks before treatment with the trial drug.","meaning":"Boolean indicating whether the surgical procedure occurred within the last four weeks prior to treatment with the trial drug."} ;; "history of relevant surgical procedure during the last four weeks prior to treatment with the trial drug"

(declare-const patient_has_finding_of_ulcer_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an ulcer and the ulcer is active.","when_to_set_to_false":"Set to false if the patient currently has an ulcer but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ulcer is active.","meaning":"Boolean indicating whether the patient's current ulcer is active."} ;; "active ulcer"

(declare-const patient_has_finding_of_injury_now@@with_incomplete_wound_healing Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an injury and the injury is associated with incomplete wound healing.","when_to_set_to_false":"Set to false if the patient currently has an injury but it is not associated with incomplete wound healing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the injury is associated with incomplete wound healing.","meaning":"Boolean indicating whether the patient's current injury is associated with incomplete wound healing."} ;; "injury with incomplete wound healing"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within_4_weeks_before_treatment_with_trial_drug)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "history of relevant surgical procedure during the last four weeks prior to treatment with the trial drug"

(assert
(! (not patient_has_finding_of_ulcer_now@@active)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "active ulcer"

(assert
(! (not patient_has_finding_of_injury_now@@with_incomplete_wound_healing)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "injury with incomplete wound healing"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of infectious disease (disorder due to infection).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of infectious disease (disorder due to infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of infectious disease (disorder due to infection).","meaning":"Boolean indicating whether the patient currently has a diagnosis of infectious disease (disorder due to infection)."} ;; "infectious disease"
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of infectious disease (disorder due to infection) and the disease is active.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of infectious disease (disorder due to infection) but the disease is not active (e.g., resolved, latent, or inactive).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infectious disease is active.","meaning":"Boolean indicating whether the patient's current infectious disease diagnosis is active."} ;; "active infectious disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_now@@active
       patient_has_diagnosis_of_disorder_due_to_infection_now)
   :named REQ2_AUXILIARY0)) ;; "active infectious disease" implies "infectious disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_due_to_infection_now@@active)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active infectious disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary malignant neoplasm of brain (brain metastasis).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary malignant neoplasm of brain (brain metastasis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary malignant neoplasm of brain (brain metastasis).","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary malignant neoplasm of brain (brain metastasis)."} ;; "brain metastasis"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now@@requires_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of secondary malignant neoplasm of brain (brain metastasis) requires therapy.","when_to_set_to_false":"Set to false if the patient's current diagnosis of secondary malignant neoplasm of brain (brain metastasis) does not require therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether therapy is required for the patient's current diagnosis of secondary malignant neoplasm of brain (brain metastasis).","meaning":"Boolean indicating whether the patient's current diagnosis of secondary malignant neoplasm of brain (brain metastasis) requires therapy."} ;; "brain metastasis requiring therapy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now@@requires_therapy
      patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now)
   :named REQ3_AUXILIARY0)) ;; "brain metastasis requiring therapy" implies "brain metastasis"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now@@requires_therapy)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has brain metastasis requiring therapy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const absolute_neutrophil_count_value_recorded_now_withunit_per_mm3 Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's absolute neutrophil count measured at the current time, in units of per mm³.","when_to_set_to_null":"Set to null if the patient's absolute neutrophil count at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's absolute neutrophil count measured at the current time, with units of per mm³."} ;; "absolute neutrophil count < 1500 per mm³"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (< absolute_neutrophil_count_value_recorded_now_withunit_per_mm3 1500))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has absolute neutrophil count < 1500 per mm³."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_mm3 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count per mm³ is recorded now.","when_to_set_to_null":"Set to null if no current platelet count measurement per mm³ is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count per mm³ measured now."} ;; "platelet count < 100,000 per mm³."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (< patient_platelet_count_finding_value_recorded_now_withunit_per_mm3 100000))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has platelet count < 100,000 per mm³."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_bilirubin_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's bilirubin concentration in mg/dl is recorded now.","when_to_set_to_null":"Set to null if no bilirubin concentration measurement in mg/dl is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current bilirubin concentration in mg/dl."} ;; "bilirubin concentration > 1.5 mg/dl"
(declare-const patient_bilirubin_level_finding_value_recorded_now_withunit_umol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's bilirubin concentration in μmol/L is recorded now.","when_to_set_to_null":"Set to null if no bilirubin concentration measurement in μmol/L is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current bilirubin concentration in μmol/L."} ;; "bilirubin concentration > 26 μmol/L"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or
         (> patient_bilirubin_level_finding_value_recorded_now_withunit_mg_per_dl 1.5)
         (> patient_bilirubin_level_finding_value_recorded_now_withunit_umol_per_l 26)
      ))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bilirubin concentration > 1.5 mg/dl (> 26 μmol/L)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current alanine aminotransferase (ALT) concentration is available now.","when_to_set_to_null":"Set to null if no current ALT measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase (ALT) concentration."} ;; "alanine aminotransferase concentration"
(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current aspartate aminotransferase (AST) concentration is available now.","when_to_set_to_null":"Set to null if no current AST measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate aminotransferase (AST) concentration."} ;; "aspartate aminotransferase concentration"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary malignant neoplasm of the liver (liver metastasis).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary malignant neoplasm of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary malignant neoplasm of the liver.","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary malignant neoplasm of the liver (liver metastasis)."} ;; "liver metastasis"
(declare-const upper_limit_of_normal_for_alanine_aminotransferase_value_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value if the current upper limit of normal for alanine aminotransferase (ALT) concentration is available now.","when_to_set_to_null":"Set to null if no current reference value is available or the value is indeterminate.","meaning":"Numeric value representing the current upper limit of normal for alanine aminotransferase (ALT) concentration."} ;; "upper limit of normal for alanine aminotransferase"
(declare-const upper_limit_of_normal_for_aspartate_aminotransferase_value_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value if the current upper limit of normal for aspartate aminotransferase (AST) concentration is available now.","when_to_set_to_null":"Set to null if no current reference value is available or the value is indeterminate.","meaning":"Numeric value representing the current upper limit of normal for aspartate aminotransferase (AST) concentration."} ;; "upper limit of normal for aspartate aminotransferase"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion if AST > 3 × ULN
(assert
(! (not (> patient_aspartate_transaminase_level_value_recorded_now_withunit_unit
           (* 3 upper_limit_of_normal_for_aspartate_aminotransferase_value_now_withunit_unit)))
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has aspartate aminotransferase concentration > 3 × upper limit of normal."

;; Exclusion if ALT > 3 × ULN
(assert
(! (not (> patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
           (* 3 upper_limit_of_normal_for_alanine_aminotransferase_value_now_withunit_unit)))
    :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alanine aminotransferase concentration > 3 × upper limit of normal."

;; Exclusion if (liver metastasis) AND (AST > 5 × ULN OR ALT > 5 × ULN)
(assert
(! (not (and patient_has_diagnosis_of_secondary_malignant_neoplasm_of_liver_now
             (or (> patient_aspartate_transaminase_level_value_recorded_now_withunit_unit
                   (* 5 upper_limit_of_normal_for_aspartate_aminotransferase_value_now_withunit_unit))
                 (> patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
                   (* 5 upper_limit_of_normal_for_alanine_aminotransferase_value_now_withunit_unit)))))
    :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (related to liver metastasis) AND (the patient has aspartate aminotransferase concentration > 5 × upper limit of normal OR the patient has alanine aminotransferase concentration > 5 × upper limit of normal)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine concentration in mg/dl is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine concentration in mg/dl."} ;; "serum creatinine concentration > 1.5 mg/dl"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_umol_l Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine concentration in μmol/L is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine concentration in μmol/L."} ;; "serum creatinine concentration > 132 μmol/L"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or
         (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_dl 1.5)
         (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_umol_l 132)
      ))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum creatinine concentration > 1.5 mg/dl (> 132 μmol/L)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypertensive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a hypertensive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypertensive disorder.","meaning":"Boolean indicating whether the patient currently has a hypertensive disorder."} ;; "hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypertensive disorder is severe.","when_to_set_to_false":"Set to false if the patient's current hypertensive disorder is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypertensive disorder is severe.","meaning":"Boolean indicating whether the patient's current hypertensive disorder is severe."} ;; "severe hypertension"
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor hypertension control (uncontrolled hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have poor hypertension control (uncontrolled hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor hypertension control (uncontrolled hypertension).","meaning":"Boolean indicating whether the patient currently has poor hypertension control (uncontrolled hypertension)."} ;; "uncontrolled hypertension"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypertensive_disorder_now@@severe
       patient_has_finding_of_hypertensive_disorder_now)
   :named REQ9_AUXILIARY0)) ;; "severe hypertension"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have uncontrolled hypertension or severe hypertension
(assert
(! (not (or patient_has_finding_of_poor_hypertension_control_now
            patient_has_finding_of_hypertensive_disorder_now@@severe))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has uncontrolled hypertension) OR (the patient has severe hypertension))."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of the gastrointestinal tract."} ;; "gastrointestinal disorder"
(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@anticipated_to_interfere_with_resorption_of_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current gastrointestinal disorder is anticipated to interfere with the resorption of the study drug.","when_to_set_to_false":"Set to false if the patient's current gastrointestinal disorder is not anticipated to interfere with the resorption of the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current gastrointestinal disorder is anticipated to interfere with the resorption of the study drug.","meaning":"Boolean indicating whether the patient's current gastrointestinal disorder is anticipated to interfere with the resorption of the study drug."} ;; "gastrointestinal disorder anticipated to interfere with the resorption of the study drug"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@anticipated_to_interfere_with_resorption_of_study_drug
      patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now)
:named REQ10_AUXILIARY0)) ;; "gastrointestinal disorder anticipated to interfere with the resorption of the study drug"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@anticipated_to_interfere_with_resorption_of_study_drug)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has gastrointestinal disorder anticipated to interfere with the resorption of the study drug."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness.","when_to_set_to_false":"Set to false if the patient currently does not have any illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any illness.","meaning":"Boolean indicating whether the patient currently has illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has illness and the illness is serious.","when_to_set_to_false":"Set to false if the patient currently has illness but the illness is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the illness is serious.","meaning":"Boolean indicating whether the patient's current illness is serious."} ;; "serious illness"
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease and the disease is concomitant.","when_to_set_to_false":"Set to false if the patient currently has disease but the disease is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is concomitant.","meaning":"Boolean indicating whether the patient's current disease is concomitant."} ;; "concomitant disease"
(declare-const patient_has_finding_of_disease_now@@non_oncological Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease and the disease is non-oncological.","when_to_set_to_false":"Set to false if the patient currently has disease but the disease is oncological.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is non-oncological.","meaning":"Boolean indicating whether the patient's current disease is non-oncological."} ;; "non-oncological disease"
(declare-const patient_has_finding_of_disease_now@@considered_incompatible_with_protocol_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease and the disease is considered by the investigator to be incompatible with the protocol.","when_to_set_to_false":"Set to false if the patient currently has disease but the disease is not considered by the investigator to be incompatible with the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is considered incompatible with the protocol by the investigator.","meaning":"Boolean indicating whether the patient's current disease is considered by the investigator to be incompatible with the protocol."} ;; "disease considered by the investigator to be incompatible with the protocol"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies stem variable for illness
(assert
(! (=> patient_has_finding_of_illness_now@@serious
       patient_has_finding_of_illness_now)
   :named REQ11_AUXILIARY0)) ;; "serious illness"

;; Qualifier variable implies stem variable for disease (concomitant)
(assert
(! (=> patient_has_finding_of_disease_now@@concomitant
       patient_has_finding_of_disease_now)
   :named REQ11_AUXILIARY1)) ;; "concomitant disease"

;; Qualifier variable implies stem variable for disease (non-oncological)
(assert
(! (=> patient_has_finding_of_disease_now@@non_oncological
       patient_has_finding_of_disease_now)
   :named REQ11_AUXILIARY2)) ;; "non-oncological disease"

;; Qualifier variable implies stem variable for disease (considered incompatible with protocol by investigator)
(assert
(! (=> patient_has_finding_of_disease_now@@considered_incompatible_with_protocol_by_investigator
       patient_has_finding_of_disease_now)
   :named REQ11_AUXILIARY3)) ;; "disease considered by the investigator to be incompatible with the protocol"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient has serious illness
(assert
(! (not patient_has_finding_of_illness_now@@serious)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serious illness."

;; Exclusion: patient has concomitant non-oncological disease considered by the investigator to be incompatible with the protocol
(assert
(! (not (and patient_has_finding_of_disease_now@@concomitant
             patient_has_finding_of_disease_now@@non_oncological
             patient_has_finding_of_disease_now@@considered_incompatible_with_protocol_by_investigator))
   :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has concomitant non-oncological disease considered by the investigator to be incompatible with the protocol."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."} ;; "the patient is sexually active"
(declare-const patient_is_unwilling_to_use_contraception_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to use any method of contraception.","when_to_set_to_false":"Set to false if the patient is currently willing to use a method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to use a method of contraception.","meaning":"Boolean indicating whether the patient is currently unwilling to use any method of contraception."} ;; "the patient is unwilling to use medically acceptable method of contraception"
(declare-const patient_is_unwilling_to_use_contraception_method_now@@method_is_medically_acceptable Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to use a medically acceptable method of contraception.","when_to_set_to_false":"Set to false if the patient is currently willing to use a medically acceptable method of contraception, or unwilling only to use methods that are not medically acceptable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the method of contraception is medically acceptable in the context of the patient's willingness.","meaning":"Boolean indicating whether the patient is currently unwilling to use a medically acceptable method of contraception."} ;; "unwilling to use medically acceptable method of contraception"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_unwilling_to_use_contraception_method_now@@method_is_medically_acceptable
      patient_is_unwilling_to_use_contraception_method_now)
:named REQ12_AUXILIARY0)) ;; "unwilling to use medically acceptable method of contraception"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: patient is sexually active AND unwilling to use medically acceptable contraception
(assert
(! (not (and patient_is_sexually_active_now
             patient_is_unwilling_to_use_contraception_method_now@@method_is_medically_acceptable))
:named REQ12_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is sexually active) AND (the patient is unwilling to use medically acceptable method of contraception)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any pharmaceutical or biologic product within the past 4 weeks before the start of therapy.","when_to_set_to_false":"Set to false if the patient has not taken any pharmaceutical or biologic product within the past 4 weeks before the start of therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any pharmaceutical or biologic product within the past 4 weeks before the start of therapy.","meaning":"Boolean indicating whether the patient has taken any pharmaceutical or biologic product within the past 4 weeks before the start of therapy."} ;; "the patient has received treatment with other investigational drug within the past four weeks before start of therapy"
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthepast4weeks@@is_investigational_and_not_present_trial_drug Bool) ;; {"when_to_set_to_true":"Set to true if the pharmaceutical or biologic product taken within the past 4 weeks is an investigational drug and is not the present trial drug.","when_to_set_to_false":"Set to false if the product taken is not investigational or is the present trial drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is investigational and not the present trial drug.","meaning":"Boolean indicating whether the product taken is an investigational drug other than the present trial drug."} ;; "other investigational drug within the past four weeks before start of therapy"
(declare-const patient_has_undergone_clinical_trial_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any clinical trial within the past 4 weeks before the start of therapy.","when_to_set_to_false":"Set to false if the patient has not undergone any clinical trial within the past 4 weeks before the start of therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any clinical trial within the past 4 weeks before the start of therapy.","meaning":"Boolean indicating whether the patient has undergone any clinical trial within the past 4 weeks before the start of therapy."} ;; "the patient has participated in other clinical trial within the past four weeks before start of therapy"
(declare-const patient_has_undergone_clinical_trial_inthepast4weeks@@is_other_than_present_trial Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial undergone within the past 4 weeks is other than the present trial.","when_to_set_to_false":"Set to false if the trial is the present trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the trial is other than the present trial.","meaning":"Boolean indicating whether the clinical trial undergone is other than the present trial."} ;; "other clinical trial within the past four weeks before start of therapy"
(declare-const patient_is_taking_pharmaceutical_biologic_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any pharmaceutical or biologic product.","when_to_set_to_false":"Set to false if the patient is not currently taking any pharmaceutical or biologic product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any pharmaceutical or biologic product.","meaning":"Boolean indicating whether the patient is currently taking any pharmaceutical or biologic product."} ;; "the patient has received treatment with other investigational drug concomitantly with this trial except for present trial drug"
(declare-const patient_is_taking_pharmaceutical_biologic_product_now@@is_investigational_and_not_present_trial_drug_and_concomitant_with_this_trial Bool) ;; {"when_to_set_to_true":"Set to true if the pharmaceutical or biologic product currently being taken is an investigational drug other than the present trial drug and is being taken concomitantly with this trial.","when_to_set_to_false":"Set to false if the product is not investigational, is the present trial drug, or is not taken concomitantly with this trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is investigational, not the present trial drug, and taken concomitantly with this trial.","meaning":"Boolean indicating whether the product currently being taken is an investigational drug other than the present trial drug and is taken concomitantly with this trial."} ;; "other investigational drug concomitantly with this trial except for present trial drug"
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing any clinical trial.","when_to_set_to_false":"Set to false if the patient is not currently undergoing any clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing any clinical trial.","meaning":"Boolean indicating whether the patient is currently undergoing any clinical trial."} ;; "the patient has participated in other clinical trial concomitantly with this trial except for present trial drug"
(declare-const patient_is_undergoing_clinical_trial_now@@is_other_than_present_trial_and_concomitant_with_this_trial Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial currently being undergone is other than the present trial and is being participated in concomitantly with this trial.","when_to_set_to_false":"Set to false if the trial is the present trial or is not participated in concomitantly with this trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the trial is other than the present trial and participated in concomitantly with this trial.","meaning":"Boolean indicating whether the clinical trial currently being undergone is other than the present trial and is participated in concomitantly with this trial."} ;; "other clinical trial concomitantly with this trial except for present trial drug"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_taken_pharmaceutical_biologic_product_inthepast4weeks@@is_investigational_and_not_present_trial_drug
      patient_has_taken_pharmaceutical_biologic_product_inthepast4weeks)
:named REQ13_AUXILIARY0)) ;; "other investigational drug within the past four weeks before start of therapy"

(assert
(! (=> patient_has_undergone_clinical_trial_inthepast4weeks@@is_other_than_present_trial
      patient_has_undergone_clinical_trial_inthepast4weeks)
:named REQ13_AUXILIARY1)) ;; "other clinical trial within the past four weeks before start of therapy"

(assert
(! (=> patient_is_taking_pharmaceutical_biologic_product_now@@is_investigational_and_not_present_trial_drug_and_concomitant_with_this_trial
      patient_is_taking_pharmaceutical_biologic_product_now)
:named REQ13_AUXILIARY2)) ;; "other investigational drug concomitantly with this trial except for present trial drug"

(assert
(! (=> patient_is_undergoing_clinical_trial_now@@is_other_than_present_trial_and_concomitant_with_this_trial
      patient_is_undergoing_clinical_trial_now)
:named REQ13_AUXILIARY3)) ;; "other clinical trial concomitantly with this trial except for present trial drug"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_taken_pharmaceutical_biologic_product_inthepast4weeks@@is_investigational_and_not_present_trial_drug)
:named REQ13_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has received treatment with other investigational drug within the past four weeks before start of therapy"

(assert
(! (not patient_has_undergone_clinical_trial_inthepast4weeks@@is_other_than_present_trial)
:named REQ13_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has participated in other clinical trial within the past four weeks before start of therapy"

(assert
(! (not patient_is_taking_pharmaceutical_biologic_product_now@@is_investigational_and_not_present_trial_drug_and_concomitant_with_this_trial)
:named REQ13_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has received treatment with other investigational drug concomitantly with this trial except for present trial drug"

(assert
(! (not patient_is_undergoing_clinical_trial_now@@is_other_than_present_trial_and_concomitant_with_this_trial)
:named REQ13_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has participated in other clinical trial concomitantly with this trial except for present trial drug"

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_unable_to_comply_with_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to comply with the protocol.","when_to_set_to_false":"Set to false if the patient is currently able to comply with the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to comply with the protocol.","meaning":"Boolean indicating whether the patient is currently unable to comply with the protocol."} ;; "unable to comply with the protocol"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_unable_to_comply_with_protocol_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to comply with the protocol."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "the patient has active alcohol abuse"
(declare-const patient_has_finding_of_drug_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of drug abuse.","meaning":"Boolean indicating whether the patient currently has drug abuse."} ;; "the patient has active drug abuse"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (not patient_has_finding_of_alcohol_abuse_now)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active alcohol abuse."

(assert
  (! (not patient_has_finding_of_drug_abuse_now)
     :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active drug abuse."
