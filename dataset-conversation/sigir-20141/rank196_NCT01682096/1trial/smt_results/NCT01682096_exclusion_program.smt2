;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_allergy_to_iodinated_contrast_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to iodinated contrast media.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to iodinated contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to iodinated contrast media.","meaning":"Boolean indicating whether the patient currently has a known allergy to iodinated contrast media."} ;; "The patient is excluded if the patient has a known allergy to iodinated contrast agent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_allergy_to_iodinated_contrast_media_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to iodinated contrast agent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"

(declare-const patient_has_finding_of_renal_insufficiency_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal insufficiency is known (previously diagnosed or documented).","when_to_set_to_false":"Set to false if the patient's renal insufficiency is not known (not previously diagnosed or documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal insufficiency is known.","meaning":"Boolean indicating whether the patient's renal insufficiency is known (previously diagnosed or documented)."} ;; "known renal insufficiency"

(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's creatinine level (in mg/dl) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine level in mg/dl."} ;; "creatinine level"

(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl@@measured_at_admission Bool) ;; {"when_to_set_to_true":"Set to true if the creatinine level measurement was taken at admission.","when_to_set_to_false":"Set to false if the creatinine level measurement was not taken at admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the creatinine level measurement was taken at admission.","meaning":"Boolean indicating whether the creatinine level measurement was taken at admission."} ;; "creatinine level greater than 1.5 mg/dl at admission"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for renal insufficiency
(assert
(! (=> patient_has_finding_of_renal_insufficiency_now@@known
      patient_has_finding_of_renal_insufficiency_now)
   :named REQ1_AUXILIARY0)) ;; "known renal insufficiency"

;; Qualifier variable implies creatinine measurement is at admission
(assert
(! (=> patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl@@measured_at_admission
      (exists ((x Real)) (= x patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl)))
   :named REQ1_AUXILIARY1)) ;; "creatinine level measured at admission"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have known renal insufficiency
(assert
(! (not patient_has_finding_of_renal_insufficiency_now@@known)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known renal insufficiency."

;; Exclusion: patient must NOT have a creatinine level > 1.5 mg/dl at admission
(assert
(! (not (and patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl@@measured_at_admission
             (> patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 1.5)))
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a creatinine level greater than 1.5 mg/dl at admission."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with coronary arteriosclerosis (coronary artery disease) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with coronary arteriosclerosis (coronary artery disease) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with coronary arteriosclerosis (coronary artery disease).","meaning":"Boolean indicating whether the patient has ever been diagnosed with coronary arteriosclerosis (coronary artery disease) in their history."} ;; "the patient has a history of known coronary artery disease"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of coronary arteriosclerosis (coronary artery disease) is known, documented, and confirmed.","when_to_set_to_false":"Set to false if the patient's history of coronary arteriosclerosis (coronary artery disease) is not known, not documented, or uncertain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of coronary arteriosclerosis (coronary artery disease) is known.","meaning":"Boolean indicating whether the patient's history of coronary arteriosclerosis (coronary artery disease) is known and documented."} ;; "known coronary artery disease"
(declare-const patient_has_undergone_myocardial_revascularization_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone myocardial revascularization at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone myocardial revascularization at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone myocardial revascularization.","meaning":"Boolean indicating whether the patient has ever undergone myocardial revascularization in their history."} ;; "the patient has a history of prior myocardial revascularization"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@known
      patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "known coronary artery disease" qualifier implies history of coronary artery disease

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have a history of known coronary artery disease
(assert
(! (not patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@known)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of known coronary artery disease"

;; Exclusion: patient must NOT have a history of prior myocardial revascularization
(assert
(! (not patient_has_undergone_myocardial_revascularization_inthehistory)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of prior myocardial revascularization"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemodynamic instability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemodynamic instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hemodynamic instability.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability."} ;; "the patient has hemodynamic instability"

(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"

(declare-const patient_has_finding_of_chest_pain_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain is persistent.","when_to_set_to_false":"Set to false if the patient's current chest pain is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain is persistent.","meaning":"Boolean indicating whether the patient's current chest pain is persistent."} ;; "persistent chest pain"

(declare-const patient_has_finding_of_chest_pain_now@@despite_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain occurs despite treatment.","when_to_set_to_false":"Set to false if the patient's current chest pain does not occur despite treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain occurs despite treatment.","meaning":"Boolean indicating whether the patient's current chest pain occurs despite treatment."} ;; "chest pain despite treatment"

(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current systolic blood pressure in mm Hg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mm Hg."} ;; "systolic blood pressure less than 100 mm Hg"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable for chest pain
(assert
(! (=> patient_has_finding_of_chest_pain_now@@persistent
       patient_has_finding_of_chest_pain_now)
   :named REQ3_AUXILIARY0)) ;; "persistent chest pain"

(assert
(! (=> patient_has_finding_of_chest_pain_now@@despite_treatment
       patient_has_finding_of_chest_pain_now)
   :named REQ3_AUXILIARY1)) ;; "chest pain despite treatment"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient is excluded if (hemodynamic instability) OR (persistent chest pain despite treatment) OR (systolic blood pressure < 100 mm Hg)
(assert
(! (not (or
         patient_has_finding_of_hemodynamic_instability_now
         (and patient_has_finding_of_chest_pain_now@@persistent
              patient_has_finding_of_chest_pain_now@@despite_treatment)
         (< patient_systolic_blood_pressure_value_recorded_now_withunit_mm_hg 100)))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has hemodynamic instability) OR (the patient has persistent chest pain despite treatment) OR (the patient has systolic blood pressure less than 100 mm Hg)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has cardiac arrhythmia."} ;; "cardiac arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@associated_with_rapid_ventricular_response Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac arrhythmia is associated with rapid ventricular response.","when_to_set_to_false":"Set to false if the patient's cardiac arrhythmia is not associated with rapid ventricular response.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiac arrhythmia is associated with rapid ventricular response.","meaning":"Boolean indicating whether the patient's cardiac arrhythmia is associated with rapid ventricular response."} ;; "cardiac arrhythmia with rapid ventricular response"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@associated_with_irregular_ventricular_response Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac arrhythmia is associated with irregular ventricular response.","when_to_set_to_false":"Set to false if the patient's cardiac arrhythmia is not associated with irregular ventricular response.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiac arrhythmia is associated with irregular ventricular response.","meaning":"Boolean indicating whether the patient's cardiac arrhythmia is associated with irregular ventricular response."} ;; "cardiac arrhythmia with irregular ventricular response"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@associated_with_rapid_ventricular_response
      patient_has_finding_of_cardiac_arrhythmia_now)
:named REQ4_AUXILIARY0)) ;; "cardiac arrhythmia with rapid ventricular response"

(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@associated_with_irregular_ventricular_response
      patient_has_finding_of_cardiac_arrhythmia_now)
:named REQ4_AUXILIARY1)) ;; "cardiac arrhythmia with irregular ventricular response"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_cardiac_arrhythmia_now@@associated_with_rapid_ventricular_response)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiac arrhythmia with rapid ventricular response."

(assert
(! (not patient_has_finding_of_cardiac_arrhythmia_now@@associated_with_irregular_ventricular_response)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiac arrhythmia with irregular ventricular response."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_can_undergo_exercise_tolerance_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo an exercise tolerance test.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo an exercise tolerance test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to undergo an exercise tolerance test.","meaning":"Boolean indicating whether the patient is currently able to undergo an exercise tolerance test."} ;; "The patient is excluded if the patient is unable to perform an exercise test."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_can_undergo_exercise_tolerance_test_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to perform an exercise test."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_capable_of_providing_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of providing informed consent.","when_to_set_to_false":"Set to false if the patient is currently incapable of providing informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of providing informed consent.","meaning":"Boolean indicating whether the patient is currently capable of providing informed consent."} ;; "The patient is excluded if the patient is incapable of providing informed consent."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_capable_of_providing_informed_consent_now)
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is incapable of providing informed consent."
