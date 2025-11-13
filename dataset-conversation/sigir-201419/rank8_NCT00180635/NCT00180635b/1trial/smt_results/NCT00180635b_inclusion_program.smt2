;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker (actively smokes tobacco at present).","when_to_set_to_false":"Set to false if the patient is currently not a smoker (does not actively smoke tobacco at present).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "To be included, the patient must be a current smoker."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a current smoker."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_spirometry_now_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone spirometry now and the outcome is normal.","when_to_set_to_false":"Set to false if the patient has undergone spirometry now and the outcome is not normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone spirometry now and the outcome is normal.","meaning":"Boolean indicating whether the patient has undergone spirometry now and the outcome is normal."} // "To be included, the patient must have normal spirometry, with or without chronic symptom of cough or chronic symptom of sputum production."
(declare-const patient_has_symptoms_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of cough.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of cough.","meaning":"Boolean indicating whether the patient currently has symptoms of cough."} // "with or without chronic symptom of cough"
(declare-const patient_has_symptoms_of_cough_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of cough and the cough is chronic.","when_to_set_to_false":"Set to false if the patient currently has symptoms of cough but the cough is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cough symptoms are chronic.","meaning":"Boolean indicating whether the patient's current cough symptoms are chronic."} // "with or without chronic symptom of cough"
(declare-const patient_has_symptoms_of_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of sputum production.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of sputum production.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of sputum production.","meaning":"Boolean indicating whether the patient currently has symptoms of sputum production."} // "with or without chronic symptom of sputum production."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for chronic cough implies cough
(assert
  (! (=> patient_has_symptoms_of_cough_now@@chronic
         patient_has_symptoms_of_cough_now)
     :named REQ1_AUXILIARY0)) ;; "with or without chronic symptom of cough"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have normal spirometry, regardless of presence or absence of chronic cough or chronic sputum production
(assert
  (! patient_has_undergone_spirometry_now_outcome_is_normal
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal spirometry, with or without chronic symptom of cough or chronic symptom of sputum production."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_forced_expired_volume_in_1_second_reversibility_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if the patient's forced expiratory volume in one second reversibility is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent value representing the patient's current forced expiratory volume in one second reversibility."} // "forced expiratory volume in one second reversibility"
(declare-const patient_forced_expired_volume_in_1_second_reversibility_value_recorded_now_withunit_percent@@measured_after_inhaled_beta2_agonist_administration Bool) ;; {"when_to_set_to_true":"Set to true if the forced expiratory volume in one second reversibility measurement was taken after administration of an inhaled beta2-agonist.","when_to_set_to_false":"Set to false if the measurement was not taken after administration of an inhaled beta2-agonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken after inhaled beta2-agonist administration.","meaning":"Boolean indicating whether the FEV1 reversibility measurement was taken after inhaled beta2-agonist administration."} // "after inhaled beta2-agonist administration"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have forced expiratory volume in one second reversibility < 15 percent after inhaled beta2-agonist administration.
(assert
  (! (and patient_forced_expired_volume_in_1_second_reversibility_value_recorded_now_withunit_percent@@measured_after_inhaled_beta2_agonist_administration
          (< patient_forced_expired_volume_in_1_second_reversibility_value_recorded_now_withunit_percent 15.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_able_to_comprehend_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to comprehend.","when_to_set_to_false":"Set to false if the patient is currently not able to comprehend.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to comprehend.","meaning":"Boolean indicating whether the patient is currently able to comprehend."} // "To be included, the patient must be able to comprehend."
(declare-const patient_is_able_to_grant_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to grant a written informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to grant a written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to grant a written informed consent.","meaning":"Boolean indicating whether the patient is currently able to grant a written informed consent."} // "To be included, the patient must be able to grant a written informed consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_able_to_comprehend_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to comprehend."
(assert
  (! patient_is_able_to_grant_written_informed_consent_now
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be able to grant a written informed consent."
