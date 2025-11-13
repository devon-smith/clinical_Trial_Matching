;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_ischemic_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ischemic heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ischemic heart disease.","meaning":"Boolean indicating whether the patient currently has ischemic heart disease."} ;; "To be included, the patient must be a patient with ischemic heart disease."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_ischemic_heart_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a patient with ischemic heart disease."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_clopidogrel_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to clopidogrel at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to clopidogrel at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to clopidogrel.","meaning":"Boolean indicating whether the patient has ever been exposed to clopidogrel."} ;; "have been given a loading dose of clopidogrel OR have been given a maintenance dose of clopidogrel"
(declare-const patient_is_exposed_to_clopidogrel_inthehistory@@administered_as_loading_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to clopidogrel in their history was specifically as a loading dose.","when_to_set_to_false":"Set to false if the patient's exposure to clopidogrel in their history was not as a loading dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was as a loading dose.","meaning":"Boolean indicating whether the patient's exposure to clopidogrel in their history was as a loading dose."} ;; "have been given a loading dose of clopidogrel"
(declare-const patient_is_exposed_to_clopidogrel_inthehistory@@administered_as_maintenance_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to clopidogrel in their history was specifically as a maintenance dose.","when_to_set_to_false":"Set to false if the patient's exposure to clopidogrel in their history was not as a maintenance dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was as a maintenance dose.","meaning":"Boolean indicating whether the patient's exposure to clopidogrel in their history was as a maintenance dose."} ;; "have been given a maintenance dose of clopidogrel"
(declare-const patient_is_exposed_to_clopidogrel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to clopidogrel.","when_to_set_to_false":"Set to false if the patient is not currently exposed to clopidogrel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to clopidogrel.","meaning":"Boolean indicating whether the patient is currently exposed to clopidogrel."} ;; "be in need of clopidogrel for ≥ 1 month"
(declare-const patient_is_exposed_to_clopidogrel_now@@needed_for_at_least_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to clopidogrel is needed for at least 1 month.","when_to_set_to_false":"Set to false if the patient's current exposure to clopidogrel is not needed for at least 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is needed for at least 1 month.","meaning":"Boolean indicating whether the patient's current exposure to clopidogrel is needed for at least 1 month."} ;; "be in need of clopidogrel for ≥ 1 month"
(declare-const patient_is_in_need_of_clopidogrel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical need for clopidogrel.","when_to_set_to_false":"Set to false if the patient does not currently have a clinical need for clopidogrel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical need for clopidogrel.","meaning":"Boolean indicating whether the patient currently has a clinical need for clopidogrel."} ;; "be in need of clopidogrel for ≥ 1 month"
(declare-const patient_is_in_need_of_clopidogrel_now@@needed_for_at_least_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current need for clopidogrel is for at least 1 month.","when_to_set_to_false":"Set to false if the patient's current need for clopidogrel is not for at least 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current need for clopidogrel is for at least 1 month.","meaning":"Boolean indicating whether the patient's current need for clopidogrel is for at least 1 month."} ;; "be in need of clopidogrel for ≥ 1 month"
(declare-const patient_need_for_clopidogrel_duration_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months for which the patient currently needs clopidogrel, as documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined for how many months the patient currently needs clopidogrel.","meaning":"Numeric value indicating the duration, in months, for which the patient currently needs clopidogrel."} ;; "be in need of clopidogrel for ≥ 1 month"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_exposed_to_clopidogrel_inthehistory@@administered_as_loading_dose
         patient_is_exposed_to_clopidogrel_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "have been given a loading dose of clopidogrel"

(assert
  (! (=> patient_is_exposed_to_clopidogrel_inthehistory@@administered_as_maintenance_dose
         patient_is_exposed_to_clopidogrel_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "have been given a maintenance dose of clopidogrel"

(assert
  (! (=> patient_is_exposed_to_clopidogrel_now@@needed_for_at_least_1_month
         patient_is_exposed_to_clopidogrel_now)
     :named REQ1_AUXILIARY2)) ;; "be in need of clopidogrel for ≥ 1 month"

(assert
  (! (=> patient_is_in_need_of_clopidogrel_now@@needed_for_at_least_1_month
         patient_is_in_need_of_clopidogrel_now)
     :named REQ1_AUXILIARY3)) ;; "be in need of clopidogrel for ≥ 1 month"

;; Numeric duration defines the qualifier variable
(assert
  (! (= patient_is_in_need_of_clopidogrel_now@@needed_for_at_least_1_month
        (and patient_is_in_need_of_clopidogrel_now
             (>= patient_need_for_clopidogrel_duration_value_recorded_now_in_months 1.0)))
     :named REQ1_AUXILIARY4)) ;; "be in need of clopidogrel for ≥ 1 month"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: ((loading dose OR maintenance dose) AND need for clopidogrel ≥ 1 month)
(assert
  (! (and
        (or patient_is_exposed_to_clopidogrel_inthehistory@@administered_as_loading_dose
            patient_is_exposed_to_clopidogrel_inthehistory@@administered_as_maintenance_dose)
        patient_is_in_need_of_clopidogrel_now@@needed_for_at_least_1_month)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have been given a loading dose of clopidogrel) OR (have been given a maintenance dose of clopidogrel)) AND (be in need of clopidogrel for ≥ 1 month)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_need_for_additional_drug_for_blood_pressure_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs an additional drug for optimal blood pressure control.","when_to_set_to_false":"Set to false if the patient currently does not need an additional drug for optimal blood pressure control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs an additional drug for optimal blood pressure control.","meaning":"Boolean indicating whether the patient currently needs an additional drug for optimal blood pressure control."} ;; "be in need of an additional drug for optimal blood pressure control"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure in mmHg is recorded now.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement in mmHg is available for now or the value is indeterminate.","meaning":"Numeric value of the patient's current systolic blood pressure in mmHg."} ;; "systolic blood pressure < 130 mmHg"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure in mmHg is recorded now.","when_to_set_to_null":"Set to null if no diastolic blood pressure measurement in mmHg is available for now or the value is indeterminate.","meaning":"Numeric value of the patient's current diastolic blood pressure in mmHg."} ;; "diastolic blood pressure < 90 mmHg"
(declare-const patient_has_finding_of_angina_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding indicating need for additional drug therapy for angina control.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding indicating need for additional drug therapy for angina control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs additional drug therapy for angina control.","meaning":"Boolean indicating whether the patient currently needs additional drug therapy for angina control."} ;; "be in need of an additional drug for angina control"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: "with the aim of achieving systolic blood pressure < 130 mmHg AND diastolic blood pressure < 90 mmHg"
(assert
  (! (=> (and (< patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 130.0)
              (< patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 90.0))
         patient_has_finding_of_need_for_additional_drug_for_blood_pressure_control_now)
     :named REQ2_AUXILIARY0)) ;; "with the aim of achieving systolic blood pressure < 130 mmHg AND diastolic blood pressure < 90 mmHg"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: "To be included, the patient must ((be in need of an additional drug for optimal blood pressure control (with the aim of achieving systolic blood pressure < 130 mmHg AND diastolic blood pressure < 90 mmHg)) OR (be in need of an additional drug for angina control))."
(assert
  (! (or patient_has_finding_of_need_for_additional_drug_for_blood_pressure_control_now
         patient_has_finding_of_angina_control_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be in need of an additional drug for optimal blood pressure control (with the aim of achieving systolic blood pressure < 130 mmHg AND diastolic blood pressure < 90 mmHg)) OR (be in need of an additional drug for angina control))."
