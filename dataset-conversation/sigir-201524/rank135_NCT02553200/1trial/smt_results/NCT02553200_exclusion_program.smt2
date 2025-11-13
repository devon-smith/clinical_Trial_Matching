;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pneumothorax_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumothorax.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumothorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumothorax.","meaning":"Boolean indicating whether the patient currently has pneumothorax."} ;; "pneumothorax"
(declare-const patient_has_finding_of_pneumothorax_now@@nontreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumothorax is nontreated.","when_to_set_to_false":"Set to false if the patient's current pneumothorax is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumothorax is nontreated.","meaning":"Boolean indicating whether the patient's current pneumothorax is nontreated."} ;; "nontreated pneumothorax"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_pneumothorax_now@@nontreated
      patient_has_finding_of_pneumothorax_now)
:named REQ0_AUXILIARY0)) ;; "nontreated pneumothorax" implies "pneumothorax"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_pneumothorax_now@@nontreated)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nontreated pneumothorax."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hemoptysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemoptysis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemoptysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemoptysis.","meaning":"Boolean indicating whether the patient currently has hemoptysis."} ;; "hemoptysis"
(declare-const patient_has_finding_of_hemoptysis_now@@massive Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hemoptysis and the hemoptysis is massive.","when_to_set_to_false":"Set to false if the patient currently has hemoptysis but it is not massive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hemoptysis is massive.","meaning":"Boolean indicating whether the patient's current hemoptysis is massive."} ;; "massive hemoptysis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hemoptysis_now@@massive
       patient_has_finding_of_hemoptysis_now)
   :named REQ1_AUXILIARY0)) ;; "massive hemoptysis" implies "hemoptysis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hemoptysis_now@@massive)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has massive hemoptysis."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute myocardial infarction."} ;; "acute myocardial infarction"
(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of angina pectoris.","meaning":"Boolean indicating whether the patient currently has angina pectoris."} ;; "angina chest pain"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_has_finding_of_acute_myocardial_infarction_now
             patient_has_finding_of_angina_pectoris_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (acute myocardial infarction) AND (angina chest pain)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_raised_intracranial_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current intracranial pressure (in mm Hg) is available.","when_to_set_to_null":"Set to null if no current intracranial pressure measurement (in mm Hg) is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current intracranial pressure in mm Hg."} ;; "high intracranial pressure > 20 mm Hg"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (> patient_raised_intracranial_pressure_value_recorded_now_withunit_mm_hg 20))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has high intracranial pressure > 20 mm Hg."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cardiac arrhythmia."} ;; "arrhythmia"
(declare-const patient_has_diagnosis_of_cardiac_arrhythmia_now@@is_major Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cardiac arrhythmia and the arrhythmia is major.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of cardiac arrhythmia but the arrhythmia is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac arrhythmia is major.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia is major."} ;; "major arrhythmia"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_cardiac_arrhythmia_now@@is_major
       patient_has_diagnosis_of_cardiac_arrhythmia_now)
   :named REQ4_AUXILIARY0)) ;; "major arrhythmia" implies "arrhythmia"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_cardiac_arrhythmia_now@@is_major)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has major arrhythmia."
