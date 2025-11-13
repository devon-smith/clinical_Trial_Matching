;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is New York Heart Association class IV.","when_to_set_to_false":"Set to false if the patient's current heart failure is not New York Heart Association class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is New York Heart Association class IV.","meaning":"Boolean indicating whether the patient's current heart failure is New York Heart Association class IV."} ;; "New York Heart Association class IV heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@persists_despite_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure persists despite therapy.","when_to_set_to_false":"Set to false if the patient's current heart failure does not persist despite therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure persists despite therapy.","meaning":"Boolean indicating whether the patient's current heart failure persists despite therapy."} ;; "remains in New York Heart Association class IV heart failure despite therapy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_class_iv
      patient_has_finding_of_heart_failure_now)
:named REQ0_AUXILIARY0)) ;; "New York Heart Association class IV heart failure"

(assert
(! (=> patient_has_finding_of_heart_failure_now@@persists_despite_therapy
      patient_has_finding_of_heart_failure_now)
:named REQ0_AUXILIARY1)) ;; "heart failure persists despite therapy"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT remain in NYHA class IV heart failure despite therapy
(assert
(! (not (and patient_has_finding_of_heart_failure_now@@nyha_class_iv
             patient_has_finding_of_heart_failure_now@@persists_despite_therapy))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient remains in New York Heart Association class IV heart failure despite therapy."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patients_exercise_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if exercise is currently unsafe for the patient.","when_to_set_to_false":"Set to false if exercise is currently safe for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether exercise is currently unsafe for the patient.","meaning":"Boolean indicating whether exercise is currently unsafe for the patient."} ;; "exercise is currently unsafe for the patient"

(declare-const patients_exercise_is_abnormal_now@@safety_determined_by_cardiologist Bool) ;; {"when_to_set_to_true":"Set to true if the safety status of exercise (unsafe) is determined by the cardiologist.","when_to_set_to_false":"Set to false if the safety status of exercise (unsafe) is not determined by the cardiologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiologist determined the safety status of exercise.","meaning":"Boolean indicating whether the safety status of exercise is determined by the cardiologist."} ;; "as determined by the cardiologist"

(declare-const patients_exercise_is_abnormal_now@@unsafe_due_to_health_problems Bool) ;; {"when_to_set_to_true":"Set to true if exercise is currently unsafe for the patient due to health problems.","when_to_set_to_false":"Set to false if exercise is not currently unsafe for the patient due to health problems.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether health problems make exercise unsafe for the patient.","meaning":"Boolean indicating whether exercise is currently unsafe for the patient due to health problems."} ;; "exercise is currently unsafe for the patient due to health problems"

(declare-const patients_exercise_is_abnormal_now@@unsafe_due_to_health_problems@@safety_determined_by_cardiologist Bool) ;; {"when_to_set_to_true":"Set to true if the safety status of exercise (unsafe due to health problems) is determined by the cardiologist.","when_to_set_to_false":"Set to false if the safety status of exercise (unsafe due to health problems) is not determined by the cardiologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiologist determined the safety status of exercise due to health problems.","meaning":"Boolean indicating whether the safety status of exercise due to health problems is determined by the cardiologist."} ;; "as determined by the cardiologist for unsafe due to health problems"

(declare-const patients_exercise_is_abnormal_now@@unsafe_due_to_current_treatments Bool) ;; {"when_to_set_to_true":"Set to true if exercise is currently unsafe for the patient due to current treatments.","when_to_set_to_false":"Set to false if exercise is not currently unsafe for the patient due to current treatments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether current treatments make exercise unsafe for the patient.","meaning":"Boolean indicating whether exercise is currently unsafe for the patient due to current treatments."} ;; "exercise is currently unsafe for the patient due to current treatments"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patients_exercise_is_abnormal_now@@safety_determined_by_cardiologist
      patients_exercise_is_abnormal_now)
:named REQ1_AUXILIARY0)) ;; "as determined by the cardiologist"

(assert
(! (=> patients_exercise_is_abnormal_now@@unsafe_due_to_health_problems
      patients_exercise_is_abnormal_now)
:named REQ1_AUXILIARY1)) ;; "unsafe due to health problems"

(assert
(! (=> patients_exercise_is_abnormal_now@@unsafe_due_to_health_problems@@safety_determined_by_cardiologist
      patients_exercise_is_abnormal_now@@unsafe_due_to_health_problems)
:named REQ1_AUXILIARY2)) ;; "as determined by the cardiologist for unsafe due to health problems"

(assert
(! (=> patients_exercise_is_abnormal_now@@unsafe_due_to_current_treatments
      patients_exercise_is_abnormal_now)
:named REQ1_AUXILIARY3)) ;; "unsafe due to current treatments"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have health problems that make exercise unsafe as determined by the cardiologist
(assert
(! (not patients_exercise_is_abnormal_now@@unsafe_due_to_health_problems@@safety_determined_by_cardiologist)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has health problems that would make exercise unsafe as determined by the cardiologist."

;; Exclusion: patient must NOT have current treatments that make exercise unsafe as determined by the cardiologist
(assert
(! (not (and patients_exercise_is_abnormal_now@@unsafe_due_to_current_treatments
             patients_exercise_is_abnormal_now@@safety_determined_by_cardiologist))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current treatments that would make exercise unsafe as determined by the cardiologist."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_can_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} ;; "cannot provide informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_can_provide_informed_consent_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient cannot provide informed consent."
