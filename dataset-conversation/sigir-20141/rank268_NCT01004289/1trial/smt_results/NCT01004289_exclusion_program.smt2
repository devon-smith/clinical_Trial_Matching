;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with acute myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with acute myocardial infarction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with acute myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with acute myocardial infarction at any time in the past."} ;; "has had a previous acute myocardial infarction"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_acute_myocardial_infarction_inthehistory)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous acute myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_angioplasty_of_blood_vessel_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone angioplasty of a blood vessel at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never undergone angioplasty of a blood vessel prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone angioplasty of a blood vessel prior to now.","meaning":"Boolean indicating whether the patient has ever undergone angioplasty of a blood vessel at any time prior to now."} ;; "previous angioplasty"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass grafting at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass grafting prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass grafting prior to now.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass grafting at any time prior to now."} ;; "previous coronary artery bypass grafting"
(declare-const patient_has_undergone_myocardial_revascularization_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any form of myocardial revascularization at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never undergone any form of myocardial revascularization prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone any form of myocardial revascularization prior to now.","meaning":"Boolean indicating whether the patient has ever undergone any form of myocardial revascularization at any time prior to now."} ;; "previous myocardial revascularization"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_undergone_angioplasty_of_blood_vessel_inthehistory
           patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
       patient_has_undergone_myocardial_revascularization_inthehistory)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((previous angioplasty) OR (previous coronary artery bypass grafting))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_myocardial_revascularization_inthehistory)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous myocardial revascularization with non-exhaustive examples ((previous angioplasty) OR (previous coronary artery bypass grafting))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_heart_valve_replacement_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone heart valve replacement at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never undergone heart valve replacement prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone heart valve replacement.","meaning":"Boolean indicating whether the patient has ever undergone heart valve replacement at any time in the past."} ;; "has had a previous heart valve replacement"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_heart_valve_replacement_inthehistory)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous heart valve replacement."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_transplantation_of_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a heart transplantation procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a heart transplantation procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a heart transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a heart transplantation procedure at any time in the past."} ;; "has had a previous heart transplant"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_transplantation_of_heart_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous heart transplant."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_patient_s_condition_unstable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical instability.","when_to_set_to_false":"Set to false if the patient currently does not have clinical instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical instability.","meaning":"Boolean indicating whether the patient currently has clinical instability."} ;; "clinical instability"

(declare-const patient_has_finding_of_patient_s_condition_unstable_now@@precludes_study_suitability Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical instability precludes the suitability of the study.","when_to_set_to_false":"Set to false if the patient's current clinical instability does not preclude the suitability of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinical instability precludes the suitability of the study.","meaning":"Boolean indicating whether the patient's current clinical instability precludes the suitability of the study."} ;; "clinical instability that precludes the suitability of the study"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_patient_s_condition_unstable_now@@precludes_study_suitability
      patient_has_finding_of_patient_s_condition_unstable_now)
:named REQ4_AUXILIARY0)) ;; "clinical instability that precludes the suitability of the study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_patient_s_condition_unstable_now@@precludes_study_suitability)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical instability that precludes the suitability of the study."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"

(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of low blood pressure (hypotension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of low blood pressure (hypotension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has low blood pressure (hypotension).","meaning":"Boolean indicating whether the patient currently has low blood pressure (hypotension)."} ;; "hypotension"

(declare-const patient_has_finding_of_low_blood_pressure_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current low blood pressure (hypotension) is persistent.","when_to_set_to_false":"Set to false if the patient's current low blood pressure (hypotension) is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current low blood pressure (hypotension) is persistent.","meaning":"Boolean indicating whether the patient's current low blood pressure (hypotension) is persistent."} ;; "persistent hypotension"

(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current systolic blood pressure in mmHg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} ;; "systolic blood pressure < 100 mmHg"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_low_blood_pressure_now@@persistent
       patient_has_finding_of_low_blood_pressure_now)
   :named REQ5_AUXILIARY0)) ;; "persistent hypotension" implies "hypotension"

;; Definition: persistent hypotension = hypotension that is persistent and systolic BP < 100 mmHg
(assert
(! (= patient_has_finding_of_low_blood_pressure_now@@persistent
      (and patient_has_finding_of_low_blood_pressure_now
           (< patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 100)))
   :named REQ5_AUXILIARY1)) ;; "persistent hypotension, defined as systolic blood pressure < 100 mmHg"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_has_finding_of_cardiogenic_shock_now
            patient_has_finding_of_low_blood_pressure_now@@persistent))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has cardiogenic shock) OR (the patient has persistent hypotension, defined as systolic blood pressure < 100 mmHg)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_undergone_angioplasty_of_blood_vessel_inthehistory@@is_rescue_angioplasty Bool) ;; {"when_to_set_to_true":"Set to true if the patient's angioplasty of a blood vessel in their history was performed as a rescue procedure.","when_to_set_to_false":"Set to false if the patient's angioplasty of a blood vessel in their history was not performed as a rescue procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angioplasty was performed as a rescue procedure.","meaning":"Boolean indicating whether the patient's angioplasty of a blood vessel in their history was performed as a rescue angioplasty."} ;; "rescue angioplasty"
(declare-const patient_has_undergone_angioplasty_of_blood_vessel_inthehistory@@occurred_after_thrombolytic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's angioplasty of a blood vessel in their history occurred after thrombolytic therapy.","when_to_set_to_false":"Set to false if the patient's angioplasty of a blood vessel in their history did not occur after thrombolytic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angioplasty occurred after thrombolytic therapy.","meaning":"Boolean indicating whether the patient's angioplasty of a blood vessel in their history occurred after thrombolytic therapy."} ;; "after thrombolytic therapy"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_angioplasty_of_blood_vessel_inthehistory@@is_rescue_angioplasty
      patient_has_undergone_angioplasty_of_blood_vessel_inthehistory)
   :named REQ6_AUXILIARY0)) ;; "rescue angioplasty"

(assert
(! (=> patient_has_undergone_angioplasty_of_blood_vessel_inthehistory@@occurred_after_thrombolytic_therapy
      patient_has_undergone_angioplasty_of_blood_vessel_inthehistory)
   :named REQ6_AUXILIARY1)) ;; "after thrombolytic therapy"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_has_undergone_angioplasty_of_blood_vessel_inthehistory@@is_rescue_angioplasty
             patient_has_undergone_angioplasty_of_blood_vessel_inthehistory@@occurred_after_thrombolytic_therapy))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had rescue angioplasty after thrombolytic therapy."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_coronary_collateral_rentrop_grade_value_now_in_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the Rentrop grade if the patient's coronary collateral circulation has been graded currently.","when_to_set_to_null":"Set to null if the Rentrop grade of the patient's coronary collateral circulation is unknown, not documented, or cannot be determined currently.","meaning":"Numeric value representing the current Rentrop grade of the patient's coronary collateral circulation as an integer."} ;; "Rentrop grade > 0"
(declare-const patient_coronary_collateral_rentrop_grade_value_now_in_integer@@in_risk_area Real) ;; {"when_to_set_to_value":"Set to the integer value of the Rentrop grade if the patient's coronary collateral circulation in the risk area has been graded currently.","when_to_set_to_null":"Set to null if the Rentrop grade of the patient's coronary collateral circulation in the risk area is unknown, not documented, or cannot be determined currently.","meaning":"Numeric value representing the current Rentrop grade of the patient's coronary collateral circulation in the risk area as an integer."} ;; "Rentrop grade > 0 in the risk area"
(declare-const patient_has_finding_of_coronary_artery_collaterals_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of coronary artery collaterals.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of coronary artery collaterals.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of coronary artery collaterals.","meaning":"Boolean indicating whether the patient currently has evidence of coronary artery collaterals."} ;; "evidence of coronary collateral circulation"
(declare-const patient_has_finding_of_coronary_artery_collaterals_now@@in_risk_area Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of coronary artery collaterals and those collaterals are present in the risk area.","when_to_set_to_false":"Set to false if the patient currently has evidence of coronary artery collaterals but those collaterals are not present in the risk area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the collaterals are present in the risk area.","meaning":"Boolean indicating whether the patient's coronary artery collaterals are present in the risk area."} ;; "evidence of coronary collateral circulation in the risk area"
(declare-const patient_has_finding_of_coronary_artery_collaterals_now@@rentrop_grade_greater_than_0 Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of coronary artery collaterals and those collaterals have Rentrop grade greater than 0.","when_to_set_to_false":"Set to false if the patient currently has evidence of coronary artery collaterals but those collaterals do not have Rentrop grade greater than 0.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the collaterals have Rentrop grade greater than 0.","meaning":"Boolean indicating whether the patient's coronary artery collaterals have Rentrop grade greater than 0."} ;; "evidence of coronary collateral circulation (Rentrop grade > 0)"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Define the meaning of "evidence of coronary collateral circulation (Rentrop grade > 0) in the risk area"
(assert
(! (= patient_has_finding_of_coronary_artery_collaterals_now@@rentrop_grade_greater_than_0
     (and patient_has_finding_of_coronary_artery_collaterals_now
          (> patient_coronary_collateral_rentrop_grade_value_now_in_integer@@in_risk_area 0)))
:named REQ7_AUXILIARY0)) ;; "evidence of coronary collateral circulation (Rentrop grade > 0) in the risk area"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_coronary_artery_collaterals_now@@in_risk_area
       patient_has_finding_of_coronary_artery_collaterals_now)
:named REQ7_AUXILIARY1)) ;; "collaterals in the risk area" implies "collaterals"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_coronary_artery_collaterals_now@@rentrop_grade_greater_than_0)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of coronary collateral circulation (Rentrop grade > 0) in the risk area."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrioventricular block.","meaning":"Boolean indicating whether the patient currently has atrioventricular block."} ;; "atrioventricular block"
(declare-const patient_has_finding_of_atrioventricular_block_now@@advanced Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrioventricular block and the block is advanced in severity.","when_to_set_to_false":"Set to false if the patient currently has atrioventricular block but it is not advanced, or does not have atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the atrioventricular block is advanced.","meaning":"Boolean indicating whether the patient's current atrioventricular block is advanced in severity."} ;; "advanced atrioventricular block"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_atrioventricular_block_now@@advanced
      patient_has_finding_of_atrioventricular_block_now)
:named REQ8_AUXILIARY0)) ;; "advanced atrioventricular block" implies "atrioventricular block"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_atrioventricular_block_now@@advanced)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has advanced atrioventricular block."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_bradycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bradycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bradycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bradycardia.","meaning":"Boolean indicating whether the patient currently has bradycardia."} ;; "bradycardia"
(declare-const patient_has_finding_of_bradycardia_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bradycardia is considered significant.","when_to_set_to_false":"Set to false if the patient's bradycardia is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bradycardia is significant.","meaning":"Boolean indicating whether the patient's bradycardia is significant."} ;; "significant bradycardia"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_bradycardia_now@@significant
      patient_has_finding_of_bradycardia_now)
:named REQ9_AUXILIARY0)) ;; "significant bradycardia" implies "bradycardia"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_bradycardia_now@@significant)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant bradycardia."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_sinus_rhythm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sinus rhythm.","when_to_set_to_false":"Set to false if the patient currently does not have sinus rhythm (i.e., absence of sinus rhythm).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sinus rhythm.","meaning":"Boolean indicating whether the patient currently has sinus rhythm."} ;; "sinus rhythm"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_sinus_rhythm_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has absence of sinus rhythm."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_inability_to_lay_flat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inability to lay flat.","when_to_set_to_false":"Set to false if the patient currently does not have an inability to lay flat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inability to lay flat.","meaning":"Boolean indicating whether the patient currently has an inability to lay flat."} ;; "has inability to lay flat"

(declare-const patient_has_inability_to_lay_flat_now@@due_to_severe_cardiac_heart_failure_or_severe_respiratory_insufficiency Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current inability to lay flat is due to severe cardiac heart failure or severe respiratory insufficiency.","when_to_set_to_false":"Set to false if the patient's current inability to lay flat is not due to severe cardiac heart failure or severe respiratory insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current inability to lay flat is due to severe cardiac heart failure or severe respiratory insufficiency.","meaning":"Boolean indicating whether the patient's current inability to lay flat is due to severe cardiac heart failure or severe respiratory insufficiency."} ;; "has inability to lay flat due to (severe cardiac heart failure OR severe respiratory insufficiency)"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_inability_to_lay_flat_now@@due_to_severe_cardiac_heart_failure_or_severe_respiratory_insufficiency
      patient_has_inability_to_lay_flat_now)
:named REQ11_AUXILIARY0)) ;; "inability to lay flat due to (severe cardiac heart failure OR severe respiratory insufficiency)"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_inability_to_lay_flat_now@@due_to_severe_cardiac_heart_failure_or_severe_respiratory_insufficiency)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to lay flat due to (severe cardiac heart failure OR severe respiratory insufficiency)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_disorder_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of disorder of lung (bronchospastic lung disease) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of disorder of lung (bronchospastic lung disease) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of disorder of lung (bronchospastic lung disease).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of disorder of lung (bronchospastic lung disease) in their history."} ;; "history of bronchospastic lung disease"
(declare-const patient_has_clinical_evidence_of_bronchospastic_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical evidence of bronchospastic lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have clinical evidence of bronchospastic lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical evidence of bronchospastic lung disease.","meaning":"Boolean indicating whether the patient currently has clinical evidence of bronchospastic lung disease."} ;; "clinical evidence of bronchospastic lung disease"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_lung_inthehistory)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of bronchospastic lung disease."

(assert
(! (not patient_has_clinical_evidence_of_bronchospastic_lung_disease_now)
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical evidence of bronchospastic lung disease."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"

(declare-const patient_has_finding_of_disease_now@@is_life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is life-threatening.","when_to_set_to_false":"Set to false if the disease present in the patient is not life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present in the patient is life-threatening.","meaning":"Boolean indicating whether the disease present in the patient is life-threatening."} ;; "life-threatening disease"

(declare-const patient_has_finding_of_disease_now@@associated_with_life_expectancy_less_than_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is associated with life expectancy less than 6 months.","when_to_set_to_false":"Set to false if the disease present in the patient is not associated with life expectancy less than 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present in the patient is associated with life expectancy less than 6 months.","meaning":"Boolean indicating whether the disease present in the patient is associated with life expectancy less than 6 months."} ;; "life expectancy < 6 months"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@is_life_threatening
       patient_has_finding_of_disease_now)
   :named REQ14_AUXILIARY0)) ;; "life-threatening disease"

(assert
(! (=> patient_has_finding_of_disease_now@@associated_with_life_expectancy_less_than_6_months
       patient_has_finding_of_disease_now)
   :named REQ14_AUXILIARY1)) ;; "disease ... with life expectancy < 6 months"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (and patient_has_finding_of_disease_now@@is_life_threatening
             patient_has_finding_of_disease_now@@associated_with_life_expectancy_less_than_6_months))
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known existence of a life-threatening disease with life expectancy < 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_inability_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to give informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have inability to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to give informed consent.","meaning":"Boolean indicating whether the patient currently has inability to give informed consent."} ;; "The patient is excluded if the patient has inability to give informed consent."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_inability_to_give_informed_consent_now)
:named REQ15_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has inability to give informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_can_undergo_cardiac_mri_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo cardiac magnetic resonance imaging (MRI), i.e., has no contraindications to the procedure.","when_to_set_to_false":"Set to false if the patient cannot currently undergo cardiac magnetic resonance imaging (MRI) due to any contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo cardiac magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient can currently undergo cardiac magnetic resonance imaging (MRI)."} ;; "cardiac magnetic resonance imaging"
(declare-const patient_has_contraindication_to_cardiac_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to undergoing cardiac magnetic resonance imaging (MRI), including but not limited to implanted metallic objects or other relevant contraindications.","when_to_set_to_false":"Set to false if the patient currently has no contraindication to undergoing cardiac magnetic resonance imaging (MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to undergoing cardiac magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient currently has any contraindication to undergoing cardiac magnetic resonance imaging (MRI)."} ;; "any contraindication to undergo cardiac magnetic resonance imaging"
(declare-const patient_has_finding_of_claustrophobia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of claustrophobia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of claustrophobia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of claustrophobia.","meaning":"Boolean indicating whether the patient currently has a finding of claustrophobia."} ;; "claustrophobia"
(declare-const patient_has_implanted_aneurysm_clip_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implanted aneurysm clip.","when_to_set_to_false":"Set to false if the patient currently does not have an implanted aneurysm clip.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implanted aneurysm clip.","meaning":"Boolean indicating whether the patient currently has an implanted aneurysm clip."} ;; "aneurysm clip"
(declare-const patient_has_implanted_cardiac_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implanted cardiac pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have an implanted cardiac pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implanted cardiac pacemaker.","meaning":"Boolean indicating whether the patient currently has an implanted cardiac pacemaker."} ;; "cardiac pacemaker"
(declare-const patient_has_implanted_cardioverter_defibrillator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implanted cardioverter defibrillator.","when_to_set_to_false":"Set to false if the patient currently does not have an implanted cardioverter defibrillator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implanted cardioverter defibrillator.","meaning":"Boolean indicating whether the patient currently has an implanted cardioverter defibrillator."} ;; "implantable cardioverter defibrillator"
(declare-const patient_has_implanted_cerebral_clip_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implanted cerebral clip.","when_to_set_to_false":"Set to false if the patient currently does not have an implanted cerebral clip.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implanted cerebral clip.","meaning":"Boolean indicating whether the patient currently has an implanted cerebral clip."} ;; "cerebral clip"
(declare-const patient_has_implanted_electronic_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other type of implanted electronic device.","when_to_set_to_false":"Set to false if the patient currently does not have any other type of implanted electronic device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other type of implanted electronic device.","meaning":"Boolean indicating whether the patient currently has any other type of implanted electronic device."} ;; "any other type of electronic device"
(declare-const patient_has_implanted_insulin_pump_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implanted insulin pump.","when_to_set_to_false":"Set to false if the patient currently does not have an implanted insulin pump.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implanted insulin pump.","meaning":"Boolean indicating whether the patient currently has an implanted insulin pump."} ;; "implanted insulin pump"
(declare-const patient_has_implanted_metallic_object_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any implanted metallic object, including but not limited to cardiac pacemaker, implantable cardioverter defibrillator, implanted insulin pump, electronic device, cerebral clip, or aneurysm clip.","when_to_set_to_false":"Set to false if the patient currently does not have any implanted metallic object.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any implanted metallic object.","meaning":"Boolean indicating whether the patient currently has any implanted metallic object."} ;; "implanted metallic objects"
(declare-const patient_has_other_contraindication_to_cardiac_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other contraindication to cardiac magnetic resonance imaging (MRI), not otherwise specified (e.g., claustrophobia, already declared separately).","when_to_set_to_false":"Set to false if the patient currently does not have any other contraindication to cardiac magnetic resonance imaging (MRI), not otherwise specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other contraindication to cardiac magnetic resonance imaging (MRI), not otherwise specified.","meaning":"Boolean indicating whether the patient currently has any other contraindication to cardiac magnetic resonance imaging (MRI), not otherwise specified."} ;; "any other contraindication to cardiac magnetic resonance imaging"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Non-exhaustive examples: specific findings imply umbrella terms
(assert
(! (=> (or patient_has_implanted_cardiac_pacemaker_now
           patient_has_implanted_cardioverter_defibrillator_now
           patient_has_implanted_insulin_pump_now
           patient_has_implanted_electronic_device_now
           patient_has_implanted_cerebral_clip_now
           patient_has_implanted_aneurysm_clip_now)
        patient_has_implanted_metallic_object_now)
:named REQ16_AUXILIARY0)) ;; "implanted metallic objects with non-exhaustive examples (cardiac pacemaker OR implantable cardioverter defibrillator OR implanted insulin pump OR any other type of electronic device OR cerebral clip OR aneurysm clip)"

(assert
(! (=> patient_has_implanted_metallic_object_now
        patient_has_contraindication_to_cardiac_magnetic_resonance_imaging_now)
:named REQ16_AUXILIARY1)) ;; "implanted metallic objects" is a contraindication to cardiac MRI

(assert
(! (=> (or patient_has_other_contraindication_to_cardiac_magnetic_resonance_imaging_now
           patient_has_finding_of_claustrophobia_now)
        patient_has_contraindication_to_cardiac_magnetic_resonance_imaging_now)
:named REQ16_AUXILIARY2)) ;; "any other contraindication to cardiac magnetic resonance imaging with non-exhaustive examples (claustrophobia)"

;; Definition: patient can undergo cardiac MRI iff no contraindication
(assert
(! (= patient_can_undergo_cardiac_mri_now
     (not patient_has_contraindication_to_cardiac_magnetic_resonance_imaging_now))
:named REQ16_AUXILIARY3)) ;; "can undergo cardiac MRI = not having any contraindication"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_can_undergo_cardiac_mri_now)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any contraindication to undergo cardiac magnetic resonance imaging with non-exhaustive examples..."
