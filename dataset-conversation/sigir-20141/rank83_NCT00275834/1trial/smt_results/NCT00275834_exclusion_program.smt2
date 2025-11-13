;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} ;; "obesity"
(declare-const patient_has_finding_of_obesity_now@@secondary Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current obesity is secondary to another condition.","when_to_set_to_false":"Set to false if the patient's current obesity is not secondary (i.e., is primary/idiopathic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current obesity is secondary.","meaning":"Boolean indicating whether the patient's current obesity is secondary (i.e., due to another underlying condition)."} ;; "secondary obesity"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_obesity_now@@secondary
      patient_has_finding_of_obesity_now)
:named REQ0_AUXILIARY0)) ;; "secondary obesity" means the patient has obesity and it is secondary

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_obesity_now@@secondary)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary obesity."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disorder of the cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disorder of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disorder of the cardiovascular system."} ;; "cardiovascular disease"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the cardiovascular system is considered significant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the cardiovascular system is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of a disorder of the cardiovascular system is significant.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the cardiovascular system is significant."} ;; "significant cardiovascular disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@is_significant
      patient_has_diagnosis_of_disorder_of_cardiovascular_system_now)
:named REQ1_AUXILIARY0)) ;; "significant cardiovascular disease" implies "cardiovascular disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@is_significant)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant cardiovascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever been diagnosed with cerebrovascular accident (stroke) at any time in the past."} ;; "the patient has a history of stroke"

(declare-const patient_has_diagnosis_of_seizure_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with seizure disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with seizure disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with seizure disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with seizure disorder at any time in the past."} ;; "the patient has seizure disorder"

(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the nervous system (neurological disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the nervous system (neurological disease) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the nervous system (neurological disease).","meaning":"Boolean indicating whether the patient has ever been diagnosed with a disorder of the nervous system (neurological disease) at any time in the past."} ;; "the patient has other significant neurological disease"

(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a significant disorder of the nervous system (neurological disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has ever been diagnosed with a disorder of the nervous system (neurological disease) at any time in the past, but the disease is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the nervous system (neurological disease) is significant.","meaning":"Boolean indicating whether the patient's disorder of the nervous system (neurological disease) is significant."} ;; "significant neurological disease"

(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@is_other_than_stroke_or_seizure_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the nervous system (neurological disease) at any time in the past, and the disease is not stroke or seizure disorder.","when_to_set_to_false":"Set to false if the patient has ever been diagnosed with a disorder of the nervous system (neurological disease) at any time in the past, and the disease is stroke or seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the nervous system (neurological disease) is other than stroke or seizure disorder.","meaning":"Boolean indicating whether the patient's disorder of the nervous system (neurological disease) is other than stroke or seizure disorder."} ;; "other than stroke or seizure disorder"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@is_significant
      patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "significant neurological disease"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@is_other_than_stroke_or_seizure_disorder
      patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory)
   :named REQ2_AUXILIARY1)) ;; "other than stroke or seizure disorder"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: history of stroke
(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of stroke"

;; Exclusion: seizure disorder
(assert
(! (not patient_has_diagnosis_of_seizure_disorder_inthehistory)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has seizure disorder"

;; Exclusion: other significant neurological disease
(assert
(! (not (and patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@is_significant
             patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@is_other_than_stroke_or_seizure_disorder))
   :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has other significant neurological disease"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of liver disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of liver disease."} ;; "liver disease"
(declare-const patient_has_diagnosis_of_disease_of_liver_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of liver disease is considered significant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of liver disease is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of liver disease is significant.","meaning":"Boolean indicating whether the patient's current diagnosis of liver disease is significant."} ;; "significant liver disease"
(declare-const patient_has_diagnosis_of_disorder_of_gallbladder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gallbladder disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gallbladder disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gallbladder disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gallbladder disease."} ;; "gallbladder disease"
(declare-const patient_has_diagnosis_of_disorder_of_gallbladder_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of gallbladder disease is considered significant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of gallbladder disease is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of gallbladder disease is significant.","meaning":"Boolean indicating whether the patient's current diagnosis of gallbladder disease is significant."} ;; "significant gallbladder disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_now@@significant
       patient_has_diagnosis_of_disease_of_liver_now)
   :named REQ3_AUXILIARY0)) ;; "significant liver disease" implies "liver disease"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_gallbladder_now@@significant
       patient_has_diagnosis_of_disorder_of_gallbladder_now)
   :named REQ3_AUXILIARY1)) ;; "significant gallbladder disease" implies "gallbladder disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_disease_of_liver_now@@significant)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant liver disease."

(assert
(! (not patient_has_diagnosis_of_disorder_of_gallbladder_now@@significant)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant gallbladder disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "renal disease"
(declare-const patient_has_finding_of_kidney_disease_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's kidney disease is significant.","when_to_set_to_false":"Set to false if the patient's kidney disease is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease is significant.","meaning":"Boolean indicating whether the patient's kidney disease is significant."} ;; "significant renal disease"
(declare-const patient_has_finding_of_kidney_stone_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of kidney stones at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of kidney stones in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had kidney stones.","meaning":"Boolean indicating whether the patient has ever had kidney stones in their history."} ;; "history of kidney stones"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_kidney_disease_now@@significant
      patient_has_finding_of_kidney_disease_now)
   :named REQ4_AUXILIARY0)) ;; "significant renal disease" implies "renal disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_finding_of_kidney_disease_now@@significant
            patient_has_finding_of_kidney_stone_inthehistory))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has significant renal disease) OR (the patient has a history of kidney stones)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_hiv_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus (HIV) positive status.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus (HIV) positive status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has HIV positive status.","meaning":"Boolean indicating whether the patient currently has HIV positive status."} ;; "human immunodeficiency virus positive status"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_hiv_positive_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has human immunodeficiency virus positive status."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypothyroidism.","meaning":"Boolean indicating whether the patient currently has hypothyroidism."} ;; "hypothyroidism"
(declare-const patient_has_finding_of_hypothyroidism_now@@untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypothyroidism is untreated.","when_to_set_to_false":"Set to false if the patient's hypothyroidism is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypothyroidism is untreated.","meaning":"Boolean indicating whether the patient's hypothyroidism is untreated."} ;; "untreated hypothyroidism"
(declare-const patient_has_finding_of_hypothyroidism_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypothyroidism is unstable.","when_to_set_to_false":"Set to false if the patient's hypothyroidism is stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypothyroidism is unstable.","meaning":"Boolean indicating whether the patient's hypothyroidism is unstable."} ;; "unstable hypothyroidism"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypothyroidism_now@@untreated
      patient_has_finding_of_hypothyroidism_now)
   :named REQ7_AUXILIARY0)) ;; "untreated hypothyroidism"

(assert
(! (=> patient_has_finding_of_hypothyroidism_now@@unstable
      patient_has_finding_of_hypothyroidism_now)
   :named REQ7_AUXILIARY1)) ;; "unstable hypothyroidism"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_finding_of_hypothyroidism_now@@untreated
            patient_has_finding_of_hypothyroidism_now@@unstable))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has untreated hypothyroidism) OR (the patient has unstable hypothyroidism)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malignant neoplastic disease at any time within the past five years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malignant neoplastic disease within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malignant neoplastic disease within the past five years.","meaning":"Boolean indicating whether the patient has had a diagnosis of malignant neoplastic disease within the past five years."} ;; "malignancy within the past five years"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had malignancy within the past five years."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "the patient is taking concomitant medications"

(declare-const patient_is_taking_drug_or_medicament_now@@causes_significant_weight_gain Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently taking causes significant weight gain.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently taking does not cause significant weight gain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament the patient is currently taking causes significant weight gain.","meaning":"Boolean indicating whether the drug or medicament the patient is currently taking causes significant weight gain."} ;; "the patient is taking concomitant medications that cause significant weight gain"

(declare-const patient_is_taking_drug_or_medicament_now@@causes_significant_weight_loss Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently taking causes significant weight loss.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently taking does not cause significant weight loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament the patient is currently taking causes significant weight loss.","meaning":"Boolean indicating whether the drug or medicament the patient is currently taking causes significant weight loss."} ;; "the patient is taking concomitant medications that cause significant weight loss"

(declare-const patient_has_finding_of_weight_increased_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of increased weight (weight gain).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of increased weight (weight gain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of increased weight (weight gain).","meaning":"Boolean indicating whether the patient currently has the clinical finding of increased weight (weight gain)."} ;; "weight gain"

(declare-const patient_has_finding_of_weight_increased_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current weight gain is significant.","when_to_set_to_false":"Set to false if the patient's current weight gain is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current weight gain is significant.","meaning":"Boolean indicating whether the patient's current weight gain is significant."} ;; "significant weight gain"

(declare-const patient_has_finding_of_weight_decreased_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased weight (weight loss).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased weight (weight loss).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of decreased weight (weight loss).","meaning":"Boolean indicating whether the patient currently has the clinical finding of decreased weight (weight loss)."} ;; "weight loss"

(declare-const patient_has_finding_of_weight_decreased_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current weight loss is significant.","when_to_set_to_false":"Set to false if the patient's current weight loss is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current weight loss is significant.","meaning":"Boolean indicating whether the patient's current weight loss is significant."} ;; "significant weight loss"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@causes_significant_weight_gain
      patient_is_taking_drug_or_medicament_now)
    :named REQ9_AUXILIARY0)) ;; "the patient is taking concomitant medications that cause significant weight gain"

(assert
(! (=> patient_is_taking_drug_or_medicament_now@@causes_significant_weight_loss
      patient_is_taking_drug_or_medicament_now)
    :named REQ9_AUXILIARY1)) ;; "the patient is taking concomitant medications that cause significant weight loss"

;; Qualifier variables for weight gain/loss imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_weight_increased_now@@is_significant
      patient_has_finding_of_weight_increased_now)
    :named REQ9_AUXILIARY2)) ;; "significant weight gain"

(assert
(! (=> patient_has_finding_of_weight_decreased_now@@is_significant
      patient_has_finding_of_weight_decreased_now)
    :named REQ9_AUXILIARY3)) ;; "significant weight loss"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_taking_drug_or_medicament_now@@causes_significant_weight_gain)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is taking concomitant medications that cause significant weight gain"

(assert
(! (not patient_is_taking_drug_or_medicament_now@@causes_significant_weight_loss)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is taking concomitant medications that cause significant weight loss"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_taking_drug_or_medicament_now@@prescription_weight_loss_medication_concomitant_use Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently taking is a prescription weight loss medication being used concomitantly.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently taking is not a prescription weight loss medication being used concomitantly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is a prescription weight loss medication being used concomitantly.","meaning":"Boolean indicating whether the drug or medicament currently being taken is a prescription weight loss medication being used concomitantly."} ;; "the patient is using prescription weight loss medications concomitantly"
(declare-const patient_is_taking_drug_or_medicament_now@@over_the_counter_weight_loss_medication_concomitant_use Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently taking is an over-the-counter weight loss medication being used concomitantly.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently taking is not an over-the-counter weight loss medication being used concomitantly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is an over-the-counter weight loss medication being used concomitantly.","meaning":"Boolean indicating whether the drug or medicament currently being taken is an over-the-counter weight loss medication being used concomitantly."} ;; "the patient is using over-the-counter weight loss medications concomitantly"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_taking_drug_or_medicament_now@@prescription_weight_loss_medication_concomitant_use)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is using prescription weight loss medications concomitantly."

(assert
(! (not patient_is_taking_drug_or_medicament_now@@over_the_counter_weight_loss_medication_concomitant_use)
:named REQ10_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is using over-the-counter weight loss medications concomitantly."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bariatric operative procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a bariatric operative procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a bariatric operative procedure.","meaning":"Boolean indicating whether the patient has ever undergone a bariatric operative procedure in the past."} ;; "the patient has had bariatric surgery"

(declare-const patient_will_undergo_bariatric_operative_procedure_inthefuture1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled or planning to undergo a bariatric operative procedure within the next 1 year.","when_to_set_to_false":"Set to false if the patient is not scheduled or planning to undergo a bariatric operative procedure within the next 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled or planning to undergo a bariatric operative procedure within the next 1 year.","meaning":"Boolean indicating whether the patient is scheduled or planning to undergo a bariatric operative procedure within the next 1 year."} ;; "the patient is planning bariatric surgery in the next 1 year"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not (or patient_has_undergone_bariatric_operative_procedure_inthehistory
              patient_will_undergo_bariatric_operative_procedure_inthefuture1years))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had bariatric surgery) OR (the patient is planning bariatric surgery in the next 1 year)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_weight_change_value_recorded_inthepast3months_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's weight change in kilograms if a measurement recorded in the past 3 months is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's weight change in kilograms over the past 3 months."} ;; "weight change of more than 4 kilograms in the past 3 months"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (> (abs patient_weight_change_value_recorded_inthepast3months_withunit_kilograms) 4))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a weight change of more than 4 kilograms in the past 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_suicidal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suicidal.","when_to_set_to_false":"Set to false if the patient is currently not suicidal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suicidal.","meaning":"Boolean indicating whether the patient is currently suicidal."} ;; "suicidal"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_suicidal_now)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suicidal."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_diagnosis_of_major_depressive_disorder_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of major depressive disorder within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of major depressive disorder within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of major depressive disorder within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of major depressive disorder within the past 6 months."} ;; "major depression in the past 6 months"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
  (! (not patient_has_diagnosis_of_major_depressive_disorder_inthepast6months)
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had major depression in the past 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_diagnosis_of_psychotic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a psychotic disorder (psychosis) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a psychotic disorder (psychosis) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a psychotic disorder (psychosis).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of psychotic disorder (psychosis) in their history."} ;; "the patient has a history of psychosis"

(declare-const patient_has_diagnosis_of_bipolar_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with bipolar disorder at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with bipolar disorder at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with bipolar disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of bipolar disorder in their history."} ;; "the patient has a history of bipolar disorder"

(declare-const patient_has_diagnosis_of_personality_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a personality disorder at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a personality disorder at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a personality disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of personality disorder in their history."} ;; "the patient has a history of personality disorder"

(declare-const patient_has_diagnosis_of_personality_disorder_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a severe personality disorder at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a severe personality disorder at any point in their history, or only non-severe forms are present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the personality disorder is severe.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of severe personality disorder in their history."} ;; "the patient has a history of severe personality disorder"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_personality_disorder_inthehistory@@severe
       patient_has_diagnosis_of_personality_disorder_inthehistory)
   :named REQ15_AUXILIARY0)) ;; "the patient has a history of severe personality disorder"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_diagnosis_of_psychotic_disorder_inthehistory)
   :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of psychosis"

(assert
(! (not patient_has_diagnosis_of_bipolar_disorder_inthehistory)
   :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of bipolar disorder"

(assert
(! (not patient_has_diagnosis_of_personality_disorder_inthehistory@@severe)
   :named REQ15_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has a history of severe personality disorder"

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_is_taking_anti_psychotic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an antipsychotic agent.","when_to_set_to_false":"Set to false if the patient is currently not taking an antipsychotic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an antipsychotic agent.","meaning":"Boolean indicating whether the patient is currently taking an antipsychotic agent."} ;; "the patient is taking antipsychotic drugs"
(declare-const patient_is_taking_mood_stabiliser_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a mood stabiliser drug.","when_to_set_to_false":"Set to false if the patient is currently not taking a mood stabiliser drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a mood stabiliser drug.","meaning":"Boolean indicating whether the patient is currently taking a mood stabiliser drug."} ;; "the patient is taking mood stabiliser drugs"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_is_taking_anti_psychotic_agent_now)
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking antipsychotic drugs."

(assert
(! (not patient_is_taking_mood_stabiliser_drug_now)
    :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking mood stabiliser drugs."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of alcohol abuse at any time within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of alcohol abuse at any time within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinical finding of alcohol abuse within the past 6 months.","meaning":"Boolean indicating whether the patient has had alcohol abuse in the past 6 months."} ;; "the patient has had alcohol abuse in the past 6 months"
(declare-const patient_has_finding_of_substance_misuse_behavior_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of substance misuse behavior (substance abuse) at any time within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of substance misuse behavior (substance abuse) at any time within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinical finding of substance misuse behavior (substance abuse) within the past 6 months.","meaning":"Boolean indicating whether the patient has had substance misuse behavior (substance abuse) in the past 6 months."} ;; "the patient has had substance abuse in the past 6 months"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_inthepast6months)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had alcohol abuse in the past 6 months."

(assert
(! (not patient_has_finding_of_substance_misuse_behavior_inthepast6months)
:named REQ17_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had substance abuse in the past 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_is_taking_zonisamide_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any zonisamide-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any zonisamide-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any zonisamide-containing product.","meaning":"Boolean indicating whether the patient is currently taking any zonisamide-containing product."} ;; "the patient is currently taking zonisamide"
(declare-const patient_is_exposed_to_anticonvulsant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any anticonvulsant (antiepileptic) drug.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any anticonvulsant (antiepileptic) drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any anticonvulsant (antiepileptic) drug.","meaning":"Boolean indicating whether the patient is currently exposed to any anticonvulsant (antiepileptic) drug."} ;; "the patient is currently taking other antiepileptic drugs"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_is_taking_zonisamide_containing_product_now)
:named REQ18_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is currently taking zonisamide"
(assert
(! (not patient_is_exposed_to_anticonvulsant_now)
:named REQ18_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is currently taking other antiepileptic drugs"

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity condition at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a hypersensitivity condition at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypersensitivity condition.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity condition in their history."} ;; "hypersensitivity"
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_zonisamide Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical hypersensitivity condition was specifically to zonisamide.","when_to_set_to_false":"Set to false if the patient's historical hypersensitivity condition was not to zonisamide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity condition was to zonisamide.","meaning":"Boolean indicating whether the patient's historical hypersensitivity condition was specifically to zonisamide."} ;; "hypersensitivity to zonisamide"
(declare-const patient_has_finding_of_allergy_to_sulfonamide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to sulfonamides at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had an allergy to sulfonamides at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to sulfonamides.","meaning":"Boolean indicating whether the patient has ever had an allergy to sulfonamides in their history."} ;; "hypersensitivity to sulfonamides"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_zonisamide
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ19_AUXILIARY0)) ;; "hypersensitivity to zonisamide"

;; ===================== Constraint Assertions (REQ 19) =====================
;; Exclusion: patient must NOT have a history of hypersensitivity to zonisamide
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_zonisamide)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to zonisamide."

;; Exclusion: patient must NOT have a history of hypersensitivity to sulfonamides
(assert
(! (not patient_has_finding_of_allergy_to_sulfonamide_inthehistory)
:named REQ19_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to sulfonamides."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_pregnant_inthefuture1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to be pregnant within the next one year.","when_to_set_to_false":"Set to false if the patient is not planning to be pregnant within the next one year.","when_to_set_to_null":"Set to null if the patient's plans for pregnancy within the next one year are unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is planning to be pregnant within the next one year."} ;; "the patient is planning pregnancy in the next one year"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
  (! (not (or patient_is_pregnant_now
              patient_is_pregnant_inthefuture1years
              patient_is_breastfeeding_now))
     :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient is planning pregnancy in the next one year) OR (the patient is breastfeeding)."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_finding_of_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of disability.","when_to_set_to_false":"Set to false if the patient currently does not have any form of disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of disability.","meaning":"Boolean indicating whether the patient currently has disability (any type or severity)."} ;; "disability"
(declare-const patient_has_finding_of_disability_now@@is_physical Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disability is physical.","when_to_set_to_false":"Set to false if the patient's current disability is not physical.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disability is physical.","meaning":"Boolean indicating whether the patient's current disability is physical."} ;; "physical disability"
(declare-const patient_has_finding_of_disability_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disability is severe.","when_to_set_to_false":"Set to false if the patient's current disability is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disability is severe.","meaning":"Boolean indicating whether the patient's current disability is severe."} ;; "severe disability"
(declare-const patient_has_finding_of_disability_now@@is_physical@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disability that is both physical and severe.","when_to_set_to_false":"Set to false if the patient currently does not have a disability that is both physical and severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disability that is both physical and severe.","meaning":"Boolean indicating whether the patient currently has a disability that is both physical and severe."} ;; "severe physical disability"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disability_now@@is_physical
       patient_has_finding_of_disability_now)
   :named REQ21_AUXILIARY0)) ;; "physical disability"

(assert
(! (=> patient_has_finding_of_disability_now@@is_severe
       patient_has_finding_of_disability_now)
   :named REQ21_AUXILIARY1)) ;; "severe disability"

(assert
(! (=> patient_has_finding_of_disability_now@@is_physical@@is_severe
       (and patient_has_finding_of_disability_now@@is_physical
            patient_has_finding_of_disability_now@@is_severe))
   :named REQ21_AUXILIARY2)) ;; "severe physical disability"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not patient_has_finding_of_disability_now@@is_physical@@is_severe)
   :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe physical disability."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_is_currently_participating_in_commercial_weight_loss_program Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a commercial weight loss program.","when_to_set_to_false":"Set to false if the patient is not currently participating in a commercial weight loss program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a commercial weight loss program.","meaning":"Boolean indicating whether the patient is currently participating in a commercial weight loss program."} ;; "the patient is currently participating in a commercial weight loss program"
(declare-const patient_is_planning_to_participate_in_commercial_weight_loss_program Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to participate in a commercial weight loss program.","when_to_set_to_false":"Set to false if the patient is not planning to participate in a commercial weight loss program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning to participate in a commercial weight loss program.","meaning":"Boolean indicating whether the patient is planning to participate in a commercial weight loss program."} ;; "the patient is planning to participate in a commercial weight loss program"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_is_currently_participating_in_commercial_weight_loss_program)
:named REQ22_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently participating in a commercial weight loss program."

(assert
(! (not patient_is_planning_to_participate_in_commercial_weight_loss_program)
:named REQ22_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is planning to participate in a commercial weight loss program."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_finding_of_carbohydrate_restricted_diet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently following a carbohydrate-restricted (low-carbohydrate) diet.","when_to_set_to_false":"Set to false if the patient is currently not following a carbohydrate-restricted (low-carbohydrate) diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently following a carbohydrate-restricted diet.","meaning":"Boolean indicating whether the patient is currently following a carbohydrate-restricted diet."} ;; "low-carbohydrate diet"
(declare-const patient_has_finding_of_increased_protein_diet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently following a high protein (increased protein) diet.","when_to_set_to_false":"Set to false if the patient is currently not following a high protein (increased protein) diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently following a high protein diet.","meaning":"Boolean indicating whether the patient is currently following a high protein diet."} ;; "high protein diet"
(declare-const patient_has_finding_of_high_fat_diet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently following a high fat diet.","when_to_set_to_false":"Set to false if the patient is currently not following a high fat diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently following a high fat diet.","meaning":"Boolean indicating whether the patient is currently following a high fat diet."} ;; "high fat diet"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not patient_has_finding_of_carbohydrate_restricted_diet_now)
:named REQ23_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently following a low-carbohydrate diet."

(assert
(! (not patient_has_finding_of_increased_protein_diet_now)
:named REQ23_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently following a high protein diet."

(assert
(! (not patient_has_finding_of_high_fat_diet_now)
:named REQ23_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently following a high fat diet."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "the patient is currently using investigational medications"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to is investigational.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament is investigational."} ;; "the patient is currently using investigational medications"
(declare-const patient_is_using_investigational_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any investigational device.","when_to_set_to_false":"Set to false if the patient is currently not using any investigational device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any investigational device.","meaning":"Boolean indicating whether the patient is currently using any investigational device."} ;; "the patient is currently using investigational devices"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament in the past four weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament in the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament in the past four weeks.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament in the past four weeks."} ;; "the patient has used investigational medications in the past four weeks"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast4weeks@@investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient has been exposed to in the past four weeks is investigational.","when_to_set_to_false":"Set to false if the drug or medicament the patient has been exposed to in the past four weeks is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament is investigational."} ;; "the patient has used investigational medications in the past four weeks"
(declare-const patient_has_used_investigational_device_in_past_4_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any investigational device in the past four weeks.","when_to_set_to_false":"Set to false if the patient has not used any investigational device in the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any investigational device in the past four weeks.","meaning":"Boolean indicating whether the patient has used any investigational device in the past four weeks."} ;; "the patient has used investigational devices in the past four weeks"

;; ===================== Auxiliary Assertions (REQ 24) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@investigational
       patient_is_exposed_to_drug_or_medicament_now)
   :named REQ24_AUXILIARY0)) ;; "the patient is currently using investigational medications"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast4weeks@@investigational
       patient_is_exposed_to_drug_or_medicament_inthepast4weeks)
   :named REQ24_AUXILIARY1)) ;; "the patient has used investigational medications in the past four weeks"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@investigational)
   :named REQ24_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is currently using investigational medications"

(assert
(! (not patient_is_using_investigational_device_now)
   :named REQ24_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is currently using investigational devices"

(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast4weeks@@investigational)
   :named REQ24_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has used investigational medications in the past four weeks"

(assert
(! (not patient_has_used_investigational_device_in_past_4_weeks)
   :named REQ24_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has used investigational devices in the past four weeks"
