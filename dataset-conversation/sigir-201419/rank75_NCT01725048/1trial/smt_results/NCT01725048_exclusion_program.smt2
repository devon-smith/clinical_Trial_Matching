;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_illiteracy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of illiteracy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of illiteracy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of illiteracy.","meaning":"Boolean indicating whether the patient currently has illiteracy."} ;; "illiteracy"
(declare-const patient_has_finding_of_neurologic_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has neurologic illness.","when_to_set_to_false":"Set to false if the patient currently does not have neurologic illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neurologic illness.","meaning":"Boolean indicating whether the patient currently has neurologic illness."} ;; "neurologic illness"
(declare-const patient_has_finding_of_visual_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of visual impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of visual impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of visual impairment.","meaning":"Boolean indicating whether the patient currently has visual impairment."} ;; "visual problems"
(declare-const patient_has_finding_of_inability_to_speak_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to speak English.","when_to_set_to_false":"Set to false if the patient currently does not have inability to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to speak English.","meaning":"Boolean indicating whether the patient currently has inability to speak English."} ;; "inability to speak English"
(declare-const patient_has_finding_of_inability_to_read_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to read English.","when_to_set_to_false":"Set to false if the patient currently does not have inability to read English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to read English.","meaning":"Boolean indicating whether the patient currently has inability to read English."} ;; "inability to read English"
(declare-const patient_has_finding_of_inability_to_complete_self_report_instruments_now_due_to_other_causes Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to complete self-report instruments due to other causes not listed (illiteracy, neurologic illness, visual problems, inability to speak English, inability to read English).","when_to_set_to_false":"Set to false if the patient is currently able to complete self-report instruments or if the inability is due to one of the listed causes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to complete self-report instruments due to other causes.","meaning":"Boolean indicating whether the patient is currently unable to complete self-report instruments due to other causes."} ;; "other causes"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_illiteracy_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to complete self-report instruments due to illiteracy."

(assert
(! (not patient_has_finding_of_neurologic_illness_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to complete self-report instruments due to neurologic illness."

(assert
(! (not patient_has_finding_of_visual_impairment_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to complete self-report instruments due to visual problems."

(assert
(! (not patient_has_finding_of_inability_to_speak_english_now)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to complete self-report instruments due to inability to speak English."

(assert
(! (not patient_has_finding_of_inability_to_read_english_now)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to complete self-report instruments due to inability to read English."

(assert
(! (not patient_has_finding_of_inability_to_complete_self_report_instruments_now_due_to_other_causes)
:named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to complete self-report instruments due to other causes."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_antidepressant_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an antidepressant medication at any time within the past three months.","when_to_set_to_false":"Set to false if the patient has not been exposed to an antidepressant medication at any time within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to an antidepressant medication within the past three months.","meaning":"Boolean indicating whether the patient has been exposed to an antidepressant medication within the past three months."} ;; "antidepressant medication"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an antipsychotic medication at any time within the past three months.","when_to_set_to_false":"Set to false if the patient has not been exposed to an antipsychotic medication at any time within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to an antipsychotic medication within the past three months.","meaning":"Boolean indicating whether the patient has been exposed to an antipsychotic medication within the past three months."} ;; "antipsychotic medication"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_exposed_to_antidepressant_inthepast3months)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been treated with antidepressant medication within the last three months."

(assert
(! (not patient_is_exposed_to_anti_psychotic_agent_inthepast3months)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been treated with antipsychotic medication within the last three months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_psychotic_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychotic behavior.","when_to_set_to_false":"Set to false if the patient currently does not have psychotic behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychotic behavior.","meaning":"Boolean indicating whether the patient currently has psychotic behavior."} ;; "psychotic behavior"
(declare-const patient_has_finding_of_manic_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of manic behavior.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of manic behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of manic behavior.","meaning":"Boolean indicating whether the patient currently has manic behavior."} ;; "manic behavior"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_psychotic_behavior_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychotic behavior."

(assert
(! (not patient_has_finding_of_manic_behavior_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has manic behavior."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_suicidal_thoughts_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suicidal ideation.","when_to_set_to_false":"Set to false if the patient currently does not have suicidal ideation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suicidal ideation.","meaning":"Boolean indicating whether the patient currently has suicidal ideation."} ;; "suicidal ideation"
(declare-const patient_has_finding_of_suicidal_thoughts_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suicidal ideation and the ideation is active.","when_to_set_to_false":"Set to false if the patient currently has suicidal ideation but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current suicidal ideation is active.","meaning":"Boolean indicating whether the patient's current suicidal ideation is active."} ;; "active suicidal ideation"
(declare-const patient_has_finding_of_planning_suicide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a suicidal plan.","when_to_set_to_false":"Set to false if the patient currently does not have a suicidal plan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a suicidal plan.","meaning":"Boolean indicating whether the patient currently has a suicidal plan."} ;; "suicidal plan"
(declare-const patient_has_finding_of_planning_suicide_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a suicidal plan and the plan is active.","when_to_set_to_false":"Set to false if the patient currently has a suicidal plan but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current suicidal plan is active.","meaning":"Boolean indicating whether the patient's current suicidal plan is active."} ;; "active suicidal plan"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_suicidal_thoughts_now@@active
       patient_has_finding_of_suicidal_thoughts_now)
   :named REQ3_AUXILIARY0)) ;; "active suicidal ideation"

(assert
(! (=> patient_has_finding_of_planning_suicide_now@@active
       patient_has_finding_of_planning_suicide_now)
   :named REQ3_AUXILIARY1)) ;; "active suicidal plan"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_suicidal_thoughts_now@@active)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active suicidal ideation."

(assert
(! (not patient_has_finding_of_planning_suicide_now@@active)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active suicidal plan."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_illicit_substance_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has illicit substance abuse.","when_to_set_to_false":"Set to false if the patient currently does not have illicit substance abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has illicit substance abuse.","meaning":"Boolean indicating whether the patient currently has illicit substance abuse."} ;; "current illicit substance abuse"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_illicit_substance_abuse_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current illicit substance abuse."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute_per_1_73_meters_squared Real) ;; {"when_to_set_to_value":"Set to the measured value if a creatinine clearance measurement (in mL/min/1.73m2) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine clearance in mL/min/1.73m2."} ;; "creatinine clearance"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"
(declare-const patient_has_finding_of_renal_impairment_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal impairment is severe.","when_to_set_to_false":"Set to false if the patient's renal impairment is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal impairment is severe.","meaning":"Boolean indicating whether the patient's renal impairment is severe."} ;; "severe renal impairment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: severe renal impairment as defined by creatinine clearance < 15 mL/min/1.73m2
(assert
(! (= patient_has_finding_of_renal_impairment_now@@severe
     (and patient_has_finding_of_renal_impairment_now
          (< patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute_per_1_73_meters_squared 15)))
   :named REQ5_AUXILIARY0)) ;; "severe renal impairment as defined by creatinine clearance of less than 15 milliliters per minute per 1.73 meters squared (mL/min/m2)."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severe
       patient_has_finding_of_renal_impairment_now)
   :named REQ5_AUXILIARY1)) ;; "severe renal impairment" implies "renal impairment"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now@@severe)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has severe renal impairment as defined by creatinine clearance of less than 15 milliliters per minute per 1.73 meters squared (mL/min/m2)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current aspartate aminotransferase (AST) concentration in multiples of the upper limit of normal (ULN) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current AST concentration in multiples of ULN."} ;; "aspartate aminotransferase concentration greater than 5 times the upper limit of normal"
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current alanine aminotransferase (ALT) concentration in multiples of the upper limit of normal (ULN) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current ALT concentration in multiples of ULN."} ;; "alanine aminotransferase concentration greater than 5 times the upper limit of normal"
(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current total bilirubin concentration in mg/dL is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current total bilirubin concentration in mg/dL."} ;; "total bilirubin concentration greater than 3.0 milliliters per deciliter (mL/dL)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (> patient_aspartate_transaminase_level_value_recorded_now_withunit_times_upper_limit_of_normal 5))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aspartate aminotransferase concentration greater than 5 times the upper limit of normal"

(assert
(! (not (> patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_times_upper_limit_of_normal 5))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "alanine aminotransferase concentration greater than 5 times the upper limit of normal"

(assert
(! (not (> patient_bilirubin_total_measurement_value_recorded_now_withunit_mg_per_dl 3.0))
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "total bilirubin concentration greater than 3.0 milliliters per deciliter (mL/dL)"

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_congenital_long_qt_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with congenital long QT syndrome at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with congenital long QT syndrome at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with congenital long QT syndrome.","meaning":"Boolean indicating whether the patient has ever been diagnosed with congenital long QT syndrome in their medical history."} ;; "a history of congenital long QT syndrome"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_congenital_long_qt_syndrome_inthehistory)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of congenital long QT syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congestive heart failure is clinically significant.","when_to_set_to_false":"Set to false if the patient's congestive heart failure is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure is clinically significant.","meaning":"Boolean indicating whether the patient's congestive heart failure is clinically significant."} ;; "clinically significant congestive heart failure"
(declare-const patient_has_finding_of_bradyarrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bradyarrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bradyarrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bradyarrhythmia.","meaning":"Boolean indicating whether the patient currently has bradyarrhythmia."} ;; "bradyarrhythmia"
(declare-const patient_has_finding_of_bradyarrhythmia_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bradyarrhythmia is clinically significant.","when_to_set_to_false":"Set to false if the patient's bradyarrhythmia is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bradyarrhythmia is clinically significant.","meaning":"Boolean indicating whether the patient's bradyarrhythmia is clinically significant."} ;; "clinically significant bradyarrhythmia"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@clinically_significant
      patient_has_finding_of_congestive_heart_failure_now)
:named REQ8_AUXILIARY0)) ;; "clinically significant congestive heart failure"

(assert
(! (=> patient_has_finding_of_bradyarrhythmia_now@@clinically_significant
      patient_has_finding_of_bradyarrhythmia_now)
:named REQ8_AUXILIARY1)) ;; "clinically significant bradyarrhythmia"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_congestive_heart_failure_now@@clinically_significant)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant congestive heart failure."

(assert
(! (not patient_has_finding_of_bradyarrhythmia_now@@clinically_significant)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant bradyarrhythmia."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_citalopram_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assigned to or exposed to citalopram (e.g., as part of the treatment arm).","when_to_set_to_false":"Set to false if the patient is not currently assigned to or exposed to citalopram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently assigned to or exposed to citalopram.","meaning":"Boolean indicating whether the patient is currently exposed to citalopram."} ;; "the patient is assigned to the citalopram arm"
(declare-const patient_is_being_treated_with_concomitant_medication_known_to_prolong_qt_interval_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with a concomitant medication that is known to have a strong association with corrected QT interval prolongation.","when_to_set_to_false":"Set to false if the patient is not currently being treated with any concomitant medication known to have a strong association with corrected QT interval prolongation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with a concomitant medication known to have a strong association with corrected QT interval prolongation.","meaning":"Boolean indicating whether the patient is currently being treated with a concomitant medication that is known to have a strong association with corrected QT interval prolongation."} ;; "the patient is being treated with a concomitant medication that is known to have a strong association with corrected QT interval prolongation"
(declare-const patient_qt_interval_feature_value_recorded_now_withunit_millisecond Real) ;; {"when_to_set_to_value":"Set to the measured value in milliseconds if the patient's corrected QT interval is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's currently measured corrected QT interval in milliseconds."} ;; "corrected QT interval > 460 milliseconds for men" / "corrected QT interval > 470 milliseconds for women"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is male."} ;; "corrected QT interval > 460 milliseconds for men"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "corrected QT interval > 470 milliseconds for women"
(declare-const patient_has_finding_of_prolonged_qt_interval_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of prolonged corrected QT interval.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of prolonged corrected QT interval.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of prolonged corrected QT interval.","meaning":"Boolean indicating whether the patient currently has the clinical finding of prolonged corrected QT interval."} ;; "corrected QT interval prolongation"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Prolonged QT interval is defined as >460 ms for men or >470 ms for women
(assert
(! (= patient_has_finding_of_prolonged_qt_interval_now
     (or (and patient_sex_is_male_now
              (> patient_qt_interval_feature_value_recorded_now_withunit_millisecond 460))
         (and patient_sex_is_female_now
              (> patient_qt_interval_feature_value_recorded_now_withunit_millisecond 470))))
:named REQ9_AUXILIARY0)) ;; "((the patient has a corrected QT interval > 460 milliseconds for men) OR (the patient has a corrected QT interval > 470 milliseconds for women))"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (and patient_is_exposed_to_citalopram_now
             patient_is_being_treated_with_concomitant_medication_known_to_prolong_qt_interval_now
             patient_has_finding_of_prolonged_qt_interval_now))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is assigned to the citalopram arm) AND (the patient is being treated with a concomitant medication that is known to have a strong association with corrected QT interval prolongation) AND ((the patient has a corrected QT interval > 460 milliseconds for men) OR (the patient has a corrected QT interval > 470 milliseconds for women))."
