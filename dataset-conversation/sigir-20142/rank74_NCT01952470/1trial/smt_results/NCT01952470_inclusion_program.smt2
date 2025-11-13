;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_undergone_bilateral_sequential_single_lung_transplant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bilateral sequential single lung transplant at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a bilateral sequential single lung transplant at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a bilateral sequential single lung transplant.","meaning":"Boolean indicating whether the patient has ever undergone a bilateral sequential single lung transplant at any time in their history."} // "To be included, the patient must have undergone bilateral sequential lung transplant."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_undergone_bilateral_sequential_single_lung_transplant_inthehistory
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have undergone bilateral sequential lung transplant."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_can_perform_airway_clearance_techniques_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of performing airway clearance techniques.","when_to_set_to_false":"Set to false if the patient is currently not capable of performing airway clearance techniques.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of performing airway clearance techniques.","meaning":"Boolean indicating whether the patient is currently capable of performing airway clearance techniques."} // "capable of performing airway clearance techniques"
(declare-const patient_can_undergo_nebulizer_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of undergoing nebulizer therapy.","when_to_set_to_false":"Set to false if the patient is currently not capable of undergoing nebulizer therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of undergoing nebulizer therapy.","meaning":"Boolean indicating whether the patient is currently capable of undergoing nebulizer therapy."} // "capable of using nebuliser therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_can_perform_airway_clearance_techniques_now
         patient_can_undergo_nebulizer_therapy_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (capable of performing airway clearance techniques) OR (capable of using nebuliser therapy)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pulmonary_exacerbation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary exacerbation.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary exacerbation.","meaning":"Boolean indicating whether the patient currently has pulmonary exacerbation."} // "To be included, the patient must have pulmonary exacerbation (as defined by Fuchs et al)."
(declare-const patient_has_finding_of_pulmonary_exacerbation_now@@defined_by_fuchs_et_al Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pulmonary exacerbation is defined according to the criteria specified by Fuchs et al.","when_to_set_to_false":"Set to false if the patient's current pulmonary exacerbation is not defined according to the criteria specified by Fuchs et al.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pulmonary exacerbation is defined according to the criteria specified by Fuchs et al.","meaning":"Boolean indicating whether the patient's current pulmonary exacerbation is defined according to the criteria specified by Fuchs et al."} // "pulmonary exacerbation (as defined by Fuchs et al)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_pulmonary_exacerbation_now@@defined_by_fuchs_et_al
         patient_has_finding_of_pulmonary_exacerbation_now)
     :named REQ2_AUXILIARY0)) ;; "pulmonary exacerbation (as defined by Fuchs et al)" implies "pulmonary exacerbation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_pulmonary_exacerbation_now@@defined_by_fuchs_et_al
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have pulmonary exacerbation (as defined by Fuchs et al)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently produces or is exposed to sputum.","when_to_set_to_false":"Set to false if the patient currently does not produce or is not exposed to sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently produces or is exposed to sputum.","meaning":"Boolean indicating whether the patient currently produces or is exposed to sputum."} // "To be included, the patient must have sputum production."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_exposed_to_sputum_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have sputum production."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_can_provide_informed_consent_within_48_hours_of_presentation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide informed consent within 48 hours of presentation.","when_to_set_to_false":"Set to false if the patient is not able to provide informed consent within 48 hours of presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide informed consent within 48 hours of presentation.","meaning":"Boolean indicating whether the patient is able to provide informed consent within 48 hours of presentation."} // "To be included, the patient must be able to provide informed consent within 48 hours of presentation."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_can_provide_informed_consent_within_48_hours_of_presentation
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be able to provide informed consent within 48 hours of presentation."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_change_in_physical_examination_of_chest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a change in physical examination of the chest.","when_to_set_to_false":"Set to false if the patient currently does not have a change in physical examination of the chest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a change in physical examination of the chest.","meaning":"Boolean indicating whether the patient currently has a change in physical examination of the chest."} // "change in physical examination of the chest"
(declare-const patient_has_finding_of_change_in_sinus_discharge_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a change in sinus discharge.","when_to_set_to_false":"Set to false if the patient currently does not have a change in sinus discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a change in sinus discharge.","meaning":"Boolean indicating whether the patient currently has a change in sinus discharge."} // "change in sinus discharge"
(declare-const patient_has_finding_of_radiographic_changes_now@@indicative_of_pulmonary_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has radiographic changes that are indicative of pulmonary infection.","when_to_set_to_false":"Set to false if the patient currently does not have radiographic changes that are indicative of pulmonary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has radiographic changes that are indicative of pulmonary infection.","meaning":"Boolean indicating whether the patient currently has radiographic changes that are indicative of pulmonary infection."} // "radiographic changes indicative of pulmonary infection"
(declare-const patient_has_finding_of_sinus_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sinus pain.","when_to_set_to_false":"Set to false if the patient currently does not have sinus pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sinus pain.","meaning":"Boolean indicating whether the patient currently has sinus pain."} // "sinus pain"
(declare-const patient_has_finding_of_sinus_tenderness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sinus tenderness.","when_to_set_to_false":"Set to false if the patient currently does not have sinus tenderness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sinus tenderness.","meaning":"Boolean indicating whether the patient currently has sinus tenderness."} // "sinus tenderness"
(declare-const patient_has_finding_of_change_in_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a change in sputum.","when_to_set_to_false":"Set to false if the patient currently does not have a change in sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a change in sputum.","meaning":"Boolean indicating whether the patient currently has a change in sputum."} // "change in sputum"
(declare-const patient_has_finding_of_new_haemoptysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has new haemoptysis.","when_to_set_to_false":"Set to false if the patient currently does not have new haemoptysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has new haemoptysis.","meaning":"Boolean indicating whether the patient currently has new haemoptysis."} // "new haemoptysis"
(declare-const patient_has_finding_of_increased_haemoptysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased haemoptysis.","when_to_set_to_false":"Set to false if the patient currently does not have increased haemoptysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased haemoptysis.","meaning":"Boolean indicating whether the patient currently has increased haemoptysis."} // "increased haemoptysis"
(declare-const patient_has_finding_of_increased_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased cough.","when_to_set_to_false":"Set to false if the patient currently does not have increased cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased cough.","meaning":"Boolean indicating whether the patient currently has increased cough."} // "increased cough"
(declare-const patient_has_finding_of_increased_dyspnoea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased dyspnoea.","when_to_set_to_false":"Set to false if the patient currently does not have increased dyspnoea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased dyspnoea.","meaning":"Boolean indicating whether the patient currently has increased dyspnoea."} // "increased dyspnoea"
(declare-const patient_has_finding_of_malaise_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malaise.","when_to_set_to_false":"Set to false if the patient currently does not have malaise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malaise.","meaning":"Boolean indicating whether the patient currently has malaise."} // "malaise"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever"
(declare-const patient_has_finding_of_lethargy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lethargy.","when_to_set_to_false":"Set to false if the patient currently does not have lethargy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lethargy.","meaning":"Boolean indicating whether the patient currently has lethargy."} // "lethargy"
(declare-const patient_body_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's currently recorded body temperature in degrees Celsius.","when_to_set_to_null":"Set to null if the patient's current body temperature is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's currently recorded body temperature in degrees Celsius."} // "temperature above 38°C"
(declare-const patient_has_finding_of_anorexia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has anorexia.","when_to_set_to_false":"Set to false if the patient currently does not have anorexia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anorexia.","meaning":"Boolean indicating whether the patient currently has anorexia."} // "anorexia"
(declare-const patient_has_finding_of_weight_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has weight loss.","when_to_set_to_false":"Set to false if the patient currently does not have weight loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has weight loss.","meaning":"Boolean indicating whether the patient currently has weight loss."} // "weight loss"
(declare-const patient_has_finding_of_decrease_in_pulmonary_function_now@@by_10_percent_or_more Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a decrease in pulmonary function by 10% or more.","when_to_set_to_false":"Set to false if the patient currently does not have a decrease in pulmonary function by 10% or more.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a decrease in pulmonary function by 10% or more.","meaning":"Boolean indicating whether the patient currently has a decrease in pulmonary function by 10% or more."} // "decrease in pulmonary function by 10% or more"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; fever or lethargy: non-exhaustive examples for umbrella
(assert
  (! (=> (or patient_has_finding_of_fever_now
             patient_has_finding_of_lethargy_now)
         patient_has_finding_of_fever_now)
     :named REQ5_AUXILIARY0)) ;; "fever or lethargy" umbrella, defaulting to fever as umbrella

;; anorexia or weight loss: non-exhaustive examples for umbrella
(assert
  (! (=> (or patient_has_finding_of_anorexia_now
             patient_has_finding_of_weight_loss_now)
         patient_has_finding_of_anorexia_now)
     :named REQ5_AUXILIARY1)) ;; "anorexia or weight loss" umbrella, defaulting to anorexia as umbrella

;; sinus pain or tenderness: non-exhaustive examples for umbrella
(assert
  (! (=> (or patient_has_finding_of_sinus_pain_now
             patient_has_finding_of_sinus_tenderness_now)
         patient_has_finding_of_sinus_pain_now)
     :named REQ5_AUXILIARY2)) ;; "sinus pain or tenderness" umbrella, defaulting to sinus pain as umbrella

;; new or increased haemoptysis: non-exhaustive examples for umbrella
(assert
  (! (=> (or patient_has_finding_of_new_haemoptysis_now
             patient_has_finding_of_increased_haemoptysis_now)
         patient_has_finding_of_new_haemoptysis_now)
     :named REQ5_AUXILIARY3)) ;; "new or increased haemoptysis" umbrella, defaulting to new haemoptysis as umbrella

;; temperature above 38°C: define as a finding
(assert
  (! (= patient_has_finding_of_fever_now
        (> patient_body_temperature_value_recorded_now_withunit_celsius 38.0))
     :named REQ5_AUXILIARY4)) ;; "temperature above 38°C" defines fever

;; ===================== Fuchs Scale symptom count definition (REQ 5) =====================
(define-fun fuchs_scale_symptom_count () Int
  (+ (ite patient_has_finding_of_change_in_sputum_now 1 0)
     (ite patient_has_finding_of_new_haemoptysis_now 1 0)
     (ite patient_has_finding_of_increased_cough_now 1 0)
     (ite patient_has_finding_of_increased_dyspnoea_now 1 0)
     (ite patient_has_finding_of_malaise_now 1 0)
     (ite patient_has_finding_of_fever_now 1 0)
     (ite patient_has_finding_of_anorexia_now 1 0)
     (ite patient_has_finding_of_sinus_pain_now 1 0)
     (ite patient_has_finding_of_change_in_sinus_discharge_now 1 0)
     (ite patient_has_finding_of_change_in_physical_examination_of_chest_now 1 0)
     (ite patient_has_finding_of_radiographic_changes_now@@indicative_of_pulmonary_infection 1 0)
     (ite patient_has_finding_of_decrease_in_pulmonary_function_now@@by_10_percent_or_more 1 0)
  )) ;; "at least 4 out of the following 12 signs and symptoms"

;; Fuchs Scale definition: at least 4 symptoms
(assert
  (! (= patient_has_finding_of_pulmonary_exacerbation_now@@defined_by_fuchs_et_al
        (>= fuchs_scale_symptom_count 4))
     :named REQ5_AUXILIARY5)) ;; "patient must meet the Fuchs Scale: at least 4 out of 12 signs and symptoms"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_pulmonary_exacerbation_now@@defined_by_fuchs_et_al
         patient_has_finding_of_pulmonary_exacerbation_now)
     :named REQ5_AUXILIARY6)) ;; "pulmonary exacerbation (as defined by Fuchs et al)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (>= fuchs_scale_symptom_count 4)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least 4 out of the following 12 signs and symptoms"
