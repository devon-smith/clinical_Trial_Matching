;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_sinus_rhythm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in sinus rhythm.","when_to_set_to_false":"Set to false if the patient is currently not in sinus rhythm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in sinus rhythm.","meaning":"Boolean indicating whether the patient is currently in sinus rhythm."} // "sinus rhythm"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_sinus_rhythm_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be in sinus rhythm."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_typical_chest_pain_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had typical chest pain within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not had typical chest pain within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had typical chest pain within the past 24 hours.","meaning":"Boolean indicating whether the patient has had typical chest pain within the past 24 hours."} // "typical chest pain within the last 24 hours"
(declare-const typical_chest_pain_duration_value_recorded_inthepast24hours_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the duration in minutes of a typical chest pain episode recorded within the past 24 hours.","when_to_set_to_null":"Set to null if the duration in minutes of a typical chest pain episode within the past 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in minutes of a typical chest pain episode recorded within the past 24 hours."} // "typical chest pain lasting > 5 minutes within the last 24 hours"
(declare-const patient_has_finding_of_atypical_chest_pain_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had atypical chest pain within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not had atypical chest pain within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had atypical chest pain within the past 24 hours.","meaning":"Boolean indicating whether the patient has had atypical chest pain within the past 24 hours."} // "atypical chest pain within the last 24 hours"
(declare-const atypical_chest_pain_duration_value_recorded_inthepast24hours_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the duration in minutes of an atypical chest pain episode recorded within the past 24 hours.","when_to_set_to_null":"Set to null if the duration in minutes of an atypical chest pain episode within the past 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in minutes of an atypical chest pain episode recorded within the past 24 hours."} // "atypical chest pain lasting > 5 minutes within the last 24 hours"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Typical chest pain lasting > 5 minutes within the last 24 hours
(assert
  (! (= patient_has_finding_of_typical_chest_pain_inthepast24hours
        (> typical_chest_pain_duration_value_recorded_inthepast24hours_withunit_minutes 5.0))
     :named REQ1_AUXILIARY0)) ;; "typical chest pain lasting > 5 minutes within the last 24 hours"

;; Atypical chest pain lasting > 5 minutes within the last 24 hours
(assert
  (! (= patient_has_finding_of_atypical_chest_pain_inthepast24hours
        (> atypical_chest_pain_duration_value_recorded_inthepast24hours_withunit_minutes 5.0))
     :named REQ1_AUXILIARY1)) ;; "atypical chest pain lasting > 5 minutes within the last 24 hours"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have ((typical chest pain lasting > 5 minutes within the last 24 hours) OR (atypical chest pain lasting > 5 minutes within the last 24 hours)).
(assert
  (! (or patient_has_finding_of_typical_chest_pain_inthepast24hours
         patient_has_finding_of_atypical_chest_pain_inthepast24hours)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ((typical chest pain lasting > 5 minutes within the last 24 hours) OR (atypical chest pain lasting > 5 minutes within the last 24 hours))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const estimated_pre_test_probability_of_significant_coronary_artery_disease_value_recorded_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the numeric value (in percent) of the patient's estimated pre-test probability of significant coronary artery disease, as determined by the relevant clinical assessment.","when_to_set_to_null":"Set to null if the estimated pre-test probability of significant coronary artery disease is not documented, unknown, or cannot be determined.","meaning":"Numeric value (percent) representing the estimated pre-test probability that the patient has significant coronary artery disease."} // "estimated pre-test probability of significant coronary artery disease > 15%"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (> estimated_pre_test_probability_of_significant_coronary_artery_disease_value_recorded_withunit_percent 15.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an estimated pre-test probability of significant coronary artery disease > 15%."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal electrocardiogram changes.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal electrocardiogram changes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal electrocardiogram changes.","meaning":"Boolean indicating whether the patient currently has abnormal electrocardiogram changes."} // "electrocardiogram changes"
(declare-const patient_inverted_t_wave_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value in millimeters if a numeric measurement of T wave inversion recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current T wave inversion in millimeters."} // "T wave inversion"
(declare-const patient_segment_deviation_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value in millimeters if a numeric measurement of ST-segment deviation recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST-segment deviation in millimeters."} // "ST-segment deviation"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition in the requirement: electrocardiogram changes suggestive of myocardial ischemia
(assert
  (! (= patient_has_finding_of_electrocardiogram_abnormal_now
        (or 
          (and (> patient_segment_deviation_value_recorded_now_withunit_millimeter 1.0))
          (and (> patient_inverted_t_wave_value_recorded_now_withunit_millimeter 4.0))
        ))
     :named REQ3_AUXILIARY0)) ;; "electrocardiogram changes suggestive of myocardial ischemia (defined as (ST-segment deviation > 1 millimeter in at least two contiguous leads) OR (T wave inversion > 4 millimeters in at least two contiguous leads))"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have absence of electrocardiogram changes suggestive of myocardial ischemia
(assert
  (! (not patient_has_finding_of_electrocardiogram_abnormal_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "absence of electrocardiogram changes suggestive of myocardial ischemia"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_troponin_i_value_recorded_now_withunit_nanograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's troponin I concentration is recorded at admission in nanograms per milliliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's troponin I concentration measured at admission, in nanograms per milliliter."} // "initial troponin I at admission < 0.05 nanograms per milliliter"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (< patient_troponin_i_value_recorded_now_withunit_nanograms_per_milliliter 0.05)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "initial troponin I at admission < 0.05 nanograms per milliliter"
