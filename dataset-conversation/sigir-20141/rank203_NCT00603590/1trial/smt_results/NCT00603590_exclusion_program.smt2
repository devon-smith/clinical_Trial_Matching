;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cardiovascular_disease_existing Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an existing diagnosis of any cardiovascular disease, regardless of specific type (including but not limited to stroke, transient ischaemic attack, myocardial infarction, angina pectoris, etc.).","when_to_set_to_false":"Set to false if the patient does not have an existing diagnosis of any cardiovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an existing diagnosis of any cardiovascular disease.","meaning":"Boolean indicating whether the patient has an existing diagnosis of cardiovascular disease."} ;; "has existing cardiovascular disease"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident (stroke) in their history."} ;; "stroke"

(declare-const patient_has_finding_of_transient_cerebral_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a transient cerebral ischemia (transient ischaemic attack) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a transient cerebral ischemia (transient ischaemic attack) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a transient cerebral ischemia (transient ischaemic attack).","meaning":"Boolean indicating whether the patient has ever had a transient cerebral ischemia (transient ischaemic attack) in their history."} ;; "transient ischaemic attack"

(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction in their history."} ;; "myocardial infarction"

(declare-const patient_has_finding_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had angina pectoris at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had angina pectoris at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had angina pectoris.","meaning":"Boolean indicating whether the patient has ever had angina pectoris in their history."} ;; "angina pectoris"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_cerebrovascular_accident_inthehistory
           patient_has_finding_of_transient_cerebral_ischemia_inthehistory
           patient_has_finding_of_myocardial_infarction_inthehistory
           patient_has_finding_of_angina_pectoris_inthehistory)
       patient_has_finding_of_cardiovascular_disease_existing)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((stroke) OR (transient ischaemic attack) OR (myocardial infarction) OR (angina pectoris))."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_cardiovascular_disease_existing)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has existing cardiovascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_antihypertensive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or undergoing antihypertensive drug therapy.","when_to_set_to_false":"Set to false if the patient is not currently taking or undergoing antihypertensive drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking antihypertensive drug therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antihypertensive drug therapy."} ;; "antihypertensive drug therapy"
(declare-const patient_is_undergoing_aspirin_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or undergoing aspirin therapy.","when_to_set_to_false":"Set to false if the patient is not currently taking or undergoing aspirin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking aspirin therapy.","meaning":"Boolean indicating whether the patient is currently undergoing aspirin therapy."} ;; "aspirin therapy"
(declare-const patient_is_undergoing_statin_prophylaxis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or undergoing statin therapy.","when_to_set_to_false":"Set to false if the patient is not currently taking or undergoing statin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking statin therapy.","meaning":"Boolean indicating whether the patient is currently undergoing statin therapy."} ;; "statin therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_undergoing_antihypertensive_therapy_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is already taking antihypertensive drug therapy."

(assert
(! (not patient_is_undergoing_aspirin_therapy_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is already taking aspirin therapy."

(assert
(! (not patient_is_undergoing_statin_prophylaxis_now)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is already taking statin therapy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_clinical_indication_for_antihypertensive_drug_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical indications for treatment with antihypertensive drug therapy.","when_to_set_to_false":"Set to false if the patient currently does not have clinical indications for treatment with antihypertensive drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical indications for treatment with antihypertensive drug therapy.","meaning":"Boolean indicating whether the patient currently has clinical indications for treatment with antihypertensive drug therapy."} ;; "clinical indications for treatment with antihypertensive drug therapy"
(declare-const patient_has_clinical_indication_for_antihypertensive_drug_therapy_now@@already_exists Bool) ;; {"when_to_set_to_true":"Set to true if the clinical indication for antihypertensive drug therapy already exists for the patient.","when_to_set_to_false":"Set to false if the clinical indication for antihypertensive drug therapy does not already exist for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical indication for antihypertensive drug therapy already exists for the patient.","meaning":"Boolean indicating whether the clinical indication for antihypertensive drug therapy already exists for the patient."} ;; "already has clinical indications for treatment with antihypertensive drug therapy"
(declare-const patient_has_clinical_indication_for_aspirin_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical indications for treatment with aspirin therapy.","when_to_set_to_false":"Set to false if the patient currently does not have clinical indications for treatment with aspirin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical indications for treatment with aspirin therapy.","meaning":"Boolean indicating whether the patient currently has clinical indications for treatment with aspirin therapy."} ;; "clinical indications for treatment with aspirin therapy"
(declare-const patient_has_clinical_indication_for_aspirin_therapy_now@@already_exists Bool) ;; {"when_to_set_to_true":"Set to true if the clinical indication for aspirin therapy already exists for the patient.","when_to_set_to_false":"Set to false if the clinical indication for aspirin therapy does not already exist for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical indication for aspirin therapy already exists for the patient.","meaning":"Boolean indicating whether the clinical indication for aspirin therapy already exists for the patient."} ;; "already has clinical indications for treatment with aspirin therapy"
(declare-const patient_has_clinical_indication_for_statin_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical indications for treatment with statin therapy.","when_to_set_to_false":"Set to false if the patient currently does not have clinical indications for treatment with statin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical indications for treatment with statin therapy.","meaning":"Boolean indicating whether the patient currently has clinical indications for treatment with statin therapy."} ;; "clinical indications for treatment with statin therapy"
(declare-const patient_has_clinical_indication_for_statin_therapy_now@@already_exists Bool) ;; {"when_to_set_to_true":"Set to true if the clinical indication for statin therapy already exists for the patient.","when_to_set_to_false":"Set to false if the clinical indication for statin therapy does not already exist for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical indication for statin therapy already exists for the patient.","meaning":"Boolean indicating whether the clinical indication for statin therapy already exists for the patient."} ;; "already has clinical indications for treatment with statin therapy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_clinical_indication_for_antihypertensive_drug_therapy_now@@already_exists
      patient_has_clinical_indication_for_antihypertensive_drug_therapy_now)
   :named REQ2_AUXILIARY0)) ;; "already has clinical indications for treatment with antihypertensive drug therapy"

(assert
(! (=> patient_has_clinical_indication_for_aspirin_therapy_now@@already_exists
      patient_has_clinical_indication_for_aspirin_therapy_now)
   :named REQ2_AUXILIARY1)) ;; "already has clinical indications for treatment with aspirin therapy"

(assert
(! (=> patient_has_clinical_indication_for_statin_therapy_now@@already_exists
      patient_has_clinical_indication_for_statin_therapy_now)
   :named REQ2_AUXILIARY2)) ;; "already has clinical indications for treatment with statin therapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_clinical_indication_for_antihypertensive_drug_therapy_now@@already_exists)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient already has clinical indications for treatment with antihypertensive drug therapy."

(assert
(! (not patient_has_clinical_indication_for_aspirin_therapy_now@@already_exists)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient already has clinical indications for treatment with aspirin therapy."

(assert
(! (not patient_has_clinical_indication_for_statin_therapy_now@@already_exists)
   :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient already has clinical indications for treatment with statin therapy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement is available for now or the value is indeterminate.","meaning":"Numeric value of the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no diastolic blood pressure measurement is available for now or the value is indeterminate.","meaning":"Numeric value of the patient's current diastolic blood pressure in millimeters of mercury."} ;; "diastolic blood pressure"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 160))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systolic blood pressure > 160 millimeters of mercury."

(assert
(! (not (> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diastolic blood pressure > 100 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_total_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total cholesterol concentration in milligrams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current total cholesterol concentration in milligrams per deciliter."} ;; "total cholesterol concentration > 240 milligrams per deciliter"
(declare-const patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's low-density lipoprotein cholesterol concentration in milligrams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current low-density lipoprotein cholesterol concentration in milligrams per deciliter."} ;; "low-density lipoprotein cholesterol concentration > 190 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not (or
        (> patient_total_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter 240) ;; "total cholesterol concentration > 240 milligrams per deciliter"
        (> patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_milligrams_per_deciliter 190) ;; "low-density lipoprotein cholesterol concentration > 190 milligrams per deciliter"
      ))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has total cholesterol concentration > 240 milligrams per deciliter) OR (the patient has low-density lipoprotein cholesterol concentration > 190 milligrams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const hemoglobin_a1c_concentration_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the value of the patient's hemoglobin A1c concentration recorded at the present time, in percent (%).","when_to_set_to_null":"Set to null if the patient's hemoglobin A1c concentration value at the present time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's hemoglobin A1c concentration at the present time, in percent (%)."} ;; "hemoglobin A1c concentration > 6.0"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: probable diabetes mellitus is defined as hemoglobin A1c concentration > 6.0
(assert
(! (= patient_has_finding_of_diabetes_mellitus_now
     (> hemoglobin_a1c_concentration_value_recorded_now_withunit_percent 6.0))
:named REQ5_AUXILIARY0)) ;; "defined as hemoglobin A1c concentration > 6.0"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_diabetes_mellitus_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has probable diabetes mellitus (defined as hemoglobin A1c concentration > 6.0)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_contraindication_to_any_component_of_polypill_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to any component of the polypill.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to any component of the polypill.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to any component of the polypill.","meaning":"Boolean indicating whether the patient currently has a contraindication to any component of the polypill."} ;; "The patient is excluded if the patient has a contraindication to any component of the polypill."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_contraindication_to_any_component_of_polypill_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to any component of the polypill."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_contraindication_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of contraindication to aspirin.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of contraindication to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of contraindication to aspirin.","meaning":"Boolean indicating whether the patient currently has a clinical finding of contraindication to aspirin."} ;; "contraindication to aspirin"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_contraindication_to_aspirin_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to aspirin."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_history_of_allergy_to_aspirin Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented previous history of allergy to aspirin.","when_to_set_to_false":"Set to false if the patient does not have a documented previous history of allergy to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a previous history of allergy to aspirin.","meaning":"Boolean indicating whether the patient has a previous history of allergy to aspirin."} ;; "previous history of allergy to aspirin"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_history_of_allergy_to_aspirin)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous history of allergy to aspirin."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_peptic_ulcer_with_hemorrhage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with peptic ulcer with hemorrhage (peptic ulcer bleeding) at any time in their life.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with peptic ulcer with hemorrhage (peptic ulcer bleeding) at any time in their life.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of peptic ulcer with hemorrhage (peptic ulcer bleeding).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of peptic ulcer with hemorrhage (peptic ulcer bleeding) at any time in their life."} ;; "history of peptic ulcer bleeding at any time in the patient's life"

(declare-const patient_has_finding_of_peptic_ulcer_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a finding of peptic ulcer within the past 3 months.","when_to_set_to_false":"Set to false if the patient does not have a finding of peptic ulcer within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a finding of peptic ulcer within the past 3 months.","meaning":"Boolean indicating whether the patient has a finding of peptic ulcer within the past 3 months."} ;; "peptic ulcer within the past 3 months"

(declare-const patient_has_finding_of_peptic_ulcer_inthepast3months@@confirmed_by_endoscopic_evidence Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peptic ulcer finding within the past 3 months is confirmed by endoscopic evidence.","when_to_set_to_false":"Set to false if the patient's peptic ulcer finding within the past 3 months is not confirmed by endoscopic evidence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peptic ulcer finding within the past 3 months is confirmed by endoscopic evidence.","meaning":"Boolean indicating whether the patient's peptic ulcer finding within the past 3 months is confirmed by endoscopic evidence."} ;; "endoscopic evidence of peptic ulcer within the past 3 months"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_peptic_ulcer_inthepast3months@@confirmed_by_endoscopic_evidence
      patient_has_finding_of_peptic_ulcer_inthepast3months)
:named REQ9_AUXILIARY0)) ;; "endoscopic evidence of peptic ulcer within the past 3 months" implies "peptic ulcer within the past 3 months"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_has_diagnosis_of_peptic_ulcer_with_hemorrhage_inthehistory
            patient_has_finding_of_peptic_ulcer_inthepast3months@@confirmed_by_endoscopic_evidence))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of peptic ulcer bleeding at any time in the patient's life) OR (the patient has endoscopic evidence of peptic ulcer within the past 3 months)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_contraindication_to_hmg_coa_reductase_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to HMG-CoA reductase inhibitor (statin) therapy.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to HMG-CoA reductase inhibitor (statin) therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to HMG-CoA reductase inhibitor (statin) therapy.","meaning":"Boolean indicating whether the patient currently has a contraindication to HMG-CoA reductase inhibitor (statin) therapy."} ;; "contraindication to statin therapy"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_contraindication_to_hmg_coa_reductase_inhibitor_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to statin therapy."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic failure (liver failure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic failure (liver failure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic failure (liver failure).","meaning":"Boolean indicating whether the patient currently has hepatic failure (liver failure) now."} ;; "liver failure"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_hepatic_failure_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver failure."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_contraindication_to_further_blood_pressure_lowering_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to further blood pressure lowering therapy.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to further blood pressure lowering therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to further blood pressure lowering therapy.","meaning":"Boolean indicating whether the patient currently has a contraindication to further blood pressure lowering therapy."} ;; "The patient is excluded if the patient has a contraindication to further blood pressure lowering therapy."

(declare-const patient_is_undergoing_hypotensive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hypotensive therapy (blood pressure lowering therapy).","when_to_set_to_false":"Set to false if the patient is currently not undergoing hypotensive therapy (blood pressure lowering therapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing hypotensive therapy.","meaning":"Boolean indicating whether the patient is currently undergoing hypotensive therapy (blood pressure lowering therapy)."} ;; "blood pressure lowering therapy"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (not patient_has_contraindication_to_further_blood_pressure_lowering_therapy_now)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to further blood pressure lowering therapy."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
;; patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury is already declared
;; patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury is already declared

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (<= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90))
:named REQ13_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has systolic blood pressure less than or equal to 90 millimeters of mercury."

(assert
(! (not (<= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 70))
:named REQ13_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has diastolic blood pressure less than or equal to 70 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_orthostatic_hypotension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of orthostatic (postural) hypotension, regardless of whether it is symptomatic.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of orthostatic (postural) hypotension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has orthostatic (postural) hypotension.","meaning":"Boolean indicating whether the patient currently has orthostatic (postural) hypotension."} ;; "postural hypotension"
(declare-const patient_has_finding_of_orthostatic_hypotension_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has orthostatic (postural) hypotension and is experiencing symptoms attributable to it.","when_to_set_to_false":"Set to false if the patient currently has orthostatic (postural) hypotension but is not experiencing symptoms attributable to it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the orthostatic (postural) hypotension is symptomatic.","meaning":"Boolean indicating whether the patient's orthostatic (postural) hypotension is symptomatic."} ;; "symptomatic postural hypotension"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_orthostatic_hypotension_now@@symptomatic
      patient_has_finding_of_orthostatic_hypotension_now)
:named REQ14_AUXILIARY0)) ;; "symptomatic postural hypotension""

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_orthostatic_hypotension_now@@symptomatic)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptomatic postural hypotension."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const mean_seated_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's mean seated blood pressure measured now, in mmHg.","when_to_set_to_null":"Set to null if the mean seated blood pressure measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's mean seated blood pressure measured now, in mmHg."} ;; "mean seated blood pressure measured now, in millimeters of mercury"
(declare-const mean_standing_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's mean standing blood pressure measured now, in mmHg.","when_to_set_to_null":"Set to null if the mean standing blood pressure measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's mean standing blood pressure measured now, in mmHg."} ;; "mean standing blood pressure measured now, in millimeters of mercury"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not (> (abs (- mean_seated_blood_pressure_value_recorded_now_withunit_mmhg
                   mean_standing_blood_pressure_value_recorded_now_withunit_mmhg))
           20))
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a difference between mean seated blood pressure and mean standing blood pressure greater than 20 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_contraindication_to_thiazide_diuretic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to thiazide diuretic therapy.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to thiazide diuretic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to thiazide diuretic therapy.","meaning":"Boolean indicating whether the patient currently has a contraindication to thiazide diuretic therapy."} ;; "The patient is excluded if the patient has a contraindication to thiazide therapy."

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
  (! (not patient_has_contraindication_to_thiazide_diuretic_now)
     :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to thiazide therapy."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_diagnosis_of_gout_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gout.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gout.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gout.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gout."} ;; "the patient has gout"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "the patient is male"
(declare-const patient_uric_acid_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's uric acid concentration in milligrams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current uric acid concentration in milligrams per deciliter."} ;; "uric acid concentration"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Exclusion: (male AND uric acid > 8) OR (female AND uric acid > 6) OR gout
(assert
(! (not (or (and patient_sex_is_male_now
                 (> patient_uric_acid_measurement_value_recorded_now_withunit_milligrams_per_deciliter 8))
            (and patient_sex_is_female_now
                 (> patient_uric_acid_measurement_value_recorded_now_withunit_milligrams_per_deciliter 6))
            patient_has_diagnosis_of_gout_now))
   :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is male AND the patient has uric acid concentration greater than 8 milligrams per deciliter) OR (the patient is female AND the patient has uric acid concentration greater than 6 milligrams per deciliter) OR (the patient has gout))."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current creatinine concentration in milligrams per deciliter (mg/dL) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current creatinine concentration in mg/dL."} ;; "creatinine concentration greater than 1.2 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (> patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 1.2))
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine concentration greater than 1.2 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const alcohol_consumption_volume_per_day_value_recorded_in_cubic_centimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's average daily alcohol consumption in cubic centimeters if available.","when_to_set_to_null":"Set to null if the patient's average daily alcohol consumption in cubic centimeters is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's average daily alcohol consumption in cubic centimeters."} ;; "more than 60 cubic centimeters for women OR more than 80 cubic centimeters for men"
(declare-const drug_use_frequency_per_week_value_recorded_in_times Real) ;; {"when_to_set_to_value":"Set to the numeric value of the number of times per week the patient uses drugs (eating or smoking) if available.","when_to_set_to_null":"Set to null if the number of times per week the patient uses drugs (eating or smoking) is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of times per week the patient uses drugs (eating or smoking)."} ;; "eating or smoking more than 4 times per week"
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcohol abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse at any time in the past."} ;; "history of alcohol abuse"
(declare-const patient_has_finding_of_dementia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of dementia at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of dementia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of dementia.","meaning":"Boolean indicating whether the patient has a history of dementia at any time in the past."} ;; "dementia"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of drug misuse behavior at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of drug misuse behavior at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug misuse behavior.","meaning":"Boolean indicating whether the patient has a history of drug misuse behavior at any time in the past."} ;; "history of drug abuse"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has a history of malignant neoplastic disease (cancer) at any time in the past."} ;; "cancer"
(declare-const patient_has_finding_of_mania_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of mania at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of mania at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of mania.","meaning":"Boolean indicating whether the patient has a history of mania at any time in the past."} ;; "mania"
(declare-const patient_has_finding_of_psychotic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of psychotic disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of psychotic disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of psychotic disorder.","meaning":"Boolean indicating whether the patient has a history of psychotic disorder at any time in the past."} ;; "psychosis"
(declare-const patient_has_finding_of_schizophrenia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of schizophrenia at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of schizophrenia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of schizophrenia.","meaning":"Boolean indicating whether the patient has a history of schizophrenia at any time in the past."} ;; "schizophrenia"
(declare-const patient_has_finding_of_severe_depression_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of severe depression at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of severe depression at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of severe depression.","meaning":"Boolean indicating whether the patient has a history of severe depression at any time in the past."} ;; "severe depression"
(declare-const patient_has_life_threatening_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another life-threatening condition.","when_to_set_to_false":"Set to false if the patient currently does not have another life-threatening condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another life-threatening condition.","meaning":"Boolean indicating whether the patient currently has another life-threatening condition."} ;; "other life-threatening condition"
(declare-const patient_has_limiting_psychiatric_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric illness that is limiting.","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric illness that is limiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric illness that is limiting.","meaning":"Boolean indicating whether the patient currently has a psychiatric illness that is limiting."} ;; "limiting psychiatric illness"
(declare-const patient_has_physical_disability_sufficient_to_prevent_walking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical disability sufficient to prevent the patient from walking.","when_to_set_to_false":"Set to false if the patient currently does not have a physical disability sufficient to prevent the patient from walking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical disability sufficient to prevent the patient from walking.","meaning":"Boolean indicating whether the patient currently has a physical disability sufficient to prevent the patient from walking."} ;; "limiting physical disability sufficient to prevent the patient from walking"
(declare-const patient_has_predominant_medical_problem_that_may_limit_compliance_with_study_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another predominant medical problem that may limit compliance with study treatment.","when_to_set_to_false":"Set to false if the patient currently does not have another predominant medical problem that may limit compliance with study treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another predominant medical problem that may limit compliance with study treatment.","meaning":"Boolean indicating whether the patient currently has another predominant medical problem that may limit compliance with study treatment."} ;; "another predominant medical problem that may limit compliance with study treatment"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Non-exhaustive examples for alcohol abuse: (more than 60cc for women OR more than 80cc for men) implies alcohol abuse
(assert
(! (=> (or (and patient_sex_is_female_now
                (> alcohol_consumption_volume_per_day_value_recorded_in_cubic_centimeters 60))
           (and patient_sex_is_male_now
                (> alcohol_consumption_volume_per_day_value_recorded_in_cubic_centimeters 80)))
        patient_has_finding_of_alcohol_abuse_inthehistory)
   :named REQ19_AUXILIARY0)) ;; "history of alcohol abuse (more than 60 cubic centimeters for women OR more than 80 cubic centimeters for men)"

;; Non-exhaustive examples for drug abuse: (intravenous drug abuser OR eating or smoking more than 4 times per week) implies drug misuse behavior
;; Note: Intravenous drug abuser is not further specified, so only the frequency example is encoded here.
(assert
(! (=> (> drug_use_frequency_per_week_value_recorded_in_times 4)
        patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory)
   :named REQ19_AUXILIARY1)) ;; "history of drug abuse (eating or smoking more than 4 times per week)"

;; Non-exhaustive examples for limiting psychiatric illness: (mania, schizophrenia, severe depression, psychosis, dementia) implies limiting psychiatric illness
(assert
(! (=> (or patient_has_finding_of_mania_inthehistory
           patient_has_finding_of_schizophrenia_inthehistory
           patient_has_finding_of_severe_depression_inthehistory
           patient_has_finding_of_psychotic_disorder_inthehistory
           patient_has_finding_of_dementia_inthehistory)
        patient_has_limiting_psychiatric_illness_now)
   :named REQ19_AUXILIARY2)) ;; "limiting psychiatric illness with non-exhaustive examples (mania, schizophrenia, severe depression, psychosis, dementia)"

;; Non-exhaustive example for other life-threatening condition: (cancer) implies life-threatening condition
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory
        patient_has_life_threatening_condition_now)
   :named REQ19_AUXILIARY3)) ;; "other life-threatening condition with non-exhaustive examples (cancer)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_limiting_psychiatric_illness_now
        patient_has_predominant_medical_problem_that_may_limit_compliance_with_study_treatment_now)
   :named REQ19_AUXILIARY4)) ;; "limiting psychiatric illness" is a type of predominant medical problem

(assert
(! (=> patient_has_physical_disability_sufficient_to_prevent_walking_now
        patient_has_predominant_medical_problem_that_may_limit_compliance_with_study_treatment_now)
   :named REQ19_AUXILIARY5)) ;; "limiting physical disability sufficient to prevent the patient from walking" is a type of predominant medical problem

(assert
(! (=> patient_has_life_threatening_condition_now
        patient_has_predominant_medical_problem_that_may_limit_compliance_with_study_treatment_now)
   :named REQ19_AUXILIARY6)) ;; "other life-threatening condition" is a type of predominant medical problem

(assert
(! (=> patient_has_finding_of_alcohol_abuse_inthehistory
        patient_has_predominant_medical_problem_that_may_limit_compliance_with_study_treatment_now)
   :named REQ19_AUXILIARY7)) ;; "history of alcohol abuse" is a type of predominant medical problem

(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory
        patient_has_predominant_medical_problem_that_may_limit_compliance_with_study_treatment_now)
   :named REQ19_AUXILIARY8)) ;; "history of drug abuse" is a type of predominant medical problem

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_predominant_medical_problem_that_may_limit_compliance_with_study_treatment_now)
   :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another predominant medical problem that may limit compliance with study treatment."
