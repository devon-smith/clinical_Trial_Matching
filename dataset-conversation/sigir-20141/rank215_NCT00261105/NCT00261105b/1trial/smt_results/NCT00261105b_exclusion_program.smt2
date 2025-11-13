;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_taking_ergot_alkaloid_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an ergot alkaloid containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking an ergot alkaloid containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an ergot alkaloid containing product.","meaning":"Boolean indicating whether the patient is currently taking an ergot alkaloid containing product."} ;; "ergot alkaloid derivative"
(declare-const patient_is_taking_pimozide_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a pimozide containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a pimozide containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a pimozide containing product.","meaning":"Boolean indicating whether the patient is currently taking a pimozide containing product."} ;; "pimozide"
(declare-const patient_is_taking_astemizole_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an astemizole containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking an astemizole containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an astemizole containing product.","meaning":"Boolean indicating whether the patient is currently taking an astemizole containing product."} ;; "astemizole"
(declare-const patient_is_taking_terfenadine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a terfenadine containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a terfenadine containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a terfenadine containing product.","meaning":"Boolean indicating whether the patient is currently taking a terfenadine containing product."} ;; "terfenadine"
(declare-const patient_is_taking_cisapride_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a cisapride containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a cisapride containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a cisapride containing product.","meaning":"Boolean indicating whether the patient is currently taking a cisapride containing product."} ;; "cisapride"
(declare-const patient_is_taking_simvastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a simvastatin containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a simvastatin containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a simvastatin containing product.","meaning":"Boolean indicating whether the patient is currently taking a simvastatin containing product."} ;; "simvastatin"
(declare-const patient_is_taking_atorvastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an atorvastatin containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking an atorvastatin containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an atorvastatin containing product.","meaning":"Boolean indicating whether the patient is currently taking an atorvastatin containing product."} ;; "atorvastatin"
(declare-const patient_is_taking_lovastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a lovastatin containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a lovastatin containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a lovastatin containing product.","meaning":"Boolean indicating whether the patient is currently taking a lovastatin containing product."} ;; "lovastatin"
(declare-const patient_is_taking_midazolam_containing_product_in_oral_dose_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a midazolam-containing product in oral dose form.","when_to_set_to_false":"Set to false if the patient is not currently taking a midazolam-containing product in oral dose form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a midazolam-containing product in oral dose form.","meaning":"Boolean indicating whether the patient is currently taking a midazolam-containing product in oral dose form."} ;; "oral use of benzodiazepine midazolam"
(declare-const patient_is_taking_triazolam_containing_product_in_oral_dose_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a triazolam-containing product in oral dose form.","when_to_set_to_false":"Set to false if the patient is not currently taking a triazolam-containing product in oral dose form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a triazolam-containing product in oral dose form.","meaning":"Boolean indicating whether the patient is currently taking a triazolam-containing product in oral dose form."} ;; "oral use of benzodiazepine triazolam"
(declare-const patient_is_taking_alprazolam_containing_product_in_oral_dose_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an alprazolam-containing product in oral dose form.","when_to_set_to_false":"Set to false if the patient is not currently taking an alprazolam-containing product in oral dose form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an alprazolam-containing product in oral dose form.","meaning":"Boolean indicating whether the patient is currently taking an alprazolam-containing product in oral dose form."} ;; "oral use of benzodiazepine alprazolam"
(declare-const patient_requires_treatment_with_any_excluded_drug_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment during the study with at least one of the specified drugs or drug categories.","when_to_set_to_false":"Set to false if the patient does not require treatment during the study with any of the specified drugs or drug categories.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment during the study with any of the specified drugs or drug categories.","meaning":"Boolean indicating whether the patient requires treatment during the study with at least one of the specified drugs or drug categories."} ;; "requires treatment during the study with at least one of the following"
(declare-const patient_requires_treatment_with_any_excluded_drug_during_study@@required_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the requirement for treatment with any excluded drug is specifically during the study period.","when_to_set_to_false":"Set to false if the requirement for treatment with any excluded drug is not specifically during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the requirement for treatment with any excluded drug is specifically during the study period.","meaning":"Boolean indicating whether the requirement for treatment with any excluded drug is specifically during the study period."} ;; "requires treatment during the study"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Exhaustive subcategories: umbrella variable is true iff any of the listed drugs is required during the study
(assert
(! (= patient_requires_treatment_with_any_excluded_drug_during_study
     (or patient_is_taking_ergot_alkaloid_containing_product_now
         patient_is_taking_pimozide_containing_product_now
         patient_is_taking_astemizole_containing_product_now
         patient_is_taking_terfenadine_containing_product_now
         patient_is_taking_cisapride_containing_product_now
         patient_is_taking_simvastatin_containing_product_now
         patient_is_taking_atorvastatin_containing_product_now
         patient_is_taking_lovastatin_containing_product_now
         patient_is_taking_midazolam_containing_product_in_oral_dose_form_now
         patient_is_taking_triazolam_containing_product_in_oral_dose_form_now
         patient_is_taking_alprazolam_containing_product_in_oral_dose_form_now))
   :named REQ0_AUXILIARY0)) ;; "with exhaustive subcategories ((ergot alkaloid derivative) OR (pimozide) OR (astemizole) OR (terfenadine) OR (cisapride) OR (simvastatin) OR (atorvastatin) OR (lovastatin) OR (oral use of benzodiazepine midazolam) OR (oral use of benzodiazepine triazolam) OR (oral use of benzodiazepine alprazolam))."

;; Qualifier variable implies stem variable
(assert
(! (=> patient_requires_treatment_with_any_excluded_drug_during_study@@required_during_study
       patient_requires_treatment_with_any_excluded_drug_during_study)
   :named REQ0_AUXILIARY1)) ;; "requires treatment with any excluded drug, and the requirement is specifically during the study period."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_requires_treatment_with_any_excluded_drug_during_study@@required_during_study)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment during the study with at least one of the following with exhaustive subcategories ..."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_congenital_long_qt_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with congenital long QT syndrome at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with congenital long QT syndrome at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with congenital long QT syndrome.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of congenital long QT syndrome in their medical history."} ;; "history of congenital long QT syndrome"

(declare-const patient_has_diagnosis_of_long_qt_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with long QT syndrome at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with long QT syndrome at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with long QT syndrome.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of long QT syndrome in their medical history."} ;; "long QT syndrome"

(declare-const patient_has_family_history_of_long_qt_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented family history of long QT syndrome.","when_to_set_to_false":"Set to false if the patient does not have a documented family history of long QT syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a family history of long QT syndrome.","meaning":"Boolean indicating whether the patient has a family history of long QT syndrome."} ;; "family history of long QT syndrome"

(declare-const patient_has_family_history_of_long_qt_syndrome@@excluded_by_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's family history of long QT syndrome is excluded by electrocardiogram.","when_to_set_to_false":"Set to false if the patient's family history of long QT syndrome is not excluded by electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the family history of long QT syndrome is excluded by electrocardiogram.","meaning":"Boolean indicating whether the family history of long QT syndrome is excluded by electrocardiogram."} ;; "excluded by electrocardiogram"

(declare-const patient_has_finding_of_acquired_long_qt_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acquired QT interval prolongation.","when_to_set_to_false":"Set to false if the patient currently does not have acquired QT interval prolongation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acquired QT interval prolongation.","meaning":"Boolean indicating whether the patient currently has acquired QT interval prolongation."} ;; "known acquired QT interval prolongation"

(declare-const patient_has_finding_of_acquired_long_qt_syndrome_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acquired QT interval prolongation is known (documented or recognized by a clinician).","when_to_set_to_false":"Set to false if the patient's current acquired QT interval prolongation is not known (not documented or not recognized by a clinician).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acquired QT interval prolongation is known.","meaning":"Boolean indicating whether the patient's current acquired QT interval prolongation is known (documented or recognized by a clinician)."} ;; "known acquired QT interval prolongation"

(declare-const patient_has_undergone_electrocardiographic_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an electrocardiogram (ECG) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone an electrocardiogram (ECG) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an electrocardiogram (ECG).","meaning":"Boolean indicating whether the patient has ever undergone an electrocardiogram (ECG) in their medical history."} ;; "electrocardiogram"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_family_history_of_long_qt_syndrome@@excluded_by_electrocardiogram
      patient_has_family_history_of_long_qt_syndrome)
:named REQ1_AUXILIARY0)) ;; "excluded by electrocardiogram"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_acquired_long_qt_syndrome_now@@known
      patient_has_finding_of_acquired_long_qt_syndrome_now)
:named REQ1_AUXILIARY1)) ;; "known acquired QT interval prolongation"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have any of the following:
;; (1) history of congenital long QT syndrome
(assert
(! (not patient_has_diagnosis_of_congenital_long_qt_syndrome_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "history of congenital long QT syndrome"

;; (2) family history of long QT syndrome AND NOT excluded by electrocardiogram
(assert
(! (not (and patient_has_family_history_of_long_qt_syndrome
             (not patient_has_family_history_of_long_qt_syndrome@@excluded_by_electrocardiogram)))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "family history of long QT syndrome AND NOT excluded by electrocardiogram"

;; (3) known acquired QT interval prolongation
(assert
(! (not patient_has_finding_of_acquired_long_qt_syndrome_now@@known)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "known acquired QT interval prolongation"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hypersensitivity_to_telithromycin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity to telithromycin.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity to telithromycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity to telithromycin.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to telithromycin."} ;; "known hypersensitivity to telithromycin"
(declare-const patient_has_finding_of_hypersensitivity_to_macrolide_antibiotic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity to macrolide antibiotic.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity to macrolide antibiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity to macrolide antibiotic.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to macrolide antibiotic."} ;; "known hypersensitivity to macrolide antibiotic"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_to_telithromycin_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to telithromycin."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_macrolide_antibiotic_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to macrolide antibiotic."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_healthcare_associated_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a healthcare-associated infectious disease (hospital-acquired infection).","when_to_set_to_false":"Set to false if the patient currently does not have a healthcare-associated infectious disease (hospital-acquired infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a healthcare-associated infectious disease (hospital-acquired infection).","meaning":"Boolean indicating whether the patient currently has a healthcare-associated infectious disease (hospital-acquired infection) now."} ;; "hospital-acquired infection"
(declare-const patient_hospitalization_duration_within_7_days_prior_to_study_entry_in_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient was hospitalized within the 7 days prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient was hospitalized within the 7 days prior to study entry.","meaning":"Numeric value representing the total hours of hospitalization within the 7 days prior to study entry."} ;; "hospitalization for more than seventy-two hours within seven days of study entry"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: hospital-acquired infection = hospitalization for more than 72 hours within 7 days of study entry
(assert
(! (= patient_has_finding_of_healthcare_associated_infectious_disease_now
     (> patient_hospitalization_duration_within_7_days_prior_to_study_entry_in_hours 72))
   :named REQ3_AUXILIARY0)) ;; "hospital-acquired infection defined as (hospitalization for more than seventy-two hours within seven days of study entry)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_healthcare_associated_infectious_disease_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hospital-acquired infection defined as hospitalization for more than seventy-two hours within seven days of study entry."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Link observable entity to main variable for breast-feeding
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ4_AUXILIARY0)) ;; "breast-feeding"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_renal_function_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured creatinine clearance value in milliliters per minute if a current measurement is available.","when_to_set_to_null":"Set to null if no current creatinine clearance measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine clearance (renal function) in milliliters per minute."} ;; "creatinine clearance less than thirty milliliters per minute"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (< patient_renal_function_value_recorded_now_withunit_milliliters_per_minute 30))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severely impaired renal function defined as (creatinine clearance less than thirty milliliters per minute)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_antibacterial_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to antibacterial substances at any time during the past 7 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to antibacterial substances at any time during the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to antibacterial substances during the past 7 days.","meaning":"Boolean indicating whether the patient has been exposed to antibacterial substances during the past 7 days."} ;; "anti-bacterial drug"

(declare-const patient_is_exposed_to_antibacterial_inthepast7days@@exposure_duration_greater_than_24_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to antibacterial substances for more than 24 hours within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to antibacterial substances for more than 24 hours within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to antibacterial substances for more than 24 hours within the past 7 days.","meaning":"Boolean indicating whether the patient's exposure to antibacterial substances during the past 7 days lasted more than 24 hours."} ;; "anti-bacterial drug for more than twenty-four hours within seven days prior to enrollment in the study"

(declare-const treatment_has_failed_in_the_past_7_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's antibacterial treatment administered within the past 7 days has failed.","when_to_set_to_false":"Set to false if the patient's antibacterial treatment administered within the past 7 days has not failed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's antibacterial treatment administered within the past 7 days has failed.","meaning":"Boolean indicating whether the patient's antibacterial treatment administered within the past 7 days has failed."} ;; "the treatment has NOT failed"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_antibacterial_inthepast7days@@exposure_duration_greater_than_24_hours
      patient_is_exposed_to_antibacterial_inthepast7days)
:named REQ6_AUXILIARY0)) ;; "anti-bacterial drug for more than twenty-four hours within seven days prior to enrollment in the study"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient has received anti-bacterial drug for >24h within 7 days prior to enrollment AND treatment has NOT failed
(assert
(! (not (and patient_is_exposed_to_antibacterial_inthepast7days@@exposure_duration_greater_than_24_hours
             (not treatment_has_failed_in_the_past_7_days)))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has received anti-bacterial drug for more than twenty-four hours within seven days prior to enrollment in the study) AND (the treatment has NOT failed))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "medication"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@could_interfere_with_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to could interfere with the evaluation.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to could not interfere with the evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament could interfere with the evaluation.","meaning":"Boolean indicating whether the drug or medicament the patient is currently exposed to could interfere with the evaluation."} ;; "medication ... that could interfere with the evaluation"
(declare-const patient_is_exposed_to_other_anti_microbial_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to any other anti-microbial drug.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to any other anti-microbial drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to any other anti-microbial drug.","meaning":"Boolean indicating whether the patient is currently receiving or exposed to any other anti-microbial drug."} ;; "other anti-microbial drug"
(declare-const patient_is_exposed_to_other_anti_microbial_drug_now@@could_interfere_with_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the anti-microbial drug the patient is currently exposed to could interfere with the evaluation.","when_to_set_to_false":"Set to false if the anti-microbial drug the patient is currently exposed to could not interfere with the evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anti-microbial drug could interfere with the evaluation.","meaning":"Boolean indicating whether the anti-microbial drug the patient is currently exposed to could interfere with the evaluation."} ;; "other anti-microbial drug ... that could interfere with the evaluation"
(declare-const patient_is_exposed_to_antineoplastic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to any antineoplastic agent.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to any antineoplastic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to any antineoplastic agent.","meaning":"Boolean indicating whether the patient is currently exposed to any antineoplastic agent."} ;; "anti-cancer drug"
(declare-const patient_is_exposed_to_antineoplastic_agent_now@@could_interfere_with_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the antineoplastic agent the patient is currently exposed to could interfere with the evaluation.","when_to_set_to_false":"Set to false if the antineoplastic agent the patient is currently exposed to could not interfere with the evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antineoplastic agent could interfere with the evaluation.","meaning":"Boolean indicating whether the antineoplastic agent the patient is currently exposed to could interfere with the evaluation."} ;; "anti-cancer drug ... that could interfere with the evaluation"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_other_anti_microbial_drug_now@@could_interfere_with_evaluation
           patient_is_exposed_to_antineoplastic_agent_now@@could_interfere_with_evaluation)
    patient_is_exposed_to_drug_or_medicament_now@@could_interfere_with_evaluation)
:named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples ((other anti-microbial drug) OR (anti-cancer drug)) that could interfere with the evaluation."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@could_interfere_with_evaluation
    patient_is_exposed_to_drug_or_medicament_now)
:named REQ7_AUXILIARY1)) ;; "medication ... that could interfere with the evaluation"

(assert
(! (=> patient_is_exposed_to_other_anti_microbial_drug_now@@could_interfere_with_evaluation
    patient_is_exposed_to_other_anti_microbial_drug_now)
:named REQ7_AUXILIARY2)) ;; "other anti-microbial drug ... that could interfere with the evaluation"

(assert
(! (=> patient_is_exposed_to_antineoplastic_agent_now@@could_interfere_with_evaluation
    patient_is_exposed_to_antineoplastic_agent_now)
:named REQ7_AUXILIARY3)) ;; "anti-cancer drug ... that could interfere with the evaluation"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_other_anti_microbial_drug_now@@could_interfere_with_evaluation)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving medication with other anti-microbial drug that could interfere with the evaluation."

(assert
(! (not patient_is_exposed_to_antineoplastic_agent_now@@could_interfere_with_evaluation)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving medication with anti-cancer drug that could interfere with the evaluation."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@microbiologically_documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infection is microbiologically documented.","when_to_set_to_false":"Set to false if the patient's current infection is not microbiologically documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current infection is microbiologically documented.","meaning":"Boolean indicating whether the patient's current infection is microbiologically documented."} ;; "microbiologically documented infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@pathogen_known_prior_to_inclusion_to_be_resistant_to_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the pathogen causing the patient's current infection is known prior to inclusion to be resistant to the study medication.","when_to_set_to_false":"Set to false if the pathogen causing the patient's current infection is not known prior to inclusion to be resistant to the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pathogen is known prior to inclusion to be resistant to the study medication.","meaning":"Boolean indicating whether the pathogen causing the patient's current infection is known prior to inclusion to be resistant to the study medication."} ;; "pathogen known prior to inclusion to be resistant to the study medication"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@microbiologically_documented
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ8_AUXILIARY0)) ;; "microbiologically documented infection"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@pathogen_known_prior_to_inclusion_to_be_resistant_to_study_medication
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ8_AUXILIARY1)) ;; "pathogen known prior to inclusion to be resistant to the study medication"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have microbiologically documented infection with pathogen known prior to inclusion to be resistant to the study medication
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_now@@microbiologically_documented
             patient_has_finding_of_disorder_due_to_infection_now@@pathogen_known_prior_to_inclusion_to_be_resistant_to_study_medication))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has microbiologically documented infection with pathogen known prior to inclusion to be resistant to the study medication."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@other_than_primary_infection_for_study_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the infection present now is not the primary infection for which the patient is being included in the study.","when_to_set_to_false":"Set to false if the infection present now is the primary infection for which the patient is being included in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection present now is the primary infection for study inclusion.","meaning":"Boolean indicating whether the infection present now is other than the primary infection for which the patient is being included in the study."} ;; "other than the primary infection for which the patient is being included in the study"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@requires_use_of_another_systemic_anti_bacterial_drug Bool) ;; {"when_to_set_to_true":"Set to true if the infection present now requires use of another systemic anti-bacterial drug.","when_to_set_to_false":"Set to false if the infection present now does not require use of another systemic anti-bacterial drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection present now requires use of another systemic anti-bacterial drug.","meaning":"Boolean indicating whether the infection present now requires use of another systemic anti-bacterial drug."} ;; "requires use of another systemic anti-bacterial drug"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@other_than_primary_infection_for_study_inclusion
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ9_AUXILIARY0)) ;; "other than the primary infection for which the patient is being included in the study"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@requires_use_of_another_systemic_anti_bacterial_drug
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ9_AUXILIARY1)) ;; "requires use of another systemic anti-bacterial drug"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_now@@other_than_primary_infection_for_study_inclusion
             patient_has_finding_of_disorder_due_to_infection_now@@requires_use_of_another_systemic_anti_bacterial_drug))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infection, other than the primary infection for which the patient is being included in the study, that requires use of another systemic anti-bacterial drug."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_undergone_splenectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone splenectomy at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone splenectomy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone splenectomy.","meaning":"Boolean indicating whether the patient has ever undergone splenectomy at any time in their history."} ;; "splenectomised"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_undergone_splenectomy_inthehistory)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is splenectomised."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_telithromycin_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to telithromycin within the past 30 calendar days.","when_to_set_to_false":"Set to false if the patient has not been exposed to telithromycin within the past 30 calendar days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to telithromycin within the past 30 calendar days.","meaning":"Boolean indicating whether the patient has been exposed to telithromycin within the past 30 calendar days."} ;; "the patient has used telithromycin within the previous thirty calendar days"

(declare-const patient_is_exposed_to_telithromycin_inthepast30days@@exposure_context_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to telithromycin within the past 30 calendar days occurred specifically as part of participation in a study using telithromycin.","when_to_set_to_false":"Set to false if the patient's exposure to telithromycin within the past 30 calendar days did not occur as part of participation in a study using telithromycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to telithromycin within the past 30 calendar days occurred as part of participation in a study using telithromycin.","meaning":"Boolean indicating whether the patient's exposure to telithromycin within the past 30 calendar days occurred as part of participation in a study using telithromycin."} ;; "the patient has participated in a study using telithromycin within the previous thirty calendar days"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_telithromycin_inthepast30days@@exposure_context_study_participation
      patient_is_exposed_to_telithromycin_inthepast30days)
:named REQ11_AUXILIARY0)) ;; "participated in a study using telithromycin within the previous thirty calendar days"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (or patient_is_exposed_to_telithromycin_inthepast30days
            patient_is_exposed_to_telithromycin_inthepast30days@@exposure_context_study_participation))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has used telithromycin within the previous thirty calendar days) OR (the patient has participated in a study using telithromycin within the previous thirty calendar days)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past 4 weeks prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past 4 weeks prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past 4 weeks prior to enrollment.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past 4 weeks prior to enrollment."} ;; "has received investigational drug within four weeks of enrollment in the study."
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast4weeks@@investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to within the past 4 weeks is investigational.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to within the past 4 weeks is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament exposure within the past 4 weeks was to an investigational product."} ;; "has received investigational drug within four weeks of enrollment in the study."

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast4weeks@@investigational
      patient_is_exposed_to_drug_or_medicament_inthepast4weeks)
:named REQ12_AUXILIARY0)) ;; "investigational drug within four weeks" implies "drug or medicament within four weeks"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast4weeks@@investigational)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received investigational drug within four weeks of enrollment in the study."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_enrolled_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has already enrolled in this specific study.","when_to_set_to_false":"Set to false if the patient has not enrolled in this specific study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has already enrolled in this specific study.","meaning":"Boolean indicating whether the patient has already enrolled in this specific study."} ;; "has already enrolled in this study"
(declare-const patient_has_enrolled_in_this_study@@this_study Bool) ;; {"when_to_set_to_true":"Set to true if the enrollment is specifically in this study.","when_to_set_to_false":"Set to false if the enrollment is not in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the enrollment is specifically in this study.","meaning":"Boolean indicating whether the enrollment is specifically in this study."} ;; "has already enrolled in this study"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_enrolled_in_this_study@@this_study
      patient_has_enrolled_in_this_study)
:named REQ13_AUXILIARY0)) ;; "has already enrolled in this study"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_enrolled_in_this_study@@this_study)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has already enrolled in this study."
