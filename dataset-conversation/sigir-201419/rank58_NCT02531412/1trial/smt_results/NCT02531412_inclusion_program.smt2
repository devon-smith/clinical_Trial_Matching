;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_is_admitted_to_intensive_care_unit_in_first_24_hours_after_major_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient is admitted to the intensive care unit during the first 24 hours after major surgery.","when_to_set_to_false":"Set to false if the patient is not admitted to the intensive care unit during the first 24 hours after major surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is admitted to the intensive care unit during the first 24 hours after major surgery.","meaning":"Boolean indicating whether the patient is admitted to the intensive care unit during the first 24 hours after major surgery."} // "admitted to the intensive care unit in the immediate postoperative period (defined as the first 24 hours after major surgery)"
(declare-const patient_has_undergone_general_anesthesia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone general anesthesia at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone general anesthesia at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone general anesthesia at any time in the history.","meaning":"Boolean indicating whether the patient has undergone general anesthesia at any time in the history."} // "major surgery must involve general anesthesia"
(declare-const patients_ventilation_is_positive_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had positive ventilation status at any time in the history.","when_to_set_to_false":"Set to false if the patient has not had positive ventilation status at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had positive ventilation status at any time in the history.","meaning":"Boolean indicating whether the patient has had positive ventilation status at any time in the history."} // "major surgery must involve ventilation"
(declare-const patient_has_undergone_opening_of_large_cavities_in_major_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone opening of large cavities as part of major surgery.","when_to_set_to_false":"Set to false if the patient has not undergone opening of large cavities as part of major surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone opening of large cavities as part of major surgery.","meaning":"Boolean indicating whether the patient has undergone opening of large cavities as part of major surgery."} // "major surgery must involve opening of large cavities"
(declare-const patient_has_undergone_opening_of_cranial_cavity_in_major_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone opening of the cranial cavity as part of major surgery.","when_to_set_to_false":"Set to false if the patient has not undergone opening of the cranial cavity as part of major surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone opening of the cranial cavity as part of major surgery.","meaning":"Boolean indicating whether the patient has undergone opening of the cranial cavity as part of major surgery."} // "major surgery must involve opening of cranial cavity (example of large cavity)"
(declare-const patient_has_undergone_opening_of_thoracic_cavity_in_major_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone opening of the thoracic cavity as part of major surgery.","when_to_set_to_false":"Set to false if the patient has not undergone opening of the thoracic cavity as part of major surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone opening of the thoracic cavity as part of major surgery.","meaning":"Boolean indicating whether the patient has undergone opening of the thoracic cavity as part of major surgery."} // "major surgery must involve opening of thoracic cavity (example of large cavity)"
(declare-const patient_has_undergone_opening_of_abdominal_cavity_in_major_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone opening of the abdominal cavity as part of major surgery.","when_to_set_to_false":"Set to false if the patient has not undergone opening of the abdominal cavity as part of major surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone opening of the abdominal cavity as part of major surgery.","meaning":"Boolean indicating whether the patient has undergone opening of the abdominal cavity as part of major surgery."} // "major surgery must involve opening of abdominal cavity (example of large cavity)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply the umbrella term "opening of large cavities"
(assert
  (! (=> (or patient_has_undergone_opening_of_cranial_cavity_in_major_surgery
             patient_has_undergone_opening_of_thoracic_cavity_in_major_surgery
             patient_has_undergone_opening_of_abdominal_cavity_in_major_surgery)
         patient_has_undergone_opening_of_large_cavities_in_major_surgery)
     :named REQ0_AUXILIARY0)) ;; "opening of large cavities (with non-exhaustive examples (cranial cavity, thoracic cavity, abdominal cavity))"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be admitted to ICU in first 24 hours after major surgery
(assert
  (! patient_is_admitted_to_intensive_care_unit_in_first_24_hours_after_major_surgery
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "admitted to the intensive care unit in the immediate postoperative period (defined as the first 24 hours after major surgery)"

;; Component 1: Major surgery must involve (general anesthesia OR ventilation OR opening of large cavities)
(assert
  (! (or patient_has_undergone_general_anesthesia_inthehistory
         patients_ventilation_is_positive_inthehistory
         patient_has_undergone_opening_of_large_cavities_in_major_surgery)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "major surgery must involve (general anesthesia OR ventilation OR opening of large cavities (with non-exhaustive examples (cranial cavity, thoracic cavity, abdominal cavity)))"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const informed_consent_signed_by_patient_or_responsible_relative Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been signed by the patient or by the responsible relative of the patient.","when_to_set_to_false":"Set to false if informed consent has not been signed by the patient nor by the responsible relative of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been signed by the patient or by the responsible relative of the patient.","meaning":"Boolean indicating whether informed consent has been signed by the patient or by the responsible relative of the patient."} // "informed consent signed (by the patient OR by the responsible relative of the patient)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! informed_consent_signed_by_patient_or_responsible_relative
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have informed consent signed (by the patient OR by the responsible relative of the patient)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_likely_survival_time_after_icu_admission_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient is clinically estimated to survive after admission to the intensive care unit.","when_to_set_to_null":"Set to null if the likely survival time after ICU admission is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of hours the patient is likely to survive after admission to the intensive care unit."} // "the patient must be likely to survive for at least 48 hours after admission to the intensive care unit"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_likely_survival_time_after_icu_admission_in_hours 48.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be likely to survive for at least 48 hours after admission to the intensive care unit"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_creatinine_value_recorded_before_icu_admission_withunit_micromol_per_litre Real) ;; {"when_to_set_to_value":"Set to the measured value if a baseline creatinine measurement for the patient is recorded before ICU admission, with units in micromoles per litre, within the last three months.","when_to_set_to_null":"Set to null if no baseline creatinine measurement is recorded before ICU admission within the last three months or the value is indeterminate.","meaning":"Numeric value representing the patient's baseline creatinine measurement recorded before ICU admission, with units in micromoles per litre."} // "measured baseline creatinine before admission to the intensive care unit, within the last three months"
(declare-const patient_creatinine_value_recorded_inthepast3months_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a creatinine measurement for the patient is recorded within the past three months.","when_to_set_to_null":"Set to null if no creatinine measurement is recorded within the past three months or the value is indeterminate.","meaning":"Numeric value representing the patient's creatinine measurement recorded within the past three months."} // "measured baseline creatinine before admission to the intensive care unit, within the last three months"
(declare-const patient_has_baseline_creatinine_measured_before_icu_admission_within_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a baseline creatinine measurement recorded before ICU admission within the last three months.","when_to_set_to_false":"Set to false if the patient does not have a baseline creatinine measurement recorded before ICU admission within the last three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a baseline creatinine measurement recorded before ICU admission within the last three months.","meaning":"Boolean indicating whether the patient has a baseline creatinine measurement recorded before ICU admission within the last three months."} // "measured baseline creatinine before admission to the intensive care unit, within the last three months"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; If a baseline creatinine value is recorded before ICU admission within the last three months, then the Boolean must be true
(assert
  (! (=> (not (= patient_creatinine_value_recorded_before_icu_admission_withunit_micromol_per_litre 0.0))
         patient_has_baseline_creatinine_measured_before_icu_admission_within_past_3_months)
     :named REQ3_AUXILIARY0)) ;; "measured baseline creatinine before admission to the intensive care unit, within the last three months"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_baseline_creatinine_measured_before_icu_admission_within_past_3_months
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "measured baseline creatinine before admission to the intensive care unit, within the last three months"
