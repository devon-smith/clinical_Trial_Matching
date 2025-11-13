;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute ST segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ST elevation myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute non-ST segment elevation myocardial infarction (NSTEMI).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute non-ST segment elevation myocardial infarction (NSTEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute non-ST segment elevation myocardial infarction (NSTEMI).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute non-ST segment elevation myocardial infarction (NSTEMI)."} ;; "non-ST elevation myocardial infarction"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-ST elevation myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary arteriosclerosis (coronary artery disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coronary arteriosclerosis (coronary artery disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary arteriosclerosis (coronary artery disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary arteriosclerosis (coronary artery disease)."} ;; "coronary artery disease"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of coronary arteriosclerosis (coronary artery disease) is known/documented.","when_to_set_to_false":"Set to false if the patient's diagnosis of coronary arteriosclerosis (coronary artery disease) is not known/documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of coronary arteriosclerosis (coronary artery disease) is known.","meaning":"Boolean indicating whether the patient's diagnosis of coronary arteriosclerosis (coronary artery disease) is known/documented."} ;; "known coronary artery disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_now@@known
       patient_has_diagnosis_of_coronary_arteriosclerosis_now)
   :named REQ2_AUXILIARY0)) ;; "known coronary artery disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_coronary_arteriosclerosis_now@@known)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known coronary artery disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum creatinine concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no current measurement of serum creatinine concentration in milligrams per deciliter is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine concentration in milligrams per deciliter."} ;; "serum creatinine concentration greater than 1.5 milligrams per deciliter."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 1.5))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum creatinine concentration greater than 1.5 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has atrial fibrillation."} ;; "atrial fibrillation"
(declare-const patient_has_finding_of_irregular_heart_beat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has irregular heart rhythm.","when_to_set_to_false":"Set to false if the patient currently does not have irregular heart rhythm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has irregular heart rhythm.","meaning":"Boolean indicating whether the patient currently has irregular heart rhythm."} ;; "irregular heart rhythm"
(declare-const patient_has_finding_of_irregular_heart_beat_now@@marked Bool) ;; {"when_to_set_to_true":"Set to true if the patient's irregular heart rhythm is marked (pronounced/severe).","when_to_set_to_false":"Set to false if the patient's irregular heart rhythm is not marked (not pronounced/severe).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the irregular heart rhythm is marked.","meaning":"Boolean indicating whether the patient's irregular heart rhythm is marked."} ;; "marked irregular heart rhythm"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_irregular_heart_beat_now@@marked
       patient_has_finding_of_irregular_heart_beat_now)
   :named REQ4_AUXILIARY0)) ;; "marked irregular heart rhythm" implies "irregular heart rhythm"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have atrial fibrillation
(assert
(! (not patient_has_finding_of_atrial_fibrillation_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrial fibrillation."

;; Exclusion: patient must NOT have marked irregular heart rhythm
(assert
(! (not patient_has_finding_of_irregular_heart_beat_now@@marked)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has marked irregular heart rhythm."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_heart_rate_value_recorded_now_withunit_bpm Real) ;; {"when_to_set_to_value":"Set to the measured heart rate value in bpm if a measurement is available for the patient now.","when_to_set_to_null":"Set to null if no heart rate measurement is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute (bpm)."} ;; "heart rate"
(declare-const patient_heart_rate_value_recorded_now_withunit_bpm@@cannot_be_controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart rate cannot be controlled (i.e., is refractory to medical or procedural intervention).","when_to_set_to_false":"Set to false if the patient's current heart rate can be controlled (i.e., is responsive to medical or procedural intervention).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart rate can be controlled.","meaning":"Boolean indicating whether the patient's current heart rate cannot be controlled."} ;; "heart rate that cannot be controlled"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_heart_rate_value_recorded_now_withunit_bpm@@cannot_be_controlled)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a heart rate that cannot be controlled."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_allergy_to_iodinated_contrast_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to iodinated contrast media.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to iodinated contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to iodinated contrast media.","meaning":"Boolean indicating whether the patient currently has an allergy to iodinated contrast media."} ;; "allergies to iodinated contrast agents"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_allergy_to_iodinated_contrast_media_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergies to iodinated contrast agents."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as confirmed by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as confirmed by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_unable_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to give informed consent.","meaning":"Boolean indicating whether the patient is currently unable to give informed consent."} ;; "The patient is excluded if the patient is unable to give informed consent."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_unable_to_give_informed_consent_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to give informed consent."
