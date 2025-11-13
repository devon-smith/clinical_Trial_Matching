;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@very_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the disease is very severe.","when_to_set_to_false":"Set to false if the patient currently has a disease but the disease is not very severe, or if the patient does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is very severe.","meaning":"Boolean indicating whether the patient's current disease is very severe."} ;; "very severe disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@very_severe
       patient_has_finding_of_disease_now)
   :named REQ0_AUXILIARY0)) ;; "very severe disease" implies "disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disease_now@@very_severe)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has very severe disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_persistent_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of persistent vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of persistent vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has persistent vomiting.","meaning":"Boolean indicating whether the patient currently has persistent vomiting."} ;; "persistent vomiting"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_persistent_vomiting_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has persistent vomiting."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_parent_who_refuses_study_participation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a parent who refuses to participate in the study.","when_to_set_to_false":"Set to false if the patient currently does not have a parent who refuses to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a parent who refuses to participate in the study.","meaning":"Boolean indicating whether the patient currently has a parent who refuses to participate in the study."} ;; "the patient has a parent who refuses to participate in the study"
(declare-const patient_has_caretaker_who_refuses_study_participation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caretaker who refuses to participate in the study.","when_to_set_to_false":"Set to false if the patient currently does not have a caretaker who refuses to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a caretaker who refuses to participate in the study.","meaning":"Boolean indicating whether the patient currently has a caretaker who refuses to participate in the study."} ;; "the patient has a caretaker who refuses to participate in the study"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_parent_who_refuses_study_participation_now
            patient_has_caretaker_who_refuses_study_participation_now))
    :named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient has a parent who refuses to participate in the study) OR (the patient has a caretaker who refuses to participate in the study)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@non_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia and the pneumonia is non-severe.","when_to_set_to_false":"Set to false if the patient currently has pneumonia and the pneumonia is not non-severe (i.e., is severe or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia is non-severe.","meaning":"Boolean indicating whether the patient's current pneumonia is non-severe."} ;; "non-severe pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia and the pneumonia is severe.","when_to_set_to_false":"Set to false if the patient currently has pneumonia and the pneumonia is not severe (i.e., is non-severe or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia is severe.","meaning":"Boolean indicating whether the patient's current pneumonia is severe."} ;; "severe pneumonia"
(declare-const patient_has_progression_of_pneumonia_now@@to_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has progression of pneumonia to severe pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have progression of pneumonia to severe pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has progression of pneumonia to severe pneumonia.","meaning":"Boolean indicating whether the patient currently has progression of pneumonia to severe pneumonia."} ;; "advances to severe pneumonia"
(declare-const patient_is_currently_being_treated_for_pneumonia_now@@non_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment for non-severe pneumonia.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment for non-severe pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated for non-severe pneumonia.","meaning":"Boolean indicating whether the patient is currently being treated for non-severe pneumonia."} ;; "currently being treated for non-severe pneumonia"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_is_currently_being_treated_for_pneumonia_now@@non_severe
             patient_has_progression_of_pneumonia_now@@to_severe))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently being treated for non-severe pneumonia AND the patient advances to severe pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_kerosene_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to kerosene.","when_to_set_to_false":"Set to false if the patient is currently not exposed to kerosene.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to kerosene.","meaning":"Boolean indicating whether the patient is currently exposed to kerosene."} ;; "kerosene oil"
(declare-const patients_ingestion_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive finding for ingestion.","when_to_set_to_false":"Set to false if the patient currently does not have a positive finding for ingestion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive finding for ingestion now.","meaning":"Boolean indicating whether the patient currently has a positive finding for ingestion now."} ;; "ingestion"
(declare-const patients_ingestion_is_positive_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ingestion is suspected.","when_to_set_to_false":"Set to false if the patient's ingestion is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ingestion is suspected.","meaning":"Boolean indicating whether the patient's ingestion is suspected."} ;; "suspected kerosene oil ingestion"
(declare-const patients_ingestion_is_positive_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ingestion is known.","when_to_set_to_false":"Set to false if the patient's ingestion is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ingestion is known.","meaning":"Boolean indicating whether the patient's ingestion is known."} ;; "known kerosene oil ingestion"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patients_ingestion_is_positive_now@@suspected)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected kerosene oil ingestion."

(assert
(! (not patients_ingestion_is_positive_now@@known)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known kerosene oil ingestion."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_prior_enrollment_within_2_weeks_of_last_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the patient had prior enrollment in the study and that enrollment occurred within two weeks of the patient's last follow up.","when_to_set_to_false":"Set to false if the patient did not have prior enrollment in the study within two weeks of their last follow up, including if there was no prior enrollment or if any prior enrollment occurred more than two weeks after the last follow up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had prior enrollment in the study within two weeks of their last follow up.","meaning":"Boolean indicating whether the patient had prior enrollment in the study within two weeks of their last follow up."} ;; "had prior enrollment in the study within two weeks of last follow up"
(declare-const time_between_last_follow_up_and_prior_enrollment_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the patient's last follow up and their prior enrollment in the study, if both dates are known.","when_to_set_to_null":"Set to null if either the date of last follow up or the date of prior enrollment is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days between the patient's last follow up and their prior enrollment in the study."} ;; "number of days between last follow up and prior enrollment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: patient_has_prior_enrollment_within_2_weeks_of_last_follow_up is true iff time_between_last_follow_up_and_prior_enrollment_in_days <= 14
(assert
(! (= patient_has_prior_enrollment_within_2_weeks_of_last_follow_up
     (<= time_between_last_follow_up_and_prior_enrollment_in_days 14))
:named REQ5_AUXILIARY0)) ;; "had prior enrollment in the study within two weeks of last follow up"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_prior_enrollment_within_2_weeks_of_last_follow_up)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient had prior enrollment in the study within two weeks of last follow up."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_severe_malnutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe malnutrition.","when_to_set_to_false":"Set to false if the patient currently does not have severe malnutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe malnutrition.","meaning":"Boolean indicating whether the patient currently has severe malnutrition."} ;; "The patient is excluded if the patient has severe malnutrition."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_severe_malnutrition_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe malnutrition."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_severe_diarrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe diarrhea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe diarrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of severe diarrhea.","meaning":"Boolean indicating whether the patient currently has severe diarrhea."} ;; "severe diarrhea"
(declare-const patient_has_finding_of_severe_diarrhea_now@@accompanied_by_signs_of_dehydration Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe diarrhea and this finding is accompanied by signs of dehydration.","when_to_set_to_false":"Set to false if the patient currently has severe diarrhea but it is not accompanied by signs of dehydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severe diarrhea is accompanied by signs of dehydration.","meaning":"Boolean indicating whether the patient's current severe diarrhea is accompanied by signs of dehydration."} ;; "severe diarrhea with signs of dehydration"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_severe_diarrhea_now@@accompanied_by_signs_of_dehydration
      patient_has_finding_of_severe_diarrhea_now)
:named REQ7_AUXILIARY0)) ;; "severe diarrhea with signs of dehydration"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_severe_diarrhea_now@@accompanied_by_signs_of_dehydration)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe diarrhea with signs of dehydration."
