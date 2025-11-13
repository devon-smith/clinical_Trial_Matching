;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acquired_achalasia_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acquired achalasia of the esophagus (secondary achalasia).","when_to_set_to_false":"Set to false if the patient currently does not have acquired achalasia of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acquired achalasia of the esophagus.","meaning":"Boolean indicating whether the patient currently has acquired achalasia of the esophagus (secondary achalasia)."} ;; "secondary achalasia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_acquired_achalasia_of_esophagus_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary achalasia."
