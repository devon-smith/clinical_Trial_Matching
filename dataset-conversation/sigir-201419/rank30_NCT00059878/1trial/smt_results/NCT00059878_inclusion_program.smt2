;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_invasive_aspergillosis_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinical finding of invasive aspergillosis within the past 7 days.","when_to_set_to_false":"Set to false if the patient does not have a clinical finding of invasive aspergillosis within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has invasive aspergillosis within the past 7 days.","meaning":"Boolean indicating whether the patient has invasive aspergillosis within the past 7 days."}  ;; "invasive aspergillosis"
(declare-const patient_has_finding_of_invasive_aspergillosis_inthepast7days@@confirmed_by_cytology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's invasive aspergillosis within the past 7 days is confirmed by cytology.","when_to_set_to_false":"Set to false if the patient's invasive aspergillosis within the past 7 days is not confirmed by cytology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cytology confirmed the finding.","meaning":"Boolean indicating whether the patient's invasive aspergillosis within the past 7 days is confirmed by cytology."}  ;; "proven/probable invasive aspergillosis by cytology"
(declare-const patient_has_finding_of_invasive_aspergillosis_inthepast7days@@proven Bool) ;; {"when_to_set_to_true":"Set to true if the patient's invasive aspergillosis within the past 7 days is classified as proven.","when_to_set_to_false":"Set to false if the patient's invasive aspergillosis within the past 7 days is not classified as proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is proven.","meaning":"Boolean indicating whether the patient's invasive aspergillosis within the past 7 days is classified as proven."}  ;; "proven invasive aspergillosis"
(declare-const patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a probable filamentous fungal infection within the past 7 days.","when_to_set_to_false":"Set to false if the patient does not have a probable filamentous fungal infection within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a probable filamentous fungal infection within the past 7 days.","meaning":"Boolean indicating whether the patient has probable filamentous fungal infection within the past 7 days."}  ;; "probable filamentous fungal infection"
(declare-const patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days@@confirmed_by_cytology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's probable filamentous fungal infection within the past 7 days is confirmed by cytology.","when_to_set_to_false":"Set to false if the patient's probable filamentous fungal infection within the past 7 days is not confirmed by cytology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cytology confirmed the finding.","meaning":"Boolean indicating whether the patient's probable filamentous fungal infection within the past 7 days is confirmed by cytology."}  ;; "probable filamentous fungal infection by cytology"
(declare-const patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days@@confirmed_by_histopathology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's probable filamentous fungal infection within the past 7 days is confirmed by histopathology.","when_to_set_to_false":"Set to false if the patient's probable filamentous fungal infection within the past 7 days is not confirmed by histopathology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether histopathology confirmed the finding.","meaning":"Boolean indicating whether the patient's probable filamentous fungal infection within the past 7 days is confirmed by histopathology."}  ;; "probable filamentous fungal infection by histopathology"
(declare-const patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days@@confirmed_by_culture Bool) ;; {"when_to_set_to_true":"Set to true if the patient's probable filamentous fungal infection within the past 7 days is confirmed by culture.","when_to_set_to_false":"Set to false if the patient's probable filamentous fungal infection within the past 7 days is not confirmed by culture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether culture confirmed the finding.","meaning":"Boolean indicating whether the patient's probable filamentous fungal infection within the past 7 days is confirmed by culture."}  ;; "probable filamentous fungal infection by culture"
(declare-const patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a proven filamentous fungal infection within the past 7 days.","when_to_set_to_false":"Set to false if the patient does not have a proven filamentous fungal infection within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a proven filamentous fungal infection within the past 7 days.","meaning":"Boolean indicating whether the patient has proven filamentous fungal infection within the past 7 days."}  ;; "proven filamentous fungal infection"
(declare-const patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days@@confirmed_by_cytology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's proven filamentous fungal infection within the past 7 days is confirmed by cytology.","when_to_set_to_false":"Set to false if the patient's proven filamentous fungal infection within the past 7 days is not confirmed by cytology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cytology confirmed the finding.","meaning":"Boolean indicating whether the patient's proven filamentous fungal infection within the past 7 days is confirmed by cytology."}  ;; "proven filamentous fungal infection by cytology"
(declare-const patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days@@confirmed_by_histopathology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's proven filamentous fungal infection within the past 7 days is confirmed by histopathology.","when_to_set_to_false":"Set to false if the patient's proven filamentous fungal infection within the past 7 days is not confirmed by histopathology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether histopathology confirmed the finding.","meaning":"Boolean indicating whether the patient's proven filamentous fungal infection within the past 7 days is confirmed by histopathology."}  ;; "proven filamentous fungal infection by histopathology"
(declare-const patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days@@confirmed_by_culture Bool) ;; {"when_to_set_to_true":"Set to true if the patient's proven filamentous fungal infection within the past 7 days is confirmed by culture.","when_to_set_to_false":"Set to false if the patient's proven filamentous fungal infection within the past 7 days is not confirmed by culture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether culture confirmed the finding.","meaning":"Boolean indicating whether the patient's proven filamentous fungal infection within the past 7 days is confirmed by culture."}  ;; "proven filamentous fungal infection by culture"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_invasive_aspergillosis_inthepast7days@@confirmed_by_cytology
         patient_has_finding_of_invasive_aspergillosis_inthepast7days)
     :named REQ0_AUXILIARY0)) ;; If confirmed by cytology, must have invasive aspergillosis within past 7 days

(assert
  (! (=> patient_has_finding_of_invasive_aspergillosis_inthepast7days@@proven
         patient_has_finding_of_invasive_aspergillosis_inthepast7days)
     :named REQ0_AUXILIARY1)) ;; If proven, must have invasive aspergillosis within past 7 days

(assert
  (! (=> patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days@@confirmed_by_cytology
         patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days)
     :named REQ0_AUXILIARY2)) ;; If probable filamentous fungal infection confirmed by cytology, must have probable filamentous fungal infection

(assert
  (! (=> patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days@@confirmed_by_histopathology
         patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days)
     :named REQ0_AUXILIARY3)) ;; If probable filamentous fungal infection confirmed by histopathology, must have probable filamentous fungal infection

(assert
  (! (=> patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days@@confirmed_by_culture
         patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days)
     :named REQ0_AUXILIARY4)) ;; If probable filamentous fungal infection confirmed by culture, must have probable filamentous fungal infection

(assert
  (! (=> patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days@@confirmed_by_cytology
         patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days)
     :named REQ0_AUXILIARY5)) ;; If proven filamentous fungal infection confirmed by cytology, must have proven filamentous fungal infection

(assert
  (! (=> patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days@@confirmed_by_histopathology
         patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days)
     :named REQ0_AUXILIARY6)) ;; If proven filamentous fungal infection confirmed by histopathology, must have proven filamentous fungal infection

(assert
  (! (=> patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days@@confirmed_by_culture
         patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days)
     :named REQ0_AUXILIARY7)) ;; If proven filamentous fungal infection confirmed by culture, must have proven filamentous fungal infection

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have at least one of the following 12 findings:
;; (proven invasive aspergillosis by cytology within 7d) OR
;; (proven invasive aspergillosis by histopathology within 7d) OR
;; (proven invasive aspergillosis by culture within 7d) OR
;; (probable invasive aspergillosis by cytology within 7d) OR
;; (probable invasive aspergillosis by histopathology within 7d) OR
;; (probable invasive aspergillosis by culture within 7d) OR
;; (proven filamentous fungal infection by cytology within 7d) OR
;; (proven filamentous fungal infection by histopathology within 7d) OR
;; (proven filamentous fungal infection by culture within 7d) OR
;; (probable filamentous fungal infection by cytology within 7d) OR
;; (probable filamentous fungal infection by histopathology within 7d) OR
;; (probable filamentous fungal infection by culture within 7d)

(assert
  (! (or
        ;; proven invasive aspergillosis by cytology
        (and patient_has_finding_of_invasive_aspergillosis_inthepast7days@@proven
             patient_has_finding_of_invasive_aspergillosis_inthepast7days@@confirmed_by_cytology)
        ;; proven invasive aspergillosis by histopathology
        (and patient_has_finding_of_invasive_aspergillosis_inthepast7days@@proven
             ;; histopathology qualifier not present, so use stem + proven
             ;; (Assume that if not present, cannot assert)
             false)
        ;; proven invasive aspergillosis by culture
        (and patient_has_finding_of_invasive_aspergillosis_inthepast7days@@proven
             ;; culture qualifier not present, so use stem + proven
             false)
        ;; probable invasive aspergillosis by cytology
        (and (and patient_has_finding_of_invasive_aspergillosis_inthepast7days
                  (not patient_has_finding_of_invasive_aspergillosis_inthepast7days@@proven))
             patient_has_finding_of_invasive_aspergillosis_inthepast7days@@confirmed_by_cytology)
        ;; probable invasive aspergillosis by histopathology
        (and (and patient_has_finding_of_invasive_aspergillosis_inthepast7days
                  (not patient_has_finding_of_invasive_aspergillosis_inthepast7days@@proven))
             false)
        ;; probable invasive aspergillosis by culture
        (and (and patient_has_finding_of_invasive_aspergillosis_inthepast7days
                  (not patient_has_finding_of_invasive_aspergillosis_inthepast7days@@proven))
             false)
        ;; proven filamentous fungal infection by cytology
        patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days@@confirmed_by_cytology
        ;; proven filamentous fungal infection by histopathology
        patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days@@confirmed_by_histopathology
        ;; proven filamentous fungal infection by culture
        patient_has_finding_of_proven_filamentous_fungal_infection_inthepast7days@@confirmed_by_culture
        ;; probable filamentous fungal infection by cytology
        patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days@@confirmed_by_cytology
        ;; probable filamentous fungal infection by histopathology
        patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days@@confirmed_by_histopathology
        ;; probable filamentous fungal infection by culture
        patient_has_finding_of_probable_filamentous_fungal_infection_inthepast7days@@confirmed_by_culture
     )
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (proven invasive aspergillosis by cytology within the past 7 days OR ... OR probable filamentous fungal infection by culture within the past 7 days)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} ;; "cancer"
(declare-const patient_has_diagnosis_of_aplastic_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of aplastic anemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of aplastic anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of aplastic anemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of aplastic anemia."} ;; "aplastic anemia"
(declare-const patient_has_diagnosis_of_congenital_immunodeficiency_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congenital (inherited) immunodeficiency disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congenital (inherited) immunodeficiency disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congenital (inherited) immunodeficiency disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congenital (inherited) immunodeficiency disease."} ;; "inherited immunodeficiency disorder"
(declare-const patient_has_diagnosis_of_autoimmune_deficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of autoimmune deficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of autoimmune deficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of autoimmune deficiency disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of autoimmune deficiency disorder."} ;; "autoimmune deficiency disorder"
(declare-const patient_has_diagnosis_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of immunodeficiency disorder."} ;; "immunodeficiency disorder"
(declare-const patient_has_diagnosis_of_immunodeficiency_disorder_now@@acquired Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunodeficiency disorder is acquired.","when_to_set_to_false":"Set to false if the patient's immunodeficiency disorder is not acquired.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's immunodeficiency disorder is acquired.","meaning":"Boolean indicating whether the patient's immunodeficiency disorder is acquired."} ;; "acquired immunodeficiency disorder"
(declare-const patient_has_diagnosis_of_immunodeficiency_disorder_now@@autoimmune Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunodeficiency disorder is autoimmune.","when_to_set_to_false":"Set to false if the patient's immunodeficiency disorder is not autoimmune.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's immunodeficiency disorder is autoimmune.","meaning":"Boolean indicating whether the patient's immunodeficiency disorder is autoimmune."} ;; "autoimmune immunodeficiency disorder"
(declare-const patient_has_undergone_autologous_peripheral_blood_stem_cell_transplant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone autologous peripheral blood stem cell transplantation.","when_to_set_to_false":"Set to false if the patient has not undergone autologous peripheral blood stem cell transplantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone autologous peripheral blood stem cell transplantation.","meaning":"Boolean indicating whether the patient has undergone autologous peripheral blood stem cell transplantation."} ;; "autologous peripheral blood stem cell transplantation"
(declare-const patient_has_undergone_autologous_bone_marrow_transplant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone autologous bone marrow transplantation.","when_to_set_to_false":"Set to false if the patient has not undergone autologous bone marrow transplantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone autologous bone marrow transplantation.","meaning":"Boolean indicating whether the patient has undergone autologous bone marrow transplantation."} ;; "autologous bone marrow transplantation"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply the stem variable (acquired immunodeficiency disorder is a type of immunodeficiency disorder)
(assert
  (! (=> patient_has_diagnosis_of_immunodeficiency_disorder_now@@acquired
         patient_has_diagnosis_of_immunodeficiency_disorder_now)
     :named REQ1_AUXILIARY0)) ;; "acquired immunodeficiency disorder" is a type of immunodeficiency disorder

;; Qualifier variables imply the stem variable (autoimmune immunodeficiency disorder is a type of immunodeficiency disorder)
(assert
  (! (=> patient_has_diagnosis_of_immunodeficiency_disorder_now@@autoimmune
         patient_has_diagnosis_of_immunodeficiency_disorder_now)
     :named REQ1_AUXILIARY1)) ;; "autoimmune immunodeficiency disorder" is a type of immunodeficiency disorder

;; ===================== Constraint Assertions (REQ 1) =====================
;; At least one of the following must be true for inclusion:
;; (cancer) OR (aplastic anemia) OR (inherited immunodeficiency disorder) OR (autoimmune deficiency disorder) OR (acquired immunodeficiency disorder) OR (recipient of autologous peripheral blood stem cell transplantation) OR (recipient of autologous bone marrow transplantation)
(assert
  (! (or patient_has_diagnosis_of_malignant_neoplastic_disease_now
         patient_has_diagnosis_of_aplastic_anemia_now
         patient_has_diagnosis_of_congenital_immunodeficiency_disease_now
         patient_has_diagnosis_of_autoimmune_deficiency_disorder_now
         patient_has_diagnosis_of_immunodeficiency_disorder_now@@acquired
         patient_has_undergone_autologous_peripheral_blood_stem_cell_transplant_now
         patient_has_undergone_autologous_bone_marrow_transplant_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be presenting with at least one of the following: (cancer) OR (aplastic anemia) OR (inherited immunodeficiency disorder) OR (autoimmune deficiency disorder) OR (acquired immunodeficiency disorder) OR (be a recipient of autologous peripheral blood stem cell transplantation) OR (be a recipient of autologous bone marrow transplantation)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_aspergillosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aspergillosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aspergillosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of aspergillosis.","meaning":"Boolean indicating whether the patient currently has aspergillosis."} ;; "aspergillosis"
(declare-const patient_has_finding_of_aspergillosis_now@@located_in_central_nervous_system Bool) ;; {"when_to_set_to_true":"Set to true if the patient's aspergillosis is located in the central nervous system.","when_to_set_to_false":"Set to false if the patient's aspergillosis is not located in the central nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's aspergillosis is located in the central nervous system.","meaning":"Boolean indicating whether the patient's aspergillosis is located in the central nervous system."} ;; "central nervous system aspergillosis"
(declare-const patient_has_finding_of_mycosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fungal infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fungal infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of fungal infection.","meaning":"Boolean indicating whether the patient currently has a fungal infection."} ;; "fungal infection"
(declare-const patient_has_finding_of_mycosis_now@@located_in_central_nervous_system Bool) ;; {"when_to_set_to_true":"Set to true if the patient's fungal infection is located in the central nervous system.","when_to_set_to_false":"Set to false if the patient's fungal infection is not located in the central nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's fungal infection is located in the central nervous system.","meaning":"Boolean indicating whether the patient's fungal infection is located in the central nervous system."} ;; "central nervous system filamentous fungal infection"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for CNS aspergillosis implies stem variable
(assert
  (! (=> patient_has_finding_of_aspergillosis_now@@located_in_central_nervous_system
         patient_has_finding_of_aspergillosis_now)
     :named REQ2_AUXILIARY0)) ;; "central nervous system aspergillosis" implies "aspergillosis"

;; Qualifier variable for CNS mycosis implies stem variable
(assert
  (! (=> patient_has_finding_of_mycosis_now@@located_in_central_nervous_system
         patient_has_finding_of_mycosis_now)
     :named REQ2_AUXILIARY1)) ;; "central nervous system filamentous fungal infection" implies "fungal infection"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient may have (central nervous system aspergillosis) OR (central nervous system filamentous fungal infection)
(assert
  (! (or patient_has_finding_of_aspergillosis_now@@located_in_central_nervous_system
         patient_has_finding_of_mycosis_now@@located_in_central_nervous_system)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may have (central nervous system aspergillosis) OR (central nervous system filamentous fungal infection)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_zygomycosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of zygomycosis infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of zygomycosis infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has zygomycosis infection.","meaning":"Boolean indicating whether the patient currently has zygomycosis infection."} ;; "zygomycosis infection"
(declare-const patient_has_finding_of_zygomycosis_now@@invasive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current zygomycosis infection is invasive.","when_to_set_to_false":"Set to false if the patient's current zygomycosis infection is not invasive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current zygomycosis infection is invasive.","meaning":"Boolean indicating whether the patient's current zygomycosis infection is invasive."} ;; "invasive zygomycosis infection"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable (invasive) implies the stem variable (zygomycosis infection)
(assert
  (! (=> patient_has_finding_of_zygomycosis_now@@invasive
         patient_has_finding_of_zygomycosis_now)
     :named REQ3_AUXILIARY0)) ;; "the patient must NOT have invasive zygomycosis infection."

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient must NOT have invasive zygomycosis infection.
(assert
  (! (not patient_has_finding_of_zygomycosis_now@@invasive)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT have invasive zygomycosis infection."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 2 years"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must be aged ≥ 2 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 2.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 2 years."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_age_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the patient's current age in days if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in days is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in days."}  ;; "life expectancy ≥ 7 days"
(declare-const patient_longevity_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the estimated number of days if the patient's current life expectancy is recorded or can be estimated in days.","when_to_set_to_null":"Set to null if the patient's current life expectancy in days is not available or cannot be estimated.","meaning":"Numeric value representing the patient's current estimated life expectancy in days."}  ;; "life expectancy"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must have life expectancy ≥ 7 days.
(assert
  (! (>= patient_longevity_value_recorded_now_withunit_days 7.0)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have life expectancy ≥ 7 days."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's alanine aminotransferase (ALT) level is recorded now with a known unit.","when_to_set_to_null":"Set to null if no ALT measurement is recorded now or the value/unit is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase (ALT) level."} ;; "alanine aminotransferase level"

(declare-const patient_alanine_aminotransferase_upper_limit_of_normal_value Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for alanine aminotransferase (ALT) for the laboratory, if known and documented.","when_to_set_to_null":"Set to null if the upper limit of normal for ALT is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the laboratory's reference upper limit of normal for ALT."} ;; "upper limit of normal for alanine aminotransferase"

;; ===================== Constraint Assertions (REQ 6) =====================
;; To be included, the patient must have alanine aminotransferase level ≤ 5 times the upper limit of normal.
(assert
  (! (<= patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
         (* 5.0 patient_alanine_aminotransferase_upper_limit_of_normal_value))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine renal clearance (in milliliters per minute) is recorded at the current time.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate at the current time.","meaning":"Numeric value of the patient's creatinine renal clearance in milliliters per minute, measured now."}  ;; "creatinine clearance ≥ 30 milliliters per minute"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (>= patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 30.0)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have creatinine clearance ≥ 30 milliliters per minute."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "must NOT be pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "NOT be nursing"

;; ===================== Constraint Assertions (REQ 8) =====================
;; The patient must NOT be pregnant AND NOT be nursing.
(assert
  (! (and (not patient_is_pregnant_now)
          (not patient_is_breastfeeding_now))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const pregnancy_test_result_value_recorded_now_withunit_binary Real) ;; {"when_to_set_to_value":"Set to 0 if the most recent pregnancy test result for the patient is negative, set to 1 if positive.","when_to_set_to_null":"Set to null if the pregnancy test result is unknown, not documented, or cannot be determined.","meaning":"Binary numeric variable indicating the result of the most recent pregnancy test for the patient, recorded now. Value is 0 for negative, 1 for positive."} ;; "the patient must have a negative pregnancy test"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (= pregnancy_test_result_value_recorded_now_withunit_binary 0)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a negative pregnancy test"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential (fertile) based on clinical assessment.","when_to_set_to_false":"Set to false if the patient is currently considered not to have childbearing potential (infertile) based on clinical assessment.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential (i.e., is fertile)."} ;; "if the patient is fertile"
(declare-const patient_has_finding_of_barrier_contraception_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method.","when_to_set_to_false":"Set to false if the patient is currently not using a barrier contraception method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a barrier contraception method.","meaning":"Boolean indicating whether the patient is currently using a barrier contraception method."} ;; "barrier contraception"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@effective Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method and the method is effective.","when_to_set_to_false":"Set to false if the patient is currently using a barrier contraception method and the method is not effective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the barrier contraception method used is effective.","meaning":"Boolean indicating whether the patient is currently using an effective barrier contraception method."} ;; "effective barrier contraception"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_barrier_contraception_method_now@@effective
         patient_has_finding_of_barrier_contraception_method_now)
     :named REQ10_AUXILIARY0)) ;; "effective barrier contraception" implies "barrier contraception"

;; ===================== Constraint Assertions (REQ 10) =====================
;; If the patient is fertile, the patient must use effective barrier contraception
(assert
  (! (or (not patient_has_childbearing_potential_now)
         patient_has_finding_of_barrier_contraception_method_now@@effective)
     :named REQ10_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is fertile, the patient must use effective barrier contraception"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_has_finding_of_disorder_of_the_central_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a disorder of the central nervous system at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a disorder of the central nervous system at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a disorder of the central nervous system.","meaning":"Boolean indicating whether the patient has ever had a disorder of the central nervous system in their history."} ;; "central nervous system disorder"
(declare-const patient_has_finding_of_disorder_of_the_central_nervous_system_inthehistory@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the disorder of the central nervous system in the patient's history is considered significant.","when_to_set_to_false":"Set to false if the disorder of the central nervous system in the patient's history is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is significant.","meaning":"Boolean indicating whether the disorder of the central nervous system in the patient's history is significant."} ;; "significant central nervous system disorder"
(declare-const patient_has_finding_of_multiple_sclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had multiple sclerosis at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had multiple sclerosis at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had multiple sclerosis.","meaning":"Boolean indicating whether the patient has ever had multiple sclerosis in their history."} ;; "multiple sclerosis"
(declare-const patient_has_finding_of_seizure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a seizure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a seizure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a seizure.","meaning":"Boolean indicating whether the patient has ever had a seizure in their history."} ;; "seizure"
(declare-const patient_has_finding_of_seizure_inthehistory@@is_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the seizure in the patient's history was uncontrolled.","when_to_set_to_false":"Set to false if the seizure in the patient's history was controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the seizure was uncontrolled.","meaning":"Boolean indicating whether the seizure in the patient's history was uncontrolled."} ;; "uncontrolled seizure"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive examples imply the umbrella term (significant CNS disorder)
(assert
  (! (=> patient_has_finding_of_multiple_sclerosis_inthehistory
         (and patient_has_finding_of_disorder_of_the_central_nervous_system_inthehistory
              patient_has_finding_of_disorder_of_the_central_nervous_system_inthehistory@@is_significant))
     :named REQ11_AUXILIARY0)) ;; "multiple sclerosis" is a non-exhaustive example of significant CNS disorder

(assert
  (! (=> (and patient_has_finding_of_seizure_inthehistory
              patient_has_finding_of_seizure_inthehistory@@is_uncontrolled)
         (and patient_has_finding_of_disorder_of_the_central_nervous_system_inthehistory
              patient_has_finding_of_disorder_of_the_central_nervous_system_inthehistory@@is_significant))
     :named REQ11_AUXILIARY1)) ;; "uncontrolled seizure" is a non-exhaustive example of significant CNS disorder

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_disorder_of_the_central_nervous_system_inthehistory@@is_significant
         patient_has_finding_of_disorder_of_the_central_nervous_system_inthehistory)
     :named REQ11_AUXILIARY2)) ;; qualifier implies stem

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_seizure_inthehistory@@is_uncontrolled
         patient_has_finding_of_seizure_inthehistory)
     :named REQ11_AUXILIARY3)) ;; qualifier implies stem

;; ===================== Constraint Assertions (REQ 11) =====================
;; To be included, the patient must NOT have had prior significant central nervous system disorder
(assert
  (! (not (and patient_has_finding_of_disorder_of_the_central_nervous_system_inthehistory
               patient_has_finding_of_disorder_of_the_central_nervous_system_inthehistory@@is_significant))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have had prior significant central nervous system disorder"

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_finding_of_toxicity_to_interferon_gamma_inthehistory@@grade_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had grade 3 toxicity to interferon gamma at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had grade 3 toxicity to interferon gamma in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had grade 3 toxicity to interferon gamma.","meaning":"Boolean indicating whether the patient has ever had grade 3 toxicity to interferon gamma in the past."} ;; "prior grade 3 toxicity to interferon gamma"
(declare-const patient_has_finding_of_toxicity_to_interferon_gamma_inthehistory@@grade_4 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had grade 4 toxicity to interferon gamma at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had grade 4 toxicity to interferon gamma in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had grade 4 toxicity to interferon gamma.","meaning":"Boolean indicating whether the patient has ever had grade 4 toxicity to interferon gamma in the past."} ;; "prior grade 4 toxicity to interferon gamma"
(declare-const patient_has_finding_of_allergic_reaction_inthehistory@@severe@@to_interferon_gamma Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a severe allergic reaction to interferon gamma at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a severe allergic reaction to interferon gamma in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a severe allergic reaction to interferon gamma.","meaning":"Boolean indicating whether the patient has ever had a severe allergic reaction to interferon gamma in the past."} ;; "prior severe allergic reaction to interferon gamma"

;; ===================== Constraint Assertions (REQ 12) =====================
;; The patient must NOT have had prior grade 3 toxicity to interferon gamma
(assert
  (! (not patient_has_finding_of_toxicity_to_interferon_gamma_inthehistory@@grade_3)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "NOT have had prior grade 3 toxicity to interferon gamma"

;; The patient must NOT have had prior grade 4 toxicity to interferon gamma
(assert
  (! (not patient_has_finding_of_toxicity_to_interferon_gamma_inthehistory@@grade_4)
     :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT have had prior grade 4 toxicity to interferon gamma"

;; The patient must NOT have had prior severe allergic reaction to interferon gamma
(assert
  (! (not patient_has_finding_of_allergic_reaction_inthehistory@@severe@@to_interferon_gamma)
     :named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "NOT have had prior severe allergic reaction to interferon gamma"

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const patient_has_intolerance_to_voriconazole_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had intolerance to voriconazole at any time prior to inclusion.","when_to_set_to_false":"Set to false if the patient has never had intolerance to voriconazole prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to voriconazole prior to inclusion.","meaning":"Boolean indicating whether the patient has ever had intolerance to voriconazole in their history."} ;; "NOT have had prior intolerance to voriconazole"
(declare-const patient_has_hypersensitivity_to_voriconazole_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had hypersensitivity to voriconazole at any time prior to inclusion.","when_to_set_to_false":"Set to false if the patient has never had hypersensitivity to voriconazole prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had hypersensitivity to voriconazole prior to inclusion.","meaning":"Boolean indicating whether the patient has ever had hypersensitivity to voriconazole in their history."} ;; "NOT have had prior hypersensitivity to voriconazole"
(declare-const patient_has_intolerance_to_azole_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had intolerance to azole at any time prior to inclusion.","when_to_set_to_false":"Set to false if the patient has never had intolerance to azole prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to azole prior to inclusion.","meaning":"Boolean indicating whether the patient has ever had intolerance to azole in their history."} ;; "NOT have had prior intolerance to azole"
(declare-const patient_has_hypersensitivity_to_azole_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had hypersensitivity to azole at any time prior to inclusion.","when_to_set_to_false":"Set to false if the patient has never had hypersensitivity to azole prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had hypersensitivity to azole prior to inclusion.","meaning":"Boolean indicating whether the patient has ever had hypersensitivity to azole in their history."} ;; "NOT have had prior hypersensitivity to azole"

;; ===================== Constraint Assertions (REQ 13) =====================
;; The patient must NOT have had prior intolerance to voriconazole AND NOT have had prior hypersensitivity to voriconazole AND NOT have had prior intolerance to azole AND NOT have had prior hypersensitivity to azole.
(assert
  (! (and (not patient_has_intolerance_to_voriconazole_inthehistory)
          (not patient_has_hypersensitivity_to_voriconazole_inthehistory)
          (not patient_has_intolerance_to_azole_inthehistory)
          (not patient_has_hypersensitivity_to_azole_inthehistory))
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (NOT have had prior intolerance to voriconazole) AND (NOT have had prior hypersensitivity to voriconazole) AND (NOT have had prior intolerance to azole) AND (NOT have had prior hypersensitivity to azole)."

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const patient_has_finding_of_acute_graft_versus_host_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute graft-versus-host disease.","when_to_set_to_false":"Set to false if the patient currently does not have acute graft-versus-host disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute graft-versus-host disease.","meaning":"Boolean indicating whether the patient currently has acute graft-versus-host disease."} ;; "NOT have acute graft-versus-host disease"
(declare-const patient_has_finding_of_chronic_graft_versus_host_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic graft-versus-host disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic graft-versus-host disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic graft-versus-host disease.","meaning":"Boolean indicating whether the patient currently has chronic graft-versus-host disease."} ;; "NOT have chronic graft-versus-host disease"

;; ===================== Constraint Assertions (REQ 14) =====================
;; The patient must NOT have acute graft-versus-host disease AND must NOT have chronic graft-versus-host disease.
(assert
  (! (and (not patient_has_finding_of_acute_graft_versus_host_disease_now)
          (not patient_has_finding_of_chronic_graft_versus_host_disease_now))
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (NOT have acute graft-versus-host disease) AND (NOT have chronic graft-versus-host disease)."

;; ===================== Declarations for the criterion (REQ 15) =====================
(declare-const patient_has_condition_that_would_preclude_study_compliance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition that would preclude study compliance.","when_to_set_to_false":"Set to false if the patient currently does not have any condition that would preclude study compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any condition that would preclude study compliance.","meaning":"Boolean indicating whether the patient currently has any condition that would preclude study compliance."} ;; "the patient must NOT have condition that would preclude study compliance"
(declare-const patient_has_condition_that_would_preclude_study_compliance_now@@would_preclude_study_compliance Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current condition would preclude study compliance.","when_to_set_to_false":"Set to false if the patient's current condition would not preclude study compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current condition would preclude study compliance.","meaning":"Boolean indicating whether the patient's current condition would preclude study compliance."} ;; "the patient must NOT have condition that would preclude study compliance"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_condition_that_would_preclude_study_compliance_now@@would_preclude_study_compliance
         patient_has_condition_that_would_preclude_study_compliance_now)
     :named REQ15_AUXILIARY0)) ;; "the patient must NOT have condition that would preclude study compliance"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Inclusion: patient must NOT have condition that would preclude study compliance
(assert
  (! (not patient_has_condition_that_would_preclude_study_compliance_now)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT have condition that would preclude study compliance"

;; ===================== Declarations for the criterion (REQ 16) =====================
(declare-const patient_has_undergone_allogeneic_peripheral_blood_stem_cell_transplant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone allogeneic peripheral blood stem cell transplantation at any time in the past (prior to study inclusion).","when_to_set_to_false":"Set to false if the patient has never undergone allogeneic peripheral blood stem cell transplantation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone allogeneic peripheral blood stem cell transplantation in the past.","meaning":"Boolean indicating whether the patient has ever undergone allogeneic peripheral blood stem cell transplantation at any time in the past."} ;; "allogeneic peripheral blood stem cell transplantation"
(declare-const patient_has_undergone_allogeneic_bone_marrow_transplantation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone allogeneic bone marrow transplantation at any time in the past (prior to study inclusion).","when_to_set_to_false":"Set to false if the patient has never undergone allogeneic bone marrow transplantation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone allogeneic bone marrow transplantation in the past.","meaning":"Boolean indicating whether the patient has ever undergone allogeneic bone marrow transplantation at any time in the past."} ;; "allogeneic bone marrow transplantation"

;; ===================== Constraint Assertions (REQ 16) =====================
;; The patient must NOT have had prior allogeneic peripheral blood stem cell transplantation AND must NOT have had prior allogeneic bone marrow transplantation.
(assert
  (! (and (not patient_has_undergone_allogeneic_peripheral_blood_stem_cell_transplant_inthehistory)
          (not patient_has_undergone_allogeneic_bone_marrow_transplantation_inthehistory))
     :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (NOT have had prior allogeneic peripheral blood stem cell transplantation) AND (NOT have had prior allogeneic bone marrow transplantation)."

;; ===================== Declarations for the criterion (REQ 17) =====================
(declare-const patient_is_taking_interferon_alfa_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any interferon alfa-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any interferon alfa-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any interferon alfa-containing product.","meaning":"Boolean indicating whether the patient is currently taking any interferon alfa-containing product."} ;; "interferon alfa"
(declare-const patient_is_taking_interferon_alfa_containing_product_now@@concurrent_with_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any interferon alfa-containing product at the same time as participating in the study.","when_to_set_to_false":"Set to false if the patient is currently taking interferon alfa-containing product but not concurrently with study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current use of interferon alfa-containing product is concurrent with study participation.","meaning":"Boolean indicating whether the patient's current use of interferon alfa-containing product is concurrent with study participation."} ;; "concurrent interferon alfa"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_taking_interferon_alfa_containing_product_now@@concurrent_with_study_participation
         patient_is_taking_interferon_alfa_containing_product_now)
     :named REQ17_AUXILIARY0)) ;; "concurrent interferon alfa" implies "interferon alfa"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Component 0: To be included, the patient must NOT be receiving concurrent interferon alfa.
(assert
  (! (not patient_is_taking_interferon_alfa_containing_product_now@@concurrent_with_study_participation)
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT be receiving concurrent interferon alfa"

;; ===================== Declarations for the criterion (REQ 18) =====================
(declare-const patient_has_undergone_solid_organ_transplant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a solid organ transplantation procedure at any time in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone a solid organ transplantation procedure at any time in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a solid organ transplantation procedure at any time in the past.","meaning":"Boolean indicating whether the patient has ever undergone a solid organ transplantation procedure at any time in the past (up to now)." } ;; "the patient must NOT have had prior solid organ transplantation"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
  (! (not patient_has_undergone_solid_organ_transplant_inthehistory)
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have had prior solid organ transplantation."

;; ===================== Declarations for the criterion (REQ 19) =====================
(declare-const patient_is_exposed_to_voriconazole_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to voriconazole at any time in their history, including any administration prior to study inclusion.","when_to_set_to_false":"Set to false if the patient has never been exposed to voriconazole at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to voriconazole.","meaning":"Boolean indicating whether the patient has ever been exposed to voriconazole at any time in their history."} ;; "the patient may have had prior voriconazole administration"

;; ===================== Constraint Assertions (REQ 19) =====================
;; This requirement is always satisfiable (the patient may or may not have had prior voriconazole administration)
(assert
  (! true
     :named REQ19_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the criterion (REQ 20) =====================
(declare-const patient_is_exposed_to_astemizole_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to astemizole in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to astemizole in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to astemizole in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to astemizole in the past."} ;; "prior administration of astemizole"
(declare-const patient_is_exposed_to_astemizole_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to astemizole.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to astemizole.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to astemizole is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to astemizole."} ;; "at least 24 hours since prior administration of astemizole"

(declare-const patient_is_exposed_to_cisapride_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to cisapride in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to cisapride in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to cisapride in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to cisapride in the past."} ;; "prior administration of cisapride"
(declare-const patient_is_exposed_to_cisapride_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to cisapride.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to cisapride.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to cisapride is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to cisapride."} ;; "at least 24 hours since prior administration of cisapride"

(declare-const patient_is_exposed_to_pimozide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to pimozide in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to pimozide in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to pimozide in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to pimozide in the past."} ;; "prior administration of pimozide"
(declare-const patient_is_exposed_to_pimozide_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to pimozide.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to pimozide.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to pimozide is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to pimozide."} ;; "at least 24 hours since prior administration of pimozide"

(declare-const patient_is_exposed_to_quinidine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to quinidine in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to quinidine in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to quinidine in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to quinidine in the past."} ;; "prior administration of quinidine"
(declare-const patient_is_exposed_to_quinidine_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to quinidine.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to quinidine.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to quinidine is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to quinidine."} ;; "at least 24 hours since prior administration of quinidine"

(declare-const patient_is_exposed_to_sirolimus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to sirolimus in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to sirolimus in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to sirolimus in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to sirolimus in the past."} ;; "prior administration of sirolimus"
(declare-const patient_is_exposed_to_sirolimus_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to sirolimus.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to sirolimus.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to sirolimus is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to sirolimus."} ;; "at least 24 hours since prior administration of sirolimus"

(declare-const patient_is_exposed_to_terfenadine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to terfenadine in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to terfenadine in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to terfenadine in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to terfenadine in the past."} ;; "prior administration of terfenadine"
(declare-const patient_is_exposed_to_terfenadine_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to terfenadine.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to terfenadine.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to terfenadine is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to terfenadine."} ;; "at least 24 hours since prior administration of terfenadine"

(declare-const patient_is_exposed_to_rifabutin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to rifabutin in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to rifabutin in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to rifabutin in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to rifabutin in the past."} ;; "prior administration of rifabutin"
(declare-const patient_is_exposed_to_rifabutin_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to rifabutin.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to rifabutin.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to rifabutin is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to rifabutin."} ;; "at least 24 hours since prior administration of rifabutin"

(declare-const patient_is_exposed_to_ergot_alkaloid_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to ergot alkaloid in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to ergot alkaloid in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to ergot alkaloid in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to ergot alkaloid in the past."} ;; "prior administration of ergot alkaloid"
(declare-const patient_is_exposed_to_ergot_alkaloid_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to ergot alkaloid.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to ergot alkaloid.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to ergot alkaloid is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to ergot alkaloid."} ;; "at least 24 hours since prior administration of ergot alkaloid"

(declare-const patient_is_exposed_to_sildenafil_citrate_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to sildenafil citrate in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to sildenafil citrate in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to sildenafil citrate in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to sildenafil citrate in the past."} ;; "prior administration of sildenafil citrate"
(declare-const patient_is_exposed_to_sildenafil_citrate_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to sildenafil citrate.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to sildenafil citrate.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to sildenafil citrate is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to sildenafil citrate."} ;; "at least 24 hours since prior administration of sildenafil citrate"

(declare-const patient_is_exposed_to_amiodarone_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to amiodarone in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to amiodarone in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to amiodarone in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to amiodarone in the past."} ;; "prior administration of amiodarone"
(declare-const patient_is_exposed_to_amiodarone_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to amiodarone.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to amiodarone.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to amiodarone is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to amiodarone."} ;; "at least 24 hours since prior administration of amiodarone"

(declare-const patient_is_exposed_to_flecainide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to flecainide in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to flecainide in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to flecainide in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to flecainide in the past."} ;; "prior administration of flecainide"
(declare-const patient_is_exposed_to_flecainide_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to flecainide.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to flecainide.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to flecainide is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to flecainide."} ;; "at least 24 hours since prior administration of flecainide"

(declare-const patient_is_exposed_to_lidocaine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to systemic lidocaine in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to systemic lidocaine in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to systemic lidocaine in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to systemic lidocaine in the past."} ;; "prior administration of systemic lidocaine"
(declare-const patient_is_exposed_to_lidocaine_inthehistory@@at_least_24_hours_since_prior_administration Bool) ;; {"when_to_set_to_true":"Set to true if at least 24 hours have elapsed since the patient's most recent prior exposure to systemic lidocaine.","when_to_set_to_false":"Set to false if less than 24 hours have elapsed since the patient's most recent prior exposure to systemic lidocaine.","when_to_set_to_null":"Set to null if the elapsed time since prior exposure to systemic lidocaine is unknown or indeterminate.","meaning":"Boolean indicating whether at least 24 hours have elapsed since the patient's most recent prior exposure to systemic lidocaine."} ;; "at least 24 hours since prior administration of systemic lidocaine"

;; ===================== Constraint Assertions (REQ 20) =====================
;; The patient must have had at least 24 hours since prior administration of any of the following drugs:
;; astemizole, cisapride, pimozide, quinidine, sirolimus, terfenadine, rifabutin, ergot alkaloid, sildenafil citrate, amiodarone, flecainide, systemic lidocaine.
(assert
  (! (or patient_is_exposed_to_astemizole_inthehistory@@at_least_24_hours_since_prior_administration
         patient_is_exposed_to_cisapride_inthehistory@@at_least_24_hours_since_prior_administration
         patient_is_exposed_to_pimozide_inthehistory@@at_least_24_hours_since_prior_administration
         patient_is_exposed_to_quinidine_inthehistory@@at_least_24_hours_since_prior_administration
         patient_is_exposed_to_sirolimus_inthehistory@@at_least_24_hours_since_prior_administration
         patient_is_exposed_to_terfenadine_inthehistory@@at_least_24_hours_since_prior_administration
         patient_is_exposed_to_rifabutin_inthehistory@@at_least_24_hours_since_prior_administration
         patient_is_exposed_to_ergot_alkaloid_inthehistory@@at_least_24_hours_since_prior_administration
         patient_is_exposed_to_sildenafil_citrate_inthehistory@@at_least_24_hours_since_prior_administration
         patient_is_exposed_to_amiodarone_inthehistory@@at_least_24_hours_since_prior_administration
         patient_is_exposed_to_flecainide_inthehistory@@at_least_24_hours_since_prior_administration
         patient_is_exposed_to_lidocaine_inthehistory@@at_least_24_hours_since_prior_administration)
     :named REQ20_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have had at least 24 hours since prior administration of [list of drugs]"

;; ===================== Declarations for the criterion (REQ 21) =====================
(declare-const days_since_last_administration_of_long_acting_barbiturate_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's last administration of a long-acting barbiturate, measured at the current timepoint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have passed since the patient's last administration of a long-acting barbiturate.","meaning":"Numeric value representing the number of days since the patient's last administration of a long-acting barbiturate, measured now, in days."} ;; "more than 14 days since prior administration of long-acting barbiturate"
(declare-const days_since_last_administration_of_carbamazepine_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's last administration of carbamazepine, measured at the current timepoint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have passed since the patient's last administration of carbamazepine.","meaning":"Numeric value representing the number of days since the patient's last administration of carbamazepine, measured now, in days."} ;; "more than 14 days since prior administration of carbamazepine"
(declare-const days_since_last_administration_of_rifampin_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's last administration of rifampin, measured at the current timepoint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have passed since the patient's last administration of rifampin.","meaning":"Numeric value representing the number of days since the patient's last administration of rifampin, measured now, in days."} ;; "more than 14 days since prior administration of rifampin"

;; ===================== Constraint Assertions (REQ 21) =====================
;; The patient must have had more than 14 days since prior administration of long-acting barbiturate OR carbamazepine OR rifampin
(assert
  (! (or
        (> days_since_last_administration_of_long_acting_barbiturate_value_recorded_now_in_days 14)
        (> days_since_last_administration_of_carbamazepine_value_recorded_now_in_days 14)
        (> days_since_last_administration_of_rifampin_value_recorded_now_in_days 14)
     )
     :named REQ21_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have had more than 14 days since prior administration of long-acting barbiturate or prior administration of carbamazepine or prior administration of rifampin."

;; ===================== Declarations for the criterion (REQ 22) =====================
(declare-const patient_is_exposed_to_antifungal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any antifungal substance.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any antifungal substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any antifungal substance.","meaning":"Boolean indicating whether the patient is currently exposed to any antifungal substance."} ;; "antifungal"
(declare-const patient_is_exposed_to_antifungal_now@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the antifungal substance the patient is currently exposed to is systemic.","when_to_set_to_false":"Set to false if the antifungal substance the patient is currently exposed to is not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antifungal substance is systemic.","meaning":"Boolean indicating whether the antifungal exposure is to a systemic antifungal drug."} ;; "systemic antifungal drug"
(declare-const patient_is_exposed_to_antifungal_now@@concurrent_with_study_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the antifungal exposure is concurrent with the study treatment.","when_to_set_to_false":"Set to false if the antifungal exposure is not concurrent with the study treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antifungal exposure is concurrent with the study treatment.","meaning":"Boolean indicating whether the antifungal exposure is concurrent with the study treatment."} ;; "concurrent systemic antifungal drug"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_is_exposed_to_antifungal_now@@systemic
         patient_is_exposed_to_antifungal_now)
     :named REQ22_AUXILIARY0)) ;; If systemic antifungal exposure, then antifungal exposure

(assert
  (! (=> patient_is_exposed_to_antifungal_now@@concurrent_with_study_treatment
         patient_is_exposed_to_antifungal_now)
     :named REQ22_AUXILIARY1)) ;; If concurrent antifungal exposure, then antifungal exposure

;; ===================== Constraint Assertions (REQ 22) =====================
;; The patient must NOT be receiving other concurrent systemic antifungal drug.
(assert
  (! (not (and patient_is_exposed_to_antifungal_now@@systemic
               patient_is_exposed_to_antifungal_now@@concurrent_with_study_treatment))
     :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT be receiving other concurrent systemic antifungal drug."

;; ===================== Declarations for the criterion (REQ 23) =====================
(declare-const patient_is_receiving_other_concurrent_investigational_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving an investigational agent that is not the study agent and is being administered concurrently with the study treatment.","when_to_set_to_false":"Set to false if the patient is not currently receiving any other investigational agent concurrently with the study treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving another investigational agent concurrently with the study treatment.","meaning":"Boolean indicating whether the patient is currently receiving another investigational agent concurrently with the study treatment."} ;; "the patient must NOT be receiving other concurrent investigational agent"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
  (! (not patient_is_receiving_other_concurrent_investigational_agent_now)
     :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT be receiving other concurrent investigational agent"
