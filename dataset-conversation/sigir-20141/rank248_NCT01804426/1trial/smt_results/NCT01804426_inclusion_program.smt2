;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 50 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 50 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 50)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 50 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_stress_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute stress disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute stress disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute stress disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute stress disorder."}  ;; "acute stress disorder"
(declare-const patient_has_diagnosis_of_acute_stress_disorder_now@@defined_by_dsm_iv_tr Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of acute stress disorder is defined according to DSM-IV-TR.","when_to_set_to_false":"Set to false if the patient's current diagnosis of acute stress disorder is not defined according to DSM-IV-TR.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of acute stress disorder is defined according to DSM-IV-TR.","meaning":"Boolean indicating whether the patient's current diagnosis of acute stress disorder is defined according to DSM-IV-TR."}  ;; "acute stress disorder defined by DSM-IV-TR"
(declare-const patient_has_experienced_traumatic_event_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently experienced a traumatic event.","when_to_set_to_false":"Set to false if the patient has not currently experienced a traumatic event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently experienced a traumatic event.","meaning":"Boolean indicating whether the patient has currently experienced a traumatic event."}  ;; "experienced a traumatic event"
(declare-const patient_has_experienced_traumatic_event_now@@fits_criterion_a1_stressor_and_criterion_a2_reaction_and_at_least_one_criterion_b_dissociative_symptom_in_acute_stress_disorder_criteria_dsm_iv_tr Bool) ;; {"when_to_set_to_true":"Set to true if the patient's currently experienced traumatic event fits criterion A1 (stressor) AND criterion A2 (reaction) AND at least one of the symptoms listed under criterion B (dissociative symptoms) in the acute stress disorder criteria as defined in DSM-IV-TR.","when_to_set_to_false":"Set to false if the patient's currently experienced traumatic event does not fit criterion A1 (stressor) AND criterion A2 (reaction) AND at least one of the symptoms listed under criterion B (dissociative symptoms) in the acute stress disorder criteria as defined in DSM-IV-TR.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's currently experienced traumatic event fits criterion A1 (stressor) AND criterion A2 (reaction) AND at least one of the symptoms listed under criterion B (dissociative symptoms) in the acute stress disorder criteria as defined in DSM-IV-TR.","meaning":"Boolean indicating whether the patient's currently experienced traumatic event fits criterion A1 (stressor) AND criterion A2 (reaction) AND at least one of the symptoms listed under criterion B (dissociative symptoms) in the acute stress disorder criteria as defined in DSM-IV-TR."}  ;; "traumatic event fits A1, A2, and at least one B in DSM-IV-TR"
(declare-const patient_has_finding_of_patient_reaction_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a reaction finding.","when_to_set_to_false":"Set to false if the patient currently does not have a reaction finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a reaction finding.","meaning":"Boolean indicating whether the patient currently has a reaction finding."}  ;; "reaction finding"
(declare-const patient_has_finding_of_patient_reaction_finding_now@@fits_criterion_a2_in_acute_stress_disorder_criteria_dsm_iv_tr Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current reaction finding fits criterion A2 in the acute stress disorder criteria as defined in DSM-IV-TR.","when_to_set_to_false":"Set to false if the patient's current reaction finding does not fit criterion A2 in the acute stress disorder criteria as defined in DSM-IV-TR.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current reaction finding fits criterion A2 in the acute stress disorder criteria as defined in DSM-IV-TR.","meaning":"Boolean indicating whether the patient's current reaction finding fits criterion A2 in the acute stress disorder criteria as defined in DSM-IV-TR."}  ;; "reaction fits criterion A2 in DSM-IV-TR"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable (traumatic event)
(assert
  (! (=> patient_has_experienced_traumatic_event_now@@fits_criterion_a1_stressor_and_criterion_a2_reaction_and_at_least_one_criterion_b_dissociative_symptom_in_acute_stress_disorder_criteria_dsm_iv_tr
         patient_has_experienced_traumatic_event_now)
     :named REQ1_AUXILIARY0)) ;; "traumatic event fits A1, A2, and at least one B in DSM-IV-TR"

;; Qualifier variable implies corresponding stem variable (reaction finding)
(assert
  (! (=> patient_has_finding_of_patient_reaction_finding_now@@fits_criterion_a2_in_acute_stress_disorder_criteria_dsm_iv_tr
         patient_has_finding_of_patient_reaction_finding_now)
     :named REQ1_AUXILIARY1)) ;; "reaction fits criterion A2 in DSM-IV-TR"

;; Qualifier variable implies corresponding stem variable (acute stress disorder diagnosis)
(assert
  (! (=> patient_has_diagnosis_of_acute_stress_disorder_now@@defined_by_dsm_iv_tr
         patient_has_diagnosis_of_acute_stress_disorder_now)
     :named REQ1_AUXILIARY2)) ;; "acute stress disorder defined by DSM-IV-TR"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have experienced a traumatic event fitting criterion A1 (stressor)
(assert
  (! patient_has_experienced_traumatic_event_now@@fits_criterion_a1_stressor_and_criterion_a2_reaction_and_at_least_one_criterion_b_dissociative_symptom_in_acute_stress_disorder_criteria_dsm_iv_tr
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "experienced a traumatic event fitting criterion A1 (stressor) AND criterion A2 (reaction) AND at least one criterion B (dissociative symptom) in DSM-IV-TR"

;; Component 1: Must have experienced a traumatic event fitting criterion A2 (reaction)
(assert
  (! patient_has_finding_of_patient_reaction_finding_now@@fits_criterion_a2_in_acute_stress_disorder_criteria_dsm_iv_tr
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "experienced a traumatic event fitting criterion A2 (reaction) in DSM-IV-TR"

;; Component 2: Must have experienced at least one of the symptoms listed under criterion B (dissociative symptoms) in DSM-IV-TR
;; This is already encoded in the traumatic event qualifier variable above, which requires at least one criterion B symptom.
;; The assertion for component 0 suffices for this component, as per the requirement structure.

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_emergency_room_admission_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone emergency room admission at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone emergency room admission at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone emergency room admission.","meaning":"Boolean indicating whether the patient has ever undergone emergency room admission in their history."}  ;; "emergency room"
(declare-const patient_has_undergone_emergency_room_admission_inthehistory@@temporalcontext_within_hours_of_traumatic_event Bool) ;; {"when_to_set_to_true":"Set to true if the patient's emergency room admission occurred within hours of the traumatic event.","when_to_set_to_false":"Set to false if the patient's emergency room admission did not occur within hours of the traumatic event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the emergency room admission occurred within hours of the traumatic event.","meaning":"Boolean indicating whether the patient's emergency room admission occurred within hours of the traumatic event."}  ;; "within hours of the traumatic event"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_emergency_room_admission_inthehistory@@temporalcontext_within_hours_of_traumatic_event
         patient_has_undergone_emergency_room_admission_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "within hours of the traumatic event" implies "emergency room admission"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have been brought to the emergency room within hours of the traumatic event.
(assert
  (! patient_has_undergone_emergency_room_admission_inthehistory@@temporalcontext_within_hours_of_traumatic_event
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "been brought to the emergency room within hours of the traumatic event"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an informed consent document.","when_to_set_to_false":"Set to false if the patient has not signed an informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed an informed consent document.","meaning":"Boolean indicating whether the patient has signed an informed consent document."}  ;; "the patient must have signed an informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have signed an informed consent"
