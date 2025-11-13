;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_diastolic_blood_pressure_value_recorded_inthepast1days_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured mean clinic diastolic blood pressure (sitting, trough) value in millimeters of mercury if recorded on Day 1.","when_to_set_to_null":"Set to null if no such measurement is available for Day 1 or the value is indeterminate.","meaning":"Numeric value for the patient's mean clinic diastolic blood pressure (sitting, trough) on Day 1, in millimeters of mercury."} ;; "mean clinic diastolic blood pressure (sitting, trough) > 119 millimeters of mercury on Day 1."
(declare-const patient_diastolic_blood_pressure_value_recorded_inthepast1days_withunit_millimeters_of_mercury@@mean_clinic_sitting_trough Bool) ;; {"when_to_set_to_true":"Set to true if the recorded diastolic blood pressure value is the mean clinic measurement taken while sitting at trough on Day 1.","when_to_set_to_false":"Set to false if the recorded value is not the mean clinic sitting trough measurement on Day 1.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement is the mean clinic sitting trough value on Day 1.","meaning":"Boolean indicating whether the diastolic blood pressure value is the mean clinic sitting trough measurement on Day 1."} ;; "mean clinic diastolic blood pressure (sitting, trough) > 119 millimeters of mercury on Day 1."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and
            patient_diastolic_blood_pressure_value_recorded_inthepast1days_withunit_millimeters_of_mercury@@mean_clinic_sitting_trough
            (> patient_diastolic_blood_pressure_value_recorded_inthepast1days_withunit_millimeters_of_mercury 119)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mean clinic diastolic blood pressure (sitting, trough) > 119 millimeters of mercury on Day 1."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of secondary hypertension of any etiology.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of secondary hypertension of any etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary hypertension.","meaning":"Boolean indicating whether the patient currently has secondary hypertension of any etiology."} ;; "secondary hypertension of any etiology"
(declare-const patient_has_finding_of_renal_vascular_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of renovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of renovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renovascular disease.","meaning":"Boolean indicating whether the patient currently has renovascular disease."} ;; "renovascular disease"
(declare-const patient_has_finding_of_pheochromocytoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of pheochromocytoma.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of pheochromocytoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pheochromocytoma.","meaning":"Boolean indicating whether the patient currently has pheochromocytoma."} ;; "pheochromocytoma"
(declare-const patient_has_finding_of_hypercortisolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of Cushing's syndrome (hypercortisolism).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of Cushing's syndrome (hypercortisolism).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Cushing's syndrome (hypercortisolism).","meaning":"Boolean indicating whether the patient currently has Cushing's syndrome (hypercortisolism)."} ;; "Cushing's syndrome"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_renal_vascular_disorder_now
          patient_has_finding_of_pheochromocytoma_now
          patient_has_finding_of_hypercortisolism_now)
     patient_has_finding_of_secondary_hypertension_now)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((renovascular disease) OR (pheochromocytoma) OR (Cushing's syndrome))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_secondary_hypertension_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hypertension of any etiology with non-exhaustive examples ((renovascular disease) OR (pheochromocytoma) OR (Cushing's syndrome))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past 6 months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past 6 months."} ;; "recent history (within the last 6 months) of myocardial infarction"
(declare-const patient_has_finding_of_heart_failure_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had heart failure within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had heart failure within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had heart failure within the past 6 months.","meaning":"Boolean indicating whether the patient has had heart failure within the past 6 months."} ;; "recent history (within the last 6 months) of heart failure"
(declare-const patient_has_finding_of_preinfarction_syndrome_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had unstable angina (preinfarction syndrome) within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had unstable angina (preinfarction syndrome) within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had unstable angina (preinfarction syndrome) within the past 6 months.","meaning":"Boolean indicating whether the patient has had unstable angina (preinfarction syndrome) within the past 6 months."} ;; "recent history (within the last 6 months) of unstable angina"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass graft within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone coronary artery bypass graft within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary artery bypass graft within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone coronary artery bypass graft within the past 6 months."} ;; "recent history (within the last 6 months) of coronary artery bypass graft"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous coronary intervention within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention within the past 6 months."} ;; "recent history (within the last 6 months) of percutaneous coronary intervention"
(declare-const patient_has_finding_of_hypertensive_encephalopathy_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had hypertensive encephalopathy within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had hypertensive encephalopathy within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had hypertensive encephalopathy within the past 6 months.","meaning":"Boolean indicating whether the patient has had hypertensive encephalopathy within the past 6 months."} ;; "recent history (within the last 6 months) of hypertensive encephalopathy"
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident within the past 6 months.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident within the past 6 months."} ;; "recent history (within the last 6 months) of cerebrovascular accident"
(declare-const patient_has_finding_of_transient_cerebral_ischemia_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a transient ischemic attack within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a transient ischemic attack within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a transient ischemic attack within the past 6 months.","meaning":"Boolean indicating whether the patient has had a transient ischemic attack within the past 6 months."} ;; "recent history (within the last 6 months) of transient ischemic attack"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast6months)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history (within the last 6 months) of myocardial infarction."

(assert
(! (not patient_has_finding_of_heart_failure_inthepast6months)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history (within the last 6 months) of heart failure."

(assert
(! (not patient_has_finding_of_preinfarction_syndrome_inthepast6months)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history (within the last 6 months) of unstable angina."

(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthepast6months)
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history (within the last 6 months) of coronary artery bypass graft."

(assert
(! (not patient_has_undergone_percutaneous_coronary_intervention_inthepast6months)
:named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history (within the last 6 months) of percutaneous coronary intervention."

(assert
(! (not patient_has_finding_of_hypertensive_encephalopathy_inthepast6months)
:named REQ2_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history (within the last 6 months) of hypertensive encephalopathy."

(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthepast6months)
:named REQ2_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history (within the last 6 months) of cerebrovascular accident."

(assert
(! (not patient_has_finding_of_transient_cerebral_ischemia_inthepast6months)
:named REQ2_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history (within the last 6 months) of transient ischemic attack."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a conduction disorder of the heart.","when_to_set_to_false":"Set to false if the patient currently does not have a conduction disorder of the heart.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a conduction disorder of the heart.","meaning":"Boolean indicating whether the patient currently has a conduction disorder of the heart."} ;; "cardiac conduction defects"
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a conduction disorder of the heart and the disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has a conduction disorder of the heart but it is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the conduction disorder of the heart is clinically significant.","meaning":"Boolean indicating whether the patient's conduction disorder of the heart is clinically significant."} ;; "clinically significant cardiac conduction defects"
(declare-const patient_has_finding_of_complete_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a complete atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a complete atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a complete atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a complete atrioventricular block."} ;; "third-degree atrioventricular block"
(declare-const patient_has_finding_of_sick_sinus_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sick sinus syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have sick sinus syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sick sinus syndrome.","meaning":"Boolean indicating whether the patient currently has sick sinus syndrome."} ;; "sick sinus syndrome"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_complete_atrioventricular_block_now
           patient_has_finding_of_sick_sinus_syndrome_now)
       patient_has_finding_of_conduction_disorder_of_the_heart_now@@clinically_significant)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((third-degree atrioventricular block) OR (sick sinus syndrome))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_conduction_disorder_of_the_heart_now@@clinically_significant
       patient_has_finding_of_conduction_disorder_of_the_heart_now)
   :named REQ3_AUXILIARY1)) ;; "clinically significant cardiac conduction defects"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_conduction_disorder_of_the_heart_now@@clinically_significant)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant cardiac conduction defects with non-exhaustive examples ((third-degree atrioventricular block) OR (sick sinus syndrome))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left ventricular outflow tract obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left ventricular outflow tract obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular outflow tract obstruction.","meaning":"Boolean indicating whether the patient currently has left ventricular outflow tract obstruction."} ;; "left ventricular outflow obstruction"

(declare-const patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@hemodynamically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular outflow tract obstruction is hemodynamically significant.","when_to_set_to_false":"Set to false if the patient's left ventricular outflow tract obstruction is not hemodynamically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the obstruction is hemodynamically significant.","meaning":"Boolean indicating whether the patient's left ventricular outflow tract obstruction is hemodynamically significant."} ;; "hemodynamically significant left ventricular outflow obstruction"

(declare-const patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@due_to_aortic_valvular_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular outflow tract obstruction is due to aortic valvular disease.","when_to_set_to_false":"Set to false if the patient's left ventricular outflow tract obstruction is not due to aortic valvular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the obstruction is due to aortic valvular disease.","meaning":"Boolean indicating whether the patient's left ventricular outflow tract obstruction is due to aortic valvular disease."} ;; "left ventricular outflow obstruction due to aortic valvular disease"

(declare-const patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@hemodynamically_significant@@due_to_aortic_valvular_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left ventricular outflow tract obstruction, the obstruction is hemodynamically significant, and the obstruction is due to aortic valvular disease.","when_to_set_to_false":"Set to false if the patient currently does not have left ventricular outflow tract obstruction, or the obstruction is not hemodynamically significant, or the obstruction is not due to aortic valvular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular outflow tract obstruction, whether it is hemodynamically significant, or whether it is due to aortic valvular disease.","meaning":"Boolean indicating whether the patient currently has left ventricular outflow tract obstruction, and the obstruction is hemodynamically significant, and the obstruction is due to aortic valvular disease."} ;; "hemodynamically significant left ventricular outflow obstruction due to aortic valvular disease"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definitional: triple qualifier variable is true iff all three conditions are true
(assert
(! (= patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@hemodynamically_significant@@due_to_aortic_valvular_disease
     (and patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now
          patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@hemodynamically_significant
          patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@due_to_aortic_valvular_disease))
:named REQ4_AUXILIARY0)) ;; "hemodynamically significant left ventricular outflow obstruction due to aortic valvular disease."

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@hemodynamically_significant
       patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now)
:named REQ4_AUXILIARY1)) ;; "hemodynamically significant left ventricular outflow obstruction"

(assert
(! (=> patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@due_to_aortic_valvular_disease
       patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now)
:named REQ4_AUXILIARY2)) ;; "left ventricular outflow obstruction due to aortic valvular disease"

;; Triple qualifier implies both single qualifiers
(assert
(! (=> patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@hemodynamically_significant@@due_to_aortic_valvular_disease
       patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@hemodynamically_significant)
:named REQ4_AUXILIARY3)) ;; "hemodynamically significant left ventricular outflow obstruction due to aortic valvular disease"

(assert
(! (=> patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@hemodynamically_significant@@due_to_aortic_valvular_disease
       patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@due_to_aortic_valvular_disease)
:named REQ4_AUXILIARY4)) ;; "hemodynamically significant left ventricular outflow obstruction due to aortic valvular disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_left_ventricular_outflow_tract_obstruction_now@@hemodynamically_significant@@due_to_aortic_valvular_disease)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamically significant left ventricular outflow obstruction due to aortic valvular disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease (renal disease).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease (renal disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease (renal disease).","meaning":"Boolean indicating whether the patient currently has kidney disease (renal disease)."} ;; "renal disease"
(declare-const patient_has_finding_of_kidney_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current kidney disease (renal disease) is severe.","when_to_set_to_false":"Set to false if the patient's current kidney disease (renal disease) is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current kidney disease (renal disease) is severe.","meaning":"Boolean indicating whether the patient's current kidney disease (renal disease) is severe."} ;; "severe renal disease"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment (renal dysfunction).","meaning":"Boolean indicating whether the patient currently has renal impairment (renal dysfunction)."} ;; "renal dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal impairment (renal dysfunction) is severe.","when_to_set_to_false":"Set to false if the patient's current renal impairment (renal dysfunction) is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal impairment (renal dysfunction) is severe.","meaning":"Boolean indicating whether the patient's current renal impairment (renal dysfunction) is severe."} ;; "severe renal dysfunction"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_kidney_disease_now@@severe
       patient_has_finding_of_kidney_disease_now)
   :named REQ5_AUXILIARY0)) ;; "severe renal disease"

(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severe
       patient_has_finding_of_renal_impairment_now)
   :named REQ5_AUXILIARY1)) ;; "severe renal dysfunction"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_has_finding_of_renal_impairment_now@@severe
            patient_has_finding_of_kidney_disease_now@@severe))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has severe renal dysfunction) OR (the patient has severe renal disease)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has a finding of renal artery stenosis."} ;; "renal artery stenosis"
(declare-const patient_has_finding_of_renal_artery_stenosis_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal artery stenosis is known.","when_to_set_to_false":"Set to false if the patient's renal artery stenosis is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal artery stenosis is known.","meaning":"Boolean indicating whether the patient's renal artery stenosis is known."} ;; "known renal artery stenosis"
(declare-const patient_has_finding_of_renal_artery_stenosis_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal artery stenosis is suspected.","when_to_set_to_false":"Set to false if the patient's renal artery stenosis is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal artery stenosis is suspected.","meaning":"Boolean indicating whether the patient's renal artery stenosis is suspected."} ;; "suspected renal artery stenosis"
(declare-const patient_has_finding_of_renal_artery_stenosis_now@@unilateral Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal artery stenosis is unilateral.","when_to_set_to_false":"Set to false if the patient's renal artery stenosis is not unilateral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal artery stenosis is unilateral.","meaning":"Boolean indicating whether the patient's renal artery stenosis is unilateral."} ;; "unilateral renal artery stenosis"
(declare-const patient_has_finding_of_renal_artery_stenosis_now@@unilateral@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's unilateral renal artery stenosis is known.","when_to_set_to_false":"Set to false if the patient's unilateral renal artery stenosis is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's unilateral renal artery stenosis is known.","meaning":"Boolean indicating whether the patient's unilateral renal artery stenosis is known."} ;; "known unilateral renal artery stenosis"
(declare-const patient_has_finding_of_renal_artery_stenosis_now@@unilateral@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's unilateral renal artery stenosis is suspected.","when_to_set_to_false":"Set to false if the patient's unilateral renal artery stenosis is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's unilateral renal artery stenosis is suspected.","meaning":"Boolean indicating whether the patient's unilateral renal artery stenosis is suspected."} ;; "suspected unilateral renal artery stenosis"
(declare-const patient_has_finding_of_bilateral_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of bilateral renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of bilateral renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of bilateral renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has a finding of bilateral renal artery stenosis."} ;; "bilateral renal artery stenosis"
(declare-const patient_has_finding_of_bilateral_renal_artery_stenosis_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bilateral renal artery stenosis is known.","when_to_set_to_false":"Set to false if the patient's bilateral renal artery stenosis is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bilateral renal artery stenosis is known.","meaning":"Boolean indicating whether the patient's bilateral renal artery stenosis is known."} ;; "known bilateral renal artery stenosis"
(declare-const patient_has_finding_of_bilateral_renal_artery_stenosis_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bilateral renal artery stenosis is suspected.","when_to_set_to_false":"Set to false if the patient's bilateral renal artery stenosis is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bilateral renal artery stenosis is suspected.","meaning":"Boolean indicating whether the patient's bilateral renal artery stenosis is suspected."} ;; "suspected bilateral renal artery stenosis"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@known
      patient_has_finding_of_renal_artery_stenosis_now)
   :named REQ6_AUXILIARY0)) ;; "known renal artery stenosis"
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@suspected
      patient_has_finding_of_renal_artery_stenosis_now)
   :named REQ6_AUXILIARY1)) ;; "suspected renal artery stenosis"
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@unilateral
      patient_has_finding_of_renal_artery_stenosis_now)
   :named REQ6_AUXILIARY2)) ;; "unilateral renal artery stenosis"
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@unilateral@@known
      (and patient_has_finding_of_renal_artery_stenosis_now@@unilateral
           patient_has_finding_of_renal_artery_stenosis_now@@known))
   :named REQ6_AUXILIARY3)) ;; "known unilateral renal artery stenosis"
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@unilateral@@suspected
      (and patient_has_finding_of_renal_artery_stenosis_now@@unilateral
           patient_has_finding_of_renal_artery_stenosis_now@@suspected))
   :named REQ6_AUXILIARY4)) ;; "suspected unilateral renal artery stenosis"
(assert
(! (=> patient_has_finding_of_bilateral_renal_artery_stenosis_now@@known
      patient_has_finding_of_bilateral_renal_artery_stenosis_now)
   :named REQ6_AUXILIARY5)) ;; "known bilateral renal artery stenosis"
(assert
(! (=> patient_has_finding_of_bilateral_renal_artery_stenosis_now@@suspected
      patient_has_finding_of_bilateral_renal_artery_stenosis_now)
   :named REQ6_AUXILIARY6)) ;; "suspected bilateral renal artery stenosis"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_renal_artery_stenosis_now@@unilateral@@known)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known unilateral renal artery stenosis."
(assert
(! (not patient_has_finding_of_renal_artery_stenosis_now@@unilateral@@suspected)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected unilateral renal artery stenosis."
(assert
(! (not patient_has_finding_of_bilateral_renal_artery_stenosis_now@@known)
   :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known bilateral renal artery stenosis."
(assert
(! (not patient_has_finding_of_bilateral_renal_artery_stenosis_now@@suspected)
   :named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected bilateral renal artery stenosis."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const duration_of_cancer_remission_prior_to_first_dose_of_study_drug_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient's cancer has been in remission prior to the first dose of study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how long the patient's cancer has been in remission prior to the first dose of study drug.","meaning":"Numeric variable indicating the duration, in years, that the patient's cancer has been in remission prior to the first dose of study drug."} ;; "remission for ≥ 5 years prior to the first dose of study drug"

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer) in their history."} ;; "history of cancer"

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@not_in_remission_for_at_least_5_years_prior_to_first_dose_of_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of malignant neoplastic disease (cancer) and the cancer has NOT been in remission for at least 5 years prior to the first dose of study drug.","when_to_set_to_false":"Set to false if the patient has a history of malignant neoplastic disease (cancer) and the cancer has been in remission for at least 5 years prior to the first dose of study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cancer has been in remission for at least 5 years prior to the first dose of study drug.","meaning":"Boolean indicating whether the patient's history of malignant neoplastic disease (cancer) has NOT been in remission for at least 5 years prior to the first dose of study drug."} ;; "history of cancer that has NOT been in remission for ≥ 5 years prior to the first dose of study drug"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Definition of the qualifier variable: not in remission for at least 5 years prior to first dose
(assert
(! (= patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@not_in_remission_for_at_least_5_years_prior_to_first_dose_of_study_drug
     (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
          (< duration_of_cancer_remission_prior_to_first_dose_of_study_drug_in_years 5)))
:named REQ7_AUXILIARY0)) ;; "history of cancer that has NOT been in remission for ≥ 5 years prior to the first dose of study drug."

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@not_in_remission_for_at_least_5_years_prior_to_first_dose_of_study_drug
       patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
:named REQ7_AUXILIARY1)) ;; "history of cancer that has NOT been in remission for ≥ 5 years prior to the first dose of study drug."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@not_in_remission_for_at_least_5_years_prior_to_first_dose_of_study_drug)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of cancer that has NOT been in remission for ≥ 5 years prior to the first dose of study drug."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_type_1_diabetes_mellitus_uncontrolled_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poorly-controlled type 1 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poorly-controlled type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of poorly-controlled type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has poorly-controlled type 1 diabetes mellitus."} ;; "poorly-controlled type 1 diabetes mellitus"
(declare-const patient_has_finding_of_type_1_diabetes_mellitus_uncontrolled_now@@present_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poorly-controlled type 1 diabetes mellitus and this finding is present at the Screening visit.","when_to_set_to_false":"Set to false if the patient currently has poorly-controlled type 1 diabetes mellitus but it is not present at the Screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is present at the Screening visit.","meaning":"Boolean indicating whether the finding is present at the Screening visit."} ;; "poorly-controlled type 1 diabetes mellitus at Screening"
(declare-const patient_has_finding_of_type_ii_diabetes_mellitus_uncontrolled_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poorly-controlled type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poorly-controlled type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of poorly-controlled type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has poorly-controlled type 2 diabetes mellitus."} ;; "poorly-controlled type 2 diabetes mellitus"
(declare-const patient_has_finding_of_type_ii_diabetes_mellitus_uncontrolled_now@@present_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poorly-controlled type 2 diabetes mellitus and this finding is present at the Screening visit.","when_to_set_to_false":"Set to false if the patient currently has poorly-controlled type 2 diabetes mellitus but it is not present at the Screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is present at the Screening visit.","meaning":"Boolean indicating whether the finding is present at the Screening visit."} ;; "poorly-controlled type 2 diabetes mellitus at Screening"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable for type 1 diabetes
(assert
(! (=> patient_has_finding_of_type_1_diabetes_mellitus_uncontrolled_now@@present_at_screening
      patient_has_finding_of_type_1_diabetes_mellitus_uncontrolled_now)
    :named REQ8_AUXILIARY0)) ;; "poorly-controlled type 1 diabetes mellitus at Screening"

;; Qualifier variable implies corresponding stem variable for type 2 diabetes
(assert
(! (=> patient_has_finding_of_type_ii_diabetes_mellitus_uncontrolled_now@@present_at_screening
      patient_has_finding_of_type_ii_diabetes_mellitus_uncontrolled_now)
    :named REQ8_AUXILIARY1)) ;; "poorly-controlled type 2 diabetes mellitus at Screening"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_type_1_diabetes_mellitus_uncontrolled_now@@present_at_screening)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poorly-controlled type 1 diabetes mellitus at Screening."

(assert
(! (not patient_has_finding_of_type_ii_diabetes_mellitus_uncontrolled_now@@present_at_screening)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poorly-controlled type 2 diabetes mellitus at Screening."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_hypokalemia_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has hypokalemia at the time of Screening.","when_to_set_to_false":"Set to false if the patient does not have hypokalemia at the time of Screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has hypokalemia at the time of Screening.","meaning":"Boolean indicating whether the patient has hypokalemia at the time of Screening."} ;; "the patient has hypokalemia at Screening"
(declare-const patient_has_finding_of_hyperkalemia_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has hyperkalemia at the time of Screening.","when_to_set_to_false":"Set to false if the patient does not have hyperkalemia at the time of Screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has hyperkalemia at the time of Screening.","meaning":"Boolean indicating whether the patient has hyperkalemia at the time of Screening."} ;; "the patient has hyperkalemia at Screening"
(declare-const patient_has_finding_of_hypokalemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypokalemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypokalemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypokalemia.","meaning":"Boolean indicating whether the patient currently has hypokalemia."} ;; "hypokalemia"
(declare-const patient_has_finding_of_hyperkalemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperkalemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperkalemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperkalemia.","meaning":"Boolean indicating whether the patient currently has hyperkalemia."} ;; "hyperkalemia"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_hypokalemia_at_screening)
:named REQ9_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has hypokalemia at Screening."

(assert
(! (not patient_has_finding_of_hyperkalemia_at_screening)
:named REQ9_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has hyperkalemia at Screening."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's alanine aminotransferase level is recorded at Screening.","when_to_set_to_null":"Set to null if no alanine aminotransferase measurement is available at Screening or the value is indeterminate.","meaning":"Numeric value representing the patient's alanine aminotransferase measurement at Screening."} ;; "alanine aminotransferase level > 2.5 × the upper limit of normal at Screening"
(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's aspartate aminotransferase level is recorded at Screening.","when_to_set_to_null":"Set to null if no aspartate aminotransferase measurement is available at Screening or the value is indeterminate.","meaning":"Numeric value representing the patient's aspartate aminotransferase measurement at Screening."} ;; "aspartate aminotransferase level > 2.5 × the upper limit of normal at Screening"
(declare-const patient_has_active_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has active liver disease at Screening.","when_to_set_to_false":"Set to false if the patient does not have active liver disease at Screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has active liver disease at Screening.","meaning":"Boolean indicating whether the patient has active liver disease at Screening."} ;; "active liver disease at Screening"
(declare-const patient_has_finding_of_jaundice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has jaundice at Screening.","when_to_set_to_false":"Set to false if the patient does not have jaundice at Screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has jaundice at Screening.","meaning":"Boolean indicating whether the patient has jaundice at Screening."} ;; "jaundice at Screening"
(declare-const upper_limit_of_normal_for_alanine_aminotransferase_at_screening Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for alanine aminotransferase at Screening, as defined by the laboratory.","when_to_set_to_null":"Set to null if the upper limit of normal is not available or indeterminate at Screening.","meaning":"Numeric value for the upper limit of normal for alanine aminotransferase at Screening."} ;; "2.5 × the upper limit of normal at Screening"
(declare-const upper_limit_of_normal_for_aspartate_aminotransferase_at_screening Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for aspartate aminotransferase at Screening, as defined by the laboratory.","when_to_set_to_null":"Set to null if the upper limit of normal is not available or indeterminate at Screening.","meaning":"Numeric value for the upper limit of normal for aspartate aminotransferase at Screening."} ;; "2.5 × the upper limit of normal at Screening"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (> patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
           (* 2.5 upper_limit_of_normal_for_alanine_aminotransferase_at_screening)))
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "alanine aminotransferase level > 2.5 × the upper limit of normal at Screening"

(assert
(! (not (> patient_aspartate_transaminase_level_value_recorded_now_withunit_unit
           (* 2.5 upper_limit_of_normal_for_aspartate_aminotransferase_at_screening)))
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aspartate aminotransferase level > 2.5 × the upper limit of normal at Screening"

(assert
(! (not patient_has_active_liver_disease_now)
    :named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "active liver disease at Screening"

(assert
(! (not patient_has_finding_of_jaundice_now)
    :named REQ10_COMPONENT3_OTHER_REQUIREMENTS)) ;; "jaundice at Screening"

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the disease is serious.","when_to_set_to_false":"Set to false if the patient currently has a disease and the disease is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is serious.","meaning":"Boolean indicating whether the patient currently has a disease and the disease is serious."} ;; "serious disease"
(declare-const patient_has_finding_of_disease_now@@would_compromise_safety Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the disease would compromise safety.","when_to_set_to_false":"Set to false if the patient currently has a disease and the disease would not compromise safety.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease would compromise safety.","meaning":"Boolean indicating whether the patient currently has a disease and the disease would compromise safety."} ;; "disease that would compromise safety"
(declare-const patient_has_finding_of_disease_now@@might_affect_life_expectancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the disease might affect life expectancy.","when_to_set_to_false":"Set to false if the patient currently has a disease and the disease does not affect life expectancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease might affect life expectancy.","meaning":"Boolean indicating whether the patient currently has a disease and the disease might affect life expectancy."} ;; "disease that might affect life expectancy"
(declare-const patient_has_finding_of_disease_now@@would_make_management_and_followup_difficult_according_to_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the disease would make it difficult to successfully manage and follow according to the protocol.","when_to_set_to_false":"Set to false if the patient currently has a disease and the disease would not make management and followup difficult according to the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease would make management and followup difficult according to the protocol.","meaning":"Boolean indicating whether the patient currently has a disease and the disease would make management and followup difficult according to the protocol."} ;; "disease that would make it difficult to successfully manage and follow according to the protocol"
(declare-const patient_has_finding_of_serious_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other known serious condition.","when_to_set_to_false":"Set to false if the patient currently does not have any other known serious condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other known serious condition.","meaning":"Boolean indicating whether the patient currently has any other known serious condition."} ;; "serious condition"
(declare-const patient_has_finding_of_serious_condition_now@@would_compromise_safety Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other known serious condition and the condition would compromise safety.","when_to_set_to_false":"Set to false if the patient currently has any other known serious condition and the condition would not compromise safety.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serious condition would compromise safety.","meaning":"Boolean indicating whether the patient currently has any other known serious condition and the condition would compromise safety."} ;; "serious condition that would compromise safety"
(declare-const patient_has_finding_of_serious_condition_now@@might_affect_life_expectancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other known serious condition and the condition might affect life expectancy.","when_to_set_to_false":"Set to false if the patient currently has any other known serious condition and the condition does not affect life expectancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serious condition might affect life expectancy.","meaning":"Boolean indicating whether the patient currently has any other known serious condition and the condition might affect life expectancy."} ;; "serious condition that might affect life expectancy"
(declare-const patient_has_finding_of_serious_condition_now@@would_make_management_and_followup_difficult_according_to_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other known serious condition and the condition would make it difficult to successfully manage and follow according to the protocol.","when_to_set_to_false":"Set to false if the patient currently has any other known serious condition and the condition would not make management and followup difficult according to the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serious condition would make management and followup difficult according to the protocol.","meaning":"Boolean indicating whether the patient currently has any other known serious condition and the condition would make management and followup difficult according to the protocol."} ;; "serious condition that would make it difficult to successfully manage and follow according to the protocol"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_now@@serious
      patient_has_finding_of_disease_now)
    :named REQ11_AUXILIARY0)) ;; "serious disease"

(assert
(! (=> patient_has_finding_of_disease_now@@would_compromise_safety
      patient_has_finding_of_disease_now)
    :named REQ11_AUXILIARY1)) ;; "disease that would compromise safety"

(assert
(! (=> patient_has_finding_of_disease_now@@might_affect_life_expectancy
      patient_has_finding_of_disease_now)
    :named REQ11_AUXILIARY2)) ;; "disease that might affect life expectancy"

(assert
(! (=> patient_has_finding_of_disease_now@@would_make_management_and_followup_difficult_according_to_protocol
      patient_has_finding_of_disease_now)
    :named REQ11_AUXILIARY3)) ;; "disease that would make it difficult to successfully manage and follow according to the protocol"

(assert
(! (=> patient_has_finding_of_serious_condition_now@@would_compromise_safety
      patient_has_finding_of_serious_condition_now)
    :named REQ11_AUXILIARY4)) ;; "serious condition that would compromise safety"

(assert
(! (=> patient_has_finding_of_serious_condition_now@@might_affect_life_expectancy
      patient_has_finding_of_serious_condition_now)
    :named REQ11_AUXILIARY5)) ;; "serious condition that might affect life expectancy"

(assert
(! (=> patient_has_finding_of_serious_condition_now@@would_make_management_and_followup_difficult_according_to_protocol
      patient_has_finding_of_serious_condition_now)
    :named REQ11_AUXILIARY6)) ;; "serious condition that would make it difficult to successfully manage and follow according to the protocol"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_disease_now@@would_compromise_safety)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other known serious disease that would compromise safety."

(assert
(! (not patient_has_finding_of_disease_now@@might_affect_life_expectancy)
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other known serious disease that might affect life expectancy."

(assert
(! (not patient_has_finding_of_disease_now@@would_make_management_and_followup_difficult_according_to_protocol)
    :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other known serious disease that would make it difficult to successfully manage and follow according to the protocol."

(assert
(! (not patient_has_finding_of_serious_condition_now@@would_compromise_safety)
    :named REQ11_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other known serious condition that would compromise safety."

(assert
(! (not patient_has_finding_of_serious_condition_now@@might_affect_life_expectancy)
    :named REQ11_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other known serious condition that might affect life expectancy."

(assert
(! (not patient_has_finding_of_serious_condition_now@@would_make_management_and_followup_difficult_according_to_protocol)
    :named REQ11_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other known serious condition that would make it difficult to successfully manage and follow according to the protocol."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_hypersensitivity_to_angiotensin_ii_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity to angiotensin II receptor antagonist containing products.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity to angiotensin II receptor antagonist containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity to angiotensin II receptor antagonist containing products.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to angiotensin II receptor antagonist containing products."} ;; "the patient has known hypersensitivity to angiotensin II receptor blockers"
(declare-const patient_has_hypersensitivity_to_thiazide_diuretic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity to thiazide diuretics.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity to thiazide diuretics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity to thiazide diuretics.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to thiazide diuretics."} ;; "the patient has known hypersensitivity to thiazide-type diuretics"
(declare-const patient_has_hypersensitivity_to_sulfonamide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity to sulfonamide-derived compounds.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity to sulfonamide-derived compounds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity to sulfonamide-derived compounds.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to sulfonamide-derived compounds."} ;; "the patient has known hypersensitivity to other sulfonamide-derived compounds"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (not patient_has_hypersensitivity_to_angiotensin_ii_receptor_antagonist_containing_product_now)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to angiotensin II receptor blockers."

(assert
  (! (not patient_has_hypersensitivity_to_thiazide_diuretic_now)
     :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to thiazide-type diuretics."

(assert
  (! (not patient_has_hypersensitivity_to_sulfonamide_now)
     :named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to other sulfonamide-derived compounds."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_been_randomized_in_previous_azilsartan_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been randomized in a previous azilsartan study.","when_to_set_to_false":"Set to false if the patient has never been randomized in a previous azilsartan study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been randomized in a previous azilsartan study.","meaning":"Boolean indicating whether the patient has ever been randomized in a previous azilsartan study."} ;; "the patient has been randomized in a previous azilsartan study"
(declare-const patient_has_been_enrolled_in_previous_azilsartan_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been enrolled in a previous azilsartan study.","when_to_set_to_false":"Set to false if the patient has never been enrolled in a previous azilsartan study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been enrolled in a previous azilsartan study.","meaning":"Boolean indicating whether the patient has ever been enrolled in a previous azilsartan study."} ;; "the patient has been enrolled in a previous azilsartan study"
(declare-const patient_has_been_randomized_in_previous_azilsartan_medoxomil_plus_chlorthalidone_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been randomized in a previous azilsartan medoxomil plus chlorthalidone study.","when_to_set_to_false":"Set to false if the patient has never been randomized in a previous azilsartan medoxomil plus chlorthalidone study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been randomized in a previous azilsartan medoxomil plus chlorthalidone study.","meaning":"Boolean indicating whether the patient has ever been randomized in a previous azilsartan medoxomil plus chlorthalidone study."} ;; "the patient has been randomized in a previous azilsartan medoxomil plus chlorthalidone study"
(declare-const patient_has_been_enrolled_in_previous_azilsartan_medoxomil_plus_chlorthalidone_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been enrolled in a previous azilsartan medoxomil plus chlorthalidone study.","when_to_set_to_false":"Set to false if the patient has never been enrolled in a previous azilsartan medoxomil plus chlorthalidone study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been enrolled in a previous azilsartan medoxomil plus chlorthalidone study.","meaning":"Boolean indicating whether the patient has ever been enrolled in a previous azilsartan medoxomil plus chlorthalidone study."} ;; "the patient has been enrolled in a previous azilsartan medoxomil plus chlorthalidone study"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_been_randomized_in_previous_azilsartan_study)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been randomized in a previous azilsartan study."

(assert
(! (not patient_has_been_enrolled_in_previous_azilsartan_study)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been enrolled in a previous azilsartan study."

(assert
(! (not patient_has_been_randomized_in_previous_azilsartan_medoxomil_plus_chlorthalidone_study)
:named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been randomized in a previous azilsartan medoxomil plus chlorthalidone study."

(assert
(! (not patient_has_been_enrolled_in_previous_azilsartan_medoxomil_plus_chlorthalidone_study)
:named REQ13_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been enrolled in a previous azilsartan medoxomil plus chlorthalidone study."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_currently_participating_in_investigational_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in another investigational study.","when_to_set_to_false":"Set to false if the patient is not currently participating in another investigational study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another investigational study.","meaning":"Boolean indicating whether the patient is currently participating in another investigational study."} ;; "the patient is currently participating in another investigational study"

(declare-const patient_has_received_investigational_compound_within_30_days_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any investigational compound within 30 days prior to Screening.","when_to_set_to_false":"Set to false if the patient has not received any investigational compound within 30 days prior to Screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any investigational compound within 30 days prior to Screening.","meaning":"Boolean indicating whether the patient has received any investigational compound within 30 days prior to Screening."} ;; "the patient has received any investigational compound within 30 days prior to Screening"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (or patient_is_currently_participating_in_investigational_study_now
            patient_has_received_investigational_compound_within_30_days_prior_to_screening))
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is currently participating in another investigational study) OR (the patient has received any investigational compound within 30 days prior to Screening))."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_drug_abuse_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of drug abuse at any time within the past 2 years.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of drug abuse at any time within the past 2 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had drug abuse within the past 2 years.","meaning":"Boolean indicating whether the patient has had drug abuse within the past 2 years."} ;; "the patient has a history of drug abuse within the past 2 years"
(declare-const patient_has_finding_of_alcohol_abuse_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of alcohol abuse at any time within the past 2 years.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of alcohol abuse at any time within the past 2 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had alcohol abuse within the past 2 years.","meaning":"Boolean indicating whether the patient has had alcohol abuse within the past 2 years."} ;; "the patient has a history of alcohol abuse within the past 2 years"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_drug_abuse_inthepast2years)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug abuse within the past 2 years."

(assert
(! (not patient_has_finding_of_alcohol_abuse_inthepast2years)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse within the past 2 years."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "the patient is taking any excluded medication"
(declare-const patient_is_taking_drug_or_medicament_now@@is_excluded_medication Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament being taken by the patient is classified as an excluded medication.","when_to_set_to_false":"Set to false if the drug or medicament being taken by the patient is not classified as an excluded medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament being taken by the patient is classified as an excluded medication.","meaning":"Boolean indicating whether the drug or medicament being taken by the patient is classified as an excluded medication."} ;; "the patient is taking any excluded medication"
(declare-const patient_is_taking_drug_or_medicament_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to take any drug or medicament in the future.","when_to_set_to_false":"Set to false if the patient is not expected to take any drug or medicament in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to take any drug or medicament in the future.","meaning":"Boolean indicating whether the patient is expected to take any drug or medicament in the future."} ;; "the patient is expected to take any excluded medication"
(declare-const patient_is_taking_drug_or_medicament_inthefuture@@is_excluded_medication Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is expected to take in the future is classified as an excluded medication.","when_to_set_to_false":"Set to false if the drug or medicament the patient is expected to take in the future is not classified as an excluded medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament the patient is expected to take in the future is classified as an excluded medication.","meaning":"Boolean indicating whether the drug or medicament the patient is expected to take in the future is classified as an excluded medication."} ;; "the patient is expected to take any excluded medication"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@is_excluded_medication
      patient_is_taking_drug_or_medicament_now)
    :named REQ16_AUXILIARY0)) ;; "the patient is taking any excluded medication"

(assert
(! (=> patient_is_taking_drug_or_medicament_inthefuture@@is_excluded_medication
      patient_is_taking_drug_or_medicament_inthefuture)
    :named REQ16_AUXILIARY1)) ;; "the patient is expected to take any excluded medication"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (or patient_is_taking_drug_or_medicament_now@@is_excluded_medication
            patient_is_taking_drug_or_medicament_inthefuture@@is_excluded_medication))
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is taking any excluded medication) OR (the patient is expected to take any excluded medication))."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const antihypertensive_medications_are_used_in_open_label_treatment_period Bool) ;; {"when_to_set_to_true":"Set to true if antihypertensive medications are used during the open-label treatment period.","when_to_set_to_false":"Set to false if antihypertensive medications are not used during the open-label treatment period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether antihypertensive medications are used during the open-label treatment period.","meaning":"Boolean indicating whether antihypertensive medications are used during the open-label treatment period."} ;; "the antihypertensive medications are NOT used in the open-label treatment period"
(declare-const antihypertensive_medications_are_used_in_open_label_treatment_period@@in_accordance_with_titration_to_target_blood_pressure_titration Bool) ;; {"when_to_set_to_true":"Set to true if the use of antihypertensive medications during the open-label treatment period is in accordance with titration-to-target blood pressure titration.","when_to_set_to_false":"Set to false if the use of antihypertensive medications during the open-label treatment period is not in accordance with titration-to-target blood pressure titration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use of antihypertensive medications during the open-label treatment period is in accordance with titration-to-target blood pressure titration.","meaning":"Boolean indicating whether the use of antihypertensive medications during the open-label treatment period is in accordance with titration-to-target blood pressure titration."} ;; "in accordance with the titration-to-target blood pressure titration"
(declare-const patient_has_discontinued_antihypertensive_medications_completely_by_day_minus_14 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completely discontinued all antihypertensive medications by Day -14.","when_to_set_to_false":"Set to false if the patient has not completely discontinued all antihypertensive medications by Day -14.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completely discontinued all antihypertensive medications by Day -14.","meaning":"Boolean indicating whether the patient has completely discontinued all antihypertensive medications by Day -14."} ;; "the patient does NOT discontinue antihypertensive medications completely by Day -14"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> antihypertensive_medications_are_used_in_open_label_treatment_period@@in_accordance_with_titration_to_target_blood_pressure_titration
     antihypertensive_medications_are_used_in_open_label_treatment_period)
:named REQ17_AUXILIARY0)) ;; "the antihypertensive medications are used in the open-label treatment period in accordance with the titration-to-target blood pressure titration"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Exclusion: patient must NOT satisfy both (did NOT discontinue antihypertensive meds by Day -14) AND (antihypertensive meds are NOT used in open-label period in accordance with titration-to-target BP titration)
(assert
(! (not (and (not patient_has_discontinued_antihypertensive_medications_completely_by_day_minus_14)
             (not antihypertensive_medications_are_used_in_open_label_treatment_period@@in_accordance_with_titration_to_target_blood_pressure_titration)))
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient does NOT discontinue antihypertensive medications completely by Day -14) AND (the antihypertensive medications are NOT used in the open-label treatment period in accordance with the titration-to-target blood pressure titration))."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any angiotensin II receptor antagonist containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any angiotensin II receptor antagonist containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any angiotensin II receptor antagonist containing product.","meaning":"Boolean indicating whether the patient is currently taking any angiotensin II receptor antagonist containing product."} ;; "angiotensin II receptor blockers"
(declare-const patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now@@other_than_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the angiotensin II receptor antagonist containing product being taken is not the study medication.","when_to_set_to_false":"Set to false if the angiotensin II receptor antagonist containing product being taken is the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product being taken is other than the study medication.","meaning":"Boolean indicating whether the angiotensin II receptor antagonist containing product being taken is other than the study medication."} ;; "angiotensin II receptor blockers other than the study medication"
(declare-const patient_is_exposed_to_thiazide_diuretic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any thiazide-type diuretic.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any thiazide-type diuretic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any thiazide-type diuretic.","meaning":"Boolean indicating whether the patient is currently exposed to any thiazide-type diuretic."} ;; "thiazide-type diuretics"
(declare-const patient_is_exposed_to_thiazide_diuretic_now@@other_than_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the thiazide-type diuretic the patient is exposed to is not the study medication.","when_to_set_to_false":"Set to false if the thiazide-type diuretic the patient is exposed to is the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thiazide-type diuretic is other than the study medication.","meaning":"Boolean indicating whether the thiazide-type diuretic the patient is exposed to is other than the study medication."} ;; "thiazide-type diuretics other than the study medication"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now@@other_than_study_medication
      patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now)
   :named REQ18_AUXILIARY0)) ;; "angiotensin II receptor blockers other than the study medication"

(assert
(! (=> patient_is_exposed_to_thiazide_diuretic_now@@other_than_study_medication
      patient_is_exposed_to_thiazide_diuretic_now)
   :named REQ18_AUXILIARY1)) ;; "thiazide-type diuretics other than the study medication"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (or patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now@@other_than_study_medication
            patient_is_exposed_to_thiazide_diuretic_now@@other_than_study_medication))
   :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is taking angiotensin II receptor blockers other than the study medication) OR (the patient is taking thiazide-type diuretics other than the study medication))."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_is_taking_pharmaceutical_biologic_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any pharmaceutical or biologic product.","when_to_set_to_false":"Set to false if the patient is currently not taking any pharmaceutical or biologic product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any pharmaceutical or biologic product.","meaning":"Boolean indicating whether the patient is currently taking any pharmaceutical or biologic product."} ;; "products"

(declare-const patient_is_taking_pharmaceutical_biologic_product_now@@is_over_the_counter_and_not_permitted_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a pharmaceutical or biologic product that is over-the-counter and not permitted by the investigator.","when_to_set_to_false":"Set to false if the patient is currently taking a pharmaceutical or biologic product, but it is either not over-the-counter or is permitted by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is over-the-counter and not permitted by the investigator.","meaning":"Boolean indicating that the patient is currently taking a pharmaceutical or biologic product that is both over-the-counter and not permitted by the investigator."} ;; "over-the-counter products not permitted by the investigator"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_pharmaceutical_biologic_product_now@@is_over_the_counter_and_not_permitted_by_investigator
      patient_is_taking_pharmaceutical_biologic_product_now)
   :named REQ19_AUXILIARY0)) ;; "over-the-counter products not permitted by the investigator"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_is_taking_pharmaceutical_biologic_product_now@@is_over_the_counter_and_not_permitted_by_investigator)
   :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking over-the-counter products not permitted by the investigator."
