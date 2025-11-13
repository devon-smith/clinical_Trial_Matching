;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "renal disease"
(declare-const patient_has_finding_of_kidney_disease_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's kidney disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's kidney disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease is clinically significant.","meaning":"Boolean indicating whether the patient's kidney disease is clinically significant."} ;; "clinically significant renal disease"
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "hepatic disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's liver disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's liver disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's liver disease is clinically significant.","meaning":"Boolean indicating whether the patient's liver disease is clinically significant."} ;; "clinically significant hepatic disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_kidney_disease_now@@clinically_significant
      patient_has_finding_of_kidney_disease_now)
   :named REQ0_AUXILIARY0)) ;; "clinically significant renal disease"

(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@clinically_significant
      patient_has_finding_of_disease_of_liver_now)
   :named REQ0_AUXILIARY1)) ;; "clinically significant hepatic disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_kidney_disease_now@@clinically_significant)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant renal disease."

(assert
(! (not patient_has_finding_of_disease_of_liver_now@@clinically_significant)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant hepatic disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_intermittent_porphyria_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with acute intermittent porphyria at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with acute intermittent porphyria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with acute intermittent porphyria.","meaning":"Boolean indicating whether the patient has ever been diagnosed with acute intermittent porphyria."} ;; "acute intermittent porphyria"

(declare-const patient_has_diagnosis_of_glucose_6_phosphate_dehydrogenase_deficiency_anemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with glucose-6-phosphate dehydrogenase deficiency anemia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with glucose-6-phosphate dehydrogenase deficiency anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with glucose-6-phosphate dehydrogenase deficiency anemia.","meaning":"Boolean indicating whether the patient has ever been diagnosed with glucose-6-phosphate dehydrogenase deficiency anemia."} ;; "glucose-6-phosphate dehydrogenase deficiency"

(declare-const patient_has_diagnosis_of_hemolytic_anemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hemolytic anemia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hemolytic anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hemolytic anemia.","meaning":"Boolean indicating whether the patient has ever been diagnosed with hemolytic anemia."} ;; "hemolytic anemia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_diagnosis_of_acute_intermittent_porphyria_inthehistory
            patient_has_diagnosis_of_glucose_6_phosphate_dehydrogenase_deficiency_anemia_inthehistory
            patient_has_diagnosis_of_hemolytic_anemia_inthehistory))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of acute intermittent porphyria) OR (the patient has a history of glucose-6-phosphate dehydrogenase deficiency) OR (the patient has a history of hemolytic anemia)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_allergy_to_zonisamide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to zonisamide.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to zonisamide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to zonisamide.","meaning":"Boolean indicating whether the patient currently has an allergy to zonisamide."} ;; "allergy to zonisamide"
(declare-const patient_has_finding_of_allergy_to_sulfonamide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to sulfonamides.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to sulfonamides.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to sulfonamides.","meaning":"Boolean indicating whether the patient currently has a clinical finding of allergy to sulfonamides."} ;; "allergy to sulfonamides"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_allergy_to_zonisamide_now
            patient_has_finding_of_allergy_to_sulfonamide_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has an allergy to zonisamide) OR (the patient has an allergy to sulfonamides)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a disorder of the cardiovascular system."} ;; "cardiovascular disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the cardiovascular system is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current disorder of the cardiovascular system is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the cardiovascular system is clinically unstable.","meaning":"Boolean indicating whether the patient's current disorder of the cardiovascular system is clinically unstable."} ;; "clinically unstable cardiovascular disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease of the liver is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current disease of the liver is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease of the liver is clinically unstable.","meaning":"Boolean indicating whether the patient's current disease of the liver is clinically unstable."} ;; "clinically unstable hepatic disease"
(declare-const patient_has_finding_of_kidney_disease_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current kidney disease is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current kidney disease is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current kidney disease is clinically unstable.","meaning":"Boolean indicating whether the patient's current kidney disease is clinically unstable."} ;; "clinically unstable renal disease"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a disorder of the gastrointestinal tract."} ;; "gastrointestinal disease"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the gastrointestinal tract is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current disorder of the gastrointestinal tract is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the gastrointestinal tract is clinically unstable.","meaning":"Boolean indicating whether the patient's current disorder of the gastrointestinal tract is clinically unstable."} ;; "clinically unstable gastrointestinal disease"
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the lung.","meaning":"Boolean indicating whether the patient currently has a disorder of the lung."} ;; "pulmonary disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the lung is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current disorder of the lung is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the lung is clinically unstable.","meaning":"Boolean indicating whether the patient's current disorder of the lung is clinically unstable."} ;; "clinically unstable pulmonary disease"
(declare-const patient_has_finding_of_metabolic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a metabolic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a metabolic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a metabolic disease.","meaning":"Boolean indicating whether the patient currently has a metabolic disease."} ;; "metabolic disease"
(declare-const patient_has_finding_of_metabolic_disease_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current metabolic disease is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current metabolic disease is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current metabolic disease is clinically unstable.","meaning":"Boolean indicating whether the patient's current metabolic disease is clinically unstable."} ;; "clinically unstable metabolic disease"
(declare-const patient_has_finding_of_endocrine_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an endocrine disease.","when_to_set_to_false":"Set to false if the patient currently does not have an endocrine disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an endocrine disease.","meaning":"Boolean indicating whether the patient currently has an endocrine disease."} ;; "endocrine disease"
(declare-const patient_has_finding_of_endocrine_disease_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current endocrine disease is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current endocrine disease is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current endocrine disease is clinically unstable.","meaning":"Boolean indicating whether the patient's current endocrine disease is clinically unstable."} ;; "clinically unstable endocrine disease"
(declare-const patient_has_finding_of_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a systemic disease.","meaning":"Boolean indicating whether the patient currently has a systemic disease."} ;; "systemic disease"
(declare-const patient_has_finding_of_systemic_disease_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current systemic disease is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current systemic disease is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current systemic disease is clinically unstable.","meaning":"Boolean indicating whether the patient's current systemic disease is clinically unstable."} ;; "clinically unstable systemic disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_now@@clinically_unstable
      patient_has_finding_of_disorder_of_cardiovascular_system_now)
   :named REQ3_AUXILIARY0)) ;; "clinically unstable cardiovascular disease"

(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@clinically_unstable
      patient_has_finding_of_disease_of_liver_now)
   :named REQ3_AUXILIARY1)) ;; "clinically unstable hepatic disease"

(assert
(! (=> patient_has_finding_of_kidney_disease_now@@clinically_unstable
      patient_has_finding_of_kidney_disease_now)
   :named REQ3_AUXILIARY2)) ;; "clinically unstable renal disease"

(assert
(! (=> patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@clinically_unstable
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
   :named REQ3_AUXILIARY3)) ;; "clinically unstable gastrointestinal disease"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@clinically_unstable
      patient_has_finding_of_disorder_of_lung_now)
   :named REQ3_AUXILIARY4)) ;; "clinically unstable pulmonary disease"

(assert
(! (=> patient_has_finding_of_metabolic_disease_now@@clinically_unstable
      patient_has_finding_of_metabolic_disease_now)
   :named REQ3_AUXILIARY5)) ;; "clinically unstable metabolic disease"

(assert
(! (=> patient_has_finding_of_endocrine_disease_now@@clinically_unstable
      patient_has_finding_of_endocrine_disease_now)
   :named REQ3_AUXILIARY6)) ;; "clinically unstable endocrine disease"

(assert
(! (=> patient_has_finding_of_systemic_disease_now@@clinically_unstable
      patient_has_finding_of_systemic_disease_now)
   :named REQ3_AUXILIARY7)) ;; "clinically unstable systemic disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disorder_of_cardiovascular_system_now@@clinically_unstable)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically unstable cardiovascular disease."

(assert
(! (not patient_has_finding_of_disease_of_liver_now@@clinically_unstable)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically unstable hepatic disease."

(assert
(! (not patient_has_finding_of_kidney_disease_now@@clinically_unstable)
   :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically unstable renal disease."

(assert
(! (not patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@clinically_unstable)
   :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically unstable gastrointestinal disease."

(assert
(! (not patient_has_finding_of_disorder_of_lung_now@@clinically_unstable)
   :named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically unstable pulmonary disease."

(assert
(! (not patient_has_finding_of_metabolic_disease_now@@clinically_unstable)
   :named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically unstable metabolic disease."

(assert
(! (not patient_has_finding_of_endocrine_disease_now@@clinically_unstable)
   :named REQ3_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically unstable endocrine disease."

(assert
(! (not patient_has_finding_of_systemic_disease_now@@clinically_unstable)
   :named REQ3_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically unstable systemic disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_laboratory_test_result_with_clinically_significant_abnormality_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at least one laboratory test result that, in the opinion of the Investigator, is a clinically significant abnormality.","when_to_set_to_false":"Set to false if the patient does not have any laboratory test result that, in the opinion of the Investigator, is a clinically significant abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any laboratory test result that, in the opinion of the Investigator, is a clinically significant abnormality.","meaning":"Boolean indicating whether the patient has any laboratory test result that, in the opinion of the Investigator, is a clinically significant abnormality."} ;; "laboratory test results that, in the opinion of the Investigator, are clinically significant abnormalities"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_laboratory_test_result_with_clinically_significant_abnormality_investigator_opinion)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has laboratory test results that, in the opinion of the Investigator, are clinically significant abnormalities."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires treatment with any drug or medicament.","when_to_set_to_false":"Set to false if the patient does not currently require treatment with any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires treatment with any drug or medicament.","meaning":"Boolean indicating whether the patient currently requires treatment with any drug or medicament."} ;; "requires treatment with any medication"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@might_interact_adversely_with_action_of_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to might interact adversely with the action of the study drug.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to does not interact adversely with the action of the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament might interact adversely with the action of the study drug.","meaning":"Boolean indicating whether the drug or medicament the patient is currently exposed to might interact adversely with the action of the study drug."} ;; "medication ... that might interact adversely with the action of the study drug"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@might_obscure_action_of_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to might obscure the action of the study drug.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to does not obscure the action of the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament might obscure the action of the study drug.","meaning":"Boolean indicating whether the drug or medicament the patient is currently exposed to might obscure the action of the study drug."} ;; "medication ... that might obscure the action of the study drug"

(declare-const patient_is_taking_carbonic_anhydrase_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any carbonic anhydrase inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking any carbonic anhydrase inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any carbonic anhydrase inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking any carbonic anhydrase inhibitor containing product."} ;; "carbonic anhydrase inhibitors"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive example: carbonic anhydrase inhibitors are a possible instance of medication that might interact adversely
(assert
(! (=> patient_is_taking_carbonic_anhydrase_inhibitor_containing_product_now
     patient_is_exposed_to_drug_or_medicament_now@@might_interact_adversely_with_action_of_study_drug)
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (carbonic anhydrase inhibitors) that might interact adversely with the action of the study drug"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@might_interact_adversely_with_action_of_study_drug
     patient_is_exposed_to_drug_or_medicament_now)
:named REQ5_AUXILIARY1)) ;; "medication ... that might interact adversely with the action of the study drug"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@might_obscure_action_of_study_drug
     patient_is_exposed_to_drug_or_medicament_now)
:named REQ5_AUXILIARY2)) ;; "medication ... that might obscure the action of the study drug"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT require treatment with any medication that might interact adversely with the action of the study drug
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@might_interact_adversely_with_action_of_study_drug)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "requires treatment with any medication ... that might interact adversely with the action of the study drug"

;; Exclusion: patient must NOT require treatment with any medication that might obscure the action of the study drug
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@might_obscure_action_of_study_drug)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "requires treatment with any medication ... that might obscure the action of the study drug"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as lactating.","when_to_set_to_false":"Set to false if the patient is currently documented as not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_has_finding_of_finding_of_lactation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing lactation.","when_to_set_to_false":"Set to false if the patient is currently not experiencing lactation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing lactation.","meaning":"Boolean indicating whether the patient is currently experiencing lactation."} ;; "lactating"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; "the patient is lactating" implies "the patient is currently experiencing lactation"
(assert
(! (=> patient_is_lactating_now patient_has_finding_of_finding_of_lactation_now)
    :named REQ6_AUXILIARY0)) ;; "the patient is lactating" ⇒ "the patient is currently experiencing lactation"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: (the patient is female AND the patient is pregnant) OR (the patient is female AND the patient is lactating)
(assert
(! (not (or (and patient_sex_is_female_now patient_is_pregnant_now)
            (and patient_sex_is_female_now patient_is_lactating_now)))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is female AND the patient is pregnant) OR (the patient is female AND the patient is lactating)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_kidney_stone_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had nephrolithiasis (kidney stones) documented at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had nephrolithiasis (kidney stones) documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had nephrolithiasis (kidney stones).","meaning":"Boolean indicating whether the patient has ever had nephrolithiasis (kidney stones) in their medical history."} ;; "nephrolithiasis"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_kidney_stone_inthehistory)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of nephrolithiasis."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_refuses_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently refuses to give informed consent.","when_to_set_to_false":"Set to false if the patient currently does not refuse to give informed consent (i.e., gives informed consent or has not refused).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently refuses to give informed consent.","meaning":"Boolean indicating whether the patient currently refuses to give informed consent."} ;; "refuses to give informed consent"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_refuses_to_give_informed_consent_now)
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to give informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_previously_enrolled_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously enrolled in this study at any time in the past.","when_to_set_to_false":"Set to false if the patient has never previously enrolled in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously enrolled in this study.","meaning":"Boolean indicating whether the patient has previously enrolled in this study at any time in the past."} ;; "the patient has previously enrolled in this study"

(declare-const patient_has_taken_zonisamide_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever, at any time in their history, taken a zonisamide-containing product (including any prior treatment or exposure).","when_to_set_to_false":"Set to false if the patient has never, at any time in their history, taken a zonisamide-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a zonisamide-containing product.","meaning":"Boolean indicating whether the patient has ever, at any time in their history, taken a zonisamide-containing product."} ;; "the patient has previously been treated with zonisamide"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not (or patient_has_previously_enrolled_in_this_study
              patient_has_taken_zonisamide_containing_product_inthehistory))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has previously enrolled in this study) OR (the patient has previously been treated with zonisamide)."
