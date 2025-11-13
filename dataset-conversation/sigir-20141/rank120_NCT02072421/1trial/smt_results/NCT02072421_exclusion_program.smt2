;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cardiovascular_stress_test_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal cardiovascular stress test finding.","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal cardiovascular stress test finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal cardiovascular stress test finding.","meaning":"Boolean indicating whether the patient currently has an abnormal cardiovascular stress test finding."} ;; "abnormal stress test"
(declare-const patient_has_finding_of_cardiovascular_stress_test_abnormal_now@@present_in_target_lesion_with_stenosis_percentage_gte_70_percent_that_is_treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal cardiovascular stress test finding and this finding is present in a target lesion with stenosis percentage ≥ 70% that is treated.","when_to_set_to_false":"Set to false if the patient currently has an abnormal cardiovascular stress test finding but it is not present in a target lesion with stenosis percentage ≥ 70% that is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal cardiovascular stress test finding is present in a target lesion with stenosis percentage ≥ 70% that is treated.","meaning":"Boolean indicating whether the patient currently has an abnormal cardiovascular stress test finding present in a target lesion with stenosis percentage ≥ 70% that is treated."} ;; "abnormal stress test present in target lesion with stenosis percentage ≥ 70% that is treated"
(declare-const target_lesion_has_abnormal_stress_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the target lesion currently has an abnormal stress test finding.","when_to_set_to_false":"Set to false if the target lesion currently does not have an abnormal stress test finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the target lesion currently has an abnormal stress test finding.","meaning":"Boolean indicating whether the target lesion currently has an abnormal stress test finding."} ;; "target lesion has abnormal stress test"
(declare-const target_lesion_has_stenosis_percentage_value_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the percentage of stenosis in the target lesion at the current time, measured in percent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the percentage of stenosis in the target lesion is at the current time.","meaning":"Numeric value indicating the percentage of stenosis in the target lesion at the current time, measured in percent."} ;; "target lesion stenosis percentage"
(declare-const target_lesion_has_stenosis_percentage_value_now_withunit_percent@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the target lesion is treated.","when_to_set_to_false":"Set to false if the target lesion is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the target lesion is treated.","meaning":"Boolean indicating that the target lesion is treated."} ;; "target lesion is treated"
(declare-const target_lesion_has_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the target lesion currently presents with symptoms.","when_to_set_to_false":"Set to false if the target lesion currently does not present with symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the target lesion currently presents with symptoms.","meaning":"Boolean indicating whether the target lesion currently presents with symptoms."} ;; "target lesion has symptoms"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cardiovascular_stress_test_abnormal_now@@present_in_target_lesion_with_stenosis_percentage_gte_70_percent_that_is_treated
     patient_has_finding_of_cardiovascular_stress_test_abnormal_now)
:named REQ0_AUXILIARY0)) ;; "abnormal stress test present in target lesion with stenosis percentage ≥ 70% that is treated"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> target_lesion_has_stenosis_percentage_value_now_withunit_percent@@treated
     (>= target_lesion_has_stenosis_percentage_value_now_withunit_percent 0))
:named REQ0_AUXILIARY1)) ;; "target lesion is treated implies target lesion stenosis percentage is defined"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient is excluded if ANY exclusion criterion is met, EXCEPT if the ONLY criterion met is a target lesion with stenosis percentage ≥ 70% that is treated (with symptoms OR without symptoms OR with an abnormal stress test), in which case the patient is NOT excluded.
;; This requires a special logic: patient is eligible if EITHER (1) no exclusion criteria are met, OR (2) the ONLY exclusion criterion met is the target lesion with stenosis ≥ 70% that is treated (with symptoms OR without symptoms OR with abnormal stress test).

;; For this encoding, we introduce a Boolean variable for "any_other_exclusion_criterion_met" (not provided, so we declare it here).
(declare-const any_other_exclusion_criterion_met Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets any exclusion criterion other than the target lesion with stenosis percentage ≥ 70% that is treated (with symptoms OR without symptoms OR with abnormal stress test).","when_to_set_to_false":"Set to false if the patient does not meet any exclusion criterion other than the target lesion with stenosis percentage ≥ 70% that is treated (with symptoms OR without symptoms OR with abnormal stress test).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets any other exclusion criterion.","meaning":"Boolean indicating whether the patient meets any exclusion criterion other than the target lesion with stenosis percentage ≥ 70% that is treated (with symptoms OR without symptoms OR with abnormal stress test)."}

;; Define the "exception" case: target lesion with stenosis ≥ 70% that is treated (with symptoms OR without symptoms OR with abnormal stress test)
(declare-const target_lesion_exception_criterion_met Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets the exception criterion: target lesion with stenosis percentage ≥ 70% that is treated (with symptoms OR without symptoms OR with abnormal stress test).","when_to_set_to_false":"Set to false if the patient does not meet the exception criterion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets the exception criterion.","meaning":"Boolean indicating whether the patient meets the exception criterion: target lesion with stenosis percentage ≥ 70% that is treated (with symptoms OR without symptoms OR with abnormal stress test)."}

;; Definition of the exception criterion
(assert
(! (= target_lesion_exception_criterion_met
      (and
        (>= target_lesion_has_stenosis_percentage_value_now_withunit_percent 70)
        target_lesion_has_stenosis_percentage_value_now_withunit_percent@@treated
        (or target_lesion_has_symptoms_now
            (not target_lesion_has_symptoms_now)
            target_lesion_has_abnormal_stress_test_now)))
:named REQ0_AUXILIARY2)) ;; "exception criterion: target lesion with stenosis percentage ≥ 70% that is treated (with symptoms OR without symptoms OR with abnormal stress test)"

;; Main constraint assertion: patient is eligible if EITHER (no exclusion criteria are met) OR (the ONLY criterion met is the exception)
(assert
(! (or
      (not any_other_exclusion_criterion_met)
      (and target_lesion_exception_criterion_met
           (not any_other_exclusion_criterion_met)))
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient meets at least one exclusion criterion listed above OR below, EXCEPT if the ONLY criterion met is a target lesion with stenosis percentage ≥ 70% that is treated (with symptoms OR without symptoms OR with an abnormal stress test), in which case the patient is NOT excluded."
