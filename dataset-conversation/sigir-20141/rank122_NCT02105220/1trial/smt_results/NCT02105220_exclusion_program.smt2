;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_esophageal_varices_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently known to have esophageal varices.","when_to_set_to_false":"Set to false if the patient is currently known not to have esophageal varices.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has esophageal varices.","meaning":"Boolean indicating whether the patient currently has esophageal varices."} ;; "esophageal varices"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_esophageal_varices_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known presence of esophageal varices."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_esophageal_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an esophageal injury (trauma) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an esophageal injury (trauma) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an esophageal injury (trauma).","meaning":"Boolean indicating whether the patient has ever had an esophageal injury (trauma) in their history."} ;; "esophageal trauma"
(declare-const patient_has_finding_of_esophageal_injury_inthehistory@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's esophageal injury (trauma) occurred recently (as defined by study protocol or clinical context).","when_to_set_to_false":"Set to false if the patient's esophageal injury (trauma) did not occur recently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the esophageal injury (trauma) occurred recently.","meaning":"Boolean indicating whether the patient's esophageal injury (trauma) occurred recently."} ;; "recent esophageal trauma"
(declare-const patient_has_undergone_operation_on_esophagus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an operation on the esophagus (esophageal surgery) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone an operation on the esophagus (esophageal surgery) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an operation on the esophagus (esophageal surgery).","meaning":"Boolean indicating whether the patient has ever undergone an operation on the esophagus (esophageal surgery) in their history."} ;; "esophageal surgery"
(declare-const patient_has_undergone_operation_on_esophagus_inthehistory@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's operation on the esophagus (esophageal surgery) occurred recently (as defined by study protocol or clinical context).","when_to_set_to_false":"Set to false if the patient's operation on the esophagus (esophageal surgery) did not occur recently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the operation on the esophagus (esophageal surgery) occurred recently.","meaning":"Boolean indicating whether the patient's operation on the esophagus (esophageal surgery) occurred recently."} ;; "recent esophageal surgery"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for trauma
(assert
(! (=> patient_has_finding_of_esophageal_injury_inthehistory@@recent
      patient_has_finding_of_esophageal_injury_inthehistory)
:named REQ1_AUXILIARY0)) ;; "recent esophageal trauma" implies "esophageal trauma"

;; Qualifier variable implies corresponding stem variable for surgery
(assert
(! (=> patient_has_undergone_operation_on_esophagus_inthehistory@@recent
      patient_has_undergone_operation_on_esophagus_inthehistory)
:named REQ1_AUXILIARY1)) ;; "recent esophageal surgery" implies "esophageal surgery"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_finding_of_esophageal_injury_inthehistory@@recent
            patient_has_undergone_operation_on_esophagus_inthehistory@@recent))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had recent esophageal trauma) OR (the patient has had recent esophageal surgery)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of thrombocytopenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of thrombocytopenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombocytopenia.","meaning":"Boolean indicating whether the patient currently has thrombocytopenia."} ;; "thrombocytopenia"
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has thrombocytopenia and the thrombocytopenia is severe.","when_to_set_to_false":"Set to false if the patient currently has thrombocytopenia but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thrombocytopenia is severe.","meaning":"Boolean indicating whether the patient's thrombocytopenia is severe."} ;; "severe thrombocytopenia"
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's platelet count per cubic millimeter recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count per cubic millimeter."} ;; "platelet count ≤ 10,000 per cubic millimeter"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: severe thrombocytopenia = thrombocytopenia AND platelet count ≤ 10,000 per cubic millimeter
(assert
(! (= patient_has_finding_of_thrombocytopenic_disorder_now@@severe
(and patient_has_finding_of_thrombocytopenic_disorder_now
(<= patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter 10000)))
:named REQ2_AUXILIARY0)) ;; "severe thrombocytopenia (platelet count ≤ 10,000 per cubic millimeter)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_thrombocytopenic_disorder_now@@severe
patient_has_finding_of_thrombocytopenic_disorder_now)
:named REQ2_AUXILIARY1)) ;; "severe thrombocytopenia" implies "thrombocytopenia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_thrombocytopenic_disorder_now@@severe)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe thrombocytopenia (platelet count ≤ 10,000 per cubic millimeter)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (coagulopathy).","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder (coagulopathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder (coagulopathy).","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (coagulopathy)."} ;; "coagulopathy"
(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (coagulopathy) and the disorder is severe.","when_to_set_to_false":"Set to false if the patient currently has a blood coagulation disorder (coagulopathy) but the disorder is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blood coagulation disorder (coagulopathy) is severe.","meaning":"Boolean indicating whether the patient's current blood coagulation disorder (coagulopathy) is severe."} ;; "severe coagulopathy"
(declare-const patient_international_normalized_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current international normalized ratio (INR) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current international normalized ratio (INR)."} ;; "international normalized ratio ≥ 2"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: severe coagulopathy = INR ≥ 2
(assert
(! (= patient_has_finding_of_blood_coagulation_disorder_now@@severe
     (>= patient_international_normalized_ratio_value_recorded_now_withunit_ratio 2))
   :named REQ3_AUXILIARY0)) ;; "severe coagulopathy (international normalized ratio ≥ 2)."

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_now@@severe
       patient_has_finding_of_blood_coagulation_disorder_now)
   :named REQ3_AUXILIARY1)) ;; "severe coagulopathy" implies "coagulopathy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now@@severe)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe coagulopathy (international normalized ratio ≥ 2)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_pneumothorax_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumothorax.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumothorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumothorax.","meaning":"Boolean indicating whether the patient currently has pneumothorax."} ;; "presence of pneumothorax"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_pneumothorax_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of pneumothorax."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute respiratory distress syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute respiratory distress syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute respiratory distress syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute respiratory distress syndrome."} ;; "acute respiratory distress syndrome"
(declare-const patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now@@moderate_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute respiratory distress syndrome and the severity is moderate.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of acute respiratory distress syndrome but the severity is not moderate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of the diagnosed acute respiratory distress syndrome is moderate.","meaning":"Boolean indicating whether the patient currently has a diagnosis of moderate acute respiratory distress syndrome."} ;; "diagnosed moderate acute respiratory distress syndrome"
(declare-const patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now@@severe_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute respiratory distress syndrome and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of acute respiratory distress syndrome but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of the diagnosed acute respiratory distress syndrome is severe.","meaning":"Boolean indicating whether the patient currently has a diagnosis of severe acute respiratory distress syndrome."} ;; "diagnosed severe acute respiratory distress syndrome"
(declare-const patient_has_undergone_measurement_of_partial_pressure_of_oxygen_in_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has undergone measurement of partial pressure of oxygen in blood.","when_to_set_to_false":"Set to false if the patient currently has not undergone measurement of partial pressure of oxygen in blood.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has undergone measurement of partial pressure of oxygen in blood.","meaning":"Boolean indicating whether the patient currently has undergone measurement of partial pressure of oxygen in blood."} ;; "partial pressure of oxygen"
(declare-const patient_has_undergone_oxygenation_index_measurement_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has undergone oxygenation index measurement and the outcome is abnormal (i.e., poor oxygenation index).","when_to_set_to_false":"Set to false if the patient currently has undergone oxygenation index measurement and the outcome is not abnormal (i.e., oxygenation index is not poor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has undergone oxygenation index measurement with abnormal outcome.","meaning":"Boolean indicating whether the patient currently has a poor oxygenation index as determined by abnormal outcome of oxygenation index measurement."} ;; "poor oxygenation index"
(declare-const patient_inspired_oxygen_concentration_value_recorded_now_withunit_unitless Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the fraction of inspired oxygen (FiO2) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fraction of inspired oxygen (FiO2), recorded as a unitless proportion."} ;; "fraction of inspired oxygen"
(declare-const patient_partial_pressure_of_oxygen_in_blood_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the partial pressure of oxygen in blood (PaO2) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current partial pressure of oxygen in blood (PaO2), recorded in millimeters of mercury."} ;; "partial pressure of oxygen"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now@@moderate_severity
      patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now)
   :named REQ6_AUXILIARY0)) ;; "diagnosed moderate acute respiratory distress syndrome"

(assert
(! (=> patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now@@severe_severity
      patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now)
   :named REQ6_AUXILIARY1)) ;; "diagnosed severe acute respiratory distress syndrome"

;; Definition: poor oxygenation index (PaO2/FiO2 < 200 mmHg) implies abnormal oxygenation index
(assert
(! (=> (and 
         patient_has_undergone_measurement_of_partial_pressure_of_oxygen_in_blood_now
         (< (/ patient_partial_pressure_of_oxygen_in_blood_value_recorded_now_withunit_millimeters_of_mercury
               patient_inspired_oxygen_concentration_value_recorded_now_withunit_unitless)
            200))
      patient_has_undergone_oxygenation_index_measurement_now_outcome_is_abnormal)
   :named REQ6_AUXILIARY2)) ;; "poor oxygenation index (partial pressure of oxygen divided by fraction of inspired oxygen < 200 millimeters of mercury)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now@@moderate_severity)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diagnosed moderate acute respiratory distress syndrome."

(assert
(! (not patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now@@severe_severity)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diagnosed severe acute respiratory distress syndrome."

(assert
(! (not patient_has_undergone_oxygenation_index_measurement_now_outcome_is_abnormal)
   :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poor oxygenation index (partial pressure of oxygen divided by fraction of inspired oxygen < 200 millimeters of mercury)."
