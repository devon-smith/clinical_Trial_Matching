;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_clinically_significant_hypotension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinically significant hypotension.","when_to_set_to_false":"Set to false if the patient currently does not have clinically significant hypotension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinically significant hypotension.","meaning":"Boolean indicating whether the patient currently has clinically significant hypotension."} ;; "clinically significant hypotension"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure < 90 millimeters of mercury"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: clinically significant hypotension is defined as systolic blood pressure < 90 mmHg
(assert
(! (= patient_has_finding_of_clinically_significant_hypotension_now
     (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90))
   :named REQ0_AUXILIARY0)) ;; "defined as systolic blood pressure < 90 millimeters of mercury"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_clinically_significant_hypotension_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant hypotension (defined as systolic blood pressure < 90 millimeters of mercury)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_fever_value_recorded_now_withunit_degrees_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body temperature in degrees Fahrenheit is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body temperature in degrees Fahrenheit."} ;; "fever"
(declare-const patient_has_active_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an active infection.","when_to_set_to_false":"Set to false if the patient currently does not have an active infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an active infection.","meaning":"Boolean indicating whether the patient currently has an active infection."} ;; "active infection"
(declare-const patient_has_finding_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sepsis.","meaning":"Boolean indicating whether the patient currently has sepsis."} ;; "sepsis"
(declare-const patient_is_undergoing_intravenous_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing intravenous antibiotic therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing intravenous antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing intravenous antibiotic therapy.","meaning":"Boolean indicating whether the patient is currently undergoing intravenous antibiotic therapy."} ;; "intravenous antibiotic therapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition of sepsis as per requirement: fever > 101.5°F AND currently on intravenous antibiotic therapy
(assert
(! (= patient_has_finding_of_sepsis_now
     (and (> patient_fever_value_recorded_now_withunit_degrees_fahrenheit 101.5)
          patient_is_undergoing_intravenous_antibiotic_therapy_now))
:named REQ1_AUXILIARY0)) ;; "sepsis (defined as fever > 101.5 degrees Fahrenheit AND is currently on intravenous antibiotic therapy)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is excluded if (active infection) OR (sepsis as defined)
(assert
(! (not (or patient_has_active_infection_now
            patient_has_finding_of_sepsis_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has active infection) OR (the patient has sepsis (defined as fever > 101.5 degrees Fahrenheit AND is currently on intravenous antibiotic therapy))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current creatinine level in milligrams per deciliter (mg/dL) is available.","when_to_set_to_null":"Set to null if no current creatinine level measurement in mg/dL is available or the value is indeterminate.","meaning":"Numeric value of the patient's current creatinine level in milligrams per deciliter (mg/dL)."} ;; "creatinine level > 3.0 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (> patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 3.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine level > 3.0 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthepast30days_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a left ventricular ejection fraction measurement was recorded within the past 30 days prior to signing consent.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent value of the patient's left ventricular ejection fraction measured within the past 30 days prior to signing consent."} ;; "left ventricular ejection fraction < 40% (measured within the last 30 days prior to signing consent)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (< patient_left_ventricular_ejection_fraction_value_recorded_inthepast30days_withunit_percent 40))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has left ventricular ejection fraction < 40% (measured within the last 30 days prior to signing consent)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_significant_valvular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has significant valvular disease.","when_to_set_to_false":"Set to false if the patient currently does not have significant valvular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant valvular disease.","meaning":"Boolean indicating whether the patient currently has significant valvular disease."} ;; "significant valvular disease"
(declare-const patient_has_finding_of_constrictive_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has constrictive cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have constrictive cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has constrictive cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has constrictive cardiomyopathy."} ;; "constrictive cardiomyopathy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_significant_valvular_disease_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant valvular disease."

(assert
(! (not patient_has_finding_of_constrictive_cardiomyopathy_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has constrictive cardiomyopathy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_count_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current platelet count (in count per microliter) is available for the patient.","when_to_set_to_null":"Set to null if no current platelet count measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count in count per microliter."} ;; "platelet count < 20,000"
(declare-const patient_international_normalized_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if a current international normalized ratio (INR) is available for the patient.","when_to_set_to_null":"Set to null if no current INR measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current international normalized ratio (INR)."} ;; "international normalized ratio > 1.6"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have severe thrombocytopenia (platelet count < 20,000) OR INR > 1.6
(assert
(! (not (or (< patient_platelet_count_finding_value_recorded_now_withunit_count_per_microliter 20000)
            (> patient_international_normalized_ratio_value_recorded_now_withunit_ratio 1.6)))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has severe thrombocytopenia (defined as platelet count < 20,000)) OR (the patient has international normalized ratio > 1.6)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity (of any type).","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity (of any type).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity.","meaning":"Boolean indicating whether the patient currently has hypersensitivity (of any type) now."} ;; "hypersensitivity"

(declare-const patient_has_finding_of_hypersensitivity_condition_now@@caused_by_nesiritide Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity is caused by nesiritide.","when_to_set_to_false":"Set to false if the patient's current hypersensitivity is not caused by nesiritide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypersensitivity is caused by nesiritide.","meaning":"Boolean indicating whether the patient's current hypersensitivity is caused by nesiritide."} ;; "hypersensitivity to nesiritide"

(declare-const patient_has_finding_of_hypersensitivity_condition_now@@caused_by_any_component_of_nesiritide Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity is caused by any component of nesiritide.","when_to_set_to_false":"Set to false if the patient's current hypersensitivity is not caused by any component of nesiritide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypersensitivity is caused by any component of nesiritide.","meaning":"Boolean indicating whether the patient's current hypersensitivity is caused by any component of nesiritide."} ;; "hypersensitivity to any component of nesiritide"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply the stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_now@@caused_by_nesiritide
       patient_has_finding_of_hypersensitivity_condition_now)
   :named REQ6_AUXILIARY0)) ;; "hypersensitivity to nesiritide" implies "hypersensitivity"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_now@@caused_by_any_component_of_nesiritide
       patient_has_finding_of_hypersensitivity_condition_now)
   :named REQ6_AUXILIARY1)) ;; "hypersensitivity to any component of nesiritide" implies "hypersensitivity"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_has_finding_of_hypersensitivity_condition_now@@caused_by_nesiritide
            patient_has_finding_of_hypersensitivity_condition_now@@caused_by_any_component_of_nesiritide))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has hypersensitivity to nesiritide) OR (the patient has hypersensitivity to any component of nesiritide)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's pulmonary artery capillary wedge pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's pulmonary artery capillary wedge pressure measured now, in millimeters of mercury."} ;; "pulmonary artery capillary wedge pressure < 16 millimeters of mercury"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (< patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury 16))
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary artery capillary wedge pressure < 16 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently of childbearing potential (i.e., capable of becoming pregnant).","when_to_set_to_false":"Set to false if the patient is currently not of childbearing potential (e.g., postmenopausal, prepubertal, or has had surgical sterilization).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is of child-bearing age"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as confirmed by a positive pregnancy test.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as confirmed by a negative pregnancy test.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has a positive pregnancy test"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_has_childbearing_potential_now
             patient_is_pregnant_now))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is of child-bearing age) AND (the patient has a positive pregnancy test)."
