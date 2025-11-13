;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_blood_donor Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a blood donor.","when_to_set_to_false":"Set to false if the patient is not a blood donor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a blood donor.","meaning":"Boolean indicating whether the patient is a blood donor."} ;; "patient is a blood donor"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_blood_donor)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is NOT a blood donor."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_notifications_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a notification procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a notification procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a notification procedure at any time in their history.","meaning":"Boolean indicating whether the patient has ever undergone a notification procedure at any time in their history."} ;; "notification"
(declare-const patient_has_undergone_notifications_inthehistory@@evidenced_by_record_having_taken_place Bool) ;; {"when_to_set_to_true":"Set to true if there is a record evidencing that the notification procedure took place.","when_to_set_to_false":"Set to false if there is no record evidencing that the notification procedure took place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is a record evidencing that the notification procedure took place.","meaning":"Boolean indicating whether there is a record evidencing that the notification procedure took place."} ;; "record of notification having taken place"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_undergone_notifications_inthehistory@@evidenced_by_record_having_taken_place
      patient_has_undergone_notifications_inthehistory)
:named REQ1_AUXILIARY0)) ;; "record evidencing that the notification procedure took place" implies "notification procedure at any time in their history"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_notifications_inthehistory@@evidenced_by_record_having_taken_place)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have a record of notification having taken place."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_member_of_armed_forces_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a member of the armed forces.","when_to_set_to_false":"Set to false if the patient is currently not a member of the armed forces.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a member of the armed forces.","meaning":"Boolean indicating whether the patient is currently a member of the armed forces."} ;; "the patient is a member of the armed forces"
(declare-const patient_is_member_of_profession_with_risk_of_breach_of_confidentiality_due_to_contact_at_address_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a member of another profession where contact at the address provided could lead to a breach of confidentiality.","when_to_set_to_false":"Set to false if the patient is currently not a member of such a profession.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a member of another profession where contact at the address provided could lead to a breach of confidentiality.","meaning":"Boolean indicating whether the patient is currently a member of another profession where contact at the address provided could lead to a breach of confidentiality."} ;; "the patient is a member of another profession where contact at the address provided could lead to a breach of confidentiality"
(declare-const patient_is_member_of_profession_with_risk_of_breach_of_confidentiality_due_to_contact_at_address_now@@contact_at_address_provided_could_lead_to_breach_of_confidentiality Bool) ;; {"when_to_set_to_true":"Set to true if contact at the address provided could lead to a breach of confidentiality for the patient's profession.","when_to_set_to_false":"Set to false if contact at the address provided could not lead to a breach of confidentiality for the patient's profession.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether contact at the address provided could lead to a breach of confidentiality for the patient's profession.","meaning":"Boolean indicating whether contact at the address provided could lead to a breach of confidentiality for the patient's profession."} ;; "contact at the address provided could lead to a breach of confidentiality for the patient's profession"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_member_of_profession_with_risk_of_breach_of_confidentiality_due_to_contact_at_address_now@@contact_at_address_provided_could_lead_to_breach_of_confidentiality
      patient_is_member_of_profession_with_risk_of_breach_of_confidentiality_due_to_contact_at_address_now)
:named REQ2_AUXILIARY0)) ;; "contact at the address provided could lead to a breach of confidentiality for the patient's profession"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_is_member_of_armed_forces_now
            patient_is_member_of_profession_with_risk_of_breach_of_confidentiality_due_to_contact_at_address_now))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a member of the armed forces) OR (the patient is a member of another profession where contact at the address provided could lead to a breach of confidentiality)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_was_deferred_before_year_2008 Bool) ;; {"when_to_set_to_true":"Set to true if the patient was deferred at any time before the year 2008.","when_to_set_to_false":"Set to false if the patient was not deferred before the year 2008.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was deferred before the year 2008.","meaning":"Boolean indicating whether the patient was deferred before the year 2008."} ;; "the patient was deferred before the year two thousand and eight"
(declare-const patient_was_in_pilot Bool) ;; {"when_to_set_to_true":"Set to true if the patient was in the specific pilot referenced in the context of the requirement.","when_to_set_to_false":"Set to false if the patient was not in the specific pilot referenced in the context of the requirement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was in the specific pilot referenced in the context of the requirement.","meaning":"Boolean indicating whether the patient was in the specific pilot referenced in the context of the requirement."} ;; "the patient was in the pilot"
(declare-const patient_has_finding_of_at_risk_of_variant_creutzfeldt_jakob_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been at increased risk of variant Creutzfeldt-Jakob disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been at increased risk of variant Creutzfeldt-Jakob disease at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been at increased risk of variant Creutzfeldt-Jakob disease.","meaning":"Boolean indicating whether the patient has ever been at increased risk of variant Creutzfeldt-Jakob disease in their history."} ;; "increased risk of variant Creutzfeldt-Jakob disease"
(declare-const patient_has_finding_of_at_risk_of_variant_creutzfeldt_jakob_disease_inthehistory@@notified_of_increased_risk Bool) ;; {"when_to_set_to_true":"Set to true if the patient was notified of their increased risk of variant Creutzfeldt-Jakob disease at any point in their history.","when_to_set_to_false":"Set to false if the patient was not notified of their increased risk of variant Creutzfeldt-Jakob disease at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was notified of their increased risk of variant Creutzfeldt-Jakob disease.","meaning":"Boolean indicating whether the patient was notified of their increased risk of variant Creutzfeldt-Jakob disease."} ;; "the patient was notified of increased risk of variant Creutzfeldt-Jakob disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_at_risk_of_variant_creutzfeldt_jakob_disease_inthehistory@@notified_of_increased_risk
       patient_has_finding_of_at_risk_of_variant_creutzfeldt_jakob_disease_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "the patient was notified of increased risk of variant Creutzfeldt-Jakob disease"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT satisfy the exclusion condition
(assert
(! (not (and
         patient_was_deferred_before_year_2008
         (not (or patient_was_in_pilot
                  patient_has_finding_of_at_risk_of_variant_creutzfeldt_jakob_disease_inthehistory@@notified_of_increased_risk))))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient was deferred before the year two thousand and eight) AND NOT ((the patient was in the pilot) OR (the patient was notified of increased risk of variant Creutzfeldt-Jakob disease))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_been_deferred_as_a_result_of_non_routine_test_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been deferred as a result of a non-routine test.","when_to_set_to_false":"Set to false if the patient has never been deferred as a result of a non-routine test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been deferred as a result of a non-routine test.","meaning":"Boolean indicating whether the patient has ever been deferred as a result of a non-routine test."} ;; "the patient was deferred as a result of a non-routine test"
(declare-const patient_has_diagnosis_of_syphilis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of syphilis infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of syphilis infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of syphilis infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of syphilis infection."} ;; "syphilis infection"
(declare-const patient_has_diagnosis_of_syphilis_now@@is_only_cause_for_deferral Bool) ;; {"when_to_set_to_true":"Set to true if syphilis infection is the only cause for the patient's deferral.","when_to_set_to_false":"Set to false if syphilis infection is not the only cause for the patient's deferral (i.e., other causes exist or are documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether syphilis infection is the only cause for deferral.","meaning":"Boolean indicating whether syphilis infection is the only cause for the patient's deferral."} ;; "syphilis infection only"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_syphilis_now@@is_only_cause_for_deferral
     patient_has_diagnosis_of_syphilis_now)
:named REQ4_AUXILIARY0)) ;; "syphilis infection only" implies "syphilis infection"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have ever been deferred as a result of a non-routine test OR deferred as a result of syphilis infection only
(assert
(! (not (or patient_has_been_deferred_as_a_result_of_non_routine_test_ever
            patient_has_diagnosis_of_syphilis_now@@is_only_cause_for_deferral))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient was deferred as a result of a non-routine test) OR (the patient was deferred as a result of syphilis infection only)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_donor_registered_with_welsh_blood_services Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a donor registered with the Welsh Blood Services.","when_to_set_to_false":"Set to false if the patient is not a donor registered with the Welsh Blood Services.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a donor registered with the Welsh Blood Services.","meaning":"Boolean indicating whether the patient is a donor registered with the Welsh Blood Services."} ;; "the patient is a donor registered with the Welsh Blood Services"
(declare-const patient_is_donor_registered_with_scottish_blood_services Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a donor registered with the Scottish Blood Services.","when_to_set_to_false":"Set to false if the patient is not a donor registered with the Scottish Blood Services.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a donor registered with the Scottish Blood Services.","meaning":"Boolean indicating whether the patient is a donor registered with the Scottish Blood Services."} ;; "the patient is a donor registered with the Scottish Blood Services"
(declare-const patient_is_donor_registered_with_northern_irish_blood_services Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a donor registered with the Northern Irish Blood Services.","when_to_set_to_false":"Set to false if the patient is not a donor registered with the Northern Irish Blood Services.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a donor registered with the Northern Irish Blood Services.","meaning":"Boolean indicating whether the patient is a donor registered with the Northern Irish Blood Services."} ;; "the patient is a donor registered with the Northern Irish Blood Services"
(declare-const patient_was_notified_by_welsh_blood_services Bool) ;; {"when_to_set_to_true":"Set to true if the patient was notified by the Welsh Blood Services.","when_to_set_to_false":"Set to false if the patient was not notified by the Welsh Blood Services.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was notified by the Welsh Blood Services.","meaning":"Boolean indicating whether the patient was notified by the Welsh Blood Services."} ;; "the patient was notified by the Welsh Blood Services"
(declare-const patient_was_notified_by_scottish_blood_services Bool) ;; {"when_to_set_to_true":"Set to true if the patient was notified by the Scottish Blood Services.","when_to_set_to_false":"Set to false if the patient was not notified by the Scottish Blood Services.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was notified by the Scottish Blood Services.","meaning":"Boolean indicating whether the patient was notified by the Scottish Blood Services."} ;; "the patient was notified by the Scottish Blood Services"
(declare-const patient_was_notified_by_northern_irish_blood_services Bool) ;; {"when_to_set_to_true":"Set to true if the patient was notified by the Northern Irish Blood Services.","when_to_set_to_false":"Set to false if the patient was not notified by the Northern Irish Blood Services.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was notified by the Northern Irish Blood Services.","meaning":"Boolean indicating whether the patient was notified by the Northern Irish Blood Services."} ;; "the patient was notified by the Northern Irish Blood Services"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (and
    (or patient_is_donor_registered_with_welsh_blood_services
        patient_is_donor_registered_with_scottish_blood_services
        patient_is_donor_registered_with_northern_irish_blood_services)
    (or patient_was_notified_by_welsh_blood_services
        patient_was_notified_by_scottish_blood_services
        patient_was_notified_by_northern_irish_blood_services)
  ))
  :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is a donor registered with the Welsh Blood Services) OR (the patient is a donor registered with the Scottish Blood Services) OR (the patient is a donor registered with the Northern Irish Blood Services)) AND ((the patient was notified by the Welsh Blood Services) OR (the patient was notified by the Scottish Blood Services) OR (the patient was notified by the Northern Irish Blood Services))."
