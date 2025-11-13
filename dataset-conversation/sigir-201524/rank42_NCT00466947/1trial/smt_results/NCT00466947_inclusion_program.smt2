;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_at_first_vaccination_in_weeks Real) ;; {"when_to_set_to_value":"Set to the patient's age in weeks at the time of the first vaccination.","when_to_set_to_null":"Set to null if the patient's age at the time of the first vaccination is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's age in weeks at the time of the first vaccination."}  ;; "be aged ≥ 6 weeks AND be aged ≤ 16 weeks at the time of the first vaccination" and "be aged ≥ 8 weeks AND be aged ≤ 16 weeks (chronological age) at the time of the first vaccination"
(declare-const patient_has_finding_of_premature_infant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a premature (pre-term born) infant as of now.","when_to_set_to_false":"Set to false if the patient is not a premature (pre-term born) infant as of now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a premature (pre-term born) infant as of now.","meaning":"Boolean indicating whether the patient is a premature (pre-term born) infant as of now."}  ;; "pre-term born infant"
(declare-const patient_has_undergone_active_immunization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) as of now.","when_to_set_to_false":"Set to false if the patient has not undergone active immunization (vaccination) as of now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone active immunization (vaccination) as of now.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) as of now."}  ;; "at the time of the first vaccination"
(declare-const patient_has_undergone_active_immunization_now@@is_first_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the vaccination event is the patient's first vaccination.","when_to_set_to_false":"Set to false if the vaccination event is not the patient's first vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vaccination event is the first.","meaning":"Boolean indicating whether the vaccination event is the patient's first vaccination."}  ;; "at the time of the first vaccination"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; The first vaccination qualifier implies the patient has undergone vaccination
(assert
  (! (=> patient_has_undergone_active_immunization_now@@is_first_vaccination
         patient_has_undergone_active_immunization_now)
     :named REQ0_AUXILIARY0)) ;; "at the time of the first vaccination"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((be aged ≥ 6 weeks AND be aged ≤ 16 weeks at the time of the first vaccination) OR (be a pre-term born infant AND be aged ≥ 8 weeks AND be aged ≤ 16 weeks (chronological age) at the time of the first vaccination)).
(assert
  (! (and
        patient_has_undergone_active_immunization_now@@is_first_vaccination
        (or
          (and (not patient_has_finding_of_premature_infant_now)
               (>= patient_age_value_at_first_vaccination_in_weeks 6.0)
               (<= patient_age_value_at_first_vaccination_in_weeks 16.0))
          (and patient_has_finding_of_premature_infant_now
               (>= patient_age_value_at_first_vaccination_in_weeks 8.0)
               (<= patient_age_value_at_first_vaccination_in_weeks 16.0))))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be aged ≥ 6 weeks AND be aged ≤ 16 weeks at the time of the first vaccination) OR (be a pre-term born infant AND be aged ≥ 8 weeks AND be aged ≤ 16 weeks (chronological age) at the time of the first vaccination))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community acquired pneumonia."} ;; "be living in the area covered by the surveillance system for community acquired pneumonia"
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now@@under_surveillance_by_surveillance_system Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of community acquired pneumonia is under surveillance by the surveillance system.","when_to_set_to_false":"Set to false if the patient's diagnosis of community acquired pneumonia is not under surveillance by the surveillance system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is under surveillance by the surveillance system.","meaning":"Boolean indicating whether the patient's diagnosis of community acquired pneumonia is under surveillance by the surveillance system."} ;; "be living in the area covered by the surveillance system for community acquired pneumonia"
(declare-const patient_is_living_in_area_covered_by_surveillance_system_for_invasive_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in the area covered by the surveillance system for invasive disease.","when_to_set_to_false":"Set to false if the patient is currently not living in the area covered by the surveillance system for invasive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living in the area covered by the surveillance system for invasive disease.","meaning":"Boolean indicating whether the patient is currently living in the area covered by the surveillance system for invasive disease."} ;; "be living in the area covered by the surveillance system for invasive disease"
(declare-const patient_has_diagnosis_of_acute_otitis_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute otitis media.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute otitis media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute otitis media.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute otitis media."} ;; "be living in the area covered by the surveillance system for acute otitis media"
(declare-const patient_has_diagnosis_of_acute_otitis_media_now@@under_surveillance_by_surveillance_system Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of acute otitis media is under surveillance by the surveillance system.","when_to_set_to_false":"Set to false if the patient's diagnosis of acute otitis media is not under surveillance by the surveillance system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is under surveillance by the surveillance system.","meaning":"Boolean indicating whether the patient's diagnosis of acute otitis media is under surveillance by the surveillance system."} ;; "be living in the area covered by the surveillance system for acute otitis media"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_community_acquired_pneumonia_now@@under_surveillance_by_surveillance_system
         patient_has_diagnosis_of_community_acquired_pneumonia_now)
     :named REQ1_AUXILIARY0)) ;; "be living in the area covered by the surveillance system for community acquired pneumonia"

(assert
  (! (=> patient_has_diagnosis_of_acute_otitis_media_now@@under_surveillance_by_surveillance_system
         patient_has_diagnosis_of_acute_otitis_media_now)
     :named REQ1_AUXILIARY1)) ;; "be living in the area covered by the surveillance system for acute otitis media"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must ((be living in the area covered by the surveillance system for community acquired pneumonia) OR (be living in the area covered by the surveillance system for invasive disease) OR (be living in the area covered by the surveillance system for acute otitis media)).
(assert
  (! (or patient_has_diagnosis_of_community_acquired_pneumonia_now@@under_surveillance_by_surveillance_system
         patient_is_living_in_area_covered_by_surveillance_system_for_invasive_disease_now
         patient_has_diagnosis_of_acute_otitis_media_now@@under_surveillance_by_surveillance_system)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be living in the area covered by the surveillance system for community acquired pneumonia) OR (be living in the area covered by the surveillance system for invasive disease) OR (be living in the area covered by the surveillance system for acute otitis media))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const written_informed_consent_obtained_from_parent Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the parent for the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the parent for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the parent for the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from the parent for the patient."} ;; "have written informed consent obtained from the parent"
(declare-const written_informed_consent_obtained_from_guardian Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the guardian for the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the guardian for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the guardian for the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from the guardian for the patient."} ;; "have written informed consent obtained from the guardian"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must ((have written informed consent obtained from the parent) OR (have written informed consent obtained from the guardian)).
(assert
  (! (or written_informed_consent_obtained_from_parent
         written_informed_consent_obtained_from_guardian)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must ((have written informed consent obtained from the parent) OR (have written informed consent obtained from the guardian))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_can_undergo_immunization_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient can undergo immunization at any time in the future.","when_to_set_to_false":"Set to false if the patient cannot undergo immunization at any time in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can undergo immunization in the future.","meaning":"Boolean indicating whether the patient can undergo immunization at any time in the future."} ;; "initiation of routine immunization outside a clinical trial context"
(declare-const patient_can_undergo_immunization_inthefuture@@routine_immunization Bool) ;; {"when_to_set_to_true":"Set to true if the immunization is routine (i.e., part of standard immunization schedule, not experimental or special circumstance).","when_to_set_to_false":"Set to false if the immunization is not routine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunization is routine.","meaning":"Boolean indicating whether the immunization is routine."} ;; "routine immunization"
(declare-const patient_can_undergo_immunization_inthefuture@@outside_clinical_trial_context Bool) ;; {"when_to_set_to_true":"Set to true if the immunization occurs outside the context of a clinical trial.","when_to_set_to_false":"Set to false if the immunization occurs within a clinical trial context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunization occurs outside a clinical trial context.","meaning":"Boolean indicating whether the immunization occurs outside a clinical trial context."} ;; "outside a clinical trial context"
(declare-const patient_has_health_problem_established_by_medical_history_and_clinical_examination_before_study_entry_that_contraindicates_routine_immunization_outside_clinical_trial_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any known or suspected health problem, as established by medical history and clinical examination before study entry, that would contraindicate the initiation of routine immunization outside a clinical trial context.","when_to_set_to_false":"Set to false if the patient does not have any such health problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any such health problem.","meaning":"Boolean indicating whether the patient has any known or suspected health problem, as established by medical history and clinical examination before study entry, that would contraindicate the initiation of routine immunization outside a clinical trial context."} ;; "any (known health problem OR suspected health problem) (as established by medical history and clinical examination before entering into the study) that would contraindicate the initiation of routine immunization outside a clinical trial context"
(declare-const patient_has_undergone_physical_examination_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical (physical) examination at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical (physical) examination at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical (physical) examination in their history.","meaning":"Boolean indicating whether the patient has undergone a clinical (physical) examination at any time in their history."} ;; "clinical examination before entering into the study"
(declare-const patient_has_undergone_physical_examination_inthehistory@@temporalcontext_before_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the clinical (physical) examination occurred before the patient entered into the study.","when_to_set_to_false":"Set to false if the clinical (physical) examination did not occur before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical (physical) examination occurred before study entry.","meaning":"Boolean indicating whether the clinical (physical) examination occurred before study entry."} ;; "clinical examination before entering into the study"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_can_undergo_immunization_inthefuture@@routine_immunization
         patient_can_undergo_immunization_inthefuture)
     :named REQ3_AUXILIARY0)) ;; "routine immunization"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_can_undergo_immunization_inthefuture@@outside_clinical_trial_context
         patient_can_undergo_immunization_inthefuture)
     :named REQ3_AUXILIARY1)) ;; "outside a clinical trial context"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_undergone_physical_examination_inthehistory@@temporalcontext_before_study_entry
         patient_has_undergone_physical_examination_inthehistory)
     :named REQ3_AUXILIARY2)) ;; "clinical examination before entering into the study"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must NOT have any health problem (known or suspected, as established by medical history and clinical examination before study entry) that would contraindicate routine immunization outside a clinical trial context
(assert
  (! (not patient_has_health_problem_established_by_medical_history_and_clinical_examination_before_study_entry_that_contraindicates_routine_immunization_outside_clinical_trial_context)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must be free of any (known health problem OR suspected health problem) ... that would contraindicate the initiation of routine immunization outside a clinical trial context"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const investigator_believes_parents_or_guardians_can_and_will_comply_with_protocol_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the investigator believes that the parents or guardians of the patient can and will comply with all requirements of the protocol.","when_to_set_to_false":"Set to false if the investigator believes that the parents or guardians of the patient cannot or will not comply with all requirements of the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator believes the parents or guardians can and will comply with the requirements of the protocol.","meaning":"Boolean indicating whether the investigator believes that the parents or guardians of the patient can and will comply with the requirements of the protocol."} ;; "the investigator believes that the parents or the guardians of the patient can and will comply with the requirements of the protocol"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! investigator_believes_parents_or_guardians_can_and_will_comply_with_protocol_requirements
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the investigator believes that the parents or the guardians of the patient can and will comply with the requirements of the protocol"
