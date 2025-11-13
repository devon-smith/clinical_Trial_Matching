;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_chronic_pulmonary_symptoms_duration_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks the patient's chronic pulmonary symptoms have lasted, if known and documented.","when_to_set_to_null":"Set to null if the duration of the patient's chronic pulmonary symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in weeks of the patient's chronic pulmonary symptoms."} // "chronic pulmonary symptoms lasting ≥ six weeks"
(declare-const patient_has_chronic_systemic_symptoms_duration_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks the patient's chronic systemic symptoms have lasted, if known and documented.","when_to_set_to_null":"Set to null if the duration of the patient's chronic systemic symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in weeks of the patient's chronic systemic symptoms."} // "chronic systemic symptoms lasting ≥ six weeks"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or (>= patient_has_chronic_pulmonary_symptoms_duration_in_weeks 6.0)
         (>= patient_has_chronic_systemic_symptoms_duration_in_weeks 6.0))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "chronic pulmonary symptoms lasting ≥ six weeks OR chronic systemic symptoms lasting ≥ six weeks"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_lesion_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of lesion of lung (pulmonary lesion) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of lesion of lung (pulmonary lesion) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of lesion of lung (pulmonary lesion).","meaning":"Boolean indicating whether the patient has ever had a lesion of lung (pulmonary lesion) in their history."} // "pulmonary lesions"
(declare-const patient_has_finding_of_lesion_of_lung_inthehistory@@slowly_progressive_over_weeks_to_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a lesion of lung (pulmonary lesion) in their history and the lesion is slowly progressive and present over weeks to months.","when_to_set_to_false":"Set to false if the patient has ever had a lesion of lung (pulmonary lesion) in their history but the lesion is not slowly progressive or not present over weeks to months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion of lung (pulmonary lesion) is slowly progressive and present over weeks to months.","meaning":"Boolean indicating whether the patient's pulmonary lesion is slowly progressive and present over weeks to months."} // "slowly progressive pulmonary lesions over weeks to months"
(declare-const patient_has_finding_of_pulmonary_cavity_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary cavity in the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary cavity in the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary cavity in the lung.","meaning":"Boolean indicating whether the patient currently has a pulmonary cavity in the lung."} // "pulmonary cavities"
(declare-const patient_has_finding_of_pulmonary_cavity_of_lung_now@@surrounded_by_pulmonary_inflammation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pulmonary cavity in the lung is surrounded by pulmonary inflammation.","when_to_set_to_false":"Set to false if the patient's current pulmonary cavity in the lung is not surrounded by pulmonary inflammation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pulmonary cavity in the lung is surrounded by pulmonary inflammation.","meaning":"Boolean indicating whether the patient's current pulmonary cavity in the lung is surrounded by pulmonary inflammation."} // "pulmonary cavities with surrounding pulmonary inflammation"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_lesion_of_lung_inthehistory@@slowly_progressive_over_weeks_to_months
         patient_has_finding_of_lesion_of_lung_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "slowly progressive pulmonary lesions over weeks to months" implies "pulmonary lesions"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_pulmonary_cavity_of_lung_now@@surrounded_by_pulmonary_inflammation
         patient_has_finding_of_pulmonary_cavity_of_lung_now)
     :named REQ1_AUXILIARY1)) ;; "pulmonary cavity surrounded by pulmonary inflammation" implies "pulmonary cavity"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have evidence of slowly progressive pulmonary lesions over weeks to months, including pulmonary cavities with surrounding pulmonary inflammation
(assert
  (! (and patient_has_finding_of_lesion_of_lung_inthehistory@@slowly_progressive_over_weeks_to_months
          patient_has_finding_of_pulmonary_cavity_of_lung_now@@surrounded_by_pulmonary_inflammation)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "evidence of slowly progressive pulmonary lesions over weeks to months, including pulmonary cavities with surrounding pulmonary inflammation"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_mass_of_body_structure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mass of body structure.","when_to_set_to_false":"Set to false if the patient currently does not have a mass of body structure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mass of body structure.","meaning":"Boolean indicating whether the patient currently has a mass of body structure."} // "mass"
(declare-const patient_has_finding_of_mass_of_body_structure_now@@intracavitary Bool) ;; {"when_to_set_to_true":"Set to true if the mass of body structure is intracavitary.","when_to_set_to_false":"Set to false if the mass of body structure is not intracavitary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mass of body structure is intracavitary.","meaning":"Boolean indicating whether the mass of body structure is intracavitary."} // "intracavitary mass"
(declare-const patient_has_finding_of_mass_of_body_structure_now@@has_surrounding_crescent_of_air Bool) ;; {"when_to_set_to_true":"Set to true if the mass of body structure has a surrounding crescent of air.","when_to_set_to_false":"Set to false if the mass of body structure does not have a surrounding crescent of air.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mass of body structure has a surrounding crescent of air.","meaning":"Boolean indicating whether the mass of body structure has a surrounding crescent of air."} // "surrounding crescent of air"
(declare-const patient_has_finding_of_increased_thickness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased thickness (pleural thickening).","when_to_set_to_false":"Set to false if the patient currently does not have increased thickness (pleural thickening).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased thickness (pleural thickening).","meaning":"Boolean indicating whether the patient currently has increased thickness (pleural thickening)."} // "pleural thickening"
(declare-const patient_has_finding_of_lesion_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion of lung (pulmonary lesion).","when_to_set_to_false":"Set to false if the patient currently does not have a lesion of lung (pulmonary lesion).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lesion of lung (pulmonary lesion).","meaning":"Boolean indicating whether the patient currently has a lesion of lung (pulmonary lesion)."} // "pulmonary lesions"
(declare-const patient_has_finding_of_lesion_of_lung_now@@peripheral Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion of lung (pulmonary lesion) located in the peripheral region of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a lesion of lung (pulmonary lesion) located in the peripheral region of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lesion of lung (pulmonary lesion) located in the peripheral region of the lung.","meaning":"Boolean indicating whether the patient currently has a lesion of lung (pulmonary lesion) located in the peripheral region of the lung."} // "peripheral pulmonary lesions"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_mass_of_body_structure_now@@intracavitary
         patient_has_finding_of_mass_of_body_structure_now)
     :named REQ2_AUXILIARY0)) ;; "intracavitary mass"

(assert
  (! (=> patient_has_finding_of_mass_of_body_structure_now@@has_surrounding_crescent_of_air
         patient_has_finding_of_mass_of_body_structure_now)
     :named REQ2_AUXILIARY1)) ;; "mass with surrounding crescent of air"

(assert
  (! (=> patient_has_finding_of_lesion_of_lung_now@@peripheral
         patient_has_finding_of_lesion_of_lung_now)
     :named REQ2_AUXILIARY2)) ;; "peripheral pulmonary lesions"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must have an intracavitary mass with a surrounding crescent of air
(assert
  (! (and patient_has_finding_of_mass_of_body_structure_now@@intracavitary
          patient_has_finding_of_mass_of_body_structure_now@@has_surrounding_crescent_of_air)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "an intracavitary mass with a surrounding crescent of air"

;; Component 1: patient must have pleural thickening in peripheral pulmonary lesions
(assert
  (! (and patient_has_finding_of_increased_thickness_now
          patient_has_finding_of_lesion_of_lung_now@@peripheral)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "pleural thickening in peripheral pulmonary lesions"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_aspergillus_fumigatus_1_precipitin_level_now_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone the aspergillus precipitin test now and the result is positive.","when_to_set_to_false":"Set to false if the patient has undergone the aspergillus precipitin test now and the result is not positive, or if the test was not performed now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone the aspergillus precipitin test now and the result is positive.","meaning":"Boolean indicating whether the patient has undergone the aspergillus precipitin test now and the result is positive."} // "a positive result in the aspergillus precipitin test"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_undergone_aspergillus_fumigatus_1_precipitin_level_now_outcome_is_positive
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a positive result in the aspergillus precipitin test."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_hyphae_of_kingdom_fungi_detected_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has demonstration of hyphae of kingdom fungi detected.","when_to_set_to_false":"Set to false if the patient currently does not have demonstration of hyphae of kingdom fungi detected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has demonstration of hyphae of kingdom fungi detected.","meaning":"Boolean indicating whether the patient currently has demonstration of hyphae of kingdom fungi detected."} // "demonstration of aspergillus hyphae in sputum OR demonstration of aspergillus hyphae in bronchoalveolar lavage fluid"
(declare-const patient_has_finding_of_hyphae_of_kingdom_fungi_detected_now@@specimen_is_sputum Bool) ;; {"when_to_set_to_true":"Set to true if the demonstration of hyphae of kingdom fungi detected is in sputum.","when_to_set_to_false":"Set to false if the demonstration of hyphae of kingdom fungi detected is not in sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the demonstration of hyphae of kingdom fungi detected is in sputum.","meaning":"Boolean indicating whether the demonstration of hyphae of kingdom fungi detected is in sputum."} // "demonstration of aspergillus hyphae in sputum"
(declare-const patient_has_finding_of_hyphae_of_kingdom_fungi_detected_now@@specimen_is_bronchoalveolar_lavage_fluid Bool) ;; {"when_to_set_to_true":"Set to true if the demonstration of hyphae of kingdom fungi detected is in bronchoalveolar lavage fluid.","when_to_set_to_false":"Set to false if the demonstration of hyphae of kingdom fungi detected is not in bronchoalveolar lavage fluid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the demonstration of hyphae of kingdom fungi detected is in bronchoalveolar lavage fluid.","meaning":"Boolean indicating whether the demonstration of hyphae of kingdom fungi detected is in bronchoalveolar lavage fluid."} // "demonstration of aspergillus hyphae in bronchoalveolar lavage fluid"
(declare-const patient_has_finding_of_bronchoalveolar_lavage_fluid_culture_positive_for_aspergillus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bronchoalveolar lavage fluid culture positive for aspergillus species.","when_to_set_to_false":"Set to false if the patient currently does not have a bronchoalveolar lavage fluid culture positive for aspergillus species.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a bronchoalveolar lavage fluid culture positive for aspergillus species.","meaning":"Boolean indicating whether the patient currently has a bronchoalveolar lavage fluid culture positive for aspergillus species."} // "cultures of bronchoalveolar lavage fluid growing aspergillus species"
(declare-const patient_has_finding_of_sputum_culture_positive_for_aspergillus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sputum culture positive for aspergillus species.","when_to_set_to_false":"Set to false if the patient currently does not have a sputum culture positive for aspergillus species.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sputum culture positive for aspergillus species.","meaning":"Boolean indicating whether the patient currently has a sputum culture positive for aspergillus species."} // "cultures of sputum growing aspergillus species"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_hyphae_of_kingdom_fungi_detected_now@@specimen_is_sputum
         patient_has_finding_of_hyphae_of_kingdom_fungi_detected_now)
     :named REQ4_AUXILIARY0)) ;; "demonstration of aspergillus hyphae in sputum"

(assert
  (! (=> patient_has_finding_of_hyphae_of_kingdom_fungi_detected_now@@specimen_is_bronchoalveolar_lavage_fluid
         patient_has_finding_of_hyphae_of_kingdom_fungi_detected_now)
     :named REQ4_AUXILIARY1)) ;; "demonstration of aspergillus hyphae in bronchoalveolar lavage fluid"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (or patient_has_finding_of_hyphae_of_kingdom_fungi_detected_now@@specimen_is_sputum
         patient_has_finding_of_hyphae_of_kingdom_fungi_detected_now@@specimen_is_bronchoalveolar_lavage_fluid
         patient_has_finding_of_bronchoalveolar_lavage_fluid_culture_positive_for_aspergillus_now
         patient_has_finding_of_sputum_culture_positive_for_aspergillus_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "demonstration of aspergillus hyphae in sputum OR demonstration of aspergillus hyphae in bronchoalveolar lavage fluid OR cultures of bronchoalveolar lavage fluid growing aspergillus species OR cultures of sputum growing aspergillus species"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_meets_clinical_symptom_criterion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets at least one clinical symptom criterion relevant to the eligibility requirement.","when_to_set_to_false":"Set to false if the patient currently does not meet any clinical symptom criterion relevant to the eligibility requirement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets any clinical symptom criterion.","meaning":"Boolean indicating whether the patient currently meets at least one clinical symptom criterion relevant to the eligibility requirement."} // "at least one clinical symptom criterion"
(declare-const patient_has_finding_of_radiologic_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any radiological finding relevant to the eligibility criteria (i.e., evidence of slowly progressive pulmonary lesions or presence of an intracavitary mass with a surrounding crescent of air and pleural thickening).","when_to_set_to_false":"Set to false if the patient currently does not have any such radiological finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any such radiological finding.","meaning":"Boolean indicating whether the patient currently has any radiological finding relevant to the eligibility criteria."} // "at least one radiological finding (evidence of slowly progressive pulmonary lesions OR (presence of intracavitary mass with a surrounding crescent of air AND pleural thickening))"
(declare-const patient_meets_microbiological_criterion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets at least one microbiological criterion relevant to the eligibility requirement.","when_to_set_to_false":"Set to false if the patient currently does not meet any microbiological criterion relevant to the eligibility requirement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets any microbiological criterion.","meaning":"Boolean indicating whether the patient currently meets at least one microbiological criterion relevant to the eligibility requirement."} // "any of the microbiological criteria"
(declare-const patient_meets_immunological_criterion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets at least one immunological criterion relevant to the eligibility requirement.","when_to_set_to_false":"Set to false if the patient currently does not meet any immunological criterion relevant to the eligibility requirement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets any immunological criterion.","meaning":"Boolean indicating whether the patient currently meets at least one immunological criterion relevant to the eligibility requirement."} // "any of the immunological criteria"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: radiological finding is evidence of slowly progressive pulmonary lesions OR (presence of intracavitary mass with a surrounding crescent of air AND pleural thickening)
(assert
  (! (= patient_has_finding_of_radiologic_finding_now
        (or
          patient_has_finding_of_lesion_of_lung_inthehistory@@slowly_progressive_over_weeks_to_months
          (and
            patient_has_finding_of_mass_of_body_structure_now@@intracavitary
            patient_has_finding_of_mass_of_body_structure_now@@has_surrounding_crescent_of_air
            patient_has_finding_of_increased_thickness_now)))
     :named REQ5_AUXILIARY0)) ;; "at least one radiological finding (evidence of slowly progressive pulmonary lesions OR (presence of intracavitary mass with a surrounding crescent of air AND pleural thickening))"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must satisfy (at least one clinical symptom criterion OR at least one radiological finding OR any of the microbiological criteria OR any of the immunological criteria).
(assert
  (! (or
        patient_meets_clinical_symptom_criterion_now
        patient_has_finding_of_radiologic_finding_now
        patient_meets_microbiological_criterion_now
        patient_meets_immunological_criterion_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must satisfy (at least one clinical symptom criterion OR at least one radiological finding OR any of the microbiological criteria OR any of the immunological criteria)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_undergone_fine_needle_aspiration_cytology_from_cavity_wall Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone fine-needle aspiration cytology performed from the cavity wall.","when_to_set_to_false":"Set to false if the patient has not undergone fine-needle aspiration cytology performed from the cavity wall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone fine-needle aspiration cytology performed from the cavity wall.","meaning":"Boolean indicating whether the patient has undergone fine-needle aspiration cytology performed from the cavity wall."} // "fine-needle aspiration cytology from the cavity wall considered"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_undergone_fine_needle_aspiration_cytology_from_cavity_wall
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included in atypical cases, the patient must have fine-needle aspiration cytology from the cavity wall considered."
