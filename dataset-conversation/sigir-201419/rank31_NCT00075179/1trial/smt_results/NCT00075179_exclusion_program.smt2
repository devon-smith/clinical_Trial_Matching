;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypotension (low blood pressure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypotension (low blood pressure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypotension (low blood pressure).","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure)." } ;; "hypotension"
(declare-const patient_has_finding_of_low_blood_pressure_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypotension (low blood pressure) that is clinically significant as defined by the protocol.","when_to_set_to_false":"Set to false if the patient currently has hypotension (low blood pressure) that is not clinically significant as defined by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinically significant hypotension.","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure) that is clinically significant as defined by the protocol."} ;; "clinically significant hypotension"
(declare-const systolic_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the patient's current systolic blood pressure value in mmHg if measured and available.","when_to_set_to_null":"Set to null if the patient's current systolic blood pressure value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} ;; "systolic blood pressure < 90 mmHg"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: clinically significant hypotension = hypotension AND systolic BP < 90 mmHg
(assert
(! (= patient_has_finding_of_low_blood_pressure_now@@clinically_significant
     (and patient_has_finding_of_low_blood_pressure_now
          (< systolic_blood_pressure_value_recorded_now_withunit_mm_hg 90)))
:named REQ0_AUXILIARY0)) ;; "clinically significant (defined as systolic blood pressure < 90 mmHg)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_low_blood_pressure_now@@clinically_significant
       patient_has_finding_of_low_blood_pressure_now)
:named REQ0_AUXILIARY1)) ;; "clinically significant hypotension" implies "hypotension"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_low_blood_pressure_now@@clinically_significant)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypotension that is clinically significant (defined as systolic blood pressure < 90 mmHg)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is active.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is active.","meaning":"Boolean indicating whether the patient's current disorder due to infection is active."} ;; "infection that is active"
(declare-const patient_has_finding_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sepsis.","meaning":"Boolean indicating whether the patient currently has sepsis."} ;; "sepsis"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"
(declare-const patient_has_need_for_intravenous_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs intravenous antibiotic therapy.","when_to_set_to_false":"Set to false if the patient currently does not need intravenous antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs intravenous antibiotic therapy.","meaning":"Boolean indicating whether the patient currently needs intravenous antibiotic therapy."} ;; "need for intravenous antibiotic therapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@active_status
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ1_AUXILIARY0)) ;; "infection that is active"

;; Definition of sepsis as per requirement: sepsis = fever AND need for intravenous antibiotic therapy
(assert
(! (= patient_has_finding_of_sepsis_now
      (and patient_has_finding_of_fever_now
           patient_has_need_for_intravenous_antibiotic_therapy_now))
:named REQ1_AUXILIARY1)) ;; "sepsis (defined as fever AND need for intravenous antibiotic therapy)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have active infection OR sepsis (as defined)
(assert
(! (not (or patient_has_finding_of_disorder_due_to_infection_now@@active_status
            patient_has_finding_of_sepsis_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has infection that is active) OR (the patient has sepsis (defined as fever AND need for intravenous antibiotic therapy))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine level is recorded now in mg/dl.","when_to_set_to_null":"Set to null if no creatinine level measurement in mg/dl is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine level in mg/dl."} ;; "creatinine level > 3.0 milligrams per deciliter (mg/dl)."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 3.0))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine level > 3.0 milligrams per deciliter (mg/dl)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder (valvular disease).","when_to_set_to_false":"Set to false if the patient currently does not have a heart valve disorder (valvular disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a heart valve disorder (valvular disease).","meaning":"Boolean indicating whether the patient currently has a heart valve disorder (valvular disease) now."} ;; "valvular disease"

(declare-const patient_has_finding_of_heart_valve_disorder_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart valve disorder (valvular disease) is significant.","when_to_set_to_false":"Set to false if the patient's current heart valve disorder (valvular disease) is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart valve disorder (valvular disease) is significant.","meaning":"Boolean indicating whether the patient's current heart valve disorder (valvular disease) is significant."} ;; "significant valvular disease"

(declare-const patient_has_finding_of_heart_valve_disorder_now@@is_cause_for_pulmonary_hypertension Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart valve disorder (valvular disease) is a cause for pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient's current heart valve disorder (valvular disease) is not a cause for pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart valve disorder (valvular disease) is a cause for pulmonary hypertension.","meaning":"Boolean indicating whether the patient's current heart valve disorder (valvular disease) is a cause for pulmonary hypertension."} ;; "valvular disease that is a cause for pulmonary hypertension"

(declare-const patient_has_finding_of_heart_valve_disorder_now@@is_significant_and_is_cause_for_pulmonary_hypertension Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder (valvular disease) that is significant and is a cause for pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently has a heart valve disorder (valvular disease) that is not significant or is not a cause for pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a heart valve disorder (valvular disease) that is significant and is a cause for pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has a heart valve disorder (valvular disease) that is significant and is a cause for pulmonary hypertension."} ;; "valvular disease that is significant as a cause for pulmonary hypertension"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definitional equality for "valvular disease that is significant as a cause for pulmonary hypertension"
(assert
(! (= patient_has_finding_of_heart_valve_disorder_now@@is_significant_and_is_cause_for_pulmonary_hypertension
(and patient_has_finding_of_heart_valve_disorder_now
     patient_has_finding_of_heart_valve_disorder_now@@is_significant
     patient_has_finding_of_heart_valve_disorder_now@@is_cause_for_pulmonary_hypertension))
:named REQ3_AUXILIARY0)) ;; "valvular disease that is significant as a cause for pulmonary hypertension"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@is_significant
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ3_AUXILIARY1)) ;; "significant valvular disease implies valvular disease"

(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@is_cause_for_pulmonary_hypertension
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ3_AUXILIARY2)) ;; "valvular disease that is a cause for pulmonary hypertension implies valvular disease"

(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@is_significant_and_is_cause_for_pulmonary_hypertension
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ3_AUXILIARY3)) ;; "valvular disease that is significant as a cause for pulmonary hypertension implies valvular disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@is_significant_and_is_cause_for_pulmonary_hypertension)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has valvular disease that is significant as a cause for pulmonary hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of thrombocytopenic disorder (thrombocytopenia).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of thrombocytopenic disorder (thrombocytopenia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of thrombocytopenic disorder (thrombocytopenia).","meaning":"Boolean indicating whether the patient currently has a thrombocytopenic disorder (thrombocytopenia)."} ;; "thrombocytopenia"
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured platelet count value if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count (per microliter)."} ;; "platelet count"
(declare-const patient_international_normalized_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured INR value if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current international normalized ratio (INR)."} ;; "international normalized ratio (INR)"

(declare-const patient_has_finding_of_thrombocytopenic_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a severe thrombocytopenic disorder (thrombocytopenia), as defined by platelet count < 20,000 or INR > 1.6.","when_to_set_to_false":"Set to false if the patient currently has a thrombocytopenic disorder (thrombocytopenia) that is not severe by this definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe thrombocytopenia.","meaning":"Boolean indicating whether the patient currently has severe thrombocytopenia, defined as platelet count < 20,000 or INR > 1.6."} ;; "severe thrombocytopenia (defined as platelet count < 20,000 OR international normalized ratio (INR) > 1.6)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: severe thrombocytopenia = (platelet count < 20,000 OR INR > 1.6)
(assert
(! (= patient_has_finding_of_thrombocytopenic_disorder_now@@severe
     (or (< patient_platelet_count_finding_value_recorded_now_withunit_per_microliter 20000)
         (> patient_international_normalized_ratio_value_recorded_now_withunit_ratio 1.6)))
:named REQ4_AUXILIARY0)) ;; "severe thrombocytopenia (defined as platelet count < 20,000 OR international normalized ratio (INR) > 1.6)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_thrombocytopenic_disorder_now@@severe
       patient_has_finding_of_thrombocytopenic_disorder_now)
:named REQ4_AUXILIARY1)) ;; "severe thrombocytopenia" implies "thrombocytopenia"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_thrombocytopenic_disorder_now@@severe)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe thrombocytopenia (defined as platelet count < 20,000 OR international normalized ratio (INR) > 1.6)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthepast30days_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if the patient's left ventricular ejection fraction was recorded within the past 30 days prior to signing consent.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent value of the patient's left ventricular ejection fraction measured within the past 30 days."} ;; "left ventricular ejection fraction < 40% (as measured within the last 30 days prior to signing consent)."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (< patient_left_ventricular_ejection_fraction_value_recorded_inthepast30days_withunit_percent 40))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has left ventricular ejection fraction < 40% (as measured within the last 30 days prior to signing consent)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity (of any cause).","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity (of any cause).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity.","meaning":"Boolean indicating whether the patient currently has hypersensitivity (of any cause) now."} ;; "hypersensitivity"
(declare-const patient_has_finding_of_hypersensitivity_condition_now@@caused_by_nesiritide Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity is caused by nesiritide.","when_to_set_to_false":"Set to false if the patient's current hypersensitivity is not caused by nesiritide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypersensitivity is caused by nesiritide.","meaning":"Boolean indicating whether the patient's current hypersensitivity is caused by nesiritide."} ;; "hypersensitivity to nesiritide"
(declare-const patient_has_finding_of_hypersensitivity_condition_now@@caused_by_any_component_of_nesiritide Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity is caused by any component of nesiritide.","when_to_set_to_false":"Set to false if the patient's current hypersensitivity is not caused by any component of nesiritide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypersensitivity is caused by any component of nesiritide.","meaning":"Boolean indicating whether the patient's current hypersensitivity is caused by any component of nesiritide."} ;; "hypersensitivity to any component of nesiritide"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_now@@caused_by_nesiritide
      patient_has_finding_of_hypersensitivity_condition_now)
:named REQ6_AUXILIARY0)) ;; "hypersensitivity to nesiritide"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_now@@caused_by_any_component_of_nesiritide
      patient_has_finding_of_hypersensitivity_condition_now)
:named REQ6_AUXILIARY1)) ;; "hypersensitivity to any component of nesiritide"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_now@@caused_by_nesiritide)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to nesiritide."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_now@@caused_by_any_component_of_nesiritide)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to any component of nesiritide."
