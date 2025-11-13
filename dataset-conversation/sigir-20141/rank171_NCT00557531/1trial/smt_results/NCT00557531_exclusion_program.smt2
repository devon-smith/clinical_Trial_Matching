;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of congestive heart failure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had congestive heart failure.","meaning":"Boolean indicating whether the patient has ever had congestive heart failure in their history."} ;; "a history of congestive heart failure"

(declare-const patient_has_finding_of_congestive_heart_failure_inthehistory@@classified_as_per_new_york_heart_association_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of congestive heart failure is classified as per New York Heart Association criteria.","when_to_set_to_false":"Set to false if the patient's history of congestive heart failure is not classified as per New York Heart Association criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of congestive heart failure is classified as per NYHA criteria.","meaning":"Boolean indicating whether the patient's history of congestive heart failure is classified as per NYHA criteria."} ;; "classified as per New York Heart Association criteria"

(declare-const patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_i Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of congestive heart failure is classified as NYHA class I.","when_to_set_to_false":"Set to false if the patient's history of congestive heart failure is not classified as NYHA class I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of congestive heart failure is NYHA class I.","meaning":"Boolean indicating whether the patient's history of congestive heart failure is NYHA class I."} ;; "New York Heart Association class I congestive heart failure"

(declare-const patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of congestive heart failure is classified as NYHA class II.","when_to_set_to_false":"Set to false if the patient's history of congestive heart failure is not classified as NYHA class II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of congestive heart failure is NYHA class II.","meaning":"Boolean indicating whether the patient's history of congestive heart failure is NYHA class II."} ;; "New York Heart Association class II congestive heart failure"

(declare-const patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of congestive heart failure is classified as NYHA class III.","when_to_set_to_false":"Set to false if the patient's history of congestive heart failure is not classified as NYHA class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of congestive heart failure is NYHA class III.","meaning":"Boolean indicating whether the patient's history of congestive heart failure is NYHA class III."} ;; "New York Heart Association class III congestive heart failure"

(declare-const patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of congestive heart failure is classified as NYHA class IV.","when_to_set_to_false":"Set to false if the patient's history of congestive heart failure is not classified as NYHA class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of congestive heart failure is NYHA class IV.","meaning":"Boolean indicating whether the patient's history of congestive heart failure is NYHA class IV."} ;; "New York Heart Association class IV congestive heart failure"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_congestive_heart_failure_inthehistory@@classified_as_per_new_york_heart_association_criteria
      patient_has_finding_of_congestive_heart_failure_inthehistory)
:named REQ0_AUXILIARY0)) ;; "classified as per New York Heart Association criteria"

(assert
(! (=> patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_i
      patient_has_finding_of_congestive_heart_failure_inthehistory)
:named REQ0_AUXILIARY1)) ;; "New York Heart Association class I congestive heart failure"

(assert
(! (=> patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_ii
      patient_has_finding_of_congestive_heart_failure_inthehistory)
:named REQ0_AUXILIARY2)) ;; "New York Heart Association class II congestive heart failure"

(assert
(! (=> patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_iii
      patient_has_finding_of_congestive_heart_failure_inthehistory)
:named REQ0_AUXILIARY3)) ;; "New York Heart Association class III congestive heart failure"

(assert
(! (=> patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_iv
      patient_has_finding_of_congestive_heart_failure_inthehistory)
:named REQ0_AUXILIARY4)) ;; "New York Heart Association class IV congestive heart failure"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have any of the listed findings in their history
(assert
(! (not patient_has_finding_of_congestive_heart_failure_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a history of congestive heart failure"

(assert
(! (not patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_i)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "a history of New York Heart Association class I congestive heart failure as per New York Heart Association criteria"

(assert
(! (not patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_ii)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "a history of New York Heart Association class II congestive heart failure as per New York Heart Association criteria"

(assert
(! (not patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_iii)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "a history of New York Heart Association class III congestive heart failure as per New York Heart Association criteria"

(assert
(! (not patient_has_finding_of_congestive_heart_failure_inthehistory@@new_york_heart_association_class_iv)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "a history of New York Heart Association class IV congestive heart failure as per New York Heart Association criteria"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_left_ventricular_cardiac_dysfunction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had left ventricular cardiac dysfunction at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had left ventricular cardiac dysfunction at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had left ventricular cardiac dysfunction.","meaning":"Boolean indicating whether the patient has ever had left ventricular cardiac dysfunction in their history."} ;; "a history of prior left ventricular dysfunction"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_left_ventricular_cardiac_dysfunction_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of prior left ventricular dysfunction."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_killip_class_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently Killip class III at the time of application of the study device.","when_to_set_to_false":"Set to false if the patient is not currently Killip class III at the time of application of the study device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently Killip class III at the time of application of the study device.","meaning":"Boolean indicating whether the patient is currently Killip class III at the time of application of the study device."} ;; "the patient is Killip class III (pulmonary edema)"

(declare-const patient_is_killip_class_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently Killip class IV at the time of application of the study device.","when_to_set_to_false":"Set to false if the patient is not currently Killip class IV at the time of application of the study device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently Killip class IV at the time of application of the study device.","meaning":"Boolean indicating whether the patient is currently Killip class IV at the time of application of the study device."} ;; "the patient is Killip class IV (cardiogenic shock with hypotension systolic blood pressure < 90 mmHg AND evidence of peripheral hypoperfusion...)"

(declare-const patient_has_finding_of_pulmonary_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary edema at the time of application of the study device.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary edema at the time of application of the study device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary edema at the time of application of the study device.","meaning":"Boolean indicating whether the patient currently has pulmonary edema."} ;; "pulmonary edema"

(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiogenic shock at the time of application of the study device.","when_to_set_to_false":"Set to false if the patient currently does not have cardiogenic shock at the time of application of the study device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiogenic shock at the time of application of the study device.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"

(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypotension (low blood pressure) at the time of application of the study device.","when_to_set_to_false":"Set to false if the patient currently does not have hypotension (low blood pressure) at the time of application of the study device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypotension (low blood pressure) at the time of application of the study device.","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure)."} ;; "hypotension systolic blood pressure < 90 mmHg"

(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure in mmHg is recorded at the time of application of the study device.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} ;; "systolic blood pressure < 90 mmHg"

(declare-const patient_has_finding_of_poor_peripheral_circulation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of poor peripheral circulation (peripheral hypoperfusion) at the time of application of the study device.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of poor peripheral circulation (peripheral hypoperfusion) at the time of application of the study device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of poor peripheral circulation (peripheral hypoperfusion) at the time of application of the study device.","meaning":"Boolean indicating whether the patient currently has poor peripheral circulation (peripheral hypoperfusion)."} ;; "evidence of peripheral hypoperfusion"

(declare-const patient_has_finding_of_oliguria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has oliguria at the time of application of the study device.","when_to_set_to_false":"Set to false if the patient currently does not have oliguria at the time of application of the study device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has oliguria at the time of application of the study device.","meaning":"Boolean indicating whether the patient currently has oliguria."} ;; "oliguria"

(declare-const patient_has_finding_of_cyanosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cyanosis at the time of application of the study device.","when_to_set_to_false":"Set to false if the patient currently does not have cyanosis at the time of application of the study device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cyanosis at the time of application of the study device.","meaning":"Boolean indicating whether the patient currently has cyanosis."} ;; "cyanosis"

(declare-const patient_has_finding_of_sweating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sweating at the time of application of the study device.","when_to_set_to_false":"Set to false if the patient currently does not have sweating at the time of application of the study device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sweating at the time of application of the study device.","meaning":"Boolean indicating whether the patient currently has sweating."} ;; "sweating"

(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's heart rate in beats per minute is recorded at the time of application of the study device.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute."} ;; "heart rate > 100 beats per minute"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Pulmonary edema is a defining feature of Killip class III
(assert
(! (=> patient_has_finding_of_pulmonary_edema_now
patient_is_killip_class_iii_now)
:named REQ2_AUXILIARY0)) ;; "Killip class III (pulmonary edema)"

;; Cardiogenic shock is a defining feature of Killip class IV
(assert
(! (=> patient_has_finding_of_cardiogenic_shock_now
patient_is_killip_class_iv_now)
:named REQ2_AUXILIARY1)) ;; "Killip class IV (cardiogenic shock...)"

;; Hypotension (systolic BP < 90 mmHg) is a defining feature of Killip class IV
(assert
(! (=> (< patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 90)
patient_has_finding_of_low_blood_pressure_now)
:named REQ2_AUXILIARY2)) ;; "hypotension systolic blood pressure < 90 mmHg"

;; Non-exhaustive examples for peripheral hypoperfusion
(assert
(! (=> (or patient_has_finding_of_oliguria_now
          patient_has_finding_of_cyanosis_now
          patient_has_finding_of_sweating_now)
patient_has_finding_of_poor_peripheral_circulation_now)
:named REQ2_AUXILIARY3)) ;; "evidence of peripheral hypoperfusion with non-exhaustive examples (oliguria, cyanosis, sweating)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient is Killip class III
(assert
(! (not patient_is_killip_class_iii_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, at the time of application of the study device, the patient is Killip class III (pulmonary edema)."

;; Exclusion: patient is Killip class IV (cardiogenic shock with hypotension and evidence of peripheral hypoperfusion)
(assert
(! (not (and patient_is_killip_class_iv_now
             patient_has_finding_of_cardiogenic_shock_now
             patient_has_finding_of_low_blood_pressure_now
             patient_has_finding_of_poor_peripheral_circulation_now))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, at the time of application of the study device, the patient is Killip class IV (cardiogenic shock with hypotension systolic blood pressure < 90 mmHg AND evidence of peripheral hypoperfusion...)"

;; Exclusion: patient has heart rate > 100 beats per minute
(assert
(! (not (> patient_heart_rate_value_recorded_now_withunit_beats_per_minute 100))
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, at the time of application of the study device, the patient has a heart rate > 100 beats per minute."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass grafting at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass grafting prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass grafting in the past."} ;; "coronary artery bypass grafting"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior coronary artery bypass grafting."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction at any time in the past (prior to the current evaluation).","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction in their history."} ;; "has had a prior myocardial infarction"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a prior myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever been diagnosed with cerebrovascular accident (stroke) in their history."} ;; "stroke"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stroke."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a heart valve disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a heart valve disorder.","meaning":"Boolean indicating whether the patient currently has a heart valve disorder."} ;; "valvular disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@significant_and_moderate_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder and the disorder is both significant and moderate in severity.","when_to_set_to_false":"Set to false if the patient currently has a heart valve disorder but it is not both significant and moderate in severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart valve disorder is both significant and moderate in severity.","meaning":"Boolean indicating whether the patient currently has a heart valve disorder that is both significant and moderate in severity."} ;; "significant moderate valvular disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@significant_and_severe_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder and the disorder is both significant and severe in severity.","when_to_set_to_false":"Set to false if the patient currently has a heart valve disorder but it is not both significant and severe in severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart valve disorder is both significant and severe in severity.","meaning":"Boolean indicating whether the patient currently has a heart valve disorder that is both significant and severe in severity."} ;; "significant severe valvular disease"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@significant_and_moderate_severity
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ6_AUXILIARY0)) ;; "significant moderate valvular disease"

(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@significant_and_severe_severity
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ6_AUXILIARY1)) ;; "significant severe valvular disease"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@significant_and_moderate_severity)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant moderate valvular disease."

(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@significant_and_severe_severity)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant severe valvular disease."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_can_undergo_coronary_artery_bypass_graft_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a candidate for coronary artery bypass graft (CABG) procedure.","when_to_set_to_false":"Set to false if the patient is currently not a candidate for coronary artery bypass graft (CABG) procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a candidate for coronary artery bypass graft (CABG) procedure.","meaning":"Boolean indicating whether the patient is currently a candidate for coronary artery bypass graft (CABG) procedure."} ;; "the patient is a candidate for coronary artery bypass grafting"

(declare-const patient_can_undergo_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a candidate for percutaneous coronary intervention (PCI).","when_to_set_to_false":"Set to false if the patient is currently not a candidate for percutaneous coronary intervention (PCI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a candidate for percutaneous coronary intervention (PCI).","meaning":"Boolean indicating whether the patient is currently a candidate for percutaneous coronary intervention (PCI)."} ;; "the patient is a candidate for percutaneous coronary intervention"

(declare-const patient_can_undergo_percutaneous_coronary_intervention_now@@on_non_infarct_related_artery Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a candidate for percutaneous coronary intervention (PCI) on a non-infarct related artery.","when_to_set_to_false":"Set to false if the patient is currently a candidate for PCI but not on a non-infarct related artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PCI candidacy is for a non-infarct related artery.","meaning":"Boolean indicating that the candidacy for PCI is specifically for a non-infarct related artery."} ;; "the patient is a candidate for percutaneous coronary intervention on a non-infarct related artery"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_can_undergo_percutaneous_coronary_intervention_now@@on_non_infarct_related_artery
       patient_can_undergo_percutaneous_coronary_intervention_now)
   :named REQ7_AUXILIARY0)) ;; "the patient is a candidate for percutaneous coronary intervention on a non-infarct related artery"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_can_undergo_coronary_artery_bypass_graft_now
            patient_can_undergo_percutaneous_coronary_intervention_now@@on_non_infarct_related_artery))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a candidate for coronary artery bypass grafting) OR (the patient is a candidate for percutaneous coronary intervention on a non-infarct related artery)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_being_considered_for_cardiac_resynchronization_therapy_within_next_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient is being considered for cardiac resynchronization therapy and the consideration is for a procedure within the next 30 days.","when_to_set_to_false":"Set to false if the patient is not being considered for cardiac resynchronization therapy within the next 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is being considered for cardiac resynchronization therapy within the next 30 days.","meaning":"Boolean indicating whether the patient is being considered for cardiac resynchronization therapy within the next 30 days."} ;; "The patient is excluded if the patient is being considered for cardiac resynchronization therapy within the next 30 days."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_being_considered_for_cardiac_resynchronization_therapy_within_next_30_days)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is being considered for cardiac resynchronization therapy within the next 30 days."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min_per_1_73m2 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current estimated glomerular filtration rate (eGFR) in mL/min/1.73m2 is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current estimated glomerular filtration rate (eGFR) in mL/min/1.73m2."} ;; "estimated glomerular filtration rate < 60"
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition: renal insufficiency is defined by eGFR < 60
(assert
(! (= patient_has_finding_of_renal_insufficiency_now
(< patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min_per_1_73m2 60))
:named REQ9_AUXILIARY0)) ;; "renal insufficiency (estimated glomerular filtration rate < 60)"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_renal_insufficiency_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal insufficiency (estimated glomerular filtration rate < 60)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_chronic_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic liver disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic liver disease."} ;; "chronic liver disease"
(declare-const patient_has_undergone_hepatic_function_panel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a hepatic function panel (liver function tests) now.","when_to_set_to_false":"Set to false if the patient has not undergone a hepatic function panel (liver function tests) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a hepatic function panel (liver function tests) now.","meaning":"Boolean indicating whether the patient has undergone a hepatic function panel (liver function tests) now."} ;; "liver function tests"
(declare-const liver_function_test_value_recorded_now_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's liver function test result recorded now, expressed as times the upper limit of normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's liver function test result is now in multiples of the upper limit of normal.","meaning":"Numeric value indicating the patient's liver function test result recorded now, expressed in multiples of the upper limit of normal."} ;; "liver function tests greater than three times the upper limit of normal"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (and patient_has_diagnosis_of_chronic_liver_disease_now
             patient_has_undergone_hepatic_function_panel_now
             (> liver_function_test_value_recorded_now_withunit_times_upper_limit_of_normal 3)))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has chronic liver disease) AND (the patient has liver function tests greater than three times the upper limit of normal)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const life_expectancy_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current life expectancy in months if available.","when_to_set_to_null":"Set to null if the patient's current life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current life expectancy in months."} ;; "life expectancy less than twelve months"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (< life_expectancy_value_recorded_now_in_months 12))
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life expectancy less than twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical trial.","when_to_set_to_false":"Set to false if the patient is not currently participating in a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in a clinical trial."} ;; "the patient is a current participant in another clinical trial"
(declare-const patient_has_undergone_clinical_trial_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a clinical trial within the past six months.","when_to_set_to_false":"Set to false if the patient has not participated in a clinical trial within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a clinical trial within the past six months.","meaning":"Boolean indicating whether the patient has participated in a clinical trial within the past six months."} ;; "the patient has participated in another clinical trial within the last six months"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: patient must NOT be a current participant in another clinical trial OR have participated in another clinical trial within the last six months
(assert
(! (not (or patient_is_undergoing_clinical_trial_now
            patient_has_undergone_clinical_trial_inthepast6months))
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a current participant in another clinical trial) OR (the patient has participated in another clinical trial within the last six months)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_can_undergo_coronary_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo coronary angiography (i.e., has no contraindication to the procedure).","when_to_set_to_false":"Set to false if the patient cannot currently undergo coronary angiography (i.e., has any contraindication to the procedure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo coronary angiography.","meaning":"Boolean indicating whether the patient can currently undergo coronary angiography (i.e., has no contraindication to the procedure)."} ;; "any contraindication to coronary angiography"
(declare-const patient_can_undergo_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo magnetic resonance imaging (i.e., has no contraindication to the procedure).","when_to_set_to_false":"Set to false if the patient cannot currently undergo magnetic resonance imaging (i.e., has any contraindication to the procedure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo magnetic resonance imaging.","meaning":"Boolean indicating whether the patient can currently undergo magnetic resonance imaging (i.e., has no contraindication to the procedure)."} ;; "any contraindication to magnetic resonance imaging"
;; patient_can_undergo_percutaneous_coronary_intervention_now is already declared and reused
;; {"when_to_set_to_true":"Set to true if the patient is currently a candidate for percutaneous coronary intervention (PCI).","when_to_set_to_false":"Set to false if the patient is currently not a candidate for percutaneous coronary intervention (PCI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a candidate for percutaneous coronary intervention (PCI).","meaning":"Boolean indicating whether the patient is currently a candidate for percutaneous coronary intervention (PCI)."} ;; "any contraindication to percutaneous coronary intervention procedures"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (and patient_can_undergo_coronary_angiography_now
             patient_can_undergo_magnetic_resonance_imaging_now
             patient_can_undergo_percutaneous_coronary_intervention_now))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has any contraindication to coronary angiography) OR (the patient has any contraindication to magnetic resonance imaging) OR (the patient has any contraindication to percutaneous coronary intervention procedures)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of myocardial infarction."} ;; "myocardial infarction"
(declare-const patient_has_taken_anticoagulation_medication_prior_to_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient was taking anti-coagulation medication at any time prior to the occurrence of myocardial infarction.","when_to_set_to_false":"Set to false if the patient was not taking anti-coagulation medication at any time prior to the occurrence of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was taking anti-coagulation medication prior to myocardial infarction.","meaning":"Boolean indicating whether the patient was taking anti-coagulation medication prior to myocardial infarction."} ;; "was taking anti-coagulation medication prior to myocardial infarction"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_taken_anticoagulation_medication_prior_to_myocardial_infarction)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was taking anti-coagulation medication prior to myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant, as confirmed by a urine pregnancy test.","when_to_set_to_false":"Set to false if the patient is currently not pregnant, as confirmed by a urine pregnancy test or other reliable means.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant with pregnancy confirmed by urine pregnancy test"
(declare-const patient_has_undergone_urine_pregnancy_test_now_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone a urine pregnancy test and the outcome is positive.","when_to_set_to_false":"Set to false if the patient has currently undergone a urine pregnancy test and the outcome is not positive, or if the patient has not undergone the test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone a urine pregnancy test with a positive outcome.","meaning":"Boolean indicating whether the patient has currently undergone a urine pregnancy test and the outcome is positive."} ;; "urine pregnancy test"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patients_lactation_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating (i.e., producing breast milk).","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently lactating.","meaning":"Boolean indicating whether the patient is currently lactating (positive lactation status now)."} ;; "lactating"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Pregnancy status is confirmed by urine pregnancy test
(assert
(! (=> patient_is_pregnant_now patient_has_undergone_urine_pregnancy_test_now_outcome_is_positive)
:named REQ15_AUXILIARY0)) ;; "pregnant with pregnancy confirmed by urine pregnancy test"

;; Lactation status equivalence (both variables encode current lactation)
(assert
(! (= patient_is_lactating_now patients_lactation_is_positive_now)
:named REQ15_AUXILIARY1)) ;; "the patient is lactating" and "lactating"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion: patient must NOT be pregnant (with confirmation by urine pregnancy test)
(assert
(! (not patient_is_pregnant_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant with pregnancy confirmed by urine pregnancy test."

;; Exclusion: patient must NOT be lactating
(assert
(! (not patient_is_lactating_now)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."
