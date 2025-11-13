;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_taken_atorvastatin_containing_product_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any atorvastatin-containing product at any time during the one month period immediately prior to providing informed consent.","when_to_set_to_false":"Set to false if the patient has not taken any atorvastatin-containing product during the one month period immediately prior to providing informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any atorvastatin-containing product during the one month period immediately prior to providing informed consent.","meaning":"Boolean indicating whether the patient has taken any atorvastatin-containing product within one month prior to providing informed consent."} ;; "atorvastatin therapy within one month prior to providing informed consent"

(declare-const patient_has_taken_pitavastatin_containing_product_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any pitavastatin-containing product at any time during the one month period immediately prior to providing informed consent.","when_to_set_to_false":"Set to false if the patient has not taken any pitavastatin-containing product during the one month period immediately prior to providing informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any pitavastatin-containing product during the one month period immediately prior to providing informed consent.","meaning":"Boolean indicating whether the patient has taken any pitavastatin-containing product within one month prior to providing informed consent."} ;; "pitavastatin therapy within one month prior to providing informed consent"

(declare-const patient_has_taken_rosuvastatin_containing_product_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any rosuvastatin-containing product at any time during the one month period immediately prior to providing informed consent.","when_to_set_to_false":"Set to false if the patient has not taken any rosuvastatin-containing product during the one month period immediately prior to providing informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any rosuvastatin-containing product during the one month period immediately prior to providing informed consent.","meaning":"Boolean indicating whether the patient has taken any rosuvastatin-containing product within one month prior to providing informed consent."} ;; "rosuvastatin therapy within one month prior to providing informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_has_taken_atorvastatin_containing_product_inthepast1months
            patient_has_taken_pitavastatin_containing_product_inthepast1months
            patient_has_taken_rosuvastatin_containing_product_inthepast1months))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received (rosuvastatin therapy) OR (pitavastatin therapy) OR (atorvastatin therapy) within one month prior to providing informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_familial_hypercholesterolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently judged to have a diagnosis of familial hypercholesterolemia.","when_to_set_to_false":"Set to false if the patient is currently judged not to have a diagnosis of familial hypercholesterolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of familial hypercholesterolemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of familial hypercholesterolemia."} ;; "The patient is judged to have familial hypercholesterolemia."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_diagnosis_of_familial_hypercholesterolemia_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is judged to have familial hypercholesterolemia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_serum_triglyceride_levels_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum triglyceride level in mg/dL is available.","when_to_set_to_null":"Set to null if no current serum triglyceride level in mg/dL is available or the value is indeterminate.","meaning":"Numeric value of the patient's current serum triglyceride level in mg/dL."} ;; "serum triglyceride level ≥ 400 mg/dL"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (>= patient_serum_triglyceride_levels_finding_value_recorded_now_withunit_mg_per_dl 400))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serum triglyceride level ≥ 400 mg/dL."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction in their history."} ;; "has a history of myocardial infarction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_history_of_coronary_revascularization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of coronary revascularization procedure.","when_to_set_to_false":"Set to false if the patient does not have a documented history of coronary revascularization procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of coronary revascularization procedure.","meaning":"Boolean indicating whether the patient has a history of coronary revascularization procedure."} ;; "has a history of coronary revascularization"
(declare-const patient_has_history_of_coronary_revascularization@@limited_to_percutaneous_coronary_intervention_or_coronary_artery_bypass_grafting Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of coronary revascularization is limited to percutaneous coronary intervention or coronary artery bypass grafting.","when_to_set_to_false":"Set to false if the patient's history of coronary revascularization is not limited to percutaneous coronary intervention or coronary artery bypass grafting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of coronary revascularization is limited to percutaneous coronary intervention or coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient's history of coronary revascularization is limited to percutaneous coronary intervention or coronary artery bypass grafting."} ;; "with exhaustive subcategories ((percutaneous coronary intervention) OR (coronary artery bypass grafting))"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
(! (= patient_has_history_of_coronary_revascularization@@limited_to_percutaneous_coronary_intervention_or_coronary_artery_bypass_grafting
     patient_has_history_of_coronary_revascularization)
:named REQ4_AUXILIARY0)) ;; "with exhaustive subcategories ((percutaneous coronary intervention) OR (coronary artery bypass grafting))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_history_of_coronary_revascularization@@limited_to_percutaneous_coronary_intervention_or_coronary_artery_bypass_grafting
       patient_has_history_of_coronary_revascularization)
:named REQ4_AUXILIARY1)) ;; "history of coronary revascularization with exhaustive subcategories"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_history_of_coronary_revascularization@@limited_to_percutaneous_coronary_intervention_or_coronary_artery_bypass_grafting)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of coronary revascularization with exhaustive subcategories ((percutaneous coronary intervention) OR (coronary artery bypass grafting))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_preinfarction_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with preinfarction syndrome (unstable angina) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with preinfarction syndrome (unstable angina) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with preinfarction syndrome (unstable angina).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of preinfarction syndrome (unstable angina) in their history."} ;; "unstable angina"
(declare-const patient_has_diagnosis_of_preinfarction_syndrome_inthehistory@@was_treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of preinfarction syndrome (unstable angina) in their history and that episode was treated.","when_to_set_to_false":"Set to false if the patient has ever had a diagnosis of preinfarction syndrome (unstable angina) in their history and that episode was not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the episode of preinfarction syndrome (unstable angina) in the patient's history was treated.","meaning":"Boolean indicating whether the historical episode of preinfarction syndrome (unstable angina) was treated."} ;; "history of treatment of unstable angina"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_preinfarction_syndrome_inthehistory@@was_treated
      patient_has_diagnosis_of_preinfarction_syndrome_inthehistory)
:named REQ5_AUXILIARY0)) ;; "history of treatment of unstable angina" (treatment implies diagnosis/history)

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_preinfarction_syndrome_inthehistory@@was_treated)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of treatment of unstable angina."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident.","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident in their history."} ;; "cerebrovascular accident"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory@@excluding_asymptomatic_lacunar_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of cerebrovascular accident excludes cases where the only event is asymptomatic lacunar infarction.","when_to_set_to_false":"Set to false if the patient's history of cerebrovascular accident includes only asymptomatic lacunar infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether asymptomatic lacunar infarction is the only cerebrovascular accident in the patient's history.","meaning":"Boolean indicating whether the patient's history of cerebrovascular accident excludes asymptomatic lacunar infarction."} ;; "excluding asymptomatic lacunar infarction"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cerebrovascular_accident_inthehistory@@excluding_asymptomatic_lacunar_infarction
      patient_has_finding_of_cerebrovascular_accident_inthehistory)
:named REQ6_AUXILIARY0)) ;; "excluding asymptomatic lacunar infarction"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthehistory@@excluding_asymptomatic_lacunar_infarction)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebrovascular accident, excluding asymptomatic lacunar infarction."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_allergy_to_3_hydroxy_3_methylglutaryl_coenzyme_a_reductase_inhibitor_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of allergy or hypersensitivity to statins (3-hydroxy-3-methylglutaryl coenzyme A reductase inhibitors) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of allergy or hypersensitivity to statins at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of allergy or hypersensitivity to statins.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy or hypersensitivity to statins (3-hydroxy-3-methylglutaryl coenzyme A reductase inhibitors) in their history."} ;; "has a history of hypersensitivity to statins"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_allergy_to_3_hydroxy_3_methylglutaryl_coenzyme_a_reductase_inhibitor_inthehistory)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to statins."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_drug_induced_myopathy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with drug-induced myopathy at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with drug-induced myopathy at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with drug-induced myopathy.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of drug-induced myopathy in their history."} ;; "has a history of drug-induced myopathy"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_drug_induced_myopathy_inthehistory)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug-induced myopathy."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has cardiac arrhythmia."} ;; "arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@poorly_controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiac arrhythmia and the arrhythmia is poorly controlled.","when_to_set_to_false":"Set to false if the patient currently has cardiac arrhythmia but it is not poorly controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiac arrhythmia is poorly controlled.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia is poorly controlled."} ;; "poorly controlled arrhythmia"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable (poorly controlled) implies the stem variable (arrhythmia)
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@poorly_controlled
      patient_has_finding_of_cardiac_arrhythmia_now)
:named REQ10_AUXILIARY0)) ;; "poorly controlled arrhythmia" implies "arrhythmia"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_cardiac_arrhythmia_now@@poorly_controlled)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poorly controlled arrhythmia."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "liver disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has liver disease but the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's liver disease is severe.","meaning":"Boolean indicating whether the patient's current liver disease is severe."} ;; "severe liver disease"
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "kidney disease"
(declare-const patient_has_finding_of_kidney_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has kidney disease but the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease is severe.","meaning":"Boolean indicating whether the patient's current kidney disease is severe."} ;; "severe kidney disease"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@severe
       patient_has_finding_of_disease_of_liver_now)
   :named REQ11_AUXILIARY0)) ;; "severe liver disease" implies "liver disease"

(assert
(! (=> patient_has_finding_of_kidney_disease_now@@severe
       patient_has_finding_of_kidney_disease_now)
   :named REQ11_AUXILIARY1)) ;; "severe kidney disease" implies "kidney disease"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (or patient_has_finding_of_disease_of_liver_now@@severe
            patient_has_finding_of_kidney_disease_now@@severe))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has severe liver disease) OR (the patient has severe kidney disease)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@is_concurrent Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is concurrent (occurring at the same time as the index event or condition).","when_to_set_to_false":"Set to false if the disease present in the patient is not concurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is concurrent.","meaning":"Boolean indicating whether the disease present in the patient is concurrent."} ;; "concurrent disease"
(declare-const patient_has_finding_of_disease_now@@is_serious Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is serious (i.e., of significant severity or impact).","when_to_set_to_false":"Set to false if the disease present in the patient is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is serious.","meaning":"Boolean indicating whether the disease present in the patient is serious."} ;; "serious disease"
(declare-const patient_has_finding_of_severely_limited_lifespan_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a severely limited lifespan (i.e., the patient's expected survival is severely limited due to any cause).","when_to_set_to_false":"Set to false if the patient currently does not have a severely limited lifespan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a severely limited lifespan.","meaning":"Boolean indicating whether the patient currently has a severely limited lifespan."} ;; "severely limited lifespan"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@is_concurrent
patient_has_finding_of_disease_now)
:named REQ12_AUXILIARY0)) ;; "concurrent disease"

(assert
(! (=> patient_has_finding_of_disease_now@@is_serious
patient_has_finding_of_disease_now)
:named REQ12_AUXILIARY1)) ;; "serious disease"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: patient must NOT have (serious concurrent disease) OR (severely limited lifespan)
(assert
(! (not (or (and patient_has_finding_of_disease_now@@is_concurrent
                 patient_has_finding_of_disease_now@@is_serious)
            patient_has_finding_of_severely_limited_lifespan_now))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a serious concurrent disease with non-exhaustive examples (malignancy)) OR (the patient has a severely limited lifespan)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient is currently pregnant.","when_to_set_to_false":"Set to false if there is documented evidence that the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_may_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is any clinical suspicion, possibility, or uncertainty that the patient is currently pregnant, but pregnancy is not confirmed.","when_to_set_to_false":"Set to false if there is clear evidence that the patient is not currently pregnant and there is no suspicion or possibility of pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient may currently be pregnant.","meaning":"Boolean indicating whether the patient may currently be pregnant (possibility or suspicion, not confirmed)."} ;; "the patient may be pregnant"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the biological potential to become pregnant at the current time.","when_to_set_to_false":"Set to false if the patient does not have the biological potential to become pregnant at the current time (e.g., due to sex, age, surgical history, or other factors).","when_to_set_to_null":"Set to null if the patient's ability to become pregnant is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently able to become pregnant."} ;; "the patient may be pregnant"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (not (or patient_is_pregnant_now
              patient_may_be_pregnant_now))
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient may be pregnant)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_judged_ineligible_for_participation_for_other_reason_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently judged by the investigators to be ineligible for participation in the study for any reason other than those explicitly listed in the protocol.","when_to_set_to_false":"Set to false if the patient is currently not judged by the investigators to be ineligible for participation in the study for any other reason.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently judged by the investigators to be ineligible for participation in the study for any other reason.","meaning":"Boolean indicating whether the patient is currently judged by the investigators to be ineligible for participation in the study for any other reason."} ;; "the patient is judged by the investigators to be ineligible for participation in the study for any other reason."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_judged_ineligible_for_participation_for_other_reason_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is judged by the investigators to be ineligible for participation in the study for any other reason."
