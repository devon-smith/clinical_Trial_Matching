;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not classified as an outpatient (e.g., inpatient, emergency, etc.).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an outpatient.","meaning":"Boolean indicating whether the patient is currently classified as an outpatient."} ;; "To be included, the patient must be an outpatient."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_outpatient_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an outpatient."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_fulfills_clinical_diagnostic_criteria_for_acute_bacterial_exacerbation_of_chronic_bronchitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently fulfills the clinical diagnostic criteria for acute bacterial exacerbation of chronic bronchitis.","when_to_set_to_false":"Set to false if the patient currently does not fulfill the clinical diagnostic criteria for acute bacterial exacerbation of chronic bronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently fulfills the clinical diagnostic criteria for acute bacterial exacerbation of chronic bronchitis.","meaning":"Boolean indicating whether the patient currently fulfills the clinical diagnostic criteria for acute bacterial exacerbation of chronic bronchitis."} ;; "To be included, the patient must fulfill the clinical diagnostic criteria for acute bacterial exacerbation of chronic bronchitis."
(declare-const patient_has_diagnosis_of_chronic_bronchitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic bronchitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic bronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic bronchitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic bronchitis."} ;; "chronic bronchitis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_fulfills_clinical_diagnostic_criteria_for_acute_bacterial_exacerbation_of_chronic_bronchitis_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must fulfill the clinical diagnostic criteria for acute bacterial exacerbation of chronic bronchitis."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cough_for_more_than_two_consecutive_years_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had cough for more than two consecutive years in the history.","when_to_set_to_false":"Set to false if the patient has not had cough for more than two consecutive years in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had cough for more than two consecutive years in the history.","meaning":"Boolean indicating whether the patient has had cough for more than two consecutive years in the history."} ;; "cough for more than two consecutive years"
(declare-const patient_has_finding_of_excessive_bronchial_secretion_for_more_than_two_consecutive_years_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had excessive bronchial secretion (excessive sputum production) for more than two consecutive years in the history.","when_to_set_to_false":"Set to false if the patient has not had excessive bronchial secretion (excessive sputum production) for more than two consecutive years in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had excessive bronchial secretion (excessive sputum production) for more than two consecutive years in the history.","meaning":"Boolean indicating whether the patient has had excessive bronchial secretion (excessive sputum production) for more than two consecutive years in the history."} ;; "excessive sputum production for more than two consecutive years"
(declare-const patient_has_finding_of_cough_on_most_days_in_a_three_month_consecutive_period_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had cough on most days in a three-month consecutive period in the history.","when_to_set_to_false":"Set to false if the patient has not had cough on most days in a three-month consecutive period in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had cough on most days in a three-month consecutive period in the history.","meaning":"Boolean indicating whether the patient has had cough on most days in a three-month consecutive period in the history."} ;; "cough on most days in a three-month consecutive period"
(declare-const patient_has_finding_of_excessive_bronchial_secretion_on_most_days_in_a_three_month_consecutive_period_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had excessive bronchial secretion (excessive sputum production) on most days in a three-month consecutive period in the history.","when_to_set_to_false":"Set to false if the patient has not had excessive bronchial secretion (excessive sputum production) on most days in a three-month consecutive period in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had excessive bronchial secretion (excessive sputum production) on most days in a three-month consecutive period in the history.","meaning":"Boolean indicating whether the patient has had excessive bronchial secretion (excessive sputum production) on most days in a three-month consecutive period in the history."} ;; "excessive sputum production on most days in a three-month consecutive period"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition in the requirement: chronic bronchitis is defined as (cough AND excessive sputum production) for more than two consecutive years
(assert
  (! (= patient_has_diagnosis_of_chronic_bronchitis_now
        (and patient_has_finding_of_cough_for_more_than_two_consecutive_years_in_the_history
             patient_has_finding_of_excessive_bronchial_secretion_for_more_than_two_consecutive_years_in_the_history))
     :named REQ2_AUXILIARY0)) ;; "chronic bronchitis defined as (cough AND excessive sputum production) for more than two consecutive years"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have chronic bronchitis defined as (cough AND excessive sputum production) for more than two consecutive years
(assert
  (! (and patient_has_finding_of_cough_for_more_than_two_consecutive_years_in_the_history
          patient_has_finding_of_excessive_bronchial_secretion_for_more_than_two_consecutive_years_in_the_history)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "chronic bronchitis defined as (cough AND excessive sputum production) for more than two consecutive years"

;; Component 1: Must have cough AND excessive sputum production on most days in a three-month consecutive period
(assert
  (! (and patient_has_finding_of_cough_on_most_days_in_a_three_month_consecutive_period_in_the_history
          patient_has_finding_of_excessive_bronchial_secretion_on_most_days_in_a_three_month_consecutive_period_in_the_history)
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "cough AND excessive sputum production on most days in a three-month consecutive period"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_exacerbation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an exacerbation.","when_to_set_to_false":"Set to false if the patient currently does not have an exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an exacerbation.","meaning":"Boolean indicating whether the patient currently has an exacerbation at the present time."} ;; "To be included, the patient must have an exacerbation defined by (an increase in sputum purulence OR an increase in sputum volume OR an increase in dyspnea)."
(declare-const patient_has_finding_of_purulent_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has purulent sputum.","when_to_set_to_false":"Set to false if the patient currently does not have purulent sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has purulent sputum.","meaning":"Boolean indicating whether the patient currently has purulent sputum."} ;; "sputum purulence"
(declare-const patient_has_finding_of_sputum_volume_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased sputum volume.","when_to_set_to_false":"Set to false if the patient currently does not have increased sputum volume.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased sputum volume.","meaning":"Boolean indicating whether the patient currently has increased sputum volume."} ;; "sputum volume"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea.","meaning":"Boolean indicating whether the patient currently has dyspnea."} ;; "dyspnea"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition in the requirement: exacerbation is defined by (increase in sputum purulence OR increase in sputum volume OR increase in dyspnea)
(assert
  (! (= patient_has_exacerbation_now
        (or patient_has_finding_of_purulent_sputum_now
            patient_has_finding_of_sputum_volume_now
            patient_has_finding_of_dyspnea_now))
     :named REQ3_AUXILIARY0)) ;; "exacerbation defined by (an increase in sputum purulence OR an increase in sputum volume OR an increase in dyspnea)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_exacerbation_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an exacerbation defined by (an increase in sputum purulence OR an increase in sputum volume OR an increase in dyspnea)."
