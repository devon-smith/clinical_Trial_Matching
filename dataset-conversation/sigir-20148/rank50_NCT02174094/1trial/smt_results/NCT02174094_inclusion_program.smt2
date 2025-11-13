;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_inthehistory_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's age in months at the time of their first recorded seizure if this information is known and documented.","when_to_set_to_null":"Set to null if the patient's age in months at first seizure is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in months at the time of their first recorded seizure."}  ;; "onset of seizures in the first year of life (age at first seizure < 12 months)"
(declare-const patient_has_finding_of_seizure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had seizures at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had seizures at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had seizures.","meaning":"Boolean indicating whether the patient has ever had seizures in their history."}  ;; "seizures"
(declare-const patient_has_finding_of_seizure_inthehistory@@onset_before_12_months_of_age Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had seizures in their history and the onset of the first seizure occurred before 12 months of age.","when_to_set_to_false":"Set to false if the patient has ever had seizures in their history but the onset of the first seizure did not occur before 12 months of age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of the first seizure occurred before 12 months of age.","meaning":"Boolean indicating whether the patient has ever had seizures in their history, with onset before 12 months of age."}  ;; "onset of seizures in the first year of life (age at first seizure < 12 months)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_seizure_inthehistory@@onset_before_12_months_of_age
         patient_has_finding_of_seizure_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "onset of seizures in the first year of life (age at first seizure < 12 months)"

;; Definition of onset before 12 months of age
(assert
  (! (= patient_has_finding_of_seizure_inthehistory@@onset_before_12_months_of_age
        (and patient_has_finding_of_seizure_inthehistory
             (< patient_age_value_recorded_inthehistory_in_months 12)))
     :named REQ0_AUXILIARY1)) ;; "onset of seizures in the first year of life (age at first seizure < 12 months)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_seizure_inthehistory@@onset_before_12_months_of_age
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have onset of seizures in the first year of life (age at first seizure < 12 months)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_seizure_inthehistory@@fever_induced Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical seizures were induced by fever.","when_to_set_to_false":"Set to false if the patient's historical seizures were not induced by fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's historical seizures were induced by fever.","meaning":"Boolean indicating whether the patient's historical seizures were induced by fever."}  ;; "fever-induced"
(declare-const patient_has_finding_of_seizure_inthehistory@@prolonged Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical seizures were prolonged.","when_to_set_to_false":"Set to false if the patient's historical seizures were not prolonged.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's historical seizures were prolonged.","meaning":"Boolean indicating whether the patient's historical seizures were prolonged."}  ;; "prolonged"
(declare-const patient_has_finding_of_seizure_inthehistory@@fever_induced@@prolonged Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of seizures that were both induced by fever and prolonged.","when_to_set_to_false":"Set to false if the patient has a documented history of seizures, but those seizures were not both induced by fever and prolonged.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of seizures that were both induced by fever and prolonged.","meaning":"Boolean indicating whether the patient has a history of seizures that were both induced by fever and prolonged."}  ;; "fever-induced prolonged seizures"
(declare-const patient_has_finding_of_seizure_inthehistory@@fever_induced@@prolonged@@as_determined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the determination that the patient has a history of fever-induced prolonged seizures is made by the Investigator.","when_to_set_to_false":"Set to false if the determination that the patient has a history of fever-induced prolonged seizures is not made by the Investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the determination is made by the Investigator.","meaning":"Boolean indicating whether the determination of fever-induced prolonged seizures is made by the Investigator."}  ;; "as determined by the Investigator"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; "fever-induced prolonged seizures" means both fever-induced and prolonged
(assert
  (! (= patient_has_finding_of_seizure_inthehistory@@fever_induced@@prolonged
        (and patient_has_finding_of_seizure_inthehistory@@fever_induced
             patient_has_finding_of_seizure_inthehistory@@prolonged))
     :named REQ1_AUXILIARY0)) ;; "fever-induced prolonged seizures" = "fever-induced" AND "prolonged"

;; Qualifier variable "as determined by the Investigator" implies the underlying fact
(assert
  (! (=> patient_has_finding_of_seizure_inthehistory@@fever_induced@@prolonged@@as_determined_by_investigator
         patient_has_finding_of_seizure_inthehistory@@fever_induced@@prolonged)
     :named REQ1_AUXILIARY1)) ;; "as determined by the Investigator" implies "fever-induced prolonged seizures"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have a history of fever-induced prolonged seizures as determined by the Investigator
(assert
  (! patient_has_finding_of_seizure_inthehistory@@fever_induced@@prolonged@@as_determined_by_investigator
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a history of fever-induced prolonged seizures (as determined by the Investigator)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hemi_clonic_seizure_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hemi-clonic seizures.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hemi-clonic seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hemi-clonic seizures.","meaning":"Boolean indicating whether the patient has a history of hemi-clonic seizures."} ;; "hemi-clonic seizures"
(declare-const patient_has_finding_of_hemi_clonic_seizure_in_the_history@@fever_induced Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hemi-clonic seizures were fever-induced.","when_to_set_to_false":"Set to false if the patient's history of hemi-clonic seizures were not fever-induced.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hemi-clonic seizures were fever-induced.","meaning":"Boolean indicating whether the patient's history of hemi-clonic seizures were fever-induced."} ;; "fever-induced hemi-clonic seizures"
(declare-const patient_has_finding_of_hemi_clonic_seizure_in_the_history@@prolonged Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hemi-clonic seizures were prolonged.","when_to_set_to_false":"Set to false if the patient's history of hemi-clonic seizures were not prolonged.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hemi-clonic seizures were prolonged.","meaning":"Boolean indicating whether the patient's history of hemi-clonic seizures were prolonged."} ;; "prolonged hemi-clonic seizures"
(declare-const hemi_clonic_seizure_duration_value_recorded_in_minutes Real) ;; {"when_to_set_to_value":"Set to the value in minutes if the duration of a documented hemi-clonic seizure episode is recorded.","when_to_set_to_null":"Set to null if the duration in minutes of a documented hemi-clonic seizure episode is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in minutes of a documented hemi-clonic seizure episode."} ;; "duration ≥ 15 minutes"
(declare-const hemi_clonic_seizure_duration_value_recorded_in_minutes@@fever_induced Real) ;; {"when_to_set_to_value":"Set to the value in minutes if the duration of a documented fever-induced hemi-clonic seizure episode is recorded.","when_to_set_to_null":"Set to null if the duration in minutes of a documented fever-induced hemi-clonic seizure episode is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in minutes of a documented fever-induced hemi-clonic seizure episode."} ;; "duration ≥ 15 minutes for fever-induced hemi-clonic seizure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_hemi_clonic_seizure_in_the_history@@fever_induced
         patient_has_finding_of_hemi_clonic_seizure_in_the_history)
     :named REQ2_AUXILIARY0)) ;; "fever-induced hemi-clonic seizures implies hemi-clonic seizures"

(assert
  (! (=> patient_has_finding_of_hemi_clonic_seizure_in_the_history@@prolonged
         patient_has_finding_of_hemi_clonic_seizure_in_the_history)
     :named REQ2_AUXILIARY1)) ;; "prolonged hemi-clonic seizures implies hemi-clonic seizures"

;; If a fever-induced hemi-clonic seizure duration is recorded and ≥ 15, then the patient has a history of fever-induced prolonged hemi-clonic seizures
(assert
  (! (=> (and (>= hemi_clonic_seizure_duration_value_recorded_in_minutes@@fever_induced 15)
              patient_has_finding_of_hemi_clonic_seizure_in_the_history@@fever_induced)
         patient_has_finding_of_hemi_clonic_seizure_in_the_history@@prolonged)
     :named REQ2_AUXILIARY2)) ;; "duration ≥ 15 minutes for fever-induced hemi-clonic seizure implies prolonged fever-induced hemi-clonic seizure"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have had (hemi-clonic seizures with duration ≥ 15 minutes) as a possible fever-induced prolonged seizure type.
(assert
  (! (and patient_has_finding_of_hemi_clonic_seizure_in_the_history@@fever_induced
          (>= hemi_clonic_seizure_duration_value_recorded_in_minutes@@fever_induced 15))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "hemi-clonic seizures with duration ≥ 15 minutes as a possible fever-induced prolonged seizure type"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_epileptic_seizures_clonic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clonic seizures.","when_to_set_to_false":"Set to false if the patient currently does not have clonic seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clonic seizures.","meaning":"Boolean indicating whether the patient currently has clonic seizures."} ;; "clonic seizures"
(declare-const patient_has_finding_of_epileptic_seizures_generalised_tonic_clonic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has generalised tonic-clonic seizures.","when_to_set_to_false":"Set to false if the patient currently does not have generalised tonic-clonic seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has generalised tonic-clonic seizures.","meaning":"Boolean indicating whether the patient currently has generalised tonic-clonic seizures."} ;; "generalised tonic-clonic seizures"
(declare-const patient_has_finding_of_myoclonus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myoclonus (myoclonic jerks or seizures).","when_to_set_to_false":"Set to false if the patient currently does not have myoclonus (myoclonic jerks or seizures).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myoclonus.","meaning":"Boolean indicating whether the patient currently has myoclonus."} ;; "myoclonic jerks OR myoclonic seizures"
(declare-const patient_has_multiple_seizure_types_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has multiple seizure types.","when_to_set_to_false":"Set to false if the patient currently does not have multiple seizure types.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has multiple seizure types.","meaning":"Boolean indicating whether the patient currently has multiple seizure types."} ;; "multiple seizure types"
(declare-const patient_has_multiple_seizure_types_now@@must_include_generalised_tonic_clonic_and_clonic_seizures Bool) ;; {"when_to_set_to_true":"Set to true if the patient's multiple seizure types include both generalised tonic-clonic seizures and clonic seizures.","when_to_set_to_false":"Set to false if the patient's multiple seizure types do not include both generalised tonic-clonic seizures and clonic seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's multiple seizure types include both generalised tonic-clonic seizures and clonic seizures.","meaning":"Boolean indicating whether the patient's multiple seizure types include both generalised tonic-clonic seizures and clonic seizures."} ;; "must include (generalised tonic-clonic seizures) AND (clonic seizures)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; The qualifier variable for multiple seizure types is true iff both required seizure types are present
(assert
  (! (= patient_has_multiple_seizure_types_now@@must_include_generalised_tonic_clonic_and_clonic_seizures
        (and patient_has_finding_of_epileptic_seizures_generalised_tonic_clonic_now
             patient_has_finding_of_epileptic_seizures_clonic_now))
     :named REQ3_AUXILIARY0)) ;; "must include (generalised tonic-clonic seizures) AND (clonic seizures)"

;; The qualifier variable implies the stem variable (having multiple seizure types)
(assert
  (! (=> patient_has_multiple_seizure_types_now@@must_include_generalised_tonic_clonic_and_clonic_seizures
         patient_has_multiple_seizure_types_now)
     :named REQ3_AUXILIARY1)) ;; "multiple seizure types, which must include ..."

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have multiple seizure types, and these must include both generalised tonic-clonic and clonic seizures
(assert
  (! (and patient_has_multiple_seizure_types_now
          patient_has_multiple_seizure_types_now@@must_include_generalised_tonic_clonic_and_clonic_seizures)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have multiple seizure types, which must include (generalised tonic-clonic seizures) AND (clonic seizures); myoclonic jerks OR myoclonic seizures may also be present."

;; ===================== Declarations for the criterion (REQ 4) =====================
;; No new variable declarations needed; variable already present:
;; patient_has_finding_of_epileptic_seizures_generalised_tonic_clonic_now
;; {"when_to_set_to_true":"Set to true if the patient currently has generalised tonic-clonic seizures.","when_to_set_to_false":"Set to false if the patient currently does not have generalised tonic-clonic seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has generalised tonic-clonic seizures.","meaning":"Boolean indicating whether the patient currently has generalised tonic-clonic seizures."}  ;; "generalised tonic-clonic seizures"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_epileptic_seizures_generalised_tonic_clonic_now
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have generalised tonic-clonic seizures."

;; ===================== Declarations for the criterion (REQ 5) =====================
;; No new variable declarations needed; using existing variable:
;; (declare-const patient_has_finding_of_epileptic_seizures_clonic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clonic seizures.","when_to_set_to_false":"Set to false if the patient currently does not have clonic seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clonic seizures.","meaning":"Boolean indicating whether the patient currently has clonic seizures."}  ;; "clonic seizures"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must have clonic seizures.
(assert
  (! patient_has_finding_of_epileptic_seizures_clonic_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have clonic seizures."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_myoclonic_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myoclonic seizures.","when_to_set_to_false":"Set to false if the patient currently does not have myoclonic seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myoclonic seizures.","meaning":"Boolean indicating whether the patient currently has myoclonic seizures."}  ;; "myoclonic seizures"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (or patient_has_finding_of_myoclonus_now
         patient_has_finding_of_myoclonic_seizure_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (myoclonic jerks OR myoclonic seizures)."

;; ===================== Declarations for the inclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_normal_physiological_development_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of normal physiological development at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of normal physiological development at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of normal physiological development.","meaning":"Boolean indicating whether the patient has a history of normal physiological development at any time in the past."} ;; "normal development"
(declare-const patient_has_finding_of_normal_physiological_development_inthehistory@@prior_to_seizure_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of normal physiological development occurred prior to seizure onset.","when_to_set_to_false":"Set to false if the patient's history of normal physiological development did not occur prior to seizure onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the normal development occurred prior to seizure onset.","meaning":"Boolean indicating whether the patient's normal physiological development occurred prior to seizure onset."} ;; "history of normal development prior to seizure onset"
(declare-const patient_has_finding_of_developmental_delay_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of developmental delay at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of developmental delay at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of developmental delay.","meaning":"Boolean indicating whether the patient has a history of developmental delay at any time in the past."} ;; "developmental delay"
(declare-const patient_has_finding_of_developmental_delay_inthehistory@@after_seizure_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of developmental delay occurred after seizure onset.","when_to_set_to_false":"Set to false if the patient's history of developmental delay did not occur after seizure onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the developmental delay occurred after seizure onset.","meaning":"Boolean indicating whether the patient's developmental delay occurred after seizure onset."} ;; "developmental delay after seizure onset"
(declare-const patient_has_finding_of_developmental_regression_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of developmental regression at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of developmental regression at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of developmental regression.","meaning":"Boolean indicating whether the patient has a history of developmental regression at any time in the past."} ;; "developmental regression"
(declare-const patient_has_finding_of_developmental_regression_inthehistory@@after_seizure_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of developmental regression occurred after seizure onset.","when_to_set_to_false":"Set to false if the patient's history of developmental regression did not occur after seizure onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the developmental regression occurred after seizure onset.","meaning":"Boolean indicating whether the patient's developmental regression occurred after seizure onset."} ;; "developmental regression after seizure onset"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable for normal development prior to seizure onset implies stem variable
(assert
  (! (=> patient_has_finding_of_normal_physiological_development_inthehistory@@prior_to_seizure_onset
         patient_has_finding_of_normal_physiological_development_inthehistory)
     :named REQ7_AUXILIARY0)) ;; "history of normal development prior to seizure onset"

;; Qualifier variable for developmental delay after seizure onset implies stem variable
(assert
  (! (=> patient_has_finding_of_developmental_delay_inthehistory@@after_seizure_onset
         patient_has_finding_of_developmental_delay_inthehistory)
     :named REQ7_AUXILIARY1)) ;; "developmental delay after seizure onset"

;; Qualifier variable for developmental regression after seizure onset implies stem variable
(assert
  (! (=> patient_has_finding_of_developmental_regression_inthehistory@@after_seizure_onset
         patient_has_finding_of_developmental_regression_inthehistory)
     :named REQ7_AUXILIARY2)) ;; "developmental regression after seizure onset"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: history of normal development prior to seizure onset
(assert
  (! patient_has_finding_of_normal_physiological_development_inthehistory@@prior_to_seizure_onset
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "history of normal development prior to seizure onset"

;; Component 1: (developmental delay OR developmental regression) after seizure onset
(assert
  (! (or patient_has_finding_of_developmental_delay_inthehistory@@after_seizure_onset
         patient_has_finding_of_developmental_regression_inthehistory@@after_seizure_onset)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "developmental delay OR developmental regression after seizure onset"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_electroencephalogram_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of an abnormal electroencephalogram (EEG).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of an abnormal electroencephalogram (EEG).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal electroencephalogram (EEG).","meaning":"Boolean indicating whether the patient currently has an abnormal electroencephalogram (EEG)."} ;; "abnormal electroencephalogram (EEG)"
(declare-const patient_has_finding_of_electroencephalogram_abnormal_now@@consistent_with_dravet_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal electroencephalogram (EEG) is consistent with Dravet Syndrome.","when_to_set_to_false":"Set to false if the patient's abnormal electroencephalogram (EEG) is not consistent with Dravet Syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal EEG is consistent with Dravet Syndrome.","meaning":"Boolean indicating whether the patient's abnormal EEG is consistent with Dravet Syndrome."} ;; "abnormal electroencephalogram (EEG) consistent with Dravet Syndrome"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_electroencephalogram_abnormal_now@@consistent_with_dravet_syndrome
         patient_has_finding_of_electroencephalogram_abnormal_now)
     :named REQ8_AUXILIARY0)) ;; "abnormal electroencephalogram (EEG) consistent with Dravet Syndrome" implies "abnormal electroencephalogram (EEG)"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: To be included, the patient must have an abnormal electroencephalogram (EEG) consistent with Dravet Syndrome.
(assert
  (! patient_has_finding_of_electroencephalogram_abnormal_now@@consistent_with_dravet_syndrome
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an abnormal electroencephalogram (EEG) consistent with Dravet Syndrome."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_epileptic_seizures_clonic_value_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of clonic seizures the patient has experienced in a 2-week period at any time in their history, if such data is available.","when_to_set_to_null":"Set to null if no such count is available or cannot be determined.","meaning":"Numeric count of clonic seizures in a 2-week period at any time in the patient's history."}  ;; "clonic seizures with frequency ≥ 2 seizures in 2 weeks"
(declare-const patient_epileptic_seizures_tonic_clonic_value_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of tonic-clonic seizures the patient has experienced in a 2-week period at any time in their history, if such data is available.","when_to_set_to_null":"Set to null if no such count is available or cannot be determined.","meaning":"Numeric count of tonic-clonic seizures in a 2-week period at any time in the patient's history."}  ;; "tonic-clonic seizures with frequency ≥ 2 seizures in 2 weeks"
(declare-const patient_has_finding_of_epileptic_seizures_clonic_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had clonic seizures at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had clonic seizures at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had clonic seizures.","meaning":"Boolean indicating whether the patient has ever had clonic seizures in their history."}  ;; "history of clonic seizures"
(declare-const patient_has_finding_of_epileptic_seizures_tonic_clonic_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had tonic-clonic seizures at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had tonic-clonic seizures at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had tonic-clonic seizures.","meaning":"Boolean indicating whether the patient has ever had tonic-clonic seizures in their history."}  ;; "history of tonic-clonic seizures"
(declare-const patient_seizure_value_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of seizures (any type) the patient has experienced in a 2-week period at any time in their history, if such data is available.","when_to_set_to_null":"Set to null if no such count is available or cannot be determined.","meaning":"Numeric count of seizures (any type) in a 2-week period at any time in the patient's history."}  ;; "seizures with frequency ≥ 2 in 2 weeks"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; The patient has a history of tonic-clonic seizures if and only if the count is at least 1
(assert
  (! (=> (>= patient_epileptic_seizures_tonic_clonic_value_recorded_inthehistory_withunit_count 1)
         patient_has_finding_of_epileptic_seizures_tonic_clonic_inthehistory)
     :named REQ9_AUXILIARY0)) ;; "history of tonic-clonic seizures"

;; The patient has a history of clonic seizures if and only if the count is at least 1
(assert
  (! (=> (>= patient_epileptic_seizures_clonic_value_recorded_inthehistory_withunit_count 1)
         patient_has_finding_of_epileptic_seizures_clonic_inthehistory)
     :named REQ9_AUXILIARY1)) ;; "history of clonic seizures"

;; ===================== Constraint Assertions (REQ 9) =====================
;; To be included, the patient must have a history of (tonic-clonic seizures OR clonic seizures) with frequency ≥ 2 seizures in 2 weeks.
(assert
  (! (or (>= patient_epileptic_seizures_tonic_clonic_value_recorded_inthehistory_withunit_count 2)
         (>= patient_epileptic_seizures_clonic_value_recorded_inthehistory_withunit_count 2))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "history of (tonic-clonic seizures OR clonic seizures) with frequency ≥ 2 seizures in 2 weeks"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_anticonvulsant_value_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of distinct anticonvulsant (antiepileptic) drugs the patient has been treated with at any time in their history, excluding Vagal Nerve Stimulator and ketogenic diet.","when_to_set_to_null":"Set to null if the number of anticonvulsant drugs treated with in the patient's history cannot be determined or is not documented.","meaning":"Numeric count of distinct anticonvulsant (antiepileptic) drugs the patient has been treated with in their history, excluding Vagal Nerve Stimulator and ketogenic diet."} ;; "treated with a number of antiepileptic drugs ≥ 1 AND ≤ 3"
(declare-const patient_anticonvulsant_value_recorded_inthehistory_withunit_count@@exclude_vagal_nerve_stimulator_and_ketogenic_diet Bool) ;; {"when_to_set_to_true":"Set to true if the count of anticonvulsant drugs excludes treatments with Vagal Nerve Stimulator and ketogenic diet.","when_to_set_to_false":"Set to false if the count of anticonvulsant drugs includes treatments with Vagal Nerve Stimulator and/or ketogenic diet.","when_to_set_to_null":"Set to null if it is unknown whether Vagal Nerve Stimulator and ketogenic diet are excluded from the count.","meaning":"Boolean indicating whether the count of anticonvulsant drugs excludes Vagal Nerve Stimulator and ketogenic diet treatments."} ;; "treatment with Vagal Nerve Stimulator is NOT considered an antiepileptic drug" and "treatment with ketogenic diet is NOT considered an antiepileptic drug"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: patient must be treated with a number of antiepileptic drugs ≥ 1 AND ≤ 3
(assert
  (! (and (>= patient_anticonvulsant_value_recorded_inthehistory_withunit_count 1)
          (<= patient_anticonvulsant_value_recorded_inthehistory_withunit_count 3))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "treated with a number of antiepileptic drugs ≥ 1 AND ≤ 3"

;; Component 1: treatment with Vagal Nerve Stimulator is NOT considered an antiepileptic drug
(assert
  (! patient_anticonvulsant_value_recorded_inthehistory_withunit_count@@exclude_vagal_nerve_stimulator_and_ketogenic_diet
     :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "treatment with Vagal Nerve Stimulator is NOT considered an antiepileptic drug"

;; Component 2: treatment with ketogenic diet is NOT considered an antiepileptic drug
;; (Already covered by the same qualifier variable as above, so no additional assertion needed)

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_seizure_value_recorded_inthehistory_withunit_count@@temporalcontext_baseline_period Real) ;; {"when_to_set_to_value":"Set to the number of seizures the patient experienced during the Baseline Period (as defined by the study protocol, e.g., 2 or 4 weeks prior to enrollment), if such data is available.","when_to_set_to_null":"Set to null if no such count is available or cannot be determined for the Baseline Period.","meaning":"Numeric value representing the count of seizures experienced by the patient during the Baseline Period (the defined pre-enrollment window for the study)."}  ;; "number of seizures during the Baseline Period (with non-exhaustive examples (2 weeks, 4 weeks))"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (>= patient_seizure_value_recorded_inthehistory_withunit_count@@temporalcontext_baseline_period 2)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have (a number of seizures during the Baseline Period (with non-exhaustive examples (2 weeks, 4 weeks)) ≥ 2)."
