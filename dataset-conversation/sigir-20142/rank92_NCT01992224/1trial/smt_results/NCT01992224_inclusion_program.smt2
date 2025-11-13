;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_pancreatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pancreatitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pancreatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pancreatitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pancreatitis."} // "a diagnosis of pancreatitis"
(declare-const patient_has_typical_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has typical abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have typical abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has typical abdominal pain.","meaning":"Boolean indicating whether the patient currently has typical abdominal pain."} // "typical pain"
(declare-const patient_has_finding_of_high_lipase_level_in_serum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a high lipase level in serum.","when_to_set_to_false":"Set to false if the patient currently does not have a high lipase level in serum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a high lipase level in serum.","meaning":"Boolean indicating whether the patient currently has a high lipase level in serum."} // "increase in serum lipase level"
(declare-const patient_has_finding_of_serum_amylase_raised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a raised serum amylase level.","when_to_set_to_false":"Set to false if the patient currently does not have a raised serum amylase level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a raised serum amylase level.","meaning":"Boolean indicating whether the patient currently has a raised serum amylase level."} // "increase in serum amylase level"
(declare-const patient_has_symptoms_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of abdominal pain.","meaning":"Boolean indicating whether the patient currently has symptoms of abdominal pain."} // "abdominal pain"
(declare-const patient_has_symptoms_of_abdominal_pain_now@@temporalcontext_within_72_hours_before_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of abdominal pain and the onset occurred within 72 hours before admission.","when_to_set_to_false":"Set to false if the patient currently has symptoms of abdominal pain but the onset did not occur within 72 hours before admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of abdominal pain occurred within 72 hours before admission.","meaning":"Boolean indicating whether the onset of abdominal pain occurred within 72 hours before admission."} // "onset of abdominal pain within 72 hours before admission"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_symptoms_of_abdominal_pain_now@@temporalcontext_within_72_hours_before_admission
         patient_has_symptoms_of_abdominal_pain_now)
     :named REQ0_AUXILIARY0)) ;; "onset of abdominal pain within 72 hours before admission" implies "abdominal pain"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have diagnosis of pancreatitis
(assert
  (! patient_has_diagnosis_of_pancreatitis_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a diagnosis of pancreatitis"

;; Component 1: Must have typical pain
(assert
  (! patient_has_typical_abdominal_pain_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "typical pain"

;; Component 2: Must have increase in serum lipase OR increase in serum amylase
(assert
  (! (or patient_has_finding_of_high_lipase_level_in_serum_now
         patient_has_finding_of_serum_amylase_raised_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "increase in serum lipase level OR increase in serum amylase level"

;; Component 3: Must have onset of abdominal pain within 72 hours before admission
(assert
  (! patient_has_symptoms_of_abdominal_pain_now@@temporalcontext_within_72_hours_before_admission
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "onset of abdominal pain within 72 hours before admission"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_pancreatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute pancreatitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute pancreatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute pancreatitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute pancreatitis."} // "acute pancreatitis"
(declare-const patient_has_diagnosis_of_severe_acute_pancreatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of severe acute pancreatitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of severe acute pancreatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of severe acute pancreatitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of severe acute pancreatitis."} // "severe acute pancreatitis"
(declare-const patient_has_diagnosis_of_severe_acute_pancreatitis_now@@according_to_atlanta_criteria_2012 Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of severe acute pancreatitis is made according to the Atlanta criteria revised in 2012.","when_to_set_to_false":"Set to false if the diagnosis of severe acute pancreatitis is not made according to the Atlanta criteria revised in 2012.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of severe acute pancreatitis is made according to the Atlanta criteria revised in 2012.","meaning":"Boolean indicating whether the diagnosis of severe acute pancreatitis is made according to the Atlanta criteria revised in 2012."} // "according to Atlanta criteria revisited in 2012"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_severe_acute_pancreatitis_now@@according_to_atlanta_criteria_2012
         patient_has_diagnosis_of_severe_acute_pancreatitis_now)
     :named REQ1_AUXILIARY0)) ;; "diagnosis of severe acute pancreatitis according to Atlanta criteria revisited in 2012"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_severe_acute_pancreatitis_now@@according_to_atlanta_criteria_2012
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must meet the diagnosis criteria of severe acute pancreatitis according to Atlanta criteria revisited in 2012"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute respiratory distress syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute respiratory distress syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute respiratory distress syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute respiratory distress syndrome."} // "a diagnosis of acute respiratory distress syndrome"
(declare-const patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now@@meets_berlin_definition_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of acute respiratory distress syndrome meets the criteria of the Berlin definition.","when_to_set_to_false":"Set to false if the patient's diagnosis of acute respiratory distress syndrome does not meet the criteria of the Berlin definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of acute respiratory distress syndrome meets the criteria of the Berlin definition.","meaning":"Boolean indicating whether the patient's diagnosis of acute respiratory distress syndrome meets the criteria of the Berlin definition."} // "meets the criteria of the Berlin definition"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now@@meets_berlin_definition_criteria
         patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now)
     :named REQ2_AUXILIARY0)) ;; "diagnosis of acute respiratory distress syndrome that meets the criteria of the Berlin definition"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now@@meets_berlin_definition_criteria
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "diagnosis of acute respiratory distress syndrome that meets the criteria of the Berlin definition"
