;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dementia is severe.","when_to_set_to_false":"Set to false if the patient's current dementia is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dementia is severe.","meaning":"Boolean indicating whether the patient's current dementia is severe."} ;; "severe dementia"
(declare-const patient_has_finding_of_severe_compromise_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe compromise.","when_to_set_to_false":"Set to false if the patient currently does not have severe compromise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe compromise.","meaning":"Boolean indicating whether the patient currently has severe compromise."} ;; "severe compromise"
(declare-const patient_has_finding_of_severe_compromise_now@@and_patient_does_not_have_sufficient_cognitive_ability_to_follow_directions Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe compromise and does not have sufficient cognitive ability to follow directions.","when_to_set_to_false":"Set to false if the patient currently has severe compromise and does have sufficient cognitive ability to follow directions, or does not have severe compromise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe compromise and does not have sufficient cognitive ability to follow directions.","meaning":"Boolean indicating whether the patient currently has severe compromise and does not have sufficient cognitive ability to follow directions."} ;; "severe compromise AND the patient does not have sufficient cognitive ability to follow directions"
(declare-const patients_ability_to_perform_cognitive_activity_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cognitive ability (i.e., the ability to perform cognitive activity).","when_to_set_to_false":"Set to false if the patient currently does not have cognitive ability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cognitive ability.","meaning":"Boolean indicating whether the patient currently has cognitive ability."} ;; "cognitive ability"
(declare-const patients_ability_to_perform_cognitive_activity_is_positive_now@@sufficient Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cognitive ability is sufficient.","when_to_set_to_false":"Set to false if the patient's current cognitive ability is not sufficient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cognitive ability is sufficient.","meaning":"Boolean indicating whether the patient's current cognitive ability is sufficient."} ;; "sufficient cognitive ability"
(declare-const patients_ability_to_perform_cognitive_activity_is_positive_now@@to_follow_directions Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cognitive ability is specifically sufficient to follow directions.","when_to_set_to_false":"Set to false if the patient's current cognitive ability is not sufficient to follow directions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cognitive ability is sufficient to follow directions.","meaning":"Boolean indicating whether the patient's current cognitive ability is sufficient to follow directions."} ;; "sufficient cognitive ability to follow directions"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable for dementia
(assert
(! (=> patient_has_finding_of_dementia_now@@severe
       patient_has_finding_of_dementia_now)
   :named REQ0_AUXILIARY0)) ;; "severe dementia" implies "dementia"

;; Qualifier variable implies corresponding stem variable for severe compromise
(assert
(! (=> patient_has_finding_of_severe_compromise_now@@and_patient_does_not_have_sufficient_cognitive_ability_to_follow_directions
       patient_has_finding_of_severe_compromise_now)
   :named REQ0_AUXILIARY1)) ;; "severe compromise AND does not have sufficient cognitive ability to follow directions" implies "severe compromise"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion if patient has severe dementia
(assert
(! (not patient_has_finding_of_dementia_now@@severe)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dementia."

;; Exclusion if patient has severe compromise AND does not have sufficient cognitive ability to follow directions
(assert
(! (not patient_has_finding_of_severe_compromise_now@@and_patient_does_not_have_sufficient_cognitive_ability_to_follow_directions)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe compromise AND the patient does not have sufficient cognitive ability to follow directions."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_does_not_walk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently non-ambulatory (does not walk).","when_to_set_to_false":"Set to false if the patient is currently ambulatory (does walk).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently non-ambulatory.","meaning":"Boolean indicating whether the patient is currently non-ambulatory (does not walk)."} ;; "non-ambulatory"
(declare-const patient_cannot_be_braced_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently cannot be braced.","when_to_set_to_false":"Set to false if the patient currently can be braced.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently cannot be braced.","meaning":"Boolean indicating whether the patient currently cannot be braced."} ;; "the patient cannot be braced"
(declare-const patient_cannot_be_supported_within_fluoroscopy_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently cannot be supported within the fluoroscopy unit.","when_to_set_to_false":"Set to false if the patient currently can be supported within the fluoroscopy unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently cannot be supported within the fluoroscopy unit.","meaning":"Boolean indicating whether the patient currently cannot be supported within the fluoroscopy unit."} ;; "the patient cannot be supported within the fluoroscopy unit"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_has_finding_of_does_not_walk_now
             (or patient_cannot_be_braced_now
                 patient_cannot_be_supported_within_fluoroscopy_unit_now)))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is non-ambulatory AND (the patient cannot be braced OR the patient cannot be supported within the fluoroscopy unit))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_feeling_agitated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of agitation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of agitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has agitation.","meaning":"Boolean indicating whether the patient currently has agitation."} ;; "agitation"
(declare-const patient_has_finding_of_feeling_agitated_now@@agitation_is_high Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has agitation and the agitation is high.","when_to_set_to_false":"Set to false if the patient currently has agitation but the agitation is not high, or does not have agitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's agitation is high.","meaning":"Boolean indicating whether the patient currently has agitation and the agitation is high."} ;; "high agitation"
(declare-const patient_is_able_to_remain_confined_in_equipment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to remain confined in the equipment.","when_to_set_to_false":"Set to false if the patient is currently unable to remain confined in the equipment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to remain confined in the equipment.","meaning":"Boolean indicating whether the patient is currently able to remain confined in the equipment."} ;; "able to remain confined in the equipment"
(declare-const patient_is_able_to_remain_confined_in_equipment_now@@confined_occurs_in_equipment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ability to remain confined specifically refers to confinement in the equipment.","when_to_set_to_false":"Set to false if the patient's ability to remain confined does not refer to confinement in the equipment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ability to remain confined refers to confinement in the equipment.","meaning":"Boolean indicating whether the patient's ability to remain confined specifically refers to confinement in the equipment."} ;; "confinement occurs in the equipment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for high agitation implies agitation
(assert
(! (=> patient_has_finding_of_feeling_agitated_now@@agitation_is_high
       patient_has_finding_of_feeling_agitated_now)
   :named REQ2_AUXILIARY0)) ;; "high agitation"

;; Qualifier variable for confinement in equipment implies ability to remain confined in equipment
(assert
(! (=> patient_is_able_to_remain_confined_in_equipment_now@@confined_occurs_in_equipment
       patient_is_able_to_remain_confined_in_equipment_now)
   :named REQ2_AUXILIARY1)) ;; "confinement occurs in the equipment"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient has high agitation AND is unable to remain confined in the equipment
(assert
(! (not (and patient_has_finding_of_feeling_agitated_now@@agitation_is_high
             (not patient_is_able_to_remain_confined_in_equipment_now@@confined_occurs_in_equipment)))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has high agitation AND the patient is unable to remain confined in the equipment)."
