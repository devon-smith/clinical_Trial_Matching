;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any clinical trial.","when_to_set_to_false":"Set to false if the patient is currently not participating in any clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any clinical trial.","meaning":"Boolean indicating whether the patient is currently involved in a clinical trial."} ;; "clinical trials"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_undergoing_clinical_trial_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is involved in other clinical trials."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_p2y12_receptor_antagonist_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a P2Y12 receptor antagonist drug treatment within the past one year.","when_to_set_to_false":"Set to false if the patient has not been exposed to a P2Y12 receptor antagonist drug treatment within the past one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a P2Y12 receptor antagonist drug treatment within the past one year.","meaning":"Boolean indicating whether the patient has been exposed to a P2Y12 receptor antagonist drug treatment within the past one year."} ;; "history of P2Y12 receptor antagonist drug treatment within the recent one year"

(declare-const patient_is_exposed_to_immunosuppressant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to an immunosuppressant at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to an immunosuppressant at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to an immunosuppressant.","meaning":"Boolean indicating whether the patient has ever been exposed to an immunosuppressant at any time in the past."} ;; "history of immunosuppressive agent treatment"

(declare-const patient_is_exposed_to_immunosuppressant_inthehistory@@long_term_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of exposure to an immunosuppressant was of long-term duration.","when_to_set_to_false":"Set to false if the patient's history of exposure to an immunosuppressant was not of long-term duration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to an immunosuppressant was of long-term duration.","meaning":"Boolean indicating whether the patient's exposure to an immunosuppressant was of long-term duration."} ;; "history of long-term use of immunosuppressive agent treatment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for long-term use implies immunosuppressant exposure in history
(assert
(! (=> patient_is_exposed_to_immunosuppressant_inthehistory@@long_term_use
      patient_is_exposed_to_immunosuppressant_inthehistory)
:named REQ1_AUXILIARY0)) ;; "history of long-term use of immunosuppressive agent treatment""

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have a history of P2Y12 receptor antagonist drug treatment within the recent one year
(assert
(! (not patient_is_exposed_to_p2y12_receptor_antagonist_inthepast1years)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of P2Y12 receptor antagonist drug treatment within the recent one year."

;; Exclusion: patient must NOT have a history of long-term use of immunosuppressive agent treatment
(assert
(! (not patient_is_exposed_to_immunosuppressant_inthehistory@@long_term_use)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of long-term use of immunosuppressive agent treatment."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction."} ;; "myocardial infarction"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with recurrent myocardial infarction.","when_to_set_to_false":"Set to false if the patient has ever been diagnosed with myocardial infarction but it is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction diagnosis is recurrent.","meaning":"Boolean indicating whether the patient's myocardial infarction diagnosis is recurrent."} ;; "recurrent myocardial infarction"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft surgery at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass graft surgery at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass graft surgery."} ;; "coronary artery bypass graft surgery"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention."} ;; "percutaneous coronary intervention"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@rescue Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention as a rescue procedure at any point in their history.","when_to_set_to_false":"Set to false if the patient has ever undergone percutaneous coronary intervention but not as a rescue procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percutaneous coronary intervention was performed as a rescue procedure.","meaning":"Boolean indicating whether the patient's percutaneous coronary intervention was performed as a rescue procedure."} ;; "rescue percutaneous coronary intervention"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for recurrent myocardial infarction
(assert
(! (=> patient_has_diagnosis_of_myocardial_infarction_inthehistory@@recurrent
      patient_has_diagnosis_of_myocardial_infarction_inthehistory)
:named REQ2_AUXILIARY0)) ;; "recurrent myocardial infarction"

;; Qualifier variable implies corresponding stem variable for rescue percutaneous coronary intervention
(assert
(! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@rescue
      patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
:named REQ2_AUXILIARY1)) ;; "rescue percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: recurrent myocardial infarction
(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory@@recurrent)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recurrent myocardial infarction."

;; Exclusion: previous history of coronary artery bypass graft surgery
(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous history of coronary artery bypass graft surgery."

;; Exclusion: previous history of rescue percutaneous coronary intervention
(assert
(! (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@rescue)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous history of rescue percutaneous coronary intervention."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bleeding.","meaning":"Boolean indicating whether the patient currently has bleeding."} ;; "active bleeding"
(declare-const patient_has_finding_of_bleeding_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bleeding and the bleeding is active.","when_to_set_to_false":"Set to false if the patient currently has bleeding but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bleeding is active.","meaning":"Boolean indicating whether the patient's current bleeding is active."} ;; "active bleeding"
(declare-const patient_has_finding_of_bleeding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of bleeding at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of bleeding at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had the clinical finding of bleeding.","meaning":"Boolean indicating whether the patient has ever had bleeding in the past."} ;; "history of bleeding"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_bleeding_now@@active
      patient_has_finding_of_bleeding_now)
:named REQ3_AUXILIARY0)) ;; "active bleeding"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have active bleeding
(assert
(! (not patient_has_finding_of_bleeding_now@@active)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active bleeding."

;; Exclusion: patient must NOT have a history of bleeding
(assert
(! (not patient_has_finding_of_bleeding_inthehistory)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of bleeding."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@obvious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection is obvious.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection is not obvious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection is obvious.","meaning":"Boolean indicating whether the patient's current disorder due to infection is obvious."} ;; "obvious infection"
(declare-const patient_axillary_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current axillary temperature in degrees Celsius is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current axillary temperature in degrees Celsius."} ;; "axillary temperature"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@obvious
       patient_has_finding_of_disorder_due_to_infection_now)
   :named REQ4_AUXILIARY0)) ;; "obvious infection"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have BOTH (obvious infection) AND (axillary temperature > 38.0°C)
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_now@@obvious
             (> patient_axillary_temperature_value_recorded_now_withunit_celsius 38.0)))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has an obvious infection) AND (the patient has a body temperature (axillary temperature) greater than 38.0 degrees Celsius)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_autoimmune_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of autoimmune disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of autoimmune disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of autoimmune disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of autoimmune disease."} ;; "autoimmune disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_autoimmune_disease_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has autoimmune disease."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy)."} ;; "malignancy"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignancy."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_surgical_procedure_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any surgical procedure within the past six months.","when_to_set_to_false":"Set to false if the patient has not undergone any surgical procedure within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any surgical procedure within the past six months.","meaning":"Boolean indicating whether the patient has undergone any surgical procedure within the past six months."} ;; "surgery"
(declare-const patient_has_undergone_surgical_procedure_inthepast6months@@is_major Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone by the patient within the past six months is classified as major.","when_to_set_to_false":"Set to false if the surgical procedure undergone by the patient within the past six months is not classified as major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure is major.","meaning":"Boolean indicating whether the surgical procedure undergone within the past six months is major."} ;; "major surgery within the recent six months"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_surgical_procedure_inthepast6months@@is_major
      patient_has_undergone_surgical_procedure_inthepast6months)
:named REQ7_AUXILIARY0)) ;; "major surgery within the recent six months"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthepast6months@@is_major)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received major surgery within the recent six months."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's left ventricular ejection fraction (LVEF) recorded now is available.","when_to_set_to_null":"Set to null if no such percentage measurement recorded now is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current left ventricular ejection fraction (LVEF)."} ;; "left ventricular ejection fraction less than 30 percent"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (< patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 30))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a left ventricular ejection fraction less than 30 percent."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "life expectancy less than one year"
(declare-const patient_life_expectancy_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current life expectancy in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current life expectancy in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current life expectancy in years."} ;; "life expectancy less than one year"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (< patient_life_expectancy_value_recorded_now_in_years 1))
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life expectancy less than one year."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_decreased_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased liver function.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased liver function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased liver function.","meaning":"Boolean indicating whether the patient currently has decreased liver function."} ;; "liver function deterioration"

(declare-const patient_has_finding_of_decreased_liver_function_now@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has decreased liver function and the severity is moderate.","when_to_set_to_false":"Set to false if the patient currently has decreased liver function but the severity is not moderate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of decreased liver function is moderate.","meaning":"Boolean indicating whether the patient's current decreased liver function is moderate in severity."} ;; "moderate liver function deterioration"

(declare-const patient_has_finding_of_decreased_liver_function_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has decreased liver function and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has decreased liver function but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of decreased liver function is severe.","meaning":"Boolean indicating whether the patient's current decreased liver function is severe in severity."} ;; "severe liver function deterioration"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_decreased_liver_function_now@@severity_moderate
       patient_has_finding_of_decreased_liver_function_now)
   :named REQ10_AUXILIARY0)) ;; "moderate liver function deterioration"

(assert
(! (=> patient_has_finding_of_decreased_liver_function_now@@severity_severe
       patient_has_finding_of_decreased_liver_function_now)
   :named REQ10_AUXILIARY1)) ;; "severe liver function deterioration"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_decreased_liver_function_now@@severity_moderate)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate liver function deterioration."

(assert
(! (not patient_has_finding_of_decreased_liver_function_now@@severity_severe)
   :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe liver function deterioration."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_end_stage_renal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of end-stage renal disease (end-stage renal failure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of end-stage renal disease (end-stage renal failure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has end-stage renal disease (end-stage renal failure).","meaning":"Boolean indicating whether the patient currently has end-stage renal disease (end-stage renal failure)."} ;; "end-stage renal failure"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not patient_has_finding_of_end_stage_renal_disease_now)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has end-stage renal failure."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_other_condition_that_may_put_at_risk_investigator_opinion_now Bool) ;; {"when_to_set_to_true":"Set to true if, in the investigator's opinion, the patient currently has any other condition that may put the patient at risk.","when_to_set_to_false":"Set to false if, in the investigator's opinion, the patient currently does not have any other condition that may put the patient at risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other condition that may put the patient at risk in the investigator's opinion.","meaning":"Boolean indicating whether the patient currently has any other condition that may put the patient at risk in the investigator's opinion."} ;; "other conditions that may put the patient at risk in the investigators' opinion"
(declare-const patient_has_other_condition_that_may_influence_study_results_investigator_opinion_now Bool) ;; {"when_to_set_to_true":"Set to true if, in the investigator's opinion, the patient currently has any other condition that may influence study results.","when_to_set_to_false":"Set to false if, in the investigator's opinion, the patient currently does not have any other condition that may influence study results.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other condition that may influence study results in the investigator's opinion.","meaning":"Boolean indicating whether the patient currently has any other condition that may influence study results in the investigator's opinion."} ;; "other conditions that may influence study results in the investigators' opinion"
(declare-const patient_has_increased_risk_of_bradycardiac_event_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an increased risk of bradycardiac event, as determined in the investigators' opinion.","when_to_set_to_false":"Set to false if the patient currently does not have an increased risk of bradycardiac event, as determined in the investigators' opinion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an increased risk of bradycardiac event, as determined in the investigators' opinion.","meaning":"Boolean indicating whether the patient currently has an increased risk of bradycardiac event, as determined in the investigators' opinion."} ;; "increased risk of bradycardiac event"
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has thrombocytopenic disorder (thrombocytopenia).","when_to_set_to_false":"Set to false if the patient currently does not have thrombocytopenic disorder (thrombocytopenia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombocytopenic disorder (thrombocytopenia).","meaning":"Boolean indicating whether the patient currently has thrombocytopenic disorder (thrombocytopenia)."} ;; "thrombocytopenia"
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now@@clinically_important Bool) ;; {"when_to_set_to_true":"Set to true if the patient's thrombocytopenic disorder (thrombocytopenia) is clinically important.","when_to_set_to_false":"Set to false if the patient's thrombocytopenic disorder (thrombocytopenia) is not clinically important.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's thrombocytopenic disorder (thrombocytopenia) is clinically important.","meaning":"Boolean indicating whether the patient's thrombocytopenic disorder (thrombocytopenia) is clinically important."} ;; "known clinically important thrombocytopenia"
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has anemia.","when_to_set_to_false":"Set to false if the patient currently does not have anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anemia.","meaning":"Boolean indicating whether the patient currently has anemia."} ;; "anemia"
(declare-const patient_has_finding_of_anemia_now@@clinically_important Bool) ;; {"when_to_set_to_true":"Set to true if the patient's anemia is clinically important.","when_to_set_to_false":"Set to false if the patient's anemia is not clinically important.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's anemia is clinically important.","meaning":"Boolean indicating whether the patient's anemia is clinically important."} ;; "known clinically important anemia"
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hemodynamic instability.","when_to_set_to_false":"Set to false if the patient currently does not have hemodynamic instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hemodynamic instability.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability."} ;; "hemodynamic instability"
(declare-const patient_has_finding_of_hemodynamic_instability_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hemodynamic instability is severe.","when_to_set_to_false":"Set to false if the patient's hemodynamic instability is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hemodynamic instability is severe.","meaning":"Boolean indicating whether the patient's hemodynamic instability is severe."} ;; "severe hemodynamic instability"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples imply umbrella term: "increased risk of bradycardiac event", "known clinically important thrombocytopenia", "known clinically important anemia", "severe hemodynamic instability" => may put at risk
(assert
(! (=> (or patient_has_increased_risk_of_bradycardiac_event_now
         patient_has_finding_of_thrombocytopenic_disorder_now@@clinically_important
         patient_has_finding_of_anemia_now@@clinically_important
         patient_has_finding_of_hemodynamic_instability_now@@severe)
    patient_has_other_condition_that_may_put_at_risk_investigator_opinion_now)
:named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples (increased risk of bradycardiac event, known clinically important thrombocytopenia, known clinically important anemia, severe hemodynamic instability)"

;; Non-exhaustive examples imply umbrella term: "increased risk of bradycardiac event", "known clinically important thrombocytopenia", "known clinically important anemia", "severe hemodynamic instability" => may influence study results
(assert
(! (=> (or patient_has_increased_risk_of_bradycardiac_event_now
         patient_has_finding_of_thrombocytopenic_disorder_now@@clinically_important
         patient_has_finding_of_anemia_now@@clinically_important
         patient_has_finding_of_hemodynamic_instability_now@@severe)
    patient_has_other_condition_that_may_influence_study_results_investigator_opinion_now)
:named REQ12_AUXILIARY1)) ;; "with non-exhaustive examples (increased risk of bradycardiac event, known clinically important thrombocytopenia, known clinically important anemia, severe hemodynamic instability)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_thrombocytopenic_disorder_now@@clinically_important
      patient_has_finding_of_thrombocytopenic_disorder_now)
:named REQ12_AUXILIARY2)) ;; "known clinically important thrombocytopenia"

(assert
(! (=> patient_has_finding_of_anemia_now@@clinically_important
      patient_has_finding_of_anemia_now)
:named REQ12_AUXILIARY3)) ;; "known clinically important anemia"

(assert
(! (=> patient_has_finding_of_hemodynamic_instability_now@@severe
      patient_has_finding_of_hemodynamic_instability_now)
:named REQ12_AUXILIARY4)) ;; "severe hemodynamic instability"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_other_condition_that_may_put_at_risk_investigator_opinion_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other conditions that may put the patient at risk in the investigators' opinion..."

(assert
(! (not patient_has_other_condition_that_may_influence_study_results_investigator_opinion_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other conditions that may influence study results in the investigators' opinion..."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_contraindication_to_investigational_products_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to investigational products.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to investigational products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to investigational products.","meaning":"Boolean indicating whether the patient currently has any contraindication to investigational products."} ;; "The patient is excluded if the patient has other contraindication to investigational products."

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_contraindication_to_investigational_products_now)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other contraindication to investigational products."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_condition_increasing_risk_for_noncompliance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition that increases the risk for noncompliance.","when_to_set_to_false":"Set to false if the patient currently does not have any condition that increases the risk for noncompliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any condition that increases the risk for noncompliance.","meaning":"Boolean indicating whether the patient currently has any condition that increases the risk for noncompliance."} ;; "any condition that increases the risk for noncompliance"
(declare-const patient_has_condition_increasing_risk_for_lost_to_follow_up_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition that increases the risk for being lost to follow-up.","when_to_set_to_false":"Set to false if the patient currently does not have any condition that increases the risk for being lost to follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any condition that increases the risk for being lost to follow-up.","meaning":"Boolean indicating whether the patient currently has any condition that increases the risk for being lost to follow-up."} ;; "any condition that increases the risk for being lost to follow-up"
(declare-const patient_has_finding_of_lost_to_follow_up_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of being lost to follow-up.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of being lost to follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of being lost to follow-up.","meaning":"Boolean indicating whether the patient currently has the clinical finding of being lost to follow-up."} ;; "lost to follow-up"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; The clinical finding of being lost to follow-up implies a condition increasing risk for being lost to follow-up
(assert
(! (=> patient_has_finding_of_lost_to_follow_up_now
      patient_has_condition_increasing_risk_for_lost_to_follow_up_now)
   :named REQ14_AUXILIARY0)) ;; "lost to follow-up" implies "condition that increases the risk for being lost to follow-up"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT have any condition that increases the risk for noncompliance OR being lost to follow-up
(assert
(! (not (or patient_has_condition_increasing_risk_for_noncompliance_now
            patient_has_condition_increasing_risk_for_lost_to_follow_up_now))
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition that increases the risk for noncompliance OR any condition that increases the risk for being lost to follow-up."
