;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; "Boolean clinical finding indicating whether the patient currently has shortness of breath (dyspnea)." {"when_to_set_to_true":"Set to true if the patient currently presents with shortness of breath (dyspnea).","when_to_set_to_false":"Set to false if the patient currently does not present with shortness of breath (dyspnea).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with shortness of breath (dyspnea).","meaning":"Boolean indicating whether the patient currently presents with shortness of breath (dyspnea)."}

(declare-const patient_has_finding_of_dyspnea_now@@is_primary_complaint Bool) ;; "Boolean clinical finding indicating whether the patient currently presents with shortness of breath (dyspnea) and it is the primary complaint." {"when_to_set_to_true":"Set to true if the patient currently presents with shortness of breath (dyspnea) and it is the primary complaint.","when_to_set_to_false":"Set to false if the patient currently presents with shortness of breath (dyspnea) but it is not the primary complaint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether shortness of breath (dyspnea) is the primary complaint.","meaning":"Boolean indicating whether the patient's current shortness of breath (dyspnea) is the primary complaint."}

(declare-const patient_has_finding_of_increasing_breathlessness_now Bool) ;; "Boolean clinical finding indicating whether the patient currently has an increase in the severity of chronic dyspnea (increasing breathlessness)." {"when_to_set_to_true":"Set to true if the patient currently has an increase in the severity of chronic dyspnea (increasing breathlessness).","when_to_set_to_false":"Set to false if the patient currently does not have an increase in the severity of chronic dyspnea (increasing breathlessness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an increase in the severity of chronic dyspnea (increasing breathlessness).","meaning":"Boolean indicating whether the patient currently has an increase in the severity of chronic dyspnea (increasing breathlessness)."}

(declare-const patient_has_finding_of_sudden_onset_of_dyspnea_now Bool) ;; "Boolean clinical finding indicating whether the patient currently has sudden onset of dyspnea." {"when_to_set_to_true":"Set to true if the patient currently has sudden onset of dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have sudden onset of dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sudden onset of dyspnea.","meaning":"Boolean indicating whether the patient currently has sudden onset of dyspnea."}

(declare-const patient_has_history_of_chronic_dyspnea Bool) ;; "Boolean clinical finding indicating whether the patient has a history of chronic dyspnea." {"when_to_set_to_true":"Set to true if the patient has a history of chronic dyspnea.","when_to_set_to_false":"Set to false if the patient does not have a history of chronic dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of chronic dyspnea.","meaning":"Boolean indicating whether the patient has a history of chronic dyspnea."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for primary complaint implies stem variable (shortness of breath must be present if it is the primary complaint)
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@is_primary_complaint
         patient_has_finding_of_dyspnea_now)
     :named REQ0_AUXILIARY0)) ;; "the patient must present with shortness of breath as the primary complaint"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must present with shortness of breath as the primary complaint
(assert
  (! patient_has_finding_of_dyspnea_now@@is_primary_complaint
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must present with shortness of breath as the primary complaint"

;; Component 1: ((sudden onset of dyspnea AND NOT history of chronic dyspnea) OR increase in severity of chronic dyspnea)
(assert
  (! (or (and patient_has_finding_of_sudden_onset_of_dyspnea_now
              (not patient_has_history_of_chronic_dyspnea))
         patient_has_finding_of_increasing_breathlessness_now)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have sudden onset of dyspnea AND NOT have a history of chronic dyspnea) OR (have an increase in the severity of chronic dyspnea))"
