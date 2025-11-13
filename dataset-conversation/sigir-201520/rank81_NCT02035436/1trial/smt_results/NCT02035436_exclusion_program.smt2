;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_major_head_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a major head injury (severe head trauma).","when_to_set_to_false":"Set to false if the patient currently does not have a major head injury (severe head trauma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a major head injury (severe head trauma).","meaning":"Boolean indicating whether the patient currently has a major head injury."} ;; "severe head trauma"
(declare-const patient_has_finding_of_coma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coma.","when_to_set_to_false":"Set to false if the patient currently does not have coma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coma.","meaning":"Boolean indicating whether the patient currently has coma."} ;; "coma"
(declare-const patient_has_finding_of_coma_now@@therapeutic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coma and the coma is therapeutic.","when_to_set_to_false":"Set to false if the patient currently has coma and the coma is not therapeutic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coma is therapeutic.","meaning":"Boolean indicating whether the patient's current coma is therapeutic."} ;; "therapeutic coma is indicated"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_coma_now@@therapeutic
       patient_has_finding_of_coma_now)
   :named REQ0_AUXILIARY0)) ;; "therapeutic coma is indicated"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_finding_of_major_head_injury_now
             patient_has_finding_of_coma_now@@therapeutic))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe head trauma AND therapeutic coma is indicated."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_induction_of_hypothermia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing induction of hypothermia (therapeutic hypothermia) as a procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing induction of hypothermia (therapeutic hypothermia) as a procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing induction of hypothermia.","meaning":"Boolean indicating whether the patient is currently undergoing induction of hypothermia (therapeutic hypothermia) as a procedure."} ;; "therapeutic hypothermia"

;; patient_has_finding_of_coma_now@@therapeutic is already declared and reused
;; {"when_to_set_to_true":"Set to true if the patient currently has coma and the coma is therapeutic.","when_to_set_to_false":"Set to false if the patient currently has coma and the coma is not therapeutic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coma is therapeutic.","meaning":"Boolean indicating whether the patient's current coma is therapeutic."} ;; "therapeutic coma is indicated"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_is_undergoing_induction_of_hypothermia_now
             patient_has_finding_of_coma_now@@therapeutic))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has therapeutic hypothermia AND therapeutic coma is indicated."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_status_epilepticus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of status epilepticus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of status epilepticus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has status epilepticus.","meaning":"Boolean indicating whether the patient currently has status epilepticus."} ;; "status epilepticus"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_has_finding_of_status_epilepticus_now
             patient_has_finding_of_coma_now@@therapeutic))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has status epilepticus AND therapeutic coma is indicated."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_participated_in_study_before Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in the study.","when_to_set_to_false":"Set to false if the patient has never participated in the study before.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in the study.","meaning":"Boolean indicating whether the patient has previously participated in the study."} ;; "The patient is excluded if the patient has participated in the study before."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_participated_in_study_before)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in the study before."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_transferred_from_another_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently transferred from another intensive care unit.","when_to_set_to_false":"Set to false if the patient is not currently transferred from another intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently transferred from another intensive care unit.","meaning":"Boolean indicating whether the patient is currently transferred from another intensive care unit."} ;; "the patient is transferred from another intensive care unit"
(declare-const length_of_stay_in_other_intensive_care_unit_value_recorded_prior_to_transfer_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient stayed in the other intensive care unit prior to transfer.","when_to_set_to_null":"Set to null if the length of stay in the other intensive care unit prior to transfer is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the length of stay, in hours, in the other intensive care unit prior to transfer."} ;; "the length of stay in the other intensive care unit > 48 hours"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_is_transferred_from_another_intensive_care_unit_now
             (> length_of_stay_in_other_intensive_care_unit_value_recorded_prior_to_transfer_withunit_hours 48)))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is transferred from another intensive care unit) AND (the length of stay in the other intensive care unit > 48 hours)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_coma_now@@present_at_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coma is present at the time of admission.","when_to_set_to_false":"Set to false if the patient's coma is not present at the time of admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coma is present at admission.","meaning":"Boolean indicating whether the patient's coma is present at admission."} ;; "coma at admission"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_coma_now@@present_at_admission
      patient_has_finding_of_coma_now)
   :named REQ5_AUXILIARY0)) ;; "coma at admission" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_coma_now@@present_at_admission)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coma at admission."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_undergoing_sedation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing sedation.","when_to_set_to_false":"Set to false if the patient is currently not undergoing sedation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing sedation.","meaning":"Boolean indicating whether the patient is currently undergoing sedation."} ;; "sedation"
(declare-const patient_is_undergoing_sedation_now@@necessary_for_oxygenation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing sedation and the sedation is necessary for oxygenation.","when_to_set_to_false":"Set to false if the patient is currently undergoing sedation but it is not necessary for oxygenation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether sedation is necessary for oxygenation.","meaning":"Boolean indicating whether the patient's current sedation is necessary for oxygenation."} ;; "sedation is necessary for oxygenation"
(declare-const patient_ratio_of_arterial_oxygen_tension_to_inspired_oxygen_fraction_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current ratio of arterial oxygen tension to inspired oxygen fraction is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ratio of arterial oxygen tension to inspired oxygen fraction."} ;; "partial pressure of oxygen in arterial blood to fraction of inspired oxygen ratio ≤ 9"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_sedation_now@@necessary_for_oxygenation
      patient_is_undergoing_sedation_now)
:named REQ6_AUXILIARY0)) ;; "sedation is necessary for oxygenation"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT satisfy BOTH (ratio ≤ 9) AND (sedation necessary for oxygenation)
(assert
(! (not (and (<= patient_ratio_of_arterial_oxygen_tension_to_inspired_oxygen_fraction_value_recorded_now_withunit_ratio 9)
             patient_is_undergoing_sedation_now@@necessary_for_oxygenation))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has partial pressure of oxygen in arterial blood to fraction of inspired oxygen ratio ≤ 9) AND (sedation is necessary for oxygenation)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_speaks_danish_language_at_reasonable_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently speaks Danish language at a reasonable level.","when_to_set_to_false":"Set to false if the patient currently does not speak Danish language at a reasonable level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently speaks Danish language at a reasonable level.","meaning":"Boolean indicating whether the patient currently speaks Danish language at a reasonable level."} ;; "does NOT speak Danish language at a reasonable level"
(declare-const patient_speaks_swedish_language_at_reasonable_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently speaks Swedish language at a reasonable level.","when_to_set_to_false":"Set to false if the patient currently does not speak Swedish language at a reasonable level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently speaks Swedish language at a reasonable level.","meaning":"Boolean indicating whether the patient currently speaks Swedish language at a reasonable level."} ;; "does NOT speak Swedish language at a reasonable level"
(declare-const patient_speaks_norwegian_language_at_reasonable_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently speaks Norwegian language at a reasonable level.","when_to_set_to_false":"Set to false if the patient currently does not speak Norwegian language at a reasonable level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently speaks Norwegian language at a reasonable level.","meaning":"Boolean indicating whether the patient currently speaks Norwegian language at a reasonable level."} ;; "does NOT speak Norwegian language at a reasonable level"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT lack all three languages at a reasonable level
(assert
(! (not (and (not patient_speaks_danish_language_at_reasonable_level_now)
             (not patient_speaks_swedish_language_at_reasonable_level_now)
             (not patient_speaks_norwegian_language_at_reasonable_level_now)))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT speak Danish language at a reasonable level AND the patient does NOT speak Swedish language at a reasonable level AND the patient does NOT speak Norwegian language at a reasonable level."
