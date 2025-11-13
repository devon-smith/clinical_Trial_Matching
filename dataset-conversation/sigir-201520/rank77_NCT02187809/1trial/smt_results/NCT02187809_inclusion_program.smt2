;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_severe_myoclonic_epilepsy_in_infancy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received a diagnosis of Dravet Syndrome (severe myoclonic epilepsy in infancy).","when_to_set_to_false":"Set to false if the patient has never received a diagnosis of Dravet Syndrome (severe myoclonic epilepsy in infancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received a diagnosis of Dravet Syndrome.","meaning":"Boolean indicating whether the patient has ever been diagnosed with Dravet Syndrome (severe myoclonic epilepsy in infancy)."}

(declare-const patient_has_finding_of_seizure_inthehistory@@onset_in_first_year_of_life Bool) ;; {"when_to_set_to_true":"Set to true if the patient's first seizure occurred in the first year of life.","when_to_set_to_false":"Set to false if the patient's first seizure occurred after the first year of life.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient's first seizure occurred.","meaning":"Boolean indicating whether the patient's seizure onset occurred in the first year of life."}

(declare-const patient_has_finding_of_seizure_inthehistory@@fever_induced Bool) ;; {"when_to_set_to_true":"Set to true if the patient's seizures were induced by fever.","when_to_set_to_false":"Set to false if the patient's seizures were not induced by fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's seizures were induced by fever.","meaning":"Boolean indicating whether the patient's seizures were induced by fever."}

(declare-const patient_has_finding_of_seizure_inthehistory@@prolonged_with_duration_gte_15_minutes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's seizures lasted 15 minutes or longer.","when_to_set_to_false":"Set to false if the patient's seizures lasted less than 15 minutes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's seizures lasted 15 minutes or longer.","meaning":"Boolean indicating whether the patient's seizures lasted 15 minutes or longer."}

(declare-const patient_has_finding_of_seizure_inthehistory@@determined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the history of the patient's seizures was determined by the Investigator.","when_to_set_to_false":"Set to false if the history of the patient's seizures was not determined by the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history of the patient's seizures was determined by the Investigator.","meaning":"Boolean indicating whether the history of the patient's seizures was determined by the Investigator."}

(declare-const patient_has_finding_of_epileptic_seizures_clonic_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had clonic seizures.","when_to_set_to_false":"Set to false if the patient has never had clonic seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had clonic seizures.","meaning":"Boolean indicating whether the patient has ever had clonic seizures."}

(declare-const patient_has_finding_of_myoclonus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had myoclonic jerks (myoclonus).","when_to_set_to_false":"Set to false if the patient has never had myoclonic jerks (myoclonus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had myoclonic jerks (myoclonus).","meaning":"Boolean indicating whether the patient has ever had myoclonic jerks (myoclonus)."}

(declare-const patient_has_finding_of_developmental_delay_inthehistory@@occurred_after_seizure_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's developmental delay occurred after seizure onset.","when_to_set_to_false":"Set to false if the patient's developmental delay did not occur after seizure onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's developmental delay occurred after seizure onset.","meaning":"Boolean indicating whether the patient's developmental delay occurred after seizure onset."}

(declare-const patient_has_finding_of_developmental_regression_inthehistory@@occurred_after_seizure_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's developmental regression occurred after seizure onset.","when_to_set_to_false":"Set to false if the patient's developmental regression did not occur after seizure onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's developmental regression occurred after seizure onset.","meaning":"Boolean indicating whether the patient's developmental regression occurred after seizure onset."}

(declare-const patient_has_history_of_normal_development_prior_to_seizure_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient had normal development prior to the onset of seizures.","when_to_set_to_false":"Set to false if the patient did not have normal development prior to the onset of seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had normal development prior to the onset of seizures.","meaning":"Boolean indicating whether the patient had normal development prior to the onset of seizures."}

(declare-const patient_has_finding_of_electroencephalogram_abnormal_inthehistory@@consistent_with_dravet_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal electroencephalogram is consistent with Dravet Syndrome.","when_to_set_to_false":"Set to false if the patient's abnormal electroencephalogram is not consistent with Dravet Syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's abnormal electroencephalogram is consistent with Dravet Syndrome.","meaning":"Boolean indicating whether the patient's abnormal electroencephalogram is consistent with Dravet Syndrome."}

;; Generalised tonic-clonic seizures variable (not present in input, must declare)
(declare-const patient_has_finding_of_epileptic_seizures_generalised_tonic_clonic_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had generalised tonic-clonic seizures.","when_to_set_to_false":"Set to false if the patient has never had generalised tonic-clonic seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had generalised tonic-clonic seizures.","meaning":"Boolean indicating whether the patient has ever had generalised tonic-clonic seizures."}

;; Myoclonic seizures variable (not present in input, must declare)
(declare-const patient_has_finding_of_epileptic_seizures_myoclonic_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had myoclonic seizures.","when_to_set_to_false":"Set to false if the patient has never had myoclonic seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had myoclonic seizures.","meaning":"Boolean indicating whether the patient has ever had myoclonic seizures."}

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Diagnosis of Dravet Syndrome
(assert
  (! patient_has_diagnosis_of_severe_myoclonic_epilepsy_in_infancy_inthehistory
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of Dravet Syndrome."

;; Component 1: Onset of seizures in the first year of life
(assert
  (! patient_has_finding_of_seizure_inthehistory@@onset_in_first_year_of_life
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have onset of seizures in the first year of life."

;; Component 2: History of fever-induced prolonged seizures as determined by the Investigator (may include prolonged hemi-clonic seizures with duration ≥ 15 minutes)
(assert
  (! (and patient_has_finding_of_seizure_inthehistory@@fever_induced
          patient_has_finding_of_seizure_inthehistory@@prolonged_with_duration_gte_15_minutes
          patient_has_finding_of_seizure_inthehistory@@determined_by_investigator)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a history of fever-induced prolonged seizures as determined by the Investigator (which may include prolonged hemi-clonic seizures with duration ≥ 15 minutes)."

;; Component 3: Generalised tonic-clonic seizures (required for inclusion)
(assert
  (! patient_has_finding_of_epileptic_seizures_generalised_tonic_clonic_inthehistory
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have generalised tonic-clonic seizures (required for inclusion)."

;; Component 4: Clonic seizures (required for inclusion)
(assert
  (! patient_has_finding_of_epileptic_seizures_clonic_inthehistory
     :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have clonic seizures (required for inclusion)."

;; Component 5: (myoclonic jerks OR myoclonic seizures)
(assert
  (! (or patient_has_finding_of_myoclonus_inthehistory
         patient_has_finding_of_epileptic_seizures_myoclonic_inthehistory)
     :named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (myoclonic jerks OR myoclonic seizures)."

;; Component 6: History of normal development prior to seizure onset
(assert
  (! patient_has_history_of_normal_development_prior_to_seizure_onset
     :named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a history of normal development prior to seizure onset."

;; Component 7: (development delay OR development regression after seizure onset)
(assert
  (! (or patient_has_finding_of_developmental_delay_inthehistory@@occurred_after_seizure_onset
         patient_has_finding_of_developmental_regression_inthehistory@@occurred_after_seizure_onset)
     :named REQ0_COMPONENT7_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (development delay OR development regression after seizure onset)."

;; Component 8: Abnormal electroencephalogram consistent with Dravet Syndrome
(assert
  (! patient_has_finding_of_electroencephalogram_abnormal_inthehistory@@consistent_with_dravet_syndrome
     :named REQ0_COMPONENT8_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have abnormal electroencephalogram consistent with Dravet Syndrome."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_clobazam_value_recorded_now_withunit_milligrams_per_day Real) ;; {"when_to_set_to_value":"Set to the patient's current daily dose of clobazam in milligrams per day if available.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current daily dose of clobazam in milligrams per day."} // "dose ≤ 20 milligrams per day"
(declare-const patient_clobazam_value_recorded_now_withunit_milligrams_per_kilogram_per_day Real) ;; {"when_to_set_to_value":"Set to the patient's current daily dose of clobazam in milligrams per kilogram per day if available.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current daily dose of clobazam in milligrams per kilogram per day."} // "dose ≥ 0.5 milligrams per kilogram per day"
(declare-const patient_is_exposed_to_clobazam_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving clobazam.","when_to_set_to_false":"Set to false if the patient is not currently receiving clobazam.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving clobazam.","meaning":"Boolean indicating whether the patient is currently receiving clobazam."} // "currently receiving clobazam"
(declare-const patient_is_exposed_to_clobazam_now@@dose_is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving clobazam and the dose has been stable (unchanged) over the relevant period.","when_to_set_to_false":"Set to false if the patient is currently receiving clobazam but the dose has not been stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose has been stable.","meaning":"Boolean indicating whether the patient is currently receiving clobazam and the dose has been stable."} // "stable dose of clobazam"
(declare-const patient_is_exposed_to_clobazam_now@@duration_of_exposure_at_least_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving clobazam and has been receiving it for at least 3 months.","when_to_set_to_false":"Set to false if the patient is currently receiving clobazam but has not been receiving it for at least 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been receiving clobazam for at least 3 months.","meaning":"Boolean indicating whether the patient is currently receiving clobazam and has been receiving it for at least 3 months."} // "for ≥ 3 months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_is_exposed_to_clobazam_now@@dose_is_stable
         patient_is_exposed_to_clobazam_now)
     :named REQ1_AUXILIARY0)) ;; "stable dose of clobazam"

(assert
  (! (=> patient_is_exposed_to_clobazam_now@@duration_of_exposure_at_least_3_months
         patient_is_exposed_to_clobazam_now)
     :named REQ1_AUXILIARY1)) ;; "receiving clobazam for ≥ 3 months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patient_is_exposed_to_clobazam_now@@dose_is_stable
          patient_is_exposed_to_clobazam_now@@duration_of_exposure_at_least_3_months
          (>= patient_clobazam_value_recorded_now_withunit_milligrams_per_kilogram_per_day 0.5)
          (<= patient_clobazam_value_recorded_now_withunit_milligrams_per_day 20.0))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "currently receiving a stable dose of clobazam ≥ 0.5 mg/kg/day AND dose ≤ 20 mg/day for ≥ 3 months"

;; ===================== Declarations for the criterion (REQ 2) =====================
;; No new variables required for this criterion, as it is a placeholder for other protocol-defined inclusion criteria.

;; ===================== Constraint Assertions (REQ 2) =====================
;; The requirement states: "To be included, the patient must meet other protocol-defined inclusion criteria."
;; This is a placeholder and does not impose any additional constraint in SMT.
(assert
  (! true
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must meet other protocol-defined inclusion criteria."
