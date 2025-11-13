;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged over 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: The patient must be aged over 18 years.
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged over 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_adenocarcinoma_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of lung adenocarcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of lung adenocarcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of lung adenocarcinoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of lung adenocarcinoma."} ;; "lung adenocarcinoma"
(declare-const patient_has_diagnosis_of_adenocarcinoma_of_lung_now@@histologically_proven Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of lung adenocarcinoma is histologically proven (confirmed by tissue pathology).","when_to_set_to_false":"Set to false if the patient's current diagnosis of lung adenocarcinoma is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of lung adenocarcinoma is histologically proven.","meaning":"Boolean indicating whether the patient's current diagnosis of lung adenocarcinoma is histologically proven."} ;; "histologically proven lung adenocarcinoma"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (histologically proven diagnosis implies diagnosis)
(assert
  (! (=> patient_has_diagnosis_of_adenocarcinoma_of_lung_now@@histologically_proven
         patient_has_diagnosis_of_adenocarcinoma_of_lung_now)
     :named REQ1_AUXILIARY0)) ;; "histologically proven lung adenocarcinoma" implies "lung adenocarcinoma"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have histologically proven lung adenocarcinoma.
(assert
  (! patient_has_diagnosis_of_adenocarcinoma_of_lung_now@@histologically_proven
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have histologically proven lung adenocarcinoma."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_clinical_stage_3b_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical stage IIIB disease.","when_to_set_to_false":"Set to false if the patient currently does not have clinical stage IIIB disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical stage IIIB disease.","meaning":"Boolean indicating whether the patient currently has clinical stage IIIB disease."} ;; "clinical stage IIIB disease"
(declare-const patient_has_finding_of_clinical_stage_4_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical stage IV disease.","when_to_set_to_false":"Set to false if the patient currently does not have clinical stage IV disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical stage IV disease.","meaning":"Boolean indicating whether the patient currently has clinical stage IV disease."} ;; "clinical stage IV disease"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (clinical stage IIIB disease OR clinical stage IV disease).
(assert
  (! (or patient_has_finding_of_clinical_stage_3b_now
         patient_has_finding_of_clinical_stage_4_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const ecog_performance_status_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value (0, 1, or 2) that represents the patient's current ECOG performance status as documented.","when_to_set_to_null":"Set to null if the patient's current ECOG performance status is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current ECOG performance status (0, 1, or 2)."} ;; "ECOG performance status = 0 OR ECOG performance status = 1 OR ECOG performance status = 2"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have (ECOG performance status = 0 OR ECOG performance status = 1 OR ECOG performance status = 2).
(assert
  (! (or (= ecog_performance_status_value_recorded_now_withunit_integer 0)
         (= ecog_performance_status_value_recorded_now_withunit_integer 1)
         (= ecog_performance_status_value_recorded_now_withunit_integer 2))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "ECOG performance status = 0 OR ECOG performance status = 1 OR ECOG performance status = 2"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone administration of an antineoplastic agent at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone administration of an antineoplastic agent at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of an antineoplastic agent.","meaning":"Boolean indicating whether the patient has ever undergone administration of an antineoplastic agent at any time in the past."} ;; "anticancer agent therapy"
(declare-const patient_has_undergone_radiation_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone radiation therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone radiation therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone radiation therapy.","meaning":"Boolean indicating whether the patient has ever undergone radiation therapy at any time in the past."} ;; "radiation therapy"
(declare-const patient_has_undergone_radiation_therapy_inthehistory@@for_adenocarcinoma_of_lung Bool) ;; {"when_to_set_to_true":"Set to true if the radiation therapy was performed for the indication of adenocarcinoma of the lung.","when_to_set_to_false":"Set to false if the radiation therapy was not performed for the indication of adenocarcinoma of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the radiation therapy was performed for adenocarcinoma of the lung.","meaning":"Boolean indicating whether the radiation therapy was performed for adenocarcinoma of the lung."} ;; "radiation therapy for lung adenocarcinoma"
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical procedure.","meaning":"Boolean indicating whether the patient has ever undergone a surgical procedure at any time in the past."} ;; "surgical therapy"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@for_adenocarcinoma_of_lung Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure was performed for the indication of adenocarcinoma of the lung.","when_to_set_to_false":"Set to false if the surgical procedure was not performed for the indication of adenocarcinoma of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure was performed for adenocarcinoma of the lung.","meaning":"Boolean indicating whether the surgical procedure was performed for adenocarcinoma of the lung."} ;; "surgical therapy for lung adenocarcinoma"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_radiation_therapy_inthehistory@@for_adenocarcinoma_of_lung
         patient_has_undergone_radiation_therapy_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "radiation therapy for lung adenocarcinoma implies radiation therapy"

(assert
  (! (=> patient_has_undergone_surgical_procedure_inthehistory@@for_adenocarcinoma_of_lung
         patient_has_undergone_surgical_procedure_inthehistory)
     :named REQ4_AUXILIARY1)) ;; "surgical therapy for lung adenocarcinoma implies surgical therapy"

;; ===================== Constraint Assertions (REQ 4) =====================
;; To be included, the patient must have had no prior anticancer agent therapy, no prior radiation therapy, or no prior surgical therapy for lung adenocarcinoma.
(assert
  (! (or (not patient_has_undergone_administration_of_antineoplastic_agent_inthehistory)
         (not patient_has_undergone_radiation_therapy_inthehistory@@for_adenocarcinoma_of_lung)
         (not patient_has_undergone_surgical_procedure_inthehistory@@for_adenocarcinoma_of_lung))
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "no prior anticancer agent therapy, no prior radiation therapy, or no prior surgical therapy for lung adenocarcinoma"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const measurable_lesion_count_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value representing the number of measurable lesions present in the patient at the current time.","when_to_set_to_null":"Set to null if the number of measurable lesions present in the patient at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the number of measurable lesions present in the patient at the current time."} ;; "the patient must have ≥ 1 measurable lesion"
(declare-const measurable_lesion_count_recorded_now_withunit_integer@@according_to_response_evaluation_criteria_in_solid_tumors Bool) ;; {"when_to_set_to_true":"Set to true if the number of measurable lesions present in the patient at the current time is determined according to Response Evaluation Criteria in Solid Tumors.","when_to_set_to_false":"Set to false if the number of measurable lesions present in the patient at the current time is not determined according to Response Evaluation Criteria in Solid Tumors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the number of measurable lesions present in the patient at the current time is determined according to Response Evaluation Criteria in Solid Tumors.","meaning":"Boolean indicating whether the number of measurable lesions present in the patient at the current time is determined according to Response Evaluation Criteria in Solid Tumors."} ;; "measurable lesion according to Response Evaluation Criteria in Solid Tumors"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies the stem variable is relevant
(assert
  (! (=> measurable_lesion_count_recorded_now_withunit_integer@@according_to_response_evaluation_criteria_in_solid_tumors
        (>= measurable_lesion_count_recorded_now_withunit_integer 0))
     :named REQ5_AUXILIARY0)) ;; "measurable lesions present in the patient at the current time is determined according to Response Evaluation Criteria in Solid Tumors"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: The patient must have ≥ 1 measurable lesion according to Response Evaluation Criteria in Solid Tumors.
(assert
  (! (and measurable_lesion_count_recorded_now_withunit_integer@@according_to_response_evaluation_criteria_in_solid_tumors
          (>= measurable_lesion_count_recorded_now_withunit_integer 1))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have ≥ 1 measurable lesion according to Response Evaluation Criteria in Solid Tumors"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} ;; "the patient must provide written informed consent"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide written informed consent"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_longevity_value_recorded_now_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current life expectancy in weeks if available.","when_to_set_to_null":"Set to null if the patient's current life expectancy in weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in weeks."} ;; "life expectancy ≥ 12 weeks"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (>= patient_longevity_value_recorded_now_withunit_weeks 12)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have life expectancy ≥ 12 weeks."
