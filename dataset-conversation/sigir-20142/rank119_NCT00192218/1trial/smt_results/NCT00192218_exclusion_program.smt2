;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_anaphylaxis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had anaphylaxis (anaphylactic response) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had anaphylaxis (anaphylactic response) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had anaphylaxis (anaphylactic response).","meaning":"Boolean indicating whether the patient has ever had anaphylaxis (anaphylactic response) in their history."} ;; "anaphylactic response"

(declare-const patient_has_finding_of_anaphylaxis_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical anaphylaxis episode was severe.","when_to_set_to_false":"Set to false if the patient's historical anaphylaxis episode was not severe.","when_to_set_to_null":"Set to null if severity of the historical anaphylaxis episode is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's historical anaphylaxis episode was severe."} ;; "severe hypersensitivity (anaphylactic response)"

(declare-const patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_egg_products Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical anaphylaxis episode was caused by egg products.","when_to_set_to_false":"Set to false if the patient's historical anaphylaxis episode was not caused by egg products.","when_to_set_to_null":"Set to null if the cause of the historical anaphylaxis episode is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's historical anaphylaxis episode was caused by egg products."} ;; "to egg products"

(declare-const patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_previous_flumist Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical anaphylaxis episode was caused by previous FluMist.","when_to_set_to_false":"Set to false if the patient's historical anaphylaxis episode was not caused by previous FluMist.","when_to_set_to_null":"Set to null if the cause of the historical anaphylaxis episode is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's historical anaphylaxis episode was caused by previous FluMist."} ;; "to previous FluMist"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_anaphylaxis_inthehistory@@severe
       patient_has_finding_of_anaphylaxis_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "severe hypersensitivity (anaphylactic response)"

(assert
(! (=> patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_egg_products
       patient_has_finding_of_anaphylaxis_inthehistory)
   :named REQ0_AUXILIARY1)) ;; "to egg products"

(assert
(! (=> patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_previous_flumist
       patient_has_finding_of_anaphylaxis_inthehistory)
   :named REQ0_AUXILIARY2)) ;; "to previous FluMist"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion 1: history of severe hypersensitivity (anaphylactic response) to egg products
(assert
(! (not (and patient_has_finding_of_anaphylaxis_inthehistory@@severe
             patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_egg_products))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe hypersensitivity (anaphylactic response) to egg products."

;; Exclusion 2: history of severe hypersensitivity (anaphylactic response) to previous FluMist
(assert
(! (not (and patient_has_finding_of_anaphylaxis_inthehistory@@severe
             patient_has_finding_of_anaphylaxis_inthehistory@@caused_by_previous_flumist))
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe hypersensitivity (anaphylactic response) to previous FluMist."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "asthma"
(declare-const patient_has_diagnosis_of_chronic_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic lung disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic lung disease."} ;; "chronic pulmonary disease"
(declare-const patient_has_diagnosis_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of kidney disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of kidney disease."} ;; "kidney disease"
(declare-const patient_has_diagnosis_of_metabolic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of metabolic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of metabolic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of metabolic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of metabolic disease."} ;; "metabolic disease"
(declare-const patient_has_diagnosis_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart disease."} ;; "heart disease"
(declare-const patient_has_diagnosis_of_hemoglobinopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hemoglobinopathy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hemoglobinopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hemoglobinopathy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hemoglobinopathy."} ;; "hemoglobinopathy"

(declare-const patient_has_medical_condition_requiring_annual_inactivated_influenza_vaccine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical condition for which annual receipt of inactivated influenza vaccine is recommended.","when_to_set_to_false":"Set to false if the patient currently does not have a medical condition for which annual receipt of inactivated influenza vaccine is recommended.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medical condition for which annual receipt of inactivated influenza vaccine is recommended.","meaning":"Boolean indicating whether the patient currently has a medical condition for which annual receipt of inactivated influenza vaccine is recommended."} ;; "medical condition for which annual receipt of inactivated influenza vaccine is recommended"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_asthma_now
           patient_has_diagnosis_of_chronic_lung_disease_now
           patient_has_diagnosis_of_kidney_disease_now
           patient_has_diagnosis_of_metabolic_disease_now
           patient_has_diagnosis_of_heart_disease_now
           patient_has_diagnosis_of_hemoglobinopathy_now)
        patient_has_medical_condition_requiring_annual_inactivated_influenza_vaccine_now)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((asthma) OR (chronic pulmonary disease) OR (kidney disease) OR (metabolic disease) OR (heart disease) OR (hemoglobinopathy))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_medical_condition_requiring_annual_inactivated_influenza_vaccine_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical condition for which annual receipt of inactivated influenza vaccine is recommended (such as asthma, chronic pulmonary disease, kidney disease, metabolic disease, heart disease, or hemoglobinopathy)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_immunosuppression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of immunosuppression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of immunosuppression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immunosuppression.","meaning":"Boolean indicating whether the patient currently has immunosuppression."} ;; "immunosuppression"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_immunosuppression_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immunosuppression."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_household_member_with_severe_immunosuppression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one household member with severe immunosuppression.","when_to_set_to_false":"Set to false if the patient currently does not have any household member with severe immunosuppression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a household member with severe immunosuppression.","meaning":"Boolean indicating whether the patient currently has a household member with severe immunosuppression."} ;; "The patient is excluded if the patient has a household member with severe immunosuppression."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_household_member_with_severe_immunosuppression_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a household member with severe immunosuppression."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as confirmed by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently confirmed not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_guillain_barr_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of Guillain-Barre syndrome at any time in their medical history (i.e., past history).","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of Guillain-Barre syndrome at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of Guillain-Barre syndrome.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of Guillain-Barre syndrome at any point in their medical history."} ;; "The patient is excluded if the patient has a past history of Guillain-Barre syndrome."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_guillain_barr_syndrome_inthehistory)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of Guillain-Barre syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_undergone_aspirin_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone aspirin therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone aspirin therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone aspirin therapy.","meaning":"Boolean indicating whether the patient has ever undergone aspirin therapy in the past."} ;; "aspirin therapy"
(declare-const patient_has_undergone_aspirin_therapy_inthehistory@@temporalcontext_within_1_month_before_flumist_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone aspirin therapy within one month prior to FluMist administration.","when_to_set_to_false":"Set to false if the patient has not undergone aspirin therapy within one month prior to FluMist administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone aspirin therapy within one month prior to FluMist administration.","meaning":"Boolean indicating whether the patient has undergone aspirin therapy within one month prior to FluMist administration."} ;; "aspirin therapy within one month prior to FluMist administration"
(declare-const patient_is_taking_aspirin_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is anticipated to take aspirin-containing products at any time in the future.","when_to_set_to_false":"Set to false if the patient is not anticipated to take aspirin-containing products at any time in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is anticipated to take aspirin-containing products in the future.","meaning":"Boolean indicating whether the patient is anticipated to take aspirin-containing products in the future."} ;; "aspirin-containing products"
(declare-const patient_is_taking_aspirin_containing_product_inthefuture@@temporalcontext_within_1_month_after_flumist_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is anticipated to take aspirin-containing products within one month after FluMist administration.","when_to_set_to_false":"Set to false if the patient is not anticipated to take aspirin-containing products within one month after FluMist administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is anticipated to take aspirin-containing products within one month after FluMist administration.","meaning":"Boolean indicating whether the patient is anticipated to take aspirin-containing products within one month after FluMist administration."} ;; "aspirin-containing products for one month after FluMist administration"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable for aspirin therapy
(assert
(! (=> patient_has_undergone_aspirin_therapy_inthehistory@@temporalcontext_within_1_month_before_flumist_administration
      patient_has_undergone_aspirin_therapy_inthehistory)
    :named REQ6_AUXILIARY0)) ;; "aspirin therapy within one month prior to FluMist administration"

;; Qualifier variable implies corresponding stem variable for anticipated aspirin-containing product use
(assert
(! (=> patient_is_taking_aspirin_containing_product_inthefuture@@temporalcontext_within_1_month_after_flumist_administration
      patient_is_taking_aspirin_containing_product_inthefuture)
    :named REQ6_AUXILIARY1)) ;; "aspirin-containing products for one month after FluMist administration"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have received aspirin therapy within one month prior to FluMist administration
(assert
(! (not patient_has_undergone_aspirin_therapy_inthehistory@@temporalcontext_within_1_month_before_flumist_administration)
    :named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received aspirin therapy within one month prior to FluMist administration."

;; Exclusion: patient must NOT be anticipated to use aspirin-containing products for one month after FluMist administration
(assert
(! (not patient_is_taking_aspirin_containing_product_inthefuture@@temporalcontext_within_1_month_after_flumist_administration)
    :named REQ6_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is anticipated to use aspirin-containing products for one month after FluMist administration."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_received_inactivated_vaccine_within_2_weeks_prior_to_flumist Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any inactivated vaccine within the two weeks prior to receipt of FluMist.","when_to_set_to_false":"Set to false if the patient has not received any inactivated vaccine within the two weeks prior to receipt of FluMist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any inactivated vaccine within the two weeks prior to receipt of FluMist.","meaning":"Boolean indicating whether the patient has received any inactivated vaccine within two weeks prior to receipt of FluMist."} ;; "the patient has received any inactivated vaccine within two weeks prior to receipt of FluMist"
(declare-const patient_has_received_live_vaccine_within_4_weeks_prior_to_flumist Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any live vaccine within the four weeks prior to receipt of FluMist.","when_to_set_to_false":"Set to false if the patient has not received any live vaccine within the four weeks prior to receipt of FluMist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any live vaccine within the four weeks prior to receipt of FluMist.","meaning":"Boolean indicating whether the patient has received any live vaccine within four weeks prior to receipt of FluMist."} ;; "the patient has received any live vaccine within four weeks prior to receipt of FluMist"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_received_inactivated_vaccine_within_2_weeks_prior_to_flumist
            patient_has_received_live_vaccine_within_4_weeks_prior_to_flumist))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received any inactivated vaccine within two weeks prior to receipt of FluMist) OR (the patient has received any live vaccine within four weeks prior to receipt of FluMist)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past forty-eight hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past forty-eight hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past forty-eight hours.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past forty-eight hours."} ;; "medication in the past forty-eight hours"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast48hours@@anti_influenza_specificity Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to within the past forty-eight hours is specifically an anti-influenza medication.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to within the past forty-eight hours is not an anti-influenza medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament the patient was exposed to within the past forty-eight hours is an anti-influenza medication.","meaning":"Boolean indicating whether the drug or medicament exposure within the past forty-eight hours is specifically anti-influenza medication."} ;; "anti-influenza medication in the past forty-eight hours"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast48hours@@anti_influenza_specificity
      patient_is_exposed_to_drug_or_medicament_inthepast48hours)
:named REQ8_AUXILIARY0)) ;; "anti-influenza medication in the past forty-eight hours""

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast48hours@@anti_influenza_specificity)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received anti-influenza medication in the past forty-eight hours."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_fever_inthepast72hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had fever at any time within the past seventy-two hours.","when_to_set_to_false":"Set to false if the patient has not had fever at any time within the past seventy-two hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had fever within the past seventy-two hours.","meaning":"Boolean indicating whether the patient has had fever within the past seventy-two hours."} ;; "fever in the past seventy-two hours"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_fever_inthepast72hours)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had fever in the past seventy-two hours."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_nasal_congestion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of nasal congestion.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of nasal congestion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of nasal congestion.","meaning":"Boolean indicating whether the patient currently has nasal congestion."} ;; "nasal congestion"

(declare-const patient_has_finding_of_nasal_congestion_now@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current nasal congestion is of moderate severity.","when_to_set_to_false":"Set to false if the patient's current nasal congestion is not of moderate severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current nasal congestion is of moderate severity.","meaning":"Boolean indicating whether the patient's current nasal congestion is of moderate severity."} ;; "moderate nasal congestion"

(declare-const patient_has_finding_of_nasal_congestion_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current nasal congestion is of severe severity.","when_to_set_to_false":"Set to false if the patient's current nasal congestion is not of severe severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current nasal congestion is of severe severity.","meaning":"Boolean indicating whether the patient's current nasal congestion is of severe severity."} ;; "severe nasal congestion"

(declare-const patient_has_finding_of_nasal_congestion_now@@inability_to_breathe_through_nose Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nasal congestion and the congestion is defined as inability to breathe through the nose.","when_to_set_to_false":"Set to false if the patient currently has nasal congestion but it is not defined as inability to breathe through the nose, or if the patient does not have nasal congestion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nasal congestion defined as inability to breathe through the nose.","meaning":"Boolean indicating whether the patient currently has nasal congestion defined as inability to breathe through the nose."} ;; "severe nasal congestion (defined as inability to breathe through the nose)"

(declare-const patient_has_finding_of_upper_respiratory_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of upper respiratory infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of upper respiratory infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of upper respiratory infection.","meaning":"Boolean indicating whether the patient currently has upper respiratory infection."} ;; "upper respiratory infection"

(declare-const patient_has_finding_of_upper_respiratory_infection_now@@phase_acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current upper respiratory infection is in the acute phase.","when_to_set_to_false":"Set to false if the patient's current upper respiratory infection is not in the acute phase.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current upper respiratory infection is in the acute phase.","meaning":"Boolean indicating whether the patient's current upper respiratory infection is in the acute phase."} ;; "acute phase upper respiratory infection"

(declare-const patient_has_finding_of_upper_respiratory_infection_now@@symptoms_present Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of upper respiratory infection.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of upper respiratory infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of upper respiratory infection.","meaning":"Boolean indicating whether the patient currently has symptoms of upper respiratory infection."} ;; "upper respiratory infection symptoms"

(declare-const patient_has_finding_of_upper_respiratory_infection_now@@symptoms_present@@until_nasal_congestion_improved Bool) ;; {"when_to_set_to_true":"Set to true if the patient's upper respiratory infection symptoms are present and persist until the nasal congestion has improved.","when_to_set_to_false":"Set to false if the patient's upper respiratory infection symptoms do not persist until the nasal congestion has improved, or if symptoms are not present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's upper respiratory infection symptoms persist until the nasal congestion has improved.","meaning":"Boolean indicating whether the patient's upper respiratory infection symptoms persist until the nasal congestion has improved."} ;; "acute phase upper respiratory infection symptoms until the congestion has improved"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_nasal_congestion_now@@severity_moderate
       patient_has_finding_of_nasal_congestion_now)
   :named REQ10_AUXILIARY0)) ;; "moderate nasal congestion"

(assert
(! (=> patient_has_finding_of_nasal_congestion_now@@severity_severe
       patient_has_finding_of_nasal_congestion_now)
   :named REQ10_AUXILIARY1)) ;; "severe nasal congestion"

(assert
(! (=> patient_has_finding_of_nasal_congestion_now@@inability_to_breathe_through_nose
       patient_has_finding_of_nasal_congestion_now)
   :named REQ10_AUXILIARY2)) ;; "severe nasal congestion (defined as inability to breathe through the nose)"

(assert
(! (=> patient_has_finding_of_upper_respiratory_infection_now@@phase_acute
       patient_has_finding_of_upper_respiratory_infection_now)
   :named REQ10_AUXILIARY3)) ;; "acute phase upper respiratory infection"

(assert
(! (=> patient_has_finding_of_upper_respiratory_infection_now@@symptoms_present
       patient_has_finding_of_upper_respiratory_infection_now)
   :named REQ10_AUXILIARY4)) ;; "upper respiratory infection symptoms"

(assert
(! (=> patient_has_finding_of_upper_respiratory_infection_now@@symptoms_present@@until_nasal_congestion_improved
       (and patient_has_finding_of_upper_respiratory_infection_now@@symptoms_present
            patient_has_finding_of_upper_respiratory_infection_now@@phase_acute))
   :named REQ10_AUXILIARY5)) ;; "acute phase upper respiratory infection symptoms until the congestion has improved"

;; Severe nasal congestion defined as inability to breathe through the nose
(assert
(! (= patient_has_finding_of_nasal_congestion_now@@severity_severe
      patient_has_finding_of_nasal_congestion_now@@inability_to_breathe_through_nose)
   :named REQ10_AUXILIARY6)) ;; "severe nasal congestion (defined as inability to breathe through the nose)"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: moderate nasal congestion
(assert
(! (not patient_has_finding_of_nasal_congestion_now@@severity_moderate)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate nasal congestion."

;; Exclusion: severe nasal congestion (defined as inability to breathe through the nose)
(assert
(! (not patient_has_finding_of_nasal_congestion_now@@severity_severe)
   :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe nasal congestion (defined as inability to breathe through the nose)."

;; Exclusion: acute phase upper respiratory infection symptoms until the congestion has improved
(assert
(! (not patient_has_finding_of_upper_respiratory_infection_now@@symptoms_present@@until_nasal_congestion_improved)
   :named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute phase upper respiratory infection symptoms until the congestion has improved."
