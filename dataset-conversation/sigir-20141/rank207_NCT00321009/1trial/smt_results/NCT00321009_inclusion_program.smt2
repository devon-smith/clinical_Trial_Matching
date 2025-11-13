;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 80 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_of_anterior_wall_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute myocardial infarction of the anterior wall.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute myocardial infarction of the anterior wall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute myocardial infarction of the anterior wall.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute myocardial infarction of the anterior wall."} // "anterior myocardial infarction"
(declare-const patient_has_finding_of_pathological_q_wave_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pathological Q-waves.","when_to_set_to_false":"Set to false if the patient currently does not have pathological Q-waves.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pathological Q-waves.","meaning":"Boolean indicating whether the patient currently has pathological Q-waves."} // "pathological Q-waves"
(declare-const patient_has_finding_of_pathological_q_wave_now@@assumed_to_be_new Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pathological Q-waves are assumed to be new.","when_to_set_to_false":"Set to false if the patient's pathological Q-waves are not assumed to be new.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pathological Q-waves are assumed to be new.","meaning":"Boolean indicating whether the patient's pathological Q-waves are assumed to be new."} // "assumed to be new"
(declare-const patient_has_finding_of_pathological_q_wave_now@@present_in_at_least_3_contiguous_anterior_precordial_leads Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pathological Q-waves are present in at least 3 contiguous anterior precordial leads.","when_to_set_to_false":"Set to false if the patient's pathological Q-waves are not present in at least 3 contiguous anterior precordial leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pathological Q-waves are present in at least 3 contiguous anterior precordial leads.","meaning":"Boolean indicating whether the patient's pathological Q-waves are present in at least 3 contiguous anterior precordial leads."} // "in at least 3 contiguous anterior precordial leads"
(declare-const patient_creatine_kinase_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured peak creatine kinase value if available, recorded now, with units specified.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's peak creatine kinase level recorded now, with units specified."} // "creatine kinase peak"
(declare-const patients_creatine_kinase_isoenzyme_mb_fraction_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's creatine kinase MB fraction is positive now.","when_to_set_to_false":"Set to false if the patient's creatine kinase MB fraction is not positive now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's creatine kinase MB fraction is positive now.","meaning":"Boolean indicating whether the patient's creatine kinase MB fraction is positive now."} // "positive creatine kinase MB bands"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured left ventricular ejection fraction value if available, recorded now, in percent.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's left ventricular ejection fraction recorded now, in percent."} // "left ventricular ejection fraction"
(declare-const patient_has_finding_of_left_ventricular_wall_dyskinetic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left ventricular wall dyskinesis.","when_to_set_to_false":"Set to false if the patient currently does not have left ventricular wall dyskinesis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular wall dyskinesis.","meaning":"Boolean indicating whether the patient currently has left ventricular wall dyskinesis."} // "left ventricular dyskinesis"
(declare-const patient_has_finding_of_left_ventricular_wall_dyskinetic_now@@anterior Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular wall dyskinesis is located in the anterior wall.","when_to_set_to_false":"Set to false if the patient's left ventricular wall dyskinesis is not located in the anterior wall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left ventricular wall dyskinesis is located in the anterior wall.","meaning":"Boolean indicating whether the patient's left ventricular wall dyskinesis is located in the anterior wall."} // "anterior left ventricular dyskinesis"
(declare-const patient_has_finding_of_left_ventricular_thrombus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left ventricular thrombus.","when_to_set_to_false":"Set to false if the patient currently does not have left ventricular thrombus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular thrombus.","meaning":"Boolean indicating whether the patient currently has left ventricular thrombus."} // "left ventricular thrombus"
(declare-const patient_has_finding_of_left_ventricular_thrombus_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular thrombus is documented.","when_to_set_to_false":"Set to false if the patient's left ventricular thrombus is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left ventricular thrombus is documented.","meaning":"Boolean indicating whether the patient's left ventricular thrombus is documented."} // "documented left ventricular thrombus"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_pathological_q_wave_now@@assumed_to_be_new
         patient_has_finding_of_pathological_q_wave_now)
     :named REQ1_AUXILIARY0)) ;; "assumed to be new"

(assert
  (! (=> patient_has_finding_of_pathological_q_wave_now@@present_in_at_least_3_contiguous_anterior_precordial_leads
         patient_has_finding_of_pathological_q_wave_now)
     :named REQ1_AUXILIARY1)) ;; "in at least 3 contiguous anterior precordial leads"

(assert
  (! (=> patient_has_finding_of_left_ventricular_wall_dyskinetic_now@@anterior
         patient_has_finding_of_left_ventricular_wall_dyskinetic_now)
     :named REQ1_AUXILIARY2)) ;; "anterior left ventricular dyskinesis"

(assert
  (! (=> patient_has_finding_of_left_ventricular_thrombus_now@@documented
         patient_has_finding_of_left_ventricular_thrombus_now)
     :named REQ1_AUXILIARY3)) ;; "documented left ventricular thrombus"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: anterior MI with pathological Q-waves in ≥3 contiguous anterior precordial leads (assumed new)
(assert
  (! (and patient_has_diagnosis_of_acute_myocardial_infarction_of_anterior_wall_now
          patient_has_finding_of_pathological_q_wave_now@@present_in_at_least_3_contiguous_anterior_precordial_leads
          patient_has_finding_of_pathological_q_wave_now@@assumed_to_be_new)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "anterior myocardial infarction with pathological Q-waves in at least 3 contiguous anterior precordial leads (assumed to be new)"

;; Component 1: creatine kinase peak > 5 times upper limit of normal
;; NOTE: The upper limit of normal is not defined in the variable set, so we must introduce a variable for it.
(declare-const creatine_kinase_upper_limit_of_normal_value Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for creatine kinase, as defined by the laboratory.","when_to_set_to_null":"Set to null if the reference value is unknown or not available.","meaning":"Numeric value representing the reference upper limit of normal for creatine kinase."} // "upper limit of normal for creatine kinase"
(assert
  (! (> patient_creatine_kinase_value_recorded_now_withunit_unit
        (* 5.0 creatine_kinase_upper_limit_of_normal_value))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "creatine kinase peak > 5 times the upper limit of normal"

;; Component 2: positive creatine kinase MB bands
(assert
  (! patients_creatine_kinase_isoenzyme_mb_fraction_is_positive_now
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "positive creatine kinase MB (muscle/brain) bands"

;; Component 3: (LVEF ≤ 40% OR anterior LV dyskinesis OR documented LV thrombus)
(assert
  (! (or (<= patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 40.0)
         patient_has_finding_of_left_ventricular_wall_dyskinetic_now@@anterior
         patient_has_finding_of_left_ventricular_thrombus_now@@documented)
     :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "(left ventricular ejection fraction ≤ 40% OR anterior left ventricular dyskinesis OR documented left ventricular thrombus)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const myocardial_infarction_onset_to_randomization_interval_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the onset of myocardial infarction and randomization for the patient, if both dates are known.","when_to_set_to_null":"Set to null if either the onset date of myocardial infarction or the randomization date is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the interval in days between myocardial infarction onset and randomization."} // "myocardial infarction onset < 7 days from randomization"
(declare-const patient_has_diagnosis_of_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of myocardial infarction."} // "myocardial infarction"
(declare-const patient_has_diagnosis_of_myocardial_infarction_now@@temporalcontext_within7days_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the onset of the patient's myocardial infarction occurred within 7 days before randomization.","when_to_set_to_false":"Set to false if the onset of the patient's myocardial infarction did not occur within 7 days before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of myocardial infarction occurred within 7 days before randomization.","meaning":"Boolean indicating whether the onset of myocardial infarction occurred within 7 days before randomization."} // "myocardial infarction onset < 7 days from randomization"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: temporal context qualifier is true iff MI diagnosis is present AND onset-to-randomization interval < 7 days
(assert
  (! (= patient_has_diagnosis_of_myocardial_infarction_now@@temporalcontext_within7days_before_randomization
        (and patient_has_diagnosis_of_myocardial_infarction_now
             (< myocardial_infarction_onset_to_randomization_interval_in_days 7)))
     :named REQ2_AUXILIARY0)) ;; "myocardial infarction onset < 7 days from randomization"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_myocardial_infarction_now@@temporalcontext_within7days_before_randomization
         patient_has_diagnosis_of_myocardial_infarction_now)
     :named REQ2_AUXILIARY1)) ;; "myocardial infarction onset < 7 days from randomization"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_diagnosis_of_myocardial_infarction_now@@temporalcontext_within7days_before_randomization
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "myocardial infarction onset < 7 days from randomization"
