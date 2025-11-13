;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_congestive_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with congestive heart failure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with congestive heart failure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with congestive heart failure.","meaning":"Boolean indicating whether the patient has a history of congestive heart failure."} ;; "the patient has a history of congestive heart failure"

(declare-const patient_plasma_b_natriuretic_peptide_measurement_value_recorded_now_withunit_picograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's B-type natriuretic peptide concentration (in picograms per milliliter) is recorded now by the treating physician.","when_to_set_to_null":"Set to null if no such measurement is available or if it is unknown whether the measurement was obtained by the treating physician.","meaning":"Numeric value of the patient's B-type natriuretic peptide concentration (pg/mL) measured now by the treating physician."} ;; "B-type natriuretic peptide concentration"

(declare-const patient_plasma_b_natriuretic_peptide_measurement_value_recorded_now_withunit_picograms_per_milliliter@@obtained_by_treating_physician Bool) ;; {"when_to_set_to_true":"Set to true if the B-type natriuretic peptide concentration measurement was obtained by the treating physician.","when_to_set_to_false":"Set to false if the measurement was not obtained by the treating physician.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was obtained by the treating physician.","meaning":"Indicates whether the B-type natriuretic peptide concentration measurement was obtained by the treating physician."} ;; "if obtained by the treating physician"

(declare-const patient_n_terminal_pro_brain_natriuretic_peptide_level_value_recorded_now_withunit_picograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's N-terminal pro B-type natriuretic peptide concentration (in picograms per milliliter) is recorded now by the treating physician.","when_to_set_to_null":"Set to null if no such measurement is available or if it is unknown whether the measurement was obtained by the treating physician.","meaning":"Numeric value of the patient's N-terminal pro B-type natriuretic peptide concentration (pg/mL) measured now by the treating physician."} ;; "N-terminal pro B-type natriuretic peptide concentration"

(declare-const patient_n_terminal_pro_brain_natriuretic_peptide_level_value_recorded_now_withunit_picograms_per_milliliter@@obtained_by_treating_physician Bool) ;; {"when_to_set_to_true":"Set to true if the N-terminal pro B-type natriuretic peptide concentration measurement was obtained by the treating physician.","when_to_set_to_false":"Set to false if the measurement was not obtained by the treating physician.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was obtained by the treating physician.","meaning":"Indicates whether the N-terminal pro B-type natriuretic peptide concentration measurement was obtained by the treating physician."} ;; "if obtained by the treating physician"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and
    patient_has_diagnosis_of_congestive_heart_failure_inthehistory
    (or
      (and patient_plasma_b_natriuretic_peptide_measurement_value_recorded_now_withunit_picograms_per_milliliter@@obtained_by_treating_physician
           (> patient_plasma_b_natriuretic_peptide_measurement_value_recorded_now_withunit_picograms_per_milliliter 500))
      (and patient_n_terminal_pro_brain_natriuretic_peptide_level_value_recorded_now_withunit_picograms_per_milliliter@@obtained_by_treating_physician
           (> patient_n_terminal_pro_brain_natriuretic_peptide_level_value_recorded_now_withunit_picograms_per_milliliter 900))
    )
  ))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of congestive heart failure) AND ((the patient has a B-type natriuretic peptide concentration > 500 picograms per milliliter if obtained by the treating physician) OR (the patient has an N-terminal pro B-type natriuretic peptide concentration > 900 picograms per milliliter if obtained by the treating physician)))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_suspicion_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the treating physician currently suspects the patient has congestive heart failure.","when_to_set_to_false":"Set to false if the treating physician currently does not suspect the patient has congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the treating physician currently suspects congestive heart failure.","meaning":"Boolean indicating whether the patient is currently suspected to have congestive heart failure."} ;; "the treating physician suspects the patient has congestive heart failure"
(declare-const patient_has_suspicion_of_congestive_heart_failure_now@@new_onset Bool) ;; {"when_to_set_to_true":"Set to true if the suspicion of congestive heart failure is specifically for new onset (recently developed) congestive heart failure.","when_to_set_to_false":"Set to false if the suspicion of congestive heart failure is not for new onset (i.e., chronic or pre-existing) congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspicion is for new onset congestive heart failure.","meaning":"Boolean indicating whether the suspicion of congestive heart failure is specifically for new onset (recently developed) congestive heart failure."} ;; "the treating physician suspects the patient has new onset congestive heart failure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_suspicion_of_congestive_heart_failure_now@@new_onset
       patient_has_suspicion_of_congestive_heart_failure_now)
   :named REQ1_AUXILIARY0)) ;; "the suspicion is specifically for new onset congestive heart failure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_suspicion_of_congestive_heart_failure_now@@new_onset)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the treating physician suspects the patient has new onset congestive heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_ekg_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has electrocardiogram changes that are diagnostic of acute myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have electrocardiogram changes diagnostic of acute myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has electrocardiogram changes diagnostic of acute myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has electrocardiogram changes diagnostic of acute myocardial ischemia."} ;; "electrocardiogram changes diagnostic of acute myocardial ischemia"
(declare-const patient_has_finding_of_ekg_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has electrocardiogram changes that are diagnostic of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have electrocardiogram changes diagnostic of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has electrocardiogram changes diagnostic of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has electrocardiogram changes diagnostic of acute myocardial infarction."} ;; "electrocardiogram changes diagnostic of acute myocardial infarction"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_ekg_myocardial_ischemia_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has electrocardiogram changes diagnostic of acute myocardial ischemia."

(assert
(! (not patient_has_finding_of_ekg_myocardial_infarction_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has electrocardiogram changes diagnostic of acute myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_ischemic_chest_pain_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had ischemic chest pain at any time within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not had ischemic chest pain at any time within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had ischemic chest pain within the past 24 hours.","meaning":"Boolean indicating whether the patient has had ischemic chest pain within the past 24 hours."} ;; "ischemic chest pain within the prior 24 hours"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_ischemic_chest_pain_inthepast24hours)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of ischemic chest pain within the prior 24 hours."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_chest_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest injury (chest trauma).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest injury (chest trauma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest injury (chest trauma).","meaning":"Boolean indicating whether the patient currently has chest injury (chest trauma)."} ;; "chest trauma"
(declare-const patient_has_finding_of_chest_injury_now@@obvious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest injury (chest trauma) is obvious.","when_to_set_to_false":"Set to false if the patient's current chest injury (chest trauma) is not obvious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest injury (chest trauma) is obvious.","meaning":"Boolean indicating whether the patient's current chest injury (chest trauma) is obvious."} ;; "obvious chest trauma"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_chest_injury_now@@obvious
      patient_has_finding_of_chest_injury_now)
:named REQ4_AUXILIARY0)) ;; "obvious chest trauma" qualifier implies chest injury

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_chest_injury_now@@obvious)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has obvious chest trauma."
