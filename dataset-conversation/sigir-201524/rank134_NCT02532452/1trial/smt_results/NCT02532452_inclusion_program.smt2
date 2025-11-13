;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_finding_of_patient_immunocompromised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has immunocompromised status.","when_to_set_to_false":"Set to false if the patient currently does not have immunocompromised status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immunocompromised status.","meaning":"Boolean indicating whether the patient currently has immunocompromised status."}  ;; "have immunocompromised status"
(declare-const patient_has_finding_of_viral_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a viral disease (infection or reactivation).","when_to_set_to_false":"Set to false if the patient currently does not have a viral disease (infection or reactivation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a viral disease (infection or reactivation).","meaning":"Boolean indicating whether the patient currently has a viral disease (infection or reactivation)."}  ;; "have evidence of viral infection"
(declare-const patient_has_finding_of_viral_reactivation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of viral reactivation.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of viral reactivation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of viral reactivation.","meaning":"Boolean indicating whether the patient currently has evidence of viral reactivation."}  ;; "have evidence of viral reactivation"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must have immunocompromised status
(assert
  (! patient_has_finding_of_patient_immunocompromised_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have immunocompromised status."

;; Component 1: patient must have evidence of viral infection OR evidence of viral reactivation
(assert
  (! (or patient_has_finding_of_viral_disease_now
         patient_has_finding_of_viral_reactivation_now)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have evidence of viral infection) OR (have evidence of viral reactivation)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the patient's current age in days if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in days is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in days."}  ;; "older than 1 day"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_age_value_recorded_now_in_days 1.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than 1 day."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const days_since_stem_cell_infusion_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed since the patient's most recent stem cell infusion, as of now, in days.","when_to_set_to_null":"Set to null if the date of the most recent stem cell infusion is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days elapsed since the patient's most recent stem cell infusion, in days."}  ;; "at least 21 days after stem cell infusion"
(declare-const patient_has_undergone_hemopoietic_stem_cell_transplant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a hemopoietic stem cell transplant at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a hemopoietic stem cell transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a hemopoietic stem cell transplant.","meaning":"Boolean indicating whether the patient has ever undergone a hemopoietic stem cell transplant at any time in the past."}  ;; "has had stem cell transplant"

;; ===================== Constraint Assertions (REQ 2) =====================
;; If the patient has had stem cell transplant, must be at least 21 days after stem cell infusion
(assert
  (! (or (not patient_has_undergone_hemopoietic_stem_cell_transplant_inthehistory)
         (>= days_since_stem_cell_infusion_value_recorded_now_in_days 21))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient has had stem cell transplant, the patient must be at least 21 days after stem cell infusion"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_clinical_status_allows_tapering_of_steroid_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical status allows tapering of steroid therapy to less than 0.5 mg/kg prednisone or less than 0.5 mg/kg other steroid equivalent.","when_to_set_to_false":"Set to false if the patient's current clinical status does not allow tapering of steroid therapy to less than 0.5 mg/kg prednisone or less than 0.5 mg/kg other steroid equivalent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current clinical status allows tapering of steroid therapy to less than 0.5 mg/kg prednisone or less than 0.5 mg/kg other steroid equivalent.","meaning":"Boolean indicating whether the patient's current clinical status allows tapering of steroid therapy to less than 0.5 mg/kg prednisone or less than 0.5 mg/kg other steroid equivalent."} ;; "clinical status must allow tapering of steroid therapy to less than 0.5 mg/kg prednisone or less than 0.5 mg/kg other steroid equivalent"
(declare-const patient_is_undergoing_administration_of_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of steroid therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing administration of steroid therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing administration of steroid therapy.","meaning":"Boolean indicating whether the patient is currently undergoing administration of steroid therapy."} ;; "steroid therapy"
(declare-const patient_prednisone_value_recorded_now_withunit_mg_per_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current dose of prednisone in mg/kg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current dose of prednisone in mg/kg."} ;; "prednisone"
(declare-const patient_steroid_value_recorded_now_withunit_mg_per_kg_equivalent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current dose of other steroid equivalents in mg/kg equivalent is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current dose of other steroid equivalents in mg/kg equivalent."} ;; "other steroid equivalent"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition in the requirement: clinical status allows tapering if either dose can be reduced below 0.5 mg/kg
(assert
  (! (= patient_clinical_status_allows_tapering_of_steroid_therapy_now
        (or (< patient_prednisone_value_recorded_now_withunit_mg_per_kg 0.5)
            (< patient_steroid_value_recorded_now_withunit_mg_per_kg_equivalent 0.5)))
     :named REQ3_AUXILIARY0)) ;; "clinical status must allow tapering of steroid therapy to less than 0.5 mg/kg prednisone or less than 0.5 mg/kg other steroid equivalent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_clinical_status_allows_tapering_of_steroid_therapy_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "clinical status must allow tapering of steroid therapy to less than 0.5 mg/kg prednisone or less than 0.5 mg/kg other steroid equivalent"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_can_undergo_infusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo infusion.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo infusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to undergo infusion.","meaning":"Boolean indicating whether the patient is currently able to undergo infusion."}  ;; "must be able to receive cytotoxic T lymphocyte infusion"
(declare-const patient_can_undergo_infusion_now@@location_cincinnati Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo infusion and the procedure is to occur in Cincinnati.","when_to_set_to_false":"Set to false if the patient is currently able to undergo infusion but the procedure is not to occur in Cincinnati.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is to occur in Cincinnati.","meaning":"Boolean indicating whether the patient is currently able to undergo infusion in Cincinnati."}  ;; "must be able to receive cytotoxic T lymphocyte infusion in Cincinnati"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_can_undergo_infusion_now@@location_cincinnati
         patient_can_undergo_infusion_now)
     :named REQ4_AUXILIARY0)) ;; "must be able to receive cytotoxic T lymphocyte infusion in Cincinnati"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Patient must be able to receive cytotoxic T lymphocyte infusion in Cincinnati
(assert
  (! patient_can_undergo_infusion_now@@location_cincinnati
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be able to receive cytotoxic T lymphocyte infusion in Cincinnati"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const informed_consent_obtained_from_patient_by_principal_investigator_by_phone Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from the patient by the principal investigator by phone.","when_to_set_to_false":"Set to false if informed consent has not been obtained from the patient by the principal investigator by phone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained from the patient by the principal investigator by phone.","meaning":"Boolean indicating whether informed consent has been obtained from the patient by the principal investigator by phone."} ;; "informed consent must be obtained from the patient by the principal investigator ... by phone"
(declare-const informed_consent_obtained_from_patient_by_principal_investigator_in_person Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from the patient by the principal investigator in person.","when_to_set_to_false":"Set to false if informed consent has not been obtained from the patient by the principal investigator in person.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained from the patient by the principal investigator in person.","meaning":"Boolean indicating whether informed consent has been obtained from the patient by the principal investigator in person."} ;; "informed consent must be obtained from the patient by the principal investigator ... in person"
(declare-const informed_consent_obtained_from_patient_by_sub_investigator_by_phone Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from the patient by the sub-investigator by phone.","when_to_set_to_false":"Set to false if informed consent has not been obtained from the patient by the sub-investigator by phone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained from the patient by the sub-investigator by phone.","meaning":"Boolean indicating whether informed consent has been obtained from the patient by the sub-investigator by phone."} ;; "informed consent must be obtained from the patient by the sub-investigator ... by phone"
(declare-const informed_consent_obtained_from_patient_by_sub_investigator_in_person Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from the patient by the sub-investigator in person.","when_to_set_to_false":"Set to false if informed consent has not been obtained from the patient by the sub-investigator in person.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained from the patient by the sub-investigator in person.","meaning":"Boolean indicating whether informed consent has been obtained from the patient by the sub-investigator in person."} ;; "informed consent must be obtained from the patient by the sub-investigator ... in person"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Informed consent must be obtained from the patient by the principal investigator OR by the sub-investigator either in person OR by phone.
(assert
  (! (or informed_consent_obtained_from_patient_by_principal_investigator_by_phone
         informed_consent_obtained_from_patient_by_principal_investigator_in_person
         informed_consent_obtained_from_patient_by_sub_investigator_by_phone
         informed_consent_obtained_from_patient_by_sub_investigator_in_person)
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "informed consent must be obtained from the patient by the principal investigator OR by the sub-investigator either in person OR by phone"
