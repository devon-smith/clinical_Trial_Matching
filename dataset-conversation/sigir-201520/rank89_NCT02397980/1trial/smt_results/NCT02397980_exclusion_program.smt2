;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_illiteracy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of illiteracy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of illiteracy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of illiteracy.","meaning":"Boolean indicating whether the patient currently has illiteracy."} ;; "illiteracy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_illiteracy_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has illiteracy."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_severe_hearing_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe hearing loss.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe hearing loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe hearing loss.","meaning":"Boolean indicating whether the patient currently has severe hearing loss."} ;; "severe hearing difficulty"
(declare-const patient_has_finding_of_severe_visual_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe visual impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe visual impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe visual impairment.","meaning":"Boolean indicating whether the patient currently has severe visual impairment."} ;; "severe visual acuity difficulty"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_severe_hearing_loss_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hearing difficulty."

(assert
  (! (not patient_has_finding_of_severe_visual_impairment_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe visual acuity difficulty."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cognitive impairment.","meaning":"Boolean indicating whether the patient currently has cognitive impairment."} ;; "cognitive impairment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_impaired_cognition_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive impairment."
