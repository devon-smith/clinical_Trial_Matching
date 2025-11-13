;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine renal clearance in milliliters per minute is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current creatinine renal clearance in milliliters per minute."} ;; "creatinine clearance ≤ 30 milliliters per minute"

(declare-const patient_has_finding_of_nephrotic_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of nephrotic syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of nephrotic syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nephrotic syndrome.","meaning":"Boolean indicating whether the patient currently has nephrotic syndrome."} ;; "nephrotic syndrome"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (or
      (<= patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 30) ;; "creatinine clearance ≤ 30 milliliters per minute"
      patient_has_finding_of_nephrotic_syndrome_now ;; "nephrotic syndrome"
  ))
  :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has creatinine clearance ≤ 30 milliliters per minute) OR (the patient has nephrotic syndrome))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_immunosuppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an immunosuppressant drug.","when_to_set_to_false":"Set to false if the patient is not currently exposed to an immunosuppressant drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an immunosuppressant drug.","meaning":"Boolean indicating whether the patient is currently exposed to an immunosuppressant drug."} ;; "immunosuppressive drug"
(declare-const patient_is_receiving_chronic_treatment_with_immunosuppressive_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving chronic treatment with an immunosuppressive drug.","when_to_set_to_false":"Set to false if the patient is not currently receiving chronic treatment with an immunosuppressive drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving chronic treatment with an immunosuppressive drug.","meaning":"Boolean indicating whether the patient is currently receiving chronic treatment with an immunosuppressive drug."} ;; "receiving chronic treatment with an immunosuppressive drug"
(declare-const patient_is_undergoing_long_term_drug_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing long-term drug therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing long-term drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing long-term drug therapy.","meaning":"Boolean indicating whether the patient is currently undergoing long-term drug therapy."} ;; "chronic treatment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Receiving chronic treatment with an immunosuppressive drug requires both chronic treatment and exposure to immunosuppressant
(assert
(! (= patient_is_receiving_chronic_treatment_with_immunosuppressive_drug_now
(and patient_is_undergoing_long_term_drug_therapy_now
     patient_is_exposed_to_immunosuppressant_now))
:named REQ1_AUXILIARY0)) ;; "receiving chronic treatment with an immunosuppressive drug" = ("chronic treatment" AND "immunosuppressive drug")

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_receiving_chronic_treatment_with_immunosuppressive_drug_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving chronic treatment with an immunosuppressive drug."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@decompensated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congestive heart failure is currently decompensated.","when_to_set_to_false":"Set to false if the patient's congestive heart failure is currently not decompensated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure is decompensated.","meaning":"Boolean indicating whether the patient's congestive heart failure is decompensated."} ;; "decompensated congestive heart failure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@decompensated
      patient_has_finding_of_congestive_heart_failure_now)
   :named REQ2_AUXILIARY0)) ;; "decompensated congestive heart failure" implies "congestive heart failure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_congestive_heart_failure_now@@decompensated)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has decompensated congestive heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_antibacterial_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has received an antibacterial drug as of now, regardless of indication.","when_to_set_to_null":"Set to null if the total duration of antibacterial drug administration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total hours of antibacterial drug administration to the patient as of now."} ;; "has received more than 24 hours of an antibacterial drug"
(declare-const patient_antibacterial_value_recorded_now_withunit_hours@@for_current_infection Bool) ;; {"when_to_set_to_true":"Set to true if the total hours of antibacterial drug administration recorded in the variable were specifically for the current infection.","when_to_set_to_false":"Set to false if the total hours recorded were not for the current infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibacterial drug administration was for the current infection.","meaning":"Boolean indicating whether the total hours of antibacterial drug administration were for the current infection."} ;; "for the current infection"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (and
            patient_antibacterial_value_recorded_now_withunit_hours@@for_current_infection
            (> patient_antibacterial_value_recorded_now_withunit_hours 24)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received more than 24 hours of an antibacterial drug for the current infection."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_requires_intensive_care_unit_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires intensive care unit management.","when_to_set_to_false":"Set to false if the patient currently does not require intensive care unit management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires intensive care unit management.","meaning":"Boolean indicating whether the patient currently requires intensive care unit management."} ;; "the patient requires intensive care unit management"

(declare-const patient_corresponds_to_severity_for_intensive_care_unit_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently corresponds to the severity required for intensive care unit management.","when_to_set_to_false":"Set to false if the patient currently does not correspond to the severity required for intensive care unit management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently corresponds to the severity required for intensive care unit management.","meaning":"Boolean indicating whether the patient currently corresponds to the severity required for intensive care unit management."} ;; "does NOT correspond to the severity for intensive care unit management"

(declare-const patient_is_admitted_to_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the intensive care unit.","when_to_set_to_false":"Set to false if the patient is not currently admitted to the intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the intensive care unit.","meaning":"Boolean indicating whether the patient is currently admitted to the intensive care unit."} ;; "is admitted to intensive care unit"

(declare-const patient_is_admitted_to_intensive_care_unit_now@@due_to_site_circumstance_shortage_of_hospital_beds Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current admission to the intensive care unit is due to a circumstance of the site, such as shortage of hospital beds.","when_to_set_to_false":"Set to false if the patient's current admission to the intensive care unit is not due to a circumstance of the site, such as shortage of hospital beds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current admission to the intensive care unit is due to a circumstance of the site, such as shortage of hospital beds.","meaning":"Boolean indicating whether the patient's current admission to the intensive care unit is due to a circumstance of the site, such as shortage of hospital beds."} ;; "due to a circumstance of the site with non-exhaustive examples (shortage of hospital beds)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example: shortage of hospital beds is one possible site circumstance
(assert
(! (=> patient_is_admitted_to_intensive_care_unit_now@@due_to_site_circumstance_shortage_of_hospital_beds
      patient_is_admitted_to_intensive_care_unit_now)
:named REQ4_AUXILIARY0)) ;; "is admitted to intensive care unit due to a circumstance of the site with non-exhaustive examples (shortage of hospital beds)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_admitted_to_intensive_care_unit_now@@due_to_site_circumstance_shortage_of_hospital_beds
      patient_is_admitted_to_intensive_care_unit_now)
:named REQ4_AUXILIARY1)) ;; "due to a circumstance of the site (shortage of hospital beds) implies admission to ICU"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient requires ICU management, except if patient does NOT correspond to severity AND is admitted to ICU due to site circumstance
(assert
(! (not (and
         patient_requires_intensive_care_unit_management_now
         (not (and
                 (not patient_corresponds_to_severity_for_intensive_care_unit_management_now)
                 patient_is_admitted_to_intensive_care_unit_now)))
      )
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient requires intensive care unit management) AND NOT (the patient does NOT correspond to the severity for intensive care unit management AND is admitted to intensive care unit due to a circumstance of the site with non-exhaustive examples (shortage of hospital beds)))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@other_than_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection is not pneumonia.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection is pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is other than pneumonia.","meaning":"Boolean indicating whether the patient's current disorder due to infection is other than pneumonia."} ;; "other than pneumonia"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@other_than_secondary_infection_of_chronic_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection is not secondary infection of chronic pulmonary disease.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection is secondary infection of chronic pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is other than secondary infection of chronic pulmonary disease.","meaning":"Boolean indicating whether the patient's current disorder due to infection is other than secondary infection of chronic pulmonary disease."} ;; "other than secondary infection of chronic pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@other_than_pneumonia
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ5_AUXILIARY0)) ;; "other than pneumonia"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@other_than_secondary_infection_of_chronic_pulmonary_disease
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ5_AUXILIARY1)) ;; "other than secondary infection of chronic pulmonary disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@other_than_pneumonia)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an infection other than pneumonia."

(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@other_than_secondary_infection_of_chronic_pulmonary_disease)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an infection other than secondary infection of chronic pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_abscess_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of abscess of lung.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of abscess of lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of abscess of lung.","meaning":"Boolean indicating whether the patient currently has a clinical finding of abscess of lung."} ;; "lung abscess"
(declare-const patient_has_finding_of_empyema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of empyema.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of empyema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of empyema.","meaning":"Boolean indicating whether the patient currently has a clinical finding of empyema."} ;; "empyema"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_abscess_of_lung_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lung abscess."

(assert
(! (not patient_has_finding_of_empyema_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has empyema."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_viral_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of viral pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of viral pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of viral pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of viral pneumonia."} ;; "viral pneumonia"
(declare-const patient_has_diagnosis_of_viral_pneumonia_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of viral pneumonia is the primary diagnosis.","when_to_set_to_false":"Set to false if the diagnosis of viral pneumonia is not the primary diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of viral pneumonia is the primary diagnosis.","meaning":"Boolean indicating whether the diagnosis of viral pneumonia is the primary diagnosis."} ;; "viral pneumonia as a primary diagnosis"

(declare-const patient_has_diagnosis_of_fungal_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of fungal pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of fungal pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of fungal pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of fungal pneumonia."} ;; "fungal pneumonia"
(declare-const patient_has_diagnosis_of_fungal_pneumonia_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of fungal pneumonia is the primary diagnosis.","when_to_set_to_false":"Set to false if the diagnosis of fungal pneumonia is not the primary diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of fungal pneumonia is the primary diagnosis.","meaning":"Boolean indicating whether the diagnosis of fungal pneumonia is the primary diagnosis."} ;; "fungal pneumonia as a primary diagnosis"

(declare-const patient_has_diagnosis_of_mycobacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mycobacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mycobacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mycobacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mycobacterial pneumonia."} ;; "mycobacterial pneumonia"
(declare-const patient_has_diagnosis_of_mycobacterial_pneumonia_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of mycobacterial pneumonia is the primary diagnosis.","when_to_set_to_false":"Set to false if the diagnosis of mycobacterial pneumonia is not the primary diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of mycobacterial pneumonia is the primary diagnosis.","meaning":"Boolean indicating whether the diagnosis of mycobacterial pneumonia is the primary diagnosis."} ;; "mycobacterial pneumonia as a primary diagnosis"

(declare-const patient_has_diagnosis_of_atypical_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of atypical pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of atypical pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of atypical pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of atypical pneumonia."} ;; "atypical pneumonia"
(declare-const patient_has_diagnosis_of_atypical_pneumonia_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of atypical pneumonia is the primary diagnosis.","when_to_set_to_false":"Set to false if the diagnosis of atypical pneumonia is not the primary diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of atypical pneumonia is the primary diagnosis.","meaning":"Boolean indicating whether the diagnosis of atypical pneumonia is the primary diagnosis."} ;; "atypical pneumonia as a primary diagnosis"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_viral_pneumonia_now@@primary_diagnosis
      patient_has_diagnosis_of_viral_pneumonia_now)
:named REQ7_AUXILIARY0)) ;; "viral pneumonia as a primary diagnosis"

(assert
(! (=> patient_has_diagnosis_of_fungal_pneumonia_now@@primary_diagnosis
      patient_has_diagnosis_of_fungal_pneumonia_now)
:named REQ7_AUXILIARY1)) ;; "fungal pneumonia as a primary diagnosis"

(assert
(! (=> patient_has_diagnosis_of_mycobacterial_pneumonia_now@@primary_diagnosis
      patient_has_diagnosis_of_mycobacterial_pneumonia_now)
:named REQ7_AUXILIARY2)) ;; "mycobacterial pneumonia as a primary diagnosis"

(assert
(! (=> patient_has_diagnosis_of_atypical_pneumonia_now@@primary_diagnosis
      patient_has_diagnosis_of_atypical_pneumonia_now)
:named REQ7_AUXILIARY3)) ;; "atypical pneumonia as a primary diagnosis"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_viral_pneumonia_now@@primary_diagnosis)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has viral pneumonia as a primary diagnosis."

(assert
(! (not patient_has_diagnosis_of_fungal_pneumonia_now@@primary_diagnosis)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fungal pneumonia as a primary diagnosis."

(assert
(! (not patient_has_diagnosis_of_mycobacterial_pneumonia_now@@primary_diagnosis)
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mycobacterial pneumonia as a primary diagnosis."

(assert
(! (not patient_has_diagnosis_of_atypical_pneumonia_now@@primary_diagnosis)
:named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atypical pneumonia as a primary diagnosis."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bacteremia secondary to Staphylococcus aureus.","when_to_set_to_false":"Set to false if the patient currently does not have bacteremia secondary to Staphylococcus aureus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bacteremia secondary to Staphylococcus aureus.","meaning":"Boolean indicating whether the patient currently has bacteremia secondary to Staphylococcus aureus."} ;; "bacteremia secondary to Staphylococcus aureus"
(declare-const patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bacteremia secondary to Staphylococcus aureus is known (confirmed).","when_to_set_to_false":"Set to false if the patient's bacteremia secondary to Staphylococcus aureus is not known (not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bacteremia secondary to Staphylococcus aureus is known.","meaning":"Boolean indicating whether the patient's bacteremia secondary to Staphylococcus aureus is known (confirmed)."} ;; "known bacteremia secondary to Staphylococcus aureus"
(declare-const patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bacteremia secondary to Staphylococcus aureus is suspected (not confirmed).","when_to_set_to_false":"Set to false if the patient's bacteremia secondary to Staphylococcus aureus is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bacteremia secondary to Staphylococcus aureus is suspected.","meaning":"Boolean indicating whether the patient's bacteremia secondary to Staphylococcus aureus is suspected (not confirmed)."} ;; "suspected bacteremia secondary to Staphylococcus aureus"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@known
      patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now)
:named REQ8_AUXILIARY0)) ;; "known bacteremia secondary to Staphylococcus aureus"

(assert
(! (=> patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@suspected
      patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now)
:named REQ8_AUXILIARY1)) ;; "suspected bacteremia secondary to Staphylococcus aureus"

;; "known or suspected" means either qualifier suffices for exclusion
(assert
(! (= patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now
      (or patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@known
          patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@suspected))
:named REQ8_AUXILIARY2)) ;; "known or suspected bacteremia secondary to Staphylococcus aureus"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known or suspected bacteremia secondary to Staphylococcus aureus."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_microbial_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a microbial agent.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any microbial agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a microbial agent.","meaning":"Boolean indicating whether the patient is currently exposed to a microbial agent."} ;; "microorganisms"
(declare-const patient_is_exposed_to_microbial_agent_now@@is_known_causative_microorganism Bool) ;; {"when_to_set_to_true":"Set to true if the microbial agent to which the patient is currently exposed is a known causative microorganism for the patient's condition.","when_to_set_to_false":"Set to false if the microbial agent is not a known causative microorganism for the patient's condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the microbial agent is a known causative microorganism for the patient's condition.","meaning":"Boolean indicating whether the microbial agent is a known causative microorganism for the patient's condition."} ;; "known causative microorganisms"
(declare-const patient_is_exposed_to_microbial_agent_now@@other_than_indicated_for_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the microbial agent to which the patient is currently exposed is not among those indicated for the study drug.","when_to_set_to_false":"Set to false if the microbial agent is among those indicated for the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the microbial agent is among those indicated for the study drug.","meaning":"Boolean indicating whether the microbial agent is not among those indicated for the study drug."} ;; "other than those indicated for the study drug"
(declare-const patient_has_undergone_urinary_pneumococcal_antigen_test_now_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone a urinary pneumococcal antigen test and the result is positive.","when_to_set_to_false":"Set to false if the patient has currently undergone a urinary pneumococcal antigen test and the result is not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone a urinary pneumococcal antigen test with a positive result.","meaning":"Boolean indicating whether the patient has currently undergone a urinary pneumococcal antigen test with a positive result."} ;; "urinary antigen test of Streptococcus pneumoniae"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_microbial_agent_now@@is_known_causative_microorganism
      patient_is_exposed_to_microbial_agent_now)
:named REQ9_AUXILIARY0)) ;; "known causative microorganisms"

(assert
(! (=> patient_is_exposed_to_microbial_agent_now@@other_than_indicated_for_study_drug
      patient_is_exposed_to_microbial_agent_now@@is_known_causative_microorganism)
:named REQ9_AUXILIARY1)) ;; "known causative microorganisms other than those indicated for the study drug"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient has known causative microorganisms other than those indicated for the study drug
(assert
(! (not patient_is_exposed_to_microbial_agent_now@@other_than_indicated_for_study_drug)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has known causative microorganisms other than those indicated for the study drug"

;; Exclusion: patient is positive in urinary antigen test of Streptococcus pneumoniae
(assert
(! (not patient_has_undergone_urinary_pneumococcal_antigen_test_now_outcome_is_positive)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is positive in urinary antigen test of Streptococcus pneumoniae"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@necessitates_concomitant_antibacterial_agent_in_addition_to_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infection necessitates the use of a concomitant antibacterial agent in addition to study medication.","when_to_set_to_false":"Set to false if the patient's current infection does not necessitate the use of a concomitant antibacterial agent in addition to study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection necessitates the use of a concomitant antibacterial agent in addition to study medication.","meaning":"Boolean indicating whether the patient's current infection necessitates the use of a concomitant antibacterial agent in addition to study medication."} ;; "infection that necessitates the use of a concomitant antibacterial agent in addition to study medication"

(declare-const patient_is_exposed_to_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an antibacterial agent.","when_to_set_to_false":"Set to false if the patient is currently not exposed to an antibacterial agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an antibacterial agent.","meaning":"Boolean indicating whether the patient is currently exposed to an antibacterial agent."} ;; "antibacterial agent"

(declare-const patient_is_exposed_to_antibacterial_now@@concomitant_and_used_in_addition_to_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a concomitant antibacterial agent that is used in addition to study medication.","when_to_set_to_false":"Set to false if the patient is currently exposed to an antibacterial agent that is not concomitant or not used in addition to study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibacterial agent is concomitant and used in addition to study medication.","meaning":"Boolean indicating whether the patient is currently exposed to a concomitant antibacterial agent used in addition to study medication."} ;; "concomitant antibacterial agent in addition to study medication"

(declare-const patient_is_exposed_to_antibacterial_now@@not_long_term_low_dose_macrolide_for_chronic_respiratory_diseases Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an antibacterial agent that is NOT a long-term, low-dose macrolide for chronic respiratory diseases.","when_to_set_to_false":"Set to false if the patient is currently exposed to a long-term, low-dose macrolide for chronic respiratory diseases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibacterial agent is a long-term, low-dose macrolide for chronic respiratory diseases.","meaning":"Boolean indicating whether the patient is currently exposed to an antibacterial agent that is NOT a long-term, low-dose macrolide for chronic respiratory diseases."} ;; "the concomitant antibacterial agent is NOT long-term, low-dose macrolide for chronic respiratory diseases"

(declare-const patient_is_exposed_to_antibacterial_now@@not_sulbactam_sodium_ampicillin_sodium_unasyn_s Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an antibacterial agent that is NOT sulbactam sodium/ampicillin sodium (Unasyn-S).","when_to_set_to_false":"Set to false if the patient is currently exposed to sulbactam sodium/ampicillin sodium (Unasyn-S).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibacterial agent is sulbactam sodium/ampicillin sodium (Unasyn-S).","meaning":"Boolean indicating whether the patient is currently exposed to an antibacterial agent that is NOT sulbactam sodium/ampicillin sodium (Unasyn-S)."} ;; "the concomitant antibacterial agent is NOT sulbactam sodium/ampicillin sodium (Unasyn-S)"

(declare-const patient_is_exposed_to_antibacterial_now@@not_clindamycin_dalacin_s Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an antibacterial agent that is NOT clindamycin (Dalacin-S).","when_to_set_to_false":"Set to false if the patient is currently exposed to clindamycin (Dalacin-S).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibacterial agent is clindamycin (Dalacin-S).","meaning":"Boolean indicating whether the patient is currently exposed to an antibacterial agent that is NOT clindamycin (Dalacin-S)."} ;; "the concomitant antibacterial agent is NOT clindamycin (Dalacin-S)"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies stem variable for infection
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@necessitates_concomitant_antibacterial_agent_in_addition_to_study_medication
      patient_has_finding_of_disorder_due_to_infection_now)
    :named REQ10_AUXILIARY0)) ;; "infection that necessitates the use of a concomitant antibacterial agent in addition to study medication"

;; Qualifier variable implies stem variable for antibacterial exposure
(assert
(! (=> patient_is_exposed_to_antibacterial_now@@concomitant_and_used_in_addition_to_study_medication
      patient_is_exposed_to_antibacterial_now)
    :named REQ10_AUXILIARY1)) ;; "concomitant antibacterial agent in addition to study medication"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have all of the following:
;; (infection necessitating concomitant antibacterial agent in addition to study medication)
;; AND (is exposed to a concomitant antibacterial agent in addition to study medication)
;; AND (the agent is NOT long-term, low-dose macrolide for chronic respiratory diseases)
;; AND (the agent is NOT sulbactam sodium/ampicillin sodium (Unasyn-S))
;; AND (the agent is NOT clindamycin (Dalacin-S))
(assert
(! (not (and
    patient_has_finding_of_disorder_due_to_infection_now@@necessitates_concomitant_antibacterial_agent_in_addition_to_study_medication
    patient_is_exposed_to_antibacterial_now@@concomitant_and_used_in_addition_to_study_medication
    patient_is_exposed_to_antibacterial_now@@not_long_term_low_dose_macrolide_for_chronic_respiratory_diseases
    patient_is_exposed_to_antibacterial_now@@not_sulbactam_sodium_ampicillin_sodium_unasyn_s
    patient_is_exposed_to_antibacterial_now@@not_clindamycin_dalacin_s))
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has an infection that necessitates the use of a concomitant antibacterial agent in addition to study medication) AND (the concomitant antibacterial agent is NOT long-term, low-dose macrolide for chronic respiratory diseases) AND (the concomitant antibacterial agent is NOT sulbactam sodium/ampicillin sodium (Unasyn-S)) AND (the concomitant antibacterial agent is NOT clindamycin (Dalacin-S))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_obstruction_of_bronchus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an obstruction of the bronchus.","when_to_set_to_false":"Set to false if the patient currently does not have an obstruction of the bronchus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an obstruction of the bronchus.","meaning":"Boolean indicating whether the patient currently has an obstruction of the bronchus."} ;; "bronchial obstruction"
(declare-const patient_has_finding_of_obstruction_of_bronchus_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current obstruction of the bronchus is known (previously diagnosed or established).","when_to_set_to_false":"Set to false if the patient's current obstruction of the bronchus is not known (not previously diagnosed or established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current obstruction of the bronchus is known.","meaning":"Boolean indicating whether the patient's current obstruction of the bronchus is known (previously diagnosed or established)."} ;; "known bronchial obstruction"
(declare-const patient_has_finding_of_postobstructive_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had post-obstructive pneumonia in their history.","when_to_set_to_false":"Set to false if the patient has never had post-obstructive pneumonia in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had post-obstructive pneumonia in their history.","meaning":"Boolean indicating whether the patient has ever had post-obstructive pneumonia in their history."} ;; "post-obstructive pneumonia"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_obstruction_of_bronchus_now@@known
       patient_has_finding_of_obstruction_of_bronchus_now)
   :named REQ11_AUXILIARY0)) ;; "known bronchial obstruction"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT have known bronchial obstruction OR history of post-obstructive pneumonia
(assert
(! (not (or patient_has_finding_of_obstruction_of_bronchus_now@@known
            patient_has_finding_of_postobstructive_pneumonia_inthehistory))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has known bronchial obstruction) OR (the patient has a history of post-obstructive pneumonia)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of lung (primary lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of lung (primary lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of lung (primary lung cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of lung (primary lung cancer)."} ;; "primary lung cancer"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@diagnosis_is_known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of primary malignant neoplasm of lung (primary lung cancer) is known (confirmed, not suspected or uncertain).","when_to_set_to_false":"Set to false if the diagnosis is not known (suspected, uncertain, or not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the diagnosis of primary malignant neoplasm of lung (primary lung cancer) is known (confirmed)."} ;; "known primary lung cancer"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@diagnosis_is_known
      patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now)
:named REQ12_AUXILIARY0)) ;; "diagnosis is known" implies "diagnosis present"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@diagnosis_is_known)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known primary lung cancer."
