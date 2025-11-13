;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_antibacterial_value_recorded_inthepast72hours_withunit_dose Real) ;; {"when_to_set_to_value":"Set to the number of doses of antibacterial the patient received in the past 72 hours.","when_to_set_to_null":"Set to null if the number of doses received in the past 72 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of doses of antibacterial received by the patient in the past 72 hours."} ;; "antibacterial"

(declare-const patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@route_oral Bool) ;; {"when_to_set_to_true":"Set to true if the antibacterial doses counted were administered orally.","when_to_set_to_false":"Set to false if the antibacterial doses counted were not administered orally.","when_to_set_to_null":"Set to null if the route of administration for the antibacterial doses is unknown or indeterminate.","meaning":"Boolean indicating whether the antibacterial doses counted were administered orally."} ;; "oral antibacterial"

(declare-const patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@route_intravenous Bool) ;; {"when_to_set_to_true":"Set to true if the antibacterial doses counted were administered intravenously.","when_to_set_to_false":"Set to false if the antibacterial doses counted were not administered intravenously.","when_to_set_to_null":"Set to null if the route of administration for the antibacterial doses is unknown or indeterminate.","meaning":"Boolean indicating whether the antibacterial doses counted were administered intravenously."} ;; "intravenous antibacterial"

(declare-const patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@short_acting Bool) ;; {"when_to_set_to_true":"Set to true if the antibacterial doses counted were of short-acting antibacterial.","when_to_set_to_false":"Set to false if the antibacterial doses counted were not of short-acting antibacterial.","when_to_set_to_null":"Set to null if the acting duration of the antibacterial doses is unknown or indeterminate.","meaning":"Boolean indicating whether the antibacterial doses counted were short-acting."} ;; "short-acting antibacterial"

(declare-const patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@indication_community_acquired_bacterial_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the antibacterial doses counted were given for community-acquired bacterial pneumonia.","when_to_set_to_false":"Set to false if the antibacterial doses counted were not given for community-acquired bacterial pneumonia.","when_to_set_to_null":"Set to null if the indication for the antibacterial doses is unknown or indeterminate.","meaning":"Boolean indicating whether the antibacterial doses counted were given for community-acquired bacterial pneumonia."} ;; "community-acquired bacterial pneumonia indication"

(declare-const patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@route_oral@@short_acting@@indication_community_acquired_bacterial_pneumonia Real) ;; {"when_to_set_to_value":"Set to the number of doses of short-acting oral antibacterial the patient received in the past 72 hours for community-acquired bacterial pneumonia.","when_to_set_to_null":"Set to null if the number of doses, acting duration, route, or indication is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of doses of short-acting oral antibacterial received by the patient in the past 72 hours for community-acquired bacterial pneumonia."} ;; "short-acting oral antibacterial for community-acquired bacterial pneumonia"

(declare-const patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@route_intravenous@@short_acting@@indication_community_acquired_bacterial_pneumonia Real) ;; {"when_to_set_to_value":"Set to the number of doses of short-acting intravenous antibacterial the patient received in the past 72 hours for community-acquired bacterial pneumonia.","when_to_set_to_null":"Set to null if the number of doses, acting duration, route, or indication is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of doses of short-acting intravenous antibacterial received by the patient in the past 72 hours for community-acquired bacterial pneumonia."} ;; "short-acting intravenous antibacterial for community-acquired bacterial pneumonia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: The number of short-acting oral antibacterial doses for community-acquired bacterial pneumonia in the past 72 hours
(assert
(! (and patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@route_oral
        patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@short_acting
        patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@indication_community_acquired_bacterial_pneumonia)
:named REQ0_AUXILIARY0)) ;; "short-acting oral antibacterial for community-acquired bacterial pneumonia within 72 hours before randomization"

;; Definition: The number of short-acting intravenous antibacterial doses for community-acquired bacterial pneumonia in the past 72 hours
(assert
(! (and patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@route_intravenous
        patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@short_acting
        patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@indication_community_acquired_bacterial_pneumonia)
:named REQ0_AUXILIARY1)) ;; "short-acting intravenous antibacterial for community-acquired bacterial pneumonia within 72 hours before randomization"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have received more than one dose of short-acting oral antibacterial for community-acquired bacterial pneumonia within 72 hours before randomization
(assert
(! (not (> patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@route_oral@@short_acting@@indication_community_acquired_bacterial_pneumonia 1))
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received more than one dose of a short-acting oral antibacterial for community-acquired bacterial pneumonia within seventy-two hours before randomization."

;; Exclusion: patient must NOT have received more than one dose of short-acting intravenous antibacterial for community-acquired bacterial pneumonia within 72 hours before randomization
(assert
(! (not (> patient_antibacterial_value_recorded_inthepast72hours_withunit_dose@@route_intravenous@@short_acting@@indication_community_acquired_bacterial_pneumonia 1))
:named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received more than one dose of a short-acting intravenous antibacterial for community-acquired bacterial pneumonia within seventy-two hours before randomization."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing systemic antibacterial therapy (antibiotic therapy) at this moment.","when_to_set_to_false":"Set to false if the patient is not currently undergoing systemic antibacterial therapy (antibiotic therapy) at this moment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing systemic antibacterial therapy (antibiotic therapy) at this moment.","meaning":"Boolean indicating whether the patient is currently undergoing systemic antibacterial therapy (antibiotic therapy) now."} ;; "systemic antibacterial therapy"
(declare-const patient_is_undergoing_antibiotic_therapy_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current antibiotic therapy is concomitant with the relevant study intervention or index event.","when_to_set_to_false":"Set to false if the patient's current antibiotic therapy is not concomitant with the relevant study intervention or index event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current antibiotic therapy is concomitant.","meaning":"Boolean indicating whether the patient's current antibiotic therapy is concomitant with the relevant context."} ;; "concomitant systemic antibacterial therapy"
(declare-const patient_is_undergoing_antibiotic_therapy_now@@potentially_effective_against_community_acquired_bacterial_pneumonia_pathogens Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current antibiotic therapy is potentially effective against community-acquired bacterial pneumonia pathogens.","when_to_set_to_false":"Set to false if the patient's current antibiotic therapy is not potentially effective against community-acquired bacterial pneumonia pathogens.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current antibiotic therapy is potentially effective against community-acquired bacterial pneumonia pathogens.","meaning":"Boolean indicating whether the patient's current antibiotic therapy is potentially effective against community-acquired bacterial pneumonia pathogens."} ;; "systemic antibacterial therapy potentially effective against community-acquired bacterial pneumonia pathogens"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_undergoing_antibiotic_therapy_now@@concomitant
      patient_is_undergoing_antibiotic_therapy_now)
:named REQ1_AUXILIARY0)) ;; "concomitant systemic antibacterial therapy"

(assert
(! (=> patient_is_undergoing_antibiotic_therapy_now@@potentially_effective_against_community_acquired_bacterial_pneumonia_pathogens
      patient_is_undergoing_antibiotic_therapy_now)
:named REQ1_AUXILIARY1)) ;; "systemic antibacterial therapy potentially effective against community-acquired bacterial pneumonia pathogens"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_is_undergoing_antibiotic_therapy_now@@concomitant
             patient_is_undergoing_antibiotic_therapy_now@@potentially_effective_against_community_acquired_bacterial_pneumonia_pathogens))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires concomitant systemic antibacterial therapy potentially effective against community-acquired bacterial pneumonia pathogens."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_been_hospitalized_for_gte_2_days_within_90_days_prior_to_onset_of_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been hospitalized for at least two days within ninety days prior to the onset of symptoms.","when_to_set_to_false":"Set to false if the patient has not been hospitalized for at least two days within ninety days prior to the onset of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been hospitalized for at least two days within ninety days prior to the onset of symptoms.","meaning":"Boolean indicating whether the patient has been hospitalized for greater than or equal to two days within ninety days prior to the onset of symptoms."} ;; "The patient has been hospitalized for greater than or equal to two days within ninety days prior to the onset of symptoms."

(declare-const patient_hospitalization_duration_within_90_days_prior_to_onset_of_symptoms_in_days Real) ;; {"when_to_set_to_value":"Set to the total number of days the patient was hospitalized within ninety days prior to the onset of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the patient was hospitalized within ninety days prior to the onset of symptoms.","meaning":"Numeric value indicating the total duration in days of the patient's hospitalization(s) within ninety days prior to the onset of symptoms."} ;; "hospitalization duration in days within ninety days prior to the onset of symptoms"

(declare-const patient_has_resided_in_nursing_home_within_30_days_prior_to_onset_of_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient has resided in a nursing home within thirty days prior to the onset of symptoms.","when_to_set_to_false":"Set to false if the patient has not resided in a nursing home within thirty days prior to the onset of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has resided in a nursing home within thirty days prior to the onset of symptoms.","meaning":"Boolean indicating whether the patient has resided in a nursing home within thirty days prior to the onset of symptoms."} ;; "The patient has resided in a nursing home within thirty days prior to the onset of symptoms."

(declare-const patient_has_resided_in_long_term_healthcare_facility_within_30_days_prior_to_onset_of_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient has resided in a long-term healthcare facility within thirty days prior to the onset of symptoms.","when_to_set_to_false":"Set to false if the patient has not resided in a long-term healthcare facility within thirty days prior to the onset of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has resided in a long-term healthcare facility within thirty days prior to the onset of symptoms.","meaning":"Boolean indicating whether the patient has resided in a long-term healthcare facility within thirty days prior to the onset of symptoms."} ;; "The patient has resided in a long-term healthcare facility within thirty days prior to the onset of symptoms."

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Link the boolean variable to the numeric duration for hospitalization
(assert
(! (= patient_has_been_hospitalized_for_gte_2_days_within_90_days_prior_to_onset_of_symptoms
     (>= patient_hospitalization_duration_within_90_days_prior_to_onset_of_symptoms_in_days 2))
:named REQ2_AUXILIARY0)) ;; "The patient has been hospitalized for greater than or equal to two days within ninety days prior to the onset of symptoms."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_been_hospitalized_for_gte_2_days_within_90_days_prior_to_onset_of_symptoms)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been hospitalized for greater than or equal to two days within ninety days prior to the onset of symptoms."

(assert
(! (not patient_has_resided_in_nursing_home_within_30_days_prior_to_onset_of_symptoms)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has resided in a nursing home within thirty days prior to the onset of symptoms."

(assert
(! (not patient_has_resided_in_long_term_healthcare_facility_within_30_days_prior_to_onset_of_symptoms)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has resided in a long-term healthcare facility within thirty days prior to the onset of symptoms."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_confirmed_community_acquired_bacterial_pneumonia_caused_by_pathogen_resistant_to_study_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has confirmed community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs.","when_to_set_to_false":"Set to false if the patient currently does not have confirmed community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has confirmed community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs.","meaning":"Boolean indicating whether the patient currently has confirmed community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs."} ;; "confirmed community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs"
(declare-const patient_has_suspected_community_acquired_bacterial_pneumonia_caused_by_pathogen_resistant_to_study_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suspected community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs.","when_to_set_to_false":"Set to false if the patient currently does not have suspected community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suspected community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs.","meaning":"Boolean indicating whether the patient currently has suspected community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs."} ;; "suspected community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs"
(declare-const patient_has_diagnosis_of_ventilator_associated_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ventilator-associated pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ventilator-associated pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ventilator-associated pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ventilator-associated pneumonia."} ;; "ventilator associated pneumonia"
(declare-const patient_has_diagnosis_of_hospital_acquired_bacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hospital-acquired bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hospital-acquired bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hospital-acquired bacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hospital-acquired bacterial pneumonia."} ;; "hospital acquired bacterial pneumonia"
(declare-const patient_has_diagnosis_of_bacterial_aspiration_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bacterial aspiration pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bacterial aspiration pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bacterial aspiration pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bacterial aspiration pneumonia."} ;; "bacterial aspiration pneumonia"
(declare-const patient_has_diagnosis_of_pneumocystis_jiroveci_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Pneumocystis jiroveci pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Pneumocystis jiroveci pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Pneumocystis jiroveci pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Pneumocystis jiroveci pneumonia."} ;; "Pneumocystis jiroveci pneumonia"
(declare-const patient_has_diagnosis_of_fungal_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of fungal pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of fungal pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of fungal pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of fungal pneumonia."} ;; "other fungal pneumonia"
(declare-const patient_has_diagnosis_of_viral_infection_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of viral infection of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of viral infection of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of viral infection of the lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of viral infection of the lung."} ;; "viral infection of the lung"
(declare-const patient_has_diagnosis_of_pulmonary_disease_due_to_mycobacteria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary disease due to mycobacteria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary disease due to mycobacteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary disease due to mycobacteria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary disease due to mycobacteria."} ;; "mycobacterial infection of the lung"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples for confirmed community-acquired bacterial pneumonia caused by resistant pathogen
;; "with non-exhaustive examples (Pseudomonas aeruginosa, any pathogen of the Enterobacteriaceae Family)"
;; These examples imply the umbrella term, but do not exhaust it.
;; For this requirement, we do not have atomic variables for "Pseudomonas aeruginosa" or "Enterobacteriaceae Family" in <new_variable_declarations>, so no auxiliary assertion is emitted for these examples.

;; Non-exhaustive examples for suspected community-acquired bacterial pneumonia caused by resistant pathogen
;; "with non-exhaustive examples (Pseudomonas aeruginosa, any pathogen of the Enterobacteriaceae Family)"
;; These examples imply the umbrella term, but do not exhaust it.
;; For this requirement, we do not have atomic variables for "Pseudomonas aeruginosa" or "Enterobacteriaceae Family" in <new_variable_declarations>, so no auxiliary assertion is emitted for these examples.

;; Non-exhaustive examples for etiologies other than community-acquired bacterial pneumonia pathogens
;; "with non-exhaustive examples (ventilator associated pneumonia, hospital acquired bacterial pneumonia, bacterial aspiration pneumonia, Pneumocystis jiroveci pneumonia, other fungal pneumonia, viral infection of the lung, mycobacterial infection of the lung)"
;; These examples imply the umbrella term, but do not exhaust it.
;; We do not have an umbrella variable for "community-acquired bacterial pneumonia attributable to etiologies other than community-acquired bacterial pneumonia pathogens", so no auxiliary assertion is emitted for these examples.

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have any of the following:
;; (1) confirmed community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs
;; (2) suspected community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs
;; (3) community-acquired bacterial pneumonia attributable to etiologies other than community-acquired bacterial pneumonia pathogens, with non-exhaustive examples:
;;     ventilator associated pneumonia, hospital acquired bacterial pneumonia, bacterial aspiration pneumonia, Pneumocystis jiroveci pneumonia, other fungal pneumonia, viral infection of the lung, mycobacterial infection of the lung

(assert
(! (not patient_has_confirmed_community_acquired_bacterial_pneumonia_caused_by_pathogen_resistant_to_study_drugs_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has confirmed community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs with non-exhaustive examples (Pseudomonas aeruginosa, any pathogen of the Enterobacteriaceae Family)."

(assert
(! (not patient_has_suspected_community_acquired_bacterial_pneumonia_caused_by_pathogen_resistant_to_study_drugs_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected community-acquired bacterial pneumonia caused by a pathogen known to be resistant to any of the study drugs with non-exhaustive examples (Pseudomonas aeruginosa, any pathogen of the Enterobacteriaceae Family)."

(assert
(! (not (or patient_has_diagnosis_of_ventilator_associated_pneumonia_now
            patient_has_diagnosis_of_hospital_acquired_bacterial_pneumonia_now
            patient_has_diagnosis_of_bacterial_aspiration_pneumonia_now
            patient_has_diagnosis_of_pneumocystis_jiroveci_pneumonia_now
            patient_has_diagnosis_of_fungal_pneumonia_now
            patient_has_diagnosis_of_viral_infection_of_lung_now
            patient_has_diagnosis_of_pulmonary_disease_due_to_mycobacteria_now))
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has community-acquired bacterial pneumonia attributable to etiologies other than community-acquired bacterial pneumonia pathogens with non-exhaustive examples (ventilator associated pneumonia, hospital acquired bacterial pneumonia, bacterial aspiration pneumonia, Pneumocystis jiroveci pneumonia, other fungal pneumonia, viral infection of the lung, mycobacterial infection of the lung)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has radiologic infiltrates of the lung (pulmonary infiltrates) on imaging, regardless of cause.","when_to_set_to_false":"Set to false if the patient currently does not have radiologic infiltrates of the lung (pulmonary infiltrates) on imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has radiologic infiltrates of the lung.","meaning":"Boolean indicating whether the patient currently has radiologic infiltrates of the lung (pulmonary infiltrates), regardless of etiology."} ;; "pulmonary infiltrates"

(declare-const patient_has_diagnosis_of_pulmonary_embolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary embolism."} ;; "pulmonary embolism"

(declare-const patient_has_diagnosis_of_pneumonitis_due_to_inhaled_substance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chemical pneumonitis due to inhaled substance (e.g., aspiration).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chemical pneumonitis due to inhaled substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chemical pneumonitis due to inhaled substance.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chemical pneumonitis due to inhaled substance."} ;; "chemical pneumonitis from aspiration"

(declare-const patient_has_diagnosis_of_extrinsic_allergic_alveolitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of extrinsic allergic alveolitis (hypersensitivity pneumonia).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of extrinsic allergic alveolitis (hypersensitivity pneumonia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of extrinsic allergic alveolitis (hypersensitivity pneumonia).","meaning":"Boolean indicating whether the patient currently has a diagnosis of extrinsic allergic alveolitis (hypersensitivity pneumonia)."} ;; "hypersensitivity pneumonia"

(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congestive heart failure."} ;; "congestive heart failure"

(declare-const patient_has_diagnosis_of_obstruction_of_bronchus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of obstruction of bronchus (bronchial obstruction).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of obstruction of bronchus (bronchial obstruction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of obstruction of bronchus (bronchial obstruction).","meaning":"Boolean indicating whether the patient currently has a diagnosis of obstruction of bronchus (bronchial obstruction)."} ;; "bronchial obstruction"

(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of lung (lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer)."} ;; "lung cancer"

(declare-const patient_has_diagnosis_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis."} ;; "cystic fibrosis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_pulmonary_embolism_now
          patient_has_diagnosis_of_pneumonitis_due_to_inhaled_substance_now
          patient_has_diagnosis_of_extrinsic_allergic_alveolitis_now
          patient_has_diagnosis_of_congestive_heart_failure_now
          patient_has_diagnosis_of_obstruction_of_bronchus_now
          patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now
          patient_has_diagnosis_of_cystic_fibrosis_now)
     patient_has_finding_of_radiologic_infiltrate_of_lung_now)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (pulmonary embolism, chemical pneumonitis from aspiration, hypersensitivity pneumonia, congestive heart failure, bronchial obstruction, lung cancer, cystic fibrosis)."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_diagnosis_of_pulmonary_embolism_now
            patient_has_diagnosis_of_pneumonitis_due_to_inhaled_substance_now
            patient_has_diagnosis_of_extrinsic_allergic_alveolitis_now
            patient_has_diagnosis_of_congestive_heart_failure_now
            patient_has_diagnosis_of_obstruction_of_bronchus_now
            patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now
            patient_has_diagnosis_of_cystic_fibrosis_now))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a noninfectious cause of pulmonary infiltrates with non-exhaustive examples (pulmonary embolism, chemical pneumonitis from aspiration, hypersensitivity pneumonia, congestive heart failure, bronchial obstruction, lung cancer, cystic fibrosis)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_empyema_of_pleura_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of empyema of pleura.","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of empyema of pleura.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of empyema of pleura.","meaning":"Boolean indicating whether the patient currently has a confirmed diagnosis of empyema of pleura."} ;; "confirmed pleural empyema"

(declare-const patient_has_suspicion_of_empyema_of_pleura_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently is suspected to have empyema of pleura.","when_to_set_to_false":"Set to false if the patient currently is not suspected to have empyema of pleura.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently is suspected to have empyema of pleura.","meaning":"Boolean indicating whether the patient currently is suspected to have empyema of pleura."} ;; "suspected pleural empyema"

(declare-const patient_has_finding_of_pleural_effusion_associated_with_pulmonary_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of pleural effusion associated with pulmonary infection.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of pleural effusion associated with pulmonary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of pleural effusion associated with pulmonary infection.","meaning":"Boolean indicating whether the patient currently has a finding of pleural effusion associated with pulmonary infection."} ;; "parapneumonic effusions"

(declare-const patient_has_finding_of_pleural_effusion_associated_with_pulmonary_infection_now@@sterile Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pleural effusion associated with pulmonary infection is sterile.","when_to_set_to_false":"Set to false if the patient's pleural effusion associated with pulmonary infection is not sterile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pleural effusion associated with pulmonary infection is sterile.","meaning":"Boolean indicating whether the patient's pleural effusion associated with pulmonary infection is sterile."} ;; "sterile parapneumonic effusions"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Sterile parapneumonic effusions are NOT considered pleural empyema
(assert
(! (not (and patient_has_finding_of_pleural_effusion_associated_with_pulmonary_infection_now
             patient_has_finding_of_pleural_effusion_associated_with_pulmonary_infection_now@@sterile))
:named REQ5_AUXILIARY0)) ;; "sterile parapneumonic effusions are NOT considered pleural empyema"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_empyema_of_pleura_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has confirmed pleural empyema."

(assert
(! (not patient_has_suspicion_of_empyema_of_pleura_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected pleural empyema."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing artificial respiration (mechanical ventilation).","when_to_set_to_false":"Set to false if the patient is currently not undergoing artificial respiration (mechanical ventilation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing artificial respiration (mechanical ventilation).","meaning":"Boolean indicating whether the patient is currently undergoing artificial respiration (mechanical ventilation)."} ;; "mechanical ventilation"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_undergoing_artificial_respiration_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires mechanical ventilation."
