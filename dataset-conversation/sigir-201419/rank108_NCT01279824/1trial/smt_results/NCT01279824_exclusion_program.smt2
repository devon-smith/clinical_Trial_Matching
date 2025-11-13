;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_history_of_behavioral_swallowing_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to behavioral swallowing therapy prior to admission.","when_to_set_to_false":"Set to false if the patient has never been exposed to behavioral swallowing therapy prior to admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to behavioral swallowing therapy prior to admission.","meaning":"Boolean indicating whether the patient has a history of exposure to behavioral swallowing therapy prior to admission."} ;; "has been exposed to previous behavioral swallowing therapy"

(declare-const patient_has_history_of_neuromuscular_electrical_stimulation_swallowing_therapy_within_6_months_of_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to neuromuscular electrical stimulation swallowing therapy within 6 months prior to admission.","when_to_set_to_false":"Set to false if the patient has not been exposed to neuromuscular electrical stimulation swallowing therapy within 6 months prior to admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to neuromuscular electrical stimulation swallowing therapy within 6 months prior to admission.","meaning":"Boolean indicating whether the patient has a history of exposure to neuromuscular electrical stimulation swallowing therapy within 6 months prior to admission."} ;; "has been exposed to previous neuromuscular electrical stimulation swallowing therapy within 6 months of admission"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_history_of_behavioral_swallowing_therapy)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been exposed to previous behavioral swallowing therapy"

(assert
  (! (not patient_has_history_of_neuromuscular_electrical_stimulation_swallowing_therapy_within_6_months_of_admission)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been exposed to previous neuromuscular electrical stimulation swallowing therapy within 6 months of admission."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_amyotrophic_lateral_sclerosis_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of amyotrophic lateral sclerosis within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of amyotrophic lateral sclerosis within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of amyotrophic lateral sclerosis within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of amyotrophic lateral sclerosis within the past 6 months."} ;; "amyotrophic lateral sclerosis"
(declare-const patient_has_diagnosis_of_parkinson_s_disease_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of Parkinson's disease within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of Parkinson's disease within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of Parkinson's disease within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of Parkinson's disease within the past 6 months."} ;; "Parkinson's disease"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of any neurological disorder within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of any neurological disorder within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of any neurological disorder within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of any neurological disorder within the past 6 months."} ;; "neurological disorder"
(declare-const patient_has_diagnosis_of_progressive_neurological_disorder_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of a progressive neurological disorder within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of a progressive neurological disorder within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of a progressive neurological disorder within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of a progressive neurological disorder within the past 6 months."} ;; "progressive neurological disorder within the last 6 months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples: "such as amyotrophic lateral sclerosis, Parkinson's disease"
(assert
(! (=> (or patient_has_diagnosis_of_amyotrophic_lateral_sclerosis_inthepast6months
           patient_has_diagnosis_of_parkinson_s_disease_inthepast6months)
       patient_has_diagnosis_of_progressive_neurological_disorder_inthepast6months)
   :named REQ1_AUXILIARY0)) ;; "such as amyotrophic lateral sclerosis, Parkinson's disease"

;; Progressive neurological disorder is a subset of neurological disorder
(assert
(! (=> patient_has_diagnosis_of_progressive_neurological_disorder_inthepast6months
       patient_has_diagnosis_of_disorder_of_nervous_system_inthepast6months)
   :named REQ1_AUXILIARY1)) ;; "progressive neurological disorder" is a type of "neurological disorder"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_progressive_neurological_disorder_inthepast6months)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has a progressive neurological disorder, such as amyotrophic lateral sclerosis, Parkinson's disease, or other neurological disorder within the last 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_destructive_procedure_on_brain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a destructive (ablative) neurosurgical procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a destructive (ablative) neurosurgical procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a destructive (ablative) neurosurgical procedure.","meaning":"Boolean indicating whether the patient has ever undergone a destructive (ablative) neurosurgical procedure at any time in their history."} ;; "ablative neurosurgery"
(declare-const patient_has_undergone_neurostimulation_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a stimulatory (neurostimulation) neurosurgical procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a stimulatory (neurostimulation) neurosurgical procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a stimulatory (neurostimulation) neurosurgical procedure.","meaning":"Boolean indicating whether the patient has ever undergone a stimulatory (neurostimulation) neurosurgical procedure at any time in their history."} ;; "stimulatory neurosurgery"
(declare-const patient_has_finding_of_encephalitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis or clinical finding of encephalitis at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis or clinical finding of encephalitis at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis or clinical finding of encephalitis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis or clinical finding of encephalitis at any time in their history."} ;; "encephalitis"
(declare-const patient_has_finding_of_major_head_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis or clinical finding of significant (major) head trauma at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis or clinical finding of significant (major) head trauma at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis or clinical finding of significant (major) head trauma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis or clinical finding of significant (major) head trauma at any time in their history."} ;; "significant head trauma"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_destructive_procedure_on_brain_inthehistory)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of ablative neurosurgery."

(assert
(! (not patient_has_undergone_neurostimulation_procedure_inthehistory)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stimulatory neurosurgery."

(assert
(! (not patient_has_finding_of_encephalitis_inthehistory)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of encephalitis."

(assert
(! (not patient_has_finding_of_major_head_injury_inthehistory)
    :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of significant head trauma."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart disease at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of heart disease in their history."} ;; "heart disease"
(declare-const patient_has_diagnosis_of_heart_disease_inthehistory@@is_significant_medical_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of heart disease qualifies as a significant medical condition.","when_to_set_to_false":"Set to false if the patient's history of heart disease does not qualify as a significant medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of heart disease qualifies as a significant medical condition.","meaning":"Boolean indicating whether the patient's history of heart disease is a significant medical condition."} ;; "heart disease qualifies as a significant medical condition"
(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with liver disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with liver disease at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with liver disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of liver disease in their history."} ;; "liver disease"
(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory@@is_significant_medical_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of liver disease qualifies as a significant medical condition.","when_to_set_to_false":"Set to false if the patient's history of liver disease does not qualify as a significant medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of liver disease qualifies as a significant medical condition.","meaning":"Boolean indicating whether the patient's history of liver disease is a significant medical condition."} ;; "liver disease qualifies as a significant medical condition"
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with kidney disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with kidney disease at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with kidney disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of kidney disease in their history."} ;; "renal disease"
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory@@is_significant_medical_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of kidney disease qualifies as a significant medical condition.","when_to_set_to_false":"Set to false if the patient's history of kidney disease does not qualify as a significant medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of kidney disease qualifies as a significant medical condition.","meaning":"Boolean indicating whether the patient's history of kidney disease is a significant medical condition."} ;; "renal disease qualifies as a significant medical condition"
(declare-const patient_has_history_of_significant_medical_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of a significant medical condition (as determined by clinical judgment or protocol definition).","when_to_set_to_false":"Set to false if the patient does not have a history of a significant medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of a significant medical condition.","meaning":"Boolean indicating whether the patient has a history of a significant medical condition."} ;; "history of a significant medical condition"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malignancy (malignant neoplastic disease) within the past five years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malignancy (malignant neoplastic disease) within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malignancy (malignant neoplastic disease) within the past five years.","meaning":"Boolean indicating whether the patient has had a diagnosis of malignancy (malignant neoplastic disease) within the past five years."} ;; "history of malignancy within the past five years"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@other_than_excised_basal_cell_carcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignancy within the past five years is not excised basal cell carcinoma.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignancy within the past five years is excised basal cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of malignancy within the past five years is excised basal cell carcinoma.","meaning":"Boolean indicating whether the patient's diagnosis of malignancy within the past five years is other than excised basal cell carcinoma."} ;; "malignancy within the past five years other than excised basal cell carcinoma"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has evidence of malignancy (malignant neoplastic disease) within the past five years.","when_to_set_to_false":"Set to false if the patient does not have evidence of malignancy (malignant neoplastic disease) within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has evidence of malignancy (malignant neoplastic disease) within the past five years.","meaning":"Boolean indicating whether the patient has evidence of malignancy (malignant neoplastic disease) within the past five years."} ;; "evidence of malignancy within the past five years"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthepast5years@@other_than_excised_basal_cell_carcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's evidence of malignancy within the past five years is not excised basal cell carcinoma.","when_to_set_to_false":"Set to false if the patient's evidence of malignancy within the past five years is excised basal cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's evidence of malignancy within the past five years is excised basal cell carcinoma.","meaning":"Boolean indicating whether the patient's evidence of malignancy within the past five years is other than excised basal cell carcinoma."} ;; "evidence of malignancy within the past five years other than excised basal cell carcinoma"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_heart_disease_inthehistory@@is_significant_medical_condition
          patient_has_diagnosis_of_disease_of_liver_inthehistory@@is_significant_medical_condition
          patient_has_diagnosis_of_kidney_disease_inthehistory@@is_significant_medical_condition)
patient_has_history_of_significant_medical_condition)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (heart disease, liver disease, renal disease)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_heart_disease_inthehistory@@is_significant_medical_condition
patient_has_diagnosis_of_heart_disease_inthehistory)
:named REQ3_AUXILIARY1)) ;; "heart disease qualifies as a significant medical condition"

(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_inthehistory@@is_significant_medical_condition
patient_has_diagnosis_of_disease_of_liver_inthehistory)
:named REQ3_AUXILIARY2)) ;; "liver disease qualifies as a significant medical condition"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_inthehistory@@is_significant_medical_condition
patient_has_diagnosis_of_kidney_disease_inthehistory)
:named REQ3_AUXILIARY3)) ;; "renal disease qualifies as a significant medical condition"

;; Qualifier variables imply corresponding stem variables for malignancy
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@other_than_excised_basal_cell_carcinoma
patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years)
:named REQ3_AUXILIARY4)) ;; "malignancy within the past five years other than excised basal cell carcinoma"

(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_inthepast5years@@other_than_excised_basal_cell_carcinoma
patient_has_finding_of_malignant_neoplastic_disease_inthepast5years)
:named REQ3_AUXILIARY5)) ;; "evidence of malignancy within the past five years other than excised basal cell carcinoma"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_history_of_significant_medical_condition)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of a significant medical condition with non-exhaustive examples (heart disease, liver disease, renal disease)."

(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@other_than_excised_basal_cell_carcinoma)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of malignancy within the past five years other than excised basal cell carcinoma."

(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_inthepast5years@@other_than_excised_basal_cell_carcinoma)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of malignancy within the past five years other than excised basal cell carcinoma."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_cardiac_demand_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac demand pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac demand pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac demand pacemaker.","meaning":"Boolean indicating whether the patient currently has a cardiac demand pacemaker."} ;; "The patient is excluded if the patient has a cardiac demand pacemaker."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_cardiac_demand_pacemaker_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cardiac demand pacemaker."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired cognition.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired cognition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired cognition.","meaning":"Boolean indicating whether the patient currently has impaired cognition."} ;; "cognitive impairment"
(declare-const patient_has_finding_of_impaired_cognition_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired cognition is significant.","when_to_set_to_false":"Set to false if the patient's impaired cognition is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's impaired cognition is significant.","meaning":"Boolean indicating whether the patient's impaired cognition is significant."} ;; "significant cognitive impairment"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const mini_mental_test_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current Mini-Mental test score in points if available.","when_to_set_to_null":"Set to null if the patient's current Mini-Mental test score is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current Mini-Mental test score in points."} ;; "Mini-Mental test score less than twenty-three"
(declare-const comprehension_quotient_score_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current comprehension quotient score on the Western Aphasia Battery in percent if available.","when_to_set_to_null":"Set to null if the patient's current comprehension quotient score on the Western Aphasia Battery is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current comprehension quotient score on the Western Aphasia Battery in percent."} ;; "comprehension quotient score of fifty percent or less on the Western Aphasia Battery"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_impaired_cognition_now@@significant
      patient_has_finding_of_impaired_cognition_now)
:named REQ5_AUXILIARY0)) ;; "significant cognitive impairment"

;; Dementia as reflected in Mini-Mental test score or comprehension quotient score
(assert
(! (= patient_has_finding_of_dementia_now
      (or (< mini_mental_test_score_value_recorded_now_withunit_points 23)
          (<= comprehension_quotient_score_value_recorded_now_withunit_percent 50)))
:named REQ5_AUXILIARY1)) ;; "dementia as reflected in ((Mini-Mental test score less than twenty-three) OR (comprehension quotient score of fifty percent or less on the Western Aphasia Battery))"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: significant cognitive impairment
(assert
(! (not patient_has_finding_of_impaired_cognition_now@@significant)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of significant cognitive impairment."

;; Exclusion: dementia as reflected in Mini-Mental or comprehension quotient
(assert
(! (not patient_has_finding_of_dementia_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of dementia as reflected in ((Mini-Mental test score less than twenty-three) OR (comprehension quotient score of fifty percent or less on the Western Aphasia Battery))."
