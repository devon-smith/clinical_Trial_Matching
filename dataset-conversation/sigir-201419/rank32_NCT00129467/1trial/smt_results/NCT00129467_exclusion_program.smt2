;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "the patient has dementia"

(declare-const patient_has_finding_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of delirium.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has delirium.","meaning":"Boolean indicating whether the patient currently has delirium."} ;; "the patient has delirium"

(declare-const patient_has_finding_of_delirium_now@@determined_by_short_portable_mental_status_questionnaire Bool) ;; {"when_to_set_to_true":"Set to true if the patient's delirium is determined by a Short Portable Mental Status Questionnaire.","when_to_set_to_false":"Set to false if the patient's delirium is not determined by a Short Portable Mental Status Questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's delirium is determined by a Short Portable Mental Status Questionnaire.","meaning":"Boolean indicating whether the patient's delirium is determined by a Short Portable Mental Status Questionnaire."} ;; "delirium as determined by a Short Portable Mental Status Questionnaire"

(declare-const short_portable_mental_status_questionnaire_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current Short Portable Mental Status Questionnaire score, in points, if available.","when_to_set_to_null":"Set to null if the score is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current Short Portable Mental Status Questionnaire score, in points."} ;; "Short Portable Mental Status Questionnaire score less than seven"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable for delirium
(assert
(! (=> patient_has_finding_of_delirium_now@@determined_by_short_portable_mental_status_questionnaire
       patient_has_finding_of_delirium_now)
   :named REQ0_AUXILIARY0)) ;; "delirium as determined by a Short Portable Mental Status Questionnaire"

;; Delirium as determined by SPMQ score < 7
(assert
(! (= patient_has_finding_of_delirium_now@@determined_by_short_portable_mental_status_questionnaire
      (and patient_has_finding_of_delirium_now
           (< short_portable_mental_status_questionnaire_score_value_recorded_now_withunit_points 7)))
   :named REQ0_AUXILIARY1)) ;; "delirium as determined by a Short Portable Mental Status Questionnaire score less than seven"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_dementia_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia."

(assert
(! (not patient_has_finding_of_delirium_now@@determined_by_short_portable_mental_status_questionnaire)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has delirium as determined by a Short Portable Mental Status Questionnaire score less than seven."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of delirium.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of delirium.","meaning":"Boolean indicating whether the patient currently has a diagnosis of delirium."} ;; "diagnosis of delirium"
(declare-const patient_has_diagnosis_of_delirium_now@@determined_by_confusional_assessment_method Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of delirium is determined by the Confusional Assessment Method.","when_to_set_to_false":"Set to false if the patient's current diagnosis of delirium is not determined by the Confusional Assessment Method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of delirium was determined by the Confusional Assessment Method.","meaning":"Boolean indicating whether the patient's current diagnosis of delirium is determined by the Confusional Assessment Method."} ;; "diagnosis of delirium as determined by the Confusional Assessment Method"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_delirium_now@@determined_by_confusional_assessment_method
       patient_has_diagnosis_of_delirium_now)
   :named REQ1_AUXILIARY0)) ;; "diagnosis of delirium as determined by the Confusional Assessment Method"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_delirium_now@@determined_by_confusional_assessment_method)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of delirium as determined by the Confusional Assessment Method."
