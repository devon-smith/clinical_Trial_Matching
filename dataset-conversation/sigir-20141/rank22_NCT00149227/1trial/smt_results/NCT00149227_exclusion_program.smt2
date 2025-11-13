;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_taken_angiotensin_ii_receptor_antagonist_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been administered an angiotensin II receptor antagonist containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been administered an angiotensin II receptor antagonist containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been administered an angiotensin II receptor antagonist containing product.","meaning":"Boolean indicating whether the patient has ever been administered an angiotensin II receptor antagonist containing product."} ;; "angiotensin receptor blocker"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_taken_angiotensin_ii_receptor_antagonist_containing_product_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has already been administered an angiotensin receptor blocker."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with ischemic heart disease at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with ischemic heart disease at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with ischemic heart disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with ischemic heart disease at any time in their history."} ;; "ischemic heart disease"

(declare-const patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ischemic heart disease is stable.","when_to_set_to_false":"Set to false if the patient's ischemic heart disease is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ischemic heart disease is stable.","meaning":"Boolean indicating whether the patient's ischemic heart disease is stable."} ;; "the patient is stable"

(declare-const patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@temporalcontext_within6months_after_percutaneous_coronary_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of ischemic heart disease occurred within 6 months after percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient's diagnosis of ischemic heart disease did not occur within 6 months after percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of ischemic heart disease occurred within 6 months after percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient's diagnosis of ischemic heart disease occurred within 6 months after percutaneous coronary intervention."} ;; "ischemic heart disease within 6 months after percutaneous coronary intervention"

(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention at any time in their history."} ;; "percutaneous coronary intervention"

(declare-const patient_will_undergo_percutaneous_coronary_intervention_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled or planned to undergo percutaneous coronary intervention in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled or planned to undergo percutaneous coronary intervention in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is going to undergo percutaneous coronary intervention in the future.","meaning":"Boolean indicating whether the patient is going to undergo percutaneous coronary intervention in the future."} ;; "the patient is going to undergo percutaneous coronary intervention"

(declare-const patient_will_undergo_coronary_artery_bypass_graft_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled or planned to undergo coronary artery bypass grafting in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled or planned to undergo coronary artery bypass grafting in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is going to undergo coronary artery bypass grafting in the future.","meaning":"Boolean indicating whether the patient is going to undergo coronary artery bypass grafting in the future."} ;; "the patient is going to undergo coronary artery bypass grafting"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for stability
(assert
(! (=> patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@is_stable
      patient_has_diagnosis_of_ischemic_heart_disease_inthehistory)
:named REQ1_AUXILIARY0)) ;; "the patient is stable"

;; Qualifier variable implies corresponding stem variable for temporal context
(assert
(! (=> patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@temporalcontext_within6months_after_percutaneous_coronary_intervention
      patient_has_diagnosis_of_ischemic_heart_disease_inthehistory)
:named REQ1_AUXILIARY1)) ;; "ischemic heart disease within 6 months after percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: (ischemic heart disease within 6 months after PCI) AND (stable) AND (going to undergo PCI OR CABG)
(assert
(! (not (and patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@temporalcontext_within6months_after_percutaneous_coronary_intervention
             patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@is_stable
             (or patient_will_undergo_percutaneous_coronary_intervention_inthefuture
                 patient_will_undergo_coronary_artery_bypass_graft_inthefuture)))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has ischemic heart disease within 6 months after percutaneous coronary intervention) AND (the patient is stable) AND (the patient is going to undergo percutaneous coronary intervention OR the patient is going to undergo coronary artery bypass grafting)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_severe_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe hypertension.","meaning":"Boolean indicating whether the patient currently has severe hypertension."} ;; "severe hypertension"
(declare-const patient_has_finding_of_malignant_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malignant hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malignant hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant hypertension.","meaning":"Boolean indicating whether the patient currently has malignant hypertension."} ;; "malignant hypertension"
(declare-const patient_has_finding_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of secondary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary hypertension.","meaning":"Boolean indicating whether the patient currently has secondary hypertension."} ;; "secondary hypertension"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_severe_hypertension_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hypertension."

(assert
(! (not patient_has_finding_of_malignant_hypertension_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant hypertension."

(assert
(! (not patient_has_finding_of_secondary_hypertension_now)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "pregnant woman"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's current childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "woman of childbearing potential"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a pregnant woman."

(assert
(! (not patient_has_childbearing_potential_now)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman of childbearing potential."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart failure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart failure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart failure.","meaning":"Boolean indicating whether the patient has ever been diagnosed with heart failure in their medical history."} ;; "the patient has a history of heart failure"

(declare-const patient_has_diagnosis_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with angina pectoris (unstable angina) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with angina pectoris (unstable angina) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with angina pectoris (unstable angina).","meaning":"Boolean indicating whether the patient has ever been diagnosed with angina pectoris (unstable angina) in their medical history."} ;; "the patient has a history of unstable angina"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction in their medical history."} ;; "the patient has a history of myocardial infarction"

(declare-const patient_has_undergone_coronary_angioplasty_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous transluminal coronary angioplasty at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous transluminal coronary angioplasty at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous transluminal coronary angioplasty.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous transluminal coronary angioplasty in their medical history."} ;; "the patient has a history of percutaneous transluminal coronary angioplasty"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass grafting at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass grafting at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass grafting in their medical history."} ;; "the patient has a history of coronary artery bypass grafting"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass grafting within the preceding 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone coronary artery bypass grafting within the preceding 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary artery bypass grafting within the preceding 6 months.","meaning":"Boolean indicating whether the patient has undergone coronary artery bypass grafting within the preceding 6 months."} ;; "the patient has a history of coronary artery bypass grafting within the preceding 6 months"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable for temporal context implies the stem variable
(assert
(! (=> patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months
      patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ4_AUXILIARY0)) ;; "coronary artery bypass grafting within the preceding 6 months" implies "coronary artery bypass grafting"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_heart_failure_inthehistory)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of heart failure."

(assert
(! (not patient_has_diagnosis_of_angina_pectoris_inthehistory)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of unstable angina."

(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory)
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myocardial infarction."

(assert
(! (not patient_has_undergone_coronary_angioplasty_inthehistory)
    :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of percutaneous transluminal coronary angioplasty."

(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months)
    :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of coronary artery bypass grafting within the preceding 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of cardiac arrhythmia."} ;; "arrhythmia"

(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@needs_to_be_treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of cardiac arrhythmia and the arrhythmia needs to be treated.","when_to_set_to_false":"Set to false if the patient currently has a clinical finding or diagnosis of cardiac arrhythmia but it does not need to be treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the arrhythmia needs to be treated.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia needs to be treated."} ;; "arrhythmia that needs to be treated"

(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@accompanied_with_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of cardiac arrhythmia and the arrhythmia is accompanied with symptoms.","when_to_set_to_false":"Set to false if the patient currently has a clinical finding or diagnosis of cardiac arrhythmia but it is not accompanied with symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the arrhythmia is accompanied with symptoms.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia is accompanied with symptoms."} ;; "arrhythmia that is accompanied with symptoms"

(declare-const patient_has_finding_of_second_degree_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of second degree atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of second degree atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of second degree atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of second degree atrioventricular block."} ;; "second degree atrioventricular block"

(declare-const patient_has_finding_of_complete_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of third degree (complete) atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of third degree (complete) atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of third degree (complete) atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of third degree (complete) atrioventricular block."} ;; "third degree atrioventricular block"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@needs_to_be_treated
      patient_has_finding_of_cardiac_arrhythmia_now)
   :named REQ5_AUXILIARY0)) ;; "arrhythmia that needs to be treated"

(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@accompanied_with_symptoms
      patient_has_finding_of_cardiac_arrhythmia_now)
   :named REQ5_AUXILIARY1)) ;; "arrhythmia that is accompanied with symptoms"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have any of the following:
;; (arrhythmia that needs to be treated) OR (arrhythmia that is accompanied with symptoms) OR (second degree atrioventricular block) OR (third degree atrioventricular block)
(assert
(! (not (or patient_has_finding_of_cardiac_arrhythmia_now@@needs_to_be_treated
            patient_has_finding_of_cardiac_arrhythmia_now@@accompanied_with_symptoms
            patient_has_finding_of_second_degree_atrioventricular_block_now
            patient_has_finding_of_complete_atrioventricular_block_now))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has arrhythmia that needs to be treated) OR (the patient has arrhythmia that is accompanied with symptoms) OR (the patient has second degree atrioventricular block) OR (the patient has third degree atrioventricular block)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_creatinine_measurement_serum_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of serum creatinine in mg/dl recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine in mg/dl."} ;; "serum creatinine greater than 3.0 mg/dl"

(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"

(declare-const patient_has_finding_of_renal_impairment_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe renal impairment.","when_to_set_to_false":"Set to false if the patient currently has renal impairment but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal impairment is severe.","meaning":"Boolean indicating whether the patient's renal impairment is severe."} ;; "severe renal impairment"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: severe renal impairment = serum creatinine > 3.0 mg/dl
(assert
(! (= patient_has_finding_of_renal_impairment_now@@severity_severe
     (> patient_creatinine_measurement_serum_value_recorded_now_withunit_mg_per_dl 3.0))
:named REQ6_AUXILIARY0)) ;; "defined as serum creatinine greater than 3.0 mg/dl."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severity_severe
       patient_has_finding_of_renal_impairment_now)
:named REQ6_AUXILIARY1)) ;; "severe renal impairment" implies "renal impairment"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now@@severity_severe)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal impairment, defined as serum creatinine greater than 3.0 mg/dl."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_hepatic_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic impairment.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic impairment.","meaning":"Boolean indicating whether the patient currently has hepatic impairment."} ;; "hepatic impairment"
(declare-const patient_has_finding_of_hepatic_impairment_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hepatic impairment is severe.","when_to_set_to_false":"Set to false if the patient's current hepatic impairment is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hepatic impairment is severe.","meaning":"Boolean indicating whether the patient's current hepatic impairment is severe."} ;; "severe hepatic impairment"
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic failure.","meaning":"Boolean indicating whether the patient currently has hepatic failure."} ;; "hepatic failure"
(declare-const patient_has_finding_of_cirrhosis_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cirrhosis of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cirrhosis of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cirrhosis of the liver.","meaning":"Boolean indicating whether the patient currently has cirrhosis of the liver."} ;; "cirrhosis"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_hepatic_failure_now
          patient_has_finding_of_cirrhosis_of_liver_now)
    patient_has_finding_of_hepatic_impairment_now@@severe)
:named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (hepatic failure, cirrhosis)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hepatic_impairment_now@@severe
    patient_has_finding_of_hepatic_impairment_now)
:named REQ7_AUXILIARY1)) ;; "severe hepatic impairment"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_hepatic_impairment_now@@severe)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hepatic impairment with non-exhaustive examples (hepatic failure, cirrhosis)."
