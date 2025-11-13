;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_arrived_at_emergency_department Bool) ;; {"when_to_set_to_true":"Set to true if the patient has arrived at the emergency department.","when_to_set_to_false":"Set to false if the patient has not arrived at the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has arrived at the emergency department.","meaning":"Boolean indicating whether the patient has arrived at the emergency department."} ;; "arrives at the emergency department"

(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a chest x-ray procedure at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never undergone a chest x-ray procedure at any time prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a chest x-ray procedure at any time prior to now.","meaning":"Boolean indicating whether the patient has ever undergone a chest x-ray procedure at any time in the past."} ;; "chest x-ray"

(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_prior_to_arrival_at_emergency_department Bool) ;; {"when_to_set_to_true":"Set to true if the chest x-ray procedure was performed prior to the patient's arrival at the emergency department.","when_to_set_to_false":"Set to false if the chest x-ray procedure was not performed prior to the patient's arrival at the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest x-ray procedure was performed prior to the patient's arrival at the emergency department.","meaning":"Boolean indicating whether the chest x-ray procedure was performed prior to the patient's arrival at the emergency department."} ;; "chest x-ray performed prior to arrival at the emergency department"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies base variable
(assert
(! (=> patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_prior_to_arrival_at_emergency_department
      patient_has_undergone_plain_chest_x_ray_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "chest x-ray performed prior to arrival at the emergency department" implies "chest x-ray ever"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_arrived_at_emergency_department
             patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_prior_to_arrival_at_emergency_department))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient arrives at the emergency department AND the patient has had a chest x-ray performed prior to arrival at the emergency department."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has traumatic and/or non-traumatic injury.","when_to_set_to_false":"Set to false if the patient currently does not have traumatic and/or non-traumatic injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has traumatic and/or non-traumatic injury.","meaning":"Boolean indicating whether the patient currently has traumatic and/or non-traumatic injury."} ;; "injury"
(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now@@life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current traumatic and/or non-traumatic injury is life-threatening.","when_to_set_to_false":"Set to false if the patient's current traumatic and/or non-traumatic injury is not life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the injury is life-threatening.","meaning":"Boolean indicating whether the patient's current traumatic and/or non-traumatic injury is life-threatening."} ;; "life-threatening injury"
(declare-const patient_is_undergoing_resuscitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing resuscitation.","when_to_set_to_false":"Set to false if the patient is currently not undergoing resuscitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing resuscitation.","meaning":"Boolean indicating whether the patient is currently undergoing resuscitation."} ;; "requires ongoing resuscitation"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now@@life_threatening
      patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now)
:named REQ1_AUXILIARY0)) ;; "life-threatening injury" implies "injury"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is unstable with life-threatening injury AND requires ongoing resuscitation
(assert
(! (not (and patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now@@life_threatening
             patient_is_undergoing_resuscitation_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unstable with life-threatening injury AND the patient requires ongoing resuscitation."
