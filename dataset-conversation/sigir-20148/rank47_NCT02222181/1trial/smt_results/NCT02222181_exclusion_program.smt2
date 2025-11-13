;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_drug_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone drug therapy (pharmacotherapy) now.","when_to_set_to_false":"Set to false if the patient has not undergone drug therapy (pharmacotherapy) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone drug therapy (pharmacotherapy) now.","meaning":"Boolean indicating whether the patient has undergone drug therapy (pharmacotherapy) now."} ;; "pharmacotherapy"
(declare-const patient_has_undergone_drug_therapy_now@@context_fold_over_pharmacotherapy_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone drug therapy (pharmacotherapy) now in the context of fold over pharmacotherapy follow-up.","when_to_set_to_false":"Set to false if the patient has undergone drug therapy (pharmacotherapy) now but not in the context of fold over pharmacotherapy follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the context of fold over pharmacotherapy follow-up applies to the patient's drug therapy (pharmacotherapy) now.","meaning":"Boolean indicating whether the patient's drug therapy (pharmacotherapy) now occurred in the context of fold over pharmacotherapy follow-up."} ;; "fold over pharmacotherapy follow-up"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_drug_therapy_now@@context_fold_over_pharmacotherapy_follow_up
      patient_has_undergone_drug_therapy_now)
   :named REQ0_AUXILIARY0)) ;; "pharmacotherapy" and "fold over pharmacotherapy follow-up"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_drug_therapy_now@@context_fold_over_pharmacotherapy_follow_up)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fold over pharmacotherapy follow-up."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_institutionalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently institutionalized (e.g., residing in a hospital, nursing home, or correctional facility).","when_to_set_to_false":"Set to false if the patient is currently not institutionalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently institutionalized.","meaning":"Boolean indicating whether the patient is currently institutionalized."} ;; "institutionalized"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_institutionalized_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is institutionalized."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_can_undergo_assessment_using_mini_mental_state_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo assessment using the Mini-Mental State Examination.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo assessment using the Mini-Mental State Examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo assessment using the Mini-Mental State Examination.","meaning":"Boolean indicating whether the patient can currently undergo assessment using the Mini-Mental State Examination."} ;; "Mini-Mental State Examination"
(declare-const patient_can_undergo_assessment_using_mini_mental_state_examination_now@@measured_by_collection_instruments Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Mini-Mental State Examination assessment is measured by collection instruments.","when_to_set_to_false":"Set to false if the patient's Mini-Mental State Examination assessment is not measured by collection instruments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the assessment is measured by collection instruments.","meaning":"Boolean indicating whether the Mini-Mental State Examination assessment is measured by collection instruments."} ;; "collection instruments for Mini-Mental State Examination data"
(declare-const patient_can_undergo_assessment_using_cdr_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo assessment using the Clinical Dementia Rating.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo assessment using the Clinical Dementia Rating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo assessment using the Clinical Dementia Rating.","meaning":"Boolean indicating whether the patient can currently undergo assessment using the Clinical Dementia Rating."} ;; "Clinical Dementia Rating"
(declare-const patient_can_undergo_assessment_using_cdr_now@@measured_by_collection_instruments Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Clinical Dementia Rating assessment is measured by collection instruments.","when_to_set_to_false":"Set to false if the patient's Clinical Dementia Rating assessment is not measured by collection instruments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the assessment is measured by collection instruments.","meaning":"Boolean indicating whether the Clinical Dementia Rating assessment is measured by collection instruments."} ;; "collection instruments for Clinical Dementia Rating data"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_can_undergo_assessment_using_mini_mental_state_examination_now@@measured_by_collection_instruments
      patient_can_undergo_assessment_using_mini_mental_state_examination_now)
    :named REQ2_AUXILIARY0)) ;; "collection instruments for Mini-Mental State Examination data"

(assert
(! (=> patient_can_undergo_assessment_using_cdr_now@@measured_by_collection_instruments
      patient_can_undergo_assessment_using_cdr_now)
    :named REQ2_AUXILIARY1)) ;; "collection instruments for Clinical Dementia Rating data"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_can_undergo_assessment_using_mini_mental_state_examination_now@@measured_by_collection_instruments)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to respond to collection instruments for Mini-Mental State Examination data."

(assert
(! (not patient_can_undergo_assessment_using_cdr_now@@measured_by_collection_instruments)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to respond to collection instruments for Clinical Dementia Rating data."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_phone_contact_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has phone contact.","when_to_set_to_false":"Set to false if the patient currently does not have phone contact.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has phone contact.","meaning":"Boolean indicating whether the patient currently has phone contact."} ;; "the patient does NOT have phone contact"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_phone_contact_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have phone contact."
