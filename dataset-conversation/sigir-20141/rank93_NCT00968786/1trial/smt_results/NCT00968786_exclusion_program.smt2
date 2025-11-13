;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@is_life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the disease the patient currently has is life-threatening.","when_to_set_to_false":"Set to false if the disease the patient currently has is not life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease the patient currently has is life-threatening.","meaning":"Boolean indicating whether the disease the patient currently has is life-threatening."} ;; "life-threatening disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@is_life_threatening
      patient_has_finding_of_disease_now)
:named REQ0_AUXILIARY0)) ;; "life-threatening disease" (qualifier implies disease present)

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disease_now@@is_life_threatening)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life-threatening disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_metabolic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of metabolic disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of metabolic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of metabolic disease.","meaning":"Boolean indicating whether the patient currently has metabolic disease."} ;; "metabolic disease"
(declare-const patient_has_finding_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has hyperthyroidism."} ;; "hyperthyroidism"
(declare-const patient_has_finding_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypothyroidism.","meaning":"Boolean indicating whether the patient currently has hypothyroidism."} ;; "hypothyroidism"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_hyperthyroidism_now
          patient_has_finding_of_hypothyroidism_now)
    patient_has_finding_of_metabolic_disease_now)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((hyperthyroidism) OR (hypothyroidism))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_metabolic_disease_now
    patient_has_finding_of_disease_now)
:named REQ1_AUXILIARY1)) ;; "metabolic disease" is a subclass of "disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_metabolic_disease_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has various effects of metabolic disease with non-exhaustive examples ((hyperthyroidism) OR (hypothyroidism))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of cerebrovascular accident (stroke) within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 3 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 3 months."} ;; "stroke within the last 3 months"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of myocardial infarction within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of myocardial infarction within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of myocardial infarction within the past 3 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of myocardial infarction within the past 3 months."} ;; "myocardial infarction within the last 3 months"

(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of disorder of cardiovascular system (cardiovascular disease) within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of disorder of cardiovascular system (cardiovascular disease) within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of disorder of cardiovascular system (cardiovascular disease) within the past 3 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of disorder of cardiovascular system (cardiovascular disease) within the past 3 months."} ;; "cardiovascular disease within the last 3 months"

(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthepast3months@@is_serious Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of disorder of cardiovascular system (cardiovascular disease) within the past 3 months is considered serious.","when_to_set_to_false":"Set to false if the diagnosis of disorder of cardiovascular system (cardiovascular disease) within the past 3 months is not considered serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of disorder of cardiovascular system (cardiovascular disease) within the past 3 months is serious.","meaning":"Boolean indicating whether the diagnosis of disorder of cardiovascular system (cardiovascular disease) within the past 3 months is serious."} ;; "other serious cardiovascular disease within the last 3 months"

(declare-const patient_has_diagnosis_of_cerebrovascular_disease_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of cerebrovascular disease within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of cerebrovascular disease within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of cerebrovascular disease within the past 3 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of cerebrovascular disease within the past 3 months."} ;; "cerebrovascular disease within the last 3 months"

(declare-const patient_has_diagnosis_of_cerebrovascular_disease_inthepast3months@@is_serious Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of cerebrovascular disease within the past 3 months is considered serious.","when_to_set_to_false":"Set to false if the diagnosis of cerebrovascular disease within the past 3 months is not considered serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of cerebrovascular disease within the past 3 months is serious.","meaning":"Boolean indicating whether the diagnosis of cerebrovascular disease within the past 3 months is serious."} ;; "other serious cerebrovascular disease within the last 3 months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthepast3months@@is_serious
      patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthepast3months)
    :named REQ2_AUXILIARY0)) ;; "other serious cardiovascular disease within the last 3 months"

(assert
(! (=> patient_has_diagnosis_of_cerebrovascular_disease_inthepast3months@@is_serious
      patient_has_diagnosis_of_cerebrovascular_disease_inthepast3months)
    :named REQ2_AUXILIARY1)) ;; "other serious cerebrovascular disease within the last 3 months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthepast3months)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had stroke within the last 3 months."

(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthepast3months)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had myocardial infarction within the last 3 months."

(assert
(! (not patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthepast3months@@is_serious)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had other serious cardiovascular disease within the last 3 months."

(assert
(! (not patient_has_diagnosis_of_cerebrovascular_disease_inthepast3months@@is_serious)
    :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had other serious cerebrovascular disease within the last 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine level in mmol/L is recorded now.","when_to_set_to_null":"Set to null if no current serum creatinine measurement in mmol/L is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine level in mmol/L."} ;; "serum creatinine level"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mmol_per_l 176.8))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serum creatinine level > 176.8 mmol/L."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_has_finding_of_severe_cognitive_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe cognitive impairment.","meaning":"Boolean indicating whether the patient currently has severe cognitive impairment."} ;; "severe cognitive decline"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_dementia_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia."

(assert
  (! (not patient_has_finding_of_severe_cognitive_impairment_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe cognitive decline."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_unable_to_do_long_term_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to participate in long-term follow-up.","when_to_set_to_false":"Set to false if the patient is able to participate in long-term follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to participate in long-term follow-up.","meaning":"Boolean indicating whether the patient is unable to participate in long-term follow-up."} ;; "the patient is unable to do a long-term follow-up"
(declare-const patient_does_not_agree_to_participate_in_this_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient does not agree to participate in this trial.","when_to_set_to_false":"Set to false if the patient agrees to participate in this trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to participate in this trial.","meaning":"Boolean indicating whether the patient does not agree to participate in this trial."} ;; "the patient does not agree to participate in this trial"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_unable_to_do_long_term_follow_up)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to do a long-term follow-up."

(assert
(! (not patient_does_not_agree_to_participate_in_this_trial)
:named REQ5_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does not agree to participate in this trial."
