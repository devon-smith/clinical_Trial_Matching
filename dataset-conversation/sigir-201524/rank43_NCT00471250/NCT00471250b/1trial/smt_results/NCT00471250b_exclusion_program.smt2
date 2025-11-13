;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is less than eighteen years of age OR the patient is greater than seventy-five years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than eighteen years of age."

(assert
(! (not (> patient_age_value_recorded_now_in_years 75))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is greater than seventy-five years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_tobacco_smoking_consumption_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total pack-years value if the patient's cumulative tobacco smoking exposure over their history is known.","when_to_set_to_null":"Set to null if the patient's cumulative tobacco smoking exposure in pack-years over their history is unknown or cannot be determined.","meaning":"Numeric value representing the patient's cumulative tobacco smoking exposure in pack-years over their history."} ;; "the patient has a history of tobacco smoking of ten pack-years or more"
(declare-const patients_tobacco_smoking_consumption_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently smoking tobacco.","when_to_set_to_false":"Set to false if the patient is currently not smoking tobacco.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently smoking tobacco.","meaning":"Boolean indicating whether the patient is currently smoking tobacco."} ;; "the patient has current tobacco smoking"
(declare-const patient_tobacco_smoking_consumption_free_duration_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the number of years since the patient stopped tobacco smoking if known as of now.","when_to_set_to_null":"Set to null if the duration since the patient stopped tobacco smoking is unknown or cannot be determined as of now.","meaning":"Numeric value representing the duration in years since the patient stopped tobacco smoking, as of now."} ;; "the patient has been free of tobacco smoking for less than one year"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: history of tobacco smoking of ten pack-years or more
(assert
(! (not (>= patient_tobacco_smoking_consumption_value_recorded_inthehistory_withunit_pack_years 10))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of tobacco smoking of ten pack-years or more"

;; Exclusion: current tobacco smoking
(assert
(! (not patients_tobacco_smoking_consumption_is_positive_now)
:named REQ1_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has current tobacco smoking"

;; Exclusion: free of tobacco smoking for less than one year
(assert
(! (not (< patient_tobacco_smoking_consumption_free_duration_value_recorded_now_withunit_years 1))
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has been free of tobacco smoking for less than one year"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "the patient has a positive human immunodeficiency virus infection status"

(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now@@status_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection and the status is positive.","when_to_set_to_false":"Set to false if the patient currently has human immunodeficiency virus infection and the status is not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the status of human immunodeficiency virus infection is positive.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection with positive status."} ;; "the patient has a positive human immunodeficiency virus infection status"

(declare-const patient_has_undergone_polymerase_chain_reaction_analysis_now_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone a polymerase chain reaction analysis and the outcome is negative.","when_to_set_to_false":"Set to false if the patient has currently undergone a polymerase chain reaction analysis and the outcome is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone a polymerase chain reaction analysis with a negative outcome.","meaning":"Boolean indicating whether the patient has currently undergone a polymerase chain reaction analysis with a negative outcome."} ;; "the patient has a negative human immunodeficiency virus polymerase chain reaction test result"

(declare-const patient_has_undergone_enzyme_linked_immunosorbent_assay_now_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone an enzyme-linked immunosorbent assay and the outcome is positive.","when_to_set_to_false":"Set to false if the patient has currently undergone an enzyme-linked immunosorbent assay and the outcome is not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone an enzyme-linked immunosorbent assay with a positive outcome.","meaning":"Boolean indicating whether the patient has currently undergone an enzyme-linked immunosorbent assay with a positive outcome."} ;; "the patient has a positive human immunodeficiency virus enzyme-linked immunosorbent assay test result"

(declare-const patient_has_undergone_enzyme_linked_immunosorbent_assay_now_outcome_is_positive@@positive_result_due_to_prior_participation_in_human_immunodeficiency_virus_vaccine_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone an enzyme-linked immunosorbent assay with a positive outcome and the positive result is due to prior participation in a human immunodeficiency virus vaccine study.","when_to_set_to_false":"Set to false if the patient has currently undergone an enzyme-linked immunosorbent assay with a positive outcome and the positive result is not due to prior participation in a human immunodeficiency virus vaccine study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive result is due to prior participation in a human immunodeficiency virus vaccine study.","meaning":"Boolean indicating whether the patient has currently undergone an enzyme-linked immunosorbent assay with a positive outcome due to prior participation in a human immunodeficiency virus vaccine study."} ;; "the patient has a positive human immunodeficiency virus enzyme-linked immunosorbent assay test result due to prior participation in a human immunodeficiency virus vaccine study"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for HIV infection status
(assert
(! (=> patient_has_finding_of_human_immunodeficiency_virus_infection_now@@status_is_positive
      patient_has_finding_of_human_immunodeficiency_virus_infection_now)
    :named REQ2_AUXILIARY0)) ;; "the patient has a positive human immunodeficiency virus infection status"

;; Qualifier variable implies corresponding stem variable for ELISA result
(assert
(! (=> patient_has_undergone_enzyme_linked_immunosorbent_assay_now_outcome_is_positive@@positive_result_due_to_prior_participation_in_human_immunodeficiency_virus_vaccine_study
      patient_has_undergone_enzyme_linked_immunosorbent_assay_now_outcome_is_positive)
    :named REQ2_AUXILIARY1)) ;; "the patient has a positive human immunodeficiency virus enzyme-linked immunosorbent assay test result due to prior participation in a human immunodeficiency virus vaccine study"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient has a positive HIV infection status AND NOT (PCR negative AND ELISA positive due to prior vaccine study)
(assert
(! (not (and
          patient_has_finding_of_human_immunodeficiency_virus_infection_now@@status_is_positive
          (not (and
                  patient_has_undergone_polymerase_chain_reaction_analysis_now_outcome_is_negative
                  patient_has_undergone_enzyme_linked_immunosorbent_assay_now_outcome_is_positive@@positive_result_due_to_prior_participation_in_human_immunodeficiency_virus_vaccine_study))))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a positive human immunodeficiency virus infection status) AND (NOT ((the patient has a negative human immunodeficiency virus polymerase chain reaction test result) AND (the patient has a positive human immunodeficiency virus enzyme-linked immunosorbent assay test result due to prior participation in a human immunodeficiency virus vaccine study)))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_acute_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute hepatitis.","meaning":"Boolean indicating whether the patient currently has acute hepatitis."} ;; "the patient has acute hepatitis"

(declare-const patient_has_finding_of_chronic_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic hepatitis.","meaning":"Boolean indicating whether the patient currently has chronic hepatitis."} ;; "the patient has chronic hepatitis"

(declare-const patient_has_finding_of_chronic_hepatitis_now_based_on_viral_hepatitis_serology_test_results Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic hepatitis and the diagnosis is based on viral hepatitis serology test results.","when_to_set_to_false":"Set to false if the patient currently does not have chronic hepatitis based on viral hepatitis serology test results.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic hepatitis based on viral hepatitis serology test results.","meaning":"Boolean indicating whether the patient currently has chronic hepatitis based on viral hepatitis serology test results."} ;; "the patient has chronic hepatitis based on viral hepatitis serology test results"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Diagnosis of chronic hepatitis based on viral hepatitis serology test results implies chronic hepatitis
(assert
(! (=> patient_has_finding_of_chronic_hepatitis_now_based_on_viral_hepatitis_serology_test_results
      patient_has_finding_of_chronic_hepatitis_now)
:named REQ3_AUXILIARY0)) ;; "chronic hepatitis based on viral hepatitis serology test results" implies "chronic hepatitis"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_acute_hepatitis_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute hepatitis."

(assert
(! (not patient_has_finding_of_chronic_hepatitis_now_based_on_viral_hepatitis_serology_test_results)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic hepatitis based on viral hepatitis serology test results."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has pregnancy"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient has breastfeeding"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pregnancy."

(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_active_medical_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any active medical problem.","when_to_set_to_false":"Set to false if the patient currently does not have any active medical problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any active medical problem.","meaning":"Boolean indicating whether the patient currently has any active medical problem."} ;; "any active medical problem"

(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (bleeding disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder (bleeding disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder (bleeding disorder).","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (bleeding disorder)."} ;; "bleeding disorder"

(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current blood coagulation disorder (bleeding disorder) is active.","when_to_set_to_false":"Set to false if the patient's current blood coagulation disorder (bleeding disorder) is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current blood coagulation disorder (bleeding disorder) is active.","meaning":"Boolean indicating whether the patient's current blood coagulation disorder (bleeding disorder) is active."} ;; "bleeding disorder"

(declare-const patient_has_finding_of_contusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bruising (contusion).","when_to_set_to_false":"Set to false if the patient currently does not have bruising (contusion).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bruising (contusion).","meaning":"Boolean indicating whether the patient currently has bruising (contusion)."} ;; "significant bruising"

(declare-const patient_has_finding_of_contusion_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bruising (contusion) is significant.","when_to_set_to_false":"Set to false if the patient's current bruising (contusion) is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bruising (contusion) is significant.","meaning":"Boolean indicating whether the patient's current bruising (contusion) is significant."} ;; "significant bruising"

(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bleeding.","meaning":"Boolean indicating whether the patient currently has bleeding."} ;; "bleeding difficulty"

(declare-const patient_has_finding_of_bleeding_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is significant.","when_to_set_to_false":"Set to false if the patient's current bleeding is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding is significant.","meaning":"Boolean indicating whether the patient's current bleeding is significant."} ;; "significant bleeding"

(declare-const patient_can_undergo_intramuscular_injection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo intramuscular injection.","when_to_set_to_false":"Set to false if the patient cannot currently undergo intramuscular injection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo intramuscular injection.","meaning":"Boolean indicating whether the patient can currently undergo intramuscular injection."} ;; "intramuscular injection"

(declare-const patient_can_undergo_intramuscular_injection_now@@difficulty Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has difficulty with intramuscular injection.","when_to_set_to_false":"Set to false if the patient currently does not have difficulty with intramuscular injection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficulty with intramuscular injection.","meaning":"Boolean indicating whether the patient currently has difficulty with intramuscular injection."} ;; "difficulty with intramuscular injection"

(declare-const patient_can_undergo_collection_of_blood_specimen_for_laboratory_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo collection of blood specimen for laboratory (blood draw).","when_to_set_to_false":"Set to false if the patient cannot currently undergo collection of blood specimen for laboratory (blood draw).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo collection of blood specimen for laboratory (blood draw).","meaning":"Boolean indicating whether the patient can currently undergo collection of blood specimen for laboratory (blood draw)."} ;; "blood draw"

(declare-const patient_can_undergo_collection_of_blood_specimen_for_laboratory_now@@difficulty Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has difficulty with blood draw (collection of blood specimen for laboratory).","when_to_set_to_false":"Set to false if the patient currently does not have difficulty with blood draw (collection of blood specimen for laboratory).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficulty with blood draw (collection of blood specimen for laboratory).","meaning":"Boolean indicating whether the patient currently has difficulty with blood draw (collection of blood specimen for laboratory)."} ;; "difficulty with blood draw"

(declare-const patient_is_using_anticoagulant_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any anticoagulant medication.","when_to_set_to_false":"Set to false if the patient is not currently using any anticoagulant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any anticoagulant medication.","meaning":"Boolean indicating whether the patient is currently using any anticoagulant medication."} ;; "use of anticoagulant medication"

(declare-const patient_has_finding_of_pulmonary_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary disorder.","meaning":"Boolean indicating whether the patient currently has a pulmonary disorder."} ;; "pulmonary disorder"

(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has asthma.","when_to_set_to_false":"Set to false if the patient currently does not have asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has asthma.","meaning":"Boolean indicating whether the patient currently has asthma."} ;; "asthma"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_now@@active
       patient_has_finding_of_blood_coagulation_disorder_now)
    :named REQ5_AUXILIARY0)) ;; "bleeding disorder"

(assert
(! (=> patient_has_finding_of_contusion_now@@significant
       patient_has_finding_of_contusion_now)
    :named REQ5_AUXILIARY1)) ;; "significant bruising"

(assert
(! (=> patient_has_finding_of_bleeding_now@@significant
       patient_has_finding_of_bleeding_now)
    :named REQ5_AUXILIARY2)) ;; "significant bleeding"

(assert
(! (=> patient_can_undergo_intramuscular_injection_now@@difficulty
       (not patient_can_undergo_intramuscular_injection_now))
    :named REQ5_AUXILIARY3)) ;; "difficulty with intramuscular injection"

(assert
(! (=> patient_can_undergo_collection_of_blood_specimen_for_laboratory_now@@difficulty
       (not patient_can_undergo_collection_of_blood_specimen_for_laboratory_now))
    :named REQ5_AUXILIARY4)) ;; "difficulty with blood draw"

;; "especially including" is a non-exhaustive example list, so these examples imply the umbrella
(assert
(! (=> (or patient_has_finding_of_blood_coagulation_disorder_now@@active
           patient_has_finding_of_contusion_now@@significant
           patient_has_finding_of_bleeding_now@@significant
           patient_can_undergo_intramuscular_injection_now@@difficulty
           patient_can_undergo_collection_of_blood_specimen_for_laboratory_now@@difficulty
           patient_is_using_anticoagulant_medication_now
           patient_has_finding_of_pulmonary_disorder_now)
       patient_has_active_medical_problem_now)
    :named REQ5_AUXILIARY5)) ;; "especially including (bleeding disorder, significant bruising or bleeding difficulty with intramuscular injection or blood draw, use of anticoagulant medication, or pulmonary disorder...)"

;; "including asthma" is a non-exhaustive example for pulmonary disorder
(assert
(! (=> patient_has_finding_of_asthma_now
       patient_has_finding_of_pulmonary_disorder_now)
    :named REQ5_AUXILIARY6)) ;; "pulmonary disorder including asthma"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_active_medical_problem_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has any active medical problem, especially including (bleeding disorder, significant bruising or bleeding difficulty with intramuscular injection or blood draw, use of anticoagulant medication, or pulmonary disorder including asthma))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_allergy_to_lidocaine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergic reaction to lidocaine.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergic reaction to lidocaine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergic reaction to lidocaine.","meaning":"Boolean indicating whether the patient has ever had a history of allergic reaction to lidocaine."} ;; "the patient has a history of allergic reaction to lidocaine"

(declare-const patient_has_history_of_allergic_reaction_to_sedative_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergic reaction to any sedative medication, regardless of specific drug.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergic reaction to any sedative medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergic reaction to any sedative medication.","meaning":"Boolean indicating whether the patient has ever had a history of allergic reaction to any sedative medication."} ;; "the patient has a history of allergic reaction to sedative medication"

(declare-const patient_has_allergy_to_diazepam_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy to diazepam.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy to diazepam.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to diazepam.","meaning":"Boolean indicating whether the patient has ever had a history of allergy to diazepam."} ;; "diazepam"

(declare-const patient_has_allergy_to_midazolam_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy to midazolam.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy to midazolam.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to midazolam.","meaning":"Boolean indicating whether the patient has ever had a history of allergy to midazolam."} ;; "midazolam"

(declare-const patient_has_history_of_allergic_reaction_to_narcotic_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergic reaction to any narcotic medication, regardless of specific drug.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergic reaction to any narcotic medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergic reaction to any narcotic medication.","meaning":"Boolean indicating whether the patient has ever had a history of allergic reaction to any narcotic medication."} ;; "the patient has a history of allergic reaction to narcotic medication"

(declare-const patient_has_allergy_to_morphine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy to morphine.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy to morphine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to morphine.","meaning":"Boolean indicating whether the patient has ever had a history of allergy to morphine."} ;; "morphine"

(declare-const patient_has_allergy_to_fentanyl_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy to fentanyl.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy to fentanyl.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to fentanyl.","meaning":"Boolean indicating whether the patient has ever had a history of allergy to fentanyl."} ;; "fentanyl"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term for sedative medication
(assert
(! (=> (or patient_has_allergy_to_diazepam_inthehistory
           patient_has_allergy_to_midazolam_inthehistory)
       patient_has_history_of_allergic_reaction_to_sedative_medication)
    :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (diazepam, midazolam)"

;; Non-exhaustive examples imply umbrella term for narcotic medication
(assert
(! (=> (or patient_has_allergy_to_morphine_inthehistory
           patient_has_allergy_to_fentanyl_inthehistory)
       patient_has_history_of_allergic_reaction_to_narcotic_medication)
    :named REQ6_AUXILIARY1)) ;; "with non-exhaustive examples (morphine, fentanyl)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_allergy_to_lidocaine_inthehistory)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergic reaction to lidocaine."

(assert
(! (not patient_has_history_of_allergic_reaction_to_sedative_medication)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergic reaction to sedative medication with non-exhaustive examples (diazepam, midazolam)."

(assert
(! (not patient_has_history_of_allergic_reaction_to_narcotic_medication)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergic reaction to narcotic medication with non-exhaustive examples (morphine, fentanyl)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_immunosuppressant_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to immunosuppressant substances at any time within the past three months.","when_to_set_to_false":"Set to false if the patient has not been exposed to immunosuppressant substances within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to immunosuppressant substances within the past three months.","meaning":"Boolean indicating whether the patient has been exposed to immunosuppressant substances within the past three months."} ;; "the patient has used immunosuppressive medication within the past three months"
(declare-const patient_is_exposed_to_cytotoxic_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to cytotoxic substances at any time within the past three months.","when_to_set_to_false":"Set to false if the patient has not been exposed to cytotoxic substances within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to cytotoxic substances within the past three months.","meaning":"Boolean indicating whether the patient has been exposed to cytotoxic substances within the past three months."} ;; "the patient has used cytotoxic medication within the past three months"
(declare-const patient_has_used_inhaled_corticosteroid_medication_in_the_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used inhaled corticosteroid medication at any time within the past three months.","when_to_set_to_false":"Set to false if the patient has not used inhaled corticosteroid medication within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used inhaled corticosteroid medication within the past three months.","meaning":"Boolean indicating whether the patient has used inhaled corticosteroid medication within the past three months."} ;; "the patient has used inhaled corticosteroid medication within the past three months"
(declare-const patient_has_used_long_acting_beta_agonist_medication_in_the_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used long-acting beta-agonist medication at any time within the past three months.","when_to_set_to_false":"Set to false if the patient has not used long-acting beta-agonist medication within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used long-acting beta-agonist medication within the past three months.","meaning":"Boolean indicating whether the patient has used long-acting beta-agonist medication within the past three months."} ;; "the patient has used long-acting beta-agonist medication within the past three months"
(declare-const patient_has_used_corticosteroid_nasal_spray_for_allergic_rhinitis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used corticosteroid nasal spray for allergic rhinitis.","when_to_set_to_false":"Set to false if the patient has not used corticosteroid nasal spray for allergic rhinitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used corticosteroid nasal spray for allergic rhinitis.","meaning":"Boolean indicating whether the patient has used corticosteroid nasal spray for allergic rhinitis."} ;; "the patient has used corticosteroid nasal spray for allergic rhinitis"
(declare-const patient_has_used_topical_corticosteroid_medication_for_acute_uncomplicated_dermatitis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used topical corticosteroid medication for acute uncomplicated dermatitis.","when_to_set_to_false":"Set to false if the patient has not used topical corticosteroid medication for acute uncomplicated dermatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used topical corticosteroid medication for acute uncomplicated dermatitis.","meaning":"Boolean indicating whether the patient has used topical corticosteroid medication for acute uncomplicated dermatitis."} ;; "the patient has used topical corticosteroid medication for acute uncomplicated dermatitis"
(declare-const patient_has_used_short_acting_beta_agonist_medication_in_controlled_asthma Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used short-acting beta-agonist medication in the context of controlled asthma.","when_to_set_to_false":"Set to false if the patient has not used short-acting beta-agonist medication in the context of controlled asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used short-acting beta-agonist medication in the context of controlled asthma.","meaning":"Boolean indicating whether the patient has used short-acting beta-agonist medication in the context of controlled asthma."} ;; "the patient has used short-acting beta-agonist medication in controlled asthma"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and
         (or patient_is_exposed_to_immunosuppressant_inthepast3months
             patient_is_exposed_to_cytotoxic_inthepast3months
             patient_has_used_inhaled_corticosteroid_medication_in_the_past_3_months
             patient_has_used_long_acting_beta_agonist_medication_in_the_past_3_months)
         (not (or patient_has_used_corticosteroid_nasal_spray_for_allergic_rhinitis
                  patient_has_used_topical_corticosteroid_medication_for_acute_uncomplicated_dermatitis
                  patient_has_used_short_acting_beta_agonist_medication_in_controlled_asthma))))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (((the patient has used immunosuppressive medication within the past three months) OR (the patient has used cytotoxic medication within the past three months) OR (the patient has used inhaled corticosteroid medication within the past three months) OR (the patient has used long-acting beta-agonist medication within the past three months)) AND (NOT ((the patient has used corticosteroid nasal spray for allergic rhinitis) OR (the patient has used topical corticosteroid medication for acute uncomplicated dermatitis) OR (the patient has used short-acting beta-agonist medication in controlled asthma))))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_taken_platelet_aggregation_inhibitor_containing_product_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any platelet aggregation inhibitor containing product within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not taken any platelet aggregation inhibitor containing product within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any platelet aggregation inhibitor containing product within the past 7 days.","meaning":"Boolean indicating whether the patient has taken any platelet aggregation inhibitor containing product within the past 7 days."} ;; "platelet inhibitor medication"
(declare-const patient_has_taken_platelet_aggregation_inhibitor_containing_product_inthepast7days@@temporalcontext_within7days_before_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any platelet aggregation inhibitor containing product within the 7 days before the procedure.","when_to_set_to_false":"Set to false if the patient has not taken any platelet aggregation inhibitor containing product within the 7 days before the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any platelet aggregation inhibitor containing product within the 7 days before the procedure.","meaning":"Boolean indicating whether the patient has taken any platelet aggregation inhibitor containing product within the 7 days before the procedure."} ;; "within seven days of the procedure"
(declare-const patient_is_exposed_to_aspirin_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to aspirin within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to aspirin within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to aspirin within the past 7 days.","meaning":"Boolean indicating whether the patient has been exposed to aspirin within the past 7 days."} ;; "aspirin"
(declare-const patient_is_exposed_to_aspirin_inthepast7days@@temporalcontext_within7days_before_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to aspirin within the 7 days before the procedure.","when_to_set_to_false":"Set to false if the patient has not been exposed to aspirin within the 7 days before the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to aspirin within the 7 days before the procedure.","meaning":"Boolean indicating whether the patient has been exposed to aspirin within the 7 days before the procedure."} ;; "aspirin within seven days of the procedure"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any non-steroidal anti-inflammatory agent within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any non-steroidal anti-inflammatory agent within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any non-steroidal anti-inflammatory agent within the past 7 days.","meaning":"Boolean indicating whether the patient has been exposed to any non-steroidal anti-inflammatory agent within the past 7 days."} ;; "nonsteroidal anti-inflammatory drug medication"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast7days@@temporalcontext_within7days_before_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any non-steroidal anti-inflammatory agent within the 7 days before the procedure.","when_to_set_to_false":"Set to false if the patient has not been exposed to any non-steroidal anti-inflammatory agent within the 7 days before the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any non-steroidal anti-inflammatory agent within the 7 days before the procedure.","meaning":"Boolean indicating whether the patient has been exposed to any non-steroidal anti-inflammatory agent within the 7 days before the procedure."} ;; "nonsteroidal anti-inflammatory drug medication within seven days of the procedure"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive example: aspirin is an example of platelet inhibitor medication
(assert
(! (=> patient_is_exposed_to_aspirin_inthepast7days@@temporalcontext_within7days_before_procedure
     patient_has_taken_platelet_aggregation_inhibitor_containing_product_inthepast7days@@temporalcontext_within7days_before_procedure)
:named REQ8_AUXILIARY0)) ;; "platelet inhibitor medication with non-exhaustive examples (aspirin) within seven days of the procedure"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_taken_platelet_aggregation_inhibitor_containing_product_inthepast7days@@temporalcontext_within7days_before_procedure
     patient_has_taken_platelet_aggregation_inhibitor_containing_product_inthepast7days)
:named REQ8_AUXILIARY1)) ;; "within seven days of the procedure"

(assert
(! (=> patient_is_exposed_to_aspirin_inthepast7days@@temporalcontext_within7days_before_procedure
     patient_is_exposed_to_aspirin_inthepast7days)
:named REQ8_AUXILIARY2)) ;; "aspirin within seven days of the procedure"

(assert
(! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast7days@@temporalcontext_within7days_before_procedure
     patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast7days)
:named REQ8_AUXILIARY3)) ;; "nonsteroidal anti-inflammatory drug medication within seven days of the procedure"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have used platelet inhibitor medication within 7 days before the procedure
(assert
(! (not patient_has_taken_platelet_aggregation_inhibitor_containing_product_inthepast7days@@temporalcontext_within7days_before_procedure)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has used platelet inhibitor medication with non-exhaustive examples (aspirin) within seven days of the procedure"

;; Exclusion: patient must NOT have used nonsteroidal anti-inflammatory drug medication within 7 days before the procedure
(assert
(! (not patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast7days@@temporalcontext_within7days_before_procedure)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has used nonsteroidal anti-inflammatory drug medication within seven days of the procedure"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_active_medical_problem_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any active medical problem and, in the judgment of the investigator, this condition is a contraindication to protocol participation or impairs the ability to give informed consent.","when_to_set_to_false":"Set to false if the patient currently has any active medical problem but, in the judgment of the investigator, this condition is NOT a contraindication to protocol participation and does NOT impair the ability to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges the condition as a contraindication or as impairing consent.","meaning":"Boolean indicating whether the patient's active medical problem is, in the investigator's judgment, a contraindication to protocol participation or impairs the ability to give informed consent."} ;; "any medical condition that, in the judgment of the investigator, is a contraindication to protocol participation or impairs the ability to give informed consent"

(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric condition (mental disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric condition (mental disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric condition (mental disorder).","meaning":"Boolean indicating whether the patient currently has a psychiatric condition (mental disorder)."} ;; "psychiatric condition"

(declare-const patient_has_finding_of_mental_disorder_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric condition and, in the judgment of the investigator, this condition is a contraindication to protocol participation or impairs the ability to give informed consent.","when_to_set_to_false":"Set to false if the patient currently has a psychiatric condition but, in the judgment of the investigator, this condition is NOT a contraindication to protocol participation and does NOT impair the ability to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges the condition as a contraindication or as impairing consent.","meaning":"Boolean indicating whether the patient's psychiatric condition is, in the investigator's judgment, a contraindication to protocol participation or impairs the ability to give informed consent."} ;; "psychiatric condition that, in the judgment of the investigator, is a contraindication to protocol participation or impairs the ability to give informed consent"

(declare-const patient_has_finding_of_social_context_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a social condition (social context finding).","when_to_set_to_false":"Set to false if the patient currently does not have a social condition (social context finding).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a social condition (social context finding).","meaning":"Boolean indicating whether the patient currently has a social condition (social context finding)."} ;; "social condition"

(declare-const patient_has_finding_of_social_context_finding_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a social condition and, in the judgment of the investigator, this condition is a contraindication to protocol participation or impairs the ability to give informed consent.","when_to_set_to_false":"Set to false if the patient currently has a social condition but, in the judgment of the investigator, this condition is NOT a contraindication to protocol participation and does NOT impair the ability to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges the condition as a contraindication or as impairing consent.","meaning":"Boolean indicating whether the patient's social condition is, in the investigator's judgment, a contraindication to protocol participation or impairs the ability to give informed consent."} ;; "social condition that, in the judgment of the investigator, is a contraindication to protocol participation or impairs the ability to give informed consent"

(declare-const patient_has_occupational_reason_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any occupational reason that may affect protocol participation.","when_to_set_to_false":"Set to false if the patient currently does not have any occupational reason that may affect protocol participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any occupational reason that may affect protocol participation.","meaning":"Boolean indicating whether the patient currently has any occupational reason that may affect protocol participation."} ;; "occupational reason"

(declare-const patient_has_occupational_reason_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any occupational reason and, in the judgment of the investigator, this reason is a contraindication to protocol participation or impairs the ability to give informed consent.","when_to_set_to_false":"Set to false if the patient currently has any occupational reason but, in the judgment of the investigator, this reason is NOT a contraindication to protocol participation and does NOT impair the ability to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges the occupational reason as a contraindication or as impairing consent.","meaning":"Boolean indicating whether the patient's occupational reason is, in the investigator's judgment, a contraindication to protocol participation or impairs the ability to give informed consent."} ;; "occupational reason that, in the judgment of the investigator, is a contraindication to protocol participation or impairs the ability to give informed consent"

(declare-const patient_has_other_responsibility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other responsibility that may affect protocol participation.","when_to_set_to_false":"Set to false if the patient currently does not have any other responsibility that may affect protocol participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other responsibility that may affect protocol participation.","meaning":"Boolean indicating whether the patient currently has any other responsibility that may affect protocol participation."} ;; "other responsibility"

(declare-const patient_has_other_responsibility_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other responsibility and, in the judgment of the investigator, this responsibility is a contraindication to protocol participation or impairs the ability to give informed consent.","when_to_set_to_false":"Set to false if the patient currently has any other responsibility but, in the judgment of the investigator, this responsibility is NOT a contraindication to protocol participation and does NOT impair the ability to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges the responsibility as a contraindication or as impairing consent.","meaning":"Boolean indicating whether the patient's other responsibility is, in the investigator's judgment, a contraindication to protocol participation or impairs the ability to give informed consent."} ;; "other responsibility that, in the judgment of the investigator, is a contraindication to protocol participation or impairs the ability to give informed consent"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment
      patient_has_finding_of_mental_disorder_now)
:named REQ9_AUXILIARY0)) ;; "psychiatric condition that, in the judgment of the investigator, is a contraindication to protocol participation or impairs the ability to give informed consent"

(assert
(! (=> patient_has_finding_of_social_context_finding_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment
      patient_has_finding_of_social_context_finding_now)
:named REQ9_AUXILIARY1)) ;; "social condition that, in the judgment of the investigator, is a contraindication to protocol participation or impairs the ability to give informed consent"

(assert
(! (=> patient_has_occupational_reason_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment
      patient_has_occupational_reason_now)
:named REQ9_AUXILIARY2)) ;; "occupational reason that, in the judgment of the investigator, is a contraindication to protocol participation or impairs the ability to give informed consent"

(assert
(! (=> patient_has_other_responsibility_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment
      patient_has_other_responsibility_now)
:named REQ9_AUXILIARY3)) ;; "other responsibility that, in the judgment of the investigator, is a contraindication to protocol participation or impairs the ability to give informed consent"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_has_active_medical_problem_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment
            patient_has_finding_of_mental_disorder_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment
            patient_has_finding_of_social_context_finding_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment
            patient_has_occupational_reason_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment
            patient_has_other_responsibility_now@@contraindication_to_protocol_participation_or_impairs_informed_consent_investigator_judgment))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has any medical condition) OR (the patient has any psychiatric condition) OR (the patient has any social condition) OR (the patient has any occupational reason) OR (the patient has any other responsibility)) AND (in the judgment of the investigator, (the condition or reason is a contraindication to protocol participation OR impairs the ability of the patient to give informed consent))."
