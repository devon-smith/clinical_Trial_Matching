;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease in their history."} ;; "malignant disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of malignant disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has interstitial lung disease."} ;; "interstitial lung disease"

(declare-const patient_has_finding_of_interstitial_lung_disease_now@@clinically_active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has interstitial lung disease and the disease is clinically active.","when_to_set_to_false":"Set to false if the patient currently has interstitial lung disease but the disease is not clinically active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the interstitial lung disease is clinically active.","meaning":"Boolean indicating whether the patient's current interstitial lung disease is clinically active."} ;; "clinically active interstitial lung disease"

(declare-const patient_has_finding_of_interstitial_lung_disease_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has interstitial lung disease and the disease is chronic.","when_to_set_to_false":"Set to false if the patient currently has interstitial lung disease but the disease is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the interstitial lung disease is chronic.","meaning":"Boolean indicating whether the patient's current interstitial lung disease is chronic."} ;; "chronic interstitial lung disease"

(declare-const patient_has_finding_of_interstitial_lung_disease_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has interstitial lung disease and the disease is stable.","when_to_set_to_false":"Set to false if the patient currently has interstitial lung disease but the disease is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the interstitial lung disease is stable.","meaning":"Boolean indicating whether the patient's current interstitial lung disease is stable."} ;; "stable interstitial lung disease"

(declare-const patient_has_finding_of_interstitial_lung_disease_now@@identified_by_radiographic_changes Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has interstitial lung disease and the disease is identified by radiographic changes.","when_to_set_to_false":"Set to false if the patient currently has interstitial lung disease but the disease is not identified by radiographic changes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the interstitial lung disease is identified by radiographic changes.","meaning":"Boolean indicating whether the patient's current interstitial lung disease is identified by radiographic changes."} ;; "radiographic changes of interstitial lung disease"

(declare-const patient_has_finding_of_interstitial_lung_disease_now@@asymptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has interstitial lung disease and is asymptomatic.","when_to_set_to_false":"Set to false if the patient currently has interstitial lung disease and is symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is asymptomatic with interstitial lung disease.","meaning":"Boolean indicating whether the patient with current interstitial lung disease is asymptomatic."} ;; "asymptomatic"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_interstitial_lung_disease_now@@clinically_active
       patient_has_finding_of_interstitial_lung_disease_now)
   :named REQ1_AUXILIARY0)) ;; "clinically active interstitial lung disease"

(assert
(! (=> patient_has_finding_of_interstitial_lung_disease_now@@chronic
       patient_has_finding_of_interstitial_lung_disease_now)
   :named REQ1_AUXILIARY1)) ;; "chronic interstitial lung disease"

(assert
(! (=> patient_has_finding_of_interstitial_lung_disease_now@@stable
       patient_has_finding_of_interstitial_lung_disease_now)
   :named REQ1_AUXILIARY2)) ;; "stable interstitial lung disease"

(assert
(! (=> patient_has_finding_of_interstitial_lung_disease_now@@identified_by_radiographic_changes
       patient_has_finding_of_interstitial_lung_disease_now)
   :named REQ1_AUXILIARY3)) ;; "radiographic changes of interstitial lung disease"

(assert
(! (=> patient_has_finding_of_interstitial_lung_disease_now@@asymptomatic
       patient_has_finding_of_interstitial_lung_disease_now)
   :named REQ1_AUXILIARY4)) ;; "asymptomatic with interstitial lung disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient has evidence of clinically active interstitial lung disease,
;; except if the patient has chronic, stable, radiographic changes, and is asymptomatic.
(assert
(! (not
      (or
        patient_has_finding_of_interstitial_lung_disease_now@@clinically_active
        (and
          patient_has_finding_of_interstitial_lung_disease_now@@clinically_active
          (not (and
            patient_has_finding_of_interstitial_lung_disease_now@@chronic
            patient_has_finding_of_interstitial_lung_disease_now@@stable
            patient_has_finding_of_interstitial_lung_disease_now@@identified_by_radiographic_changes
            patient_has_finding_of_interstitial_lung_disease_now@@asymptomatic
          ))
        )
      )
   )
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has evidence of clinically active interstitial lung disease or has evidence of clinically active interstitial lung diseases, except if the patient has chronic interstitial lung disease, stable interstitial lung disease, radiographic changes of interstitial lung disease and is asymptomatic."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_life_expectancy_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's expected life expectancy in months, as determined at the current time.","when_to_set_to_null":"Set to null if the patient's expected life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the patient's expected life expectancy in months at the current time."} ;; "expected life expectancy less than two months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (< patient_life_expectancy_value_recorded_now_in_months 2))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an expected life expectancy less than two months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systemic disease.","meaning":"Boolean indicating whether the patient currently has systemic disease."} ;; "systemic disease"
(declare-const patient_has_finding_of_systemic_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systemic disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has systemic disease but the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the systemic disease is severe.","meaning":"Boolean indicating whether the patient's current systemic disease is severe."} ;; "severe systemic disease"
(declare-const patient_has_finding_of_systemic_disease_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systemic disease and the disease is uncontrolled.","when_to_set_to_false":"Set to false if the patient currently has systemic disease but the disease is not uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the systemic disease is uncontrolled.","meaning":"Boolean indicating whether the patient's current systemic disease is uncontrolled."} ;; "uncontrolled systemic disease"

(declare-const patient_has_finding_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the respiratory system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the respiratory system.","meaning":"Boolean indicating whether the patient currently has a disorder of the respiratory system."} ;; "respiratory disease"
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the respiratory system and the disease is unstable.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the respiratory system but the disease is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the respiratory disease is unstable.","meaning":"Boolean indicating whether the patient's current respiratory disease is unstable."} ;; "unstable respiratory disease"
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now@@uncompensated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the respiratory system and the disease is uncompensated.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the respiratory system but the disease is not uncompensated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the respiratory disease is uncompensated.","meaning":"Boolean indicating whether the patient's current respiratory disease is uncompensated."} ;; "uncompensated respiratory disease"

(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "cardiac disease"
(declare-const patient_has_finding_of_heart_disease_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease and the disease is unstable.","when_to_set_to_false":"Set to false if the patient currently has heart disease but the disease is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart disease is unstable.","meaning":"Boolean indicating whether the patient's current heart disease is unstable."} ;; "unstable cardiac disease"
(declare-const patient_has_finding_of_heart_disease_now@@uncompensated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease and the disease is uncompensated.","when_to_set_to_false":"Set to false if the patient currently has heart disease but the disease is not uncompensated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart disease is uncompensated.","meaning":"Boolean indicating whether the patient's current heart disease is uncompensated."} ;; "uncompensated cardiac disease"

(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have disease of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disease of the liver.","meaning":"Boolean indicating whether the patient currently has disease of the liver."} ;; "hepatic disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease of the liver and the disease is unstable.","when_to_set_to_false":"Set to false if the patient currently has disease of the liver but the disease is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic disease is unstable.","meaning":"Boolean indicating whether the patient's current hepatic disease is unstable."} ;; "unstable hepatic disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@uncompensated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease of the liver and the disease is uncompensated.","when_to_set_to_false":"Set to false if the patient currently has disease of the liver but the disease is not uncompensated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic disease is uncompensated.","meaning":"Boolean indicating whether the patient's current hepatic disease is uncompensated."} ;; "uncompensated hepatic disease"

(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "renal disease"
(declare-const patient_has_finding_of_kidney_disease_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease and the disease is unstable.","when_to_set_to_false":"Set to false if the patient currently has kidney disease but the disease is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal disease is unstable.","meaning":"Boolean indicating whether the patient's current renal disease is unstable."} ;; "unstable renal disease"
(declare-const patient_has_finding_of_kidney_disease_now@@uncompensated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease and the disease is uncompensated.","when_to_set_to_false":"Set to false if the patient currently has kidney disease but the disease is not uncompensated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal disease is uncompensated.","meaning":"Boolean indicating whether the patient's current renal disease is uncompensated."} ;; "uncompensated renal disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_systemic_disease_now@@severe
      patient_has_finding_of_systemic_disease_now)
    :named REQ3_AUXILIARY0)) ;; "severe systemic disease"

(assert
(! (=> patient_has_finding_of_systemic_disease_now@@uncontrolled
      patient_has_finding_of_systemic_disease_now)
    :named REQ3_AUXILIARY1)) ;; "uncontrolled systemic disease"

(assert
(! (=> patient_has_finding_of_disorder_of_respiratory_system_now@@unstable
      patient_has_finding_of_disorder_of_respiratory_system_now)
    :named REQ3_AUXILIARY2)) ;; "unstable respiratory disease"

(assert
(! (=> patient_has_finding_of_disorder_of_respiratory_system_now@@uncompensated
      patient_has_finding_of_disorder_of_respiratory_system_now)
    :named REQ3_AUXILIARY3)) ;; "uncompensated respiratory disease"

(assert
(! (=> patient_has_finding_of_heart_disease_now@@unstable
      patient_has_finding_of_heart_disease_now)
    :named REQ3_AUXILIARY4)) ;; "unstable cardiac disease"

(assert
(! (=> patient_has_finding_of_heart_disease_now@@uncompensated
      patient_has_finding_of_heart_disease_now)
    :named REQ3_AUXILIARY5)) ;; "uncompensated cardiac disease"

(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@unstable
      patient_has_finding_of_disease_of_liver_now)
    :named REQ3_AUXILIARY6)) ;; "unstable hepatic disease"

(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@uncompensated
      patient_has_finding_of_disease_of_liver_now)
    :named REQ3_AUXILIARY7)) ;; "uncompensated hepatic disease"

(assert
(! (=> patient_has_finding_of_kidney_disease_now@@unstable
      patient_has_finding_of_kidney_disease_now)
    :named REQ3_AUXILIARY8)) ;; "unstable renal disease"

(assert
(! (=> patient_has_finding_of_kidney_disease_now@@uncompensated
      patient_has_finding_of_kidney_disease_now)
    :named REQ3_AUXILIARY9)) ;; "uncompensated renal disease"

;; Non-exhaustive examples imply uncontrolled systemic disease
(assert
(! (=> (or patient_has_finding_of_disorder_of_respiratory_system_now@@unstable
           patient_has_finding_of_disorder_of_respiratory_system_now@@uncompensated
           patient_has_finding_of_heart_disease_now@@unstable
           patient_has_finding_of_heart_disease_now@@uncompensated
           patient_has_finding_of_disease_of_liver_now@@unstable
           patient_has_finding_of_disease_of_liver_now@@uncompensated
           patient_has_finding_of_kidney_disease_now@@unstable
           patient_has_finding_of_kidney_disease_now@@uncompensated)
      patient_has_finding_of_systemic_disease_now@@uncontrolled)
    :named REQ3_AUXILIARY10)) ;; "with non-exhaustive examples (unstable respiratory disease, uncompensated respiratory disease, unstable cardiac disease, uncompensated cardiac disease, unstable hepatic disease, uncompensated hepatic disease, unstable renal disease, uncompensated renal disease)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_systemic_disease_now@@severe)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, as judged by the investigator, the patient has any evidence of severe systemic disease."

(assert
(! (not patient_has_finding_of_systemic_disease_now@@uncontrolled)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, as judged by the investigator, the patient has any evidence of uncontrolled systemic disease with non-exhaustive examples (unstable respiratory disease, uncompensated respiratory disease, unstable cardiac disease, uncompensated cardiac disease, unstable hepatic disease, uncompensated hepatic disease, unstable renal disease, uncompensated renal disease)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_alanine_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the measured ALT value in U/L if a current laboratory measurement is available.","when_to_set_to_null":"Set to null if no current ALT measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase (ALT) concentration in U/L."} ;; "alanine aminotransferase (serum glutamic-pyruvic transaminase, SGPT)"
(declare-const patient_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the measured AST value in U/L if a current laboratory measurement is available.","when_to_set_to_null":"Set to null if no current AST measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate aminotransferase (AST) concentration in U/L."} ;; "aspartate aminotransferase (serum glutamic-oxaloacetic transaminase, SGOT)"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has demonstrable liver metastases (secondary malignant neoplasm of liver).","when_to_set_to_false":"Set to false if the patient currently does not have demonstrable liver metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has demonstrable liver metastases.","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplasm of liver (liver metastases)."} ;; "liver metastases"
(declare-const upper_limit_of_normal_for_alanine_aminotransferase_value_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the laboratory-defined upper limit of normal for ALT in U/L if available for the current measurement.","when_to_set_to_null":"Set to null if the laboratory reference range for ALT is unavailable or indeterminate.","meaning":"Numeric value representing the current upper limit of normal for alanine aminotransferase (ALT) in U/L as defined by the laboratory reference range."} ;; "upper limit of normal for alanine aminotransferase"
(declare-const upper_limit_of_normal_for_aspartate_aminotransferase_value_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the laboratory-defined upper limit of normal for AST in U/L if available for the current measurement.","when_to_set_to_null":"Set to null if the laboratory reference range for AST is unavailable or indeterminate.","meaning":"Numeric value representing the current upper limit of normal for aspartate aminotransferase (AST) in U/L as defined by the laboratory reference range."} ;; "upper limit of normal for aspartate aminotransferase"

;; ===================== Constraint Assertions (REQ 4) =====================
;; "The patient is excluded if aspartate aminotransferase (serum glutamic-oxaloacetic transaminase, SGOT) is greater than or equal to 2.5 times the upper limit of normal if no demonstrable liver metastases are present."
(assert
(! (not (and
        (not patient_has_finding_of_secondary_malignant_neoplasm_of_liver_now)
        (>= patient_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l
            (* 2.5 upper_limit_of_normal_for_aspartate_aminotransferase_value_now_withunit_u_per_l))))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS))

;; "The patient is excluded if alanine aminotransferase (serum glutamic-pyruvic transaminase, SGPT) is greater than or equal to 2.5 times the upper limit of normal if no demonstrable liver metastases are present."
(assert
(! (not (and
        (not patient_has_finding_of_secondary_malignant_neoplasm_of_liver_now)
        (>= patient_alanine_aminotransferase_value_recorded_now_withunit_u_per_l
            (* 2.5 upper_limit_of_normal_for_alanine_aminotransferase_value_now_withunit_u_per_l))))
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS))

;; "The patient is excluded if aspartate aminotransferase (serum glutamic-oxaloacetic transaminase, SGOT) is greater than 5 times the upper limit of normal in the presence of liver metastases."
(assert
(! (not (and
        patient_has_finding_of_secondary_malignant_neoplasm_of_liver_now
        (> patient_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l
           (* 5 upper_limit_of_normal_for_aspartate_aminotransferase_value_now_withunit_u_per_l))))
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS))

;; "The patient is excluded if alanine aminotransferase (serum glutamic-pyruvic transaminase, SGPT) is greater than 5 times the upper limit of normal in the presence of liver metastases."
(assert
(! (not (and
        patient_has_finding_of_secondary_malignant_neoplasm_of_liver_now
        (> patient_alanine_aminotransferase_value_recorded_now_withunit_u_per_l
           (* 5 upper_limit_of_normal_for_alanine_aminotransferase_value_now_withunit_u_per_l))))
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS))

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of any clinical disorder (disease).","when_to_set_to_false":"Set to false if the patient currently does not have evidence of any clinical disorder (disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of any clinical disorder (disease).","meaning":"Boolean indicating whether the patient currently has evidence of any clinical disorder (disease)."} ;; "clinical disorder"
(declare-const patient_has_finding_of_disease_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the clinical disorder present is considered significant.","when_to_set_to_false":"Set to false if the clinical disorder present is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical disorder present is significant.","meaning":"Boolean indicating whether the clinical disorder present is significant."} ;; "significant clinical disorder"
(declare-const patient_has_finding_of_disease_now@@makes_participation_undesirable Bool) ;; {"when_to_set_to_true":"Set to true if the clinical disorder present makes it undesirable for the patient to participate in the study.","when_to_set_to_false":"Set to false if the clinical disorder present does not make it undesirable for the patient to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical disorder present makes participation undesirable.","meaning":"Boolean indicating whether the clinical disorder present makes it undesirable for the patient to participate in the study."} ;; "makes it undesirable for the patient to participate in the study (clinical disorder)"
(declare-const patient_has_finding_of_laboratory_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of any laboratory finding.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of any laboratory finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of any laboratory finding.","meaning":"Boolean indicating whether the patient currently has evidence of any laboratory finding."} ;; "laboratory finding"
(declare-const patient_has_finding_of_laboratory_finding_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the laboratory finding present is considered significant.","when_to_set_to_false":"Set to false if the laboratory finding present is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the laboratory finding present is significant.","meaning":"Boolean indicating whether the laboratory finding present is significant."} ;; "significant laboratory finding"
(declare-const patient_has_finding_of_laboratory_finding_now@@makes_participation_undesirable Bool) ;; {"when_to_set_to_true":"Set to true if the laboratory finding present makes it undesirable for the patient to participate in the study.","when_to_set_to_false":"Set to false if the laboratory finding present does not make it undesirable for the patient to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the laboratory finding present makes participation undesirable.","meaning":"Boolean indicating whether the laboratory finding present makes it undesirable for the patient to participate in the study."} ;; "makes it undesirable for the patient to participate in the study (laboratory finding)"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables (clinical disorder)
(assert
(! (=> patient_has_finding_of_disease_now@@significant
      patient_has_finding_of_disease_now)
:named REQ5_AUXILIARY0)) ;; "significant clinical disorder"

(assert
(! (=> patient_has_finding_of_disease_now@@makes_participation_undesirable
      patient_has_finding_of_disease_now)
:named REQ5_AUXILIARY1)) ;; "clinical disorder that makes it undesirable for the patient to participate in the study"

;; Qualifier variables imply corresponding stem variables (laboratory finding)
(assert
(! (=> patient_has_finding_of_laboratory_finding_now@@significant
      patient_has_finding_of_laboratory_finding_now)
:named REQ5_AUXILIARY2)) ;; "significant laboratory finding"

(assert
(! (=> patient_has_finding_of_laboratory_finding_now@@makes_participation_undesirable
      patient_has_finding_of_laboratory_finding_now)
:named REQ5_AUXILIARY3)) ;; "laboratory finding that makes it undesirable for the patient to participate in the study"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have evidence of any other significant clinical disorder that makes participation undesirable
(assert
(! (not (and patient_has_finding_of_disease_now@@significant
             patient_has_finding_of_disease_now@@makes_participation_undesirable))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of any other significant clinical disorder that makes it undesirable for the patient to participate in the study."

;; Exclusion: patient must NOT have evidence of any other significant laboratory finding that makes participation undesirable
(assert
(! (not (and patient_has_finding_of_laboratory_finding_now@@significant
             patient_has_finding_of_laboratory_finding_now@@makes_participation_undesirable))
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of any other significant laboratory finding that makes it undesirable for the patient to participate in the study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be currently pregnant.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently considered not to have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is a woman of childbearing potential"
(declare-const patient_does_not_practice_acceptable_methods_of_birth_control_to_prevent_pregnancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently not practicing acceptable methods of birth control to prevent pregnancy.","when_to_set_to_false":"Set to false if the patient is currently practicing acceptable methods of birth control to prevent pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently practicing acceptable methods of birth control to prevent pregnancy.","meaning":"Boolean indicating whether the patient currently does NOT practice acceptable methods of birth control to prevent pregnancy."} ;; "the patient does NOT practice acceptable methods of birth control to prevent pregnancy"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient is pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; Exclusion: patient is breast-feeding
(assert
(! (not patient_is_breastfeeding_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; Exclusion: patient is a woman of childbearing potential AND does NOT practice acceptable methods of birth control to prevent pregnancy
(assert
(! (not (and patient_has_childbearing_potential_now patient_does_not_practice_acceptable_methods_of_birth_control_to_prevent_pregnancy_now))
:named REQ6_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a woman of childbearing potential and the patient does NOT practice acceptable methods of birth control to prevent pregnancy."
