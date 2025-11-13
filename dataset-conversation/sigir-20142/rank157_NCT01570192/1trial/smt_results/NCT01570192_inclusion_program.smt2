;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_or_legally_authorized_representative_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been provided by the patient or the legally authorized representative of the patient.","when_to_set_to_false":"Set to false if written informed consent has not been provided by the patient nor the legally authorized representative of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been provided by the patient or the legally authorized representative of the patient.","meaning":"Boolean indicating whether written informed consent has been provided by either the patient or the legally authorized representative of the patient."} ;; "To be included, the patient must have written informed consent provided by (the patient OR the legally authorized representative of the patient)."
(declare-const patient_or_legally_authorized_representative_has_provided_written_informed_consent@@written Bool) ;; {"when_to_set_to_true":"Set to true if the informed consent is written.","when_to_set_to_false":"Set to false if the informed consent is not written.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the informed consent is written.","meaning":"Boolean indicating whether the informed consent is written."} ;; "written informed consent"
(declare-const patient_or_legally_authorized_representative_has_provided_written_informed_consent@@provided_by_patient_or_legally_authorized_representative Bool) ;; {"when_to_set_to_true":"Set to true if the written informed consent is provided by the patient or the legally authorized representative of the patient.","when_to_set_to_false":"Set to false if the written informed consent is not provided by the patient nor the legally authorized representative of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the written informed consent is provided by the patient or the legally authorized representative of the patient.","meaning":"Boolean indicating whether the written informed consent is provided by the patient or the legally authorized representative of the patient."} ;; "provided by (the patient OR the legally authorized representative of the patient)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the main variable
(assert
  (! (=> (and patient_or_legally_authorized_representative_has_provided_written_informed_consent@@written
              patient_or_legally_authorized_representative_has_provided_written_informed_consent@@provided_by_patient_or_legally_authorized_representative)
         patient_or_legally_authorized_representative_has_provided_written_informed_consent)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have written informed consent provided by (the patient OR the legally authorized representative of the patient)."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_or_legally_authorized_representative_has_provided_written_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have written informed consent provided by (the patient OR the legally authorized representative of the patient)."

;; ===================== Declarations for the inclusion criteria (REQ 1) =====================
(declare-const patient_has_finding_of_patient_in_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized.","when_to_set_to_false":"Set to false if the patient is currently not hospitalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized."} ;; "To be included, the patient must be hospitalized."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "To be included, the patient must be aged ≥ 18 years."
(declare-const patient_has_finding_of_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory failure.","meaning":"Boolean indicating whether the patient currently has respiratory failure."} ;; "To be included, the patient must have respiratory failure."
(declare-const patient_has_finding_of_respiratory_failure_now@@requires_mechanical_ventilation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's respiratory failure requires mechanical ventilation.","when_to_set_to_false":"Set to false if the patient's respiratory failure does not require mechanical ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether mechanical ventilation is required for the patient's respiratory failure.","meaning":"Boolean indicating whether the patient's respiratory failure requires mechanical ventilation."} ;; "respiratory failure requiring mechanical ventilation"
(declare-const patient_has_suspicion_of_bacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical suspicion of bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have clinical suspicion of bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical suspicion of bacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has clinical suspicion of bacterial pneumonia."} ;; "clinical suspicion of hospital-acquired bacterial pneumonia" OR "clinical suspicion of ventilator-associated bacterial pneumonia"
(declare-const patient_has_suspicion_of_bacterial_pneumonia_now@@hospital_acquired_origin Bool) ;; {"when_to_set_to_true":"Set to true if the clinical suspicion of bacterial pneumonia is for hospital-acquired origin.","when_to_set_to_false":"Set to false if the clinical suspicion of bacterial pneumonia is not for hospital-acquired origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the origin is hospital-acquired.","meaning":"Boolean indicating whether the clinical suspicion of bacterial pneumonia is for hospital-acquired origin."} ;; "hospital-acquired bacterial pneumonia"
(declare-const patient_has_suspicion_of_bacterial_pneumonia_now@@ventilator_associated_origin Bool) ;; {"when_to_set_to_true":"Set to true if the clinical suspicion of bacterial pneumonia is for ventilator-associated origin.","when_to_set_to_false":"Set to false if the clinical suspicion of bacterial pneumonia is not for ventilator-associated origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the origin is ventilator-associated.","meaning":"Boolean indicating whether the clinical suspicion of bacterial pneumonia is for ventilator-associated origin."} ;; "ventilator-associated bacterial pneumonia"
(declare-const patient_has_suspicion_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical suspicion of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have clinical suspicion of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical suspicion of pneumonia.","meaning":"Boolean indicating whether the patient currently has clinical suspicion of pneumonia."} ;; "clinical suspicion of healthcare-associated pneumonia"
(declare-const patient_has_suspicion_of_pneumonia_now@@healthcare_associated_origin Bool) ;; {"when_to_set_to_true":"Set to true if the clinical suspicion of pneumonia is for healthcare-associated origin.","when_to_set_to_false":"Set to false if the clinical suspicion of pneumonia is not for healthcare-associated origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the origin is healthcare-associated.","meaning":"Boolean indicating whether the clinical suspicion of pneumonia is for healthcare-associated origin."} ;; "healthcare-associated pneumonia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_respiratory_failure_now@@requires_mechanical_ventilation
         patient_has_finding_of_respiratory_failure_now)
     :named REQ1_AUXILIARY0)) ;; "respiratory failure requiring mechanical ventilation"

(assert
  (! (=> patient_has_suspicion_of_bacterial_pneumonia_now@@hospital_acquired_origin
         patient_has_suspicion_of_bacterial_pneumonia_now)
     :named REQ1_AUXILIARY1)) ;; "hospital-acquired bacterial pneumonia"

(assert
  (! (=> patient_has_suspicion_of_bacterial_pneumonia_now@@ventilator_associated_origin
         patient_has_suspicion_of_bacterial_pneumonia_now)
     :named REQ1_AUXILIARY2)) ;; "ventilator-associated bacterial pneumonia"

(assert
  (! (=> patient_has_suspicion_of_pneumonia_now@@healthcare_associated_origin
         patient_has_suspicion_of_pneumonia_now)
     :named REQ1_AUXILIARY3)) ;; "healthcare-associated pneumonia"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must be hospitalized
(assert
  (! patient_has_finding_of_patient_in_hospital_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be hospitalized."

;; Component 1: Patient must be aged ≥ 18 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 2: Patient must have respiratory failure requiring mechanical ventilation
(assert
  (! patient_has_finding_of_respiratory_failure_now@@requires_mechanical_ventilation
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have respiratory failure requiring mechanical ventilation."

;; Component 3: Patient must have clinical suspicion of (hospital-acquired bacterial pneumonia OR healthcare-associated pneumonia OR ventilator-associated bacterial pneumonia)
(assert
  (! (or patient_has_suspicion_of_bacterial_pneumonia_now@@hospital_acquired_origin
         patient_has_suspicion_of_pneumonia_now@@healthcare_associated_origin
         patient_has_suspicion_of_bacterial_pneumonia_now@@ventilator_associated_origin)
     :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((clinical suspicion of hospital-acquired bacterial pneumonia) OR (clinical suspicion of healthcare-associated pneumonia) OR (clinical suspicion of ventilator-associated bacterial pneumonia))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_suspicion_of_pneumonia_now@@onset_or_exacerbation_at_least_48_hours_after_admission_to_any_patient_health_care_facility Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pneumonia onset or exacerbation occurred at least 48 hours after admission to any patient health care facility.","when_to_set_to_false":"Set to false if the patient's pneumonia onset or exacerbation did not occur at least 48 hours after admission to any patient health care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pneumonia onset or exacerbation occurred at least 48 hours after admission to any patient health care facility.","meaning":"Boolean indicating whether the patient's pneumonia onset or exacerbation occurred at least 48 hours after admission to any patient health care facility."} ;; "onset of pneumonia OR exacerbation of pneumonia at least 48 hours after admission to any patient health care facility"
(declare-const patient_has_suspicion_of_pneumonia_now@@onset_in_nursing_home_and_subsequent_transfer_to_acute_care_facility Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pneumonia onset occurred in a nursing home and was followed by subsequent transfer to an acute care facility.","when_to_set_to_false":"Set to false if the patient's pneumonia onset did not occur in a nursing home and/or was not followed by subsequent transfer to an acute care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pneumonia onset occurred in a nursing home and was followed by subsequent transfer to an acute care facility.","meaning":"Boolean indicating whether the patient's pneumonia onset occurred in a nursing home and was followed by subsequent transfer to an acute care facility."} ;; "onset of pneumonia in a nursing home AND subsequent transfer to an acute care facility"
(declare-const patient_has_suspicion_of_pneumonia_now@@onset_in_rehabilitation_facility_and_subsequent_transfer_to_acute_care_facility Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pneumonia onset occurred in a rehabilitation facility and was followed by subsequent transfer to an acute care facility.","when_to_set_to_false":"Set to false if the patient's pneumonia onset did not occur in a rehabilitation facility and/or was not followed by subsequent transfer to an acute care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pneumonia onset occurred in a rehabilitation facility and was followed by subsequent transfer to an acute care facility.","meaning":"Boolean indicating whether the patient's pneumonia onset occurred in a rehabilitation facility and was followed by subsequent transfer to an acute care facility."} ;; "onset of pneumonia in a rehabilitation facility AND subsequent transfer to an acute care facility"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have ((onset of pneumonia OR exacerbation of pneumonia) at least 48 hours after admission to any patient health care facility)
;; OR ((onset of pneumonia in a nursing home AND subsequent transfer to an acute care facility)
;; OR (onset of pneumonia in a rehabilitation facility AND subsequent transfer to an acute care facility))
(assert
  (! (or patient_has_suspicion_of_pneumonia_now@@onset_or_exacerbation_at_least_48_hours_after_admission_to_any_patient_health_care_facility
         patient_has_suspicion_of_pneumonia_now@@onset_in_nursing_home_and_subsequent_transfer_to_acute_care_facility
         patient_has_suspicion_of_pneumonia_now@@onset_in_rehabilitation_facility_and_subsequent_transfer_to_acute_care_facility)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((onset of pneumonia OR exacerbation of pneumonia) at least 48 hours after admission to any patient health care facility) OR ((onset of pneumonia in a nursing home AND subsequent transfer to an acute care facility) OR (onset of pneumonia in a rehabilitation facility AND subsequent transfer to an acute care facility))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as male or other.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "woman of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently assessed not to have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "woman of childbearing potential"
(declare-const patient_has_undergone_pregnancy_detection_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a pregnancy detection examination (pregnancy test) now.","when_to_set_to_false":"Set to false if the patient has not undergone a pregnancy detection examination (pregnancy test) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a pregnancy detection examination (pregnancy test) now.","meaning":"Boolean indicating whether the patient has undergone a pregnancy detection examination (pregnancy test) now."} ;; "pregnancy test"
(declare-const patient_has_undergone_pregnancy_detection_examination_now@@outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a pregnancy detection examination (pregnancy test) now and the outcome is negative.","when_to_set_to_false":"Set to false if the patient has undergone a pregnancy detection examination (pregnancy test) now and the outcome is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the outcome of the pregnancy detection examination (pregnancy test) now is negative.","meaning":"Boolean indicating whether the outcome of the pregnancy detection examination (pregnancy test) now is negative."} ;; "pregnancy test of the patient must be negative"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a pregnancy test or clinical assessment.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a pregnancy test or clinical assessment.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "pregnancy test of the patient must be negative"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; If the outcome of the pregnancy test is negative, the patient is not pregnant
(assert
  (! (=> patient_has_undergone_pregnancy_detection_examination_now@@outcome_is_negative
         (and patient_has_undergone_pregnancy_detection_examination_now
              (not patient_is_pregnant_now)))
     :named REQ3_AUXILIARY0)) ;; "pregnancy test of the patient must be negative"

;; ===================== Constraint Assertions (REQ 3) =====================
;; If the patient is a woman of childbearing potential, the pregnancy test must be negative
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_has_undergone_pregnancy_detection_examination_now@@outcome_is_negative)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is a woman of childbearing potential, the pregnancy test of the patient must be negative."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone antibiotic therapy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic therapy in their history.","meaning":"Boolean indicating whether the patient has undergone antibiotic therapy at any time in their history."} ;; "antibacterial therapy"
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within_14_days_before_pre_treatment_bronchoscopy_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's antibiotic therapy occurred within 14 days before pre-treatment bronchoscopy entry.","when_to_set_to_false":"Set to false if the patient's antibiotic therapy did not occur within 14 days before pre-treatment bronchoscopy entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's antibiotic therapy occurred within 14 days before pre-treatment bronchoscopy entry.","meaning":"Boolean indicating whether the patient's antibiotic therapy occurred within 14 days before pre-treatment bronchoscopy entry."} ;; "previous antibacterial therapy within 14 days of pre-treatment bronchoscopy entry"
(declare-const patient_antibacterial_therapy_duration_within_14_days_before_pre_treatment_bronchoscopy_entry_in_hours Real) ;; {"when_to_set_to_value":"Set to the total duration in hours of antibacterial therapy received by the patient within 14 days before pre-treatment bronchoscopy entry.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total duration in hours of antibacterial therapy received by the patient within 14 days before pre-treatment bronchoscopy entry."} ;; "less than 24 hours of pre-treatment antibiotics"
(declare-const patient_has_not_responded_clinically_to_antibacterial_therapy_within_14_days_before_pre_treatment_bronchoscopy_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has not responded clinically to antibacterial therapy received within 14 days before pre-treatment bronchoscopy entry.","when_to_set_to_false":"Set to false if the patient has responded clinically to antibacterial therapy received within 14 days before pre-treatment bronchoscopy entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has responded clinically to antibacterial therapy received within 14 days before pre-treatment bronchoscopy entry.","meaning":"Boolean indicating whether the patient has not responded clinically to antibacterial therapy received within 14 days before pre-treatment bronchoscopy entry."} ;; "the patient has not responded clinically"
(declare-const patient_bronchoscopy_and_bronchoalveolar_lavage_value_recorded_now_withunit_cfu_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a quantitative result (colony-forming units per milliliter) from bronchoscopy and bronchoalveolar lavage performed now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the colony-forming units per milliliter recovered from the patient's bronchoscopy and bronchoalveolar lavage performed now."} ;; "quantitative bronchoscopic bronchoalveolar lavage of the patient recovers greater than 10^4 colony-forming units per milliliter"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within_14_days_before_pre_treatment_bronchoscopy_entry
         patient_has_undergone_antibiotic_therapy_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "previous antibacterial therapy within 14 days of pre-treatment bronchoscopy entry" implies "antibacterial therapy in history"

;; Define the logic for eligibility if prior antibacterial therapy within 14 days
(define-fun patient_meets_antibacterial_therapy_eligibility_requirement () Bool
  (or
    patient_has_not_responded_clinically_to_antibacterial_therapy_within_14_days_before_pre_treatment_bronchoscopy_entry
    (< patient_antibacterial_therapy_duration_within_14_days_before_pre_treatment_bronchoscopy_entry_in_hours 24.0)
    (> patient_bronchoscopy_and_bronchoalveolar_lavage_value_recorded_now_withunit_cfu_per_milliliter 10000.0)
  )
) ;; "the patient may be entered only if ((the patient has not responded clinically) OR ((the patient has received less than 24 hours of pre-treatment antibiotics) OR (the quantitative bronchoscopic bronchoalveolar lavage of the patient recovers greater than 10^4 colony-forming units per milliliter as primary evidence that the prior therapy was not efficacious)))"

;; ===================== Constraint Assertions (REQ 4) =====================
;; If the patient has received antibacterial therapy within 14 days before pre-treatment bronchoscopy entry, then the eligibility requirement must be satisfied
(assert
  (! (or
        (not patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within_14_days_before_pre_treatment_bronchoscopy_entry)
        patient_meets_antibacterial_therapy_eligibility_requirement
     )
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, if the patient has received previous antibacterial therapy within 14 days of pre-treatment bronchoscopy entry, the patient may be entered only if ((the patient has not responded clinically) OR ((the patient has received less than 24 hours of pre-treatment antibiotics) OR (the quantitative bronchoscopic bronchoalveolar lavage of the patient recovers greater than 10^4 colony-forming units per milliliter as primary evidence that the prior therapy was not efficacious)))."

;; ===================== Declarations for the criterion (REQ 5) =====================
;; No new variable declarations needed; all required variables are already declared and not in use.

;; ===================== Constraint Assertions (REQ 5) =====================
;; "To be included, the patient must have ((clinical findings that support a diagnosis of hospital-acquired bacterial pneumonia) OR (clinical findings that support a diagnosis of ventilator-associated bacterial pneumonia) OR (clinical findings that support a diagnosis of healthcare-associated pneumonia))."
(assert
  (! (or patient_has_suspicion_of_bacterial_pneumonia_now@@hospital_acquired_origin
         patient_has_suspicion_of_bacterial_pneumonia_now@@ventilator_associated_origin
         patient_has_suspicion_of_pneumonia_now@@healthcare_associated_origin)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_new_infiltrate_on_chest_radiograph_within_48_hours_before_starting_empiric_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of a new infiltrate.","when_to_set_to_false":"Set to false if the patient's chest radiograph within 48 hours before starting empiric therapy does not show the presence of a new infiltrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of a new infiltrate.","meaning":"Boolean indicating whether the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of a new infiltrate."} ;; "the presence of a new infiltrate"
(declare-const patient_has_finding_of_progressive_infiltrate_on_chest_radiograph_within_48_hours_before_starting_empiric_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of a progressive infiltrate.","when_to_set_to_false":"Set to false if the patient's chest radiograph within 48 hours before starting empiric therapy does not show the presence of a progressive infiltrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of a progressive infiltrate.","meaning":"Boolean indicating whether the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of a progressive infiltrate."} ;; "the presence of a progressive infiltrate"
(declare-const patient_has_finding_of_cavitation_on_chest_radiograph_within_48_hours_before_starting_empiric_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of cavitation.","when_to_set_to_false":"Set to false if the patient's chest radiograph within 48 hours before starting empiric therapy does not show the presence of cavitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of cavitation.","meaning":"Boolean indicating whether the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of cavitation."} ;; "the presence of cavitation"
(declare-const patient_has_finding_of_effusion_suggestive_of_pneumonia_on_chest_radiograph_within_48_hours_before_starting_empiric_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of effusion suggestive of pneumonia.","when_to_set_to_false":"Set to false if the patient's chest radiograph within 48 hours before starting empiric therapy does not show the presence of effusion suggestive of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of effusion suggestive of pneumonia.","meaning":"Boolean indicating whether the patient's chest radiograph within 48 hours before starting empiric therapy shows the presence of effusion suggestive of pneumonia."} ;; "the presence of effusion suggestive of pneumonia"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest x-ray at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone a plain chest x-ray at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest x-ray at any time in the history.","meaning":"Boolean indicating whether the patient has undergone a plain chest x-ray at any time in the history."} ;; "chest radiograph"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_within_48_hours_before_starting_empiric_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's plain chest x-ray occurred within 48 hours before starting empiric therapy.","when_to_set_to_false":"Set to false if the patient's plain chest x-ray did not occur within 48 hours before starting empiric therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's plain chest x-ray occurred within 48 hours before starting empiric therapy.","meaning":"Boolean indicating whether the patient's plain chest x-ray occurred within 48 hours before starting empiric therapy."} ;; "within 48 hours before starting empiric therapy"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_within_48_hours_before_starting_empiric_therapy
         patient_has_undergone_plain_chest_x_ray_inthehistory)
     :named REQ6_AUXILIARY0)) ;; "within 48 hours before starting empiric therapy"

;; ===================== Constraint Assertions (REQ 6) =====================
;; At least one of the required findings must be present on chest radiograph within 48 hours before starting empiric therapy
(assert
  (! (or patient_has_finding_of_new_infiltrate_on_chest_radiograph_within_48_hours_before_starting_empiric_therapy
         patient_has_finding_of_progressive_infiltrate_on_chest_radiograph_within_48_hours_before_starting_empiric_therapy
         patient_has_finding_of_cavitation_on_chest_radiograph_within_48_hours_before_starting_empiric_therapy
         patient_has_finding_of_effusion_suggestive_of_pneumonia_on_chest_radiograph_within_48_hours_before_starting_empiric_therapy)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the chest radiograph of the patient must show ((the presence of a new infiltrate) OR (the presence of a progressive infiltrate) OR (the presence of cavitation) OR (the presence of effusion suggestive of pneumonia)) within 48 hours before starting empiric therapy"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_bronchoscopy_and_bronchoalveolar_lavage_value_recorded_now_withunit_cfu_per_milliliter@@temporalcontext_within_36_hours_before_start_of_empiric_study_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the quantitative microbial culture specimen was obtained within 36 hours before the start of empiric study therapy.","when_to_set_to_false":"Set to false if the specimen was not obtained within 36 hours before the start of empiric study therapy.","when_to_set_to_null":"Set to null if the timing of specimen collection relative to empiric study therapy is unknown or indeterminate.","meaning":"Boolean indicating whether the quantitative microbial culture specimen was obtained within 36 hours before the start of empiric study therapy."} ;; "within 36 hours before the start of empiric study therapy, a quantitative culture of bronchoscopic bronchoalveolar lavage fluid must be obtained from the patient."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_bronchoscopy_and_bronchoalveolar_lavage_value_recorded_now_withunit_cfu_per_milliliter@@temporalcontext_within_36_hours_before_start_of_empiric_study_therapy
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "within 36 hours before the start of empiric study therapy, a quantitative culture of bronchoscopic bronchoalveolar lavage fluid must be obtained from the patient."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const clinical_pulmonary_infection_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the value of the Clinical Pulmonary Infection Score (in points) if it is recorded for the patient at the current time.","when_to_set_to_null":"Set to null if the Clinical Pulmonary Infection Score is not recorded, unknown, or cannot be determined for the patient at the current time.","meaning":"Numeric value representing the Clinical Pulmonary Infection Score for the patient, recorded now, in points."} ;; "the patient must have a Clinical Pulmonary Infection Score ≥ 5"

;; ===================== Constraint Assertions (REQ 8) =====================
;; If the patient has ventilator-associated bacterial pneumonia, the patient must have a Clinical Pulmonary Infection Score ≥ 5.
(assert
  (! (or (not patient_has_suspicion_of_bacterial_pneumonia_now@@ventilator_associated_origin)
         (>= clinical_pulmonary_infection_score_value_recorded_now_withunit_points 5.0))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS))
