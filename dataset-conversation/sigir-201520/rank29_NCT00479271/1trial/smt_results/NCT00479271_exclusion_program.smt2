;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@rated_by_clinical_dementia_rating Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dementia is rated by the clinical dementia rating scale.","when_to_set_to_false":"Set to false if the patient's dementia is not rated by the clinical dementia rating scale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dementia is rated by the clinical dementia rating scale.","meaning":"Boolean indicating whether the patient's dementia is rated by the clinical dementia rating scale."} ;; "clinical dementia rating"
(declare-const patient_has_finding_of_dementia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dementia is severe.","when_to_set_to_false":"Set to false if the patient's dementia is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dementia is severe.","meaning":"Boolean indicating whether the patient's dementia is severe."} ;; "severe dementia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_dementia_now@@rated_by_clinical_dementia_rating
      patient_has_finding_of_dementia_now)
:named REQ0_AUXILIARY0)) ;; "clinical dementia rating"

(assert
(! (=> patient_has_finding_of_dementia_now@@severe
      patient_has_finding_of_dementia_now)
:named REQ0_AUXILIARY1)) ;; "severe dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_finding_of_dementia_now@@rated_by_clinical_dementia_rating
             patient_has_finding_of_dementia_now@@severe))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical dementia rating severe dementia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_physical_health_problems_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical health problem.","when_to_set_to_false":"Set to false if the patient currently does not have a physical health problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical health problem.","meaning":"Boolean indicating whether the patient currently has a physical health problem."} ;; "physical health condition"
(declare-const patient_has_finding_of_physical_health_problems_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current physical health problem is severe.","when_to_set_to_false":"Set to false if the patient's current physical health problem is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current physical health problem is severe.","meaning":"Boolean indicating whether the patient's current physical health problem is severe."} ;; "severe"
(declare-const patient_has_finding_of_physical_health_problems_now@@is_comorbid Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current physical health problem is co-morbid (occurs alongside another condition).","when_to_set_to_false":"Set to false if the patient's current physical health problem is not co-morbid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current physical health problem is co-morbid.","meaning":"Boolean indicating whether the patient's current physical health problem is co-morbid."} ;; "co-morbid"
(declare-const patient_has_finding_of_physical_health_problems_now@@is_comorbid@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical health problem that is both co-morbid and severe.","when_to_set_to_false":"Set to false if the patient currently has a physical health problem that is not both co-morbid and severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical health problem that is both co-morbid and severe.","meaning":"Boolean indicating whether the patient currently has a physical health problem that is both co-morbid and severe."} ;; "severe co-morbid physical health condition"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definitional: severe co-morbid physical health condition means both severe and co-morbid
(assert
(! (= patient_has_finding_of_physical_health_problems_now@@is_comorbid@@is_severe
(and patient_has_finding_of_physical_health_problems_now@@is_severe
     patient_has_finding_of_physical_health_problems_now@@is_comorbid))
:named REQ1_AUXILIARY0)) ;; "severe co-morbid physical health condition."

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_physical_health_problems_now@@is_severe
       patient_has_finding_of_physical_health_problems_now)
:named REQ1_AUXILIARY1)) ;; "severe physical health problem implies physical health problem"

(assert
(! (=> patient_has_finding_of_physical_health_problems_now@@is_comorbid
       patient_has_finding_of_physical_health_problems_now)
:named REQ1_AUXILIARY2)) ;; "co-morbid physical health problem implies physical health problem"

(assert
(! (=> patient_has_finding_of_physical_health_problems_now@@is_comorbid@@is_severe
       patient_has_finding_of_physical_health_problems_now)
:named REQ1_AUXILIARY3)) ;; "severe co-morbid physical health problem implies physical health problem"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_physical_health_problems_now@@is_comorbid@@is_severe)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe co-morbid physical health condition."
