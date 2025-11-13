;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_resident_of_tone_sanitary_district_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a resident of Tône sanitary district.","when_to_set_to_false":"Set to false if the patient is currently not a resident of Tône sanitary district.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a resident of Tône sanitary district.","meaning":"Boolean indicating whether the patient is currently a resident of Tône sanitary district."} // "To be included, the patient must be a resident of Tône sanitary district."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_resident_of_tone_sanitary_district_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a resident of Tône sanitary district."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical pneumonia syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have clinical pneumonia syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical pneumonia syndrome.","meaning":"Boolean indicating whether the patient currently has clinical pneumonia syndrome."} // "To be included, the patient must require hospitalization for ≥ 1 night for clinical pneumonia syndrome."
(declare-const patient_hospitalization_duration_value_recorded_for_clinical_pneumonia_syndrome_in_nights Real) ;; {"when_to_set_to_value":"Set to the number of nights the patient is or will be hospitalized for clinical pneumonia syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many nights the patient is or will be hospitalized for clinical pneumonia syndrome.","meaning":"Numeric value representing the number of nights of hospitalization for clinical pneumonia syndrome."} // "To be included, the patient must require hospitalization for ≥ 1 night for clinical pneumonia syndrome."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patient_has_finding_of_pneumonia_now
          (>= patient_hospitalization_duration_value_recorded_for_clinical_pneumonia_syndrome_in_nights 1))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must require hospitalization for ≥ 1 night for clinical pneumonia syndrome."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_inpatient_stay_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing an inpatient stay (hospitalized) now.","when_to_set_to_false":"Set to false if the patient is currently not undergoing an inpatient stay (not hospitalized) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized (inpatient stay) now."} // "To be included, the patient must be hospitalized in a study site during the study period."
(declare-const patient_has_finding_of_inpatient_stay_now@@occurs_in_study_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hospitalization occurs in a study site.","when_to_set_to_false":"Set to false if the patient's current hospitalization does not occur in a study site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hospitalization occurs in a study site.","meaning":"Boolean indicating whether the patient's current hospitalization occurs in a study site."} // "To be included, the patient must be hospitalized in a study site during the study period."
(declare-const patient_has_finding_of_inpatient_stay_now@@occurs_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hospitalization occurs during the study period.","when_to_set_to_false":"Set to false if the patient's current hospitalization does not occur during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hospitalization occurs during the study period.","meaning":"Boolean indicating whether the patient's current hospitalization occurs during the study period."} // "To be included, the patient must be hospitalized in a study site during the study period."

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the stem variable (hospitalization)
(assert
  (! (=> patient_has_finding_of_inpatient_stay_now@@occurs_in_study_site
         patient_has_finding_of_inpatient_stay_now)
     :named REQ2_AUXILIARY0)) ;; "hospitalized in a study site"

(assert
  (! (=> patient_has_finding_of_inpatient_stay_now@@occurs_during_study_period
         patient_has_finding_of_inpatient_stay_now)
     :named REQ2_AUXILIARY1)) ;; "hospitalized during the study period"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must be hospitalized in a study site during the study period
(assert
  (! (and patient_has_finding_of_inpatient_stay_now@@occurs_in_study_site
          patient_has_finding_of_inpatient_stay_now@@occurs_during_study_period)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be hospitalized in a study site during the study period."
