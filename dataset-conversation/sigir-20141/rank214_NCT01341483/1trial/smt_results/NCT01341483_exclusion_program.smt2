;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease or health condition.","when_to_set_to_false":"Set to false if the patient currently does not have any disease or health condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease or health condition.","meaning":"Boolean indicating whether the patient currently has any disease or health condition."} ;; "health condition"
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "cardiac disease"
(declare-const patient_has_finding_of_sexual_intercourse_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to safely attempt sexual intercourse.","when_to_set_to_false":"Set to false if the patient is currently unable to safely attempt sexual intercourse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to safely attempt sexual intercourse.","meaning":"Boolean indicating whether the patient is currently able to safely attempt sexual intercourse."} ;; "sexual intercourse"
(declare-const patient_is_unable_to_safely_attempt_sexual_intercourse_secondary_to_other_health_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to safely attempt sexual intercourse and the reason is a health condition other than severe cardiac disease.","when_to_set_to_false":"Set to false if the patient is currently able to safely attempt sexual intercourse or if the inability is not secondary to another health condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to safely attempt sexual intercourse secondary to other health condition.","meaning":"Boolean indicating whether the patient is currently unable to safely attempt sexual intercourse secondary to other health condition (not severe cardiac disease)."} ;; "unable to safely attempt sexual intercourse secondary to other health condition"
(declare-const patient_is_unable_to_safely_attempt_sexual_intercourse_secondary_to_severe_cardiac_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to safely attempt sexual intercourse and the reason is severe cardiac disease.","when_to_set_to_false":"Set to false if the patient is currently able to safely attempt sexual intercourse or if the inability is not secondary to severe cardiac disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to safely attempt sexual intercourse secondary to severe cardiac disease.","meaning":"Boolean indicating whether the patient is currently unable to safely attempt sexual intercourse secondary to severe cardiac disease."} ;; "unable to safely attempt sexual intercourse secondary to severe cardiac disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_unable_to_safely_attempt_sexual_intercourse_secondary_to_severe_cardiac_disease_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to safely attempt sexual intercourse secondary to severe cardiac disease."

(assert
  (! (not patient_is_unable_to_safely_attempt_sexual_intercourse_secondary_to_other_health_condition_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to safely attempt sexual intercourse secondary to other health condition."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "life expectancy < 12 months"
(declare-const patient_life_expectancy_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current life expectancy in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current life expectancy in months."} ;; "life expectancy < 12 months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (< patient_life_expectancy_value_recorded_now_in_months 12))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life expectancy < 12 months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum creatinine concentration in mg/dl is available.","when_to_set_to_null":"Set to null if no current serum creatinine concentration in mg/dl is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine concentration in mg/dl."} ;; "serum creatinine concentration"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 2.5))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serum creatinine concentration > 2.5 mg/dl."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_aorto_iliac_occlusive_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aorto-iliac occlusive disease.","when_to_set_to_false":"Set to false if the patient currently does not have aorto-iliac occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aorto-iliac occlusive disease.","meaning":"Boolean indicating whether the patient currently has aorto-iliac occlusive disease."} ;; "aorto-iliac occlusive disease"
(declare-const patient_has_undergone_repair_of_abdominal_aortic_aneurysm_with_insertion_of_endovascular_stent_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a repair of abdominal aortic aneurysm with insertion of endovascular stent graft at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a repair of abdominal aortic aneurysm with insertion of endovascular stent graft.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a repair of abdominal aortic aneurysm with insertion of endovascular stent graft.","meaning":"Boolean indicating whether the patient has ever undergone a repair of abdominal aortic aneurysm with insertion of endovascular stent graft at any time in the past."} ;; "previous abdominal aortic aneurysm endograft procedure"
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical procedure.","meaning":"Boolean indicating whether the patient has ever undergone a surgical procedure at any time in the past."} ;; "surgical procedure"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@open Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone by the patient at any time in the past was open (not minimally invasive).","when_to_set_to_false":"Set to false if the surgical procedure was not open (i.e., was minimally invasive or endoscopic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure was open.","meaning":"Boolean indicating whether the surgical procedure undergone by the patient at any time in the past was open."} ;; "previous open surgical procedure"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@open
      patient_has_undergone_surgical_procedure_inthehistory)
:named REQ3_AUXILIARY0)) ;; "the patient has had a previous open surgical procedure."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_aorto_iliac_occlusive_disease_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has aorto-iliac occlusive disease"

(assert
(! (not patient_has_undergone_repair_of_abdominal_aortic_aneurysm_with_insertion_of_endovascular_stent_graft_inthehistory)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has had a previous abdominal aortic aneurysm endograft procedure"

(assert
(! (not patient_has_undergone_surgical_procedure_inthehistory@@open)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has had a previous open surgical procedure"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with prostatic carcinoma (carcinoma of prostate) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with prostatic carcinoma (carcinoma of prostate) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with prostatic carcinoma (carcinoma of prostate).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of prostatic carcinoma (carcinoma of prostate) in their history."} ;; "prostatic carcinoma"
(declare-const patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@required_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of prostatic carcinoma required surgery.","when_to_set_to_false":"Set to false if the patient's history of prostatic carcinoma did not require surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of prostatic carcinoma required surgery.","meaning":"Boolean indicating whether the patient's history of prostatic carcinoma required surgery."} ;; "prostatic carcinoma requiring surgery"
(declare-const patient_has_undergone_prostatectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a prostatectomy at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a prostatectomy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a prostatectomy.","meaning":"Boolean indicating whether the patient has ever undergone a prostatectomy in their history."} ;; "prostatectomy"
(declare-const patient_has_undergone_radiotherapy_to_pelvis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone radiotherapy to the pelvis at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone radiotherapy to the pelvis at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone radiotherapy to the pelvis.","meaning":"Boolean indicating whether the patient has ever undergone radiotherapy to the pelvis in their history."} ;; "pelvic radiation"
(declare-const patient_has_undergone_hormone_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone hormone therapy at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone hormone therapy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone hormone therapy.","meaning":"Boolean indicating whether the patient has ever undergone hormone therapy in their history."} ;; "hormonal therapy"
(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone chemotherapy at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone chemotherapy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone chemotherapy.","meaning":"Boolean indicating whether the patient has ever undergone chemotherapy in their history."} ;; "chemotherapy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example: prostatectomy is an example of prostatic carcinoma requiring surgery
(assert
(! (=> patient_has_undergone_prostatectomy_inthehistory
     patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@required_surgery)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (prostatectomy)"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@required_surgery
     patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory)
:named REQ4_AUXILIARY1)) ;; "prostatic carcinoma requiring surgery"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@required_surgery)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of prostatic carcinoma requiring surgery with non-exhaustive examples (prostatectomy)."

(assert
(! (not patient_has_undergone_radiotherapy_to_pelvis_inthehistory)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pelvic radiation."

(assert
(! (not patient_has_undergone_hormone_therapy_inthehistory)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hormonal therapy."

(assert
(! (not patient_has_undergone_chemotherapy_inthehistory)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chemotherapy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has a history of myocardial infarction."} ;; "history of myocardial infarction"

(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke) at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke) prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has a history of stroke (cerebrovascular accident)."} ;; "history of stroke"

(declare-const patient_has_diagnosis_of_conduction_disorder_of_the_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with conduction disorder of the heart (arrhythmia) at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with conduction disorder of the heart (arrhythmia) prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with conduction disorder of the heart (arrhythmia).","meaning":"Boolean indicating whether the patient has a history of conduction disorder of the heart (arrhythmia)."} ;; "history of arrhythmia"

(declare-const patient_has_diagnosis_of_conduction_disorder_of_the_heart_inthehistory@@life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a life-threatening conduction disorder of the heart (arrhythmia) prior to enrollment.","when_to_set_to_false":"Set to false if the patient has only had non-life-threatening conduction disorder of the heart (arrhythmia) or none at all prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the arrhythmia was life-threatening.","meaning":"Boolean indicating whether the patient's history of conduction disorder of the heart (arrhythmia) was life-threatening."} ;; "history of life-threatening arrhythmia"

(declare-const patient_has_diagnosis_of_preinfarction_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with preinfarction syndrome (unstable angina) at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with preinfarction syndrome (unstable angina) prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with preinfarction syndrome (unstable angina).","meaning":"Boolean indicating whether the patient has a history of preinfarction syndrome (unstable angina)."} ;; "history of unstable angina"

(declare-const patient_has_diagnosis_of_preinfarction_syndrome_inthehistory@@required_hospitalization_within_3_months_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of preinfarction syndrome (unstable angina) required hospitalization within 3 months (90 days) prior to enrollment.","when_to_set_to_false":"Set to false if the patient's history of preinfarction syndrome (unstable angina) did not require hospitalization within 3 months (90 days) prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether hospitalization was required within 3 months (90 days) prior to enrollment.","meaning":"Boolean indicating whether the patient's history of preinfarction syndrome (unstable angina) required hospitalization within 3 months prior to enrollment."} ;; "history of unstable angina requiring hospitalization within 3 months (90 days) prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for life-threatening arrhythmia implies arrhythmia history
(assert
(! (=> patient_has_diagnosis_of_conduction_disorder_of_the_heart_inthehistory@@life_threatening
       patient_has_diagnosis_of_conduction_disorder_of_the_heart_inthehistory)
:named REQ5_AUXILIARY0)) ;; "life-threatening arrhythmia is a type of arrhythmia"

;; Qualifier variable for unstable angina requiring recent hospitalization implies unstable angina history
(assert
(! (=> patient_has_diagnosis_of_preinfarction_syndrome_inthehistory@@required_hospitalization_within_3_months_prior_to_enrollment
       patient_has_diagnosis_of_preinfarction_syndrome_inthehistory)
:named REQ5_AUXILIARY1)) ;; "unstable angina requiring hospitalization within 3 months is a type of unstable angina"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: history of myocardial infarction
(assert
(! (not (not patient_has_diagnosis_of_myocardial_infarction_inthehistory))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myocardial infarction."

;; Exclusion: history of stroke
(assert
(! (not (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory))
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stroke."

;; Exclusion: history of life-threatening arrhythmia
(assert
(! (not (not patient_has_diagnosis_of_conduction_disorder_of_the_heart_inthehistory@@life_threatening))
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of life-threatening arrhythmia."

;; Exclusion: history of unstable angina requiring hospitalization within 3 months prior to enrollment
(assert
(! (not (not patient_has_diagnosis_of_preinfarction_syndrome_inthehistory@@required_hospitalization_within_3_months_prior_to_enrollment))
:named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of unstable angina requiring hospitalization within 3 months (90 days) prior to enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_taken_phosphodiesterase_5_inhibitor_containing_product_inthepast72hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a phosphodiesterase type 5 inhibitor-containing product within the past 72 hours.","when_to_set_to_false":"Set to false if the patient has not taken a phosphodiesterase type 5 inhibitor-containing product within the past 72 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a phosphodiesterase type 5 inhibitor-containing product within the past 72 hours.","meaning":"Boolean indicating whether the patient has taken a phosphodiesterase type 5 inhibitor-containing product within the past 72 hours."} ;; "phosphodiesterase type 5 inhibitor (per the patient's concomitant medication list) within the 72 hours prior to the scheduled baseline angiography"
(declare-const patient_has_taken_phosphodiesterase_5_inhibitor_containing_product_inthepast72hours@@temporalcontext_within72hours_prior_to_scheduled_baseline_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the 72-hour window for exposure is anchored as prior to the scheduled baseline angiography.","when_to_set_to_false":"Set to false if the 72-hour window for exposure is not anchored as prior to the scheduled baseline angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the 72-hour window is anchored as prior to the scheduled baseline angiography.","meaning":"Boolean indicating whether the 72-hour window for exposure is anchored as prior to the scheduled baseline angiography."} ;; "within the 72 hours prior to the scheduled baseline angiography"
(declare-const patient_has_taken_phosphodiesterase_5_inhibitor_containing_product_inthepast72hours@@exposure_determined_per_concomitant_medication_list Bool) ;; {"when_to_set_to_true":"Set to true if exposure to the product is determined per the patient's concomitant medication list.","when_to_set_to_false":"Set to false if exposure to the product is not determined per the patient's concomitant medication list.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether exposure is determined per the patient's concomitant medication list.","meaning":"Boolean indicating whether exposure to the product is determined per the patient's concomitant medication list."} ;; "per the patient's concomitant medication list"
(declare-const patient_will_undergo_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo angiography now (at baseline).","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo angiography now (at baseline).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo angiography now (at baseline).","meaning":"Boolean indicating whether the patient is scheduled to undergo angiography now (at baseline)."} ;; "scheduled baseline angiography"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable for temporal context implies the patient is scheduled for angiography now
(assert
(! (=> patient_has_taken_phosphodiesterase_5_inhibitor_containing_product_inthepast72hours@@temporalcontext_within72hours_prior_to_scheduled_baseline_angiography
     patient_will_undergo_angiography_now)
:named REQ6_AUXILIARY0)) ;; "within the 72 hours prior to the scheduled baseline angiography"

;; Qualifier variable for exposure determination implies the stem variable
(assert
(! (=> patient_has_taken_phosphodiesterase_5_inhibitor_containing_product_inthepast72hours@@exposure_determined_per_concomitant_medication_list
     patient_has_taken_phosphodiesterase_5_inhibitor_containing_product_inthepast72hours)
:named REQ6_AUXILIARY1)) ;; "per the patient's concomitant medication list"

;; Qualifier variable for temporal context implies the stem variable
(assert
(! (=> patient_has_taken_phosphodiesterase_5_inhibitor_containing_product_inthepast72hours@@temporalcontext_within72hours_prior_to_scheduled_baseline_angiography
     patient_has_taken_phosphodiesterase_5_inhibitor_containing_product_inthepast72hours)
:named REQ6_AUXILIARY2)) ;; "within the 72 hours prior to the scheduled baseline angiography"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_has_taken_phosphodiesterase_5_inhibitor_containing_product_inthepast72hours
             patient_has_taken_phosphodiesterase_5_inhibitor_containing_product_inthepast72hours@@temporalcontext_within72hours_prior_to_scheduled_baseline_angiography
             patient_has_taken_phosphodiesterase_5_inhibitor_containing_product_inthepast72hours@@exposure_determined_per_concomitant_medication_list))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had exposure to a phosphodiesterase type 5 inhibitor (per the patient's concomitant medication list) within the 72 hours prior to the scheduled baseline angiography."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_transplant_of_kidney_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a kidney transplant procedure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a kidney transplant procedure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a kidney transplant procedure.","meaning":"Boolean indicating whether the patient has ever undergone a kidney transplant procedure in their medical history."} ;; "renal transplantation"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_undergone_transplant_of_kidney_inthehistory)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of renal transplantation."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_penile_implant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a penile implant.","when_to_set_to_false":"Set to false if the patient currently does not have a penile implant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a penile implant.","meaning":"Boolean indicating whether the patient currently has a penile implant."} ;; "The patient is excluded if the patient has a penile implant."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_penile_implant_now)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a penile implant."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_become_unstable_from_primary_angiographic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has become unstable as a result of the primary angiographic procedure now.","when_to_set_to_false":"Set to false if the patient has not become unstable as a result of the primary angiographic procedure now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has become unstable as a result of the primary angiographic procedure now.","meaning":"Boolean indicating whether the patient has become unstable as a result of the primary angiographic procedure now."} ;; "the patient has become unstable from the primary angiographic procedure"

(declare-const patient_has_become_unstable_from_primary_angiographic_procedure_now@@would_compromise_safety_of_enrollment_into_impasse_study Bool) ;; {"when_to_set_to_true":"Set to true if the instability from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study.","when_to_set_to_false":"Set to false if the instability from the primary angiographic procedure would not compromise the safety of the patient by proceeding with enrollment into the IMPASSE study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the instability from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study.","meaning":"Boolean indicating whether the instability from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study."} ;; "would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study"

(declare-const patient_maximum_radiation_tissue_dose_value_recorded_now_withunit_gray Real) ;; {"when_to_set_to_value":"Set to the measured value (in gray) if the maximum radiation tissue dose received by the patient during the primary angiographic procedure now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the maximum radiation tissue dose (in gray) received by the patient now."} ;; "maximum radiation dose from the primary angiographic procedure"

(declare-const patient_maximum_radiation_tissue_dose_value_recorded_now_withunit_gray@@from_primary_angiographic_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the value is specifically from the primary angiographic procedure.","when_to_set_to_false":"Set to false if the value is not from the primary angiographic procedure.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the value is from the primary angiographic procedure.","meaning":"Indicates whether the maximum radiation tissue dose value is from the primary angiographic procedure."} ;; "from the primary angiographic procedure"

(declare-const patient_maximum_radiation_tissue_dose_value_recorded_now_withunit_gray@@would_compromise_safety_of_enrollment_into_impasse_study_in_investigators_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the maximum radiation tissue dose from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion.","when_to_set_to_false":"Set to false if the maximum radiation tissue dose from the primary angiographic procedure would not compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the maximum radiation tissue dose from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion.","meaning":"Boolean indicating whether the maximum radiation tissue dose from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion."} ;; "would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion"

(declare-const patient_length_of_procedure_value_recorded_now_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the measured value (in minutes) if the length of the primary angiographic procedure for the patient now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the length of the procedure (in minutes) for the patient now."} ;; "procedure time from the primary angiographic procedure"

(declare-const patient_length_of_procedure_value_recorded_now_withunit_minutes@@from_primary_angiographic_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the value is specifically from the primary angiographic procedure.","when_to_set_to_false":"Set to false if the value is not from the primary angiographic procedure.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the value is from the primary angiographic procedure.","meaning":"Indicates whether the length of procedure value is from the primary angiographic procedure."} ;; "from the primary angiographic procedure"

(declare-const patient_length_of_procedure_value_recorded_now_withunit_minutes@@increased_and_would_compromise_safety_of_enrollment_into_impasse_study_in_investigators_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the increased procedure time from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion.","when_to_set_to_false":"Set to false if the increased procedure time from the primary angiographic procedure would not compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the increased procedure time from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion.","meaning":"Boolean indicating whether the increased procedure time from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion."} ;; "increased procedure time from the primary angiographic procedure that would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion"

(declare-const patient_contrast_media_value_recorded_now_withunit_ml Real) ;; {"when_to_set_to_value":"Set to the measured value (in milliliters) if the contrast media dose received by the patient during the primary angiographic procedure now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the contrast media dose (in milliliters) received by the patient now."} ;; "contrast dose from the primary angiographic procedure"

(declare-const patient_contrast_media_value_recorded_now_withunit_ml@@from_primary_angiographic_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the value is specifically from the primary angiographic procedure.","when_to_set_to_false":"Set to false if the value is not from the primary angiographic procedure.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the value is from the primary angiographic procedure.","meaning":"Indicates whether the contrast media dose value is from the primary angiographic procedure."} ;; "from the primary angiographic procedure"

(declare-const patient_contrast_media_value_recorded_now_withunit_ml@@is_maximum_dose Bool) ;; {"when_to_set_to_true":"Set to true if the value represents the maximum contrast media dose administered during the procedure.","when_to_set_to_false":"Set to false if the value does not represent the maximum dose.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the value is the maximum dose.","meaning":"Indicates whether the contrast media dose value is the maximum administered dose."} ;; "maximum contrast dose"

(declare-const patient_contrast_media_value_recorded_now_withunit_ml@@is_maximum_dose_and_would_compromise_safety_of_enrollment_into_impasse_study_in_investigators_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the maximum contrast media dose from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion.","when_to_set_to_false":"Set to false if the maximum contrast media dose from the primary angiographic procedure would not compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the maximum contrast media dose from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion.","meaning":"Boolean indicating whether the maximum contrast media dose from the primary angiographic procedure would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion."} ;; "maximum contrast dose from the primary angiographic procedure that would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_become_unstable_from_primary_angiographic_procedure_now@@would_compromise_safety_of_enrollment_into_impasse_study)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has become unstable from the primary angiographic procedure that would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study"

(assert
(! (not patient_maximum_radiation_tissue_dose_value_recorded_now_withunit_gray@@would_compromise_safety_of_enrollment_into_impasse_study_in_investigators_opinion)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has received a maximum radiation dose from the primary angiographic procedure that would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion"

(assert
(! (not patient_length_of_procedure_value_recorded_now_withunit_minutes@@increased_and_would_compromise_safety_of_enrollment_into_impasse_study_in_investigators_opinion)
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has received an increased procedure time from the primary angiographic procedure that would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion"

(assert
(! (not patient_contrast_media_value_recorded_now_withunit_ml@@is_maximum_dose_and_would_compromise_safety_of_enrollment_into_impasse_study_in_investigators_opinion)
:named REQ9_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has received a maximum contrast dose from the primary angiographic procedure that would compromise the safety of the patient by proceeding with enrollment into the IMPASSE study in the Investigator's opinion"
