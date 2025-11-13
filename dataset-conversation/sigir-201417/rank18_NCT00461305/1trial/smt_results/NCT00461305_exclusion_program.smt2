;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chocolate_cyst_of_ovary_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chocolate cyst of ovary.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chocolate cyst of ovary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chocolate cyst of ovary.","meaning":"Boolean indicating whether the patient currently has a chocolate cyst of ovary."} ;; "ovarian chocolate cyst"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_chocolate_cyst_of_ovary_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an ovarian chocolate cyst."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_uterine_leiomyoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a uterine leiomyoma (uterine fibroid).","when_to_set_to_false":"Set to false if the patient currently does not have a uterine leiomyoma (uterine fibroid).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a uterine leiomyoma (uterine fibroid).","meaning":"Boolean indicating whether the patient currently has a uterine leiomyoma (uterine fibroid)."} ;; "uterine fibroid"
(declare-const patient_has_finding_of_uterine_leiomyoma_now@@needs_to_be_treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a uterine leiomyoma (uterine fibroid) and the fibroid needs to be treated.","when_to_set_to_false":"Set to false if the patient currently has a uterine leiomyoma (uterine fibroid) but the fibroid does not need to be treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the uterine fibroid needs to be treated.","meaning":"Boolean indicating whether the patient's current uterine leiomyoma (uterine fibroid) needs to be treated."} ;; "uterine fibroid that needs to be treated"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_uterine_leiomyoma_now@@needs_to_be_treated
      patient_has_finding_of_uterine_leiomyoma_now)
   :named REQ1_AUXILIARY0)) ;; "uterine fibroid that needs to be treated"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_uterine_leiomyoma_now@@needs_to_be_treated)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a uterine fibroid that needs to be treated."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_estrogen_receptor_positive_tumor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an estrogen-dependent (estrogen receptor positive) tumor.","when_to_set_to_false":"Set to false if the patient currently does not have an estrogen-dependent (estrogen receptor positive) tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an estrogen-dependent (estrogen receptor positive) tumor.","meaning":"Boolean indicating whether the patient currently has an estrogen-dependent (estrogen receptor positive) tumor."} ;; "estrogen-dependent tumor"
(declare-const patient_has_finding_of_malignant_tumor_of_cervix_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant tumor of the cervix (cervical cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant tumor of the cervix (cervical cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant tumor of the cervix (cervical cancer).","meaning":"Boolean indicating whether the patient currently has a malignant tumor of the cervix (cervical cancer)."} ;; "cervical cancer"
(declare-const patient_has_suspicion_of_malignant_tumor_of_cervix_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have a malignant tumor of the cervix (cervical cancer).","when_to_set_to_false":"Set to false if the patient is currently not suspected to have a malignant tumor of the cervix (cervical cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have a malignant tumor of the cervix (cervical cancer).","meaning":"Boolean indicating whether the patient is currently suspected to have a malignant tumor of the cervix (cervical cancer)."} ;; "suspected cervical cancer"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_estrogen_receptor_positive_tumor_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an estrogen-dependent tumor."

(assert
(! (not patient_has_finding_of_malignant_tumor_of_cervix_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cervical cancer."

(assert
(! (not patient_has_suspicion_of_malignant_tumor_of_cervix_now)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected cervical cancer."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_abnormal_vaginal_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal vaginal bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal vaginal bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal vaginal bleeding.","meaning":"Boolean indicating whether the patient currently has abnormal vaginal bleeding."} ;; "abnormal vaginal bleeding"
(declare-const patient_has_finding_of_abnormal_vaginal_bleeding_now@@undiagnosed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal vaginal bleeding is undiagnosed.","when_to_set_to_false":"Set to false if the patient's abnormal vaginal bleeding is diagnosed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's abnormal vaginal bleeding is undiagnosed.","meaning":"Boolean indicating whether the patient's abnormal vaginal bleeding is undiagnosed."} ;; "undiagnosed abnormal vaginal bleeding"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_abnormal_vaginal_bleeding_now@@undiagnosed
      patient_has_finding_of_abnormal_vaginal_bleeding_now)
:named REQ3_AUXILIARY0)) ;; "undiagnosed abnormal vaginal bleeding"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_abnormal_vaginal_bleeding_now@@undiagnosed)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undiagnosed abnormal vaginal bleeding."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_thrombophlebitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has thrombophlebitis.","when_to_set_to_false":"Set to false if the patient currently does not have thrombophlebitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombophlebitis.","meaning":"Boolean indicating whether the patient currently has thrombophlebitis."} ;; "the patient has thrombophlebitis"
(declare-const patient_has_finding_of_pulmonary_embolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has pulmonary embolism."} ;; "the patient has pulmonary embolism"
(declare-const patient_has_finding_of_cerebrovascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cerebrovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have cerebrovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cerebrovascular disease.","meaning":"Boolean indicating whether the patient currently has cerebrovascular disease."} ;; "the patient has cerebrovascular disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coronary artery disease.","meaning":"Boolean indicating whether the patient currently has coronary artery disease."} ;; "the patient has coronary artery disease"
(declare-const patient_has_finding_of_thrombophlebitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had thrombophlebitis in the past (i.e., history of thrombophlebitis).","when_to_set_to_false":"Set to false if the patient has never had thrombophlebitis in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had thrombophlebitis.","meaning":"Boolean indicating whether the patient has ever had thrombophlebitis in the past."} ;; "the patient has a history of thrombophlebitis"
(declare-const patient_has_finding_of_pulmonary_embolism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had pulmonary embolism in the past (i.e., history of pulmonary embolism).","when_to_set_to_false":"Set to false if the patient has never had pulmonary embolism in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had pulmonary embolism.","meaning":"Boolean indicating whether the patient has ever had pulmonary embolism in the past."} ;; "the patient has a history of pulmonary embolism"
(declare-const patient_has_finding_of_cerebrovascular_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had cerebrovascular disease in the past (i.e., history of cerebrovascular disease).","when_to_set_to_false":"Set to false if the patient has never had cerebrovascular disease in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had cerebrovascular disease.","meaning":"Boolean indicating whether the patient has ever had cerebrovascular disease in the past."} ;; "the patient has a history of cerebrovascular disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had coronary artery disease in the past (i.e., history of coronary artery disease).","when_to_set_to_false":"Set to false if the patient has never had coronary artery disease in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had coronary artery disease.","meaning":"Boolean indicating whether the patient has ever had coronary artery disease in the past."} ;; "the patient has a history of coronary artery disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_thrombophlebitis_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has thrombophlebitis."

(assert
(! (not patient_has_finding_of_pulmonary_embolism_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary embolism."

(assert
(! (not patient_has_finding_of_cerebrovascular_disease_now)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cerebrovascular disease."

(assert
(! (not patient_has_finding_of_coronary_arteriosclerosis_now)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary artery disease."

(assert
(! (not patient_has_finding_of_thrombophlebitis_inthehistory)
:named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of thrombophlebitis."

(assert
(! (not patient_has_finding_of_pulmonary_embolism_inthehistory)
:named REQ4_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pulmonary embolism."

(assert
(! (not patient_has_finding_of_cerebrovascular_disease_inthehistory)
:named REQ4_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebrovascular disease."

(assert
(! (not patient_has_finding_of_coronary_arteriosclerosis_inthehistory)
:named REQ4_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of coronary artery disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged greater than or equal to 35 years"
(declare-const patient_tobacco_smoking_behavior_finding_value_recorded_now_withunit_cigarettes_per_day Real) ;; {"when_to_set_to_value":"Set to the measured or reported number of cigarettes the patient currently smokes per day, if available now.","when_to_set_to_null":"Set to null if the number of cigarettes smoked per day is unknown, not documented, or cannot be determined for the current time.","meaning":"Numeric value indicating the number of cigarettes the patient currently smokes per day."} ;; "smokes greater than or equal to 15 cigarettes per day"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and (>= patient_age_value_recorded_now_in_years 35)
             (>= patient_tobacco_smoking_behavior_finding_value_recorded_now_withunit_cigarettes_per_day 15)))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is aged greater than or equal to 35 years AND the patient smokes greater than or equal to 15 cigarettes per day."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_migraine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of migraine.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of migraine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of migraine.","meaning":"Boolean indicating whether the patient currently has migraine."} ;; "migraine"
(declare-const patient_has_finding_of_migraine_now@@accompanied_by_prodromata Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has migraine and the migraine is accompanied by prodromata.","when_to_set_to_false":"Set to false if the patient currently has migraine but the migraine is not accompanied by prodromata.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's migraine is accompanied by prodromata.","meaning":"Boolean indicating whether the patient's current migraine is accompanied by prodromata."} ;; "migraine accompanied by prodromata"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_migraine_now@@accompanied_by_prodromata
      patient_has_finding_of_migraine_now)
:named REQ6_AUXILIARY0)) ;; "migraine accompanied by prodromata"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_migraine_now@@accompanied_by_prodromata)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has migraine accompanied by prodromata."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary hypertension."} ;; "pulmonary hypertension"
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of valvular heart disease (heart valve disorder).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of valvular heart disease (heart valve disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has valvular heart disease (heart valve disorder).","meaning":"Boolean indicating whether the patient currently has valvular heart disease (heart valve disorder)."} ;; "valvular heart disease"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_pulmonary_hypertension_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary hypertension."

(assert
  (! (not patient_has_finding_of_heart_valve_disorder_now)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has valvular heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_taking_dietary_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently and regularly taking a dietary product (nutritional product).","when_to_set_to_false":"Set to false if the patient is not currently and regularly taking a dietary product (nutritional product).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently and regularly taking a dietary product (nutritional product).","meaning":"Boolean indicating whether the patient is currently and regularly taking a dietary product (nutritional product)."} ;; "nutritional products"
(declare-const patient_is_taking_dietary_product_now@@regularly Bool) ;; {"when_to_set_to_true":"Set to true if the patient is regularly (habitually, not just once or sporadically) taking the dietary product now.","when_to_set_to_false":"Set to false if the patient is not regularly taking the dietary product now (i.e., use is not regular or is only occasional).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use is regular.","meaning":"Boolean indicating whether the patient's current use of dietary product is regular."} ;; "regularly taking nutritional products"
(declare-const patient_is_taking_dietary_product_now@@contains_st_johns_wort Bool) ;; {"when_to_set_to_true":"Set to true if the dietary product currently being taken by the patient contains St. John's Wort.","when_to_set_to_false":"Set to false if the dietary product currently being taken by the patient does not contain St. John's Wort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dietary product contains St. John's Wort.","meaning":"Boolean indicating whether the dietary product currently being taken contains St. John's Wort."} ;; "nutritional products that contain St. John's Wort"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_taking_dietary_product_now@@regularly
      patient_is_taking_dietary_product_now)
:named REQ8_AUXILIARY0)) ;; "regularly taking nutritional products"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_taking_dietary_product_now@@contains_st_johns_wort
      patient_is_taking_dietary_product_now)
:named REQ8_AUXILIARY1)) ;; "nutritional products that contain St. John's Wort"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT be regularly taking nutritional products that contain St. John's Wort
(assert
(! (not (and patient_is_taking_dietary_product_now@@regularly
             patient_is_taking_dietary_product_now@@contains_st_johns_wort))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is regularly taking nutritional products that contain St. John's Wort."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_undergone_surgical_procedure_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within the past 2 months.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure within the past 2 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within the past 2 months.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within the past 2 months."} ;; "surgical treatment for endometriosis within 2 months prior to screening"
(declare-const patient_has_undergone_surgical_procedure_inthepast2months@@indication_endometriosis Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone within the past 2 months was performed for endometriosis.","when_to_set_to_false":"Set to false if the surgical procedure undergone within the past 2 months was not performed for endometriosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure was performed for endometriosis.","meaning":"Boolean indicating whether the surgical procedure undergone within the past 2 months was performed for endometriosis."} ;; "surgical treatment for endometriosis within 2 months prior to screening"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_surgical_procedure_inthepast2months@@indication_endometriosis
      patient_has_undergone_surgical_procedure_inthepast2months)
:named REQ9_AUXILIARY0)) ;; "surgical procedure for endometriosis within 2 months prior to screening"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthepast2months@@indication_endometriosis)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient underwent surgical treatment for endometriosis within 2 months prior to screening."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_exposed_to_analgesic_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to be exposed to analgesic drugs during the study period.","when_to_set_to_false":"Set to false if the patient is not expected to be exposed to analgesic drugs during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will be exposed to analgesic drugs during the study period.","meaning":"Boolean indicating whether the patient is expected to be exposed to analgesic drugs during the study period."} ;; "analgesic drugs"
(declare-const patient_is_exposed_to_analgesic_inthefuture@@regular_use_for_therapeutic_objectives_other_than_dysmenorrhea_pain_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to regularly use analgesic drugs during the study for therapeutic objectives other than relief from the pain of dysmenorrhea.","when_to_set_to_false":"Set to false if the patient is not expected to regularly use analgesic drugs for therapeutic objectives other than relief from the pain of dysmenorrhea during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will regularly use analgesic drugs for therapeutic objectives other than relief from the pain of dysmenorrhea during the study.","meaning":"Boolean indicating regular use of analgesic drugs for therapeutic objectives other than relief from the pain of dysmenorrhea during the study."} ;; "may need to regularly use analgesic drugs for therapeutic objectives other than relief from the pain of dysmenorrhea during this study"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_analgesic_inthefuture@@regular_use_for_therapeutic_objectives_other_than_dysmenorrhea_pain_relief
      patient_is_exposed_to_analgesic_inthefuture)
:named REQ10_AUXILIARY0)) ;; "regular use for therapeutic objectives other than relief from the pain of dysmenorrhea during this study""

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_exposed_to_analgesic_inthefuture@@regular_use_for_therapeutic_objectives_other_than_dysmenorrhea_pain_relief)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient may need to regularly use analgesic drugs for therapeutic objectives other than relief from the pain of dysmenorrhea during this study (occasional use of analgesic drugs for therapeutic objectives other than relief from the pain of dysmenorrhea is permitted)."
