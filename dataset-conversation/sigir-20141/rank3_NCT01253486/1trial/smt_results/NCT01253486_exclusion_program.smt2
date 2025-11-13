;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_visual_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has visual impairment (visual limitations).","when_to_set_to_false":"Set to false if the patient currently does not have visual impairment (visual limitations).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has visual impairment (visual limitations).","meaning":"Boolean indicating whether the patient currently has visual impairment."} ;; "visual limitations"

(declare-const patient_has_finding_of_poor_manual_dexterity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor manual dexterity (manual limitations).","when_to_set_to_false":"Set to false if the patient currently does not have poor manual dexterity (manual limitations).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor manual dexterity (manual limitations).","meaning":"Boolean indicating whether the patient currently has poor manual dexterity."} ;; "manual limitations"

(declare-const patient_has_finding_of_poor_manual_dexterity_now@@precludes_reading_and_writing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's poor manual dexterity precludes both reading and writing.","when_to_set_to_false":"Set to false if the patient's poor manual dexterity does not preclude both reading and writing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's poor manual dexterity precludes both reading and writing.","meaning":"Boolean indicating whether the patient's poor manual dexterity precludes both reading and writing."} ;; "manual limitations that preclude reading AND preclude writing"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_poor_manual_dexterity_now@@precludes_reading_and_writing
     patient_has_finding_of_poor_manual_dexterity_now)
:named REQ0_AUXILIARY0)) ;; "manual limitations that preclude reading AND preclude writing"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_has_finding_of_visual_impairment_now
            patient_has_finding_of_poor_manual_dexterity_now@@precludes_reading_and_writing))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has visual limitations) OR (the patient has manual limitations that preclude reading AND preclude writing))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_unwilling_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses unwillingness to participate in the study.","when_to_set_to_false":"Set to false if the patient expresses willingness to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to participate in the study.","meaning":"Boolean indicating whether the patient is unwilling to participate in the study."} ;; "The patient is excluded if the patient is unwilling to participate."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_unwilling_to_participate)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unwilling to participate."
