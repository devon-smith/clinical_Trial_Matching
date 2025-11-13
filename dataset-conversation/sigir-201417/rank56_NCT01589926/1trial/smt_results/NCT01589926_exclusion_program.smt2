;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_exchange_transfusion_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an exchange transfusion at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone an exchange transfusion at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an exchange transfusion.","meaning":"Boolean indicating whether the patient has ever undergone an exchange transfusion."} ;; "exchange transfusion"
(declare-const patient_has_undergone_exchange_transfusion_inthehistory@@temporalcontext_within_24_hours_after_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an exchange transfusion and the procedure occurred within the first twenty-four hours after admission.","when_to_set_to_false":"Set to false if the patient has undergone an exchange transfusion but the procedure did not occur within the first twenty-four hours after admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exchange transfusion occurred within the first twenty-four hours after admission.","meaning":"Boolean indicating whether the exchange transfusion occurred within the first twenty-four hours after admission."} ;; "requires an exchange transfusion within the first twenty-four hours after admission"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_exchange_transfusion_inthehistory@@temporalcontext_within_24_hours_after_admission
      patient_has_undergone_exchange_transfusion_inthehistory)
:named REQ0_AUXILIARY0)) ;; "exchange transfusion within the first twenty-four hours after admission""

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_exchange_transfusion_inthehistory@@temporalcontext_within_24_hours_after_admission)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires an exchange transfusion within the first twenty-four hours after admission."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_pediatric_critical_care_unit_transfer_within_first_24_hours_after_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a transfer to a pediatric critical care unit within the first twenty-four hours after hospital admission.","when_to_set_to_false":"Set to false if the patient has not undergone a transfer to a pediatric critical care unit within the first twenty-four hours after hospital admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a transfer to a pediatric critical care unit within the first twenty-four hours after hospital admission.","meaning":"Boolean indicating whether the patient has undergone a transfer to a pediatric critical care unit within the first twenty-four hours after hospital admission."} ;; "requires a pediatric critical care unit transfer within the first twenty-four hours after admission"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_pediatric_critical_care_unit_transfer_within_first_24_hours_after_admission)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires a pediatric critical care unit transfer within the first twenty-four hours after admission."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hemoglobin_concentration_dipstick_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemoglobin concentration dipstick finding.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemoglobin concentration dipstick finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemoglobin concentration dipstick finding.","meaning":"Boolean indicating whether the patient currently has the clinical finding of hemoglobin concentration dipstick finding."} ;; "hemoglobin concentration"
(declare-const patient_has_finding_of_hemoglobin_concentration_dipstick_finding_now@@secondary_to_requiring_exchange_transfusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hemoglobin concentration dipstick finding is secondary to requiring an exchange transfusion.","when_to_set_to_false":"Set to false if the patient's current hemoglobin concentration dipstick finding is not secondary to requiring an exchange transfusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is secondary to requiring an exchange transfusion.","meaning":"Boolean indicating whether the patient's current hemoglobin concentration dipstick finding is secondary to requiring an exchange transfusion."} ;; "the hemoglobin concentration greater than nine grams per deciliter is secondary to requiring an exchange transfusion"
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin concentration in grams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current hemoglobin concentration in grams per deciliter."} ;; "hemoglobin concentration greater than nine grams per deciliter"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hemoglobin_concentration_dipstick_finding_now@@secondary_to_requiring_exchange_transfusion
      patient_has_finding_of_hemoglobin_concentration_dipstick_finding_now)
    :named REQ2_AUXILIARY0)) ;; "the hemoglobin concentration greater than nine grams per deciliter is secondary to requiring an exchange transfusion"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient has a hemoglobin concentration > 9 g/dL AND this is secondary to requiring an exchange transfusion
(assert
(! (not (and
          (> patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter 9)
          patient_has_finding_of_hemoglobin_concentration_dipstick_finding_now@@secondary_to_requiring_exchange_transfusion))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a hemoglobin concentration greater than nine grams per deciliter) AND (the hemoglobin concentration greater than nine grams per deciliter is secondary to requiring an exchange transfusion)."
