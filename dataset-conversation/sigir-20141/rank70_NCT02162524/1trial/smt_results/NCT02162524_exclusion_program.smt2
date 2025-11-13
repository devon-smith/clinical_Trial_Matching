;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diagnosis of diabetes mellitus"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now@@diagnosed_by_self_report Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of diabetes mellitus is made by self report.","when_to_set_to_false":"Set to false if the patient's diagnosis of diabetes mellitus is not made by self report.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of diabetes mellitus is made by self report.","meaning":"Boolean indicating whether the diagnosis of diabetes mellitus is made by self report."} ;; "diagnosis (by self report) of diabetes mellitus"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_diabetes_mellitus_now@@diagnosed_by_self_report
      patient_has_diagnosis_of_diabetes_mellitus_now)
   :named REQ0_AUXILIARY0)) ;; "diagnosis (by self report) of diabetes mellitus"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now@@diagnosed_by_self_report)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis (by self report) of diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the nervous system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the nervous system."} ;; "neurological condition"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now@@diagnosed_by_self_report Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of a disorder of the nervous system is made by self report.","when_to_set_to_false":"Set to false if the patient's diagnosis of a disorder of the nervous system is not made by self report.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is made by self report.","meaning":"Boolean indicating whether the patient's diagnosis of a disorder of the nervous system is made by self report."} ;; "diagnosis (by self report) of a neurological condition"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_now@@diagnosed_by_self_report
      patient_has_diagnosis_of_disorder_of_nervous_system_now)
   :named REQ1_AUXILIARY0)) ;; "diagnosis (by self report) of a neurological condition"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_nervous_system_now@@diagnosed_by_self_report)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis (by self report) of a neurological condition."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "the patient has a current alcohol abuse problem"
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol abuse (at any time in the past).","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse."} ;; "the patient has a past alcohol abuse problem"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has drug misuse/abuse behavior.","when_to_set_to_false":"Set to false if the patient currently does not have drug misuse/abuse behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has drug misuse/abuse behavior.","meaning":"Boolean indicating whether the patient currently has drug misuse/abuse behavior."} ;; "the patient has a current drug abuse problem"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of drug misuse/abuse behavior (at any time in the past).","when_to_set_to_false":"Set to false if the patient does not have a documented history of drug misuse/abuse behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug misuse/abuse behavior.","meaning":"Boolean indicating whether the patient has a history of drug misuse/abuse behavior."} ;; "the patient has a past drug abuse problem"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (or patient_has_finding_of_alcohol_abuse_now
              patient_has_finding_of_alcohol_abuse_inthehistory
              patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now
              patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a current alcohol abuse problem) OR (the patient has a past alcohol abuse problem) OR (the patient has a current drug abuse problem) OR (the patient has a past drug abuse problem))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently engaging in tobacco smoking behavior.","when_to_set_to_false":"Set to false if the patient is currently not engaging in tobacco smoking behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently engaging in tobacco smoking behavior.","meaning":"Boolean indicating whether the patient is currently engaging in tobacco smoking behavior."} ;; "smoking tobacco"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_tobacco_smoking_behavior_finding_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently smoking tobacco."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_internal_metal_medical_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any internal metal medical device, including but not limited to the listed examples.","when_to_set_to_false":"Set to false if the patient currently does not have any internal metal medical device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any internal metal medical device.","meaning":"Boolean indicating whether the patient currently has any internal metal medical device, including but not limited to the listed examples."} ;; "internal metal medical device with non-exhaustive examples ((cardiac pacemaker) OR (aortic aneurysm clip) OR (cerebral aneurysm clip) OR (artificial heart valve) OR (ferromagnetic implant) OR (shrapnel) OR (wire suture) OR (joint replacement) OR (bone pin) OR (bone rod) OR (bone screw) OR (bone clip) OR (joint pin) OR (joint rod) OR (joint screw) OR (joint clip) OR (metal plate) OR (metal fragment in the eye) OR (non-removable metal jewelry such as a ring))"

(declare-const patient_has_finding_of_metal_foreign_body_in_eye_region_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a metal foreign body in the eye region.","when_to_set_to_false":"Set to false if the patient currently does not have a metal foreign body in the eye region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a metal foreign body in the eye region.","meaning":"Boolean indicating whether the patient currently has a metal foreign body in the eye region."} ;; "metal fragment in the eye"

(declare-const patient_has_finding_of_cardiac_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac pacemaker.","meaning":"Boolean indicating whether the patient currently has a cardiac pacemaker."} ;; "cardiac pacemaker"

(declare-const patient_has_finding_of_aortic_aneurysm_clip_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an aortic aneurysm clip.","when_to_set_to_false":"Set to false if the patient currently does not have an aortic aneurysm clip.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an aortic aneurysm clip.","meaning":"Boolean indicating whether the patient currently has an aortic aneurysm clip."} ;; "aortic aneurysm clip"

(declare-const patient_has_finding_of_cerebral_aneurysm_clip_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cerebral aneurysm clip.","when_to_set_to_false":"Set to false if the patient currently does not have a cerebral aneurysm clip.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cerebral aneurysm clip.","meaning":"Boolean indicating whether the patient currently has a cerebral aneurysm clip."} ;; "cerebral aneurysm clip"

(declare-const patient_has_finding_of_artificial_heart_valve_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an artificial heart valve.","when_to_set_to_false":"Set to false if the patient currently does not have an artificial heart valve.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an artificial heart valve.","meaning":"Boolean indicating whether the patient currently has an artificial heart valve."} ;; "artificial heart valve"

(declare-const patient_has_finding_of_ferromagnetic_implant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a ferromagnetic implant.","when_to_set_to_false":"Set to false if the patient currently does not have a ferromagnetic implant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a ferromagnetic implant.","meaning":"Boolean indicating whether the patient currently has a ferromagnetic implant."} ;; "ferromagnetic implant"

(declare-const patient_has_finding_of_shrapnel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shrapnel.","when_to_set_to_false":"Set to false if the patient currently does not have shrapnel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has shrapnel.","meaning":"Boolean indicating whether the patient currently has shrapnel."} ;; "shrapnel"

(declare-const patient_has_finding_of_wire_suture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a wire suture.","when_to_set_to_false":"Set to false if the patient currently does not have a wire suture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a wire suture.","meaning":"Boolean indicating whether the patient currently has a wire suture."} ;; "wire suture"

(declare-const patient_has_finding_of_joint_replacement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a joint replacement.","when_to_set_to_false":"Set to false if the patient currently does not have a joint replacement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a joint replacement.","meaning":"Boolean indicating whether the patient currently has a joint replacement."} ;; "joint replacement"

(declare-const patient_has_finding_of_bone_pin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bone pin.","when_to_set_to_false":"Set to false if the patient currently does not have a bone pin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a bone pin.","meaning":"Boolean indicating whether the patient currently has a bone pin."} ;; "bone pin"

(declare-const patient_has_finding_of_bone_rod_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bone rod.","when_to_set_to_false":"Set to false if the patient currently does not have a bone rod.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a bone rod.","meaning":"Boolean indicating whether the patient currently has a bone rod."} ;; "bone rod"

(declare-const patient_has_finding_of_bone_screw_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bone screw.","when_to_set_to_false":"Set to false if the patient currently does not have a bone screw.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a bone screw.","meaning":"Boolean indicating whether the patient currently has a bone screw."} ;; "bone screw"

(declare-const patient_has_finding_of_bone_clip_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bone clip.","when_to_set_to_false":"Set to false if the patient currently does not have a bone clip.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a bone clip.","meaning":"Boolean indicating whether the patient currently has a bone clip."} ;; "bone clip"

(declare-const patient_has_finding_of_joint_pin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a joint pin.","when_to_set_to_false":"Set to false if the patient currently does not have a joint pin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a joint pin.","meaning":"Boolean indicating whether the patient currently has a joint pin."} ;; "joint pin"

(declare-const patient_has_finding_of_joint_rod_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a joint rod.","when_to_set_to_false":"Set to false if the patient currently does not have a joint rod.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a joint rod.","meaning":"Boolean indicating whether the patient currently has a joint rod."} ;; "joint rod"

(declare-const patient_has_finding_of_joint_screw_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a joint screw.","when_to_set_to_false":"Set to false if the patient currently does not have a joint screw.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a joint screw.","meaning":"Boolean indicating whether the patient currently has a joint screw."} ;; "joint screw"

(declare-const patient_has_finding_of_joint_clip_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a joint clip.","when_to_set_to_false":"Set to false if the patient currently does not have a joint clip.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a joint clip.","meaning":"Boolean indicating whether the patient currently has a joint clip."} ;; "joint clip"

(declare-const patient_has_finding_of_metal_plate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a metal plate.","when_to_set_to_false":"Set to false if the patient currently does not have a metal plate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a metal plate.","meaning":"Boolean indicating whether the patient currently has a metal plate."} ;; "metal plate"

(declare-const patient_has_finding_of_nonremovable_metal_jewelry_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has non-removable metal jewelry.","when_to_set_to_false":"Set to false if the patient currently does not have non-removable metal jewelry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has non-removable metal jewelry.","meaning":"Boolean indicating whether the patient currently has non-removable metal jewelry."} ;; "non-removable metal jewelry such as a ring"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_cardiac_pacemaker_now
           patient_has_finding_of_aortic_aneurysm_clip_now
           patient_has_finding_of_cerebral_aneurysm_clip_now
           patient_has_finding_of_artificial_heart_valve_now
           patient_has_finding_of_ferromagnetic_implant_now
           patient_has_finding_of_shrapnel_now
           patient_has_finding_of_wire_suture_now
           patient_has_finding_of_joint_replacement_now
           patient_has_finding_of_bone_pin_now
           patient_has_finding_of_bone_rod_now
           patient_has_finding_of_bone_screw_now
           patient_has_finding_of_bone_clip_now
           patient_has_finding_of_joint_pin_now
           patient_has_finding_of_joint_rod_now
           patient_has_finding_of_joint_screw_now
           patient_has_finding_of_joint_clip_now
           patient_has_finding_of_metal_plate_now
           patient_has_finding_of_metal_foreign_body_in_eye_region_now
           patient_has_finding_of_nonremovable_metal_jewelry_now)
    patient_has_internal_metal_medical_device_now)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples ((cardiac pacemaker) OR (aortic aneurysm clip) OR (cerebral aneurysm clip) OR (artificial heart valve) OR (ferromagnetic implant) OR (shrapnel) OR (wire suture) OR (joint replacement) OR (bone pin) OR (bone rod) OR (bone screw) OR (bone clip) OR (joint pin) OR (joint rod) OR (joint screw) OR (joint clip) OR (metal plate) OR (metal fragment in the eye) OR (non-removable metal jewelry such as a ring))"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_internal_metal_medical_device_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an internal metal medical device with non-exhaustive examples ((cardiac pacemaker) OR (aortic aneurysm clip) OR (cerebral aneurysm clip) OR (artificial heart valve) OR (ferromagnetic implant) OR (shrapnel) OR (wire suture) OR (joint replacement) OR (bone pin) OR (bone rod) OR (bone screw) OR (bone clip) OR (joint pin) OR (joint rod) OR (joint screw) OR (joint clip) OR (metal plate) OR (metal fragment in the eye) OR (non-removable metal jewelry such as a ring))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_can_undergo_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo a magnetic resonance imaging scan.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo a magnetic resonance imaging scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a magnetic resonance imaging scan.","meaning":"Boolean indicating whether the patient can currently undergo a magnetic resonance imaging scan."} ;; "magnetic resonance imaging scan"
(declare-const patient_is_unable_to_complete_imaging_procedure_for_duration_of_magnetic_resonance_imaging_scan_due_to_another_reason Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to a reason other than claustrophobia.","when_to_set_to_false":"Set to false if the patient is able to complete the imaging procedure for the duration of the magnetic resonance imaging scan or if inability is not due to another reason.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to another reason.","meaning":"Boolean indicating whether the patient is unable to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to a reason other than claustrophobia."} ;; "unable to complete...due to another reason"
(declare-const patient_is_unable_to_complete_imaging_procedure_for_duration_of_magnetic_resonance_imaging_scan_due_to_claustrophobia Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to claustrophobia.","when_to_set_to_false":"Set to false if the patient is able to complete the imaging procedure for the duration of the magnetic resonance imaging scan or if inability is not due to claustrophobia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to claustrophobia.","meaning":"Boolean indicating whether the patient is unable to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to claustrophobia."} ;; "unable to complete...due to claustrophobia"
(declare-const patient_is_unwilling_to_complete_imaging_procedure_for_duration_of_magnetic_resonance_imaging_scan_due_to_another_reason Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to a reason other than claustrophobia.","when_to_set_to_false":"Set to false if the patient is willing to complete the imaging procedure for the duration of the magnetic resonance imaging scan or if unwillingness is not due to another reason.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to another reason.","meaning":"Boolean indicating whether the patient is unwilling to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to a reason other than claustrophobia."} ;; "unwilling to complete...due to another reason"
(declare-const patient_is_unwilling_to_complete_imaging_procedure_for_duration_of_magnetic_resonance_imaging_scan_due_to_claustrophobia Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to claustrophobia.","when_to_set_to_false":"Set to false if the patient is willing to complete the imaging procedure for the duration of the magnetic resonance imaging scan or if unwillingness is not due to claustrophobia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to claustrophobia.","meaning":"Boolean indicating whether the patient is unwilling to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to claustrophobia."} ;; "unwilling to complete...due to claustrophobia"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_unable_to_complete_imaging_procedure_for_duration_of_magnetic_resonance_imaging_scan_due_to_claustrophobia)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "unable to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to claustrophobia"

(assert
(! (not patient_is_unable_to_complete_imaging_procedure_for_duration_of_magnetic_resonance_imaging_scan_due_to_another_reason)
:named REQ5_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "unable to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to another reason"

(assert
(! (not patient_is_unwilling_to_complete_imaging_procedure_for_duration_of_magnetic_resonance_imaging_scan_due_to_claustrophobia)
:named REQ5_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "unwilling to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to claustrophobia"

(assert
(! (not patient_is_unwilling_to_complete_imaging_procedure_for_duration_of_magnetic_resonance_imaging_scan_due_to_another_reason)
:named REQ5_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "unwilling to complete the imaging procedure for the duration of the magnetic resonance imaging scan due to another reason"
