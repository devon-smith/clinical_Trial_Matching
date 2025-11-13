;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_paediatric_transplantation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a paediatric transplantation procedure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a paediatric transplantation procedure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a paediatric transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a paediatric transplantation procedure in their medical history."} ;; "the patient has undergone a paediatric transplant"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than 18 years"
(declare-const patient_has_undergone_transplantation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a transplantation procedure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a transplantation procedure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a transplantation procedure in their medical history."} ;; "transplant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_has_undergone_paediatric_transplantation_inthehistory
               (< patient_age_value_recorded_now_in_years 18)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone a paediatric transplant AND the patient is younger than 18 years."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_single_lung_transplant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a single lung transplant at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a single lung transplant at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a single lung transplant.","meaning":"Boolean indicating whether the patient has ever undergone a single lung transplant at any time in their medical history."} ;; "single lung transplant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_single_lung_transplant_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received a single lung transplant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_resides_interstate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in a location outside the state of the recruiting center.","when_to_set_to_false":"Set to false if the patient currently resides within the state of the recruiting center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides outside the state of the recruiting center.","meaning":"Boolean indicating whether the patient currently resides in a location outside the state of the recruiting center."} ;; "the patient resides interstate"
(declare-const patient_has_finding_of_follow_up_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to complete follow up.","when_to_set_to_false":"Set to false if the patient is currently unable to complete follow up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to complete follow up.","meaning":"Boolean indicating whether the patient is currently able to complete follow up."} ;; "the patient is unable to complete follow up"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_resides_interstate_now
             (not patient_has_finding_of_follow_up_status_now)))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient resides interstate AND the patient is unable to complete follow up."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_can_undergo_measurement_of_respiratory_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo measurement of respiratory function (lung function testing).","when_to_set_to_false":"Set to false if the patient is currently unable to undergo measurement of respiratory function (lung function testing).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo measurement of respiratory function (lung function testing).","meaning":"Boolean indicating whether the patient can currently undergo measurement of respiratory function (lung function testing)."} ;; "lung function testing"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_can_undergo_measurement_of_respiratory_function_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to perform lung function testing."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_unable_to_complete_subjective_outcome_measures_due_to_inability_to_read_english_fluently Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to complete subjective outcome measures and the reason is that the patient is unable to read English fluently.","when_to_set_to_false":"Set to false if the patient is able to complete subjective outcome measures, or if inability to complete them is not due to inability to read English fluently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to complete subjective outcome measures due to inability to read English fluently.","meaning":"Boolean indicating whether the patient is unable to complete subjective outcome measures due to inability to read English fluently."} ;; "the patient is unable to complete subjective outcome measures due to being unable to read English fluently"

(declare-const patient_is_unable_to_read_english_fluently Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to read English fluently.","when_to_set_to_false":"Set to false if the patient is able to read English fluently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to read English fluently.","meaning":"Boolean indicating whether the patient is unable to read English fluently."} ;; "the patient being unable to read English fluently"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_unable_to_complete_subjective_outcome_measures_due_to_inability_to_read_english_fluently)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to complete subjective outcome measures due to the patient being unable to read English fluently."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_critically_unwell_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently critically unwell.","when_to_set_to_false":"Set to false if the patient is currently not critically unwell.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently critically unwell.","meaning":"Boolean indicating whether the patient is currently critically unwell."} ;; "the patient is critically unwell"
(declare-const patient_is_in_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in the intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently not in the intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in the intensive care unit.","meaning":"Boolean indicating whether the patient is currently in the intensive care unit."} ;; "the patient is in the intensive care unit"
(declare-const patient_has_finding_of_dependence_on_ventilator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently dependent on a ventilator.","when_to_set_to_false":"Set to false if the patient is currently not dependent on a ventilator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently dependent on a ventilator.","meaning":"Boolean indicating whether the patient is currently dependent on a ventilator."} ;; "ventilator dependent"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_critically_unwell_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is critically unwell."

(assert
(! (not patient_is_in_intensive_care_unit_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is in the intensive care unit."

(assert
(! (not patient_has_finding_of_dependence_on_ventilator_now)
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is ventilator dependent."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "within 2 months of the transplant date"
(declare-const patient_has_undergone_transplantation_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a transplantation procedure within the past 2 months.","when_to_set_to_false":"Set to false if the patient has not undergone a transplantation procedure within the past 2 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a transplantation procedure within the past 2 months.","meaning":"Boolean indicating whether the patient has undergone a transplantation procedure within the past 2 months."} ;; "transplant within the past 2 months"
(declare-const patient_transplant_date_value_recorded_in_months_since_epoch Real) ;; {"when_to_set_to_value":"Set to the number of months since the defined epoch corresponding to the patient's transplant date if it is known and documented.","when_to_set_to_null":"Set to null if the patient's transplant date is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's transplant date, recorded as the number of months since a defined epoch."} ;; "transplant date"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definitional: patient has undergone transplantation in the past 2 months if current date minus transplant date is less than or equal to 2
(assert
(! (= patient_has_undergone_transplantation_inthepast2months
    (and
        (>= patient_age_value_recorded_now_in_months 0)
        (>= patient_transplant_date_value_recorded_in_months_since_epoch 0)
        (<= (- patient_age_value_recorded_now_in_months patient_transplant_date_value_recorded_in_months_since_epoch) 2)
    ))
:named REQ6_AUXILIARY0)) ;; "within 2 months of the transplant date"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_undergone_transplantation_inthepast2months)
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is within 2 months of the transplant date."
