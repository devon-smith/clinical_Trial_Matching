;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an outpatient at the time of giving informed consent.","when_to_set_to_false":"Set to false if the patient is not currently an outpatient at the time of giving informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an outpatient at the time of giving informed consent.","meaning":"Boolean indicating whether the patient is currently an outpatient at the time of giving informed consent."}  ;; "To be included, the patient must be an outpatient."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 65 years AND aged < 85 years (at the time of giving informed consent)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be an outpatient
(assert
  (! patient_is_outpatient_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an outpatient."

;; Component 1: Patient must be aged ≥ 65 years at the time of giving informed consent
(assert
  (! (>= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 65 years at the time of giving informed consent."

;; Component 2: Patient must be aged < 85 years at the time of giving informed consent
(assert
  (! (< patient_age_value_recorded_now_in_years 85)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged < 85 years at the time of giving informed consent."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_undergoing_antihypertensive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antihypertensive therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving antihypertensive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving antihypertensive therapy.","meaning":"Boolean indicating whether the patient is currently receiving antihypertensive therapy."}  ;; "To be included, the patient must be currently receiving antihypertensive treatment with antihypertensive monotherapy."
(declare-const patient_is_undergoing_antihypertensive_therapy_now@@administered_as_monotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antihypertensive therapy and the therapy is administered as monotherapy (single agent).","when_to_set_to_false":"Set to false if the patient is currently receiving antihypertensive therapy but the therapy is not administered as monotherapy (i.e., combination therapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antihypertensive therapy is administered as monotherapy.","meaning":"Boolean indicating whether the patient's current antihypertensive therapy is administered as monotherapy (single agent)."}  ;; "To be included, the patient must be currently receiving antihypertensive treatment with antihypertensive monotherapy."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for monotherapy implies the patient is currently receiving antihypertensive therapy
(assert
  (! (=> patient_is_undergoing_antihypertensive_therapy_now@@administered_as_monotherapy
         patient_is_undergoing_antihypertensive_therapy_now)
     :named REQ1_AUXILIARY0)) ;; "antihypertensive monotherapy" is a subtype of "antihypertensive therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be currently receiving antihypertensive treatment with antihypertensive monotherapy
(assert
  (! patient_is_undergoing_antihypertensive_therapy_now@@administered_as_monotherapy
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be currently receiving antihypertensive treatment with antihypertensive monotherapy."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's systolic blood pressure in millimeters of mercury, recorded now."}  ;; "systolic blood pressure"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement was taken in a sitting position.","when_to_set_to_false":"Set to false if the measurement was not taken in a sitting position.","when_to_set_to_null":"Set to null if the position during measurement is unknown or indeterminate.","meaning":"Boolean indicating whether the systolic blood pressure measurement was taken in a sitting position."}  ;; "systolic blood pressure ... in a sitting position"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_measurements_on_two_clinic_visits Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement is based on two separate measurements taken on two different clinic visits.","when_to_set_to_false":"Set to false if the measurement does not meet this criterion.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken on two measurements across two clinic visits.","meaning":"Boolean indicating whether the systolic blood pressure measurement was taken on two measurements across two clinic visits."}  ;; "systolic blood pressure ... on two measurements on two clinic visits"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's diastolic blood pressure in millimeters of mercury, recorded now."}  ;; "diastolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement was taken in a sitting position.","when_to_set_to_false":"Set to false if the measurement was not taken in a sitting position.","when_to_set_to_null":"Set to null if the position during measurement is unknown or indeterminate.","meaning":"Boolean indicating whether the diastolic blood pressure measurement was taken in a sitting position."}  ;; "diastolic blood pressure ... in a sitting position"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_measurements_on_two_clinic_visits Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement is based on two separate measurements taken on two different clinic visits.","when_to_set_to_false":"Set to false if the measurement does not meet this criterion.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken on two measurements across two clinic visits.","meaning":"Boolean indicating whether the diastolic blood pressure measurement was taken on two measurements across two clinic visits."}  ;; "diastolic blood pressure ... on two measurements on two clinic visits"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Systolic BP with all qualifiers implies a valid SBP measurement for inclusion
(assert
  (! (=> (and patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position
              patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_measurements_on_two_clinic_visits)
         true)
     :named REQ2_AUXILIARY0)) ;; "systolic blood pressure ... in a sitting position on two measurements on two clinic visits"

;; Diastolic BP with all qualifiers implies a valid DBP measurement for inclusion
(assert
  (! (=> (and patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position
              patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_measurements_on_two_clinic_visits)
         true)
     :named REQ2_AUXILIARY1)) ;; "diastolic blood pressure ... in a sitting position on two measurements on two clinic visits"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: ((SBP >= 140) OR (DBP >= 90)), both in sitting position and on two measurements on two clinic visits
(assert
  (! (or
        (and (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 140.0)
             patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position
             patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_measurements_on_two_clinic_visits)
        (and (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90.0)
             patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position
             patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@on_two_measurements_on_two_clinic_visits))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((systolic blood pressure ≥ 140 millimeters of mercury) OR (diastolic blood pressure ≥ 90 millimeters of mercury)) (in a sitting position on two measurements on two clinic visits)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patients_risk_factor_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one risk factor as defined by the eligibility requirement.","when_to_set_to_false":"Set to false if the patient currently does not have any of the defined risk factors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any risk factor.","meaning":"Boolean indicating whether the patient currently has at least one risk factor."} ;; "risk factors"

(declare-const patient_has_finding_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus."} ;; "type 2 diabetes mellitus"

(declare-const patient_has_history_of_cerebral_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of cerebral infarction.","when_to_set_to_false":"Set to false if the patient does not have a documented history of cerebral infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cerebral infarction.","meaning":"Boolean indicating whether the patient has a history of cerebral infarction."} ;; "history of cerebral infarction"

(declare-const patient_has_history_of_cerebral_hemorrhage Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of cerebral hemorrhage.","when_to_set_to_false":"Set to false if the patient does not have a documented history of cerebral hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cerebral hemorrhage.","meaning":"Boolean indicating whether the patient has a history of cerebral hemorrhage."} ;; "history of cerebral hemorrhage"

(declare-const patient_has_history_of_subarachnoid_hemorrhage Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of subarachnoid hemorrhage.","when_to_set_to_false":"Set to false if the patient does not have a documented history of subarachnoid hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of subarachnoid hemorrhage.","meaning":"Boolean indicating whether the patient has a history of subarachnoid hemorrhage."} ;; "history of subarachnoid hemorrhage"

(declare-const patient_has_history_of_transient_ischemic_attack Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of transient ischemic attack.","when_to_set_to_false":"Set to false if the patient does not have a documented history of transient ischemic attack.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of transient ischemic attack.","meaning":"Boolean indicating whether the patient has a history of transient ischemic attack."} ;; "history of transient ischemic attack"

(declare-const patient_has_history_of_transient_ischemic_attack@@onset_greater_than_6_months_before_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of transient ischemic attack has onset more than 6 months before giving informed consent.","when_to_set_to_false":"Set to false if the patient's history of transient ischemic attack has onset 6 months or less before giving informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of transient ischemic attack was more than 6 months before giving informed consent.","meaning":"Boolean indicating whether the patient's history of transient ischemic attack has onset more than 6 months before giving informed consent."} ;; "history of transient ischemic attack (with onset > 6 months before giving informed consent)"

(declare-const patient_has_finding_of_asymptomatic_cerebrovascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asymptomatic cerebrovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asymptomatic cerebrovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asymptomatic cerebrovascular disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asymptomatic cerebrovascular disease."} ;; "diagnosis of asymptomatic cerebrovascular disease"

(declare-const patient_has_history_of_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of myocardial infarction.","when_to_set_to_false":"Set to false if the patient does not have a documented history of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of myocardial infarction.","meaning":"Boolean indicating whether the patient has a history of myocardial infarction."} ;; "history of myocardial infarction"

(declare-const patient_has_history_of_myocardial_infarction@@onset_greater_than_6_months_before_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of myocardial infarction has onset more than 6 months before giving informed consent.","when_to_set_to_false":"Set to false if the patient's history of myocardial infarction has onset 6 months or less before giving informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of myocardial infarction was more than 6 months before giving informed consent.","meaning":"Boolean indicating whether the patient's history of myocardial infarction has onset more than 6 months before giving informed consent."} ;; "history of myocardial infarction (with onset > 6 months before giving informed consent)"

(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of angina pectoris.","meaning":"Boolean indicating whether the patient currently has a diagnosis of angina pectoris."} ;; "diagnosis of angina pectoris"

(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart failure."} ;; "diagnosis of heart failure"

(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_i_or_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is classified as NYHA class I or II.","when_to_set_to_false":"Set to false if the patient's current heart failure is not classified as NYHA class I or II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is classified as NYHA class I or II.","meaning":"Boolean indicating whether the patient's current heart failure is classified as NYHA class I or II."} ;; "diagnosis of heart failure (New York Heart Association functional classification I OR II)"

(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of left ventricular hypertrophy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of left ventricular hypertrophy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of left ventricular hypertrophy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of left ventricular hypertrophy."} ;; "diagnosis of left ventricular hypertrophy"

(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now@@iv_septum_wall_thickness_measured_by_echocardiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular hypertrophy is determined by interventricular septum wall thickness measured by echocardiography.","when_to_set_to_false":"Set to false if the patient's left ventricular hypertrophy is not determined by interventricular septum wall thickness measured by echocardiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left ventricular hypertrophy is determined by interventricular septum wall thickness measured by echocardiography.","meaning":"Boolean indicating whether the patient's left ventricular hypertrophy is determined by interventricular septum wall thickness measured by echocardiography."} ;; "thickness of the wall of interventricular septum ≥ 12 millimeters on echocardiography"

(declare-const iv_septum_wall_thickness_value_echocardiography_mm Real) ;; {"when_to_set_to_value":"Set to the measured value of interventricular septum wall thickness by echocardiography in millimeters.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of interventricular septum wall thickness measured by echocardiography in millimeters."} ;; "thickness of the wall of interventricular septum ≥ 12 millimeters on echocardiography"

(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now@@sv1_plus_rv5_measured_by_electrocardiography_before_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular hypertrophy is determined by Sv1 + Rv5 measured by electrocardiography before giving informed consent.","when_to_set_to_false":"Set to false if the patient's left ventricular hypertrophy is not determined by Sv1 + Rv5 measured by electrocardiography before giving informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left ventricular hypertrophy is determined by Sv1 + Rv5 measured by electrocardiography before giving informed consent.","meaning":"Boolean indicating whether the patient's left ventricular hypertrophy is determined by Sv1 + Rv5 measured by electrocardiography before giving informed consent."} ;; "Sv1 + Rv5 ≥ 35 millimeters on electrocardiography before giving informed consent"

(declare-const sv1_plus_rv5_value_electrocardiography_mm_before_informed_consent Real) ;; {"when_to_set_to_value":"Set to the measured value of Sv1 plus Rv5 by electrocardiography before giving informed consent in millimeters.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of Sv1 plus Rv5 measured by electrocardiography before giving informed consent in millimeters."} ;; "Sv1 + Rv5 ≥ 35 millimeters on electrocardiography before giving informed consent"

(declare-const patient_has_finding_of_aortic_aneurysm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of aortic aneurysm.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of aortic aneurysm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of aortic aneurysm.","meaning":"Boolean indicating whether the patient currently has a diagnosis of aortic aneurysm."} ;; "diagnosis of aortic aneurysm"

(declare-const patient_has_history_of_aortic_dissection Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of aortic dissection.","when_to_set_to_false":"Set to false if the patient does not have a documented history of aortic dissection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of aortic dissection.","meaning":"Boolean indicating whether the patient has a history of aortic dissection."} ;; "history of aortic dissection"

(declare-const patient_has_history_of_aortic_dissection@@onset_greater_than_6_months_before_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of aortic dissection has onset more than 6 months before giving informed consent.","when_to_set_to_false":"Set to false if the patient's history of aortic dissection has onset 6 months or less before giving informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of aortic dissection was more than 6 months before giving informed consent.","meaning":"Boolean indicating whether the patient's history of aortic dissection has onset more than 6 months before giving informed consent."} ;; "history of aortic dissection (with onset > 6 months before giving informed consent)"

(declare-const patient_has_finding_of_arteriosclerotic_peripheral_arterial_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of arteriosclerotic peripheral arterial obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of arteriosclerotic peripheral arterial obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of arteriosclerotic peripheral arterial obstruction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of arteriosclerotic peripheral arterial obstruction."} ;; "diagnosis of arteriosclerotic peripheral arterial obstruction"

(declare-const fontaine_classification_value_now Real) ;; {"when_to_set_to_value":"Set to the current Fontaine classification value for peripheral arterial obstruction.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of Fontaine classification for peripheral arterial obstruction at the current time."} ;; "Fontaine classification ≥ 2 AND Fontaine classification ≤ 4"

(declare-const serum_creatinine_value_now_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the current measured value of serum creatinine in milligrams per deciliter.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of serum creatinine in milligrams per deciliter at the current time."} ;; "serum creatinine: (≥ 1.2 milligrams per deciliter AND ≤ 2.5 milligrams per deciliter for male) OR (≥ 1.0 milligrams per deciliter AND ≤ 2.5 milligrams per deciliter for female)"

(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex matches the specified value (male, female, or other) and is documented.","when_to_set_to_false":"Set to false if the patient's current sex does not match the specified value and is documented.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates the patient's current sex as male, female, or other."} ;; "serum creatinine: (≥ 1.2 milligrams per deciliter AND ≤ 2.5 milligrams per deciliter for male)"

(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex matches the specified value (male, female, or other) and is documented.","when_to_set_to_false":"Set to false if the patient's current sex does not match the specified value and is documented.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates the patient's current sex as male, female, or other."} ;; "serum creatinine: (≥ 1.0 milligrams per deciliter AND ≤ 2.5 milligrams per deciliter for female)"

(declare-const proteinuria_semiquantitative_value_now Real) ;; {"when_to_set_to_value":"Set to the current semiquantitative proteinuria value as recorded (e.g., +1, +2, etc.).","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric semiquantitative value of proteinuria at the current time."} ;; "proteinuria: (≥ +1)"

(declare-const proteinuria_urine_protein_to_creatinine_ratio_value_now_g_per_g Real) ;; {"when_to_set_to_value":"Set to the current measured value of urine protein to creatinine ratio in grams per gram.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of urine protein to creatinine ratio in grams per gram at the current time."} ;; "proteinuria: (≥ 0.3 grams per gram creatinine estimated from 24-hour urine collection OR random urinary protein corrected by urine creatinine)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_history_of_transient_ischemic_attack@@onset_greater_than_6_months_before_informed_consent
         patient_has_history_of_transient_ischemic_attack)
     :named REQ3_AUXILIARY0)) ;; "history of transient ischemic attack (with onset > 6 months before giving informed consent)"

(assert
  (! (=> patient_has_history_of_myocardial_infarction@@onset_greater_than_6_months_before_informed_consent
         patient_has_history_of_myocardial_infarction)
     :named REQ3_AUXILIARY1)) ;; "history of myocardial infarction (with onset > 6 months before giving informed consent)"

(assert
  (! (=> patient_has_history_of_aortic_dissection@@onset_greater_than_6_months_before_informed_consent
         patient_has_history_of_aortic_dissection)
     :named REQ3_AUXILIARY2)) ;; "history of aortic dissection (with onset > 6 months before giving informed consent)"

(assert
  (! (=> patient_has_finding_of_heart_failure_now@@nyha_class_i_or_ii
         patient_has_finding_of_heart_failure_now)
     :named REQ3_AUXILIARY3)) ;; "diagnosis of heart failure (New York Heart Association functional classification I OR II)"

(assert
  (! (=> patient_has_finding_of_left_ventricular_hypertrophy_now@@iv_septum_wall_thickness_measured_by_echocardiography
         patient_has_finding_of_left_ventricular_hypertrophy_now)
     :named REQ3_AUXILIARY4)) ;; "thickness of the wall of interventricular septum ≥ 12 millimeters on echocardiography"

(assert
  (! (=> patient_has_finding_of_left_ventricular_hypertrophy_now@@sv1_plus_rv5_measured_by_electrocardiography_before_informed_consent
         patient_has_finding_of_left_ventricular_hypertrophy_now)
     :named REQ3_AUXILIARY5)) ;; "Sv1 + Rv5 ≥ 35 millimeters on electrocardiography before giving informed consent"

;; Definitions for left ventricular hypertrophy qualifiers
(assert
  (! (= patient_has_finding_of_left_ventricular_hypertrophy_now@@iv_septum_wall_thickness_measured_by_echocardiography
        (>= iv_septum_wall_thickness_value_echocardiography_mm 12.0))
     :named REQ3_AUXILIARY6)) ;; "thickness of the wall of interventricular septum ≥ 12 millimeters on echocardiography"

(assert
  (! (= patient_has_finding_of_left_ventricular_hypertrophy_now@@sv1_plus_rv5_measured_by_electrocardiography_before_informed_consent
        (>= sv1_plus_rv5_value_electrocardiography_mm_before_informed_consent 35.0))
     :named REQ3_AUXILIARY7)) ;; "Sv1 + Rv5 ≥ 35 millimeters on electrocardiography before giving informed consent"

;; Definition for heart failure NYHA class I or II
;; (Assume this is set externally, as no numeric NYHA variable is provided.)

;; Definition for arteriosclerotic peripheral arterial obstruction Fontaine classification
(assert
  (! (=> (and patient_has_finding_of_arteriosclerotic_peripheral_arterial_obstruction_now
              (and (>= fontaine_classification_value_now 2.0)
                   (<= fontaine_classification_value_now 4.0)))
         patient_has_finding_of_arteriosclerotic_peripheral_arterial_obstruction_now)
     :named REQ3_AUXILIARY8)) ;; "diagnosis of arteriosclerotic peripheral arterial obstruction (Fontaine classification ≥ 2 AND Fontaine classification ≤ 4)"

;; Definition for serum creatinine risk factor (male)
(define-fun serum_creatinine_risk_factor_male () Bool
  (and patient_sex_is_male_now
       (>= serum_creatinine_value_now_mg_per_dl 1.2)
       (<= serum_creatinine_value_now_mg_per_dl 2.5))) ;; "serum creatinine: (≥ 1.2 milligrams per deciliter AND ≤ 2.5 milligrams per deciliter for male)"

;; Definition for serum creatinine risk factor (female)
(define-fun serum_creatinine_risk_factor_female () Bool
  (and patient_sex_is_female_now
       (>= serum_creatinine_value_now_mg_per_dl 1.0)
       (<= serum_creatinine_value_now_mg_per_dl 2.5))) ;; "serum creatinine: (≥ 1.0 milligrams per deciliter AND ≤ 2.5 milligrams per deciliter for female)"

;; Definition for proteinuria risk factor
(define-fun proteinuria_risk_factor () Bool
  (or (>= proteinuria_semiquantitative_value_now 1.0) ;; "+1" or higher
      (>= proteinuria_urine_protein_to_creatinine_ratio_value_now_g_per_g 0.3))) ;; "proteinuria: (≥ +1) OR (≥ 0.3 grams per gram creatinine ...)"

;; Definition for left ventricular hypertrophy risk factor
(define-fun left_ventricular_hypertrophy_risk_factor () Bool
  (and patient_has_finding_of_left_ventricular_hypertrophy_now
       (or patient_has_finding_of_left_ventricular_hypertrophy_now@@iv_septum_wall_thickness_measured_by_echocardiography
           patient_has_finding_of_left_ventricular_hypertrophy_now@@sv1_plus_rv5_measured_by_electrocardiography_before_informed_consent))) ;; "diagnosis of left ventricular hypertrophy ((thickness of the wall of interventricular septum ≥ 12 millimeters on echocardiography) OR (Sv1 + Rv5 ≥ 35 millimeters on electrocardiography before giving informed consent))"

;; Definition for heart failure risk factor (NYHA I or II)
(define-fun heart_failure_nyha_i_ii_risk_factor () Bool
  (and patient_has_finding_of_heart_failure_now
       patient_has_finding_of_heart_failure_now@@nyha_class_i_or_ii)) ;; "diagnosis of heart failure (New York Heart Association functional classification I OR II)"

;; Definition for history of transient ischemic attack risk factor (>6 months)
(define-fun history_of_tia_gt6mo_risk_factor () Bool
  patient_has_history_of_transient_ischemic_attack@@onset_greater_than_6_months_before_informed_consent) ;; "history of transient ischemic attack (with onset > 6 months before giving informed consent)"

;; Definition for history of myocardial infarction risk factor (>6 months)
(define-fun history_of_mi_gt6mo_risk_factor () Bool
  patient_has_history_of_myocardial_infarction@@onset_greater_than_6_months_before_informed_consent) ;; "history of myocardial infarction (with onset > 6 months before giving informed consent)"

;; Definition for history of aortic dissection risk factor (>6 months)
(define-fun history_of_aortic_dissection_gt6mo_risk_factor () Bool
  patient_has_history_of_aortic_dissection@@onset_greater_than_6_months_before_informed_consent) ;; "history of aortic dissection (with onset > 6 months before giving informed consent)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (= patients_risk_factor_is_positive_now
        (or
          patient_has_finding_of_type_2_diabetes_mellitus_now
          patient_has_history_of_cerebral_infarction
          patient_has_history_of_cerebral_hemorrhage
          patient_has_history_of_subarachnoid_hemorrhage
          history_of_tia_gt6mo_risk_factor
          patient_has_finding_of_asymptomatic_cerebrovascular_disease_now
          history_of_mi_gt6mo_risk_factor
          patient_has_finding_of_angina_pectoris_now
          heart_failure_nyha_i_ii_risk_factor
          left_ventricular_hypertrophy_risk_factor
          patient_has_finding_of_aortic_aneurysm_now
          history_of_aortic_dissection_gt6mo_risk_factor
          (and patient_has_finding_of_arteriosclerotic_peripheral_arterial_obstruction_now
               (and (>= fontaine_classification_value_now 2.0)
                    (<= fontaine_classification_value_now 4.0)))
          serum_creatinine_risk_factor_male
          serum_creatinine_risk_factor_female
          proteinuria_risk_factor))
     :named REQ3_AUXILIARY9)) ;; "To be included, the patient must have at least one of the following risk factors: ..."

(assert
  (! patients_risk_factor_is_positive_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one of the following risk factors: ..."
