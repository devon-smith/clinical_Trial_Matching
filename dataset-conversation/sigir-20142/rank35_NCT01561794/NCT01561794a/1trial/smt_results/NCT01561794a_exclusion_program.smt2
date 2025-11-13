;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine renal clearance (in milliliters per minute) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's creatinine renal clearance measured now in milliliters per minute."} ;; "creatinine clearance ≤ 30 milliliters per minute"

(declare-const patient_has_finding_of_nephrotic_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of nephrotic syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of nephrotic syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nephrotic syndrome.","meaning":"Boolean indicating whether the patient currently has nephrotic syndrome."} ;; "nephrotic syndrome"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (<= patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 30))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine clearance ≤ 30 milliliters per minute."

(assert
  (! (not patient_has_finding_of_nephrotic_syndrome_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nephrotic syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_immunosuppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an immunosuppressant.","when_to_set_to_false":"Set to false if the patient is currently not exposed to an immunosuppressant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an immunosuppressant.","meaning":"Boolean indicating whether the patient is currently exposed to an immunosuppressant."} ;; "immunosuppressive drug"
(declare-const patient_is_exposed_to_immunosuppressant_now@@chronic_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to an immunosuppressant is as part of chronic treatment.","when_to_set_to_false":"Set to false if the patient's current exposure to an immunosuppressant is not as part of chronic treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to an immunosuppressant is as part of chronic treatment.","meaning":"Boolean indicating whether the patient's current exposure to an immunosuppressant is as part of chronic treatment."} ;; "chronic treatment with an immunosuppressive drug"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_is_exposed_to_immunosuppressant_now@@chronic_treatment
      patient_is_exposed_to_immunosuppressant_now)
   :named REQ1_AUXILIARY0)) ;; "chronic treatment with an immunosuppressive drug" implies "immunosuppressive drug"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_exposed_to_immunosuppressant_now@@chronic_treatment)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving chronic treatment with an immunosuppressive drug."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@decompensated_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congestive heart failure is decompensated.","when_to_set_to_false":"Set to false if the patient's congestive heart failure is not decompensated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure is decompensated.","meaning":"Boolean indicating whether the patient's congestive heart failure is decompensated."} ;; "decompensated congestive heart failure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@decompensated_status
      patient_has_finding_of_congestive_heart_failure_now)
:named REQ2_AUXILIARY0)) ;; "decompensated congestive heart failure" implies "congestive heart failure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_congestive_heart_failure_now@@decompensated_status)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has decompensated congestive heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const antibacterial_drug_exposure_duration_for_current_infection_in_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has received antibacterial drug(s) for the current infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient has received antibacterial drug(s) for the current infection.","meaning":"Numeric value representing the total hours of antibacterial drug exposure for the current infection."} ;; "has received > 24 hours of an antibacterial drug for the current infection"

(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder due to infection."} ;; "infection"

(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now@@is_current_infection Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of disorder due to infection refers specifically to the current infection for which antibacterial drug exposure is being measured.","when_to_set_to_false":"Set to false if the diagnosis does not refer to the current infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis refers to the current infection.","meaning":"Boolean indicating whether the diagnosis of disorder due to infection is the current infection relevant to antibacterial drug exposure."} ;; "current infection"

(declare-const patient_is_exposed_to_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to antibacterial drugs at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to antibacterial drugs at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to antibacterial drugs.","meaning":"Boolean indicating whether the patient has ever been exposed to antibacterial drugs in their history."} ;; "antibacterial drug exposure in history"

(declare-const patient_is_exposed_to_antibacterial_inthehistory@@for_current_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to antibacterial drugs in their history is specifically for the current infection.","when_to_set_to_false":"Set to false if the patient's exposure to antibacterial drugs in their history is not for the current infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is for the current infection.","meaning":"Boolean indicating whether the patient's antibacterial drug exposure is for the current infection."} ;; "antibacterial drug exposure in history for current infection"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_now@@is_current_infection
      patient_has_diagnosis_of_disorder_due_to_infection_now)
:named REQ3_AUXILIARY0)) ;; "diagnosis of disorder due to infection refers specifically to the current infection"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_antibacterial_inthehistory@@for_current_infection
      patient_is_exposed_to_antibacterial_inthehistory)
:named REQ3_AUXILIARY1)) ;; "antibacterial drug exposure in history is specifically for the current infection"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (> antibacterial_drug_exposure_duration_for_current_infection_in_hours 24))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received > 24 hours of an antibacterial drug for the current infection."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_requires_intensive_care_unit_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires intensive care unit management.","when_to_set_to_false":"Set to false if the patient currently does not require intensive care unit management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires intensive care unit management.","meaning":"Boolean indicating whether the patient currently requires intensive care unit management."} ;; "the patient requires intensive care unit management"

(declare-const patient_corresponds_to_severity_for_intensive_care_unit_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently corresponds to the severity for intensive care unit management.","when_to_set_to_false":"Set to false if the patient currently does not correspond to the severity for intensive care unit management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently corresponds to the severity for intensive care unit management.","meaning":"Boolean indicating whether the patient currently corresponds to the severity for intensive care unit management."} ;; "the patient does NOT correspond to the severity for intensive care unit management"

(declare-const patient_is_admitted_to_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently not admitted to the intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the intensive care unit.","meaning":"Boolean indicating whether the patient is currently admitted to the intensive care unit."} ;; "the patient is admitted to intensive care unit"

(declare-const patient_is_admitted_to_intensive_care_unit_now@@due_to_circumstance_of_the_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current admission to the intensive care unit is due to a circumstance of the site.","when_to_set_to_false":"Set to false if the patient's current admission to the intensive care unit is not due to a circumstance of the site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current admission to the intensive care unit is due to a circumstance of the site.","meaning":"Boolean indicating whether the patient's current admission to the intensive care unit is due to a circumstance of the site."} ;; "the patient is admitted to intensive care unit due to a circumstance of the site"

(declare-const circumstance_of_the_site_is_shortage_of_hospital_beds_now Bool) ;; {"when_to_set_to_true":"Set to true if the current circumstance of the site is a shortage of hospital beds.","when_to_set_to_false":"Set to false if the current circumstance of the site is not a shortage of hospital beds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current circumstance of the site is a shortage of hospital beds.","meaning":"Boolean indicating whether the current circumstance of the site is a shortage of hospital beds."} ;; "shortage of hospital beds"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example: shortage of hospital beds is one possible circumstance of the site
(assert
(! (=> circumstance_of_the_site_is_shortage_of_hospital_beds_now
     patient_is_admitted_to_intensive_care_unit_now@@due_to_circumstance_of_the_site)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (shortage of hospital beds)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_admitted_to_intensive_care_unit_now@@due_to_circumstance_of_the_site
     patient_is_admitted_to_intensive_care_unit_now)
:named REQ4_AUXILIARY1)) ;; "admitted to intensive care unit due to a circumstance of the site" implies "admitted to intensive care unit"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient requires ICU management, except if (does NOT correspond to severity for ICU management AND admitted to ICU due to circumstance of the site)
(assert
(! (not (and patient_requires_intensive_care_unit_management_now
             (not (and (not patient_corresponds_to_severity_for_intensive_care_unit_management_now)
                       patient_is_admitted_to_intensive_care_unit_now@@due_to_circumstance_of_the_site))))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient requires intensive care unit management) AND NOT ((the patient does NOT correspond to the severity for intensive care unit management) AND (the patient is admitted to intensive care unit due to a circumstance of the site with non-exhaustive examples (shortage of hospital beds))))"

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now@@other_than_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder due to infection and the infection is other than pneumonia.","when_to_set_to_false":"Set to false if the patient currently has any disorder due to infection and the infection is pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is other than pneumonia.","meaning":"Boolean indicating whether the patient currently has any disorder due to infection and the infection is other than pneumonia."} ;; "infection other than pneumonia"
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now@@other_than_secondary_infection_of_chronic_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder due to infection and the infection is other than secondary infection of chronic pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently has any disorder due to infection and the infection is secondary infection of chronic pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is other than secondary infection of chronic pulmonary disease.","meaning":"Boolean indicating whether the patient currently has any disorder due to infection and the infection is other than secondary infection of chronic pulmonary disease."} ;; "infection other than secondary infection of chronic pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_now@@other_than_pneumonia
      patient_has_diagnosis_of_disorder_due_to_infection_now)
:named REQ5_AUXILIARY0)) ;; "infection other than pneumonia"

(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_now@@other_than_secondary_infection_of_chronic_pulmonary_disease
      patient_has_diagnosis_of_disorder_due_to_infection_now)
:named REQ5_AUXILIARY1)) ;; "infection other than secondary infection of chronic pulmonary disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_due_to_infection_now@@other_than_pneumonia)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an infection other than pneumonia."

(assert
(! (not patient_has_diagnosis_of_disorder_due_to_infection_now@@other_than_secondary_infection_of_chronic_pulmonary_disease)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an infection other than secondary infection of chronic pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_abscess_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding or diagnosis of abscess of lung.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding or diagnosis of abscess of lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abscess of lung.","meaning":"Boolean indicating whether the patient currently has abscess of lung."} ;; "lung abscess"
(declare-const patient_has_finding_of_empyema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding or diagnosis of empyema.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding or diagnosis of empyema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has empyema.","meaning":"Boolean indicating whether the patient currently has empyema."} ;; "empyema"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_abscess_of_lung_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lung abscess."

(assert
(! (not patient_has_finding_of_empyema_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has empyema."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_viral_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of viral pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of viral pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of viral pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of viral pneumonia."} ;; "viral pneumonia"
(declare-const patient_has_diagnosis_of_viral_pneumonia_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of viral pneumonia is the primary diagnosis.","when_to_set_to_false":"Set to false if the patient's current diagnosis of viral pneumonia is not the primary diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of viral pneumonia is the primary diagnosis.","meaning":"Boolean indicating whether the patient's current diagnosis of viral pneumonia is the primary diagnosis."} ;; "viral pneumonia as a primary diagnosis"
(declare-const patient_has_diagnosis_of_fungal_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of fungal pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of fungal pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of fungal pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of fungal pneumonia."} ;; "fungal pneumonia"
(declare-const patient_has_diagnosis_of_fungal_pneumonia_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of fungal pneumonia is the primary diagnosis.","when_to_set_to_false":"Set to false if the patient's current diagnosis of fungal pneumonia is not the primary diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of fungal pneumonia is the primary diagnosis.","meaning":"Boolean indicating whether the patient's current diagnosis of fungal pneumonia is the primary diagnosis."} ;; "fungal pneumonia as a primary diagnosis"
(declare-const patient_has_diagnosis_of_mycobacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mycobacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mycobacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mycobacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mycobacterial pneumonia."} ;; "mycobacterial pneumonia"
(declare-const patient_has_diagnosis_of_mycobacterial_pneumonia_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of mycobacterial pneumonia is the primary diagnosis.","when_to_set_to_false":"Set to false if the patient's current diagnosis of mycobacterial pneumonia is not the primary diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of mycobacterial pneumonia is the primary diagnosis.","meaning":"Boolean indicating whether the patient's current diagnosis of mycobacterial pneumonia is the primary diagnosis."} ;; "mycobacterial pneumonia as a primary diagnosis"
(declare-const patient_has_diagnosis_of_atypical_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of atypical pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of atypical pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of atypical pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of atypical pneumonia."} ;; "atypical pneumonia"
(declare-const patient_has_diagnosis_of_atypical_pneumonia_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of atypical pneumonia is the primary diagnosis.","when_to_set_to_false":"Set to false if the patient's current diagnosis of atypical pneumonia is not the primary diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of atypical pneumonia is the primary diagnosis.","meaning":"Boolean indicating whether the patient's current diagnosis of atypical pneumonia is the primary diagnosis."} ;; "atypical pneumonia as a primary diagnosis"

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
(declare-const patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of bacteremia due to Staphylococcus aureus (either known or suspected).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of bacteremia due to Staphylococcus aureus (neither known nor suspected).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bacteremia due to Staphylococcus aureus.","meaning":"Boolean indicating whether the patient currently has bacteremia due to Staphylococcus aureus."} ;; "bacteremia secondary to Staphylococcus aureus"
(declare-const patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bacteremia due to Staphylococcus aureus and this finding is known (confirmed).","when_to_set_to_false":"Set to false if the patient currently has bacteremia due to Staphylococcus aureus but the finding is not known (i.e., not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is known.","meaning":"Boolean indicating whether the patient's bacteremia due to Staphylococcus aureus is known (confirmed)."} ;; "known bacteremia secondary to Staphylococcus aureus"
(declare-const patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bacteremia due to Staphylococcus aureus and this finding is suspected (not confirmed).","when_to_set_to_false":"Set to false if the patient currently has bacteremia due to Staphylococcus aureus but the finding is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is suspected.","meaning":"Boolean indicating whether the patient's bacteremia due to Staphylococcus aureus is suspected (not confirmed)."} ;; "suspected bacteremia secondary to Staphylococcus aureus"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply the stem variable
(assert
(! (=> patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@known
       patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now)
   :named REQ8_AUXILIARY0)) ;; "known bacteremia secondary to Staphylococcus aureus"

(assert
(! (=> patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@suspected
       patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now)
   :named REQ8_AUXILIARY1)) ;; "suspected bacteremia secondary to Staphylococcus aureus"

;; The stem variable is true if either qualifier is true (definition from requirement: 'known or suspected')
(assert
(! (= patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now
      (or patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@known
          patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now@@suspected))
   :named REQ8_AUXILIARY2)) ;; "has known or suspected bacteremia secondary to Staphylococcus aureus"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known or suspected bacteremia secondary to Staphylococcus aureus."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_known_causative_microorganism_other_than_study_drug_indication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known causative microorganism and it is not among those indicated for the study drug.","when_to_set_to_false":"Set to false if the patient currently has a known causative microorganism and it is among those indicated for the study drug, or if the patient does not have a known causative microorganism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known causative microorganism or whether it is indicated for the study drug.","meaning":"Boolean indicating whether the patient currently has a known causative microorganism that is not among those indicated for the study drug."} ;; "the patient has known causative microorganisms other than those indicated for the study drug"

(declare-const patient_has_undergone_urinary_pneumococcal_antigen_test_now_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone a urinary antigen test for Streptococcus pneumoniae and the result is positive.","when_to_set_to_false":"Set to false if the patient has currently undergone the test and the result is not positive, or has not undergone the test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone the test or the result is positive.","meaning":"Boolean indicating whether the patient has currently undergone a urinary antigen test for Streptococcus pneumoniae and the outcome is positive."} ;; "the patient is positive in urinary antigen test of Streptococcus pneumoniae"

(declare-const patient_is_exposed_to_microbial_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently known to be exposed to any microbial agent (microorganism).","when_to_set_to_false":"Set to false if the patient is currently known not to be exposed to any microbial agent (microorganism).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any microbial agent (microorganism).","meaning":"Boolean indicating whether the patient is currently exposed to any microbial agent (microorganism)."} ;; "microorganisms"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_known_causative_microorganism_other_than_study_drug_indication_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has known causative microorganisms other than those indicated for the study drug"

(assert
(! (not patient_has_undergone_urinary_pneumococcal_antigen_test_now_outcome_is_positive)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is positive in urinary antigen test of Streptococcus pneumoniae"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_chronic_disease_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic disease of respiratory system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic disease of respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic disease of respiratory system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic disease of respiratory system."} ;; "chronic respiratory diseases"
(declare-const patient_has_diagnosis_of_chronic_disease_of_respiratory_system_now@@indication_for_long_term_low_dose_macrolide_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic respiratory disease is the indication for long-term, low-dose macrolide therapy.","when_to_set_to_false":"Set to false if the patient's chronic respiratory disease is not the indication for long-term, low-dose macrolide therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic respiratory disease is the indication for long-term, low-dose macrolide therapy.","meaning":"Boolean indicating whether the patient's chronic respiratory disease is the indication for long-term, low-dose macrolide therapy."} ;; "chronic respiratory diseases as indication for long-term, low-dose macrolide therapy"
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now@@necessitates_concomitant_antibacterial_agent_in_addition_to_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infection necessitates the use of a concomitant antibacterial agent in addition to study medication.","when_to_set_to_false":"Set to false if the patient's current infection does not necessitate the use of a concomitant antibacterial agent in addition to study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current infection necessitates the use of a concomitant antibacterial agent in addition to study medication.","meaning":"Boolean indicating whether the patient's current infection necessitates the use of a concomitant antibacterial agent in addition to study medication."} ;; "infection that necessitates the use of a concomitant antibacterial agent in addition to study medication"
(declare-const patient_is_exposed_to_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antibacterial agent.","when_to_set_to_false":"Set to false if the patient is currently not exposed to antibacterial agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antibacterial agent.","meaning":"Boolean indicating whether the patient is currently exposed to antibacterial agent."} ;; "antibacterial agent"
(declare-const patient_is_exposed_to_antibacterial_now@@concomitant_and_used_in_addition_to_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a concomitant antibacterial agent that is used in addition to study medication.","when_to_set_to_false":"Set to false if the patient is currently exposed to an antibacterial agent that is not concomitant or not used in addition to study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibacterial agent is concomitant and used in addition to study medication.","meaning":"Boolean indicating whether the patient is currently exposed to a concomitant antibacterial agent used in addition to study medication."} ;; "concomitant antibacterial agent in addition to study medication"
(declare-const patient_is_exposed_to_antibacterial_now@@not_exhaustive_subcategories_long_term_low_dose_macrolide_for_chronic_respiratory_diseases_or_sulbactam_sodium_ampicillin_sodium_or_clindamycin Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an antibacterial agent that is NOT one of the exhaustive subcategories: long-term, low-dose macrolide for chronic respiratory diseases; sulbactam sodium/ampicillin sodium; clindamycin.","when_to_set_to_false":"Set to false if the patient is currently exposed to an antibacterial agent that IS one of the exhaustive subcategories.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibacterial agent is or is not one of the exhaustive subcategories.","meaning":"Boolean indicating whether the patient is currently exposed to an antibacterial agent that is NOT one of the exhaustive subcategories."} ;; "the concomitant antibacterial agent is NOT with exhaustive subcategories (long-term, low-dose macrolide for chronic respiratory diseases OR sulbactam sodium/ampicillin sodium OR clindamycin)"
(declare-const patient_is_exposed_to_macrolide_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to macrolide antibacterial.","when_to_set_to_false":"Set to false if the patient is currently not exposed to macrolide antibacterial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to macrolide antibacterial.","meaning":"Boolean indicating whether the patient is currently exposed to macrolide antibacterial."} ;; "macrolide"
(declare-const patient_is_exposed_to_macrolide_antibacterial_now@@long_term_and_low_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to macrolide antibacterial and the exposure is long-term and low-dose.","when_to_set_to_false":"Set to false if the patient is currently exposed to macrolide antibacterial but the exposure is not long-term and low-dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is long-term and low-dose.","meaning":"Boolean indicating whether the patient is currently exposed to macrolide antibacterial and the exposure is long-term and low-dose."} ;; "long-term, low-dose macrolide"
(declare-const patient_is_exposed_to_sulbactam_sodium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to sulbactam sodium.","when_to_set_to_false":"Set to false if the patient is currently not exposed to sulbactam sodium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to sulbactam sodium.","meaning":"Boolean indicating whether the patient is currently exposed to sulbactam sodium."} ;; "sulbactam sodium"
(declare-const patient_is_exposed_to_ampicillin_sodium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ampicillin sodium.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ampicillin sodium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ampicillin sodium.","meaning":"Boolean indicating whether the patient is currently exposed to ampicillin sodium."} ;; "ampicillin sodium"
(declare-const patient_is_exposed_to_clindamycin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to clindamycin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to clindamycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to clindamycin.","meaning":"Boolean indicating whether the patient is currently exposed to clindamycin."} ;; "clindamycin"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Exhaustive subcategories: the allowed agents are exactly the three listed
(assert
(! (= (not (or (and patient_is_exposed_to_macrolide_antibacterial_now@@long_term_and_low_dose
                    patient_has_diagnosis_of_chronic_disease_of_respiratory_system_now@@indication_for_long_term_low_dose_macrolide_therapy)
               (and patient_is_exposed_to_sulbactam_sodium_now
                    patient_is_exposed_to_ampicillin_sodium_now)
               patient_is_exposed_to_clindamycin_now))
       patient_is_exposed_to_antibacterial_now@@not_exhaustive_subcategories_long_term_low_dose_macrolide_for_chronic_respiratory_diseases_or_sulbactam_sodium_ampicillin_sodium_or_clindamycin)
   :named REQ10_AUXILIARY0)) ;; "the concomitant antibacterial agent is NOT with exhaustive subcategories (long-term, low-dose macrolide for chronic respiratory diseases OR sulbactam sodium/ampicillin sodium OR clindamycin)"

;; Qualifier: long-term, low-dose macrolide for chronic respiratory diseases
(assert
(! (=> patient_is_exposed_to_macrolide_antibacterial_now@@long_term_and_low_dose
       patient_is_exposed_to_macrolide_antibacterial_now)
   :named REQ10_AUXILIARY1)) ;; "long-term, low-dose macrolide"

(assert
(! (=> patient_has_diagnosis_of_chronic_disease_of_respiratory_system_now@@indication_for_long_term_low_dose_macrolide_therapy
       patient_has_diagnosis_of_chronic_disease_of_respiratory_system_now)
   :named REQ10_AUXILIARY2)) ;; "chronic respiratory diseases as indication for long-term, low-dose macrolide therapy"

;; Qualifier: concomitant and used in addition to study medication
(assert
(! (=> patient_is_exposed_to_antibacterial_now@@concomitant_and_used_in_addition_to_study_medication
       patient_is_exposed_to_antibacterial_now)
   :named REQ10_AUXILIARY3)) ;; "concomitant antibacterial agent in addition to study medication"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (and
         patient_has_diagnosis_of_disorder_due_to_infection_now@@necessitates_concomitant_antibacterial_agent_in_addition_to_study_medication
         patient_is_exposed_to_antibacterial_now@@concomitant_and_used_in_addition_to_study_medication
         patient_is_exposed_to_antibacterial_now@@not_exhaustive_subcategories_long_term_low_dose_macrolide_for_chronic_respiratory_diseases_or_sulbactam_sodium_ampicillin_sodium_or_clindamycin))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has an infection that necessitates the use of a concomitant antibacterial agent in addition to study medication AND the concomitant antibacterial agent is NOT with exhaustive subcategories (long-term, low-dose macrolide for chronic respiratory diseases OR sulbactam sodium/ampicillin sodium OR clindamycin)"

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_obstruction_of_bronchus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an obstruction of the bronchus.","when_to_set_to_false":"Set to false if the patient currently does not have an obstruction of the bronchus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an obstruction of the bronchus.","meaning":"Boolean indicating whether the patient currently has an obstruction of the bronchus."} ;; "bronchial obstruction"
(declare-const patient_has_finding_of_obstruction_of_bronchus_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current obstruction of the bronchus is known (confirmed/documented).","when_to_set_to_false":"Set to false if the patient's current obstruction of the bronchus is not known (not confirmed/documented, e.g., only suspected or possible).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the obstruction of the bronchus is known.","meaning":"Boolean indicating whether the patient's current obstruction of the bronchus is known (confirmed/documented)."} ;; "known bronchial obstruction"
(declare-const patient_has_finding_of_postobstructive_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had post-obstructive pneumonia at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had post-obstructive pneumonia at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had post-obstructive pneumonia.","meaning":"Boolean indicating whether the patient has ever had post-obstructive pneumonia at any time in their medical history."} ;; "post-obstructive pneumonia"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_obstruction_of_bronchus_now@@known
       patient_has_finding_of_obstruction_of_bronchus_now)
   :named REQ11_AUXILIARY0)) ;; "known bronchial obstruction" implies "bronchial obstruction"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_obstruction_of_bronchus_now@@known)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known bronchial obstruction."

(assert
(! (not patient_has_finding_of_postobstructive_pneumonia_inthehistory)
   :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of post-obstructive pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of lung (primary lung cancer), regardless of whether the diagnosis is known or suspected.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of lung (primary lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of lung (primary lung cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of lung (primary lung cancer), regardless of whether the diagnosis is known or suspected."} ;; "primary lung cancer"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@diagnosis_is_known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of primary malignant neoplasm of lung (primary lung cancer) is known (confirmed, not merely suspected or possible).","when_to_set_to_false":"Set to false if the diagnosis is not known (i.e., only suspected, possible, or unconfirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the diagnosis of primary malignant neoplasm of lung (primary lung cancer) is known (confirmed, not merely suspected or possible)."} ;; "known primary lung cancer"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@diagnosis_is_known
      patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now)
   :named REQ12_AUXILIARY0)) ;; "known primary lung cancer"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now@@diagnosis_is_known)
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known primary lung cancer."
