;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of metastatic solid tumour.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of metastatic solid tumour.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of metastatic solid tumour.","meaning":"Boolean indicating whether the patient currently has a diagnosis of metastatic solid tumour."} // "have a confirmed diagnosis of metastatic solid tumour"
(declare-const patient_has_diagnosis_of_tumor_of_advanced_extent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of advanced solid tumour.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of advanced solid tumour.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of advanced solid tumour.","meaning":"Boolean indicating whether the patient currently has a diagnosis of advanced solid tumour."} // "have a confirmed diagnosis of advanced solid tumour"
(declare-const patient_has_diagnosis_of_tumor_surgically_unresectable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of non-resectable solid tumour.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of non-resectable solid tumour.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of non-resectable solid tumour.","meaning":"Boolean indicating whether the patient currently has a diagnosis of non-resectable solid tumour."} // "have a confirmed diagnosis of non-resectable solid tumour"
(declare-const patient_has_failed_conventional_treatment_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever failed conventional treatment.","when_to_set_to_false":"Set to false if the patient has never failed conventional treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever failed conventional treatment.","meaning":"Boolean indicating whether the patient has ever failed conventional treatment."} // "have failed conventional treatment"
(declare-const patient_is_amenable_to_established_form_of_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently amenable to an established form of treatment.","when_to_set_to_false":"Set to false if the patient is currently not amenable to an established form of treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently amenable to an established form of treatment.","meaning":"Boolean indicating whether the patient is currently amenable to an established form of treatment."} // "not be amenable to established form of treatment"
(declare-const therapy_of_proven_efficacy_is_available_to_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if any therapy of proven efficacy is currently available to the patient.","when_to_set_to_false":"Set to false if no therapy of proven efficacy is currently available to the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any therapy of proven efficacy is currently available to the patient.","meaning":"Boolean indicating whether any therapy of proven efficacy is currently available to the patient."} // "have no therapy of proven efficacy available"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have a confirmed diagnosis of advanced solid tumour OR non-resectable solid tumour OR metastatic solid tumour
(assert
  (! (or patient_has_diagnosis_of_tumor_of_advanced_extent_now
         patient_has_diagnosis_of_tumor_surgically_unresectable_now
         patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have a confirmed diagnosis of advanced solid tumour) OR (have a confirmed diagnosis of non-resectable solid tumour) OR (have a confirmed diagnosis of metastatic solid tumour))"

;; Component 1: Must have failed conventional treatment OR have no therapy of proven efficacy available OR not be amenable to established form of treatment
(assert
  (! (or patient_has_failed_conventional_treatment_ever
         (not therapy_of_proven_efficacy_is_available_to_patient_now)
         (not patient_is_amenable_to_established_form_of_treatment_now))
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have failed conventional treatment) OR (have no therapy of proven efficacy available) OR (not be amenable to established form of treatment))"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const evaluable_tumour_deposit_count_now Real) ;; {"when_to_set_to_value":"Set to the number of evaluable tumour deposits identified in the patient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many evaluable tumour deposits are present in the patient at the current time.","meaning":"Numeric variable indicating the number of evaluable tumour deposits identified in the patient at the current time."} // "have at least one evaluable tumour deposit"
(declare-const evaluable_tumour_deposit_count_now@@identified_by_at_least_one_imaging_technique_xray_or_ct_or_mri_or_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the evaluable tumour deposit count is based on deposits identified by at least one of the following imaging techniques: X-ray, computed tomography, magnetic resonance imaging, or ultrasound.","when_to_set_to_false":"Set to false if the evaluable tumour deposit count is not based on deposits identified by at least one of the specified imaging techniques.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the evaluable tumour deposit count is based on deposits identified by at least one of the specified imaging techniques.","meaning":"Boolean qualifier indicating whether the evaluable tumour deposit count is based on deposits identified by at least one of the specified imaging techniques (X-ray, CT, MRI, or ultrasound)."} // "by at least one technique (X-ray OR computed tomography OR magnetic resonance imaging OR ultrasound)"
(declare-const patient_has_undergone_plain_radiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone plain radiography (X-ray) now.","when_to_set_to_false":"Set to false if the patient has not undergone plain radiography (X-ray) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone plain radiography (X-ray) now.","meaning":"Boolean indicating whether the patient has undergone plain radiography (X-ray) now."} // "X-ray"
(declare-const patient_has_undergone_computerized_axial_tomography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone computerized axial tomography (CT scan) now.","when_to_set_to_false":"Set to false if the patient has not undergone computerized axial tomography (CT scan) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone computerized axial tomography (CT scan) now.","meaning":"Boolean indicating whether the patient has undergone computerized axial tomography (CT scan) now."} // "computed tomography"
(declare-const patient_has_undergone_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone magnetic resonance imaging (MRI) now.","when_to_set_to_false":"Set to false if the patient has not undergone magnetic resonance imaging (MRI) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone magnetic resonance imaging (MRI) now.","meaning":"Boolean indicating whether the patient has undergone magnetic resonance imaging (MRI) now."} // "magnetic resonance imaging"
(declare-const patient_has_undergone_ultrasonography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography (ultrasound) now.","when_to_set_to_false":"Set to false if the patient has not undergone ultrasonography (ultrasound) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultrasonography (ultrasound) now.","meaning":"Boolean indicating whether the patient has undergone ultrasonography (ultrasound) now."} // "ultrasound"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Imaging technique qualifier is true if any imaging technique was used
(assert
  (! (= evaluable_tumour_deposit_count_now@@identified_by_at_least_one_imaging_technique_xray_or_ct_or_mri_or_ultrasound
        (or patient_has_undergone_plain_radiography_now
            patient_has_undergone_computerized_axial_tomography_now
            patient_has_undergone_magnetic_resonance_imaging_now
            patient_has_undergone_ultrasonography_now))
     :named REQ1_AUXILIARY0)) ;; "by at least one technique (X-ray OR computed tomography OR magnetic resonance imaging OR ultrasound)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Must have at least one evaluable tumour deposit identified by at least one imaging technique
(assert
  (! (and (>= evaluable_tumour_deposit_count_now 1)
          evaluable_tumour_deposit_count_now@@identified_by_at_least_one_imaging_technique_xray_or_ct_or_mri_or_ultrasound)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have at least one evaluable tumour deposit by at least one technique (X-ray OR computed tomography OR magnetic resonance imaging OR ultrasound)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const life_expectancy_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value (in months) of the patient's life expectancy as recorded or estimated by a clinician.","when_to_set_to_null":"Set to null if the patient's life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's life expectancy in months."} // "life expectancy ≥ 3 months"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= life_expectancy_value_recorded_in_months 3.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a life expectancy ≥ 3 months."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_given_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given written informed consent.","when_to_set_to_false":"Set to false if the patient has not given written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given written informed consent.","meaning":"Boolean indicating whether the patient has given written informed consent."} // "must have given written informed consent"
(declare-const patient_has_given_written_informed_consent@@consistent_with_ich_gcp_and_local_legislation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's written informed consent is consistent with both International Conference on Harmonization Good Clinical Practice and local legislation.","when_to_set_to_false":"Set to false if the patient's written informed consent is not consistent with either International Conference on Harmonization Good Clinical Practice or local legislation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's written informed consent is consistent with International Conference on Harmonization Good Clinical Practice and local legislation.","meaning":"Boolean indicating whether the patient's written informed consent is consistent with International Conference on Harmonization Good Clinical Practice and local legislation."} // "which must be consistent with International Conference on Harmonization Good Clinical Practice AND local legislation"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_given_written_informed_consent@@consistent_with_ich_gcp_and_local_legislation
         patient_has_given_written_informed_consent)
     :named REQ4_AUXILIARY0)) ;; "which must be consistent with International Conference on Harmonization Good Clinical Practice AND local legislation"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and patient_has_given_written_informed_consent
          patient_has_given_written_informed_consent@@consistent_with_ich_gcp_and_local_legislation)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must have given written informed consent (which must be consistent with International Conference on Harmonization Good Clinical Practice AND local legislation)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const eastern_cooperative_oncology_group_performance_score_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's ECOG performance score as recorded at the current time.","when_to_set_to_null":"Set to null if the ECOG performance score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's ECOG performance score at the current time, as an integer."} // "Eastern Cooperative Oncology Group performance score < 2"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (< eastern_cooperative_oncology_group_performance_score_value_recorded_now_withunit_integer 2)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have Eastern Cooperative Oncology Group performance score < 2."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_fully_recovered_from_therapy_related_toxicity_due_to_previous_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has fully recovered from all therapy-related toxicity that resulted from previous chemotherapy.","when_to_set_to_false":"Set to false if the patient has not fully recovered from all therapy-related toxicity that resulted from previous chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has fully recovered from all therapy-related toxicity that resulted from previous chemotherapy.","meaning":"Boolean indicating whether the patient has fully recovered from all therapy-related toxicity that resulted from previous chemotherapy."} // "fully recovered from all therapy-related toxicity from previous chemotherapy"
(declare-const patient_has_fully_recovered_from_therapy_related_toxicity_due_to_previous_hormone_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has fully recovered from all therapy-related toxicity that resulted from previous hormone therapy.","when_to_set_to_false":"Set to false if the patient has not fully recovered from all therapy-related toxicity that resulted from previous hormone therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has fully recovered from all therapy-related toxicity that resulted from previous hormone therapy.","meaning":"Boolean indicating whether the patient has fully recovered from all therapy-related toxicity that resulted from previous hormone therapy."} // "fully recovered from all therapy-related toxicity from previous hormone therapy"
(declare-const patient_has_fully_recovered_from_therapy_related_toxicity_due_to_previous_immunotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has fully recovered from all therapy-related toxicity that resulted from previous immunotherapy.","when_to_set_to_false":"Set to false if the patient has not fully recovered from all therapy-related toxicity that resulted from previous immunotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has fully recovered from all therapy-related toxicity that resulted from previous immunotherapy.","meaning":"Boolean indicating whether the patient has fully recovered from all therapy-related toxicity that resulted from previous immunotherapy."} // "fully recovered from all therapy-related toxicity from previous immunotherapy"
(declare-const patient_has_fully_recovered_from_therapy_related_toxicity_due_to_previous_radiotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has fully recovered from all therapy-related toxicity that resulted from previous radiotherapy.","when_to_set_to_false":"Set to false if the patient has not fully recovered from all therapy-related toxicity that resulted from previous radiotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has fully recovered from all therapy-related toxicity that resulted from previous radiotherapy.","meaning":"Boolean indicating whether the patient has fully recovered from all therapy-related toxicity that resulted from previous radiotherapy."} // "fully recovered from all therapy-related toxicity from previous radiotherapy"
(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chemotherapy in the past.","meaning":"Boolean indicating whether the patient has undergone chemotherapy in the past."} // "previous chemotherapy"
(declare-const patient_has_undergone_hormone_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hormone therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone hormone therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hormone therapy in the past.","meaning":"Boolean indicating whether the patient has undergone hormone therapy in the past."} // "previous hormone therapy"
(declare-const patient_has_undergone_immunological_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone immunological therapy (immunotherapy) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone immunological therapy (immunotherapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone immunological therapy (immunotherapy) in the past.","meaning":"Boolean indicating whether the patient has undergone immunological therapy (immunotherapy) in the past."} // "previous immunotherapy"
(declare-const patient_has_undergone_radiotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone radiotherapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone radiotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone radiotherapy in the past.","meaning":"Boolean indicating whether the patient has undergone radiotherapy in the past."} // "previous radiotherapy"

;; ===================== Constraint Assertions (REQ 6) =====================
;; The patient must have fully recovered from all therapy-related toxicity from previous chemotherapy OR previous hormone therapy OR previous immunotherapy OR previous radiotherapy.
(assert
  (! (or
        (and patient_has_undergone_chemotherapy_inthehistory
             patient_has_fully_recovered_from_therapy_related_toxicity_due_to_previous_chemotherapy)
        (and patient_has_undergone_hormone_therapy_inthehistory
             patient_has_fully_recovered_from_therapy_related_toxicity_due_to_previous_hormone_therapy)
        (and patient_has_undergone_immunological_therapy_inthehistory
             patient_has_fully_recovered_from_therapy_related_toxicity_due_to_previous_immunotherapy)
        (and patient_has_undergone_radiotherapy_inthehistory
             patient_has_fully_recovered_from_therapy_related_toxicity_due_to_previous_radiotherapy)
     )
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have fully recovered from all therapy-related toxicity from previous chemotherapy OR previous hormone therapy OR previous immunotherapy OR previous radiotherapy"
