;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (age ≥ 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_bacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bacterial pneumonia."} // "bacterial pneumonia"
(declare-const patient_has_diagnosis_of_bacterial_pneumonia_now@@meets_american_thoracic_society_infectious_diseases_society_of_america_criteria_for_community_acquired_bacterial_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of bacterial pneumonia meets ATS/IDSA criteria for community-acquired bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient's current diagnosis of bacterial pneumonia does not meet ATS/IDSA criteria for community-acquired bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis meets ATS/IDSA criteria for community-acquired bacterial pneumonia.","meaning":"Boolean indicating whether the patient's current diagnosis of bacterial pneumonia meets ATS/IDSA criteria for community-acquired bacterial pneumonia."} // "the diagnosis meets American Thoracic Society/Infectious Diseases Society of America (ATS/IDSA) criteria for community-acquired bacterial pneumonia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (if diagnosis meets ATS/IDSA criteria, then patient has diagnosis of bacterial pneumonia)
(assert
  (! (=> patient_has_diagnosis_of_bacterial_pneumonia_now@@meets_american_thoracic_society_infectious_diseases_society_of_america_criteria_for_community_acquired_bacterial_pneumonia
         patient_has_diagnosis_of_bacterial_pneumonia_now)
     :named REQ1_AUXILIARY0)) ;; "the diagnosis meets American Thoracic Society/Infectious Diseases Society of America (ATS/IDSA) criteria for community-acquired bacterial pneumonia" ⇒ "diagnosis of bacterial pneumonia"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have met ATS/IDSA criteria for community-acquired bacterial pneumonia.
(assert
  (! patient_has_diagnosis_of_bacterial_pneumonia_now@@meets_american_thoracic_society_infectious_diseases_society_of_america_criteria_for_community_acquired_bacterial_pneumonia
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have met American Thoracic Society/Infectious Diseases Society of America (ATS/IDSA) criteria for community-acquired bacterial pneumonia"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_community_acquired_bacterial_pneumonia_requiring_hospitalization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community-acquired bacterial pneumonia and this condition requires hospitalization.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community-acquired bacterial pneumonia or if the condition does not require hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community-acquired bacterial pneumonia requiring hospitalization.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community-acquired bacterial pneumonia that requires hospitalization."} // "community-acquired bacterial pneumonia requiring hospitalization"
(declare-const patient_has_received_intravenous_antimicrobial_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or has received treatment with an intravenous antimicrobial agent.","when_to_set_to_false":"Set to false if the patient is not currently receiving and has not received treatment with an intravenous antimicrobial agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or has received treatment with an intravenous antimicrobial agent.","meaning":"Boolean indicating whether the patient is currently receiving or has received treatment with an intravenous antimicrobial agent."} // "treatment with an intravenous antimicrobial agent"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: community-acquired bacterial pneumonia requiring hospitalization
(assert
  (! patient_has_diagnosis_of_community_acquired_bacterial_pneumonia_requiring_hospitalization_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "community-acquired bacterial pneumonia requiring hospitalization"

;; Component 1: treatment with an intravenous antimicrobial agent
(assert
  (! patient_has_received_intravenous_antimicrobial_agent_now
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "treatment with an intravenous antimicrobial agent"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const hospitalization_duration_anticipated_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours that the patient's hospitalization is anticipated to last, as estimated at the time of admission or eligibility assessment.","when_to_set_to_null":"Set to null if the anticipated duration of hospitalization is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the anticipated duration of the patient's hospitalization in hours."} // "anticipated hospitalization for > 48 hours"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> hospitalization_duration_anticipated_in_hours 48.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "anticipated hospitalization for > 48 hours"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_ceftaroline_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to ceftaroline at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to ceftaroline at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to ceftaroline.","meaning":"Boolean indicating whether the patient has ever been exposed to ceftaroline in their history."} // "received ceftaroline"
(declare-const patient_is_exposed_to_ceftaroline_inthehistory@@in_combination_with_macrolide_clarithromycin_or_azithromycin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to ceftaroline occurred in combination with a macrolide (clarithromycin or azithromycin).","when_to_set_to_false":"Set to false if the patient's exposure to ceftaroline did not occur in combination with a macrolide (clarithromycin or azithromycin).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ceftaroline exposure was in combination with a macrolide (clarithromycin or azithromycin).","meaning":"Boolean indicating whether the patient's ceftaroline exposure was in combination with a macrolide (clarithromycin or azithromycin)."} // "in combination with a macrolide (clarithromycin or azithromycin)"
(declare-const patient_is_exposed_to_ceftaroline_inthehistory@@temporalcontext_within_24_hours_after_presentation_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to ceftaroline occurred within the first 24 hours after presentation to the hospital.","when_to_set_to_false":"Set to false if the patient's exposure to ceftaroline did not occur within the first 24 hours after presentation to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ceftaroline exposure occurred within the first 24 hours after presentation to the hospital.","meaning":"Boolean indicating whether the patient's ceftaroline exposure occurred within the first 24 hours after presentation to the hospital."} // "within the first 24 hours after presentation to the hospital"
(declare-const patient_is_exposed_to_ceftaroline_inthehistory@@duration_greater_than_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to ceftaroline lasted for more than 48 hours.","when_to_set_to_false":"Set to false if the patient's exposure to ceftaroline did not last for more than 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ceftaroline exposure lasted for more than 48 hours.","meaning":"Boolean indicating whether the patient's ceftaroline exposure lasted for more than 48 hours."} // "for > 48 hours"
(declare-const patient_is_exposed_to_macrolide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any macrolide at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to any macrolide at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any macrolide.","meaning":"Boolean indicating whether the patient has ever been exposed to any macrolide in their history."} // "macrolide"
(declare-const patient_is_exposed_to_macrolide_inthehistory@@duration_greater_than_48_hours_within_first_24_hours_after_presentation_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any macrolide lasted for more than 48 hours and occurred within the first 24 hours after presentation to the hospital.","when_to_set_to_false":"Set to false if the patient's exposure to any macrolide did not last for more than 48 hours within the first 24 hours after presentation to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the macrolide exposure lasted for more than 48 hours within the first 24 hours after presentation to the hospital.","meaning":"Boolean indicating whether the patient's macrolide exposure lasted for more than 48 hours within the first 24 hours after presentation to the hospital."} // "macrolide for > 48 hours within the first 24 hours after presentation to the hospital"
(declare-const patient_is_exposed_to_clarithromycin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to clarithromycin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to clarithromycin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to clarithromycin.","meaning":"Boolean indicating whether the patient has ever been exposed to clarithromycin in their history."} // "clarithromycin"
(declare-const patient_is_exposed_to_clarithromycin_inthehistory@@in_combination_with_ceftaroline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to clarithromycin occurred in combination with ceftaroline.","when_to_set_to_false":"Set to false if the patient's exposure to clarithromycin did not occur in combination with ceftaroline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clarithromycin exposure was in combination with ceftaroline.","meaning":"Boolean indicating whether the patient's clarithromycin exposure was in combination with ceftaroline."} // "clarithromycin in combination with ceftaroline"
(declare-const patient_is_exposed_to_clarithromycin_inthehistory@@temporalcontext_within_24_hours_after_presentation_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to clarithromycin occurred within the first 24 hours after presentation to the hospital.","when_to_set_to_false":"Set to false if the patient's exposure to clarithromycin did not occur within the first 24 hours after presentation to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clarithromycin exposure occurred within the first 24 hours after presentation to the hospital.","meaning":"Boolean indicating whether the patient's clarithromycin exposure occurred within the first 24 hours after presentation to the hospital."} // "clarithromycin within the first 24 hours after presentation to the hospital"
(declare-const patient_is_exposed_to_clarithromycin_inthehistory@@duration_greater_than_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to clarithromycin lasted for more than 48 hours.","when_to_set_to_false":"Set to false if the patient's exposure to clarithromycin did not last for more than 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clarithromycin exposure lasted for more than 48 hours.","meaning":"Boolean indicating whether the patient's clarithromycin exposure lasted for more than 48 hours."} // "clarithromycin for > 48 hours"
(declare-const patient_is_exposed_to_azithromycin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to azithromycin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to azithromycin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to azithromycin.","meaning":"Boolean indicating whether the patient has ever been exposed to azithromycin in their history."} // "azithromycin"
(declare-const patient_is_exposed_to_azithromycin_inthehistory@@temporalcontext_within_24_hours_after_presentation_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to azithromycin occurred within the first 24 hours after presentation to the hospital.","when_to_set_to_false":"Set to false if the patient's exposure to azithromycin did not occur within the first 24 hours after presentation to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the azithromycin exposure occurred within the first 24 hours after presentation to the hospital.","meaning":"Boolean indicating whether the patient's azithromycin exposure occurred within the first 24 hours after presentation to the hospital."} // "azithromycin within the first 24 hours after presentation to the hospital"
(declare-const patient_is_exposed_to_azithromycin_inthehistory@@duration_greater_than_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to azithromycin lasted for more than 48 hours.","when_to_set_to_false":"Set to false if the patient's exposure to azithromycin did not last for more than 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the azithromycin exposure lasted for more than 48 hours.","meaning":"Boolean indicating whether the patient's azithromycin exposure lasted for more than 48 hours."} // "azithromycin for > 48 hours"
(declare-const therapy_duration_after_admission_in_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient remained on therapy after admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient remained on therapy after admission.","meaning":"Numeric value indicating the total duration in hours that the patient remained on therapy after admission."} // "remained on therapy for ≥ 48 hours after admission"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Exhaustive subcategories for macrolide: clarithromycin OR azithromycin
(assert
  (! (= patient_is_exposed_to_macrolide_inthehistory
        (or patient_is_exposed_to_clarithromycin_inthehistory
            patient_is_exposed_to_azithromycin_inthehistory))
     :named REQ4_AUXILIARY0)) ;; "macrolide (with exhaustive subcategories (clarithromycin OR azithromycin))"

;; Macrolide exposure for >48h within first 24h after presentation: definition
(assert
  (! (= patient_is_exposed_to_macrolide_inthehistory@@duration_greater_than_48_hours_within_first_24_hours_after_presentation_to_hospital
        (or
          (and patient_is_exposed_to_clarithromycin_inthehistory
               patient_is_exposed_to_clarithromycin_inthehistory@@duration_greater_than_48_hours
               patient_is_exposed_to_clarithromycin_inthehistory@@temporalcontext_within_24_hours_after_presentation_to_hospital)
          (and patient_is_exposed_to_azithromycin_inthehistory
               patient_is_exposed_to_azithromycin_inthehistory@@duration_greater_than_48_hours
               patient_is_exposed_to_azithromycin_inthehistory@@temporalcontext_within_24_hours_after_presentation_to_hospital)))
     :named REQ4_AUXILIARY1)) ;; "macrolide for > 48 hours within the first 24 hours after presentation to the hospital"

;; Ceftaroline in combination with macrolide (clarithromycin or azithromycin): definition
(assert
  (! (= patient_is_exposed_to_ceftaroline_inthehistory@@in_combination_with_macrolide_clarithromycin_or_azithromycin
        (or
          (and patient_is_exposed_to_ceftaroline_inthehistory
               patient_is_exposed_to_clarithromycin_inthehistory
               patient_is_exposed_to_clarithromycin_inthehistory@@in_combination_with_ceftaroline)
          (and patient_is_exposed_to_ceftaroline_inthehistory
               patient_is_exposed_to_azithromycin_inthehistory)))
     :named REQ4_AUXILIARY2)) ;; "received ceftaroline in combination with a macrolide (clarithromycin or azithromycin)"

;; Ceftaroline exposure for >48h within first 24h after presentation: definition
(assert
  (! (= patient_is_exposed_to_ceftaroline_inthehistory@@duration_greater_than_48_hours
        (and patient_is_exposed_to_ceftaroline_inthehistory
             patient_is_exposed_to_ceftaroline_inthehistory@@duration_greater_than_48_hours))
     :named REQ4_AUXILIARY3)) ;; "ceftaroline for > 48 hours"

;; Ceftaroline exposure within first 24h after presentation: definition
(assert
  (! (= patient_is_exposed_to_ceftaroline_inthehistory@@temporalcontext_within_24_hours_after_presentation_to_hospital
        (and patient_is_exposed_to_ceftaroline_inthehistory
             patient_is_exposed_to_ceftaroline_inthehistory@@temporalcontext_within_24_hours_after_presentation_to_hospital))
     :named REQ4_AUXILIARY4)) ;; "ceftaroline within the first 24 hours after presentation to the hospital"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: received ceftaroline in combination with a macrolide (clarithromycin or azithromycin) for > 48 hours within the first 24 hours after presentation to the hospital
(assert
  (! (and
        patient_is_exposed_to_ceftaroline_inthehistory
        patient_is_exposed_to_ceftaroline_inthehistory@@in_combination_with_macrolide_clarithromycin_or_azithromycin
        patient_is_exposed_to_ceftaroline_inthehistory@@duration_greater_than_48_hours
        patient_is_exposed_to_ceftaroline_inthehistory@@temporalcontext_within_24_hours_after_presentation_to_hospital
        patient_is_exposed_to_macrolide_inthehistory@@duration_greater_than_48_hours_within_first_24_hours_after_presentation_to_hospital)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "received ceftaroline in combination with a macrolide (clarithromycin or azithromycin) for > 48 hours within the first 24 hours after presentation to the hospital"

;; Component 1: remained on therapy for ≥ 48 hours after admission
(assert
  (! (>= therapy_duration_after_admission_in_hours 48.0)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "remained on therapy for ≥ 48 hours after admission"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_pneumonia_patient_outcomes_research_team_risk_class_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has PORT risk class III.","when_to_set_to_false":"Set to false if the patient currently does not have PORT risk class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has PORT risk class III.","meaning":"Boolean indicating whether the patient currently has PORT risk class III."} // "Pneumonia Patient Outcomes Research Team risk class III"
(declare-const patient_has_finding_of_pneumonia_patient_outcomes_research_team_risk_class_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has PORT risk class IV.","when_to_set_to_false":"Set to false if the patient currently does not have PORT risk class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has PORT risk class IV.","meaning":"Boolean indicating whether the patient currently has PORT risk class IV."} // "Pneumonia Patient Outcomes Research Team risk class IV"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (or patient_has_finding_of_pneumonia_patient_outcomes_research_team_risk_class_iii_now
         patient_has_finding_of_pneumonia_patient_outcomes_research_team_risk_class_iv_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (Pneumonia Patient Outcomes Research Team risk class III OR Pneumonia Patient Outcomes Research Team risk class IV)."
