;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malaria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malaria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malaria."} ;; "malaria"
(declare-const patient_has_diagnosis_of_malaria_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malaria and the malaria is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malaria but the malaria is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malaria is severe.","meaning":"Boolean indicating whether the patient's current malaria diagnosis is severe."} ;; "severe malaria"
(declare-const patient_has_diagnosis_of_malaria_now@@complicated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malaria and the malaria is complicated.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malaria but the malaria is not complicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malaria is complicated.","meaning":"Boolean indicating whether the patient's current malaria diagnosis is complicated."} ;; "complicated malaria"
(declare-const patient_has_finding_of_disturbance_of_consciousness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impaired consciousness.","when_to_set_to_false":"Set to false if the patient currently does not have impaired consciousness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired consciousness.","meaning":"Boolean indicating whether the patient currently has impaired consciousness."} ;; "impaired consciousness"
(declare-const patient_has_finding_of_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has seizures.","when_to_set_to_false":"Set to false if the patient currently does not have seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has seizures.","meaning":"Boolean indicating whether the patient currently has seizures."} ;; "seizures"
(declare-const patient_has_finding_of_abnormal_neurologic_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal neurologic examination.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal neurologic examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal neurologic examination.","meaning":"Boolean indicating whether the patient currently has abnormal neurologic examination."} ;; "abnormal neurologic examination"
(declare-const patient_has_finding_of_jaundice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has jaundice.","when_to_set_to_false":"Set to false if the patient currently does not have jaundice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has jaundice.","meaning":"Boolean indicating whether the patient currently has jaundice."} ;; "jaundice"
(declare-const patient_has_finding_of_respiratory_distress_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory distress.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory distress.","meaning":"Boolean indicating whether the patient currently has respiratory distress."} ;; "respiratory distress"
(declare-const patient_has_finding_of_persistent_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has persistent vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have persistent vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has persistent vomiting.","meaning":"Boolean indicating whether the patient currently has persistent vomiting."} ;; "persistent vomiting"
(declare-const patient_has_finding_of_blood_in_urine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hematuria.","when_to_set_to_false":"Set to false if the patient currently does not have hematuria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hematuria.","meaning":"Boolean indicating whether the patient currently has hematuria."} ;; "hematuria"
(declare-const patient_has_finding_of_blood_in_urine_now@@as_reported_by_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hematuria and the hematuria is as reported by the patient.","when_to_set_to_false":"Set to false if the patient currently has hematuria but it is not as reported by the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hematuria is as reported by the patient.","meaning":"Boolean indicating whether the patient's current hematuria is as reported by the patient."} ;; "hematuria (as reported by the patient)"
(declare-const parasite_density_value_recorded_now_withunit_parasites_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's parasite density recorded now, in units of parasites per mL.","when_to_set_to_null":"Set to null if the patient's parasite density value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's parasite density recorded now, in units of parasites per mL."} ;; "parasite density greater than 100,000 parasites/mL"
(declare-const patient_has_finding_of_malaria_caused_by_plasmodium_not_plasmodium_falciparum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has non-falciparum malaria species.","when_to_set_to_false":"Set to false if the patient currently does not have non-falciparum malaria species.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has non-falciparum malaria species.","meaning":"Boolean indicating whether the patient currently has non-falciparum malaria species."} ;; "non-falciparum malaria species"
(declare-const patient_has_finding_of_malaria_caused_by_plasmodium_not_plasmodium_falciparum_now@@presence_on_microscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has non-falciparum malaria species and their presence is determined on microscopy.","when_to_set_to_false":"Set to false if the patient currently has non-falciparum malaria species but their presence is not determined on microscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the presence of non-falciparum malaria species is determined on microscopy.","meaning":"Boolean indicating whether the patient's current non-falciparum malaria species are determined on microscopy."} ;; "presence of non-falciparum malaria species on microscopy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_malaria_now@@severe
       patient_has_diagnosis_of_malaria_now)
   :named REQ0_AUXILIARY0)) ;; "severe malaria"

(assert
(! (=> patient_has_diagnosis_of_malaria_now@@complicated
       patient_has_diagnosis_of_malaria_now)
   :named REQ0_AUXILIARY1)) ;; "complicated malaria"

(assert
(! (=> patient_has_finding_of_blood_in_urine_now@@as_reported_by_patient
       patient_has_finding_of_blood_in_urine_now)
   :named REQ0_AUXILIARY2)) ;; "hematuria (as reported by the patient)"

(assert
(! (=> patient_has_finding_of_malaria_caused_by_plasmodium_not_plasmodium_falciparum_now@@presence_on_microscopy
       patient_has_finding_of_malaria_caused_by_plasmodium_not_plasmodium_falciparum_now)
   :named REQ0_AUXILIARY3)) ;; "presence of non-falciparum malaria species on microscopy"

;; Definition of complicated malaria (exhaustive subcategories)
(assert
(! (= patient_has_diagnosis_of_malaria_now@@complicated
      (or patient_has_finding_of_disturbance_of_consciousness_now
          patient_has_finding_of_seizure_now
          patient_has_finding_of_abnormal_neurologic_examination_now
          patient_has_finding_of_jaundice_now
          patient_has_finding_of_respiratory_distress_now
          patient_has_finding_of_persistent_vomiting_now
          patient_has_finding_of_blood_in_urine_now@@as_reported_by_patient
          (> parasite_density_value_recorded_now_withunit_parasites_per_ml 100000)
          patient_has_finding_of_malaria_caused_by_plasmodium_not_plasmodium_falciparum_now@@presence_on_microscopy))
   :named REQ0_AUXILIARY4)) ;; "complicated malaria, defined as having at least one of the following: impaired consciousness, seizures or abnormal neurologic examination, jaundice, respiratory distress, persistent vomiting, hematuria (as reported by the patient), parasite density greater than 100,000 parasites/mL, or presence of non-falciparum malaria species on microscopy."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_malaria_now@@severe)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe malaria."

(assert
(! (not patient_has_diagnosis_of_malaria_now@@complicated)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has complicated malaria, defined as having at least one of the following: impaired consciousness, seizures or abnormal neurologic examination, jaundice, respiratory distress, persistent vomiting, hematuria (as reported by the patient), parasite density greater than 100,000 parasites/mL, or presence of non-falciparum malaria species on microscopy."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Link alternate breast-feeding variable to main variable
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ1_AUXILIARY0)) ;; "the patient is breast-feeding"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT be pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; Exclusion: patient must NOT be breast-feeding
(assert
(! (not patient_is_breastfeeding_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_allergy_to_azithromycin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of allergy to azithromycin at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of allergy to azithromycin in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of allergy to azithromycin.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy to azithromycin in their medical history."} ;; "the patient has a history of allergy to azithromycin"
(declare-const patient_has_finding_of_allergy_to_macrolide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of allergy to any macrolide at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of allergy to any macrolide in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of allergy to any macrolide.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy to any macrolide in their medical history."} ;; "the patient has a history of allergy to any macrolide"
(declare-const patient_has_finding_of_allergy_to_sulfonamide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of allergy to sulfonamides at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of allergy to sulfonamides in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of allergy to sulfonamides.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy to sulfonamides in their medical history."} ;; "the patient has a history of allergy to sulfonamides"
(declare-const patient_has_finding_of_allergy_to_pyrimethamine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of allergy to pyrimethamine at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of allergy to pyrimethamine in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of allergy to pyrimethamine.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy to pyrimethamine in their medical history."} ;; "the patient has a history of allergy to pyrimethamine"
(declare-const patient_has_finding_of_allergy_to_chloroquine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of allergy to chloroquine at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of allergy to chloroquine in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of allergy to chloroquine.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy to chloroquine in their medical history."} ;; "the patient has a history of allergy to chloroquine"
(declare-const patient_has_finding_of_hypersensitivity_to_azithromycin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of hypersensitivity to azithromycin at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of hypersensitivity to azithromycin in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of hypersensitivity to azithromycin.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of hypersensitivity to azithromycin in their medical history."} ;; "the patient has a history of hypersensitivity to azithromycin"
(declare-const patient_has_finding_of_hypersensitivity_to_macrolide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of hypersensitivity to any macrolide at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of hypersensitivity to any macrolide in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of hypersensitivity to any macrolide.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of hypersensitivity to any macrolide in their medical history."} ;; "the patient has a history of hypersensitivity to any macrolide"
(declare-const patient_has_finding_of_hypersensitivity_to_sulfonamide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of hypersensitivity to sulfonamides at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of hypersensitivity to sulfonamides in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of hypersensitivity to sulfonamides.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of hypersensitivity to sulfonamides in their medical history."} ;; "the patient has a history of hypersensitivity to sulfonamides"
(declare-const patient_has_finding_of_hypersensitivity_to_pyrimethamine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of hypersensitivity to pyrimethamine at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of hypersensitivity to pyrimethamine in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of hypersensitivity to pyrimethamine.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of hypersensitivity to pyrimethamine in their medical history."} ;; "the patient has a history of hypersensitivity to pyrimethamine"
(declare-const patient_has_finding_of_hypersensitivity_to_chloroquine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of hypersensitivity to chloroquine at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of hypersensitivity to chloroquine in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of hypersensitivity to chloroquine.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of hypersensitivity to chloroquine in their medical history."} ;; "the patient has a history of hypersensitivity to chloroquine"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_allergy_to_azithromycin_inthehistory)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to azithromycin."

(assert
(! (not patient_has_finding_of_allergy_to_macrolide_inthehistory)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to any macrolide."

(assert
(! (not patient_has_finding_of_allergy_to_sulfonamide_inthehistory)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to sulfonamides."

(assert
(! (not patient_has_finding_of_allergy_to_pyrimethamine_inthehistory)
    :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to pyrimethamine."

(assert
(! (not patient_has_finding_of_allergy_to_chloroquine_inthehistory)
    :named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to chloroquine."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_azithromycin_inthehistory)
    :named REQ2_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to azithromycin."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_macrolide_inthehistory)
    :named REQ2_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to any macrolide."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_sulfonamide_inthehistory)
    :named REQ2_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to sulfonamides."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_pyrimethamine_inthehistory)
    :named REQ2_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to pyrimethamine."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_chloroquine_inthehistory)
    :named REQ2_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to chloroquine."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cellular_component_of_blood_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of cellular component of blood (blood dyscrasias) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of cellular component of blood (blood dyscrasias) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of cellular component of blood (blood dyscrasias).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of disorder of cellular component of blood (blood dyscrasias) in their history."} ;; "blood dyscrasias"
(declare-const patient_has_diagnosis_of_megaloblastic_anemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with megaloblastic anemia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with megaloblastic anemia at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with megaloblastic anemia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of megaloblastic anemia in their history."} ;; "megaloblastic anemia"
(declare-const patient_has_diagnosis_of_agranulocytosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with agranulocytosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with agranulocytosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with agranulocytosis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of agranulocytosis in their history."} ;; "agranulocytosis"
(declare-const patient_has_diagnosis_of_aplastic_anemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with aplastic anemia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with aplastic anemia at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with aplastic anemia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of aplastic anemia in their history."} ;; "aplastic anemia"
(declare-const patient_has_diagnosis_of_thrombocytopenic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with thrombocytopenic disorder (thrombocytopenia) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with thrombocytopenic disorder (thrombocytopenia) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with thrombocytopenic disorder (thrombocytopenia).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of thrombocytopenic disorder (thrombocytopenia) in their history."} ;; "thrombocytopenia"
(declare-const patient_has_diagnosis_of_leukopenia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with leukopenia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with leukopenia at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with leukopenia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of leukopenia in their history."} ;; "leukopenia"
(declare-const patient_has_diagnosis_of_neutropenic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with neutropenic disorder (neutropenia) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with neutropenic disorder (neutropenia) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with neutropenic disorder (neutropenia).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of neutropenic disorder (neutropenia) in their history."} ;; "neutropenia"
(declare-const patient_has_diagnosis_of_hemolytic_anemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hemolytic anemia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hemolytic anemia at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hemolytic anemia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of hemolytic anemia in their history."} ;; "hemolytic anemia"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_megaloblastic_anemia_inthehistory
           patient_has_diagnosis_of_agranulocytosis_inthehistory
           patient_has_diagnosis_of_aplastic_anemia_inthehistory
           patient_has_diagnosis_of_thrombocytopenic_disorder_inthehistory
           patient_has_diagnosis_of_leukopenia_inthehistory
           patient_has_diagnosis_of_neutropenic_disorder_inthehistory
           patient_has_diagnosis_of_hemolytic_anemia_inthehistory)
        patient_has_diagnosis_of_disorder_of_cellular_component_of_blood_inthehistory)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (megaloblastic anemia, agranulocytosis, aplastic anemia, thrombocytopenia, leukopenia, neutropenia, hemolytic anemia)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_cellular_component_of_blood_inthehistory)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of blood dyscrasias with non-exhaustive examples (megaloblastic anemia, agranulocytosis, aplastic anemia, thrombocytopenia, leukopenia, neutropenia, hemolytic anemia)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_epilepsy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with epilepsy at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with epilepsy at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with epilepsy.","meaning":"Boolean indicating whether the patient has ever been diagnosed with epilepsy in their medical history."} ;; "the patient has a history of epilepsy"
(declare-const patient_has_diagnosis_of_psoriasis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with psoriasis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with psoriasis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with psoriasis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with psoriasis in their medical history."} ;; "the patient has a history of psoriasis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_diagnosis_of_epilepsy_inthehistory)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of epilepsy."

(assert
  (! (not patient_has_diagnosis_of_psoriasis_inthehistory)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psoriasis."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_antimalarial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any antimalarial drug at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any antimalarial drug at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any antimalarial drug.","meaning":"Boolean indicating whether the patient has ever been exposed to any antimalarial drug."} ;; "antimalarial drug"

(declare-const patient_is_exposed_to_antimalarial_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any antimalarial drug occurred within 2 weeks prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient's exposure to any antimalarial drug did not occur within 2 weeks prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the exposure to any antimalarial drug occurred within 2 weeks prior to enrollment into the study."} ;; "within 2 weeks prior to enrollment into the study"

(declare-const patient_is_exposed_to_chloroquine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to chloroquine at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to chloroquine at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to chloroquine.","meaning":"Boolean indicating whether the patient has ever been exposed to chloroquine."} ;; "chloroquine"

(declare-const patient_is_exposed_to_chloroquine_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to chloroquine occurred within 2 weeks prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient's exposure to chloroquine did not occur within 2 weeks prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the exposure to chloroquine occurred within 2 weeks prior to enrollment into the study."} ;; "chloroquine within 2 weeks prior to enrollment"

(declare-const patient_is_exposed_to_quinine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to quinine at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to quinine at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to quinine.","meaning":"Boolean indicating whether the patient has ever been exposed to quinine."} ;; "quinine"

(declare-const patient_is_exposed_to_quinine_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to quinine occurred within 2 weeks prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient's exposure to quinine did not occur within 2 weeks prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the exposure to quinine occurred within 2 weeks prior to enrollment into the study."} ;; "quinine within 2 weeks prior to enrollment"

(declare-const patient_is_exposed_to_mefloquine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to mefloquine at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to mefloquine at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to mefloquine.","meaning":"Boolean indicating whether the patient has ever been exposed to mefloquine."} ;; "mefloquine"

(declare-const patient_is_exposed_to_mefloquine_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to mefloquine occurred within 2 weeks prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient's exposure to mefloquine did not occur within 2 weeks prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the exposure to mefloquine occurred within 2 weeks prior to enrollment into the study."} ;; "mefloquine within 2 weeks prior to enrollment"

(declare-const patient_has_taken_atovaquone_and_proguanil_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken any atovaquone and proguanil containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken any atovaquone and proguanil containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken any atovaquone and proguanil containing product.","meaning":"Boolean indicating whether the patient has ever taken any atovaquone and proguanil containing product."} ;; "atovaquone-proguanil"

(declare-const patient_has_taken_atovaquone_and_proguanil_containing_product_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's taking of atovaquone and proguanil containing product occurred within 2 weeks prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient's taking of atovaquone and proguanil containing product did not occur within 2 weeks prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the taking occurred within 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the taking of atovaquone and proguanil containing product occurred within 2 weeks prior to enrollment into the study."} ;; "atovaquone-proguanil within 2 weeks prior to enrollment"

(declare-const patient_has_taken_pyrimethamine_and_sulfadoxine_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken any pyrimethamine and sulfadoxine containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken any pyrimethamine and sulfadoxine containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken any pyrimethamine and sulfadoxine containing product.","meaning":"Boolean indicating whether the patient has ever taken any pyrimethamine and sulfadoxine containing product."} ;; "sulfadoxine-pyrimethamine"

(declare-const patient_has_taken_pyrimethamine_and_sulfadoxine_containing_product_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's taking of pyrimethamine and sulfadoxine containing product occurred within 2 weeks prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient's taking of pyrimethamine and sulfadoxine containing product did not occur within 2 weeks prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the taking occurred within 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the taking of pyrimethamine and sulfadoxine containing product occurred within 2 weeks prior to enrollment into the study."} ;; "sulfadoxine-pyrimethamine within 2 weeks prior to enrollment"

(declare-const patient_is_exposed_to_artemisinin_compounds_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any artemisinin compounds at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any artemisinin compounds at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any artemisinin compounds.","meaning":"Boolean indicating whether the patient has ever been exposed to any artemisinin compounds."} ;; "artemisinin compounds"

(declare-const patient_is_exposed_to_artemisinin_compounds_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to artemisinin compounds occurred within 2 weeks prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient's exposure to artemisinin compounds did not occur within 2 weeks prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the exposure to artemisinin compounds occurred within 2 weeks prior to enrollment into the study."} ;; "artemisinin compounds within 2 weeks prior to enrollment"

(declare-const patient_is_exposed_to_antibacterial_with_known_antimalarial_activity_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any antibacterial drug with known antimalarial activity at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any antibacterial drug with known antimalarial activity at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any antibacterial drug with known antimalarial activity.","meaning":"Boolean indicating whether the patient has ever been exposed to any antibacterial drug with known antimalarial activity."} ;; "antibacterial drug with known antimalarial activity"

(declare-const patient_is_exposed_to_antibacterial_with_known_antimalarial_activity_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any antibacterial drug with known antimalarial activity occurred within 2 weeks prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient's exposure to any antibacterial drug with known antimalarial activity did not occur within 2 weeks prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the exposure to any antibacterial drug with known antimalarial activity occurred within 2 weeks prior to enrollment into the study."} ;; "antibacterial drug with known antimalarial activity within 2 weeks prior to enrollment"

(declare-const patient_is_exposed_to_macrolide_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any macrolide antibacterial at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any macrolide antibacterial at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any macrolide antibacterial.","meaning":"Boolean indicating whether the patient has ever been exposed to any macrolide antibacterial."} ;; "macrolides"

(declare-const patient_is_exposed_to_macrolide_antibacterial_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to macrolide antibacterial occurred within 2 weeks prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient's exposure to macrolide antibacterial did not occur within 2 weeks prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the exposure to macrolide antibacterial occurred within 2 weeks prior to enrollment into the study."} ;; "macrolides within 2 weeks prior to enrollment"

(declare-const patient_is_exposed_to_doxycycline_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to doxycycline at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to doxycycline at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to doxycycline.","meaning":"Boolean indicating whether the patient has ever been exposed to doxycycline."} ;; "doxycycline"

(declare-const patient_is_exposed_to_doxycycline_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to doxycycline occurred within 2 weeks prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient's exposure to doxycycline did not occur within 2 weeks prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the exposure to doxycycline occurred within 2 weeks prior to enrollment into the study."} ;; "doxycycline within 2 weeks prior to enrollment"

(declare-const patient_is_exposed_to_clindamycin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to clindamycin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to clindamycin at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to clindamycin.","meaning":"Boolean indicating whether the patient has ever been exposed to clindamycin."} ;; "clindamycin"

(declare-const patient_is_exposed_to_clindamycin_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to clindamycin occurred within 2 weeks prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient's exposure to clindamycin did not occur within 2 weeks prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the exposure to clindamycin occurred within 2 weeks prior to enrollment into the study."} ;; "clindamycin within 2 weeks prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Exhaustive subcategories for antimalarial drugs
(assert
(! (= patient_is_exposed_to_antimalarial_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
     (or patient_is_exposed_to_chloroquine_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
         patient_is_exposed_to_quinine_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
         patient_is_exposed_to_mefloquine_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
         patient_has_taken_atovaquone_and_proguanil_containing_product_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
         patient_has_taken_pyrimethamine_and_sulfadoxine_containing_product_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
         patient_is_exposed_to_artemisinin_compounds_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment))
:named REQ5_AUXILIARY0)) ;; "antimalarial drug with exhaustive subcategories (chloroquine, quinine, mefloquine, atovaquone-proguanil, sulfadoxine-pyrimethamine, artemisinin compounds) within 2 weeks prior to enrollment"

;; Qualifier variables imply corresponding stem variables (antimalarial)
(assert
(! (=> patient_is_exposed_to_antimalarial_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
      patient_is_exposed_to_antimalarial_inthehistory)
:named REQ5_AUXILIARY1)) ;; "within 2 weeks prior to enrollment into the study" for antimalarial

(assert
(! (=> patient_is_exposed_to_chloroquine_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
      patient_is_exposed_to_chloroquine_inthehistory)
:named REQ5_AUXILIARY2)) ;; "chloroquine within 2 weeks prior to enrollment"

(assert
(! (=> patient_is_exposed_to_quinine_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
      patient_is_exposed_to_quinine_inthehistory)
:named REQ5_AUXILIARY3)) ;; "quinine within 2 weeks prior to enrollment"

(assert
(! (=> patient_is_exposed_to_mefloquine_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
      patient_is_exposed_to_mefloquine_inthehistory)
:named REQ5_AUXILIARY4)) ;; "mefloquine within 2 weeks prior to enrollment"

(assert
(! (=> patient_has_taken_atovaquone_and_proguanil_containing_product_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
      patient_has_taken_atovaquone_and_proguanil_containing_product_inthehistory)
:named REQ5_AUXILIARY5)) ;; "atovaquone-proguanil within 2 weeks prior to enrollment"

(assert
(! (=> patient_has_taken_pyrimethamine_and_sulfadoxine_containing_product_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
      patient_has_taken_pyrimethamine_and_sulfadoxine_containing_product_inthehistory)
:named REQ5_AUXILIARY6)) ;; "sulfadoxine-pyrimethamine within 2 weeks prior to enrollment"

(assert
(! (=> patient_is_exposed_to_artemisinin_compounds_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
      patient_is_exposed_to_artemisinin_compounds_inthehistory)
:named REQ5_AUXILIARY7)) ;; "artemisinin compounds within 2 weeks prior to enrollment"

;; Exhaustive subcategories for antibacterial drugs with known antimalarial activity
(assert
(! (= patient_is_exposed_to_antibacterial_with_known_antimalarial_activity_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
     (or patient_is_exposed_to_macrolide_antibacterial_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
         patient_is_exposed_to_doxycycline_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
         patient_is_exposed_to_clindamycin_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment))
:named REQ5_AUXILIARY8)) ;; "antibacterial drug with known antimalarial activity with exhaustive subcategories (macrolides, doxycycline, clindamycin) within 2 weeks prior to enrollment"

;; Qualifier variables imply corresponding stem variables (antibacterial)
(assert
(! (=> patient_is_exposed_to_antibacterial_with_known_antimalarial_activity_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
      patient_is_exposed_to_antibacterial_with_known_antimalarial_activity_inthehistory)
:named REQ5_AUXILIARY9)) ;; "within 2 weeks prior to enrollment into the study" for antibacterial

(assert
(! (=> patient_is_exposed_to_macrolide_antibacterial_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
      patient_is_exposed_to_macrolide_antibacterial_inthehistory)
:named REQ5_AUXILIARY10)) ;; "macrolides within 2 weeks prior to enrollment"

(assert
(! (=> patient_is_exposed_to_doxycycline_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
      patient_is_exposed_to_doxycycline_inthehistory)
:named REQ5_AUXILIARY11)) ;; "doxycycline within 2 weeks prior to enrollment"

(assert
(! (=> patient_is_exposed_to_clindamycin_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
      patient_is_exposed_to_clindamycin_inthehistory)
:named REQ5_AUXILIARY12)) ;; "clindamycin within 2 weeks prior to enrollment"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have a history of treatment with any antimalarial drug (as per exhaustive subcategories) within 2 weeks prior to enrollment
(assert
(! (not patient_is_exposed_to_antimalarial_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of treatment with any antimalarial drug with exhaustive subcategories (chloroquine, quinine, mefloquine, atovaquone-proguanil, sulfadoxine-pyrimethamine, artemisinin compounds) within 2 weeks prior to enrollment into the study."

;; Exclusion: patient must NOT have a history of treatment with any antibacterial drug with known antimalarial activity (as per exhaustive subcategories) within 2 weeks prior to enrollment
(assert
(! (not patient_is_exposed_to_antibacterial_with_known_antimalarial_activity_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of treatment with any antibacterial drug with known antimalarial activity with exhaustive subcategories (macrolides, doxycycline, clindamycin) within 2 weeks prior to enrollment into the study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_cardiovascular_system_alteration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiovascular abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have a cardiovascular abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiovascular abnormality.","meaning":"Boolean indicating whether the patient currently has a cardiovascular abnormality."} ;; "cardiovascular abnormality"
(declare-const patient_has_finding_of_cardiovascular_system_alteration_now@@is_known Bool) ;; {"when_to_set_to_true":"Set to true if the cardiovascular abnormality is known (confirmed).","when_to_set_to_false":"Set to false if the cardiovascular abnormality is not known (e.g., only suspected or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiovascular abnormality is known.","meaning":"Boolean indicating whether the cardiovascular abnormality is known."} ;; "known cardiovascular abnormality"
(declare-const patient_has_finding_of_cardiovascular_system_alteration_now@@is_suspected Bool) ;; {"when_to_set_to_true":"Set to true if the cardiovascular abnormality is suspected (not confirmed).","when_to_set_to_false":"Set to false if the cardiovascular abnormality is not suspected (e.g., known or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiovascular abnormality is suspected.","meaning":"Boolean indicating whether the cardiovascular abnormality is suspected."} ;; "suspected cardiovascular abnormality"
(declare-const patient_has_finding_of_cardiovascular_system_alteration_now@@in_opinion_of_investigator_increases_risk_of_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the Investigator, the cardiovascular abnormality would place the patient at increased risk to participate in the study.","when_to_set_to_false":"Set to false if, in the opinion of the Investigator, the cardiovascular abnormality would not place the patient at increased risk to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Investigator believes the abnormality increases study risk.","meaning":"Boolean indicating whether, in the opinion of the Investigator, the cardiovascular abnormality increases risk of study participation."} ;; "in the opinion of the Investigator would place the patient at increased risk to participate in the study"
(declare-const patient_has_finding_of_hepatic_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hepatic abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have a hepatic abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hepatic abnormality.","meaning":"Boolean indicating whether the patient currently has a hepatic abnormality."} ;; "hepatic abnormality"
(declare-const patient_has_finding_of_hepatic_abnormality_now@@is_known Bool) ;; {"when_to_set_to_true":"Set to true if the hepatic abnormality is known (confirmed).","when_to_set_to_false":"Set to false if the hepatic abnormality is not known (e.g., only suspected or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic abnormality is known.","meaning":"Boolean indicating whether the hepatic abnormality is known."} ;; "known hepatic abnormality"
(declare-const patient_has_finding_of_hepatic_abnormality_now@@is_suspected Bool) ;; {"when_to_set_to_true":"Set to true if the hepatic abnormality is suspected (not confirmed).","when_to_set_to_false":"Set to false if the hepatic abnormality is not suspected (e.g., known or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic abnormality is suspected.","meaning":"Boolean indicating whether the hepatic abnormality is suspected."} ;; "suspected hepatic abnormality"
(declare-const patient_has_finding_of_hepatic_abnormality_now@@in_opinion_of_investigator_increases_risk_of_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the Investigator, the hepatic abnormality would place the patient at increased risk to participate in the study.","when_to_set_to_false":"Set to false if, in the opinion of the Investigator, the hepatic abnormality would not place the patient at increased risk to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Investigator believes the hepatic abnormality increases study risk.","meaning":"Boolean indicating whether, in the opinion of the Investigator, the hepatic abnormality increases risk of study participation."} ;; "in the opinion of the Investigator would place the patient at increased risk to participate in the study"
(declare-const patient_has_finding_of_renal_alteration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a renal abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have a renal abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a renal abnormality.","meaning":"Boolean indicating whether the patient currently has a renal abnormality."} ;; "renal abnormality"
(declare-const patient_has_finding_of_renal_alteration_now@@is_known Bool) ;; {"when_to_set_to_true":"Set to true if the renal abnormality is known (confirmed).","when_to_set_to_false":"Set to false if the renal abnormality is not known (e.g., only suspected or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal abnormality is known.","meaning":"Boolean indicating whether the renal abnormality is known."} ;; "known renal abnormality"
(declare-const patient_has_finding_of_renal_alteration_now@@is_suspected Bool) ;; {"when_to_set_to_true":"Set to true if the renal abnormality is suspected (not confirmed).","when_to_set_to_false":"Set to false if the renal abnormality is not suspected (e.g., known or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal abnormality is suspected.","meaning":"Boolean indicating whether the renal abnormality is suspected."} ;; "suspected renal abnormality"
(declare-const patient_has_finding_of_renal_alteration_now@@in_opinion_of_investigator_increases_risk_of_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the Investigator, the renal abnormality would place the patient at increased risk to participate in the study.","when_to_set_to_false":"Set to false if, in the opinion of the Investigator, the renal abnormality would not place the patient at increased risk to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Investigator believes the abnormality increases study risk.","meaning":"Boolean indicating whether, in the opinion of the Investigator, the renal abnormality increases risk of study participation."} ;; "in the opinion of the Investigator would place the patient at increased risk to participate in the study"
(declare-const patient_creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a current serum creatinine measurement in mg/dL is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine in mg/dL."} ;; "serum creatinine"
(declare-const patient_alanine_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a current ALT measurement in U/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ALT in U/L."} ;; "alanine aminotransferase"
(declare-const patient_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a current AST measurement in U/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current AST in U/L."} ;; "aspartate aminotransferase"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_cardiovascular_system_alteration_now@@is_known
      patient_has_finding_of_cardiovascular_system_alteration_now)
:named REQ6_AUXILIARY0)) ;; "known cardiovascular abnormality"

(assert
(! (=> patient_has_finding_of_cardiovascular_system_alteration_now@@is_suspected
      patient_has_finding_of_cardiovascular_system_alteration_now)
:named REQ6_AUXILIARY1)) ;; "suspected cardiovascular abnormality"

(assert
(! (=> patient_has_finding_of_hepatic_abnormality_now@@is_known
      patient_has_finding_of_hepatic_abnormality_now)
:named REQ6_AUXILIARY2)) ;; "known hepatic abnormality"

(assert
(! (=> patient_has_finding_of_hepatic_abnormality_now@@is_suspected
      patient_has_finding_of_hepatic_abnormality_now)
:named REQ6_AUXILIARY3)) ;; "suspected hepatic abnormality"

(assert
(! (=> patient_has_finding_of_renal_alteration_now@@is_known
      patient_has_finding_of_renal_alteration_now)
:named REQ6_AUXILIARY4)) ;; "known renal abnormality"

(assert
(! (=> patient_has_finding_of_renal_alteration_now@@is_suspected
      patient_has_finding_of_renal_alteration_now)
:named REQ6_AUXILIARY5)) ;; "suspected renal abnormality"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_has_finding_of_cardiovascular_system_alteration_now@@is_known
             patient_has_finding_of_cardiovascular_system_alteration_now@@in_opinion_of_investigator_increases_risk_of_study_participation))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "known cardiovascular abnormality that in the opinion of the Investigator would place the patient at increased risk to participate in the study"

(assert
(! (not (and patient_has_finding_of_cardiovascular_system_alteration_now@@is_suspected
             patient_has_finding_of_cardiovascular_system_alteration_now@@in_opinion_of_investigator_increases_risk_of_study_participation))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "suspected cardiovascular abnormality that in the opinion of the Investigator would place the patient at increased risk to participate in the study"

(assert
(! (not (and patient_has_finding_of_hepatic_abnormality_now@@is_known
             patient_has_finding_of_hepatic_abnormality_now@@in_opinion_of_investigator_increases_risk_of_study_participation))
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "known hepatic abnormality that in the opinion of the Investigator would place the patient at increased risk to participate in the study"

(assert
(! (not (and patient_has_finding_of_hepatic_abnormality_now@@is_suspected
             patient_has_finding_of_hepatic_abnormality_now@@in_opinion_of_investigator_increases_risk_of_study_participation))
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "suspected hepatic abnormality that in the opinion of the Investigator would place the patient at increased risk to participate in the study"

(assert
(! (not (and patient_has_finding_of_renal_alteration_now@@is_known
             patient_has_finding_of_renal_alteration_now@@in_opinion_of_investigator_increases_risk_of_study_participation))
:named REQ6_COMPONENT4_OTHER_REQUIREMENTS)) ;; "known renal abnormality that in the opinion of the Investigator would place the patient at increased risk to participate in the study"

(assert
(! (not (and patient_has_finding_of_renal_alteration_now@@is_suspected
             patient_has_finding_of_renal_alteration_now@@in_opinion_of_investigator_increases_risk_of_study_participation))
:named REQ6_COMPONENT5_OTHER_REQUIREMENTS)) ;; "suspected renal abnormality that in the opinion of the Investigator would place the patient at increased risk to participate in the study"

(assert
(! (not (> patient_creatinine_value_recorded_now_withunit_mg_per_dl (* 2.0 1.0))) ;; ULN is assumed to be 1.0 for encoding; replace with actual ULN if available
:named REQ6_COMPONENT6_OTHER_REQUIREMENTS)) ;; "serum creatinine > 2.0 times the upper limit of normal"

(assert
(! (not (> patient_alanine_aminotransferase_value_recorded_now_withunit_u_per_l (* 3.0 1.0))) ;; ULN is assumed to be 1.0 for encoding; replace with actual ULN if available
:named REQ6_COMPONENT7_OTHER_REQUIREMENTS)) ;; "alanine aminotransferase > 3 times the upper limit of normal"

(assert
(! (not (> patient_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l (* 3.0 1.0))) ;; ULN is assumed to be 1.0 for encoding; replace with actual ULN if available
:named REQ6_COMPONENT8_OTHER_REQUIREMENTS)) ;; "aspartate aminotransferase > 3 times the upper limit of normal"

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_can_undergo_product_manufactured_as_oral_dose_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to swallow a product manufactured as an oral dose form (oral medication).","when_to_set_to_false":"Set to false if the patient is currently unable to swallow a product manufactured as an oral dose form (oral medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to swallow a product manufactured as an oral dose form (oral medication).","meaning":"Boolean indicating whether the patient is currently able to swallow a product manufactured as an oral dose form (oral medication)."} ;; "oral medication"
(declare-const patient_can_undergo_product_manufactured_as_oral_dose_form_now@@tablet_form Bool) ;; {"when_to_set_to_true":"Set to true if the product manufactured as an oral dose form (oral medication) is in tablet form.","when_to_set_to_false":"Set to false if the product manufactured as an oral dose form (oral medication) is not in tablet form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product manufactured as an oral dose form (oral medication) is in tablet form.","meaning":"Boolean indicating whether the product manufactured as an oral dose form (oral medication) is in tablet form."} ;; "tablet form"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_can_undergo_product_manufactured_as_oral_dose_form_now@@tablet_form)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to swallow oral medication in tablet form."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the 30 days prior to enrollment into the study.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the 30 days prior to enrollment into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the 30 days prior to enrollment into the study.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past 30 days."} ;; "drugs"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the past 30 days is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the past 30 days is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient was exposed within the past 30 days is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed within the past 30 days is investigational."} ;; "investigational drugs within 30 days prior to enrollment"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with other investigational drugs within 30 days prior to enrollment into the study."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of alcohol abuse."} ;; "alcohol abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis relating to drug misuse behavior (any other drug abuse).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis relating to drug misuse behavior (any other drug abuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis relating to drug misuse behavior (any other drug abuse).","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis relating to drug misuse behavior (any other drug abuse)."} ;; "drug abuse"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alcohol abuse."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other drug abuse."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_requires_use_of_medication_that_might_interfere_with_evaluation_of_study_drug_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires use of any medication during the study that might interfere with the evaluation of the study drug.","when_to_set_to_false":"Set to false if the patient does not require use of any medication during the study that might interfere with the evaluation of the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires use of any medication during the study that might interfere with the evaluation of the study drug.","meaning":"Boolean indicating whether the patient requires use of any medication during the study that might interfere with the evaluation of the study drug."} ;; "requires use of medication during the study that might interfere with the evaluation of the study drug"

(declare-const patient_is_taking_nelfinavir_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a nelfinavir-containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a nelfinavir-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a nelfinavir-containing product.","meaning":"Boolean indicating whether the patient is currently taking a nelfinavir-containing product."} ;; "nelfinavir"

(declare-const patient_is_taking_digoxin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a digoxin-containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a digoxin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a digoxin-containing product.","meaning":"Boolean indicating whether the patient is currently taking a digoxin-containing product."} ;; "digoxin"

(declare-const patient_is_taking_ergot_alkaloid_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an ergot alkaloid-containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking an ergot alkaloid-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an ergot alkaloid-containing product.","meaning":"Boolean indicating whether the patient is currently taking an ergot alkaloid-containing product."} ;; "ergot alkaloids"

(declare-const patient_is_taking_terfenadine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a terfenadine-containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a terfenadine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a terfenadine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a terfenadine-containing product."} ;; "terfenadine"

(declare-const patient_is_taking_cyclosporine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a cyclosporine-containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a cyclosporine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a cyclosporine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a cyclosporine-containing product."} ;; "cyclosporine"

(declare-const patient_is_taking_hexobarbital_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a hexobarbital-containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a hexobarbital-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a hexobarbital-containing product.","meaning":"Boolean indicating whether the patient is currently taking a hexobarbital-containing product."} ;; "hexobarbital"

(declare-const patient_is_taking_phenytoin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a phenytoin-containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a phenytoin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a phenytoin-containing product.","meaning":"Boolean indicating whether the patient is currently taking a phenytoin-containing product."} ;; "phenytoin"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_taking_nelfinavir_containing_product_now
           patient_is_taking_digoxin_containing_product_now
           patient_is_taking_ergot_alkaloid_containing_product_now
           patient_is_taking_terfenadine_containing_product_now
           patient_is_taking_cyclosporine_containing_product_now
           patient_is_taking_hexobarbital_containing_product_now
           patient_is_taking_phenytoin_containing_product_now)
       patient_requires_use_of_medication_that_might_interfere_with_evaluation_of_study_drug_during_study)
:named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples ((nelfinavir) OR (digoxin) OR (ergot alkaloids) OR (terfenadine) OR (cyclosporine) OR (hexobarbital) OR (phenytoin))."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_requires_use_of_medication_that_might_interfere_with_evaluation_of_study_drug_during_study)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires use of medication during the study that might interfere with the evaluation of the study drug with non-exhaustive examples ((nelfinavir) OR (digoxin) OR (ergot alkaloids) OR (terfenadine) OR (cyclosporine) OR (hexobarbital) OR (phenytoin))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have any systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any systemic disease.","meaning":"Boolean indicating whether the patient currently has any systemic disease."} ;; "specific systemic diseases"

(declare-const patient_has_finding_of_systemic_disease_now@@would_interfere_with_evaluation_of_therapeutic_response_or_safety_of_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any systemic disease and that disease would interfere with the evaluation of the therapeutic response or safety of the study drug.","when_to_set_to_false":"Set to false if the patient currently has any systemic disease but it would not interfere with the evaluation of the therapeutic response or safety of the study drug, or if the patient does not have any systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the systemic disease would interfere with the evaluation of the therapeutic response or safety of the study drug.","meaning":"Boolean indicating whether the patient's current systemic disease would interfere with evaluation of therapeutic response or safety of the study drug."} ;; "systemic disease would interfere with evaluation of therapeutic response or safety of study drug"

(declare-const patient_has_finding_of_medical_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have any medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any medical condition.","meaning":"Boolean indicating whether the patient currently has any medical condition."} ;; "other medical conditions"

(declare-const patient_has_finding_of_medical_condition_now@@would_interfere_with_evaluation_of_therapeutic_response_or_safety_of_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any medical condition and that condition would interfere with the evaluation of the therapeutic response or safety of the study drug.","when_to_set_to_false":"Set to false if the patient currently has any medical condition but it would not interfere with the evaluation of the therapeutic response or safety of the study drug, or if the patient does not have any medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medical condition would interfere with the evaluation of the therapeutic response or safety of the study drug.","meaning":"Boolean indicating whether the patient's current medical condition would interfere with evaluation of therapeutic response or safety of the study drug."} ;; "medical condition would interfere with evaluation of therapeutic response or safety of study drug"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable for systemic disease
(assert
(! (=> patient_has_finding_of_systemic_disease_now@@would_interfere_with_evaluation_of_therapeutic_response_or_safety_of_study_drug
      patient_has_finding_of_systemic_disease_now)
:named REQ11_AUXILIARY0)) ;; "systemic disease would interfere with evaluation of therapeutic response or safety of study drug"

;; Qualifier variable implies corresponding stem variable for medical condition
(assert
(! (=> patient_has_finding_of_medical_condition_now@@would_interfere_with_evaluation_of_therapeutic_response_or_safety_of_study_drug
      patient_has_finding_of_medical_condition_now)
:named REQ11_AUXILIARY1)) ;; "medical condition would interfere with evaluation of therapeutic response or safety of study drug"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT have specific systemic diseases
(assert
(! (not patient_has_finding_of_systemic_disease_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has specific systemic diseases."

;; Exclusion: patient must NOT have other medical conditions that would interfere with evaluation of therapeutic response or safety of study drug
(assert
(! (not patient_has_finding_of_medical_condition_now@@would_interfere_with_evaluation_of_therapeutic_response_or_safety_of_study_drug)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other medical conditions that would interfere with the evaluation of the therapeutic response OR safety of the study drug."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_unable_to_comprehend_study_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to comprehend the study protocol.","when_to_set_to_false":"Set to false if the patient is currently able to comprehend the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to comprehend the study protocol.","meaning":"Boolean indicating whether the patient is currently unable to comprehend the study protocol."} ;; "the patient is unable to comprehend the study protocol"
(declare-const patient_is_unwilling_to_follow_study_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to follow the study protocol.","when_to_set_to_false":"Set to false if the patient is currently willing to follow the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to follow the study protocol.","meaning":"Boolean indicating whether the patient is currently unwilling to follow the study protocol."} ;; "the patient is unwilling to follow the study protocol"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (or patient_is_unable_to_comprehend_study_protocol_now
            patient_is_unwilling_to_follow_study_protocol_now))
   :named REQ12_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is unable to comprehend the study protocol) OR (the patient is unwilling to follow the study protocol)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_intends_to_leave_vicinity_of_trial_site_within_next_42_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient intends to leave the vicinity of the trial site within the next forty-two days.","when_to_set_to_false":"Set to false if the patient does not intend to leave the vicinity of the trial site within the next forty-two days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient intends to leave the vicinity of the trial site within the next forty-two days.","meaning":"Boolean indicating whether the patient intends to leave the vicinity of the trial site within the next forty-two days."} ;; "intends to leave the vicinity of the trial site within the next forty-two days"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_intends_to_leave_vicinity_of_trial_site_within_next_42_days)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient intends to leave the vicinity of the trial site within the next forty-two days."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_prior_participation_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in this study.","when_to_set_to_false":"Set to false if the patient has not previously participated in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in this study.","meaning":"Boolean indicating whether the patient has previously participated in this study."} ;; "The patient is excluded if the patient has prior participation in this study."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_prior_participation_in_this_study)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior participation in this study."
