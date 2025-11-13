;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_primary_immune_deficiency_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinical history suggestive of primary immune deficiency disorder at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a clinical history suggestive of primary immune deficiency disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical history suggestive of primary immune deficiency disorder.","meaning":"Boolean indicating whether the patient has ever had a clinical history suggestive of primary immune deficiency disorder."} // "clinical history suggestive of a primary immune deficiency syndrome"
(declare-const patient_has_clinical_signs_of_primary_immune_deficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs suggestive of primary immune deficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs suggestive of primary immune deficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs suggestive of primary immune deficiency disorder.","meaning":"Boolean indicating whether the patient currently has clinical signs suggestive of primary immune deficiency disorder."} // "signs suggestive of a primary immune deficiency syndrome"
(declare-const patient_has_symptoms_of_primary_immune_deficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms suggestive of primary immune deficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms suggestive of primary immune deficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms suggestive of primary immune deficiency disorder.","meaning":"Boolean indicating whether the patient currently has symptoms suggestive of primary immune deficiency disorder."} // "symptoms suggestive of a primary immune deficiency syndrome"
(declare-const patient_is_family_member_of_patient_with_primary_immune_deficiency_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a family member of a patient with a primary immune deficiency syndrome.","when_to_set_to_false":"Set to false if the patient is not a family member of a patient with a primary immune deficiency syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a family member of a patient with a primary immune deficiency syndrome.","meaning":"Boolean indicating whether the patient is a family member of a patient with a primary immune deficiency syndrome."} // "be a family member of a patient with a primary immune deficiency syndrome"
(declare-const patient_is_referred_by_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient is referred by the physician of the patient.","when_to_set_to_false":"Set to false if the patient is not referred by the physician of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is referred by the physician of the patient.","meaning":"Boolean indicating whether the patient is referred by the physician of the patient."} // "may be referred by the physician of the patient"
(declare-const patient_is_self_referred Bool) ;; {"when_to_set_to_true":"Set to true if the patient is self-referred.","when_to_set_to_false":"Set to false if the patient is not self-referred.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is self-referred.","meaning":"Boolean indicating whether the patient is self-referred."} // "may be self-referred"
(declare-const patient_is_self_referred@@local_physician_or_local_clinical_immunologist_identified_as_primary_reference_if_possible Bool) ;; {"when_to_set_to_true":"Set to true if a local physician or a local clinical immunologist is identified to serve as the primary reference for a self-referred patient, if possible.","when_to_set_to_false":"Set to false if a local physician or a local clinical immunologist is not identified to serve as the primary reference for a self-referred patient, if possible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a local physician or a local clinical immunologist is identified to serve as the primary reference for a self-referred patient, if possible.","meaning":"Boolean indicating whether a local physician or a local clinical immunologist is identified to serve as the primary reference for a self-referred patient, if possible."} // "if the patient is self-referred, a local physician or a local clinical immunologist should be identified to serve as the primary reference if possible"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have (clinical history OR signs OR symptoms suggestive of primary immune deficiency syndrome OR be a family member of a patient with a primary immune deficiency syndrome)
(assert
  (! (or patient_has_finding_of_primary_immune_deficiency_disorder_inthehistory
         patient_has_clinical_signs_of_primary_immune_deficiency_disorder_now
         patient_has_symptoms_of_primary_immune_deficiency_disorder_now
         patient_is_family_member_of_patient_with_primary_immune_deficiency_syndrome)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ((a clinical history suggestive of a primary immune deficiency syndrome) OR (signs suggestive of a primary immune deficiency syndrome) OR (symptoms suggestive of a primary immune deficiency syndrome) OR (be a family member of a patient with a primary immune deficiency syndrome))."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 1: Patient may be referred by physician or may be self-referred (not a strict requirement, always satisfiable)
(assert
  (! (or patient_is_referred_by_physician
         patient_is_self_referred)
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient may be referred by the physician of the patient or may be self-referred."

;; Component 2: If self-referred, a local physician or clinical immunologist should be identified as primary reference if possible (not a strict requirement, always satisfiable)
(assert
  (! (or (not patient_is_self_referred)
         patient_is_self_referred@@local_physician_or_local_clinical_immunologist_identified_as_primary_reference_if_possible)
     :named REQ0_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "If the patient is self-referred, a local physician or a local clinical immunologist should be identified to serve as the primary reference if possible."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_been_screened_by_phone_interview_or_medical_record_review_for_primary_immunodeficiency_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been screened by either a phone interview or by review of medical records and the screening indicates that the patient may have a primary immunodeficiency syndrome.","when_to_set_to_false":"Set to false if the patient has not been screened by either a phone interview or by review of medical records for primary immunodeficiency syndrome, or if the screening does not indicate that the patient may have a primary immunodeficiency syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been screened by phone interview or medical record review for primary immunodeficiency syndrome.","meaning":"Boolean indicating whether the patient has been screened by either a phone interview or by review of medical records indicating that the patient may have a primary immunodeficiency syndrome."} // "must have been screened by a phone interview or by review of medical records indicating that the patient may have a primary immunodeficiency syndrome"
(declare-const patients_human_immunodeficiency_virus_infection_is_negative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a negative status for human immunodeficiency virus infection (i.e., is not infected with HIV).","when_to_set_to_false":"Set to false if the patient currently does not have a negative status for human immunodeficiency virus infection (i.e., is infected with HIV).","when_to_set_to_null":"Set to null if the patient's HIV infection status is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient currently has a negative status for human immunodeficiency virus infection."} // "must have a negative human immunodeficiency virus infection status"
(declare-const patient_has_been_invited_to_come_to_national_institutes_of_health Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been invited to come to the National Institutes of Health.","when_to_set_to_false":"Set to false if the patient has not been invited to come to the National Institutes of Health.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been invited to come to the National Institutes of Health.","meaning":"Boolean indicating whether the patient has been invited to come to the National Institutes of Health."} // "must be invited to come to the National Institutes of Health"
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an informed consent.","when_to_set_to_false":"Set to false if the patient has not signed an informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed an informed consent.","meaning":"Boolean indicating whether the patient has signed an informed consent."} // "must sign an informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have been screened by phone interview or medical record review for primary immunodeficiency syndrome
(assert
  (! patient_has_been_screened_by_phone_interview_or_medical_record_review_for_primary_immunodeficiency_syndrome
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must have been screened by a phone interview or by review of medical records indicating that the patient may have a primary immunodeficiency syndrome"

;; Component 1: Must have a negative HIV infection status
(assert
  (! patients_human_immunodeficiency_virus_infection_is_negative_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "must have a negative human immunodeficiency virus infection status"

;; Component 2: Must be invited to NIH and sign informed consent
(assert
  (! (and patient_has_been_invited_to_come_to_national_institutes_of_health
          patient_has_signed_informed_consent)
     :named REQ1_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be invited to come to the National Institutes of Health and sign an informed consent"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const family_member_of_patient_has_positive_family_history_of_immunodeficiency Bool) ;; {"when_to_set_to_true":"Set to true if a family member of the patient has a positive family history for immunodeficiency.","when_to_set_to_false":"Set to false if no family member of the patient has a positive family history for immunodeficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a family member of the patient has a positive family history for immunodeficiency.","meaning":"Boolean indicating whether a family member of the patient has a positive family history for immunodeficiency."} // "family member of the patient has a positive family history for immunodeficiency"
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} // "patient currently has an immunodeficiency disorder"
(declare-const patient_has_positive_family_history_of_immunodeficiency Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a positive family history for immunodeficiency.","when_to_set_to_false":"Set to false if the patient does not have a positive family history for immunodeficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a positive family history for immunodeficiency.","meaning":"Boolean indicating whether the patient has a positive family history for immunodeficiency."} // "patient has a positive family history for immunodeficiency"
(declare-const relatives_invited_to_contact_principal_investigator_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if other relatives have been invited to contact the principal investigator to participate in the study.","when_to_set_to_false":"Set to false if other relatives have not been invited to contact the principal investigator to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether other relatives have been invited to contact the principal investigator to participate in the study.","meaning":"Boolean indicating whether other relatives have been invited to contact the principal investigator to participate in the study."} // "other relatives have been invited to contact the principal investigator to participate in the study"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; If the patient or a family member has a positive family history for immunodeficiency, then other relatives may be invited to contact the principal investigator to participate in the study.
(assert
  (! (=> (or patient_has_positive_family_history_of_immunodeficiency
            family_member_of_patient_has_positive_family_history_of_immunodeficiency)
         relatives_invited_to_contact_principal_investigator_to_participate_in_study)
     :named REQ2_AUXILIARY0)) ;; "if the patient or the family member of the patient has a positive family history for immunodeficiency, ... may be asked to invite other relatives to contact the principal investigator to participate in the study"

;; ===================== Constraint Assertions (REQ 2) =====================
;; This requirement is tagged as NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION, so no constraint assertion is needed.

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_may_continue_under_protocol_with_medical_advisory_supervision_of_dr_harry_malech Bool) ;; {"when_to_set_to_true":"Set to true if the patient may continue to be seen under the protocol under the medical advisory supervision of Dr. Harry Malech.","when_to_set_to_false":"Set to false if the patient may not continue to be seen under the protocol under the medical advisory supervision of Dr. Harry Malech.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient may continue to be seen under the protocol under the medical advisory supervision of Dr. Harry Malech.","meaning":"Boolean indicating whether the patient may continue to be seen under the protocol under the medical advisory supervision of Dr. Harry Malech."} // "may continue to be seen under the protocol under the medical advisory supervision of Dr. Harry Malech"
(declare-const patient_was_previously_enrolled_under_inclusion_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient was previously enrolled under the protocol's inclusion criteria.","when_to_set_to_false":"Set to false if the patient was not previously enrolled under the protocol's inclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was previously enrolled under the protocol's inclusion criteria.","meaning":"Boolean indicating whether the patient was previously enrolled under the protocol's inclusion criteria."} // "if the patient was previously enrolled under the above inclusion criteria"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; If the patient was previously enrolled under the inclusion criteria, then the patient may continue under protocol with Dr. Harry Malech's supervision
(assert
  (! (=> patient_was_previously_enrolled_under_inclusion_criteria
         patient_may_continue_under_protocol_with_medical_advisory_supervision_of_dr_harry_malech)
     :named REQ3_AUXILIARY0)) ;; "if the patient was previously enrolled under the above inclusion criteria, the patient may continue to be seen under the protocol under the medical advisory supervision of Dr. Harry Malech"

;; ===================== Constraint Assertions (REQ 3) =====================
;; This requirement is tagged as NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION, so no constraint assertion is needed.

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "child"
(declare-const patient_is_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a child.","when_to_set_to_false":"Set to false if the patient is currently not a child.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a child.","meaning":"Boolean indicating whether the patient is currently a child."} // "child"
(declare-const patient_has_diagnosis_of_scid_due_to_absent_adenosine_deaminase_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of SCID due to absent adenosine deaminase.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of SCID due to absent adenosine deaminase.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of SCID due to absent adenosine deaminase.","meaning":"Boolean indicating whether the patient currently has a diagnosis of SCID due to absent adenosine deaminase."} // "adenosine deaminase deficiency severe combined immunodeficiency"
(declare-const patient_has_diagnosis_of_scid_due_to_absent_adenosine_deaminase_now@@diagnosis_is_established Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of SCID due to absent adenosine deaminase is established.","when_to_set_to_false":"Set to false if the patient's diagnosis of SCID due to absent adenosine deaminase is not established.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is established.","meaning":"Boolean indicating whether the patient's diagnosis of SCID due to absent adenosine deaminase is established."} // "established diagnosis of adenosine deaminase deficiency severe combined immunodeficiency"
(declare-const patient_has_diagnosis_of_scid_due_to_absent_adenosine_deaminase_now@@diagnosis_is_verified Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of SCID due to absent adenosine deaminase is verified.","when_to_set_to_false":"Set to false if the patient's diagnosis of SCID due to absent adenosine deaminase is not verified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is verified.","meaning":"Boolean indicating whether the patient's diagnosis of SCID due to absent adenosine deaminase is verified."} // "verified diagnosis of adenosine deaminase deficiency severe combined immunodeficiency"
(declare-const patient_is_cared_for_by_collaborators_at_university_of_california_los_angeles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently cared for by collaborators at University of California, Los Angeles.","when_to_set_to_false":"Set to false if the patient is currently not cared for by collaborators at University of California, Los Angeles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently cared for by collaborators at University of California, Los Angeles.","meaning":"Boolean indicating whether the patient is currently cared for by collaborators at University of California, Los Angeles."} // "cared for by collaborators at University of California, Los Angeles"
(declare-const patient_is_exposed_to_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to blood.","when_to_set_to_false":"Set to false if the patient is currently not exposed to blood.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to blood.","meaning":"Boolean indicating whether the patient is currently exposed to blood."} // "blood"
(declare-const patient_is_exposed_to_blood_now@@only_samples_from_these_patients_received Bool) ;; {"when_to_set_to_true":"Set to true if only blood samples from patients meeting the above criteria are received.","when_to_set_to_false":"Set to false if blood samples from other patients are also received.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether only blood samples from these patients are received.","meaning":"Boolean indicating whether only blood samples from patients meeting the above criteria are received."} // "only blood samples will be received from these patients"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Age-based definition of child (for completeness, but not enforced as a constraint here)
(assert
  (! (=> (and (>= patient_age_value_recorded_now_in_years 0) (< patient_age_value_recorded_now_in_years 18))
         patient_is_child_now)
     :named REQ4_AUXILIARY0)) ;; "child" defined as age < 18 years

;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_scid_due_to_absent_adenosine_deaminase_now@@diagnosis_is_established
         patient_has_diagnosis_of_scid_due_to_absent_adenosine_deaminase_now)
     :named REQ4_AUXILIARY1)) ;; "established diagnosis" implies diagnosis

(assert
  (! (=> patient_has_diagnosis_of_scid_due_to_absent_adenosine_deaminase_now@@diagnosis_is_verified
         patient_has_diagnosis_of_scid_due_to_absent_adenosine_deaminase_now)
     :named REQ4_AUXILIARY2)) ;; "verified diagnosis" implies diagnosis

;; Qualifier variable for blood sample receipt implies exposure to blood
(assert
  (! (=> patient_is_exposed_to_blood_now@@only_samples_from_these_patients_received
         patient_is_exposed_to_blood_now)
     :named REQ4_AUXILIARY3)) ;; "only blood samples will be received from these patients" implies exposure to blood

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Must be a child with established AND verified diagnosis of SCID due to absent adenosine deaminase
(assert
  (! (and patient_is_child_now
          patient_has_diagnosis_of_scid_due_to_absent_adenosine_deaminase_now@@diagnosis_is_established
          patient_has_diagnosis_of_scid_due_to_absent_adenosine_deaminase_now@@diagnosis_is_verified)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "child with an established diagnosis ... and a verified diagnosis ..."

;; Component 1: Must be cared for by collaborators at UCLA
(assert
  (! patient_is_cared_for_by_collaborators_at_university_of_california_los_angeles_now
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "cared for by collaborators at University of California, Los Angeles"

;; Component 2: Only blood samples will be received from these patients (not a strict eligibility constraint)
(assert
  (! patient_is_exposed_to_blood_now@@only_samples_from_these_patients_received
     :named REQ4_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "only blood samples will be received from these patients"
