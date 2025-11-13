;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of secondary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary hypertension.","meaning":"Boolean indicating whether the patient currently has secondary hypertension."} ;; "secondary hypertension"
(declare-const patient_has_finding_of_malignant_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malignant hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malignant hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant hypertension.","meaning":"Boolean indicating whether the patient currently has malignant hypertension."} ;; "malignant hypertension"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_secondary_hypertension_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hypertension."

(assert
  (! (not patient_has_finding_of_malignant_hypertension_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart failure is classified as NYHA class III.","when_to_set_to_false":"Set to false if the patient's heart failure is not classified as NYHA class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart failure is classified as NYHA class III.","meaning":"Boolean indicating whether the patient's heart failure is classified as NYHA class III."} ;; "heart failure classified as New York Heart Association functional classification III"
(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart failure is classified as NYHA class IV.","when_to_set_to_false":"Set to false if the patient's heart failure is not classified as NYHA class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart failure is classified as NYHA class IV.","meaning":"Boolean indicating whether the patient's heart failure is classified as NYHA class IV."} ;; "heart failure classified as New York Heart Association functional classification IV"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_class_iii
      patient_has_finding_of_heart_failure_now)
:named REQ1_AUXILIARY0)) ;; "heart failure classified as New York Heart Association functional classification III"

(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_class_iv
      patient_has_finding_of_heart_failure_now)
:named REQ1_AUXILIARY1)) ;; "heart failure classified as New York Heart Association functional classification IV"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@nyha_class_iii)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure classified as New York Heart Association functional classification III."

(assert
(! (not patient_has_finding_of_heart_failure_now@@nyha_class_iv)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure classified as New York Heart Association functional classification IV."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignant tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease (malignant tumor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (malignant tumor).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (malignant tumor)."} ;; "malignant tumor"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@requires_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignant tumor) and requires treatment for it.","when_to_set_to_false":"Set to false if the patient currently has a malignant neoplastic disease (malignant tumor) but does not require treatment for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment for a malignant neoplastic disease (malignant tumor).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (malignant tumor) and requires treatment for it."} ;; "requires treatment for a malignant tumor"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@requires_treatment
      patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ2_AUXILIARY0)) ;; "requires treatment for a malignant tumor" implies "malignant tumor"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now@@requires_treatment)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment for a malignant tumor."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_decreased_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has decreased liver function (liver dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have decreased liver function (liver dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased liver function (liver dysfunction).","meaning":"Boolean indicating whether the patient currently has decreased liver function (liver dysfunction)."} ;; "liver dysfunction"
(declare-const patient_has_finding_of_decreased_liver_function_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has decreased liver function (liver dysfunction) and the dysfunction is serious.","when_to_set_to_false":"Set to false if the patient currently has decreased liver function (liver dysfunction) but the dysfunction is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the decreased liver function (liver dysfunction) is serious.","meaning":"Boolean indicating whether the patient's current decreased liver function (liver dysfunction) is serious."} ;; "serious liver dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal impairment (renal dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have renal impairment (renal dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment (renal dysfunction).","meaning":"Boolean indicating whether the patient currently has renal impairment (renal dysfunction)."} ;; "renal dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal impairment (renal dysfunction) and the dysfunction is serious.","when_to_set_to_false":"Set to false if the patient currently has renal impairment (renal dysfunction) but the dysfunction is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal impairment (renal dysfunction) is serious.","meaning":"Boolean indicating whether the patient's current renal impairment (renal dysfunction) is serious."} ;; "serious renal dysfunction"
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing dialysis treatment.","when_to_set_to_false":"Set to false if the patient is currently not undergoing dialysis treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis treatment.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis treatment."} ;; "requiring dialysis treatment"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's serum creatinine concentration in mg/dL is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine concentration in mg/dL."} ;; "serum creatinine concentration > 2.5 mg/dL"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable for liver dysfunction
(assert
(! (=> patient_has_finding_of_decreased_liver_function_now@@serious
      patient_has_finding_of_decreased_liver_function_now)
    :named REQ3_AUXILIARY0)) ;; "serious liver dysfunction"

;; Qualifier variable implies corresponding stem variable for renal dysfunction
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@serious
      patient_has_finding_of_renal_impairment_now)
    :named REQ3_AUXILIARY1)) ;; "serious renal dysfunction"

;; Definition of serious renal dysfunction: (serum creatinine > 2.5 mg/dL) OR (requiring dialysis treatment)
(assert
(! (= patient_has_finding_of_renal_impairment_now@@serious
      (or (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 2.5)
          patient_is_undergoing_dialysis_procedure_now))
    :named REQ3_AUXILIARY2)) ;; "serious renal dysfunction, defined as (serum creatinine concentration > 2.5 mg/dL) OR (requiring dialysis treatment)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have serious liver dysfunction
(assert
(! (not patient_has_finding_of_decreased_liver_function_now@@serious)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serious liver dysfunction."

;; Exclusion: patient must NOT have serious renal dysfunction (as defined above)
(assert
(! (not patient_has_finding_of_renal_impairment_now@@serious)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serious renal dysfunction, defined as (serum creatinine concentration > 2.5 mg/dL) OR (requiring dialysis treatment)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} ;; "hypertension"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now@@receiving_current_therapy_for_hypertension Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension) and is currently receiving therapy for hypertension.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of hypertensive disorder (hypertension) but is not currently receiving therapy for hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving therapy for hypertension.","meaning":"Boolean indicating whether the patient with a diagnosis of hypertensive disorder (hypertension) is currently receiving therapy for hypertension."} ;; "receiving current therapy for hypertension"
(declare-const patient_is_not_appropriate_for_change_to_test_drugs_from_current_therapy_for_hypertension Bool) ;; {"when_to_set_to_true":"Set to true if the patient is not appropriate for change to the test drugs from current therapy for hypertension.","when_to_set_to_false":"Set to false if the patient is appropriate for change to the test drugs from current therapy for hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is appropriate for change to the test drugs from current therapy for hypertension.","meaning":"Boolean indicating whether the patient is not appropriate for change to the test drugs from current therapy for hypertension."} ;; "not appropriate for change to the test drugs from current therapy for hypertension"
(declare-const patient_is_not_appropriate_for_change_to_test_drugs_from_current_therapy_for_coronary_diseases Bool) ;; {"when_to_set_to_true":"Set to true if the patient is not appropriate for change to the test drugs from current therapy for coronary diseases.","when_to_set_to_false":"Set to false if the patient is appropriate for change to the test drugs from current therapy for coronary diseases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is appropriate for change to the test drugs from current therapy for coronary diseases.","meaning":"Boolean indicating whether the patient is not appropriate for change to the test drugs from current therapy for coronary diseases."} ;; "not appropriate for change to the test drugs from current therapy for coronary diseases"
(declare-const patient_is_undergoing_calcium_channel_blocker_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing calcium channel blocker therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing calcium channel blocker therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing calcium channel blocker therapy.","meaning":"Boolean indicating whether the patient is currently undergoing calcium channel blocker therapy."} ;; "calcium channel blocker therapy"
(declare-const patient_is_undergoing_beta_adrenergic_receptor_blocking_agent_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing beta-adrenergic receptor blocking agent therapy (beta-blocker therapy).","when_to_set_to_false":"Set to false if the patient is not currently undergoing beta-adrenergic receptor blocking agent therapy (beta-blocker therapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing beta-adrenergic receptor blocking agent therapy (beta-blocker therapy).","meaning":"Boolean indicating whether the patient is currently undergoing beta-adrenergic receptor blocking agent therapy (beta-blocker therapy)."} ;; "beta-blocker therapy"
(declare-const patient_is_exposed_to_thiazide_diuretic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to thiazide diuretic.","when_to_set_to_false":"Set to false if the patient is not currently exposed to thiazide diuretic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to thiazide diuretic.","meaning":"Boolean indicating whether the patient is currently exposed to thiazide diuretic."} ;; "thiazide diuretic therapy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term for coronary diseases therapy
(assert
(! (=> (or patient_is_undergoing_calcium_channel_blocker_therapy_now
          patient_is_undergoing_beta_adrenergic_receptor_blocking_agent_therapy_now
          patient_is_exposed_to_thiazide_diuretic_now)
    patient_is_not_appropriate_for_change_to_test_drugs_from_current_therapy_for_coronary_diseases)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (calcium channel blocker therapy, beta-blocker therapy, thiazide diuretic therapy)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_is_not_appropriate_for_change_to_test_drugs_from_current_therapy_for_hypertension
            patient_is_not_appropriate_for_change_to_test_drugs_from_current_therapy_for_coronary_diseases))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is not appropriate for change to the test drugs from current therapy for hypertension) OR (the patient is not appropriate for change to the test drugs from current therapy for coronary diseases with non-exhaustive examples (calcium channel blocker therapy, beta-blocker therapy, thiazide diuretic therapy))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_adverse_reaction_to_drug_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an adverse reaction to a drug at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an adverse reaction to a drug at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an adverse reaction to a drug in their history.","meaning":"Boolean indicating whether the patient has ever had an adverse reaction to a drug in their history."} ;; "adverse drug reaction"

(declare-const patient_has_finding_of_adverse_reaction_to_drug_inthehistory@@caused_by_angiotensin_ii_receptor_blocker Bool) ;; {"when_to_set_to_true":"Set to true if the patient's adverse reaction to drug in their history was caused by angiotensin II receptor blocker.","when_to_set_to_false":"Set to false if the patient's adverse reaction to drug in their history was not caused by angiotensin II receptor blocker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the adverse reaction to drug in their history was caused by angiotensin II receptor blocker.","meaning":"Boolean indicating whether the patient's adverse reaction to drug in their history was caused by angiotensin II receptor blocker."} ;; "serious adverse drug reaction to angiotensin II receptor blocker"

(declare-const patient_has_finding_of_adverse_reaction_to_drug_inthehistory@@caused_by_calcium_channel_blocker Bool) ;; {"when_to_set_to_true":"Set to true if the patient's adverse reaction to drug in their history was caused by calcium channel blocker.","when_to_set_to_false":"Set to false if the patient's adverse reaction to drug in their history was not caused by calcium channel blocker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the adverse reaction to drug in their history was caused by calcium channel blocker.","meaning":"Boolean indicating whether the patient's adverse reaction to drug in their history was caused by calcium channel blocker."} ;; "serious adverse drug reaction to calcium channel blocker"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_adverse_reaction_to_drug_inthehistory@@caused_by_angiotensin_ii_receptor_blocker
      patient_has_finding_of_adverse_reaction_to_drug_inthehistory)
:named REQ5_AUXILIARY0)) ;; "adverse drug reaction to angiotensin II receptor blocker in history"

(assert
(! (=> patient_has_finding_of_adverse_reaction_to_drug_inthehistory@@caused_by_calcium_channel_blocker
      patient_has_finding_of_adverse_reaction_to_drug_inthehistory)
:named REQ5_AUXILIARY1)) ;; "adverse drug reaction to calcium channel blocker in history"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_adverse_reaction_to_drug_inthehistory@@caused_by_angiotensin_ii_receptor_blocker)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of serious adverse drug reaction to angiotensin II receptor blocker."

(assert
(! (not patient_has_finding_of_adverse_reaction_to_drug_inthehistory@@caused_by_calcium_channel_blocker)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of serious adverse drug reaction to calcium channel blocker."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness.","when_to_set_to_false":"Set to false if the patient currently does not have an illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an illness.","meaning":"Boolean indicating whether the patient currently has an illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@investigator_judged_inappropriate_for_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness and investigators judge that illness makes the patient inappropriate for the study.","when_to_set_to_false":"Set to false if the patient currently has an illness but investigators do not judge it makes the patient inappropriate for the study, or if the patient does not have an illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether investigators judge the illness makes the patient inappropriate for the study.","meaning":"Boolean indicating whether the patient currently has an illness that investigators judge makes the patient inappropriate for the study."} ;; "illness ... that investigators judge make the patient inappropriate for the study"
(declare-const patient_has_finding_of_significant_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a significant abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have a significant abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a significant abnormality.","meaning":"Boolean indicating whether the patient currently has a significant abnormality."} ;; "significant abnormality"
(declare-const patient_has_finding_of_significant_abnormality_now@@investigator_judged_inappropriate_for_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a significant abnormality and investigators judge that abnormality makes the patient inappropriate for the study.","when_to_set_to_false":"Set to false if the patient currently has a significant abnormality but investigators do not judge it makes the patient inappropriate for the study, or if the patient does not have a significant abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether investigators judge the significant abnormality makes the patient inappropriate for the study.","meaning":"Boolean indicating whether the patient currently has a significant abnormality that investigators judge makes the patient inappropriate for the study."} ;; "significant abnormality ... that investigators judge make the patient inappropriate for the study"
(declare-const patient_has_other_serious_reason_now@@investigator_judged_inappropriate_for_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another serious reason (not otherwise specified) that investigators judge makes the patient inappropriate for the study.","when_to_set_to_false":"Set to false if the patient does not currently have another serious reason that investigators judge makes the patient inappropriate for the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another serious reason that investigators judge makes the patient inappropriate for the study.","meaning":"Boolean indicating whether the patient currently has another serious reason (not otherwise specified) that investigators judge makes the patient inappropriate for the study."} ;; "other serious reasons ... that investigators judge make the patient inappropriate for the study"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples: illness or significant abnormality imply "other serious reason"
(assert
(! (=> (or patient_has_finding_of_illness_now@@investigator_judged_inappropriate_for_study
           patient_has_finding_of_significant_abnormality_now@@investigator_judged_inappropriate_for_study)
        patient_has_other_serious_reason_now@@investigator_judged_inappropriate_for_study)
   :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (illness, significant abnormality) that investigators judge make the patient inappropriate for the study."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_other_serious_reason_now@@investigator_judged_inappropriate_for_study)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other serious reasons with non-exhaustive examples (illness, significant abnormality) that investigators judge make the patient inappropriate for the study."
