;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "the patient must be an adult greater than age 17 years"
(declare-const patient_is_initially_evaluated_in_emergency_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is initially evaluated in the emergency department at the current time.","when_to_set_to_false":"Set to false if the patient is not initially evaluated in the emergency department at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is initially evaluated in the emergency department at the current time.","meaning":"Boolean indicating whether the patient is initially evaluated in the emergency department at the current time."} // "the patient must be initially evaluated in the emergency department"
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community-acquired pneumonia."} // "with symptoms of community-acquired pneumonia"
(declare-const patient_is_planned_for_outpatient_treatment_for_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient with community-acquired pneumonia is planned to be treated as an outpatient at the current time.","when_to_set_to_false":"Set to false if the patient with community-acquired pneumonia is not planned to be treated as an outpatient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient with community-acquired pneumonia is planned to be treated as an outpatient at the current time.","meaning":"Boolean indicating whether the patient with community-acquired pneumonia is planned to be treated as an outpatient at the current time."} // "patients with community-acquired pneumonia who will be treated as outpatients"
(declare-const patient_is_admitted_to_hospital_ward_for_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient with community-acquired pneumonia is admitted to the hospital ward at the current time.","when_to_set_to_false":"Set to false if the patient with community-acquired pneumonia is not admitted to the hospital ward at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient with community-acquired pneumonia is admitted to the hospital ward at the current time.","meaning":"Boolean indicating whether the patient with community-acquired pneumonia is admitted to the hospital ward at the current time."} // "patients with community-acquired pneumonia who are admitted to the hospital ward"
(declare-const patient_is_admitted_to_hospital_intensive_care_unit_for_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient with community-acquired pneumonia is admitted to the hospital intensive care unit at the current time.","when_to_set_to_false":"Set to false if the patient with community-acquired pneumonia is not admitted to the hospital intensive care unit at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient with community-acquired pneumonia is admitted to the hospital intensive care unit at the current time.","meaning":"Boolean indicating whether the patient with community-acquired pneumonia is admitted to the hospital intensive care unit at the current time."} // "patients with community-acquired pneumonia who are admitted to the hospital intensive care unit"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be an adult greater than age 17 years
(assert
  (! (> patient_age_value_recorded_now_in_years 17)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be an adult greater than age 17 years"

;; Component 1: patient must be initially evaluated in the emergency department with symptoms of community-acquired pneumonia
(assert
  (! (and patient_is_initially_evaluated_in_emergency_department_now
          patient_has_diagnosis_of_community_acquired_pneumonia_now)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be initially evaluated in the emergency department with symptoms of community-acquired pneumonia"

;; Component 2: patient must have community-acquired pneumonia and either be treated as outpatient or admitted to hospital (ward or ICU)
(assert
  (! (and patient_has_diagnosis_of_community_acquired_pneumonia_now
          (or patient_is_planned_for_outpatient_treatment_for_community_acquired_pneumonia_now
              patient_is_admitted_to_hospital_ward_for_community_acquired_pneumonia_now
              patient_is_admitted_to_hospital_intensive_care_unit_for_community_acquired_pneumonia_now))
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "patients with community-acquired pneumonia who will be treated as outpatients and patients with community-acquired pneumonia who are admitted to the hospital (both hospital ward and hospital intensive care unit)"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has radiologic evidence of pulmonary infiltrates on chest radiography.","when_to_set_to_false":"Set to false if the patient currently does not have radiologic evidence of pulmonary infiltrates on chest radiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has radiologic evidence of pulmonary infiltrates on chest radiography.","meaning":"Boolean indicating whether the patient currently has radiologic evidence of pulmonary infiltrates on chest radiography."} // "presence of pulmonary infiltrates on chest radiography"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now@@confirmed_by_board_certified_radiologist Bool) ;; {"when_to_set_to_true":"Set to true if the radiologic evidence of pulmonary infiltrates on chest radiography is confirmed by a board certified radiologist.","when_to_set_to_false":"Set to false if the radiologic evidence of pulmonary infiltrates on chest radiography is not confirmed by a board certified radiologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the radiologic evidence of pulmonary infiltrates on chest radiography is confirmed by a board certified radiologist.","meaning":"Boolean indicating whether the radiologic evidence of pulmonary infiltrates on chest radiography is confirmed by a board certified radiologist."} // "must be confirmed by a board certified radiologist for inclusion in the study"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} // "cough"
(declare-const patient_has_finding_of_cough_now@@new_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough and the cough is of new onset.","when_to_set_to_false":"Set to false if the patient currently has cough but it is not of new onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cough is of new onset.","meaning":"Boolean indicating whether the patient's current cough is of new onset."} // "new onset of cough"
(declare-const patient_is_exposed_to_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently producing sputum.","when_to_set_to_false":"Set to false if the patient is currently not producing sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently producing sputum.","meaning":"Boolean indicating whether the patient is currently producing sputum."} // "sputum"
(declare-const patient_is_exposed_to_sputum_now@@productive Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently producing sputum and the sputum is productive.","when_to_set_to_false":"Set to false if the patient is currently producing sputum but it is not productive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current sputum is productive.","meaning":"Boolean indicating whether the patient's current sputum is productive."} // "productive sputum"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shortness of breath (dyspnea).","when_to_set_to_false":"Set to false if the patient currently does not have shortness of breath (dyspnea).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has shortness of breath (dyspnea).","meaning":"Boolean indicating whether the patient currently has shortness of breath (dyspnea)."} // "shortness of breath"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} // "chest pain"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever greater than 38°C"
(declare-const patient_has_finding_of_abnormal_chest_sounds_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal chest auscultation findings.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal chest auscultation findings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal chest auscultation findings.","meaning":"Boolean indicating whether the patient currently has abnormal chest auscultation findings."} // "abnormal chest auscultation"
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current white blood cell count in cells per milliliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current white blood cell count in cells per milliliter."} // "white blood cell count greater than 12,000 cells per milliliter"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for radiologic infiltrate implies stem variable
(assert
  (! (=> patient_has_finding_of_radiologic_infiltrate_of_lung_now@@confirmed_by_board_certified_radiologist
         patient_has_finding_of_radiologic_infiltrate_of_lung_now)
     :named REQ1_AUXILIARY0)) ;; "must be confirmed by a board certified radiologist for inclusion in the study"

;; Qualifier variable for new onset cough implies cough
(assert
  (! (=> patient_has_finding_of_cough_now@@new_onset
         patient_has_finding_of_cough_now)
     :named REQ1_AUXILIARY1)) ;; "new onset of cough"

;; Qualifier variable for productive sputum implies sputum
(assert
  (! (=> patient_is_exposed_to_sputum_now@@productive
         patient_is_exposed_to_sputum_now)
     :named REQ1_AUXILIARY2)) ;; "productive sputum"

;; Fever greater than 38°C is a subcondition of fever
(define-fun patient_has_finding_of_fever_greater_than_38C_now () Bool
  (and patient_has_finding_of_fever_now
       true)) ;; "fever greater than 38°C" (assume fever variable is set only if >38°C, otherwise, further numeric variable would be needed)

;; White blood cell count > 12,000 cells/mL
(define-fun patient_has_finding_of_leukocytosis_now () Bool
  (> patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_milliliter 12000.0)) ;; "white blood cell count greater than 12,000 cells per milliliter"

;; Count the number of present findings among the listed symptoms
(define-fun req1_symptom_count () Int
  (+ (ite patient_has_finding_of_cough_now@@new_onset 1 0)
     (ite patient_is_exposed_to_sputum_now@@productive 1 0)
     (ite patient_has_finding_of_dyspnea_now 1 0)
     (ite patient_has_finding_of_chest_pain_now 1 0)
     (ite patient_has_finding_of_fever_greater_than_38C_now 1 0)
     (ite patient_has_finding_of_abnormal_chest_sounds_now 1 0)
     (ite patient_has_finding_of_leukocytosis_now 1 0))) ;; "at least 2 of the following: ..."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Pulmonary infiltrates on chest radiography confirmed by board certified radiologist
(assert
  (! patient_has_finding_of_radiologic_infiltrate_of_lung_now@@confirmed_by_board_certified_radiologist
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "presence of pulmonary infiltrates on chest radiography ... must be confirmed by a board certified radiologist"

;; Component 1: At least 2 of the listed symptoms/findings
(assert
  (! (>= req1_symptom_count 2)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "at least 2 of the following: new onset of cough, productive sputum, shortness of breath, chest pain, fever greater than 38°C, abnormal chest auscultation, white blood cell count greater than 12,000 cells per milliliter"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} // "the patient must be able to provide informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_able_to_provide_informed_consent_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to provide informed consent"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_read_informed_consent_document Bool) ;; {"when_to_set_to_true":"Set to true if the patient has read the informed consent document.","when_to_set_to_false":"Set to false if the patient has not read the informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has read the informed consent document.","meaning":"Boolean indicating whether the patient has read the informed consent document."} // "the patient must have read ... the informed consent document"
(declare-const patient_has_signed_informed_consent_document Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed the informed consent document.","when_to_set_to_false":"Set to false if the patient has not signed the informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed the informed consent document.","meaning":"Boolean indicating whether the patient has signed the informed consent document."} // "the patient must have ... signed ... the informed consent document"
(declare-const patient_has_dated_informed_consent_document Bool) ;; {"when_to_set_to_true":"Set to true if the patient has dated the informed consent document.","when_to_set_to_false":"Set to false if the patient has not dated the informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has dated the informed consent document.","meaning":"Boolean indicating whether the patient has dated the informed consent document."} // "the patient must have ... dated the informed consent document"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_has_read_informed_consent_document
          patient_has_signed_informed_consent_document
          patient_has_dated_informed_consent_document)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have read, signed, and dated the informed consent document."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_available_for_follow_up_for_planned_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is available for follow-up for the entire planned duration of the study.","when_to_set_to_false":"Set to false if the patient is not available for follow-up for the entire planned duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is available for follow-up for the entire planned duration of the study.","meaning":"Boolean indicating whether the patient is available for follow-up for the entire planned duration of the study."} // "the patient must be available for follow-up for the planned duration of the study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_available_for_follow_up_for_planned_study_duration
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be available for follow-up for the planned duration of the study"
