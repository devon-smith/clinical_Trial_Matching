;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute heart failure.","meaning":"Boolean indicating whether the patient currently has acute heart failure."} ;; "acute heart failure"
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypotension (low blood pressure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypotension (low blood pressure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypotension (low blood pressure).","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure)."} ;; "hypotension (systolic blood pressure < 90 mmHg)"
(declare-const systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current systolic blood pressure in mmHg if available.","when_to_set_to_null":"Set to null if the patient's current systolic blood pressure value in mmHg is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current systolic blood pressure measured in millimeters of mercury (mmHg)."} ;; "systolic blood pressure < 90 mmHg"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have cardiogenic shock
(assert
(! (not patient_has_finding_of_cardiogenic_shock_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiogenic shock."

;; Exclusion: patient must NOT have acute heart failure
(assert
(! (not patient_has_finding_of_acute_heart_failure_now)
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute heart failure."

;; Exclusion: patient must NOT have hypotension (systolic blood pressure < 90 mmHg)
(assert
(! (not (and patient_has_finding_of_low_blood_pressure_now
             (< systolic_blood_pressure_value_recorded_now_withunit_mmhg 90)))
    :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypotension (systolic blood pressure < 90 mmHg)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_cardiac_ejection_fraction_value_recorded_inthehistory_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured ejection fraction percentage if a value is recorded at any time in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's ejection fraction (percent) recorded at any time in the past."} ;; "ejection fraction < 40% recorded at any time in the past"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_cardiac_ejection_fraction_value_recorded_inthehistory_withunit_percent 40))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previously known decreased ejection fraction (ejection fraction < 40%)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of atrial fibrillation."} ;; "atrial fibrillation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_atrial_fibrillation_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrial fibrillation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ischemia.","meaning":"Boolean indicating whether the patient currently has ischemia."} ;; "ischemia"
(declare-const patient_has_finding_of_ischemia_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ischemia is persistent.","when_to_set_to_false":"Set to false if the patient's current ischemia is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ischemia is persistent.","meaning":"Boolean indicating whether the patient's current ischemia is persistent."} ;; "persistent"
(declare-const patient_has_finding_of_ischemia_now@@post_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ischemia occurs after a myocardial infarction.","when_to_set_to_false":"Set to false if the patient's current ischemia does not occur after a myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ischemia occurs after a myocardial infarction.","meaning":"Boolean indicating whether the patient's current ischemia occurs after a myocardial infarction."} ;; "post-myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_ischemia_now@@persistent
       patient_has_finding_of_ischemia_now)
   :named REQ3_AUXILIARY0)) ;; "persistent signs and symptoms of post-myocardial infarction ischemia"

(assert
(! (=> patient_has_finding_of_ischemia_now@@post_myocardial_infarction
       patient_has_finding_of_ischemia_now)
   :named REQ3_AUXILIARY1)) ;; "post-myocardial infarction ischemia"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have persistent signs and symptoms of post-myocardial infarction ischemia
(assert
(! (not (and patient_has_finding_of_ischemia_now@@persistent
             patient_has_finding_of_ischemia_now@@post_myocardial_infarction))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has persistent signs and symptoms of post-myocardial infarction ischemia."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's blood pressure is recorded now in mm Hg.","when_to_set_to_null":"Set to null if no blood pressure measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood pressure in mm Hg."} ;; "blood pressure"
(declare-const patient_requires_vasopressor_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires vasopressor therapy.","when_to_set_to_false":"Set to false if the patient currently does not require vasopressor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires vasopressor therapy.","meaning":"Boolean indicating whether the patient currently requires vasopressor therapy."} ;; "requires vasopressor therapy"
(declare-const patient_requires_vasopressor_therapy_now@@for_maintenance_of_blood_pressure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current requirement for vasopressor therapy is specifically for maintenance of blood pressure.","when_to_set_to_false":"Set to false if the patient's current requirement for vasopressor therapy is not specifically for maintenance of blood pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current requirement for vasopressor therapy is specifically for maintenance of blood pressure.","meaning":"Boolean indicating whether the patient's current requirement for vasopressor therapy is specifically for maintenance of blood pressure."} ;; "requires vasopressor therapy for maintenance of blood pressure"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_requires_vasopressor_therapy_now@@for_maintenance_of_blood_pressure
      patient_requires_vasopressor_therapy_now)
:named REQ4_AUXILIARY0)) ;; "requires vasopressor therapy for maintenance of blood pressure""

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_requires_vasopressor_therapy_now@@for_maintenance_of_blood_pressure)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires vasopressor therapy for maintenance of blood pressure."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_undergoing_cardioassist_by_aortic_balloon_pump_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing cardiac assistance by intra-aortic balloon pump.","when_to_set_to_false":"Set to false if the patient is currently not undergoing cardiac assistance by intra-aortic balloon pump.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing cardiac assistance by intra-aortic balloon pump.","meaning":"Boolean indicating whether the patient is currently undergoing cardiac assistance by intra-aortic balloon pump."} ;; "intra-aortic balloon pump"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_undergoing_cardioassist_by_aortic_balloon_pump_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses an intra-aortic balloon pump."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_heart_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart valve stenosis.","meaning":"Boolean indicating whether the patient currently has heart valve stenosis."} ;; "valvular stenosis"
(declare-const patient_has_finding_of_heart_valve_stenosis_now@@significant_moderate_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart valve stenosis is significant (moderate-severe) in degree.","when_to_set_to_false":"Set to false if the patient's current heart valve stenosis is not significant (not moderate-severe) in degree.","when_to_set_to_null":"Set to null if the degree of the patient's current heart valve stenosis is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's current heart valve stenosis is significant (moderate-severe) in degree."} ;; "significant (moderate-severe) valvular stenosis"
(declare-const patient_has_finding_of_hypertrophic_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypertrophic cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypertrophic cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypertrophic cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has hypertrophic cardiomyopathy."} ;; "hypertrophic cardiomyopathy"
(declare-const patient_has_finding_of_restrictive_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of restrictive cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of restrictive cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of restrictive cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has restrictive cardiomyopathy."} ;; "restrictive cardiomyopathy"
(declare-const patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypertrophic obstructive cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypertrophic obstructive cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypertrophic obstructive cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has hypertrophic obstructive cardiomyopathy."} ;; "obstructive cardiomyopathy"
(declare-const patient_has_finding_of_obstructive_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has obstructive cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have obstructive cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obstructive cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has obstructive cardiomyopathy."} ;; "obstructive cardiomyopathy"
(declare-const patient_has_finding_of_constrictive_pericarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of constrictive pericarditis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of constrictive pericarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of constrictive pericarditis.","meaning":"Boolean indicating whether the patient currently has constrictive pericarditis."} ;; "constrictive pericarditis"
(declare-const patient_has_finding_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary hypertension."} ;; "pulmonary hypertension"
(declare-const patient_has_finding_of_pulmonary_hypertension_now@@primary Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pulmonary hypertension is primary in etiology.","when_to_set_to_false":"Set to false if the patient's current pulmonary hypertension is not primary in etiology (i.e., secondary).","when_to_set_to_null":"Set to null if the etiology of the patient's current pulmonary hypertension is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's current pulmonary hypertension is primary in etiology."} ;; "primary pulmonary hypertension"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable for valvular stenosis
(assert
(! (=> patient_has_finding_of_heart_valve_stenosis_now@@significant_moderate_severe
      patient_has_finding_of_heart_valve_stenosis_now)
    :named REQ6_AUXILIARY0)) ;; "significant (moderate-severe) valvular stenosis"

;; Qualifier variable implies corresponding stem variable for pulmonary hypertension
(assert
(! (=> patient_has_finding_of_pulmonary_hypertension_now@@primary
      patient_has_finding_of_pulmonary_hypertension_now)
    :named REQ6_AUXILIARY1)) ;; "primary pulmonary hypertension"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_heart_valve_stenosis_now@@significant_moderate_severe)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant (moderate-severe) valvular stenosis."

(assert
(! (not patient_has_finding_of_hypertrophic_cardiomyopathy_now)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypertrophic cardiomyopathy."

(assert
(! (not patient_has_finding_of_restrictive_cardiomyopathy_now)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has restrictive cardiomyopathy."

(assert
(! (not (or patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now
            patient_has_finding_of_obstructive_cardiomyopathy_now))
    :named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has obstructive cardiomyopathy."

(assert
(! (not patient_has_finding_of_constrictive_pericarditis_now)
    :named REQ6_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has constrictive pericarditis."

(assert
(! (not patient_has_finding_of_pulmonary_hypertension_now@@primary)
    :named REQ6_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has primary pulmonary hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of congenital heart disease.","meaning":"Boolean indicating whether the patient currently has congenital heart disease."} ;; "congenital heart disease"
(declare-const patient_has_finding_of_congenital_heart_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congenital heart disease is severe.","when_to_set_to_false":"Set to false if the patient's congenital heart disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congenital heart disease is severe.","meaning":"Boolean indicating whether the patient's congenital heart disease is severe."} ;; "severe congenital heart disease"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_congenital_heart_disease_now@@severe
      patient_has_finding_of_congenital_heart_disease_now)
:named REQ7_AUXILIARY0)) ;; "severe congenital heart disease"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_congenital_heart_disease_now@@severe)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe congenital heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_sustained_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sustained ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sustained ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sustained ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has sustained ventricular tachycardia."} ;; "sustained ventricular tachycardia"
(declare-const patient_has_finding_of_ventricular_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventricular fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventricular fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ventricular fibrillation.","meaning":"Boolean indicating whether the patient currently has ventricular fibrillation."} ;; "ventricular fibrillation"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_sustained_ventricular_tachycardia_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sustained ventricular tachycardia."

(assert
(! (not patient_has_finding_of_ventricular_fibrillation_now)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ventricular fibrillation."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_second_degree_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of second degree atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of second degree atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of second degree atrioventricular block.","meaning":"Boolean indicating whether the patient currently has second degree atrioventricular block."} ;; "second degree heart block"
(declare-const patient_has_finding_of_complete_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of third degree (complete) atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of third degree (complete) atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of third degree (complete) atrioventricular block.","meaning":"Boolean indicating whether the patient currently has third degree (complete) atrioventricular block."} ;; "third degree heart block"
(declare-const patient_has_permanent_cardiac_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a permanent cardiac pacemaker implanted.","when_to_set_to_false":"Set to false if the patient currently does not have a permanent cardiac pacemaker implanted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a permanent cardiac pacemaker implanted.","meaning":"Boolean indicating whether the patient currently has a permanent cardiac pacemaker."} ;; "permanent cardiac pacemaker"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (and patient_has_finding_of_second_degree_atrioventricular_block_now
             (not patient_has_permanent_cardiac_pacemaker_now)))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has second degree heart block AND the patient does NOT have a permanent cardiac pacemaker."

(assert
(! (not (and patient_has_finding_of_complete_atrioventricular_block_now
             (not patient_has_permanent_cardiac_pacemaker_now)))
   :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has third degree heart block AND the patient does NOT have a permanent cardiac pacemaker."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within the past 3 months.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident (stroke) within the past 3 months."} ;; "stroke within the last 3 months"

(declare-const patient_has_finding_of_significantly_compromised_central_nervous_system_perfusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other evidence of significantly compromised central nervous system perfusion.","when_to_set_to_false":"Set to false if the patient currently does not have other evidence of significantly compromised central nervous system perfusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other evidence of significantly compromised central nervous system perfusion.","meaning":"Boolean indicating whether the patient currently has other evidence of significantly compromised central nervous system perfusion."} ;; "other evidence of significantly compromised central nervous system perfusion"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthepast3months)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a stroke within the last 3 months."

(assert
(! (not patient_has_finding_of_significantly_compromised_central_nervous_system_perfusion_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other evidence of significantly compromised central nervous system perfusion."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_bilirubin_total_measurement_value_recorded_inthepast7days_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total bilirubin concentration was measured within the past 7 days and the value is available in milligrams per deciliter.","when_to_set_to_null":"Set to null if no measurement of total bilirubin concentration within the past 7 days is available or the value is indeterminate.","meaning":"Numeric value of the patient's total bilirubin concentration measured within the past 7 days, in milligrams per deciliter."} ;; "total bilirubin concentration > 2.5 milligrams per deciliter, if available clinically and measured within the last 7 days"

(declare-const patient_liver_enzyme_levels_finding_value_recorded_inthepast7days_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's liver enzyme concentrations were measured within the past 7 days and the value is available as times the upper limit of normal.","when_to_set_to_null":"Set to null if no measurement of liver enzyme concentrations within the past 7 days is available, the value is indeterminate, or the measurement is not clinically available.","meaning":"Numeric value of the patient's liver enzyme concentrations measured within the past 7 days, expressed as times the upper limit of normal."} ;; "other liver enzyme concentrations > 2.5 times the upper limit of normal, if available clinically and measured within the last 7 days"

(declare-const patient_liver_enzyme_levels_finding_value_recorded_inthepast7days_withunit_times_upper_limit_of_normal@@available_clinically Bool) ;; {"when_to_set_to_true":"Set to true if the measurement of liver enzyme concentrations is clinically available.","when_to_set_to_false":"Set to false if the measurement of liver enzyme concentrations is not clinically available.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement is clinically available.","meaning":"Boolean indicating whether the measurement of liver enzyme concentrations is clinically available."} ;; "if available clinically"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (or
           (> patient_bilirubin_total_measurement_value_recorded_inthepast7days_withunit_milligrams_per_deciliter 2.5)
           (and patient_liver_enzyme_levels_finding_value_recorded_inthepast7days_withunit_times_upper_limit_of_normal@@available_clinically
                (> patient_liver_enzyme_levels_finding_value_recorded_inthepast7days_withunit_times_upper_limit_of_normal 2.5))
        ))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a total bilirubin concentration > 2.5 milligrams per deciliter, if available clinically and measured within the last 7 days) OR (the patient has other liver enzyme concentrations > 2.5 times the upper limit of normal, if available clinically and measured within the last 7 days))."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current glomerular filtration rate (GFR) in milliliters, calculated by the MDRD equation, is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current glomerular filtration rate (GFR) in milliliters."} ;; "calculated glomerular filtration rate < 30 milliliters by Modification of Diet in Renal Disease equation"
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters@@calculated_by_modification_of_diet_in_renal_disease_equation Bool) ;; {"when_to_set_to_true":"Set to true if the GFR value is calculated by the MDRD equation.","when_to_set_to_false":"Set to false if the GFR value is not calculated by the MDRD equation.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the GFR value was calculated by the MDRD equation.","meaning":"Boolean indicating whether the GFR value was calculated by the MDRD equation."} ;; "by Modification of Diet in Renal Disease equation"
(declare-const patient_creatinine_value_recorded_inthepast7days_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's plasma creatinine concentration in milligrams per deciliter was measured within the past 7 days.","when_to_set_to_null":"Set to null if no such measurement within the past 7 days is available or the value is indeterminate.","meaning":"Numeric value representing the patient's plasma creatinine concentration measured within the past 7 days in milligrams per deciliter."} ;; "plasma creatinine concentration measured within the last 7 days"
(declare-const patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current plasma creatinine concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current plasma creatinine concentration in milligrams per deciliter."} ;; "current plasma creatinine concentration"
(declare-const patient_has_finding_of_acute_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute kidney injury (AKI).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute kidney injury (AKI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute kidney injury (AKI).","meaning":"Boolean indicating whether the patient currently has acute kidney injury (AKI)."} ;; "acute kidney injury"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Definition of acute kidney injury as per requirement
(assert
(! (= patient_has_finding_of_acute_renal_failure_syndrome_now
    (>= (- patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter
           patient_creatinine_value_recorded_inthepast7days_withunit_milligrams_per_deciliter) 0.5))
:named REQ12_AUXILIARY0)) ;; "acute kidney injury as defined by an increase of plasma creatinine concentration of 0.5 milligrams per deciliter from a plasma creatinine concentration measured within the last 7 days"

;; Qualifier variable implies GFR value is calculated by MDRD equation
(assert
(! (=> patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters@@calculated_by_modification_of_diet_in_renal_disease_equation
      true)
:named REQ12_AUXILIARY1)) ;; "by Modification of Diet in Renal Disease equation"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: patient must NOT have GFR < 30 ml by MDRD equation OR acute kidney injury as defined
(assert
(! (not (or
    (and
        patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters@@calculated_by_modification_of_diet_in_renal_disease_equation
        (< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters 30))
    patient_has_finding_of_acute_renal_failure_syndrome_now))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a calculated glomerular filtration rate < 30 milliliters by Modification of Diet in Renal Disease equation) OR (the patient has acute kidney injury as defined by an increase of plasma creatinine concentration of 0.5 milligrams per deciliter from a plasma creatinine concentration measured within the last 7 days))."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_sodium_measurement_serum_value_recorded_inthepast7days_withunit_milliequivalents_per_liter Real) ;; {"when_to_set_to_value":"Set to the most recent measured value of the patient's serum sodium concentration (in milliequivalents per liter) if a clinical measurement is available and was performed within the past 7 days.","when_to_set_to_null":"Set to null if no clinical measurement of serum sodium concentration is available within the past 7 days or if the value is indeterminate.","meaning":"Numeric value for the patient's serum sodium concentration (mEq/L) measured within the past 7 days."} ;; "serum sodium concentration < 125 milliequivalents per liter, if available clinically and measured within the last 7 days" and "serum sodium concentration > 160 milliequivalents per liter, if available clinically and measured within the last 7 days"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (< patient_sodium_measurement_serum_value_recorded_inthepast7days_withunit_milliequivalents_per_liter 125))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serum sodium concentration < 125 milliequivalents per liter, if available clinically and measured within the last 7 days."

(assert
(! (not (> patient_sodium_measurement_serum_value_recorded_inthepast7days_withunit_milliequivalents_per_liter 160))
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serum sodium concentration > 160 milliequivalents per liter, if available clinically and measured within the last 7 days."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_serum_potassium_measurement_value_recorded_inthepast7days_withunit_milliequivalents_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a serum potassium concentration in milliequivalents per liter is available and was recorded within the past 7 days.","when_to_set_to_null":"Set to null if no such measurement is available, not clinically accessible, or not recorded within the past 7 days.","meaning":"Numeric value for the patient's serum potassium concentration measured within the past 7 days, in milliequivalents per liter."} ;; "serum potassium concentration < 3.0 milliequivalents per liter, if available clinically and measured within the last 7 days" and "serum potassium concentration > 5.8 milliequivalents per liter, if available clinically and measured within the last 7 days"
(declare-const patient_serum_potassium_measurement_value_recorded_inthepast7days_withunit_milliequivalents_per_liter@@available_clinically Bool) ;; {"when_to_set_to_true":"Set to true if the serum potassium measurement is clinically available.","when_to_set_to_false":"Set to false if the serum potassium measurement is not clinically available.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement is clinically available.","meaning":"Boolean indicating whether the serum potassium measurement is clinically available."} ;; "if available clinically"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (or
  (and patient_serum_potassium_measurement_value_recorded_inthepast7days_withunit_milliequivalents_per_liter@@available_clinically
       (< patient_serum_potassium_measurement_value_recorded_inthepast7days_withunit_milliequivalents_per_liter 3.0))
  (and patient_serum_potassium_measurement_value_recorded_inthepast7days_withunit_milliequivalents_per_liter@@available_clinically
       (> patient_serum_potassium_measurement_value_recorded_inthepast7days_withunit_milliequivalents_per_liter 5.8))
))
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a serum potassium concentration < 3.0 milliequivalents per liter, if available clinically and measured within the last 7 days) OR (the patient has a serum potassium concentration > 5.8 milliequivalents per liter, if available clinically and measured within the last 7 days))."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_inthepast7days_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a hemoglobin concentration (g/dL) is available from a clinical measurement within the last 7 days.","when_to_set_to_null":"Set to null if no hemoglobin concentration measurement is available within the last 7 days or if the value is indeterminate.","meaning":"Numeric value for the patient's hemoglobin concentration measured within the last 7 days, in grams per deciliter."} ;; "hemoglobin concentration < 8.5 grams per deciliter, if available clinically and measured within the last 7 days."
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_inthepast7days_withunit_grams_per_deciliter@@available_clinically Bool) ;; {"when_to_set_to_true":"Set to true if the hemoglobin concentration measurement within the last 7 days is available from a clinical source.","when_to_set_to_false":"Set to false if the measurement is not available from a clinical source (e.g., only from research or non-clinical data).","when_to_set_to_null":"Set to null if it is unknown whether the measurement is available clinically.","meaning":"Boolean indicating whether the hemoglobin concentration measurement within the last 7 days is available from a clinical source."} ;; "if available clinically"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not (and patient_hemoglobin_concentration_dipstick_finding_value_recorded_inthepast7days_withunit_grams_per_deciliter@@available_clinically
             (< patient_hemoglobin_concentration_dipstick_finding_value_recorded_inthepast7days_withunit_grams_per_deciliter 8.5)))
   :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a hemoglobin concentration < 8.5 grams per deciliter, if available clinically and measured within the last 7 days)."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_other_acute_medical_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other acute medical conditions.","when_to_set_to_false":"Set to false if the patient currently does not have other acute medical conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other acute medical conditions.","meaning":"Boolean indicating whether the patient currently has other acute medical conditions."} ;; "other acute medical conditions"
(declare-const patient_has_other_acute_medical_conditions_now@@may_increase_risks_or_interfere_with_data_interpretation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's other acute medical conditions may increase the risks associated with study participation or may interfere with interpretation of the data.","when_to_set_to_false":"Set to false if the patient's other acute medical conditions do not increase the risks associated with study participation and do not interfere with interpretation of the data.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's other acute medical conditions may increase the risks associated with study participation or may interfere with interpretation of the data.","meaning":"Boolean indicating whether the patient's other acute medical conditions may increase the risks associated with study participation or may interfere with interpretation of the data."} ;; "may increase the risks associated with study participation OR may interfere with interpretation of the data"
(declare-const patient_has_other_chronic_medical_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other chronic medical conditions.","when_to_set_to_false":"Set to false if the patient currently does not have other chronic medical conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other chronic medical conditions.","meaning":"Boolean indicating whether the patient currently has other chronic medical conditions."} ;; "other chronic medical conditions"
(declare-const patient_has_other_chronic_medical_conditions_now@@may_increase_risks_or_interfere_with_data_interpretation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's other chronic medical conditions may increase the risks associated with study participation or may interfere with interpretation of the data.","when_to_set_to_false":"Set to false if the patient's other chronic medical conditions do not increase the risks associated with study participation and do not interfere with interpretation of the data.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's other chronic medical conditions may increase the risks associated with study participation or may interfere with interpretation of the data.","meaning":"Boolean indicating whether the patient's other chronic medical conditions may increase the risks associated with study participation or may interfere with interpretation of the data."} ;; "may increase the risks associated with study participation OR may interfere with interpretation of the data"
(declare-const patient_has_laboratory_abnormalities_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has laboratory abnormalities.","when_to_set_to_false":"Set to false if the patient currently does not have laboratory abnormalities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has laboratory abnormalities.","meaning":"Boolean indicating whether the patient currently has laboratory abnormalities."} ;; "laboratory abnormalities"
(declare-const patient_has_laboratory_abnormalities_now@@may_increase_risks_or_interfere_with_data_interpretation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's laboratory abnormalities may increase the risks associated with study participation or may interfere with interpretation of the data.","when_to_set_to_false":"Set to false if the patient's laboratory abnormalities do not increase the risks associated with study participation and do not interfere with interpretation of the data.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's laboratory abnormalities may increase the risks associated with study participation or may interfere with interpretation of the data.","meaning":"Boolean indicating whether the patient's laboratory abnormalities may increase the risks associated with study participation or may interfere with interpretation of the data."} ;; "may increase the risks associated with study participation OR may interfere with interpretation of the data"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_other_acute_medical_conditions_now@@may_increase_risks_or_interfere_with_data_interpretation
      patient_has_other_acute_medical_conditions_now)
    :named REQ16_AUXILIARY0)) ;; "other acute medical conditions which may increase the risks associated with study participation OR may interfere with interpretation of the data"

(assert
(! (=> patient_has_other_chronic_medical_conditions_now@@may_increase_risks_or_interfere_with_data_interpretation
      patient_has_other_chronic_medical_conditions_now)
    :named REQ16_AUXILIARY1)) ;; "other chronic medical conditions which may increase the risks associated with study participation OR may interfere with interpretation of the data"

(assert
(! (=> patient_has_laboratory_abnormalities_now@@may_increase_risks_or_interfere_with_data_interpretation
      patient_has_laboratory_abnormalities_now)
    :named REQ16_AUXILIARY2)) ;; "laboratory abnormalities which may increase the risks associated with study participation OR may interfere with interpretation of the data"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_other_acute_medical_conditions_now@@may_increase_risks_or_interfere_with_data_interpretation)
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other acute medical conditions which may increase the risks associated with study participation OR may interfere with interpretation of the data."

(assert
(! (not patient_has_other_chronic_medical_conditions_now@@may_increase_risks_or_interfere_with_data_interpretation)
    :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other chronic medical conditions which may increase the risks associated with study participation OR may interfere with interpretation of the data."

(assert
(! (not patient_has_laboratory_abnormalities_now@@may_increase_risks_or_interfere_with_data_interpretation)
    :named REQ16_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has laboratory abnormalities which may increase the risks associated with study participation OR may interfere with interpretation of the data."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past 1 month.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past 1 month.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past 1 month."} ;; "has received an investigational drug within 1 month prior to dosing"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast1months@@drug_is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to within the past 1 month is investigational.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to within the past 1 month is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament the patient was exposed to within the past 1 month is investigational."} ;; "has received an investigational drug within 1 month prior to dosing"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast1months@@drug_is_investigational
      patient_is_exposed_to_drug_or_medicament_inthepast1months)
:named REQ17_AUXILIARY0)) ;; "drug_is_investigational qualifier refers to exposure to drug or medicament within past 1 month"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast1months@@drug_is_investigational)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received an investigational drug within 1 month prior to dosing."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "the patient is a female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently documented as not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a female who is pregnant."

(assert
(! (not (and patient_sex_is_female_now patient_is_breastfeeding_now))
:named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a female who is breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_is_unlikely_to_comply_with_study_protocol_investigator_opinion_now Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the investigator, the patient is currently unlikely to comply with the study protocol.","when_to_set_to_false":"Set to false if, in the opinion of the investigator, the patient is currently likely to comply with the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the investigator, the patient is currently unlikely to comply with the study protocol.","meaning":"Boolean indicating whether, in the opinion of the investigator, the patient is currently unlikely to comply with the study protocol."} ;; "in the opinion of the investigator, the patient is unlikely to comply with the study protocol"

(declare-const patient_is_unsuitable_for_any_reason_investigator_opinion_now Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the investigator, the patient is currently unsuitable for any reason.","when_to_set_to_false":"Set to false if, in the opinion of the investigator, the patient is currently suitable for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the investigator, the patient is currently unsuitable for any reason.","meaning":"Boolean indicating whether, in the opinion of the investigator, the patient is currently unsuitable for any reason."} ;; "in the opinion of the investigator, the patient is unsuitable for any reason"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not (or patient_is_unlikely_to_comply_with_study_protocol_investigator_opinion_now
            patient_is_unsuitable_for_any_reason_investigator_opinion_now))
   :named REQ19_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if ((in the opinion of the investigator, the patient is unlikely to comply with the study protocol) OR (in the opinion of the investigator, the patient is unsuitable for any reason))."
