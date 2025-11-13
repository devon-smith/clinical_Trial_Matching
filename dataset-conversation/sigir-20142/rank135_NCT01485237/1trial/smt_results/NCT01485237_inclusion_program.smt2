;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "older than 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be older than 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_influenza_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of influenza.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of influenza.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of influenza.","meaning":"Boolean indicating whether the patient currently has influenza."}  ;; "influenza"
(declare-const patient_has_finding_of_influenza_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current influenza finding is suspected (not confirmed).","when_to_set_to_false":"Set to false if the patient's current influenza finding is not suspected (i.e., confirmed or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current influenza finding is suspected.","meaning":"Boolean indicating whether the patient's current influenza finding is suspected."}  ;; "suspected influenza"
(declare-const patient_has_finding_of_influenza_now@@confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current influenza finding is confirmed.","when_to_set_to_false":"Set to false if the patient's current influenza finding is not confirmed (i.e., suspected or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current influenza finding is confirmed.","meaning":"Boolean indicating whether the patient's current influenza finding is confirmed."}  ;; "confirmed influenza"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_influenza_now@@suspected
         patient_has_finding_of_influenza_now)
     :named REQ1_AUXILIARY0)) ;; "suspected influenza" implies "influenza"

(assert
  (! (=> patient_has_finding_of_influenza_now@@confirmed
         patient_has_finding_of_influenza_now)
     :named REQ1_AUXILIARY1)) ;; "confirmed influenza" implies "influenza"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (suspected influenza OR confirmed influenza)
(assert
  (! (or patient_has_finding_of_influenza_now@@suspected
         patient_has_finding_of_influenza_now@@confirmed)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (suspected influenza OR confirmed influenza (see Appendix A))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_undergoing_admission_to_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the intensive care unit (ICU).","when_to_set_to_false":"Set to false if the patient is currently not admitted to the intensive care unit (ICU).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the intensive care unit (ICU).","meaning":"Boolean indicating whether the patient is currently admitted to the intensive care unit (ICU)."} ;; "intensive care unit admission"
(declare-const patient_has_finding_of_respiratory_distress_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory distress.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory distress.","meaning":"Boolean indicating whether the patient currently has respiratory distress."} ;; "respiratory distress"
(declare-const patient_inspired_oxygen_concentration_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if the patient's current fraction of inspired oxygen (FiO2) is recorded.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fraction of inspired oxygen (FiO2) in percent."} ;; "fraction of inspired oxygen"
(declare-const patient_inspired_oxygen_need_greater_than_50_percent_for_at_least_4_hours_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires inspired oxygen greater than 50 percent for at least 4 hours.","when_to_set_to_false":"Set to false if the patient does not currently require inspired oxygen greater than 50 percent for at least 4 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires inspired oxygen greater than 50 percent for at least 4 hours.","meaning":"Boolean indicating whether the patient currently requires inspired oxygen greater than 50 percent for at least 4 hours."} ;; "inspired oxygen need greater than 50 percent for at least 4 hours"
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving mechanical ventilation.","when_to_set_to_false":"Set to false if the patient is currently not receiving mechanical ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving mechanical ventilation.","meaning":"Boolean indicating whether the patient is currently receiving mechanical ventilation."} ;; "mechanical ventilation"
(declare-const patient_is_receiving_inotrope_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving inotrope therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving inotrope therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving inotrope therapy.","meaning":"Boolean indicating whether the patient is currently receiving inotrope therapy."} ;; "receiving inotrope therapy"
(declare-const patient_is_receiving_vasopressor_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving vasopressor therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving vasopressor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving vasopressor therapy.","meaning":"Boolean indicating whether the patient is currently receiving vasopressor therapy."} ;; "receiving vasopressor therapy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: inspired oxygen need greater than 50 percent for at least 4 hours
(assert
  (! (= patient_inspired_oxygen_need_greater_than_50_percent_for_at_least_4_hours_now
        (> patient_inspired_oxygen_concentration_value_recorded_now_withunit_percent 50.0))
     :named REQ2_AUXILIARY0)) ;; "inspired oxygen need greater than 50 percent for at least 4 hours"

;; Definition: critical illness is defined as at least one of the following
(declare-const patient_has_finding_of_critical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets at least one of the following: inspired oxygen need greater than 50 percent for at least 4 hours, mechanical ventilation, receiving inotrope therapy, or receiving vasopressor therapy.","when_to_set_to_false":"Set to false if the patient does not currently meet any of these criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets any of these criteria.","meaning":"Boolean indicating whether the patient currently meets the definition of critical illness as per the requirement."} ;; "critical illness defined as at least one of the following: ..."

(assert
  (! (= patient_has_finding_of_critical_illness_now
        (or patient_inspired_oxygen_need_greater_than_50_percent_for_at_least_4_hours_now
            patient_is_undergoing_artificial_respiration_now
            patient_is_receiving_inotrope_therapy_now
            patient_is_receiving_vasopressor_therapy_now))
     :named REQ2_AUXILIARY1)) ;; "critical illness defined as at least one of the following: ..."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Inclusion: patient must require ICU admission due to (respiratory distress OR critical illness)
(assert
  (! (and patient_is_undergoing_admission_to_intensive_care_unit_now
          (or patient_has_finding_of_respiratory_distress_now
              patient_has_finding_of_critical_illness_now))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must require (intensive care unit admission) due to (respiratory distress OR critical illness defined as at least one of the following: ...)"
