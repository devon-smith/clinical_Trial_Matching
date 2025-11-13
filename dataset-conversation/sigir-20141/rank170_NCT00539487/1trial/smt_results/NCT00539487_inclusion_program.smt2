;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_essential_hypertension_now Bool) ;; "To be included, the patient must have essential hypertension." {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of essential hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of essential hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of essential hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of essential hypertension."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_essential_hypertension_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have essential hypertension."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "aged ≥ 18 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_history_of_coronary_artery_disease Bool) ;; "history of coronary artery disease" {"when_to_set_to_true":"Set to true if the patient has a documented history of coronary artery disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of coronary artery disease.","meaning":"Boolean indicating whether the patient has a history of coronary artery disease."}
(declare-const patient_has_history_of_stroke Bool) ;; "history of stroke" {"when_to_set_to_true":"Set to true if the patient has a documented history of stroke.","when_to_set_to_false":"Set to false if the patient does not have a documented history of stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of stroke.","meaning":"Boolean indicating whether the patient has a history of stroke."}
(declare-const patient_has_history_of_transient_ischemic_attack Bool) ;; "history of transient ischemic attack" {"when_to_set_to_true":"Set to true if the patient has a documented history of transient ischemic attack.","when_to_set_to_false":"Set to false if the patient does not have a documented history of transient ischemic attack.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of transient ischemic attack.","meaning":"Boolean indicating whether the patient has a history of transient ischemic attack."}
(declare-const patient_has_history_of_peripheral_artery_disease Bool) ;; "history of peripheral artery disease" {"when_to_set_to_true":"Set to true if the patient has a documented history of peripheral artery disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of peripheral artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of peripheral artery disease.","meaning":"Boolean indicating whether the patient has a history of peripheral artery disease."}
(declare-const patient_has_history_of_diabetes_mellitus Bool) ;; "history of diabetes mellitus" {"when_to_set_to_true":"Set to true if the patient has a documented history of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient does not have a documented history of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of diabetes mellitus.","meaning":"Boolean indicating whether the patient has a history of diabetes mellitus."}
(declare-const patients_risk_factor_is_positive_now Bool) ;; "risk factors" {"when_to_set_to_true":"Set to true if the patient currently has a positive status for risk factors.","when_to_set_to_false":"Set to false if the patient currently does not have a positive status for risk factors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive status for risk factors.","meaning":"Boolean indicating whether the patient currently has a positive status for risk factors."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Exhaustive subcategories define the umbrella "risk factors" exactly:
(assert
  (! (= patients_risk_factor_is_positive_now
        (or patient_has_history_of_coronary_artery_disease
            patient_has_history_of_stroke
            patient_has_history_of_transient_ischemic_attack
            patient_has_history_of_peripheral_artery_disease
            patient_has_history_of_diabetes_mellitus))
     :named REQ2_AUXILIARY0)) ;; "at least one of the following risk factors (with exhaustive subcategories ...)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patients_risk_factor_is_positive_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have at least one of the following risk factors ..."
