;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has community-acquired pneumonia."}  ;; "To be included, the patient must have presumed community-acquired pneumonia (as diagnosed by the attending emergency department physician)."
(declare-const patient_has_finding_of_community_acquired_pneumonia_now@@diagnosed_by_attending_emergency_department_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient's community-acquired pneumonia diagnosis was made by the attending emergency department physician.","when_to_set_to_false":"Set to false if the patient's community-acquired pneumonia diagnosis was not made by the attending emergency department physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the attending emergency department physician made the diagnosis.","meaning":"Boolean indicating whether the patient's community-acquired pneumonia diagnosis was made by the attending emergency department physician."}  ;; "as diagnosed by the attending emergency department physician"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_community_acquired_pneumonia_now@@diagnosed_by_attending_emergency_department_physician
         patient_has_finding_of_community_acquired_pneumonia_now)
     :named REQ0_AUXILIARY0)) ;; "as diagnosed by the attending emergency department physician" implies "community-acquired pneumonia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_community_acquired_pneumonia_now@@diagnosed_by_attending_emergency_department_physician
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have presumed community-acquired pneumonia (as diagnosed by the attending emergency department physician)."
