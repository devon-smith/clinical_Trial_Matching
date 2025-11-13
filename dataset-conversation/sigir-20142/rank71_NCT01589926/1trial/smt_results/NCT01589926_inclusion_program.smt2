;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_sickle_cell_hemoglobin_ss_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with hemoglobin SS disease.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with hemoglobin SS disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with hemoglobin SS disease.","meaning":"Boolean indicating whether the patient is currently diagnosed with hemoglobin SS disease."}  ;; "To be included, the patient must be diagnosed with hemoglobin SS disease (hemoglobin SS) (the most common type of sickle cell disease)."
(declare-const patient_has_diagnosis_of_sickling_disorder_due_to_hemoglobin_s_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with sickle cell disease (any type).","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with sickle cell disease (any type).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with sickle cell disease (any type).","meaning":"Boolean indicating whether the patient is currently diagnosed with sickle cell disease (any type)."}  ;; "the most common type of sickle cell disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Hemoglobin SS disease is a type of sickle cell disease (definitional relationship)
(assert
  (! (=> patient_has_diagnosis_of_sickle_cell_hemoglobin_ss_disease_now
         patient_has_diagnosis_of_sickling_disorder_due_to_hemoglobin_s_now)
     :named REQ0_AUXILIARY0)) ;; "hemoglobin SS disease (the most common type of sickle cell disease)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_sickle_cell_hemoglobin_ss_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be diagnosed with hemoglobin SS disease (hemoglobin SS) (the most common type of sickle cell disease)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_sickling_disorder_due_to_hemoglobin_s_now@@is_second_most_common_type_hemoglobin_sc_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sickle cell disease and the diagnosis is specifically hemoglobin SC disease (the second most common type).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of sickle cell disease but it is not hemoglobin SC disease (not the second most common type).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sickle cell disease diagnosis is specifically hemoglobin SC disease.","meaning":"Boolean indicating whether the patient's sickle cell disease diagnosis is specifically hemoglobin SC disease (the second most common type)."}  ;; "To be included, the patient must be diagnosed with hemoglobin SC disease (hemoglobin SC) (the second most common type of sickle cell disease)."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the umbrella variable (diagnosis of sickling disorder due to hemoglobin S)
(assert
  (! (=> patient_has_diagnosis_of_sickling_disorder_due_to_hemoglobin_s_now@@is_second_most_common_type_hemoglobin_sc_disease
         patient_has_diagnosis_of_sickling_disorder_due_to_hemoglobin_s_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must be diagnosed with hemoglobin SC disease (hemoglobin SC) (the second most common type of sickle cell disease)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_sickling_disorder_due_to_hemoglobin_s_now@@is_second_most_common_type_hemoglobin_sc_disease
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be diagnosed with hemoglobin SC disease (hemoglobin SC) (the second most common type of sickle cell disease)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_sickle_cell_beta_0_thalassemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sickle cell beta-0 thalassemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sickle cell beta-0 thalassemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sickle cell beta-0 thalassemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sickle cell beta-0 thalassemia."}  ;; "be diagnosed with hemoglobin sickle beta-zero thalassemia (hemoglobin SB0thal)"
(declare-const patient_has_diagnosis_of_sickle_cell_thalassemia_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sickle cell thalassemia disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sickle cell thalassemia disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sickle cell thalassemia disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sickle cell thalassemia disease."}  ;; "be diagnosed with hemoglobin sickle thalassemia (hemoglobin SBthal)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_has_diagnosis_of_sickle_cell_beta_0_thalassemia_now
         patient_has_diagnosis_of_sickle_cell_thalassemia_disease_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (be diagnosed with hemoglobin sickle beta-zero thalassemia (hemoglobin SB0thal) OR be diagnosed with hemoglobin sickle thalassemia (hemoglobin SBthal))."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_acute_chest_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets clinical criteria for acute chest syndrome.","when_to_set_to_false":"Set to false if the patient currently does not meet clinical criteria for acute chest syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets clinical criteria for acute chest syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute chest syndrome."} ;; "To be included, the patient must meet clinical criteria for acute chest syndrome (defined as (an infiltrate on chest X-ray) AND (at least one of the following: respiratory symptoms OR respiratory signs (patient's pulse oximetry < 92 percent OR oxygen saturation < 2 percent below the patient's baseline OR tachypnea OR cough OR increased work of breathing) OR fever OR chest pain))."
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a radiologic infiltrate of the lung detected by chest X-ray.","when_to_set_to_false":"Set to false if the patient currently does not have a radiologic infiltrate of the lung detected by chest X-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a radiologic infiltrate of the lung detected by chest X-ray.","meaning":"Boolean indicating whether the patient currently has a radiologic infiltrate of the lung."} ;; "an infiltrate on chest X-ray"
(declare-const patient_has_finding_of_respiratory_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory symptoms.","meaning":"Boolean indicating whether the patient currently has respiratory symptoms."} ;; "respiratory symptoms"
(declare-const patient_has_finding_of_respiratory_signs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory signs.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory signs.","meaning":"Boolean indicating whether the patient currently has respiratory signs."} ;; "respiratory signs"
(declare-const patient_pulse_oximetry_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric pulse oximetry measurement in percent is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current pulse oximetry in percent."} ;; "patient's pulse oximetry < 92 percent"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric hemoglobin saturation with oxygen measurement in percent is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin saturation with oxygen in percent."} ;; "oxygen saturation < 2 percent below the patient's baseline"
(declare-const patient_hemoglobin_saturation_with_oxygen_baseline_value_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric baseline hemoglobin saturation with oxygen measurement in percent is available.","when_to_set_to_null":"Set to null if no such baseline measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's baseline hemoglobin saturation with oxygen in percent."} ;; "oxygen saturation < 2 percent below the patient's baseline"
(declare-const patient_has_finding_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachypnea.","when_to_set_to_false":"Set to false if the patient currently does not have tachypnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachypnea.","meaning":"Boolean indicating whether the patient currently has tachypnea."} ;; "tachypnea"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "cough"
(declare-const patient_has_finding_of_increased_work_of_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased work of breathing.","when_to_set_to_false":"Set to false if the patient currently does not have increased work of breathing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased work of breathing.","meaning":"Boolean indicating whether the patient currently has increased work of breathing."} ;; "increased work of breathing"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition of "respiratory signs" as per requirement: (patient's pulse oximetry < 92 percent OR oxygen saturation < 2 percent below the patient's baseline OR tachypnea OR cough OR increased work of breathing)
(assert
  (! (= patient_has_finding_of_respiratory_signs_now
        (or
          (< patient_pulse_oximetry_value_recorded_now_withunit_percent 92.0)
          (< patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent
             (- patient_hemoglobin_saturation_with_oxygen_baseline_value_withunit_percent 2.0))
          patient_has_finding_of_tachypnea_now
          patient_has_finding_of_cough_now
          patient_has_finding_of_increased_work_of_breathing_now))
     :named REQ3_AUXILIARY0)) ;; "respiratory signs (patient's pulse oximetry < 92 percent OR oxygen saturation < 2 percent below the patient's baseline OR tachypnea OR cough OR increased work of breathing)"

;; Definition of "meets clinical criteria for acute chest syndrome" as per requirement
(assert
  (! (= patient_has_diagnosis_of_acute_chest_syndrome_now
        (and
          patient_has_finding_of_radiologic_infiltrate_of_lung_now
          (or
            patient_has_finding_of_respiratory_symptoms_now
            patient_has_finding_of_respiratory_signs_now
            patient_has_finding_of_fever_now
            patient_has_finding_of_chest_pain_now)))
     :named REQ3_AUXILIARY1)) ;; "To be included, the patient must meet clinical criteria for acute chest syndrome (defined as (an infiltrate on chest X-ray) AND (at least one of the following: respiratory symptoms OR respiratory signs (patient's pulse oximetry < 92 percent OR oxygen saturation < 2 percent below the patient's baseline OR tachypnea OR cough OR increased work of breathing) OR fever OR chest pain))."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_diagnosis_of_acute_chest_syndrome_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet clinical criteria for acute chest syndrome (defined as (an infiltrate on chest X-ray) AND (at least one of the following: respiratory symptoms OR respiratory signs (patient's pulse oximetry < 92 percent OR oxygen saturation < 2 percent below the patient's baseline OR tachypnea OR cough OR increased work of breathing) OR fever OR chest pain))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_can_undergo_transfusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently eligible to undergo a transfusion.","when_to_set_to_false":"Set to false if the patient is currently not eligible to undergo a transfusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently eligible to undergo a transfusion.","meaning":"Boolean indicating whether the patient is currently eligible to undergo a transfusion."} ;; "the patient must be eligible for a simple transfusion"
(declare-const patient_has_finding_of_hypoxemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoxemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoxemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoxemia.","meaning":"Boolean indicating whether the patient currently has hypoxemia."} ;; "hypoxemia"
(declare-const patient_hemoglobin_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's hemoglobin concentration in grams per deciliter recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin concentration in grams per deciliter."} ;; "hemoglobin < 5 grams per deciliter"

;; The following variables are reused and not redeclared:
;; patient_pulse_oximetry_value_recorded_now_withunit_percent
;; patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent
;; patient_hemoglobin_saturation_with_oxygen_baseline_value_withunit_percent
;; patient_has_finding_of_increased_work_of_breathing_now

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition of hypoxemia per requirement: pulse oximetry < 92% OR O2 saturation < 2% below baseline
(assert
  (! (= patient_has_finding_of_hypoxemia_now
        (or (< patient_pulse_oximetry_value_recorded_now_withunit_percent 92.0)
            (< patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent
               (- patient_hemoglobin_saturation_with_oxygen_baseline_value_withunit_percent 2.0))))
     :named REQ4_AUXILIARY0)) ;; "hypoxemia (patient's pulse oximetry < 92 percent OR oxygen saturation < 2 percent below the patient's baseline)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; To be eligible for transfusion, at least one of: hypoxemia, hemoglobin < 5, or increased work of breathing
(assert
  (! (= patient_can_undergo_transfusion_now
        (or patient_has_finding_of_hypoxemia_now
            (< patient_hemoglobin_value_recorded_now_withunit_grams_per_deciliter 5.0)
            patient_has_finding_of_increased_work_of_breathing_now))
     :named REQ4_AUXILIARY1)) ;; "eligible for a simple transfusion (based on at least one of the following criteria: hypoxemia ... OR hemoglobin < 5 grams per deciliter OR increased work of breathing)"

(assert
  (! patient_can_undergo_transfusion_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be eligible for a simple transfusion (based on at least one of the following criteria: ... )"
