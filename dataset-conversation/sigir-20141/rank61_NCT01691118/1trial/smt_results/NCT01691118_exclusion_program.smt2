;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_will_undergo_major_non_cardiac_surgery_within_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a major non-cardiac surgery within the study period.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo a major non-cardiac surgery within the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo a major non-cardiac surgery within the study period.","meaning":"Boolean indicating whether the patient is scheduled to undergo a major non-cardiac surgery within the study period."} ;; "planned major non-cardiac surgery within the study period"

(declare-const patient_will_undergo_operation_on_heart_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a cardiac surgery in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo a cardiac surgery in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo a cardiac surgery in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo a cardiac surgery in the future."} ;; "cardiac surgery"

(declare-const patient_will_undergo_operation_on_heart_inthefuture@@within_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the scheduled cardiac surgery in the future occurs within the study period.","when_to_set_to_false":"Set to false if the scheduled cardiac surgery in the future does not occur within the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduled cardiac surgery in the future occurs within the study period.","meaning":"Boolean indicating whether the scheduled cardiac surgery in the future occurs within the study period."} ;; "planned cardiac surgery within the study period"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_will_undergo_operation_on_heart_inthefuture@@within_study_period
      patient_will_undergo_operation_on_heart_inthefuture)
:named REQ0_AUXILIARY0)) ;; "planned cardiac surgery within the study period"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have planned cardiac surgery within the study period
(assert
(! (not patient_will_undergo_operation_on_heart_inthefuture@@within_study_period)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has planned cardiac surgery within the study period."

;; Exclusion: patient must NOT have planned major non-cardiac surgery within the study period
(assert
(! (not patient_will_undergo_major_non_cardiac_surgery_within_study_period)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has planned major non-cardiac surgery within the study period."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of cerebrovascular accident (stroke) within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 6 months."} ;; "stroke within the past 6 months"
(declare-const patient_has_undergone_myocardial_revascularization_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone myocardial revascularization (coronary revascularization) within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone myocardial revascularization (coronary revascularization) within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone myocardial revascularization (coronary revascularization) within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone myocardial revascularization (coronary revascularization) within the past 6 months."} ;; "coronary revascularization within the past 6 months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthepast6months)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a stroke within the past 6 months."

(assert
(! (not patient_has_undergone_myocardial_revascularization_inthepast6months)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had coronary revascularization within the past 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a current left ventricular ejection fraction (LVEF) measurement is available.","when_to_set_to_null":"Set to null if no current LVEF measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current left ventricular ejection fraction (LVEF)."} ;; "left ventricular ejection fraction less than 50 percent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (< patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 50))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a left ventricular ejection fraction less than 50 percent."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hypertrophic_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertrophic cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have hypertrophic cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertrophic cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has hypertrophic cardiomyopathy."} ;; "hypertrophic cardiomyopathy"
(declare-const patient_has_finding_of_restrictive_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has restrictive cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have restrictive cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has restrictive cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has restrictive cardiomyopathy."} ;; "restrictive cardiomyopathy"
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart valve disorder (valve disease).","when_to_set_to_false":"Set to false if the patient currently does not have heart valve disorder (valve disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart valve disorder (valve disease).","meaning":"Boolean indicating whether the patient currently has heart valve disorder (valve disease)."} ;; "valve disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart valve disorder (valve disease) and the severity is moderate.","when_to_set_to_false":"Set to false if the patient currently has heart valve disorder (valve disease) but the severity is not moderate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of heart valve disorder (valve disease) is moderate.","meaning":"Boolean indicating whether the patient currently has heart valve disorder (valve disease) of moderate severity."} ;; "moderate valve disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart valve disorder (valve disease) and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has heart valve disorder (valve disease) but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of heart valve disorder (valve disease) is severe.","meaning":"Boolean indicating whether the patient currently has heart valve disorder (valve disease) of severe severity."} ;; "severe valve disease"
(declare-const patient_has_finding_of_constrictive_pericarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has constrictive pericarditis.","when_to_set_to_false":"Set to false if the patient currently does not have constrictive pericarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has constrictive pericarditis.","meaning":"Boolean indicating whether the patient currently has constrictive pericarditis."} ;; "constrictive pericarditis"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable for moderate valve disease
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@severity_moderate
       patient_has_finding_of_heart_valve_disorder_now)
   :named REQ3_AUXILIARY0)) ;; "moderate valve disease"

;; Qualifier variables imply corresponding stem variable for severe valve disease
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@severity_severe
       patient_has_finding_of_heart_valve_disorder_now)
   :named REQ3_AUXILIARY1)) ;; "severe valve disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hypertrophic_cardiomyopathy_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypertrophic cardiomyopathy."

(assert
(! (not patient_has_finding_of_restrictive_cardiomyopathy_now)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has restrictive cardiomyopathy."

(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@severity_moderate)
   :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate valve disease."

(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@severity_severe)
   :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe valve disease."

(assert
(! (not patient_has_finding_of_constrictive_pericarditis_now)
   :named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has constrictive pericarditis."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has atrial fibrillation."} ;; "atrial fibrillation"
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's heart rate, recorded now, in beats per minute.","when_to_set_to_null":"Set to null if the patient's heart rate value recorded now in beats per minute is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's heart rate, recorded now, in units of beats per minute."} ;; "heart rate greater than 120 beats per minute"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_finding_of_atrial_fibrillation_now
             (> patient_heart_rate_value_recorded_now_withunit_beats_per_minute 120)))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrial fibrillation with a heart rate greater than 120 beats per minute."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure (in millimeters of mercury) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure (in millimeters of mercury) measured now."} ;; "systolic blood pressure"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_while_patient_is_sitting Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement was taken while the patient is sitting.","when_to_set_to_false":"Set to false if the measurement was not taken while the patient is sitting.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the measurement was taken while the patient is sitting.","meaning":"Indicates whether the systolic blood pressure measurement was taken while the patient is sitting."} ;; "sitting systolic blood pressure"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_while_patient_is_sitting
             (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100)))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a sitting systolic blood pressure less than 100 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's diastolic blood pressure measured now in millimeters of mercury."} ;; "diastolic blood pressure"
(declare-const patient_is_undergoing_antihypertensive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antihypertensive therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving antihypertensive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving antihypertensive therapy.","meaning":"Boolean indicating whether the patient is currently receiving antihypertensive therapy."} ;; "antihypertensive therapy"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: sitting systolic blood pressure > 160 mmHg
(assert
(! (not (and
           (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 160)
           patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_while_patient_is_sitting))
   :named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a sitting systolic blood pressure greater than 160 millimeters of mercury."

;; Exclusion: (diastolic blood pressure > 95 mmHg) AND (receiving antihypertensive therapy)
(assert
(! (not (and
           (> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 95)
           patient_is_undergoing_antihypertensive_therapy_now))
   :named REQ6_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient has a diastolic blood pressure greater than 95 millimeters of mercury) AND (the patient is receiving antihypertensive therapy)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_creatinine_measurement_serum_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of serum creatinine (mg/dL) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine in mg/dL."} ;; "serum creatinine greater than 2.5 milligrams per deciliter"
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of renal (kidney) disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of renal (kidney) disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal (kidney) disease.","meaning":"Boolean indicating whether the patient currently has renal (kidney) disease."} ;; "significant renal disease"
(declare-const patient_has_undergone_creatinine_measurement_serum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a serum creatinine measurement now.","when_to_set_to_false":"Set to false if the patient has not undergone a serum creatinine measurement now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a serum creatinine measurement now.","meaning":"Boolean indicating whether the patient has undergone a serum creatinine measurement now."} ;; "serum creatinine measurement now"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and patient_has_finding_of_kidney_disease_now
             patient_has_undergone_creatinine_measurement_serum_now
             (> patient_creatinine_measurement_serum_value_recorded_now_withunit_mg_per_dl 2.5)))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant renal disease manifested by serum creatinine greater than 2.5 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung (pulmonary disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the lung (pulmonary disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the lung (pulmonary disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the lung (pulmonary disease)."} ;; "pulmonary disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung (pulmonary disease) and the disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the lung (pulmonary disease) but the disorder is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the lung (pulmonary disease) is clinically significant.","meaning":"Boolean indicating whether the patient's disorder of the lung (pulmonary disease) is clinically significant."} ;; "clinically significant pulmonary disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coronary arteriosclerosis (coronary artery disease).","when_to_set_to_false":"Set to false if the patient currently does not have coronary arteriosclerosis (coronary artery disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coronary arteriosclerosis (coronary artery disease).","meaning":"Boolean indicating whether the patient currently has coronary arteriosclerosis (coronary artery disease)."} ;; "coronary artery disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coronary arteriosclerosis (coronary artery disease) and the disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has coronary arteriosclerosis (coronary artery disease) but the disorder is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary arteriosclerosis (coronary artery disease) is clinically significant.","meaning":"Boolean indicating whether the patient's coronary arteriosclerosis (coronary artery disease) is clinically significant."} ;; "clinically significant coronary artery disease"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@clinically_significant
      patient_has_finding_of_disorder_of_lung_now)
   :named REQ8_AUXILIARY0)) ;; "clinically significant pulmonary disease"

(assert
(! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@clinically_significant
      patient_has_finding_of_coronary_arteriosclerosis_now)
   :named REQ8_AUXILIARY1)) ;; "clinically significant coronary artery disease"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_finding_of_disorder_of_lung_now@@clinically_significant
            patient_has_finding_of_coronary_arteriosclerosis_now@@clinically_significant))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has clinically significant pulmonary disease) OR (the patient has clinically significant coronary artery disease)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with basal cell carcinoma of the skin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with basal cell carcinoma of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with basal cell carcinoma of the skin.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of basal cell carcinoma of the skin."} ;; "basal cell skin cancer"
(declare-const patient_has_diagnosis_of_cancer_within_past_3_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of cancer (other than superficial squamous cell skin cancer or basal cell skin cancer) within the past 3 years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of cancer (other than superficial squamous cell skin cancer or basal cell skin cancer) within the past 3 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of cancer (other than superficial squamous cell skin cancer or basal cell skin cancer) within the past 3 years.","meaning":"Boolean indicating whether the patient has had a diagnosis of cancer (excluding superficial squamous cell skin cancer and basal cell skin cancer) within the past 3 years."} ;; "diagnosis of cancer (other than superficial squamous cell skin cancer or basal cell skin cancer) within the past 3 years"
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with squamous cell carcinoma of the skin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with squamous cell carcinoma of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with squamous cell carcinoma of the skin.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of squamous cell carcinoma of the skin."} ;; "squamous cell skin cancer"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a finding of malignant neoplastic disease (cancer)."} ;; "cancer"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently has malignant neoplastic disease (cancer) but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignant neoplastic disease (cancer) is active.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease (cancer) is active."} ;; "active cancer"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@receiving_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment for malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient is not currently receiving treatment for malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment for malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient is currently receiving treatment for malignant neoplastic disease (cancer)."} ;; "currently receiving treatment for active cancer"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@active
       patient_has_finding_of_malignant_neoplastic_disease_now)
   :named REQ9_AUXILIARY0)) ;; "active cancer" implies "cancer"

(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@receiving_treatment
       patient_has_finding_of_malignant_neoplastic_disease_now@@active)
   :named REQ9_AUXILIARY1)) ;; "currently receiving treatment for active cancer" implies "active cancer"

(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@active
       patient_has_finding_of_malignant_neoplastic_disease_now)
   :named REQ9_AUXILIARY2)) ;; "active cancer" implies "cancer"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: diagnosis of cancer (other than superficial squamous cell skin cancer or basal cell skin cancer) within the past 3 years
(assert
(! (not patient_has_diagnosis_of_cancer_within_past_3_years)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a diagnosis of cancer (other than superficial squamous cell skin cancer or basal cell skin cancer) within the past 3 years."

;; Exclusion: currently receiving treatment for active cancer
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now@@receiving_treatment)
   :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving treatment for active cancer."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is female.","when_to_set_to_false":"Set to false if the patient's current sex is not female.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current sex is female.","meaning":"Indicates whether the patient's current sex is female."} ;; "female of child-bearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has childbearing potential.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "female of child-bearing potential"
(declare-const patient_is_using_adequate_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using adequate contraception.","when_to_set_to_false":"Set to false if the patient is currently not using adequate contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using adequate contraception.","meaning":"Boolean indicating whether the patient is currently using adequate contraception."} ;; "use adequate contraception"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pregnant.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Indicates whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding (positive status now)."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Equivalence between two breast-feeding variables (both refer to current breast-feeding status)
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ10_AUXILIARY0)) ;; "the patient is breast-feeding"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion if (female of child-bearing potential AND does NOT use adequate contraception)
(assert
(! (not (and patient_sex_is_female_now
             patient_has_childbearing_potential_now
             (not patient_is_using_adequate_contraception_now)))
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "(the patient is a female of child-bearing potential AND the patient does NOT use adequate contraception)"

;; Exclusion if patient is pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is pregnant"

;; Exclusion if patient is breast-feeding
(assert
(! (not patient_is_breastfeeding_now)
:named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is breast-feeding"
