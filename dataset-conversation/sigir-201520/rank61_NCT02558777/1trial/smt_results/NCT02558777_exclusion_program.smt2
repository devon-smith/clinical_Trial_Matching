;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_agony_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in an agonic situation (state of agony).","when_to_set_to_false":"Set to false if the patient is currently not in an agonic situation (state of agony).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in an agonic situation.","meaning":"Boolean indicating whether the patient is currently in an agonic situation (state of agony)."} ;; "agonic situation"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_agony_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is in an agonic situation."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_inability_to_speak_spanish_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to speak Spanish.","when_to_set_to_false":"Set to false if the patient currently does not have inability to speak Spanish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to speak Spanish.","meaning":"Boolean indicating whether the patient currently has inability to speak Spanish."} ;; "inability to speak Spanish"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_inability_to_speak_spanish_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to speak Spanish."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_severe_cognitive_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe cognitive impairment.","meaning":"Boolean indicating whether the patient currently has severe cognitive impairment."} ;; "severe cognitive decline"
(declare-const reisberg_global_deterioration_scale_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's current Reisberg's Global Deterioration Scale score if it is documented.","when_to_set_to_null":"Set to null if the patient's current Reisberg's Global Deterioration Scale score is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current Reisberg's Global Deterioration Scale score as an integer."} ;; "Reisberg's Global Deterioration Scale = 7"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: severe cognitive decline is equivalent to Reisberg's Global Deterioration Scale = 7
(assert
(! (= patient_has_finding_of_severe_cognitive_impairment_now
       (= reisberg_global_deterioration_scale_value_recorded_now_withunit_integer 7))
   :named REQ2_AUXILIARY0)) ;; "severe cognitive decline (Reisberg's Global Deterioration Scale = 7)."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_severe_cognitive_impairment_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe cognitive decline (Reisberg's Global Deterioration Scale = 7)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_previously_included_participant Bool) ;; {"when_to_set_to_true":"Set to true if the patient has already been included as a participant in the study.","when_to_set_to_false":"Set to false if the patient has not already been included as a participant in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has already been included as a participant in the study.","meaning":"Boolean indicating whether the patient is a previously included participant."} ;; "previously included participant"
(declare-const patient_shares_room_with_previously_included_participant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently shares the same room with a previously included participant.","when_to_set_to_false":"Set to false if the patient currently does not share the same room with any previously included participant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently shares the same room with a previously included participant.","meaning":"Boolean indicating whether the patient currently shares the same room with a previously included participant."} ;; "shares the same room with a previously included participant"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_shares_room_with_previously_included_participant_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient shares the same room with a previously included participant."
