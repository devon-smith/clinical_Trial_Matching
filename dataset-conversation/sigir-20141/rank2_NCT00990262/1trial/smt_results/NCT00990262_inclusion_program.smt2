;; ===================== Declarations for the inclusion criteria (REQ 0) =====================

(declare-const patient_has_finding_of_chest_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had chest pain at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had chest pain at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had chest pain.","meaning":"Boolean indicating whether the patient has ever had chest pain in their history."}  ;; "chest pain"
(declare-const patient_has_finding_of_chest_pain_inthehistory@@duration_greater_than_5_minutes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's episode(s) of chest pain lasted more than five minutes.","when_to_set_to_false":"Set to false if the patient's episode(s) of chest pain did not last more than five minutes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest pain episode(s) lasted more than five minutes.","meaning":"Boolean indicating whether the patient's chest pain episode(s) lasted more than five minutes."}  ;; "chest pain lasting more than five minutes"

(declare-const patient_has_finding_of_acute_coronary_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of acute coronary syndrome at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a finding of acute coronary syndrome at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of acute coronary syndrome.","meaning":"Boolean indicating whether the patient has ever had a finding of acute coronary syndrome in their history."}  ;; "acute coronary syndrome"
(declare-const patient_has_finding_of_acute_coronary_syndrome_inthehistory@@admitted_to_rule_out Bool) ;; {"when_to_set_to_true":"Set to true if the patient was admitted for the purpose of ruling out acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient was not admitted for the purpose of ruling out acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the admission was for ruling out acute coronary syndrome.","meaning":"Boolean indicating whether the patient was admitted to rule out acute coronary syndrome."}  ;; "admitted to rule out acute coronary syndrome"

;; ===================== Auxiliary Assertions (REQ 0) =====================

;; Qualifier variable for chest pain duration implies chest pain in history
(assert
  (! (=> patient_has_finding_of_chest_pain_inthehistory@@duration_greater_than_5_minutes
         patient_has_finding_of_chest_pain_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "episode of chest pain lasting more than five minutes" implies "episode of chest pain"

;; Qualifier variable for admission to rule out ACS implies ACS in history
(assert
  (! (=> patient_has_finding_of_acute_coronary_syndrome_inthehistory@@admitted_to_rule_out
         patient_has_finding_of_acute_coronary_syndrome_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "admitted to rule out acute coronary syndrome" implies "acute coronary syndrome in history"

;; ===================== Constraint Assertions (REQ 0) =====================

;; Component 0: At least one episode of chest pain lasting more than five minutes
(assert
  (! patient_has_finding_of_chest_pain_inthehistory@@duration_greater_than_5_minutes
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least one episode of chest pain lasting more than five minutes"

;; Component 1: Admitted to rule out acute coronary syndrome
(assert
  (! patient_has_finding_of_acute_coronary_syndrome_inthehistory@@admitted_to_rule_out
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "admitted to rule out acute coronary syndrome"
