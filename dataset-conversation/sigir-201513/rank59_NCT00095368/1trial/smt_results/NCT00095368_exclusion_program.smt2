;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_swallowing_painful_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of painful swallowing (odynophagia).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of painful swallowing (odynophagia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of painful swallowing (odynophagia).","meaning":"Boolean indicating whether the patient currently has painful swallowing (odynophagia)."} ;; "odynophagia"
(declare-const patient_has_finding_of_swallowing_painful_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current painful swallowing (odynophagia) is chronic.","when_to_set_to_false":"Set to false if the patient's current painful swallowing (odynophagia) is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current painful swallowing (odynophagia) is chronic.","meaning":"Boolean indicating whether the patient's current painful swallowing (odynophagia) is chronic."} ;; "chronic odynophagia"
(declare-const patient_has_finding_of_swallowing_painful_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current painful swallowing (odynophagia) is recurrent.","when_to_set_to_false":"Set to false if the patient's current painful swallowing (odynophagia) is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current painful swallowing (odynophagia) is recurrent.","meaning":"Boolean indicating whether the patient's current painful swallowing (odynophagia) is recurrent."} ;; "recurrent odynophagia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_swallowing_painful_now@@chronic
      patient_has_finding_of_swallowing_painful_now)
:named REQ0_AUXILIARY0)) ;; "chronic odynophagia"

(assert
(! (=> patient_has_finding_of_swallowing_painful_now@@recurrent
      patient_has_finding_of_swallowing_painful_now)
:named REQ0_AUXILIARY1)) ;; "recurrent odynophagia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_swallowing_painful_now@@chronic)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic odynophagia."

(assert
(! (not patient_has_finding_of_swallowing_painful_now@@recurrent)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recurrent odynophagia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_needs_hospitalization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs hospitalization.","when_to_set_to_false":"Set to false if the patient currently does not need hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs hospitalization.","meaning":"Boolean indicating whether the patient currently needs hospitalization."} ;; "the patient needs hospitalization"
(declare-const patient_needs_intravenous_antimicrobial_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs intravenous antimicrobial therapy.","when_to_set_to_false":"Set to false if the patient currently does not need intravenous antimicrobial therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs intravenous antimicrobial therapy.","meaning":"Boolean indicating whether the patient currently needs intravenous antimicrobial therapy."} ;; "the patient needs intravenous antimicrobial therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_needs_hospitalization_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs hospitalization."

(assert
  (! (not patient_needs_intravenous_antimicrobial_therapy_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs intravenous antimicrobial therapy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pharyngitis.","meaning":"Boolean indicating whether the patient currently has pharyngitis."} ;; "pharyngitis"

(declare-const patient_has_finding_of_pharyngitis_now@@known_due_to_pathogen_resistant_to_beta_lactam_antimicrobials Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pharyngitis is known to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_false":"Set to false if the patient's current pharyngitis is known not to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pharyngitis is known to be due to a pathogen resistant to beta-lactam antimicrobials.","meaning":"Boolean indicating whether the patient's current pharyngitis is known to be due to a pathogen resistant to beta-lactam antimicrobials."} ;; "pharyngitis known to be due to a pathogen resistant to beta-lactam antimicrobials"

(declare-const patient_has_finding_of_pharyngitis_now@@suspected_due_to_pathogen_resistant_to_beta_lactam_antimicrobials Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pharyngitis is suspected to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_false":"Set to false if the patient's current pharyngitis is suspected not to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pharyngitis is suspected to be due to a pathogen resistant to beta-lactam antimicrobials.","meaning":"Boolean indicating whether the patient's current pharyngitis is suspected to be due to a pathogen resistant to beta-lactam antimicrobials."} ;; "pharyngitis suspected to be due to a pathogen resistant to beta-lactam antimicrobials"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_pharyngitis_now@@known_due_to_pathogen_resistant_to_beta_lactam_antimicrobials
       patient_has_finding_of_pharyngitis_now)
   :named REQ2_AUXILIARY0)) ;; "pharyngitis known to be due to a pathogen resistant to beta-lactam antimicrobials"

(assert
(! (=> patient_has_finding_of_pharyngitis_now@@suspected_due_to_pathogen_resistant_to_beta_lactam_antimicrobials
       patient_has_finding_of_pharyngitis_now)
   :named REQ2_AUXILIARY1)) ;; "pharyngitis suspected to be due to a pathogen resistant to beta-lactam antimicrobials"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_pharyngitis_now@@known_due_to_pathogen_resistant_to_beta_lactam_antimicrobials)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pharyngitis known to be due to a pathogen resistant to beta-lactam antimicrobials."

(assert
(! (not patient_has_finding_of_pharyngitis_now@@suspected_due_to_pathogen_resistant_to_beta_lactam_antimicrobials)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pharyngitis suspected to be due to a pathogen resistant to beta-lactam antimicrobials."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_known_carrier_of_streptococcus_pyogenes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a known carrier of Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient is currently not a known carrier of Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a known carrier of Streptococcus pyogenes.","meaning":"Boolean indicating whether the patient is currently a known carrier of Streptococcus pyogenes."} ;; "The patient is excluded if the patient is a known carrier of Streptococcus pyogenes."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_known_carrier_of_streptococcus_pyogenes_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a known carrier of Streptococcus pyogenes."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_penicillin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented clinical finding of allergy to penicillin.","when_to_set_to_false":"Set to false if the patient currently does not have a documented clinical finding of allergy to penicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to penicillin.","meaning":"Boolean indicating whether the patient currently has a clinical finding of allergy to penicillin."} ;; "allergy to penicillin"
(declare-const patient_has_allergy_to_beta_lactam_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to any beta-lactam antibacterial agent.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to any beta-lactam antibacterial agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to any beta-lactam antibacterial agent.","meaning":"Boolean indicating whether the patient currently has an allergy to any beta-lactam antibacterial agent."} ;; "allergy to other beta-lactam antibiotics"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_finding_of_allergy_to_penicillin_now
            patient_has_allergy_to_beta_lactam_antibacterial_now))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has allergy to penicillin) OR (the patient has allergy to other beta-lactam antibiotics)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness.","when_to_set_to_false":"Set to false if the patient currently does not have any illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any illness.","meaning":"Boolean indicating whether the patient currently has any illness."} ;; "any serious illness"

(declare-const patient_has_concomitant_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any concomitant condition.","when_to_set_to_false":"Set to false if the patient currently does not have any concomitant condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any concomitant condition.","meaning":"Boolean indicating whether the patient currently has any concomitant condition."} ;; "any concomitant condition"

(declare-const patient_has_concomitant_condition_now@@precludes_inclusion_to_study_by_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the investigator judges that the patient's concomitant condition will preclude inclusion to the study.","when_to_set_to_false":"Set to false if the investigator does not judge that the patient's concomitant condition will preclude inclusion to the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges the patient's concomitant condition will preclude inclusion to the study.","meaning":"Boolean indicating whether the investigator judges the patient's concomitant condition will preclude inclusion to the study."} ;; "the investigator judges will preclude inclusion to the study"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_concomitant_condition_now@@precludes_inclusion_to_study_by_investigator_judgment
      patient_has_concomitant_condition_now)
:named REQ5_AUXILIARY0)) ;; "any concomitant condition that the investigator judges will preclude inclusion to the study"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_illness_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious illness."

(assert
(! (not patient_has_concomitant_condition_now@@precludes_inclusion_to_study_by_investigator_judgment)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any concomitant condition that the investigator judges will preclude inclusion to the study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_seizure_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of seizure disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of seizure disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of seizure disorder."} ;; "seizure disorder"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_seizure_disorder_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has seizure disorder."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is nursing"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_will_undergo_antibiotic_therapy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to undergo systemic antibacterial therapy at any point in the future, regardless of the reason.","when_to_set_to_false":"Set to false if the patient is not expected to undergo systemic antibacterial therapy at any point in the future, regardless of the reason.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to undergo systemic antibacterial therapy in the future.","meaning":"Boolean indicating whether the patient is expected to undergo systemic antibacterial therapy in the future."} ;; "antibacterial therapy"
(declare-const patient_will_undergo_antibiotic_therapy_inthefuture@@for_another_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to undergo systemic antibacterial therapy in the future and the therapy is for a condition other than the index condition.","when_to_set_to_false":"Set to false if the patient is expected to undergo systemic antibacterial therapy in the future but it is not for another condition (i.e., it is for the index condition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the future systemic antibacterial therapy is for another condition.","meaning":"Boolean indicating whether the future systemic antibacterial therapy is for a condition other than the index condition."} ;; "for another condition"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_will_undergo_antibiotic_therapy_inthefuture@@for_another_condition
      patient_will_undergo_antibiotic_therapy_inthefuture)
   :named REQ8_AUXILIARY0)) ;; "therapy for another condition" implies "therapy"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_will_undergo_antibiotic_therapy_inthefuture@@for_another_condition)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is expected to require additional systemic antibacterial therapy for another condition."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_drug_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of drug abuse.","meaning":"Boolean indicating whether the patient currently has drug abuse."} ;; "the patient has current drug abuse"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "the patient has current alcohol abuse"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_drug_abuse_now)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current drug abuse."

(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current alcohol abuse."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past 30 days.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past 30 days."} ;; "drug"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_experimental Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to within the past 30 days is experimental.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to within the past 30 days is not experimental.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is experimental.","meaning":"Boolean indicating whether the drug or medicament the patient was exposed to within the past 30 days is experimental."} ;; "experimental drug"
(declare-const patient_has_received_experimental_device_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any experimental device within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not received any experimental device within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any experimental device within the past 30 days.","meaning":"Boolean indicating whether the patient has received any experimental device within the past 30 days."} ;; "experimental device"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_experimental
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
    :named REQ10_AUXILIARY0)) ;; "experimental drug within the last thirty days"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_experimental
            patient_has_received_experimental_device_inthepast30days))
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received any experimental drug within the last thirty days) OR (the patient has received any experimental device within the last thirty days)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@systemic_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to drug or medicament within the past 30 days is specifically to systemic antibiotic therapy.","when_to_set_to_false":"Set to false if the patient's exposure to drug or medicament within the past 30 days is not to systemic antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was to systemic antibiotic therapy.","meaning":"Boolean indicating whether the patient's drug/medicament exposure in the past 30 days is specifically systemic antibiotic therapy."} ;; "has received prior systemic antibiotic therapy within the last thirty days."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@systemic_antibiotic_therapy
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
   :named REQ11_AUXILIARY0)) ;; "systemic antibiotic therapy is a type of drug or medicament exposure within the past 30 days"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast30days@@systemic_antibiotic_therapy)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received prior systemic antibiotic therapy within the last thirty days."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_inpatient_stay_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an inpatient stay (hospitalization) within the past one month.","when_to_set_to_false":"Set to false if the patient has not had an inpatient stay (hospitalization) within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an inpatient stay (hospitalization) within the past one month.","meaning":"Boolean indicating whether the patient has had an inpatient stay (hospitalization) within the past one month."} ;; "hospitalized within the last one month"

(declare-const patient_has_undergone_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone antibacterial therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone antibacterial therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone antibacterial therapy.","meaning":"Boolean indicating whether the patient has ever undergone antibacterial therapy at any time in the past."} ;; "antibacterial therapy"

(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@during_hospitalization_within_past_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibacterial therapy and the therapy occurred during a hospitalization within the past one month.","when_to_set_to_false":"Set to false if the patient has undergone antibacterial therapy but not during a hospitalization within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibacterial therapy occurred during a hospitalization within the past one month.","meaning":"Boolean indicating whether the patient has undergone antibacterial therapy during a hospitalization within the past one month."} ;; "received antibacterial therapy during that hospitalization"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies both stem variables
(assert
(! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@during_hospitalization_within_past_1_month
      (and patient_has_undergone_antibiotic_therapy_inthehistory
           patient_has_finding_of_inpatient_stay_inthepast1months))
:named REQ12_AUXILIARY0)) ;; "received antibacterial therapy during that hospitalization" implies both "antibacterial therapy" and "hospitalized within the last one month"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_undergone_antibiotic_therapy_inthehistory@@during_hospitalization_within_past_1_month)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has been hospitalized within the last one month) AND (the patient has received antibacterial therapy during that hospitalization)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_hematologic_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hematologic condition.","when_to_set_to_false":"Set to false if the patient currently does not have a hematologic condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hematologic condition.","meaning":"Boolean indicating whether the patient currently has a hematologic condition."} ;; "hematologic condition"
(declare-const patient_has_finding_of_hematologic_condition_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hematologic condition is clinically significant.","when_to_set_to_false":"Set to false if the patient's current hematologic condition is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hematologic condition is clinically significant.","meaning":"Boolean indicating whether the patient's current hematologic condition is clinically significant."} ;; "clinically significant hematologic condition"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hematologic_condition_now@@clinically_significant
      patient_has_finding_of_hematologic_condition_now)
:named REQ13_AUXILIARY0)) ;; "clinically significant hematologic condition"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_hematologic_condition_now@@clinically_significant)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant hematologic condition."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_taking_probenecid_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with a probenecid-containing product.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment with a probenecid-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with a probenecid-containing product.","meaning":"Boolean indicating whether the patient is currently taking a probenecid-containing product."} ;; "probenecid treatment"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_taking_probenecid_containing_product_now)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving probenecid treatment."
