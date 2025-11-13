;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_clinical_signs_of_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of malaria.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of malaria.","meaning":"Boolean indicating whether the patient currently has clinical signs of malaria."} ;; "signs of severe malaria"
(declare-const patient_has_clinical_signs_of_malaria_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of malaria and the malaria is severe.","when_to_set_to_false":"Set to false if the patient currently has clinical signs of malaria but the malaria is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malaria is severe in the presence of clinical signs.","meaning":"Boolean indicating whether the patient currently has clinical signs of malaria and the malaria is severe."} ;; "signs of severe malaria"
(declare-const patient_has_symptoms_of_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of malaria.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of malaria.","meaning":"Boolean indicating whether the patient currently has symptoms of malaria."} ;; "symptoms of severe malaria"
(declare-const patient_has_symptoms_of_malaria_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of malaria and the malaria is severe.","when_to_set_to_false":"Set to false if the patient currently has symptoms of malaria but the malaria is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malaria is severe in the presence of symptoms.","meaning":"Boolean indicating whether the patient currently has symptoms of malaria and the malaria is severe."} ;; "symptoms of severe malaria"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_clinical_signs_of_malaria_now@@severe
       patient_has_clinical_signs_of_malaria_now)
   :named REQ0_AUXILIARY0)) ;; "signs of severe malaria"

(assert
(! (=> patient_has_symptoms_of_malaria_now@@severe
       patient_has_symptoms_of_malaria_now)
   :named REQ0_AUXILIARY1)) ;; "symptoms of severe malaria"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_clinical_signs_of_malaria_now@@severe)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of severe malaria."

(assert
(! (not patient_has_symptoms_of_malaria_now@@severe)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms of severe malaria."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_cardiologic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cardiologic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cardiologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cardiologic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cardiologic disease."} ;; "cardiologic diseases"
(declare-const patient_has_diagnosis_of_cardiologic_disease_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiologic disease is chronic.","when_to_set_to_false":"Set to false if the patient's cardiologic disease is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiologic disease is chronic.","meaning":"Boolean indicating whether the patient's cardiologic disease is chronic."} ;; "chronic cardiologic diseases"
(declare-const patient_has_diagnosis_of_cardiologic_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiologic disease is severe.","when_to_set_to_false":"Set to false if the patient's cardiologic disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiologic disease is severe.","meaning":"Boolean indicating whether the patient's cardiologic disease is severe."} ;; "severe cardiologic diseases"
(declare-const patient_has_diagnosis_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of kidney disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of kidney disease."} ;; "renal diseases"
(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of liver disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of liver disease."} ;; "hepatic diseases"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_has_diagnosis_of_aids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acquired immunodeficiency syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acquired immunodeficiency syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acquired immunodeficiency syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acquired immunodeficiency syndrome."} ;; "acquired immunodeficiency syndrome"
(declare-const patient_has_diagnosis_of_aids_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acquired immunodeficiency syndrome is chronic.","when_to_set_to_false":"Set to false if the patient's acquired immunodeficiency syndrome is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acquired immunodeficiency syndrome is chronic.","meaning":"Boolean indicating whether the patient's acquired immunodeficiency syndrome is chronic."} ;; "chronic acquired immunodeficiency syndrome"
(declare-const patient_has_diagnosis_of_aids_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acquired immunodeficiency syndrome is severe.","when_to_set_to_false":"Set to false if the patient's acquired immunodeficiency syndrome is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acquired immunodeficiency syndrome is severe.","meaning":"Boolean indicating whether the patient's acquired immunodeficiency syndrome is severe."} ;; "severe acquired immunodeficiency syndrome"
(declare-const patient_has_diagnosis_of_nutritional_marasmus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of nutritional marasmus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of nutritional marasmus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of nutritional marasmus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of nutritional marasmus."} ;; "severe malnutrition"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_cardiologic_disease_now@@chronic
      patient_has_diagnosis_of_cardiologic_disease_now)
:named REQ1_AUXILIARY0)) ;; "chronic cardiologic diseases"
(assert
(! (=> patient_has_diagnosis_of_cardiologic_disease_now@@severe
      patient_has_diagnosis_of_cardiologic_disease_now)
:named REQ1_AUXILIARY1)) ;; "severe cardiologic diseases"
(assert
(! (=> patient_has_diagnosis_of_aids_now@@chronic
      patient_has_diagnosis_of_aids_now)
:named REQ1_AUXILIARY2)) ;; "chronic acquired immunodeficiency syndrome"
(assert
(! (=> patient_has_diagnosis_of_aids_now@@severe
      patient_has_diagnosis_of_aids_now)
:named REQ1_AUXILIARY3)) ;; "severe acquired immunodeficiency syndrome"

;; Non-exhaustive examples imply umbrella term
(declare-const patient_has_other_severe_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other severe chronic disease, including but not limited to those listed in the examples.","when_to_set_to_false":"Set to false if the patient currently does not have any other severe chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other severe chronic disease.","meaning":"Boolean indicating whether the patient currently has any other severe chronic disease."} ;; "other severe chronic diseases"
(assert
(! (=> (or patient_has_diagnosis_of_cardiologic_disease_now@@chronic
          patient_has_diagnosis_of_cardiologic_disease_now@@severe
          patient_has_diagnosis_of_kidney_disease_now
          patient_has_diagnosis_of_disease_of_liver_now
          patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
          patient_has_diagnosis_of_aids_now@@chronic
          patient_has_diagnosis_of_aids_now@@severe
          patient_has_diagnosis_of_nutritional_marasmus_now)
      patient_has_other_severe_chronic_disease_now)
:named REQ1_AUXILIARY4)) ;; "with non-exhaustive examples ((cardiologic diseases) OR (renal diseases) OR (hepatic diseases) OR (human immunodeficiency virus infection) OR (acquired immunodeficiency syndrome) OR (severe malnutrition))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_other_severe_chronic_disease_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other severe chronic diseases with non-exhaustive examples ((cardiologic diseases) OR (renal diseases) OR (hepatic diseases) OR (human immunodeficiency virus infection) OR (acquired immunodeficiency syndrome) OR (severe malnutrition))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_allergy_to_artesunate_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to any artesunate-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has a documented history of no allergy to any artesunate-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any artesunate-containing product.","meaning":"Boolean indicating whether the patient has ever had an allergy to an artesunate-containing product in their history."} ;; "artesunate"
(declare-const patient_has_allergy_to_clindamycin_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to any clindamycin-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has a documented history of no allergy to any clindamycin-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any clindamycin-containing product.","meaning":"Boolean indicating whether the patient has ever had an allergy to a clindamycin-containing product in their history."} ;; "clindamycin"
(declare-const patient_has_allergy_to_mefloquine_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to any mefloquine-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has a documented history of no allergy to any mefloquine-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any mefloquine-containing product.","meaning":"Boolean indicating whether the patient has ever had an allergy to a mefloquine-containing product in their history."} ;; "mefloquine"
(declare-const patient_has_allergy_to_quinine_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to any quinine-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has a documented history of no allergy to any quinine-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any quinine-containing product.","meaning":"Boolean indicating whether the patient has ever had an allergy to a quinine-containing product in their history."} ;; "quinine"
(declare-const patient_has_allergy_to_tetracycline_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to any tetracycline-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has a documented history of no allergy to any tetracycline-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any tetracycline-containing product.","meaning":"Boolean indicating whether the patient has ever had an allergy to a tetracycline-containing product in their history."} ;; "tetracycline"

(declare-const patient_has_allergy_to_any_proposed_treatment_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to any of the proposed treatments at any time in the past.","when_to_set_to_false":"Set to false if the patient has a documented history of no allergy to any of the proposed treatments at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any of the proposed treatments.","meaning":"Boolean indicating whether the patient has ever had an allergy to any of the proposed treatments in their history."} ;; "history of allergy to any of the proposed treatment"
(declare-const patient_has_allergy_to_any_proposed_treatment_alternative_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to any of the proposed treatment alternatives at any time in the past.","when_to_set_to_false":"Set to false if the patient has a documented history of no allergy to any of the proposed treatment alternatives at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any of the proposed treatment alternatives.","meaning":"Boolean indicating whether the patient has ever had an allergy to any of the proposed treatment alternatives in their history."} ;; "history of allergy to any of the proposed treatment alternatives"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term for alternatives
(assert
(! (=> (or patient_has_allergy_to_mefloquine_containing_product_inthehistory
           patient_has_allergy_to_artesunate_containing_product_inthehistory
           patient_has_allergy_to_quinine_containing_product_inthehistory
           patient_has_allergy_to_tetracycline_containing_product_inthehistory
           patient_has_allergy_to_clindamycin_containing_product_inthehistory)
    patient_has_allergy_to_any_proposed_treatment_alternative_inthehistory)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((mefloquine) OR (artesunate) OR (quinine) OR (tetracycline) OR (clindamycin))."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_allergy_to_any_proposed_treatment_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to any of the proposed treatment."

(assert
(! (not patient_has_allergy_to_any_proposed_treatment_alternative_inthehistory)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to any of the proposed treatment alternatives with non-exhaustive examples ((mefloquine) OR (artesunate) OR (quinine) OR (tetracycline) OR (clindamycin))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant as determined by a urine test"
(declare-const patient_is_pregnant_now_determined_by_urine_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant and this status is determined by a urine test.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a urine test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pregnant as determined by a urine test.","meaning":"Boolean indicating whether the patient is currently pregnant as determined by a urine test."} ;; "the patient is pregnant as determined by a urine test"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Pregnancy as determined by urine test implies pregnancy
(assert
(! (=> patient_is_pregnant_now_determined_by_urine_test
      patient_is_pregnant_now)
:named REQ3_AUXILIARY0)) ;; "as determined by a urine test""

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_pregnant_now_determined_by_urine_test)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant as determined by a urine test."
