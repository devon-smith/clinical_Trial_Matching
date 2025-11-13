;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_mild_body_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mild body pain.","when_to_set_to_false":"Set to false if the patient currently does not have mild body pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mild body pain.","meaning":"Boolean indicating whether the patient currently has mild body pain."} // "mild body pain"
(declare-const patient_has_finding_of_moderate_body_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has moderate body pain.","when_to_set_to_false":"Set to false if the patient currently does not have moderate body pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate body pain.","meaning":"Boolean indicating whether the patient currently has moderate body pain."} // "moderate body pain"
(declare-const patient_has_finding_of_headache_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has headache.","when_to_set_to_false":"Set to false if the patient currently does not have headache.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has headache.","meaning":"Boolean indicating whether the patient currently has headache."} // "headache"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever"
(declare-const patient_has_finding_of_pain_in_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain in the throat (sore throat).","when_to_set_to_false":"Set to false if the patient currently does not have pain in the throat (sore throat).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain in the throat (sore throat).","meaning":"Boolean indicating whether the patient currently has pain in the throat (sore throat)."} // "sore throat"
(declare-const patient_has_finding_of_nasal_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nasal obstruction (blocked nose/nasal congestion).","when_to_set_to_false":"Set to false if the patient currently does not have nasal obstruction (blocked nose/nasal congestion).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nasal obstruction (blocked nose/nasal congestion).","meaning":"Boolean indicating whether the patient currently has nasal obstruction (blocked nose/nasal congestion)."} // "nasal congestion (blocked nose)"
(declare-const patient_has_finding_of_nasal_discharge_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nasal discharge (rhinorrhea/runny nose).","when_to_set_to_false":"Set to false if the patient currently does not have nasal discharge (rhinorrhea/runny nose).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nasal discharge (rhinorrhea/runny nose).","meaning":"Boolean indicating whether the patient currently has nasal discharge (rhinorrhea/runny nose)."} // "rhinorrhea (runny nose)"
(declare-const patient_has_finding_of_sneezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sneezing.","when_to_set_to_false":"Set to false if the patient currently does not have sneezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sneezing.","meaning":"Boolean indicating whether the patient currently has sneezing."} // "sneezing"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; None required for this requirement, as all relationships are direct.

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: At least one of the following: mild body pain, moderate body pain, headache, fever, or sore throat
(assert
  (! (or patient_has_finding_of_mild_body_pain_now
         patient_has_finding_of_moderate_body_pain_now
         patient_has_finding_of_headache_now
         patient_has_finding_of_fever_now
         patient_has_finding_of_pain_in_throat_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have at least one of the following: mild body pain, moderate body pain, headache, fever, or sore throat."

;; Component 1: Nasal congestion (blocked nose) with or without (rhinorrhea (runny nose) OR sneezing)
(assert
  (! (and patient_has_finding_of_nasal_obstruction_now
          (or true
              patient_has_finding_of_nasal_discharge_now
              patient_has_finding_of_sneezing_now))
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have nasal congestion (blocked nose) with or without (rhinorrhea (runny nose) OR sneezing)."
