;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone magnetic resonance imaging (MRI).","when_to_set_to_false":"Set to false if the patient has not currently undergone magnetic resonance imaging (MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient has currently undergone magnetic resonance imaging (MRI)."} ;; "magnetic resonance imaging"
(declare-const patient_has_undergone_magnetic_resonance_imaging_now@@incompatibility Bool) ;; {"when_to_set_to_true":"Set to true if the patient has MRI incompatibility with respect to magnetic resonance imaging (MRI).","when_to_set_to_false":"Set to false if the patient does not have MRI incompatibility with respect to magnetic resonance imaging (MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has MRI incompatibility with respect to magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient has MRI incompatibility."} ;; "magnetic resonance imaging incompatibility"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_magnetic_resonance_imaging_now@@incompatibility
      patient_has_undergone_magnetic_resonance_imaging_now)
:named REQ0_AUXILIARY0)) ;; "magnetic resonance imaging incompatibility" implies "magnetic resonance imaging"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_magnetic_resonance_imaging_now@@incompatibility)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has magnetic resonance imaging incompatibility."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_left_handed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left-handedness.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left-handedness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left-handedness.","meaning":"Boolean indicating whether the patient currently has left-handedness."} ;; "left-handedness"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_left_handed_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has left-handedness."
