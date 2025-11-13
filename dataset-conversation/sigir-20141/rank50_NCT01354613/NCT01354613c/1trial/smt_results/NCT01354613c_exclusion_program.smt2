;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_symptoms_of_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has symptoms of myocardial ischemia."} ;; "myocardial ischemia"
(declare-const patient_has_symptoms_of_myocardial_ischemia_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current symptoms of myocardial ischemia are active.","when_to_set_to_false":"Set to false if the patient's current symptoms of myocardial ischemia are not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current symptoms of myocardial ischemia are active.","meaning":"Boolean indicating whether the patient's current symptoms of myocardial ischemia are active."} ;; "active myocardial ischemia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_symptoms_of_myocardial_ischemia_now@@active
      patient_has_symptoms_of_myocardial_ischemia_now)
:named REQ0_AUXILIARY0)) ;; "active myocardial ischemia" implies "myocardial ischemia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_symptoms_of_myocardial_ischemia_now@@active)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms of active myocardial ischemia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_mitral_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of mitral valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of mitral valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of mitral valve stenosis.","meaning":"Boolean indicating whether the patient currently has mitral valve stenosis."} ;; "mitral stenosis"
(declare-const patient_has_finding_of_mitral_valve_stenosis_now@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mitral valve stenosis and the severity is moderate.","when_to_set_to_false":"Set to false if the patient currently has mitral valve stenosis but the severity is not moderate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of mitral valve stenosis is moderate.","meaning":"Boolean indicating whether the patient currently has mitral valve stenosis of moderate severity."} ;; "moderate mitral stenosis"
(declare-const patient_has_finding_of_mitral_valve_stenosis_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mitral valve stenosis and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has mitral valve stenosis but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of mitral valve stenosis is severe.","meaning":"Boolean indicating whether the patient currently has mitral valve stenosis of severe severity."} ;; "severe mitral stenosis"
(declare-const patient_has_finding_of_aortic_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aortic valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aortic valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of aortic valve stenosis.","meaning":"Boolean indicating whether the patient currently has aortic valve stenosis."} ;; "aortic stenosis"
(declare-const patient_has_finding_of_aortic_valve_stenosis_now@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aortic valve stenosis and the severity is moderate.","when_to_set_to_false":"Set to false if the patient currently has aortic valve stenosis but the severity is not moderate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of aortic valve stenosis is moderate.","meaning":"Boolean indicating whether the patient currently has aortic valve stenosis of moderate severity."} ;; "moderate aortic stenosis"
(declare-const patient_has_finding_of_aortic_valve_stenosis_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aortic valve stenosis and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has aortic valve stenosis but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of aortic valve stenosis is severe.","meaning":"Boolean indicating whether the patient currently has aortic valve stenosis of severe severity."} ;; "severe aortic stenosis"
(declare-const patient_has_finding_of_aortic_valve_regurgitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aortic valve regurgitation (insufficiency).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aortic valve regurgitation (insufficiency).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of aortic valve regurgitation (insufficiency).","meaning":"Boolean indicating whether the patient currently has aortic valve regurgitation (insufficiency)."} ;; "aortic valve insufficiency"
(declare-const patient_has_finding_of_aortic_valve_regurgitation_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aortic valve regurgitation (insufficiency) and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has aortic valve regurgitation (insufficiency) but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of aortic valve regurgitation (insufficiency) is severe.","meaning":"Boolean indicating whether the patient currently has aortic valve regurgitation (insufficiency) of severe severity."} ;; "severe aortic valve insufficiency"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_mitral_valve_stenosis_now@@severity_moderate
      patient_has_finding_of_mitral_valve_stenosis_now)
   :named REQ1_AUXILIARY0)) ;; "moderate mitral stenosis"

(assert
(! (=> patient_has_finding_of_mitral_valve_stenosis_now@@severity_severe
      patient_has_finding_of_mitral_valve_stenosis_now)
   :named REQ1_AUXILIARY1)) ;; "severe mitral stenosis"

(assert
(! (=> patient_has_finding_of_aortic_valve_stenosis_now@@severity_moderate
      patient_has_finding_of_aortic_valve_stenosis_now)
   :named REQ1_AUXILIARY2)) ;; "moderate aortic stenosis"

(assert
(! (=> patient_has_finding_of_aortic_valve_stenosis_now@@severity_severe
      patient_has_finding_of_aortic_valve_stenosis_now)
   :named REQ1_AUXILIARY3)) ;; "severe aortic stenosis"

(assert
(! (=> patient_has_finding_of_aortic_valve_regurgitation_now@@severity_severe
      patient_has_finding_of_aortic_valve_regurgitation_now)
   :named REQ1_AUXILIARY4)) ;; "severe aortic valve insufficiency"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_mitral_valve_stenosis_now@@severity_moderate)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate mitral stenosis."

(assert
(! (not patient_has_finding_of_mitral_valve_stenosis_now@@severity_severe)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe mitral stenosis."

(assert
(! (not patient_has_finding_of_aortic_valve_stenosis_now@@severity_moderate)
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate aortic stenosis."

(assert
(! (not patient_has_finding_of_aortic_valve_stenosis_now@@severity_severe)
   :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe aortic stenosis."

(assert
(! (not patient_has_finding_of_aortic_valve_regurgitation_now@@severity_severe)
   :named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe aortic valve insufficiency."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum creatinine concentration in mg/dL is available.","when_to_set_to_null":"Set to null if no current serum creatinine concentration measurement in mg/dL is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine concentration in mg/dL."} ;; "serum creatinine concentration > 3.0 mg/dL"
(declare-const patient_is_undergoing_maintenance_hemodialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing maintenance hemodialysis.","when_to_set_to_false":"Set to false if the patient is not currently undergoing maintenance hemodialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing maintenance hemodialysis.","meaning":"Boolean indicating whether the patient is currently undergoing maintenance hemodialysis."} ;; "chronic hemodialysis treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 3.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum creatinine concentration > 3.0 mg/dL."

(assert
  (! (not patient_is_undergoing_maintenance_hemodialysis_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on chronic hemodialysis treatment."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_chronic_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic liver disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic liver disease."} ;; "chronic hepatic disease"

(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current aspartate transaminase (AST) level is available from the local laboratory.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate transaminase (AST) level as measured at the local laboratory."} ;; "aspartate aminotransferase level"

(declare-const patient_aspartate_transaminase_upper_limit_of_normal_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the value defined by the local laboratory as the upper limit of normal for aspartate transaminase (AST) level, with appropriate units, at the current time.","when_to_set_to_null":"Set to null if the upper limit of normal for AST is not available or indeterminate from the local laboratory.","meaning":"Numeric value representing the upper limit of normal for aspartate transaminase (AST) level as defined by the local laboratory, with appropriate units."} ;; "upper limit of normal as read at the local laboratory" (AST)

(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current alanine aminotransferase (ALT) level is available from the local laboratory.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase (ALT) level as measured at the local laboratory."} ;; "alanine aminotransferase level"

(declare-const patient_alanine_aminotransferase_upper_limit_of_normal_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the value defined by the local laboratory as the upper limit of normal for alanine aminotransferase (ALT) level, with appropriate units, at the current time.","when_to_set_to_null":"Set to null if the upper limit of normal for ALT is not available or indeterminate from the local laboratory.","meaning":"Numeric value representing the upper limit of normal for alanine aminotransferase (ALT) level as defined by the local laboratory, with appropriate units."} ;; "upper limit of normal as read at the local laboratory" (ALT)

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: chronic hepatic disease = (AST > 3x ULN) OR (ALT > 3x ULN)
(assert
(! (= patient_has_diagnosis_of_chronic_liver_disease_now
     (or
       (> patient_aspartate_transaminase_level_value_recorded_now_withunit_unit
          (* 3.0 patient_aspartate_transaminase_upper_limit_of_normal_value_recorded_now_withunit_unit))
       (> patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
          (* 3.0 patient_alanine_aminotransferase_upper_limit_of_normal_value_recorded_now_withunit_unit))))
   :named REQ3_AUXILIARY0)) ;; "defined as (aspartate aminotransferase level > 3.0 times the upper limit of normal as read at the local laboratory) OR (alanine aminotransferase level > 3.0 times the upper limit of normal as read at the local laboratory)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_liver_disease_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has known chronic hepatic disease, defined as (aspartate aminotransferase level > 3.0 times the upper limit of normal as read at the local laboratory) OR (alanine aminotransferase level > 3.0 times the upper limit of normal as read at the local laboratory))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's glomerular filtration rate (GFR) in mL/min is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current glomerular filtration rate (GFR) in mL/min."} ;; "glomerular filtration rate < 30 mL/min"

(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal dysfunction"

(declare-const patient_has_finding_of_renal_impairment_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe renal impairment.","when_to_set_to_false":"Set to false if the patient currently has renal impairment but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal impairment is severe.","meaning":"Boolean indicating whether the patient's current renal impairment is severe."} ;; "severe renal dysfunction"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: severe renal dysfunction = renal impairment AND GFR < 30 mL/min
(assert
(! (= patient_has_finding_of_renal_impairment_now@@severity_severe
(and patient_has_finding_of_renal_impairment_now
(< patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min 30)))
:named REQ4_AUXILIARY0)) ;; "defined as glomerular filtration rate < 30 mL/min"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severity_severe
patient_has_finding_of_renal_impairment_now)
:named REQ4_AUXILIARY1)) ;; "severe renal dysfunction" implies "renal impairment"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now@@severity_severe)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal dysfunction, defined as glomerular filtration rate < 30 mL/min."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of atrial fibrillation."} ;; "atrial fibrillation"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_atrial_fibrillation_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrial fibrillation."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past one year.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past one year.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past one year."} ;; "myocardial infarction within the last one year"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast1years)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a myocardial infarction within the last one year."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass graft surgery within the past six months.","when_to_set_to_false":"Set to false if the patient has not undergone coronary artery bypass graft surgery within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary artery bypass graft surgery within the past six months.","meaning":"Boolean indicating whether the patient has undergone coronary artery bypass graft surgery within the past six months."} ;; "coronary artery bypass graft surgery within the last six months"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthepast6months)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had coronary artery bypass graft surgery within the last six months."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of cerebrovascular accident (stroke) within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 6 months."} ;; "stroke within the last six months"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthepast6months)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a stroke within the last six months."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_aortic_aneurysm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an aortic aneurysm.","when_to_set_to_false":"Set to false if the patient currently does not have an aortic aneurysm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an aortic aneurysm.","meaning":"Boolean indicating whether the patient currently has an aortic aneurysm."} ;; "aortic aneurysm"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_finding_of_aortic_aneurysm_now)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known aortic aneurysm."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_contraindication_to_withdrawal_of_beta_blocker_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to withdrawal of beta blocker medication.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to withdrawal of beta blocker medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to withdrawal of beta blocker medication.","meaning":"Boolean indicating whether the patient currently has a contraindication to withdrawal of beta blocker medication."} ;; "the patient has a contraindication to withdrawal of beta blocker medication"
(declare-const patient_has_contraindication_to_withdrawal_of_antihypertensive_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to withdrawal of antihypertensive medication.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to withdrawal of antihypertensive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to withdrawal of antihypertensive medication.","meaning":"Boolean indicating whether the patient currently has a contraindication to withdrawal of antihypertensive medication."} ;; "the patient has a contraindication to withdrawal of antihypertensive medication"
(declare-const patient_is_exposed_to_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a hypotensive agent (antihypertensive medication).","when_to_set_to_false":"Set to false if the patient is currently not exposed to a hypotensive agent (antihypertensive medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a hypotensive agent (antihypertensive medication).","meaning":"Boolean indicating whether the patient is currently exposed to a hypotensive agent (antihypertensive medication)."} ;; "antihypertensive medication"
(declare-const patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta blocker medication).","when_to_set_to_false":"Set to false if the patient is currently not taking a beta-adrenergic receptor antagonist containing product (beta blocker medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta blocker medication).","meaning":"Boolean indicating whether the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta blocker medication)."} ;; "beta blocker medication"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_contraindication_to_withdrawal_of_beta_blocker_medication_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to withdrawal of beta blocker medication."

(assert
(! (not patient_has_contraindication_to_withdrawal_of_antihypertensive_medication_now)
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to withdrawal of antihypertensive medication."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_resting_hypotension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has resting hypotension.","when_to_set_to_false":"Set to false if the patient currently does not have resting hypotension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has resting hypotension.","meaning":"Boolean indicating whether the patient currently has resting hypotension."} ;; "resting hypotension"
(declare-const patient_has_finding_of_orthostatic_hypotension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of orthostatic hypotension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of orthostatic hypotension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has orthostatic hypotension.","meaning":"Boolean indicating whether the patient currently has orthostatic hypotension."} ;; "orthostatic hypotension"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in mmHg is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} ;; "systolic blood pressure < 90 mmHg"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Definition: resting hypotension is defined as systolic blood pressure < 90 mmHg
(assert
(! (= patient_has_finding_of_resting_hypotension_now
(< patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 90))
:named REQ11_AUXILIARY0)) ;; "resting hypotension (defined as systolic blood pressure < 90 mmHg)"

;; Definition: orthostatic hypotension is defined as systolic blood pressure < 90 mmHg
(assert
(! (= patient_has_finding_of_orthostatic_hypotension_now
(< patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 90))
:named REQ11_AUXILIARY1)) ;; "orthostatic hypotension (defined as systolic blood pressure < 90 mmHg)"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_resting_hypotension_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has resting hypotension (defined as systolic blood pressure < 90 mmHg)."

(assert
(! (not patient_has_finding_of_orthostatic_hypotension_now)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has orthostatic hypotension (defined as systolic blood pressure < 90 mmHg)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of the gastrointestinal tract."} ;; "gastrointestinal disorder"
(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@would_interfere_with_drug_absorption Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current gastrointestinal disorder would interfere with drug absorption.","when_to_set_to_false":"Set to false if the patient's current gastrointestinal disorder would not interfere with drug absorption.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current gastrointestinal disorder would interfere with drug absorption.","meaning":"Boolean indicating whether the patient's current gastrointestinal disorder would interfere with drug absorption."} ;; "gastrointestinal disorder which would interfere with drug absorption"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@would_interfere_with_drug_absorption
      patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now)
   :named REQ12_AUXILIARY0)) ;; "gastrointestinal disorder which would interfere with drug absorption"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@would_interfere_with_drug_absorption)
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any gastrointestinal disorder which would interfere with drug absorption."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_undergone_heart_valve_replacement_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a heart valve replacement procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a heart valve replacement procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a heart valve replacement procedure.","meaning":"Boolean indicating whether the patient has ever undergone a heart valve replacement procedure in the past."} ;; "heart valve replacement"
(declare-const patient_has_undergone_heart_valve_replacement_inthehistory@@involved_multiple_valves Bool) ;; {"when_to_set_to_true":"Set to true if the heart valve replacement procedure involved multiple valves.","when_to_set_to_false":"Set to false if the heart valve replacement procedure did not involve multiple valves (i.e., only a single valve was replaced).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether multiple valves were involved in the heart valve replacement procedure.","meaning":"Boolean indicating whether the heart valve replacement procedure involved multiple valves."} ;; "prior multiple heart valve replacement"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (or
  patient_has_finding_of_aortic_valve_regurgitation_now@@severity_severe
  patient_has_finding_of_aortic_valve_stenosis_now@@severity_moderate
  patient_has_finding_of_aortic_valve_stenosis_now@@severity_severe
  patient_has_finding_of_mitral_valve_stenosis_now@@severity_moderate
  patient_has_finding_of_mitral_valve_stenosis_now@@severity_severe
  patient_has_undergone_heart_valve_replacement_inthehistory@@involved_multiple_valves
))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any significant valvular heart disease, including prior multiple heart valve replacement."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_disorder_of_pericardium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder of the pericardium (pericardial disease).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder of the pericardium (pericardial disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disorder of the pericardium (pericardial disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the pericardium (pericardial disease)."} ;; "pericardial disease"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_disorder_of_pericardium_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pericardial disease."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has cardiomyopathy."} ;; "cardiomyopathy"
(declare-const patient_has_finding_of_cardiomyopathy_now@@is_infiltrative Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiomyopathy and the cardiomyopathy is infiltrative.","when_to_set_to_false":"Set to false if the patient currently has cardiomyopathy and the cardiomyopathy is not infiltrative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiomyopathy is infiltrative.","meaning":"Boolean indicating whether the patient's cardiomyopathy is infiltrative."} ;; "infiltrative cardiomyopathy"
(declare-const patient_has_finding_of_hypertrophic_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of hypertrophic cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of hypertrophic cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of hypertrophic cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has hypertrophic cardiomyopathy."} ;; "hypertrophic cardiomyopathy"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cardiomyopathy_now@@is_infiltrative
       patient_has_finding_of_cardiomyopathy_now)
   :named REQ15_AUXILIARY0)) ;; "infiltrative cardiomyopathy" implies "cardiomyopathy"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion: patient must NOT have infiltrative cardiomyopathy
(assert
(! (not patient_has_finding_of_cardiomyopathy_now@@is_infiltrative)
   :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infiltrative cardiomyopathy."

;; Exclusion: patient must NOT have hypertrophic cardiomyopathy
(assert
(! (not patient_has_finding_of_hypertrophic_cardiomyopathy_now)
   :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypertrophic cardiomyopathy."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_cor_pulmonale_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cor pulmonale.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cor pulmonale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cor pulmonale.","meaning":"Boolean indicating whether the patient currently has cor pulmonale."} ;; "cor pulmonale"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_cor_pulmonale_now)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cor pulmonale."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_unstable_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unstable coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have unstable coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable coronary artery disease.","meaning":"Boolean indicating whether the patient currently has unstable coronary artery disease."} ;; "unstable coronary artery disease"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_unstable_coronary_artery_disease_now)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable coronary artery disease."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "any condition"

(declare-const patient_has_finding_of_disease_condition_finding_now@@may_prevent_adherence_to_study_protocol_as_determined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding, and that condition may prevent the patient from adhering to the study protocol, as determined by the investigator.","when_to_set_to_false":"Set to false if the patient currently has any disease, condition, or clinical finding, but that condition does not prevent or is not judged to prevent adherence to the study protocol, as determined by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's condition may prevent adherence to the study protocol, as determined by the investigator.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding may prevent adherence to the study protocol, as determined by the investigator."} ;; "any condition which may prevent the patient from adhering to the study protocol (as determined by the investigator)"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@may_prevent_adherence_to_study_protocol_as_determined_by_investigator
      patient_has_finding_of_disease_condition_finding_now)
:named REQ19_AUXILIARY0)) ;; "any condition which may prevent the patient from adhering to the study protocol (as determined by the investigator)""

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@may_prevent_adherence_to_study_protocol_as_determined_by_investigator)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition which may prevent the patient from adhering to the study protocol (as determined by the investigator)."
