;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_influenza_vaccination_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received an influenza vaccination at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received an influenza vaccination at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received an influenza vaccination.","meaning":"Boolean indicating whether the patient has ever received an influenza vaccination at any time in the past."} ;; "influenza vaccine"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_influenza_vaccination_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received an influenza vaccine."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_eggs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity condition in their history was caused by eggs.","when_to_set_to_false":"Set to false if the patient's hypersensitivity condition in their history was not caused by eggs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypersensitivity condition in their history was caused by eggs.","meaning":"Boolean indicating whether the patient's hypersensitivity condition in their history was caused by eggs."} ;; "the patient has a history of hypersensitivity to eggs"
(declare-const patient_has_finding_of_allergy_to_egg_protein_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to egg protein at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had an allergy to egg protein in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to egg protein in their history.","meaning":"Boolean indicating whether the patient has ever had an allergy to egg protein in their history."} ;; "the patient has a history of hypersensitivity to egg protein"
(declare-const patient_has_finding_of_similar_pharmacological_effects_to_study_medication_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had similar pharmacological effects to the study medication at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had similar pharmacological effects to the study medication in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had similar pharmacological effects to the study medication in their history.","meaning":"Boolean indicating whether the patient has ever had similar pharmacological effects to the study medication in their history."} ;; "the patient has a history of similar pharmacological effects to study medication"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_eggs)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to eggs."

(assert
(! (not patient_has_finding_of_allergy_to_egg_protein_inthehistory)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to egg protein."

(assert
(! (not patient_has_finding_of_similar_pharmacological_effects_to_study_medication_inthehistory)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of similar pharmacological effects to study medication."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_guillain_barr_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had Guillain-Barre syndrome at any point in their history (personal history).","when_to_set_to_false":"Set to false if the patient has never had Guillain-Barre syndrome in their history (personal history).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had Guillain-Barre syndrome in their history.","meaning":"Boolean indicating whether the patient has ever had Guillain-Barre syndrome in their personal history."} ;; "the patient has a personal history of Guillain-Barre syndrome"
(declare-const patient_has_finding_of_guillain_barr_syndrome_inthehistory@@family_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a family history of Guillain-Barre syndrome (i.e., a first-degree relative has had Guillain-Barre syndrome).","when_to_set_to_false":"Set to false if the patient does not have a family history of Guillain-Barre syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a family history of Guillain-Barre syndrome.","meaning":"Boolean indicating whether the patient has a family history of Guillain-Barre syndrome."} ;; "the patient has a family history of Guillain-Barre syndrome"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_guillain_barr_syndrome_inthehistory@@family_history
       patient_has_finding_of_guillain_barr_syndrome_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "family history of Guillain-Barre syndrome" implies "history of Guillain-Barre syndrome"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_finding_of_guillain_barr_syndrome_inthehistory
            patient_has_finding_of_guillain_barr_syndrome_inthehistory@@family_history))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a personal history of Guillain-Barre syndrome) OR (the patient has a family history of Guillain-Barre syndrome)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disorder_characterized_by_fever_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a disorder characterized by fever within the past 1 week.","when_to_set_to_false":"Set to false if the patient has not had a disorder characterized by fever within the past 1 week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a disorder characterized by fever within the past 1 week.","meaning":"Boolean indicating whether the patient has had a disorder characterized by fever within the past 1 week."} ;; "febrile illness within one week prior to vaccination"

(declare-const patient_has_finding_of_disorder_characterized_by_fever_inthepast1weeks@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the disorder characterized by fever within the past 1 week was acute.","when_to_set_to_false":"Set to false if the disorder characterized by fever within the past 1 week was not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder characterized by fever within the past 1 week was acute.","meaning":"Boolean indicating whether the disorder characterized by fever within the past 1 week was acute."} ;; "acute febrile illness within one week prior to vaccination"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_characterized_by_fever_inthepast1weeks@@acute
       patient_has_finding_of_disorder_characterized_by_fever_inthepast1weeks)
   :named REQ3_AUXILIARY0)) ;; "acute febrile illness within one week prior to vaccination"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disorder_characterized_by_fever_inthepast1weeks@@acute)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had an acute febrile illness within one week prior to vaccination."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of illness.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of illness.","meaning":"Boolean indicating whether the patient currently has illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@located_in_upper_respiratory_tract Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is located in the upper respiratory tract.","when_to_set_to_false":"Set to false if the patient's current illness is not located in the upper respiratory tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is located in the upper respiratory tract.","meaning":"Boolean indicating whether the patient's current illness is located in the upper respiratory tract."} ;; "current upper respiratory illness"
(declare-const patient_has_finding_of_common_cold_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of common cold.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of common cold.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of common cold.","meaning":"Boolean indicating whether the patient currently has common cold."} ;; "common cold"
(declare-const patient_has_finding_of_nasal_congestion_inthepast72hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had the clinical finding of nasal congestion within the past seventy-two hours.","when_to_set_to_false":"Set to false if the patient has not had the clinical finding of nasal congestion within the past seventy-two hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had the clinical finding of nasal congestion within the past seventy-two hours.","meaning":"Boolean indicating whether the patient has had nasal congestion within the past seventy-two hours."} ;; "nasal congestion within seventy-two hours"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_illness_now@@located_in_upper_respiratory_tract
       patient_has_finding_of_illness_now)
   :named REQ4_AUXILIARY0)) ;; "current upper respiratory illness"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_illness_now@@located_in_upper_respiratory_tract)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current upper respiratory illness."
(assert
(! (not patient_has_finding_of_common_cold_now)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has the common cold."
(assert
(! (not patient_has_finding_of_nasal_congestion_inthepast72hours)
   :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nasal congestion within seventy-two hours."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_influenza_like_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of influenza-like illness.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of influenza-like illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has influenza-like illness.","meaning":"Boolean indicating whether the patient currently has influenza-like illness."} ;; "influenza-like illness"

(declare-const patient_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's current body temperature in degrees Celsius if available.","when_to_set_to_null":"Set to null if the patient's current body temperature in degrees Celsius is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current body temperature in degrees Celsius."} ;; "temperature greater than or equal to thirty-eight degrees Celsius"

(declare-const patient_has_finding_of_headache_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has headache.","when_to_set_to_false":"Set to false if the patient currently does not have headache.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has headache.","meaning":"Boolean indicating whether the patient currently has headache."} ;; "headache"

(declare-const patient_has_finding_of_myalgia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has muscle aches and pains (myalgia).","when_to_set_to_false":"Set to false if the patient currently does not have muscle aches and pains (myalgia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has muscle aches and pains (myalgia).","meaning":"Boolean indicating whether the patient currently has muscle aches and pains (myalgia)."} ;; "muscle aches and pains (myalgia)"

(declare-const patient_has_finding_of_arthralgia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has joint aches and pains (arthralgia).","when_to_set_to_false":"Set to false if the patient currently does not have joint aches and pains (arthralgia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has joint aches and pains (arthralgia).","meaning":"Boolean indicating whether the patient currently has joint aches and pains (arthralgia)."} ;; "joint aches and pains (arthralgia)"

(declare-const patient_has_finding_of_sore_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sore throat.","when_to_set_to_false":"Set to false if the patient currently does not have sore throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sore throat.","meaning":"Boolean indicating whether the patient currently has sore throat."} ;; "sore throat"

(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "cough"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples: headache, myalgia, arthralgia, sore throat, cough are examples of symptoms for influenza-like illness
;; Definition: influenza-like illness = fever (temperature >= 38°C) AND at least two of the listed symptoms
(assert
(! (= patient_has_finding_of_influenza_like_illness_now
(and (>= patient_temperature_value_recorded_now_withunit_celsius 38)
(>=
  (+ (ite patient_has_finding_of_headache_now 1 0)
     (ite patient_has_finding_of_myalgia_now 1 0)
     (ite patient_has_finding_of_arthralgia_now 1 0)
     (ite patient_has_finding_of_sore_throat_now 1 0)
     (ite patient_has_finding_of_cough_now 1 0))
  2)))
:named REQ5_AUXILIARY0)) ;; "influenza-like illness as defined by (the presence of fever (temperature >= 38°C) AND at least two of the following symptoms: headache, myalgia, arthralgia, sore throat, cough)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_influenza_like_illness_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has influenza-like illness as defined by (the presence of fever (temperature >= 38°C) AND at least two of the following symptoms: headache, myalgia, arthralgia, sore throat, cough)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to a drug or medicament at any time during the three months prior to consent.","when_to_set_to_false":"Set to false if the patient was not exposed to a drug or medicament at any time during the three months prior to consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to a drug or medicament during the three months prior to consent.","meaning":"Boolean indicating whether the patient was exposed to a drug or medicament at any time during the three months prior to consent."} ;; "the patient has received treatment with an investigational drug within three months before consent"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast3months@@investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the three months prior to consent is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the three months prior to consent is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed within the three months prior to consent is investigational."} ;; "the patient has received treatment with an investigational drug within three months before consent"
(declare-const patient_has_received_treatment_with_investigational_device_in_the_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with an investigational device at any time during the three months prior to consent.","when_to_set_to_false":"Set to false if the patient has not received treatment with an investigational device at any time during the three months prior to consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with an investigational device at any time during the three months prior to consent.","meaning":"Boolean indicating whether the patient has received treatment with an investigational device at any time during the three months prior to consent."} ;; "the patient has received treatment with an investigational device within three months before consent"
(declare-const patient_has_participated_in_clinical_study_in_the_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a clinical study at any time during the three months prior to consent.","when_to_set_to_false":"Set to false if the patient has not participated in a clinical study at any time during the three months prior to consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a clinical study at any time during the three months prior to consent.","meaning":"Boolean indicating whether the patient has participated in a clinical study at any time during the three months prior to consent."} ;; "the patient has participated in a clinical study within three months before consent"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast3months@@investigational
      patient_is_exposed_to_drug_or_medicament_inthepast3months)
    :named REQ6_AUXILIARY0)) ;; "the drug or medicament to which the patient was exposed within the three months prior to consent is investigational"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_inthepast3months@@investigational
            patient_has_received_treatment_with_investigational_device_in_the_past_3_months
            patient_has_participated_in_clinical_study_in_the_past_3_months))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received treatment with an investigational drug within three months before consent) OR (the patient has received treatment with an investigational device within three months before consent) OR (the patient has participated in a clinical study within three months before consent)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} ;; "the patient has immunodeficiency"

(declare-const patient_has_finding_of_patient_immunosuppressed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently immunosuppressed.","when_to_set_to_false":"Set to false if the patient is currently not immunosuppressed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently immunosuppressed.","meaning":"Boolean indicating whether the patient is currently immunosuppressed."} ;; "the patient is immunosuppressed"

(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease.","meaning":"Boolean indicating whether the patient currently has a chronic disease."} ;; "chronic illness"

(declare-const patient_has_finding_of_chronic_disease_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic disease is significant.","when_to_set_to_false":"Set to false if the patient's chronic disease is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic disease is significant.","meaning":"Boolean indicating whether the patient's chronic disease is significant."} ;; "significant chronic illness"

(declare-const patient_has_finding_of_chronic_disease_now@@not_suitable_for_inactivated_influenza_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic disease is not suitable for inactivated influenza vaccination.","when_to_set_to_false":"Set to false if the patient's chronic disease is suitable for inactivated influenza vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic disease is suitable for inactivated influenza vaccination.","meaning":"Boolean indicating whether the patient's chronic disease is not suitable for inactivated influenza vaccination."} ;; "chronic illness not suitable for inactivated influenza vaccination"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable for chronic disease
(assert
(! (=> patient_has_finding_of_chronic_disease_now@@significant
       patient_has_finding_of_chronic_disease_now)
   :named REQ7_AUXILIARY0)) ;; "significant chronic illness"

(assert
(! (=> patient_has_finding_of_chronic_disease_now@@not_suitable_for_inactivated_influenza_vaccination
       patient_has_finding_of_chronic_disease_now)
   :named REQ7_AUXILIARY1)) ;; "chronic illness not suitable for inactivated influenza vaccination"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: immunodeficiency
(assert
(! (not patient_has_finding_of_immunodeficiency_disorder_now)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immunodeficiency."

;; Exclusion: immunosuppressed
(assert
(! (not patient_has_finding_of_patient_immunosuppressed_now)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is immunosuppressed."

;; Exclusion: significant chronic illness not suitable for inactivated influenza vaccination
(assert
(! (not (and patient_has_finding_of_chronic_disease_now@@significant
             patient_has_finding_of_chronic_disease_now@@not_suitable_for_inactivated_influenza_vaccination))
   :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant chronic illness not suitable for inactivated influenza vaccination."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_wheezing_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had wheezing documented in their medical history.","when_to_set_to_false":"Set to false if the patient has never had wheezing documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had wheezing.","meaning":"Boolean indicating whether the patient has ever had wheezing documented in their medical history."} ;; "the patient has a history of wheezing"

(declare-const patient_is_exposed_to_bronchodilator_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a bronchodilator within the past three months.","when_to_set_to_false":"Set to false if the patient has not been exposed to a bronchodilator within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a bronchodilator within the past three months.","meaning":"Boolean indicating whether the patient has been exposed to a bronchodilator within the past three months."} ;; "the patient has a history of bronchodilator use within three months prior to study vaccine"

(declare-const patient_is_exposed_to_bronchodilator_inthepast3months@@temporalcontext_within3months_prior_to_study_vaccine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bronchodilator exposure occurred within the three months prior to the study vaccine.","when_to_set_to_false":"Set to false if the patient's bronchodilator exposure did not occur within the three months prior to the study vaccine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bronchodilator exposure occurred within the three months prior to the study vaccine.","meaning":"Boolean indicating whether the patient's bronchodilator exposure occurred within the three months prior to the study vaccine."} ;; "the patient has a history of bronchodilator use within three months prior to study vaccine"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_bronchodilator_inthepast3months@@temporalcontext_within3months_prior_to_study_vaccine
       patient_is_exposed_to_bronchodilator_inthepast3months)
   :named REQ8_AUXILIARY0)) ;; "the patient has a history of bronchodilator use within three months prior to study vaccine"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_finding_of_wheezing_inthehistory
            patient_is_exposed_to_bronchodilator_inthepast3months@@temporalcontext_within3months_prior_to_study_vaccine))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of wheezing) OR (the patient has a history of bronchodilator use within three months prior to study vaccine)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_received_live_virus_vaccine_within_1_month_prior_to_study_vaccine Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received a live virus vaccine within one month prior to receiving the study vaccine.","when_to_set_to_false":"Set to false if the patient has not received a live virus vaccine within one month prior to receiving the study vaccine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received a live virus vaccine within one month prior to receiving the study vaccine.","meaning":"Boolean indicating whether the patient has received a live virus vaccine within one month prior to receiving the study vaccine."} ;; "the patient has received a live virus vaccine within one month prior to study vaccine"

(declare-const patient_is_expected_to_receive_live_virus_vaccine_before_last_blood_sampling_for_immunogenicity_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to receive a live virus vaccine before the last blood sampling for immunogenicity evaluation.","when_to_set_to_false":"Set to false if the patient is not expected to receive a live virus vaccine before the last blood sampling for immunogenicity evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to receive a live virus vaccine before the last blood sampling for immunogenicity evaluation.","meaning":"Boolean indicating whether the patient is expected to receive a live virus vaccine before the last blood sampling for immunogenicity evaluation."} ;; "the patient is expected to receive a live virus vaccine before the last blood sampling for immunogenicity evaluation"

(declare-const patient_will_undergo_collection_of_blood_specimen_for_laboratory_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to undergo a collection of blood specimen for laboratory analysis at any time in the future.","when_to_set_to_false":"Set to false if the patient is not expected to undergo a collection of blood specimen for laboratory analysis at any time in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to undergo a collection of blood specimen for laboratory analysis in the future.","meaning":"Boolean indicating whether the patient is expected to undergo a collection of blood specimen for laboratory analysis at any time in the future."} ;; "blood sampling"

(declare-const patient_will_undergo_collection_of_blood_specimen_for_laboratory_inthefuture@@is_last_sampling_for_immunogenicity_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the future collection of blood specimen for laboratory analysis is the last such sampling for immunogenicity evaluation.","when_to_set_to_false":"Set to false if the future collection of blood specimen for laboratory analysis is not the last such sampling for immunogenicity evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the future collection of blood specimen for laboratory analysis is the last for immunogenicity evaluation.","meaning":"Boolean indicating whether the future collection of blood specimen for laboratory analysis is the last for immunogenicity evaluation."} ;; "last blood sampling for immunogenicity evaluation"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_will_undergo_collection_of_blood_specimen_for_laboratory_inthefuture@@is_last_sampling_for_immunogenicity_evaluation
      patient_will_undergo_collection_of_blood_specimen_for_laboratory_inthefuture)
:named REQ9_AUXILIARY0)) ;; "last blood sampling for immunogenicity evaluation"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have received a live virus vaccine within 1 month prior to study vaccine
(assert
(! (not patient_has_received_live_virus_vaccine_within_1_month_prior_to_study_vaccine)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has received a live virus vaccine within one month prior to study vaccine"

;; Exclusion: patient must NOT be expected to receive a live virus vaccine before the last blood sampling for immunogenicity evaluation
(assert
(! (not patient_is_expected_to_receive_live_virus_vaccine_before_last_blood_sampling_for_immunogenicity_evaluation)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is expected to receive a live virus vaccine before the last blood sampling for immunogenicity evaluation"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_received_inactivated_vaccine_within_2_weeks_prior_to_study_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any inactivated vaccine within two weeks prior to study vaccination.","when_to_set_to_false":"Set to false if the patient has not received any inactivated vaccine within two weeks prior to study vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any inactivated vaccine within two weeks prior to study vaccination.","meaning":"Boolean indicating whether the patient has received any inactivated vaccine within two weeks prior to study vaccination."} ;; "the patient has received any inactivated vaccine within two weeks prior to study vaccination"

(declare-const patient_is_expected_to_receive_inactivated_vaccine_before_last_blood_sampling_for_immunogenicity_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to receive any inactivated vaccine before the last blood sampling for immunogenicity evaluation.","when_to_set_to_false":"Set to false if the patient is not expected to receive any inactivated vaccine before the last blood sampling for immunogenicity evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to receive any inactivated vaccine before the last blood sampling for immunogenicity evaluation.","meaning":"Boolean indicating whether the patient is expected to receive any inactivated vaccine before the last blood sampling for immunogenicity evaluation."} ;; "the patient is expected to receive any inactivated vaccine before the last blood sampling for immunogenicity evaluation"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (or patient_has_received_inactivated_vaccine_within_2_weeks_prior_to_study_vaccination
            patient_is_expected_to_receive_inactivated_vaccine_before_last_blood_sampling_for_immunogenicity_evaluation))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received any inactivated vaccine within two weeks prior to study vaccination) OR (the patient is expected to receive any inactivated vaccine before the last blood sampling for immunogenicity evaluation)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_received_blood_product_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any blood product in the past three months.","when_to_set_to_false":"Set to false if the patient has not received any blood product in the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any blood product in the past three months.","meaning":"Boolean indicating whether the patient has received any blood product in the past three months."} ;; "has received any blood products ... in the prior three months"
(declare-const patient_has_taken_immunoglobulin_containing_product_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any immunoglobulin-containing product in the past three months.","when_to_set_to_false":"Set to false if the patient has not taken any immunoglobulin-containing product in the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any immunoglobulin-containing product in the past three months.","meaning":"Boolean indicating whether the patient has taken any immunoglobulin-containing product in the past three months."} ;; "immunoglobulin ... in the prior three months"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive example: immunoglobulin is a subclass of blood product
(assert
(! (=> patient_has_taken_immunoglobulin_containing_product_inthepast3months
      patient_has_received_blood_product_inthepast3months)
   :named REQ11_AUXILIARY0)) ;; "with non-exhaustive examples (immunoglobulin) in the prior three months."

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_received_blood_product_inthepast3months)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received any blood products ... in the prior three months."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_pre_existing_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pre-existing (underlying) condition.","when_to_set_to_false":"Set to false if the patient currently does not have a pre-existing (underlying) condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pre-existing (underlying) condition.","meaning":"Boolean indicating whether the patient currently has a pre-existing (underlying) condition."} ;; "underlying condition"

(declare-const patient_has_finding_of_pre_existing_condition_now@@may_interfere_with_vaccine_evaluation_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pre-existing (underlying) condition and, in the investigator's opinion, this condition may interfere with evaluation of the vaccine.","when_to_set_to_false":"Set to false if the patient currently has a pre-existing (underlying) condition and, in the investigator's opinion, this condition does not interfere with evaluation of the vaccine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator believes the condition may interfere with vaccine evaluation.","meaning":"Boolean indicating whether the patient currently has a pre-existing (underlying) condition and, in the investigator's opinion, it may interfere with evaluation of the vaccine."} ;; "in the investigator's opinion, may interfere with evaluation of the vaccine"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_pre_existing_condition_now@@may_interfere_with_vaccine_evaluation_investigator_opinion
      patient_has_finding_of_pre_existing_condition_now)
:named REQ12_AUXILIARY0)) ;; "in the investigator's opinion, may interfere with evaluation of the vaccine"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_pre_existing_condition_now@@may_interfere_with_vaccine_evaluation_investigator_opinion)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an underlying condition that, in the investigator's opinion, may interfere with evaluation of the vaccine."
