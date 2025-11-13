;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_mild_cognitive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of mild cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of mild cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mild cognitive impairment.","meaning":"Boolean indicating whether the patient currently has mild cognitive impairment."} // "mild cognitive impairment"
(declare-const patient_has_finding_of_mild_cognitive_disorder_now@@diagnosed_according_to_peterson_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's mild cognitive impairment diagnosis is made according to the Peterson diagnostic criteria.","when_to_set_to_false":"Set to false if the patient's mild cognitive impairment diagnosis is not made according to the Peterson diagnostic criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made according to the Peterson diagnostic criteria.","meaning":"Boolean indicating whether the patient's mild cognitive impairment diagnosis is made according to the Peterson diagnostic criteria."} // "Peterson diagnostic criteria of mild cognitive impairment"
(declare-const patient_has_finding_of_memory_complaints_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has memory complaints.","when_to_set_to_false":"Set to false if the patient currently does not have memory complaints.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has memory complaints.","meaning":"Boolean indicating whether the patient currently has memory complaints."} // "memory complaints"
(declare-const patient_has_finding_of_memory_complaints_now@@preferably_confirmed_by_informant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current memory complaints are preferably confirmed by an informant.","when_to_set_to_false":"Set to false if the patient's current memory complaints are not preferably confirmed by an informant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current memory complaints are preferably confirmed by an informant.","meaning":"Boolean indicating whether the patient's current memory complaints are preferably confirmed by an informant."} // "preferably confirmed by an informant"
(declare-const patient_has_finding_of_memory_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of memory impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of memory impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has memory impairment.","meaning":"Boolean indicating whether the patient currently has memory impairment."} // "memory impairment"
(declare-const patient_has_finding_of_memory_impairment_now@@defined_according_to_age_and_education Bool) ;; {"when_to_set_to_true":"Set to true if the patient's memory impairment is defined according to age and education.","when_to_set_to_false":"Set to false if the patient's memory impairment is not defined according to age and education.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the definition is according to age and education.","meaning":"Boolean indicating whether the patient's memory impairment is defined according to age and education."} // "memory impairment according to age and education"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "memory impairment according to age"
(declare-const patient_has_finding_of_preserved_general_cognitive_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has preserved general cognitive function.","when_to_set_to_false":"Set to false if the patient currently does not have preserved general cognitive function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has preserved general cognitive function.","meaning":"Boolean indicating whether the patient currently has preserved general cognitive function."} // "preserved general cognitive function"
(declare-const patient_has_finding_of_intact_activities_of_daily_living_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intact activities of daily living.","when_to_set_to_false":"Set to false if the patient currently does not have intact activities of daily living.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intact activities of daily living.","meaning":"Boolean indicating whether the patient currently has intact activities of daily living."} // "intact activities of daily living"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} // "absence of dementia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable (memory complaints)
(assert
  (! (=> patient_has_finding_of_memory_complaints_now@@preferably_confirmed_by_informant
         patient_has_finding_of_memory_complaints_now)
     :named REQ0_AUXILIARY0)) ;; "preferably confirmed by an informant"

;; Qualifier variable implies stem variable (memory impairment according to age and education)
(assert
  (! (=> patient_has_finding_of_memory_impairment_now@@defined_according_to_age_and_education
         patient_has_finding_of_memory_impairment_now)
     :named REQ0_AUXILIARY1)) ;; "memory impairment according to age and education"

;; Qualifier variable implies stem variable (mild cognitive impairment diagnosed according to Peterson criteria)
(assert
  (! (=> patient_has_finding_of_mild_cognitive_disorder_now@@diagnosed_according_to_peterson_criteria
         patient_has_finding_of_mild_cognitive_disorder_now)
     :named REQ0_AUXILIARY2)) ;; "Peterson diagnostic criteria of mild cognitive impairment"

;; Peterson criteria (exhaustive subcategories) define mild cognitive impairment diagnosis according to Peterson
(assert
  (! (= patient_has_finding_of_mild_cognitive_disorder_now@@diagnosed_according_to_peterson_criteria
        (and patient_has_finding_of_memory_complaints_now
             patient_has_finding_of_memory_impairment_now@@defined_according_to_age_and_education
             patient_has_finding_of_preserved_general_cognitive_function_now
             patient_has_finding_of_intact_activities_of_daily_living_now
             (not patient_has_finding_of_dementia_now)))
     :named REQ0_AUXILIARY3)) ;; "Peterson diagnostic criteria of mild cognitive impairment (with exhaustive subcategories ...)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: memory complaints (preferably confirmed by an informant)
(assert
  (! patient_has_finding_of_memory_complaints_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "memory complaints (preferably confirmed by an informant)"

;; Component 1: memory impairment according to age and education
(assert
  (! patient_has_finding_of_memory_impairment_now@@defined_according_to_age_and_education
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "memory impairment according to age and education"

;; Component 2: preserved general cognitive function
(assert
  (! patient_has_finding_of_preserved_general_cognitive_function_now
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "preserved general cognitive function"

;; Component 3: intact activities of daily living
(assert
  (! patient_has_finding_of_intact_activities_of_daily_living_now
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "intact activities of daily living"

;; Component 4: absence of dementia
(assert
  (! (not patient_has_finding_of_dementia_now)
     :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "absence of dementia"
