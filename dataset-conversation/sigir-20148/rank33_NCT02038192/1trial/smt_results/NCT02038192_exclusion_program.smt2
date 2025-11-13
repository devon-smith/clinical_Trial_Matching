;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "adult"
(declare-const patient_is_non_autonomous_adult_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a non-autonomous adult.","when_to_set_to_false":"Set to false if the patient is currently not a non-autonomous adult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a non-autonomous adult.","meaning":"Boolean indicating whether the patient is currently a non-autonomous adult."} ;; "non-autonomous adult"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_non_autonomous_adult_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a non-autonomous adult."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cognitive impairment.","meaning":"Boolean indicating whether the patient currently has cognitive impairment."} ;; "cognitive impairment"
(declare-const patient_has_finding_of_impaired_cognition_now@@determined_by_registered_nurse_researcher Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cognitive impairment is determined by the registered nurse researcher.","when_to_set_to_false":"Set to false if the patient's cognitive impairment is not determined by the registered nurse researcher.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the registered nurse researcher determined the patient's cognitive impairment.","meaning":"Boolean indicating whether the patient's cognitive impairment is determined by the registered nurse researcher."} ;; "as determined by the registered nurse researcher"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_impaired_cognition_now@@determined_by_registered_nurse_researcher
       patient_has_finding_of_impaired_cognition_now)
   :named REQ1_AUXILIARY0)) ;; "as determined by the registered nurse researcher"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_impaired_cognition_now@@determined_by_registered_nurse_researcher)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive impairment as determined by the registered nurse researcher."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_unable_to_participate_in_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to participate in the study.","when_to_set_to_false":"Set to false if the patient is currently able to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to participate in the study.","meaning":"Boolean indicating whether the patient is currently unable to participate in the study."} ;; "unable to participate"
(declare-const patient_is_unable_to_participate_in_study_now@@in_opinion_of_registered_nurse_researcher Bool) ;; {"when_to_set_to_true":"Set to true if the determination that the patient is unable to participate in the study is made in the opinion of the registered nurse researcher.","when_to_set_to_false":"Set to false if the determination that the patient is unable to participate in the study is not made in the opinion of the registered nurse researcher.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the determination is made in the opinion of the registered nurse researcher.","meaning":"Boolean indicating whether the determination that the patient is unable to participate in the study is made in the opinion of the registered nurse researcher."} ;; "in the opinion of the registered nurse researcher"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_unable_to_participate_in_study_now@@in_opinion_of_registered_nurse_researcher
      patient_is_unable_to_participate_in_study_now)
:named REQ2_AUXILIARY0)) ;; "in the opinion of the registered nurse researcher"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_unable_to_participate_in_study_now@@in_opinion_of_registered_nurse_researcher)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to participate, in the opinion of the registered nurse researcher."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_non_english_speaking_individual Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a non-English speaking individual.","when_to_set_to_false":"Set to false if the patient is not a non-English speaking individual (i.e., the patient is English speaking).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a non-English speaking individual.","meaning":"Boolean indicating whether the patient is a non-English speaking individual."} ;; "The patient is excluded if the patient is a non-English speaking individual."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_non_english_speaking_individual)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a non-English speaking individual."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_family_member_with_dementia_in_long_term_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a family member with dementia who is in long term care.","when_to_set_to_false":"Set to false if the patient currently does not have a family member with dementia who is in long term care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a family member with dementia who is in long term care.","meaning":"Boolean indicating whether the patient currently has a family member with dementia who is in long term care."} ;; "family member with dementia in long term care"
(declare-const patient_has_friend_with_dementia_in_long_term_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a friend with dementia who is in long term care.","when_to_set_to_false":"Set to false if the patient currently does not have a friend with dementia who is in long term care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a friend with dementia who is in long term care.","meaning":"Boolean indicating whether the patient currently has a friend with dementia who is in long term care."} ;; "friend with dementia in long term care"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT satisfy the exclusion criterion (i.e., must have at least one: family member with dementia in long term care OR friend with dementia in long term care)
(assert
(! (not (or (not patient_has_family_member_with_dementia_in_long_term_care_now)
            (not patient_has_friend_with_dementia_in_long_term_care_now)))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient does not have a family member with dementia in long term care or does not have a friend with dementia in long term care."
