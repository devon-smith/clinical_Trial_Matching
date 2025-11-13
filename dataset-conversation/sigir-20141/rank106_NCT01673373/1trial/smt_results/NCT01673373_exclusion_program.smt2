;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_flash_pulmonary_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has flash pulmonary edema.","when_to_set_to_false":"Set to false if the patient currently does not have flash pulmonary edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has flash pulmonary edema.","meaning":"Boolean indicating whether the patient currently has flash pulmonary edema."} ;; "flash pulmonary edema"
(declare-const patient_has_finding_of_pulmonary_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary edema.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary edema.","meaning":"Boolean indicating whether the patient currently has pulmonary edema."} ;; "pulmonary edema"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Flash pulmonary edema is a type of pulmonary edema
(assert
(! (=> patient_has_finding_of_flash_pulmonary_edema_now
      patient_has_finding_of_pulmonary_edema_now)
    :named REQ0_AUXILIARY0)) ;; "flash pulmonary edema" implies "pulmonary edema"

;; ===================== Constraint Assertions (REQ 0) =====================
;; This requirement is an explicit non-exclusion: "A patient is not excluded if the patient has flash pulmonary edema and meets all other inclusion criteria."
;; No exclusion constraint is imposed by this criterion, so no assertion is needed here.
