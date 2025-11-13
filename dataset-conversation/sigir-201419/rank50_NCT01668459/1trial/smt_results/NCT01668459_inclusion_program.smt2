;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "To be included, the patient must have provided written informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written informed consent."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_longevity_value_recorded_now_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the measured or estimated value in weeks if the patient's current life expectancy is recorded or determined.","when_to_set_to_null":"Set to null if the patient's current life expectancy in weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in weeks."} // "life expectancy ≥ 12 weeks"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_longevity_value_recorded_now_withunit_weeks 12.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a life expectancy ≥ 12 weeks."

;; ===================== Declarations for the inclusion criteria (REQ 3) =====================
(declare-const patient_has_histology_confirmed_transitional_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has transitional cell carcinoma confirmed by histology.","when_to_set_to_false":"Set to false if the patient currently does not have transitional cell carcinoma confirmed by histology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has transitional cell carcinoma confirmed by histology.","meaning":"Boolean indicating whether the patient currently has transitional cell carcinoma confirmed by histology."} // "histology confirmed transitional cell carcinoma"
(declare-const patient_has_cytology_confirmed_transitional_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has transitional cell carcinoma confirmed by cytology.","when_to_set_to_false":"Set to false if the patient currently does not have transitional cell carcinoma confirmed by cytology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has transitional cell carcinoma confirmed by cytology.","meaning":"Boolean indicating whether the patient currently has transitional cell carcinoma confirmed by cytology."} // "cytology confirmed transitional cell carcinoma"
(declare-const patient_has_mixed_pathology_with_predominantly_transitional_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mixed pathology with predominantly transitional cell carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have mixed pathology with predominantly transitional cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mixed pathology with predominantly transitional cell carcinoma.","meaning":"Boolean indicating whether the patient currently has mixed pathology with predominantly transitional cell carcinoma."} // "mixed pathology with predominantly transitional cell carcinoma"
(declare-const patient_has_locally_advanced_transitional_cell_carcinoma_t4b_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has locally advanced transitional cell carcinoma at stage T4b.","when_to_set_to_false":"Set to false if the patient currently does not have locally advanced transitional cell carcinoma at stage T4b.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has locally advanced transitional cell carcinoma at stage T4b.","meaning":"Boolean indicating whether the patient currently has locally advanced transitional cell carcinoma at stage T4b."} // "locally advanced transitional cell carcinoma (T4b)"
(declare-const patient_has_metastatic_transitional_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has metastatic transitional cell carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have metastatic transitional cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metastatic transitional cell carcinoma.","meaning":"Boolean indicating whether the patient currently has metastatic transitional cell carcinoma."} // "metastatic transitional cell carcinoma"
(declare-const patient_has_lymph_node_metastatic_transitional_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lymph node metastatic transitional cell carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have lymph node metastatic transitional cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lymph node metastatic transitional cell carcinoma.","meaning":"Boolean indicating whether the patient currently has lymph node metastatic transitional cell carcinoma."} // "lymph node metastatic transitional cell carcinoma"
(declare-const patient_has_visceral_metastatic_transitional_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has visceral metastatic transitional cell carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have visceral metastatic transitional cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has visceral metastatic transitional cell carcinoma.","meaning":"Boolean indicating whether the patient currently has visceral metastatic transitional cell carcinoma."} // "visceral metastatic transitional cell carcinoma"
(declare-const patient_has_transitional_cell_carcinoma_arising_from_bladder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has transitional cell carcinoma arising from the bladder.","when_to_set_to_false":"Set to false if the patient currently does not have transitional cell carcinoma arising from the bladder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has transitional cell carcinoma arising from the bladder.","meaning":"Boolean indicating whether the patient currently has transitional cell carcinoma arising from the bladder."} // "arising from the bladder"
(declare-const patient_has_transitional_cell_carcinoma_arising_from_upper_urinary_tracts_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has transitional cell carcinoma arising from the upper urinary tracts.","when_to_set_to_false":"Set to false if the patient currently does not have transitional cell carcinoma arising from the upper urinary tracts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has transitional cell carcinoma arising from the upper urinary tracts.","meaning":"Boolean indicating whether the patient currently has transitional cell carcinoma arising from the upper urinary tracts."} // "arising from the upper urinary tracts"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Metastatic umbrella: lymph node or visceral metastatic transitional cell carcinoma implies metastatic transitional cell carcinoma
(assert
  (! (=> (or patient_has_lymph_node_metastatic_transitional_cell_carcinoma_now
            patient_has_visceral_metastatic_transitional_cell_carcinoma_now)
         patient_has_metastatic_transitional_cell_carcinoma_now)
     :named REQ3_AUXILIARY0)) ;; "metastatic transitional cell carcinoma (lymph node metastatic transitional cell carcinoma OR visceral metastatic transitional cell carcinoma)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: histology confirmed OR cytology confirmed OR mixed pathology with predominantly transitional cell carcinoma
(assert
  (! (or patient_has_histology_confirmed_transitional_cell_carcinoma_now
         patient_has_cytology_confirmed_transitional_cell_carcinoma_now
         patient_has_mixed_pathology_with_predominantly_transitional_cell_carcinoma_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((histology confirmed transitional cell carcinoma) OR (cytology confirmed transitional cell carcinoma) OR (mixed pathology with predominantly transitional cell carcinoma))"

;; Component 1: locally advanced (T4b) OR metastatic (lymph node or visceral)
(assert
  (! (or patient_has_locally_advanced_transitional_cell_carcinoma_t4b_now
         patient_has_metastatic_transitional_cell_carcinoma_now)
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((locally advanced transitional cell carcinoma (T4b)) OR (metastatic transitional cell carcinoma (lymph node metastatic transitional cell carcinoma OR visceral metastatic transitional cell carcinoma)))"

;; Component 2: arising from bladder OR arising from upper urinary tracts
(assert
  (! (or patient_has_transitional_cell_carcinoma_arising_from_bladder_now
         patient_has_transitional_cell_carcinoma_arising_from_upper_urinary_tracts_now)
     :named REQ3_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((arising from the bladder) OR (arising from the upper urinary tracts))"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_treated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or has received treatment for prostate cancer.","when_to_set_to_false":"Set to false if the patient is not currently receiving or has not received treatment for prostate cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently treated for prostate cancer.","meaning":"Boolean indicating whether the patient is currently treated for prostate cancer."} // "the patient must be (a treated patient with incidental prostate cancer (pT2, Gleason score ≤ 6))"
(declare-const patient_has_diagnosis_of_carcinoma_of_prostate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of prostate cancer.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of prostate cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of prostate cancer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of prostate cancer."} // "prostate cancer"
(declare-const patient_has_diagnosis_of_carcinoma_of_prostate_now@@incidental Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of prostate cancer is incidental.","when_to_set_to_false":"Set to false if the patient's diagnosis of prostate cancer is not incidental.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is incidental.","meaning":"Boolean indicating whether the patient's diagnosis of prostate cancer is incidental."} // "incidental prostate cancer"
(declare-const patient_has_diagnosis_of_carcinoma_of_prostate_now@@pt2_stage Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of prostate cancer is at pT2 stage.","when_to_set_to_false":"Set to false if the patient's diagnosis of prostate cancer is not at pT2 stage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is at pT2 stage.","meaning":"Boolean indicating whether the patient's diagnosis of prostate cancer is at pT2 stage."} // "pT2"
(declare-const patient_gleason_score_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured Gleason score value if recorded now.","when_to_set_to_null":"Set to null if no Gleason score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Gleason score recorded now."} // "Gleason score ≤ 6"
(declare-const patient_prostate_specific_antigen_value_recorded_now_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the measured prostate specific antigen concentration in ng/mL if recorded now.","when_to_set_to_null":"Set to null if no prostate specific antigen concentration is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's prostate specific antigen concentration in ng/mL recorded now."} // "prostate specific antigen concentration ≤ 0.5 ng/mL"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} // "the patient must be (a treated patient with incidental prostate cancer (pT2, Gleason score ≤ 6))"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_carcinoma_of_prostate_now@@incidental
         patient_has_diagnosis_of_carcinoma_of_prostate_now)
     :named REQ4_AUXILIARY0)) ;; "incidental prostate cancer"

(assert
  (! (=> patient_has_diagnosis_of_carcinoma_of_prostate_now@@pt2_stage
         patient_has_diagnosis_of_carcinoma_of_prostate_now)
     :named REQ4_AUXILIARY1)) ;; "pT2 stage"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Treated patient with incidental prostate cancer (pT2, Gleason score ≤ 6)
(assert
  (! (and patient_is_treated_now
          patient_sex_is_male_now
          patient_has_diagnosis_of_carcinoma_of_prostate_now@@incidental
          patient_has_diagnosis_of_carcinoma_of_prostate_now@@pt2_stage
          (<= patient_gleason_score_value_recorded_now_withunit_none 6))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be (a treated patient with incidental prostate cancer (pT2, Gleason score ≤ 6))"

;; Component 1: Prostate specific antigen concentration ≤ 0.5 ng/mL
(assert
  (! (<= patient_prostate_specific_antigen_value_recorded_now_withunit_ng_per_ml 0.5)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must have a prostate specific antigen concentration ≤ 0.5 ng/mL"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_measurable_disease_as_per_respect_criteria_in_solid_tumors_criteria_v1_1_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has measurable disease, and this is determined according to Response Evaluation Criteria in Solid Tumors Criteria version 1.1.","when_to_set_to_false":"Set to false if the patient currently does not have measurable disease, or if measurable disease is not determined according to Response Evaluation Criteria in Solid Tumors Criteria version 1.1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has measurable disease as per Response Evaluation Criteria in Solid Tumors Criteria version 1.1.","meaning":"Boolean indicating whether the patient currently has measurable disease as per Response Evaluation Criteria in Solid Tumors Criteria version 1.1."} // "To be included, the patient must have measurable disease as per Response Evaluation Criteria in Solid Tumors Criteria version 1.1."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_measurable_disease_as_per_respect_criteria_in_solid_tumors_criteria_v1_1_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have measurable disease as per Response Evaluation Criteria in Solid Tumors Criteria version 1.1."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's current ECOG performance status as recorded now (e.g., 0, 1, 2, etc.).","when_to_set_to_null":"Set to null if the patient's current ECOG performance status is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current ECOG performance status (unitless, integer)."} // "Eastern Cooperative Oncology Group performance status = 0 OR Eastern Cooperative Oncology Group performance status = 1"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (or (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_none 0)
         (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_none 1))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (Eastern Cooperative Oncology Group performance status = 0) OR (Eastern Cooperative Oncology Group performance status = 1)."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_received_first_line_platinum_based_treatment_previously Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received first line platinum based treatment at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never received first line platinum based treatment prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously received first line platinum based treatment.","meaning":"Boolean indicating whether the patient has previously received first line platinum based treatment."} // "To be included, the patient must have previously received first line platinum based treatment."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_received_first_line_platinum_based_treatment_previously
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have previously received first line platinum based treatment."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const date_of_last_cycle_of_chemotherapy Real) ;; {"when_to_set_to_value":"Set to the date of the patient's last cycle of chemotherapy if known.","when_to_set_to_null":"Set to null if the date of the last cycle of chemotherapy is unknown, not documented, or cannot be determined.","meaning":"Date representing the last cycle of chemotherapy for the patient."} // "from the last cycle of chemotherapy"
(declare-const date_of_recurrence_of_tumor_determined_by_response_evaluation_criteria_in_solid_tumors_criteria_version_1_1 Real) ;; {"when_to_set_to_value":"Set to the date of recurrence of tumor as determined by Response Evaluation Criteria in Solid Tumors Criteria version 1.1, if known.","when_to_set_to_null":"Set to null if the date of recurrence is unknown, not documented, or cannot be determined.","meaning":"Date representing the recurrence of tumor as determined by Response Evaluation Criteria in Solid Tumors Criteria version 1.1."} // "recurrence (by Response Evaluation Criteria in Solid Tumors Criteria version 1.1)"
(declare-const patient_has_finding_of_recurrent_tumor_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a recurrence of tumor at any time in the history.","when_to_set_to_false":"Set to false if the patient has not had a recurrence of tumor at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a recurrence of tumor in the history.","meaning":"Boolean indicating whether the patient has had a recurrence of tumor at any time in the history."} // "recurrence"
(declare-const patient_has_finding_of_recurrent_tumor_inthehistory@@determined_by_response_evaluation_criteria_in_solid_tumors_criteria_version_1_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's recurrence of tumor is determined by Response Evaluation Criteria in Solid Tumors Criteria version 1.1.","when_to_set_to_false":"Set to false if the patient's recurrence of tumor is not determined by Response Evaluation Criteria in Solid Tumors Criteria version 1.1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the recurrence is determined by Response Evaluation Criteria in Solid Tumors Criteria version 1.1.","meaning":"Boolean indicating whether the patient's recurrence of tumor is determined by Response Evaluation Criteria in Solid Tumors Criteria version 1.1."} // "recurrence (by Response Evaluation Criteria in Solid Tumors Criteria version 1.1)"
(declare-const patient_has_finding_of_recurrent_tumor_inthehistory@@temporalcontext_within_12_months_from_last_cycle_of_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's recurrence of tumor occurred within 12 months from the last cycle of chemotherapy.","when_to_set_to_false":"Set to false if the patient's recurrence of tumor did not occur within 12 months from the last cycle of chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the recurrence occurred within 12 months from the last cycle of chemotherapy.","meaning":"Boolean indicating whether the patient's recurrence of tumor occurred within 12 months from the last cycle of chemotherapy."} // "recurrence ... within 12 months from the last cycle of chemotherapy"
(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone chemotherapy at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chemotherapy in the history.","meaning":"Boolean indicating whether the patient has undergone chemotherapy at any time in the history."} // "chemotherapy"
(declare-const recurrence_time_since_last_cycle_of_chemotherapy_value_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months between the date of recurrence and the date of the last cycle of chemotherapy, if both dates are known.","when_to_set_to_null":"Set to null if either date is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time in months between recurrence and last cycle of chemotherapy."} // "within 12 months from the last cycle of chemotherapy"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definitional: recurrence_time_since_last_cycle_of_chemotherapy_value_in_months is the difference in months between recurrence and last cycle of chemotherapy
(assert
  (! (= recurrence_time_since_last_cycle_of_chemotherapy_value_in_months
        (/ (- date_of_recurrence_of_tumor_determined_by_response_evaluation_criteria_in_solid_tumors_criteria_version_1_1
              date_of_last_cycle_of_chemotherapy) 30.436875))
     :named REQ8_AUXILIARY0)) ;; "number of months between recurrence and last cycle of chemotherapy"

;; Definitional: temporal context qualifier is true iff recurrence occurred within 12 months from last cycle of chemotherapy
(assert
  (! (= patient_has_finding_of_recurrent_tumor_inthehistory@@temporalcontext_within_12_months_from_last_cycle_of_chemotherapy
        (and patient_has_finding_of_recurrent_tumor_inthehistory
             (<= recurrence_time_since_last_cycle_of_chemotherapy_value_in_months 12)))
     :named REQ8_AUXILIARY1)) ;; "recurrence ... within 12 months from the last cycle of chemotherapy"

;; Definitional: RECIST v1.1 qualifier implies stem variable
(assert
  (! (=> patient_has_finding_of_recurrent_tumor_inthehistory@@determined_by_response_evaluation_criteria_in_solid_tumors_criteria_version_1_1
         patient_has_finding_of_recurrent_tumor_inthehistory)
     :named REQ8_AUXILIARY2)) ;; "recurrence (by Response Evaluation Criteria in Solid Tumors Criteria version 1.1)"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Inclusion: recurrence (by RECIST v1.1) within 12 months from last cycle of chemotherapy
(assert
  (! (and patient_has_finding_of_recurrent_tumor_inthehistory@@determined_by_response_evaluation_criteria_in_solid_tumors_criteria_version_1_1
          patient_has_finding_of_recurrent_tumor_inthehistory@@temporalcontext_within_12_months_from_last_cycle_of_chemotherapy)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "recurrence (by Response Evaluation Criteria in Solid Tumors Criteria version 1.1) within 12 months from the last cycle of chemotherapy"
