;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_influenza_like_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of influenza-like illness.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of influenza-like illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of influenza-like illness.","meaning":"Boolean indicating whether the patient currently has influenza-like illness now."} ;; "influenza-like illness"
(declare-const patient_has_finding_of_influenza_like_illness_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current influenza-like illness is acute.","when_to_set_to_false":"Set to false if the patient's current influenza-like illness is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current influenza-like illness is acute.","meaning":"Boolean indicating whether the patient's current influenza-like illness is acute."} ;; "acute influenza-like illness"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_influenza_like_illness_now@@acute
       patient_has_finding_of_influenza_like_illness_now)
   :named REQ0_AUXILIARY0)) ;; "acute influenza-like illness at screening."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_influenza_like_illness_now@@acute)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute influenza-like illness at screening."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_psoriasis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with psoriasis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with psoriasis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with psoriasis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of psoriasis in their history."} ;; "history of psoriasis"

(declare-const patient_has_diagnosis_of_porphyria_cutanea_tarda_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with porphyria cutanea tarda at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with porphyria cutanea tarda at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with porphyria cutanea tarda.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of porphyria cutanea tarda in their history."} ;; "history of porphyria cutanea tarda"

(declare-const patient_has_diagnosis_of_epilepsy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with epilepsy at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with epilepsy at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with epilepsy.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of epilepsy in their history."} ;; "history of epilepsy"

(declare-const patient_has_diagnosis_of_myasthenia_gravis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myasthenia gravis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myasthenia gravis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myasthenia gravis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of myasthenia gravis in their history."} ;; "history of myasthenia gravis"

(declare-const patient_has_diagnosis_of_myopathy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myopathy of any cause at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myopathy of any cause at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myopathy of any cause.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of myopathy of any cause in their history."} ;; "history of myopathy of any cause"

(declare-const patient_has_diagnosis_of_cardiac_arrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cardiac arrhythmias at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cardiac arrhythmias at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cardiac arrhythmias.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cardiac arrhythmias in their history."} ;; "history of cardiac arrhythmias"

(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hepatic (liver) disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hepatic (liver) disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hepatic (liver) disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of hepatic (liver) disease in their history."} ;; "history of hepatic disease"

(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the hepatic (liver) disease diagnosis in the patient's history is classified as serious.","when_to_set_to_false":"Set to false if the hepatic (liver) disease diagnosis in the patient's history is not classified as serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic (liver) disease diagnosis in the patient's history is serious.","meaning":"Boolean indicating whether the hepatic (liver) disease diagnosis in the patient's history is serious."} ;; "history of serious hepatic disease"

(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with renal (kidney) disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with renal (kidney) disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with renal (kidney) disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of renal (kidney) disease in their history."} ;; "history of renal disease"

(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the renal (kidney) disease diagnosis in the patient's history is classified as serious.","when_to_set_to_false":"Set to false if the renal (kidney) disease diagnosis in the patient's history is not classified as serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal (kidney) disease diagnosis in the patient's history is serious.","meaning":"Boolean indicating whether the renal (kidney) disease diagnosis in the patient's history is serious."} ;; "history of serious renal disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_inthehistory@@serious
       patient_has_diagnosis_of_disease_of_liver_inthehistory)
   :named REQ1_AUXILIARY0)) ;; "history of serious hepatic disease"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_inthehistory@@serious
       patient_has_diagnosis_of_kidney_disease_inthehistory)
   :named REQ1_AUXILIARY1)) ;; "history of serious renal disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_psoriasis_inthehistory)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psoriasis."

(assert
(! (not patient_has_diagnosis_of_porphyria_cutanea_tarda_inthehistory)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of porphyria cutanea tarda."

(assert
(! (not patient_has_diagnosis_of_epilepsy_inthehistory)
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of epilepsy."

(assert
(! (not patient_has_diagnosis_of_myasthenia_gravis_inthehistory)
   :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myasthenia gravis."

(assert
(! (not patient_has_diagnosis_of_myopathy_inthehistory)
   :named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myopathy of any cause."

(assert
(! (not patient_has_diagnosis_of_cardiac_arrhythmia_inthehistory)
   :named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cardiac arrhythmias."

(assert
(! (not patient_has_diagnosis_of_disease_of_liver_inthehistory@@serious)
   :named REQ1_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of serious hepatic disease."

(assert
(! (not patient_has_diagnosis_of_kidney_disease_inthehistory@@serious)
   :named REQ1_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of serious renal disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breast feeding"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast feeding."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_currently_using_medication_with_known_serious_hepatotoxic_effects Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using at least one medication with known serious hepatotoxic effects.","when_to_set_to_false":"Set to false if the patient is not currently using any medication with known serious hepatotoxic effects.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any medication with known serious hepatotoxic effects.","meaning":"Boolean indicating whether the patient is currently using any medication with known serious hepatotoxic effects."} ;; "currently using medication with known serious hepatotoxic effects"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_currently_using_medication_with_known_serious_hepatotoxic_effects)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using medication with known serious hepatotoxic effects."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_currently_using_medication_with_known_serious_interaction_with_chloroquine Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any medication with a known serious interaction with chloroquine (including but not limited to amiodarone, anticonvulsant medication, ciclosporin, digoxin, mefloquine, moxifloxacin).","when_to_set_to_false":"Set to false if the patient is currently not using any medication with a known serious interaction with chloroquine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any medication with a known serious interaction with chloroquine.","meaning":"Boolean indicating whether the patient is currently using any medication with a known serious interaction with chloroquine."} ;; "currently using medication with known serious interaction with chloroquine"
(declare-const patient_is_exposed_to_anticonvulsant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to anticonvulsant substances (e.g., taking anticonvulsant medication).","when_to_set_to_false":"Set to false if the patient is currently not exposed to anticonvulsant substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to anticonvulsant substances.","meaning":"Boolean indicating whether the patient is currently exposed to anticonvulsant substances."} ;; "anticonvulsant medication"
(declare-const patient_is_exposed_to_chloroquine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to chloroquine (e.g., taking or administered).","when_to_set_to_false":"Set to false if the patient is currently not exposed to chloroquine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to chloroquine.","meaning":"Boolean indicating whether the patient is currently exposed to chloroquine."} ;; "chloroquine"
(declare-const patient_is_exposed_to_chloroquine_now@@serious_interaction_with_chloroquine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to chloroquine involves a medication with a known serious interaction with chloroquine.","when_to_set_to_false":"Set to false if the patient's current exposure to chloroquine does not involve a medication with a known serious interaction with chloroquine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure involves a medication with a known serious interaction with chloroquine.","meaning":"Boolean indicating whether the patient's current exposure to chloroquine involves a medication with a known serious interaction with chloroquine."} ;; "chloroquine with known serious interaction"
(declare-const patient_is_exposed_to_cyclosporine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cyclosporine (e.g., taking ciclosporin).","when_to_set_to_false":"Set to false if the patient is currently not exposed to cyclosporine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cyclosporine.","meaning":"Boolean indicating whether the patient is currently exposed to cyclosporine."} ;; "ciclosporin"
(declare-const patient_is_exposed_to_digoxin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to digoxin (e.g., taking digoxin).","when_to_set_to_false":"Set to false if the patient is currently not exposed to digoxin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to digoxin.","meaning":"Boolean indicating whether the patient is currently exposed to digoxin."} ;; "digoxin"
(declare-const patient_is_taking_amiodarone_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an amiodarone-containing medicinal product.","when_to_set_to_false":"Set to false if the patient is currently not taking an amiodarone-containing medicinal product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an amiodarone-containing medicinal product.","meaning":"Boolean indicating whether the patient is currently taking an amiodarone-containing medicinal product."} ;; "amiodarone"
(declare-const patient_is_taking_mefloquine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a mefloquine-containing medicinal product.","when_to_set_to_false":"Set to false if the patient is currently not taking a mefloquine-containing medicinal product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a mefloquine-containing medicinal product.","meaning":"Boolean indicating whether the patient is currently taking a mefloquine-containing medicinal product."} ;; "mefloquine"
(declare-const patient_is_taking_moxifloxacin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a moxifloxacin-containing medicinal product.","when_to_set_to_false":"Set to false if the patient is currently not taking a moxifloxacin-containing medicinal product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a moxifloxacin-containing medicinal product.","meaning":"Boolean indicating whether the patient is currently taking a moxifloxacin-containing medicinal product."} ;; "moxifloxacin"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_taking_amiodarone_containing_product_now
           patient_is_exposed_to_anticonvulsant_now
           patient_is_exposed_to_cyclosporine_now
           patient_is_exposed_to_digoxin_now
           patient_is_taking_mefloquine_containing_product_now
           patient_is_taking_moxifloxacin_containing_product_now)
        patient_is_currently_using_medication_with_known_serious_interaction_with_chloroquine)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (amiodarone, anticonvulsant medication, ciclosporin, digoxin, mefloquine, moxifloxacin)."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_chloroquine_now@@serious_interaction_with_chloroquine
        patient_is_exposed_to_chloroquine_now)
:named REQ4_AUXILIARY1)) ;; "chloroquine with known serious interaction"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_currently_using_medication_with_known_serious_interaction_with_chloroquine)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using medication with known serious interaction with chloroquine with non-exhaustive examples (amiodarone, anticonvulsant medication, ciclosporin, digoxin, mefloquine, moxifloxacin)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_severe_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe depression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe depression.","meaning":"Boolean indicating whether the patient currently has severe depression."} ;; "severe depression"
(declare-const patient_is_taking_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an antidepressant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking an antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an antidepressant medication.","meaning":"Boolean indicating whether the patient is currently taking an antidepressant medication."} ;; "antidepressant"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; "as indicated by current use of antidepressant medication"
(assert
(! (=> patient_is_taking_antidepressant_now
     patient_has_finding_of_severe_depression_now)
:named REQ5_AUXILIARY0)) ;; "as indicated by current use of antidepressant medication"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_severe_depression_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current severe depression, as indicated by current use of antidepressant medication."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_retinal_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of retinal disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of retinal disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of retinal disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of retinal disorder."} ;; "retinal disease"
(declare-const patient_has_diagnosis_of_retinal_disorder_now@@is_known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of retinal disorder is known (confirmed and documented).","when_to_set_to_false":"Set to false if the diagnosis of retinal disorder is not known (e.g., only suspected or uncertain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of retinal disorder is known.","meaning":"Boolean indicating whether the diagnosis of retinal disorder is known."} ;; "known"
(declare-const patient_has_diagnosis_of_retinal_disorder_now@@is_serious Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of retinal disorder is considered serious (of significant clinical severity).","when_to_set_to_false":"Set to false if the diagnosis of retinal disorder is not considered serious (mild or insignificant).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of retinal disorder is serious.","meaning":"Boolean indicating whether the diagnosis of retinal disorder is serious."} ;; "serious"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_retinal_disorder_now@@is_known
      patient_has_diagnosis_of_retinal_disorder_now)
:named REQ6_AUXILIARY0)) ;; "known serious retinal disease"

(assert
(! (=> patient_has_diagnosis_of_retinal_disorder_now@@is_serious
      patient_has_diagnosis_of_retinal_disorder_now)
:named REQ6_AUXILIARY1)) ;; "serious retinal disease"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_has_diagnosis_of_retinal_disorder_now@@is_known
             patient_has_diagnosis_of_retinal_disorder_now@@is_serious))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known serious retinal disease."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_currently_participating_in_clinical_intervention_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any other clinical intervention trial.","when_to_set_to_false":"Set to false if the patient is not currently participating in any other clinical intervention trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any other clinical intervention trial.","meaning":"Boolean indicating whether the patient is currently participating in any other clinical intervention trial."} ;; "the patient is currently participating in any other clinical intervention trial"
(declare-const patient_has_participated_in_clinical_intervention_trial_within_past_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any other clinical intervention trial within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not participated in any other clinical intervention trial within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any other clinical intervention trial within the past thirty days.","meaning":"Boolean indicating whether the patient has participated in any other clinical intervention trial within the past thirty days."} ;; "the patient has participated within the past thirty days in any other clinical intervention trial"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_currently_participating_in_clinical_intervention_trial)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently participating in any other clinical intervention trial."

(assert
(! (not patient_has_participated_in_clinical_intervention_trial_within_past_30_days)
:named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has participated within the past thirty days in any other clinical intervention trial."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_glucose_6_phosphate_dehydrogenase_deficiency_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of glucose-6-phosphate dehydrogenase deficiency anemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of glucose-6-phosphate dehydrogenase deficiency anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of glucose-6-phosphate dehydrogenase deficiency anemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of glucose-6-phosphate dehydrogenase deficiency anemia."} ;; "glucose-6-phosphate dehydrogenase deficiency"

(declare-const patient_has_diagnosis_of_glucose_6_phosphate_dehydrogenase_deficiency_anemia_now@@diagnosis_is_known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of glucose-6-phosphate dehydrogenase deficiency anemia is known (confirmed, documented, and not merely suspected or uncertain).","when_to_set_to_false":"Set to false if the patient's diagnosis of glucose-6-phosphate dehydrogenase deficiency anemia is not known (i.e., only suspected, uncertain, or not documented as confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the patient's diagnosis of glucose-6-phosphate dehydrogenase deficiency anemia is known (confirmed and documented)."} ;; "known glucose-6-phosphate dehydrogenase deficiency"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_glucose_6_phosphate_dehydrogenase_deficiency_anemia_now@@diagnosis_is_known
       patient_has_diagnosis_of_glucose_6_phosphate_dehydrogenase_deficiency_anemia_now)
   :named REQ8_AUXILIARY0)) ;; "known glucose-6-phosphate dehydrogenase deficiency"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_glucose_6_phosphate_dehydrogenase_deficiency_anemia_now@@diagnosis_is_known)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known glucose-6-phosphate dehydrogenase deficiency."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_undergone_influenza_vaccination_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone vaccination for seasonal influenza within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not undergone vaccination for seasonal influenza within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone vaccination for seasonal influenza within the past 3 months.","meaning":"Boolean indicating whether the patient has undergone vaccination for seasonal influenza within the past 3 months."} ;; "vaccination for seasonal influenza within the three months prior to screening"
(declare-const patient_has_undergone_influenza_vaccination_inthepast3months@@temporalcontext_within3months_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone vaccination for seasonal influenza within the 3 months prior to the screening event.","when_to_set_to_false":"Set to false if the patient has not undergone vaccination for seasonal influenza within the 3 months prior to the screening event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone vaccination for seasonal influenza within the 3 months prior to the screening event.","meaning":"Boolean indicating whether the patient has undergone vaccination for seasonal influenza within the 3 months prior to screening."} ;; "vaccination for seasonal influenza within the three months prior to screening"
(declare-const patient_has_undergone_influenza_a_virus_subtype_h1n1_vaccination_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone vaccination for H1N1 strain influenza within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not undergone vaccination for H1N1 strain influenza within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone vaccination for H1N1 strain influenza within the past 3 months.","meaning":"Boolean indicating whether the patient has undergone vaccination for H1N1 strain influenza within the past 3 months."} ;; "vaccination for H1N1 strain influenza within the three months prior to screening"
(declare-const patient_has_undergone_influenza_a_virus_subtype_h1n1_vaccination_inthepast3months@@temporalcontext_within3months_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone vaccination for H1N1 strain influenza within the 3 months prior to the screening event.","when_to_set_to_false":"Set to false if the patient has not undergone vaccination for H1N1 strain influenza within the 3 months prior to the screening event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone vaccination for H1N1 strain influenza within the 3 months prior to the screening event.","meaning":"Boolean indicating whether the patient has undergone vaccination for H1N1 strain influenza within the 3 months prior to screening."} ;; "vaccination for H1N1 strain influenza within the three months prior to screening"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable for seasonal influenza
(assert
(! (=> patient_has_undergone_influenza_vaccination_inthepast3months@@temporalcontext_within3months_prior_to_screening
      patient_has_undergone_influenza_vaccination_inthepast3months)
:named REQ9_AUXILIARY0)) ;; "within the three months prior to screening"

;; Qualifier variable implies corresponding stem variable for H1N1 strain influenza
(assert
(! (=> patient_has_undergone_influenza_a_virus_subtype_h1n1_vaccination_inthepast3months@@temporalcontext_within3months_prior_to_screening
      patient_has_undergone_influenza_a_virus_subtype_h1n1_vaccination_inthepast3months)
:named REQ9_AUXILIARY1)) ;; "within the three months prior to screening"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_undergone_influenza_vaccination_inthepast3months@@temporalcontext_within3months_prior_to_screening)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received vaccination for seasonal influenza within the three months prior to screening."

(assert
(! (not patient_has_undergone_influenza_a_virus_subtype_h1n1_vaccination_inthepast3months@@temporalcontext_within3months_prior_to_screening)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received vaccination for H1N1 strain influenza within the three months prior to screening."
