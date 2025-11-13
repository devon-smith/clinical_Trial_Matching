;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor of lymphoid, hemopoietic, and related tissue (hematological malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant tumor of lymphoid, hemopoietic, and related tissue (hematological malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant tumor of lymphoid, hemopoietic, and related tissue.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant tumor of lymphoid, hemopoietic, and related tissue (hematological malignancy)."} ;; "To be included, the patient must be a patient with a hematological malignancy."
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of radiologic infiltrate of lung (lung infiltrates).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of radiologic infiltrate of lung (lung infiltrates).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of radiologic infiltrate of lung.","meaning":"Boolean indicating whether the patient currently has a finding of radiologic infiltrate of lung (lung infiltrates)."} ;; "To be included, the patient must have lung infiltrates."
(declare-const patient_is_at_high_risk_for_invasive_aspergillosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently at high risk for invasive aspergillosis.","when_to_set_to_false":"Set to false if the patient is currently not at high risk for invasive aspergillosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at high risk for invasive aspergillosis.","meaning":"Boolean indicating whether the patient is currently at high risk for invasive aspergillosis."} ;; "To be included, the patient must be at high risk for invasive aspergillosis."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be a patient with a hematological malignancy.
(assert
  (! patient_has_diagnosis_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a patient with a hematological malignancy."

;; Component 1: Patient must have lung infiltrates.
(assert
  (! patient_has_finding_of_radiologic_infiltrate_of_lung_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have lung infiltrates."

;; Component 2: Patient must be at high risk for invasive aspergillosis.
(assert
  (! patient_is_at_high_risk_for_invasive_aspergillosis_now
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be at high risk for invasive aspergillosis."
