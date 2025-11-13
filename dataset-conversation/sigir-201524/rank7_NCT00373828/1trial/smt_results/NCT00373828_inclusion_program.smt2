;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const acute_chest_pain_episode_duration_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days corresponding to the duration of the patient's current acute episode of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the duration in days of the patient's current acute episode of chest pain is.","meaning":"Numeric value indicating the duration in days of the patient's current acute episode of chest pain."}  ;; "have an acute episode of chest pain of duration < 7 days"
(declare-const patient_has_finding_of_acute_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute episode of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have an acute episode of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute episode of chest pain.","meaning":"Boolean indicating whether the patient currently has an acute episode of chest pain."}  ;; "acute episode of chest pain"
(declare-const patient_has_finding_of_acute_chest_pain_now@@primary_reason_for_admission_to_chest_pain_clinic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute episode of chest pain is the primary reason for admission to a chest pain clinic.","when_to_set_to_false":"Set to false if the patient's acute episode of chest pain is not the primary reason for admission to a chest pain clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute episode of chest pain is the primary reason for admission to a chest pain clinic.","meaning":"Boolean indicating whether the patient's acute episode of chest pain is the primary reason for admission to a chest pain clinic."}  ;; "acute episode of chest pain as the primary reason for admission to a chest pain clinic"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."}  ;; "chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@primary_reason_for_admission_to_chest_pain_clinic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest pain is the primary reason for admission to a chest pain clinic.","when_to_set_to_false":"Set to false if the patient's chest pain is not the primary reason for admission to a chest pain clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chest pain is the primary reason for admission to a chest pain clinic.","meaning":"Boolean indicating whether the patient's chest pain is the primary reason for admission to a chest pain clinic."}  ;; "chest pain as the primary reason for admission to a chest pain clinic"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_acute_chest_pain_now@@primary_reason_for_admission_to_chest_pain_clinic
         patient_has_finding_of_acute_chest_pain_now)
     :named REQ0_AUXILIARY0)) ;; "acute episode of chest pain as the primary reason for admission to a chest pain clinic"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_chest_pain_now@@primary_reason_for_admission_to_chest_pain_clinic
         patient_has_finding_of_chest_pain_now)
     :named REQ0_AUXILIARY1)) ;; "chest pain as the primary reason for admission to a chest pain clinic"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: acute episode of chest pain of duration < 7 days
(assert
  (! (and patient_has_finding_of_acute_chest_pain_now
          (< acute_chest_pain_episode_duration_value_recorded_now_in_days 7.0))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have an acute episode of chest pain of duration < 7 days"

;; Component 1: acute episode of chest pain as the primary reason for admission to a chest pain clinic
(assert
  (! patient_has_finding_of_acute_chest_pain_now@@primary_reason_for_admission_to_chest_pain_clinic
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have acute episode of chest pain as the primary reason for admission to a chest pain clinic"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_been_admitted_to_chest_pain_clinic_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been admitted to a chest pain clinic.","when_to_set_to_false":"Set to false if the patient has never been admitted to a chest pain clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been admitted to a chest pain clinic.","meaning":"Boolean indicating whether the patient has ever been admitted to a chest pain clinic."} ;; "have been admitted to a chest pain clinic"
(declare-const patient_has_suspicion_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected of having acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient is currently not suspected of having acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected of having acute myocardial infarction.","meaning":"Boolean indicating whether the patient is currently suspected of having acute myocardial infarction."} ;; "have been suspected of acute coronary infarction"
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute myocardial infarction (i.e., negative diagnosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute myocardial infarction."} ;; "have a negative diagnosis of acute coronary infarction"
(declare-const patient_has_coronary_enzyme_levels_value_recorded_now_withunit_microkat_per_liter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's coronary enzyme levels recorded now, in microkatals per liter.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's coronary enzyme levels recorded now, in microkatals per liter."} ;; "normal coronary enzyme levels"
(declare-const patient_has_undergone_electrocardiographic_procedure_now_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an electrocardiogram now and the outcome is normal.","when_to_set_to_false":"Set to false if the patient has undergone an electrocardiogram now and the outcome is not normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electrocardiogram now and the outcome is normal.","meaning":"Boolean indicating whether the patient has undergone an electrocardiogram now and the outcome is normal."} ;; "normal electrocardiogram"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; None required for this requirement, as all relationships are direct and explicit.

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must have been admitted to a chest pain clinic
(assert
  (! patient_has_been_admitted_to_chest_pain_clinic_ever
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have been admitted to a chest pain clinic"

;; Component 1: Patient must have been suspected of acute coronary infarction
(assert
  (! patient_has_suspicion_of_acute_myocardial_infarction_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have been suspected of acute coronary infarction"

;; Component 2: Patient must have a negative diagnosis of acute coronary infarction confirmed by (normal coronary enzyme levels AND normal electrocardiogram)
(assert
  (! (and (not patient_has_diagnosis_of_acute_myocardial_infarction_now)
          (<= patient_has_coronary_enzyme_levels_value_recorded_now_withunit_microkat_per_liter 2.0) ;; "normal coronary enzyme levels" (threshold assumed as ≤2.0 μkat/L; adjust if protocol specifies otherwise)
          patient_has_undergone_electrocardiographic_procedure_now_outcome_is_normal)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have a negative diagnosis of acute coronary infarction confirmed by (normal coronary enzyme levels AND normal electrocardiogram)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain.","when_to_set_to_false":"Set to false if the patient currently does not have pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain.","meaning":"Boolean indicating whether the patient currently has pain."}  ;; "pain"
(declare-const patient_has_finding_of_pain_now@@arising_from_neck Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pain arises from the neck.","when_to_set_to_false":"Set to false if the patient's current pain does not arise from the neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pain arises from the neck.","meaning":"Boolean indicating whether the patient's current pain arises from the neck."}  ;; "pain arising from the neck"
(declare-const patient_has_finding_of_pain_now@@arising_from_thorax Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pain arises from the thorax.","when_to_set_to_false":"Set to false if the patient's current pain does not arise from the thorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pain arises from the thorax.","meaning":"Boolean indicating whether the patient's current pain arises from the thorax."}  ;; "pain arising from the thorax"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the stem variable (pain must be present if pain from neck or thorax is present)
(assert
  (! (=> patient_has_finding_of_pain_now@@arising_from_neck
         patient_has_finding_of_pain_now)
     :named REQ2_AUXILIARY0)) ;; "pain arising from the neck" implies "pain"

(assert
  (! (=> patient_has_finding_of_pain_now@@arising_from_thorax
         patient_has_finding_of_pain_now)
     :named REQ2_AUXILIARY1)) ;; "pain arising from the thorax" implies "pain"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must (have pain arising from the thorax) OR (have pain arising from the neck).
(assert
  (! (or patient_has_finding_of_pain_now@@arising_from_thorax
         patient_has_finding_of_pain_now@@arising_from_neck)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have pain arising from the thorax) OR (have pain arising from the neck)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_able_to_read_danish_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to read Danish.","when_to_set_to_false":"Set to false if the patient is currently not able to read Danish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to read Danish.","meaning":"Boolean indicating whether the patient is currently able to read Danish."}  ;; "the patient must be able to read Danish"
(declare-const patient_is_able_to_understand_danish_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand Danish.","when_to_set_to_false":"Set to false if the patient is currently not able to understand Danish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand Danish.","meaning":"Boolean indicating whether the patient is currently able to understand Danish."}  ;; "the patient must be able to understand Danish"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_able_to_read_danish_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to read Danish."
(assert
  (! patient_is_able_to_understand_danish_now
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to understand Danish."
