;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."}  ;; "child aged ≥ 2 months AND ≤ 12 months"
(declare-const patient_has_been_seen_in_emergency_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being seen in the emergency department.","when_to_set_to_false":"Set to false if the patient is not currently being seen in the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being seen in the emergency department.","meaning":"Boolean indicating whether the patient is currently being seen in the emergency department."}  ;; "seen in the emergency department"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and (>= patient_age_value_recorded_now_in_months 2.0)
          (<= patient_age_value_recorded_now_in_months 12.0))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "child aged ≥ 2 months AND ≤ 12 months"

(assert
  (! patient_has_been_seen_in_emergency_department_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "seen in the emergency department"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_bronchiolitis_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's clinical bronchiolitis score by modified Wood's Clinical Bronchiolitis Score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's clinical bronchiolitis score (by modified Wood's Clinical Bronchiolitis Score) recorded now."}  ;; "clinical bronchiolitis score > 3 by modified Wood's Clinical Bronchiolitis Score"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_bronchiolitis_value_recorded_now_withunit_score 3)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a clinical bronchiolitis score > 3 by modified Wood's Clinical Bronchiolitis Score"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tachypnea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tachypnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachypnea.","meaning":"Boolean indicating whether the patient currently has tachypnea."}  ;; "tachypnea"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."}  ;; "cough"
(declare-const patient_has_finding_of_prolonged_expiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of prolonged expiratory phase.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of prolonged expiratory phase.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has prolonged expiratory phase.","meaning":"Boolean indicating whether the patient currently has prolonged expiratory phase."}  ;; "prolonged expiratory phase"
(declare-const patient_has_finding_of_wheezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of wheezing.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has wheezing.","meaning":"Boolean indicating whether the patient currently has wheezing."}  ;; "wheezing"
(declare-const patient_has_finding_of_respiratory_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory crackles.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory crackles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory crackles.","meaning":"Boolean indicating whether the patient currently has respiratory crackles."}  ;; "rales"
(declare-const patient_has_finding_of_chest_wall_retraction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest wall retractions.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest wall retractions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest wall retractions.","meaning":"Boolean indicating whether the patient currently has chest wall retractions."}  ;; "chest retractions"
(declare-const patient_has_finding_of_hyperinflation_of_lungs_on_chest_radiograph_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyperinflation of the lungs as seen on a chest radiograph.","when_to_set_to_false":"Set to false if the patient currently does not have hyperinflation of the lungs as seen on a chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperinflation of the lungs as seen on a chest radiograph.","meaning":"Boolean indicating whether the patient currently has hyperinflation of the lungs as seen on a chest radiograph."}  ;; "hyperinflation of lungs on chest radiograph"
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest x-ray (radiograph) now.","when_to_set_to_false":"Set to false if the patient has not undergone a plain chest x-ray (radiograph) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest x-ray (radiograph) now.","meaning":"Boolean indicating whether the patient has undergone a plain chest x-ray (radiograph) now."}  ;; "chest radiograph"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Hyperinflation of lungs on chest radiograph requires that a chest x-ray was performed
(assert
  (! (=> patient_has_finding_of_hyperinflation_of_lungs_on_chest_radiograph_now
         patient_has_undergone_plain_chest_x_ray_now)
     :named REQ2_AUXILIARY0)) ;; "hyperinflation of lungs on chest radiograph" implies "chest radiograph was performed"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must meet the diagnostic criteria of bronchiolitis, which includes ALL of:
;; tachypnea, cough, prolonged expiratory phase, wheezing, rales, chest retractions, and hyperinflation of lungs on chest radiograph
(assert
  (! (and patient_has_finding_of_tachypnea_now
          patient_has_finding_of_cough_now
          patient_has_finding_of_prolonged_expiration_now
          patient_has_finding_of_wheezing_now
          patient_has_finding_of_respiratory_crackles_now
          patient_has_finding_of_chest_wall_retraction_now
          patient_has_finding_of_hyperinflation_of_lungs_on_chest_radiograph_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet the diagnostic criteria of bronchiolitis, which includes tachypnea, cough, prolonged expiratory phase, wheezing, rales, chest retractions, and hyperinflation of lungs on chest radiograph."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_respiratory_syncytial_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory syncytial virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory syncytial virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory syncytial virus infection.","meaning":"Boolean indicating whether the patient currently has respiratory syncytial virus infection."}  ;; "respiratory syncytial virus infection"
(declare-const patient_has_finding_of_respiratory_syncytial_virus_infection_now@@tested_by_rapid_enzyme_linked_immunoabsorbent_assay_of_nasal_secretions Bool) ;; {"when_to_set_to_true":"Set to true if the patient's respiratory syncytial virus infection is tested by rapid enzyme-linked immunoabsorbent assay of nasal secretions.","when_to_set_to_false":"Set to false if the patient's respiratory syncytial virus infection is not tested by rapid enzyme-linked immunoabsorbent assay of nasal secretions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory syncytial virus infection is tested by rapid enzyme-linked immunoabsorbent assay of nasal secretions.","meaning":"Boolean indicating whether the patient's respiratory syncytial virus infection is tested by rapid enzyme-linked immunoabsorbent assay of nasal secretions."}  ;; "respiratory syncytial virus infection tested by rapid enzyme-linked immunoabsorbent assay of nasal secretions"
(declare-const patient_has_consented_to_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided consent to participate in the study.","when_to_set_to_false":"Set to false if the patient has not provided consent to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent to participate in the study.","meaning":"Boolean indicating whether the patient has provided consent to participate in the study."}  ;; "have consented to the study"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_respiratory_syncytial_virus_infection_now@@tested_by_rapid_enzyme_linked_immunoabsorbent_assay_of_nasal_secretions
         patient_has_finding_of_respiratory_syncytial_virus_infection_now)
     :named REQ3_AUXILIARY0)) ;; "respiratory syncytial virus infection tested by rapid enzyme-linked immunoabsorbent assay of nasal secretions" implies "respiratory syncytial virus infection"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must have RSV infection tested by rapid ELISA of nasal secretions
(assert
  (! patient_has_finding_of_respiratory_syncytial_virus_infection_now@@tested_by_rapid_enzyme_linked_immunoabsorbent_assay_of_nasal_secretions
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "respiratory syncytial virus infection tested by rapid enzyme-linked immunoabsorbent assay of nasal secretions"

;; Component 1: Must have consented to the study
(assert
  (! patient_has_consented_to_the_study
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have consented to the study"
