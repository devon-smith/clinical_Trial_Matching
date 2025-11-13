;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "acute coronary syndrome"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_acute_coronary_syndrome_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute coronary syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_generalized_ischemic_myocardial_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of generalized ischemic myocardial dysfunction (ischemic cardiomyopathy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of generalized ischemic myocardial dysfunction (ischemic cardiomyopathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of generalized ischemic myocardial dysfunction (ischemic cardiomyopathy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of generalized ischemic myocardial dysfunction (ischemic cardiomyopathy)."} ;; "ischemic cardiomyopathy"
(declare-const patient_has_diagnosis_of_generalized_ischemic_myocardial_dysfunction_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of generalized ischemic myocardial dysfunction (ischemic cardiomyopathy) is documented.","when_to_set_to_false":"Set to false if the patient's diagnosis of generalized ischemic myocardial dysfunction (ischemic cardiomyopathy) is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is documented.","meaning":"Boolean indicating whether the patient's diagnosis of generalized ischemic myocardial dysfunction (ischemic cardiomyopathy) is documented."} ;; "documented ischemic cardiomyopathy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_generalized_ischemic_myocardial_dysfunction_now@@documented
      patient_has_diagnosis_of_generalized_ischemic_myocardial_dysfunction_now)
   :named REQ1_AUXILIARY0)) ;; "documented ischemic cardiomyopathy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_generalized_ischemic_myocardial_dysfunction_now@@documented)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has documented ischemic cardiomyopathy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has atrial fibrillation."} ;; "atrial fibrillation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_atrial_fibrillation_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrial fibrillation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine concentration in mg/dL is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine concentration in mg/dL."} ;; "serum creatinine concentration > 3.0 mg/dL"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 3.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum creatinine concentration > 3.0 mg/dL."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure in mmHg is recorded now.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement in mmHg is available for the current time or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} ;; "systolic blood pressure < 90 mmHg"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not (< patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 90))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systolic blood pressure < 90 mmHg."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a current hematocrit (packed cell volume) measurement is available.","when_to_set_to_null":"Set to null if no current hematocrit measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current hematocrit (packed cell volume) level."} ;; "hematocrit > 45%"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (> patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent 45))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hematocrit > 45%."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_patient_s_condition_unstable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical instability.","when_to_set_to_false":"Set to false if the patient currently does not have clinical instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical instability.","meaning":"Boolean indicating whether the patient currently has clinical instability."} ;; "clinical instability"

(declare-const patient_has_finding_of_patient_s_condition_unstable_now@@likely_to_require_intravenous_vasopressor_or_vasoactive_drug_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical instability is likely to require intravenous vasopressor therapy or intravenous vasoactive drug therapy.","when_to_set_to_false":"Set to false if the patient's current clinical instability is not likely to require intravenous vasopressor therapy or intravenous vasoactive drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current clinical instability is likely to require intravenous vasopressor therapy or intravenous vasoactive drug therapy.","meaning":"Boolean indicating whether the patient's current clinical instability is likely to require intravenous vasopressor therapy or intravenous vasoactive drug therapy."} ;; "clinical instability likely to require (intravenous vasopressor therapy OR intravenous vasoactive drug therapy)"

(declare-const patient_has_finding_of_receiving_intravenous_vasopressor_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving intravenous vasopressor therapy during the present hospitalization.","when_to_set_to_false":"Set to false if the patient is not currently receiving intravenous vasopressor therapy during the present hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving intravenous vasopressor therapy during the present hospitalization.","meaning":"Boolean indicating whether the patient is currently receiving intravenous vasopressor therapy during the present hospitalization."} ;; "intravenous vasopressor therapy"

(declare-const patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving intravenous vasoactive drug therapy during the present hospitalization.","when_to_set_to_false":"Set to false if the patient is not currently receiving intravenous vasoactive drug therapy during the present hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving intravenous vasoactive drug therapy during the present hospitalization.","meaning":"Boolean indicating whether the patient is currently receiving intravenous vasoactive drug therapy during the present hospitalization."} ;; "intravenous vasoactive drug therapy"

(declare-const patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@milrinone_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving intravenous milrinone therapy during the present hospitalization.","when_to_set_to_false":"Set to false if the patient is not currently receiving intravenous milrinone therapy during the present hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving intravenous milrinone therapy during the present hospitalization.","meaning":"Boolean indicating whether the patient is currently receiving intravenous milrinone therapy during the present hospitalization."} ;; "milrinone therapy"

(declare-const patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@dobutamine_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving intravenous dobutamine therapy during the present hospitalization.","when_to_set_to_false":"Set to false if the patient is not currently receiving intravenous dobutamine therapy during the present hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving intravenous dobutamine therapy during the present hospitalization.","meaning":"Boolean indicating whether the patient is currently receiving intravenous dobutamine therapy during the present hospitalization."} ;; "dobutamine therapy"

(declare-const patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@nitroglycerin_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving intravenous nitroglycerin therapy during the present hospitalization.","when_to_set_to_false":"Set to false if the patient is not currently receiving intravenous nitroglycerin therapy during the present hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving intravenous nitroglycerin therapy during the present hospitalization.","meaning":"Boolean indicating whether the patient is currently receiving intravenous nitroglycerin therapy during the present hospitalization."} ;; "nitroglycerin therapy"

(declare-const patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@nesiritide_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving intravenous nesiritide therapy during the present hospitalization.","when_to_set_to_false":"Set to false if the patient is not currently receiving intravenous nesiritide therapy during the present hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving intravenous nesiritide therapy during the present hospitalization.","meaning":"Boolean indicating whether the patient is currently receiving intravenous nesiritide therapy during the present hospitalization."} ;; "nesiritide therapy"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies stem variable for clinical instability
(assert
(! (=> patient_has_finding_of_patient_s_condition_unstable_now@@likely_to_require_intravenous_vasopressor_or_vasoactive_drug_therapy
       patient_has_finding_of_patient_s_condition_unstable_now)
    :named REQ6_AUXILIARY0)) ;; "clinical instability likely to require (intravenous vasopressor therapy OR intravenous vasoactive drug therapy)"

;; Non-exhaustive examples: specific therapies imply umbrella vasoactive drug therapy
(assert
(! (=> (or patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@milrinone_therapy
           patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@dobutamine_therapy
           patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@nitroglycerin_therapy
           patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@nesiritide_therapy)
       patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now)
    :named REQ6_AUXILIARY1)) ;; "with non-exhaustive examples (milrinone therapy, dobutamine therapy, nitroglycerin therapy, nesiritide therapy)"

;; Qualifier variables imply corresponding stem variable for each specific vasoactive drug therapy
(assert
(! (=> patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@milrinone_therapy
       patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now)
    :named REQ6_AUXILIARY2)) ;; "milrinone therapy"

(assert
(! (=> patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@dobutamine_therapy
       patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now)
    :named REQ6_AUXILIARY3)) ;; "dobutamine therapy"

(assert
(! (=> patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@nitroglycerin_therapy
       patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now)
    :named REQ6_AUXILIARY4)) ;; "nitroglycerin therapy"

(assert
(! (=> patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now@@nesiritide_therapy
       patient_has_finding_of_receiving_intravenous_vasoactive_drug_therapy_now)
    :named REQ6_AUXILIARY5)) ;; "nesiritide therapy"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: Exclude if clinical instability likely to require intravenous vasopressor therapy
(assert
(! (not patient_has_finding_of_patient_s_condition_unstable_now@@likely_to_require_intravenous_vasopressor_or_vasoactive_drug_therapy)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical instability likely to require intravenous vasopressor therapy during the present hospitalization."

;; Component 1: Exclude if clinical instability likely to require intravenous vasoactive drug therapy (with non-exhaustive examples)
;; Note: The same qualifier variable covers both vasopressor and vasoactive drug therapy as per variable definition.
;; If a more granular variable for "likely to require intravenous vasoactive drug therapy" existed, it would be used here.
;; As per the variable set, the assertion is the same as above.
;; If the intent is to assert separately for vasoactive drug therapy, you would need a distinct qualifier variable.
;; Here, we assert the same variable for both components, as per the available variable set.
(assert
(! (not patient_has_finding_of_patient_s_condition_unstable_now@@likely_to_require_intravenous_vasopressor_or_vasoactive_drug_therapy)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical instability likely to require intravenous vasoactive drug therapy (with non-exhaustive examples: milrinone therapy, dobutamine therapy, nitroglycerin therapy, nesiritide therapy) during the present hospitalization."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary hypertension."} ;; "pulmonary hypertension"

(declare-const patient_has_finding_of_pulmonary_hypertension_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary hypertension and it is severe.","when_to_set_to_false":"Set to false if the patient currently has pulmonary hypertension and it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary hypertension is severe.","meaning":"Boolean indicating whether the patient's current pulmonary hypertension is severe."} ;; "severe pulmonary hypertension"

(declare-const patient_has_finding_of_pulmonary_hypertension_now@@treated_with_drug_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary hypertension and is being treated with drug therapy for pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently has pulmonary hypertension and is not being treated with drug therapy for pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is being treated with drug therapy for pulmonary hypertension.","meaning":"Boolean indicating whether the patient's current pulmonary hypertension is being treated with drug therapy."} ;; "uses pulmonary hypertension drug therapy"

(declare-const patient_is_currently_receiving_sildenafil_therapy_for_pulmonary_hypertension Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving sildenafil therapy for pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient is not currently receiving sildenafil therapy for pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving sildenafil therapy for pulmonary hypertension.","meaning":"Boolean indicating whether the patient is currently receiving sildenafil therapy for pulmonary hypertension."} ;; "sildenafil therapy"

(declare-const patient_is_currently_receiving_bosentan_therapy_for_pulmonary_hypertension Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving bosentan therapy for pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient is not currently receiving bosentan therapy for pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving bosentan therapy for pulmonary hypertension.","meaning":"Boolean indicating whether the patient is currently receiving bosentan therapy for pulmonary hypertension."} ;; "bosentan therapy"

(declare-const patient_is_currently_receiving_other_endothelin_inhibitor_therapy_for_pulmonary_hypertension Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving other endothelin inhibitor therapy for pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient is not currently receiving other endothelin inhibitor therapy for pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving other endothelin inhibitor therapy for pulmonary hypertension.","meaning":"Boolean indicating whether the patient is currently receiving other endothelin inhibitor therapy for pulmonary hypertension."} ;; "other endothelin inhibitor therapy"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_pulmonary_hypertension_now@@severe
       patient_has_finding_of_pulmonary_hypertension_now)
   :named REQ7_AUXILIARY0)) ;; "severe pulmonary hypertension"

(assert
(! (=> patient_has_finding_of_pulmonary_hypertension_now@@treated_with_drug_therapy
       patient_has_finding_of_pulmonary_hypertension_now)
   :named REQ7_AUXILIARY1)) ;; "uses pulmonary hypertension drug therapy"

;; Non-exhaustive examples imply the umbrella subclass (drug therapy for pulmonary hypertension)
(assert
(! (=> (or patient_is_currently_receiving_sildenafil_therapy_for_pulmonary_hypertension
           patient_is_currently_receiving_bosentan_therapy_for_pulmonary_hypertension
           patient_is_currently_receiving_other_endothelin_inhibitor_therapy_for_pulmonary_hypertension)
       patient_has_finding_of_pulmonary_hypertension_now@@treated_with_drug_therapy)
   :named REQ7_AUXILIARY2)) ;; "with non-exhaustive examples (sildenafil therapy, bosentan therapy, other endothelin inhibitor therapy)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_pulmonary_hypertension_now@@severe)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe pulmonary hypertension."

(assert
(! (not patient_has_finding_of_pulmonary_hypertension_now@@treated_with_drug_therapy)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses pulmonary hypertension drug therapy (with non-exhaustive examples: sildenafil therapy, bosentan therapy, other endothelin inhibitor therapy)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertrophic obstructive cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have hypertrophic obstructive cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertrophic obstructive cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has hypertrophic obstructive cardiomyopathy."} ;; "hypertrophic obstructive cardiomyopathy"
(declare-const patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertrophic obstructive cardiomyopathy is documented.","when_to_set_to_false":"Set to false if the patient's hypertrophic obstructive cardiomyopathy is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertrophic obstructive cardiomyopathy is documented.","meaning":"Boolean indicating whether the patient's hypertrophic obstructive cardiomyopathy is documented."} ;; "documented hypertrophic obstructive cardiomyopathy"
(declare-const patient_has_finding_of_restrictive_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has restrictive cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have restrictive cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has restrictive cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has restrictive cardiomyopathy."} ;; "restrictive cardiomyopathy"
(declare-const patient_has_finding_of_restrictive_cardiomyopathy_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's restrictive cardiomyopathy is documented.","when_to_set_to_false":"Set to false if the patient's restrictive cardiomyopathy is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's restrictive cardiomyopathy is documented.","meaning":"Boolean indicating whether the patient's restrictive cardiomyopathy is documented."} ;; "documented restrictive cardiomyopathy"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable for hypertrophic obstructive cardiomyopathy
(assert
(! (=> patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now@@documented
      patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now)
   :named REQ8_AUXILIARY0)) ;; "documented hypertrophic obstructive cardiomyopathy"

;; Qualifier variable implies corresponding stem variable for restrictive cardiomyopathy
(assert
(! (=> patient_has_finding_of_restrictive_cardiomyopathy_now@@documented
      patient_has_finding_of_restrictive_cardiomyopathy_now)
   :named REQ8_AUXILIARY1)) ;; "documented restrictive cardiomyopathy"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now@@documented)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has documented hypertrophic obstructive cardiomyopathy."

(assert
(! (not patient_has_finding_of_restrictive_cardiomyopathy_now@@documented)
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has documented restrictive cardiomyopathy."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of valvular heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of valvular heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has valvular heart disease.","meaning":"Boolean indicating whether the patient currently has valvular heart disease."} ;; "valvular heart disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has valvular heart disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has valvular heart disease but the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the valvular heart disease is severe.","meaning":"Boolean indicating whether the patient currently has valvular heart disease and the disease is severe."} ;; "severe valvular heart disease"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@severity_severe
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ9_AUXILIARY0)) ;; "severe valvular heart disease" implies "valvular heart disease"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@severity_severe)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe valvular heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_cocaine_misuse_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has engaged in cocaine misuse at any time within the past 1 month prior to presentation.","when_to_set_to_false":"Set to false if the patient has not engaged in cocaine misuse at any time within the past 1 month prior to presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has engaged in cocaine misuse within the past 1 month prior to presentation.","meaning":"Boolean indicating whether the patient has engaged in cocaine misuse within the past 1 month prior to presentation."} ;; "recent cocaine use (within one month of presentation)"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_cocaine_misuse_inthepast1months)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent cocaine use (within one month of presentation)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_undergone_transplantation_of_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone heart transplantation at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone heart transplantation at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone heart transplantation.","meaning":"Boolean indicating whether the patient has ever undergone heart transplantation in their history."} ;; "has had a heart transplant"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not patient_has_undergone_transplantation_of_heart_inthehistory)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a heart transplant."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sepsis (systemic infection).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sepsis (systemic infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sepsis (systemic infection).","meaning":"Boolean indicating whether the patient currently has sepsis (systemic infection)."} ;; "systemic infection"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (not patient_has_finding_of_sepsis_now)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systemic infection."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_undergoing_hemodialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hemodialysis.","when_to_set_to_false":"Set to false if the patient is currently not undergoing hemodialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing hemodialysis.","meaning":"Boolean indicating whether the patient is currently undergoing hemodialysis."} ;; "hemodialysis"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_undergoing_hemodialysis_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on hemodialysis."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_inability_to_obtain_venous_access_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inability to obtain venous access.","when_to_set_to_false":"Set to false if the patient currently does not have an inability to obtain venous access.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inability to obtain venous access.","meaning":"Boolean indicating whether the patient currently has an inability to obtain venous access."} ;; "inability to obtain venous access"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_inability_to_obtain_venous_access_now)
:named REQ14_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has inability to obtain venous access."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_contraindication_to_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of contraindication to anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of contraindication to anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to anticoagulant therapy.","meaning":"Boolean indicating whether the patient currently has a contraindication to anticoagulant therapy."} ;; "contraindication for anticoagulation"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_contraindication_to_anticoagulant_therapy_now)
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindication for anticoagulation."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_can_lie_flat_duration_now_in_minutes Real) ;; {"when_to_set_to_value":"Set to the number of minutes the patient is currently able to lie flat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many minutes the patient is currently able to lie flat.","meaning":"Numeric value indicating the duration in minutes that the patient is currently able to lie flat."} ;; "duration in minutes that the patient is currently able to lie flat"
(declare-const patient_is_able_to_lie_flat_for_at_least_twenty_minutes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to lie flat for at least twenty minutes.","when_to_set_to_false":"Set to false if the patient is currently unable to lie flat for at least twenty minutes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to lie flat for at least twenty minutes.","meaning":"Boolean indicating whether the patient is currently able to lie flat for at least twenty minutes."} ;; "able to lie flat for at least twenty minutes"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Definition: patient_is_able_to_lie_flat_for_at_least_twenty_minutes_now is true iff patient_can_lie_flat_duration_now_in_minutes >= 20
(assert
(! (= patient_is_able_to_lie_flat_for_at_least_twenty_minutes_now
     (>= patient_can_lie_flat_duration_now_in_minutes 20))
:named REQ16_AUXILIARY0)) ;; "able to lie flat for at least twenty minutes"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: patient must NOT be unable to lie flat for at least twenty minutes
(assert
(! (not patient_is_able_to_lie_flat_for_at_least_twenty_minutes_now)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to lie flat for at least twenty minutes."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Equivalence between alternate breast-feeding variables
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ17_AUXILIARY0)) ;; "the patient is breast-feeding" / "breast-feeding"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ17_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."
