;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_general_health_poor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor general health.","when_to_set_to_false":"Set to false if the patient currently does not have poor general health.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor general health.","meaning":"Boolean indicating whether the patient currently has poor general health."} ;; "bad general health state"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_general_health_poor_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a bad general health state."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of neoplastic disease (neoplasia).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of neoplastic disease (neoplasia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of neoplastic disease (neoplasia).","meaning":"Boolean indicating whether the patient currently has a diagnosis of neoplastic disease."} ;; "neoplasia"
(declare-const patient_has_diagnosis_of_peptic_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peptic ulcer.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of peptic ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of peptic ulcer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of peptic ulcer."} ;; "peptic ulcer"
(declare-const patient_has_diagnosis_of_gastrointestinal_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gastrointestinal hemorrhage (bleeding).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gastrointestinal hemorrhage (bleeding).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gastrointestinal hemorrhage (bleeding).","meaning":"Boolean indicating whether the patient currently has a diagnosis of gastrointestinal hemorrhage."} ;; "gastrointestinal bleeding"
(declare-const patient_has_finding_of_febrile_convulsion_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of febrile convulsion at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of febrile convulsion at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a febrile convulsion.","meaning":"Boolean indicating whether the patient has ever had a febrile convulsion (history of febrile convulsion)."} ;; "history of fever convulsion"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_neoplastic_disease_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neoplasia."

(assert
(! (not patient_has_diagnosis_of_peptic_ulcer_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has peptic ulcer."

(assert
(! (not patient_has_diagnosis_of_gastrointestinal_hemorrhage_now)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has gastrointestinal bleeding."

(assert
(! (not patient_has_finding_of_febrile_convulsion_inthehistory)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of fever convulsion."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_intolerance_to_dipyrone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently intolerant to dipyrone.","when_to_set_to_false":"Set to false if the patient is currently not intolerant to dipyrone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently intolerant to dipyrone.","meaning":"Boolean indicating whether the patient is currently intolerant to dipyrone."} ;; "the patient is intolerant to dipyrone"
(declare-const patient_has_intolerance_to_ibuprofen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently intolerant to ibuprofen.","when_to_set_to_false":"Set to false if the patient is currently not intolerant to ibuprofen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently intolerant to ibuprofen.","meaning":"Boolean indicating whether the patient is currently intolerant to ibuprofen."} ;; "the patient is intolerant to ibuprofen"
(declare-const patient_has_intolerance_to_acetaminophen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently intolerant to acetaminophen.","when_to_set_to_false":"Set to false if the patient is currently not intolerant to acetaminophen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently intolerant to acetaminophen.","meaning":"Boolean indicating whether the patient is currently intolerant to acetaminophen."} ;; "the patient is intolerant to acetaminophen"
(declare-const patient_has_intolerance_to_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently intolerant to any nonsteroidal antiinflammatory agent.","when_to_set_to_false":"Set to false if the patient is currently not intolerant to any nonsteroidal antiinflammatory agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently intolerant to any nonsteroidal antiinflammatory agent.","meaning":"Boolean indicating whether the patient is currently intolerant to any nonsteroidal antiinflammatory agent."} ;; "the patient is intolerant to any other nonsteroidal antiinflammatory drug"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_intolerance_to_dipyrone_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is intolerant to dipyrone."

(assert
(! (not patient_has_intolerance_to_ibuprofen_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is intolerant to ibuprofen."

(assert
(! (not patient_has_intolerance_to_acetaminophen_now)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is intolerant to acetaminophen."

(assert
(! (not patient_has_intolerance_to_non_steroidal_anti_inflammatory_agent_now)
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is intolerant to any other nonsteroidal antiinflammatory drug."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_moderate_dehydration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of moderate dehydration.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of moderate dehydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate dehydration.","meaning":"Boolean indicating whether the patient currently has moderate dehydration."} ;; "moderate dehydration"
(declare-const patient_has_finding_of_severe_dehydration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe dehydration.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe dehydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe dehydration.","meaning":"Boolean indicating whether the patient currently has severe dehydration."} ;; "severe dehydration"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_moderate_dehydration_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate dehydration."

(assert
  (! (not patient_has_finding_of_severe_dehydration_now)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dehydration."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disturbance_of_consciousness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disturbance of consciousness (altered state of consciousness).","when_to_set_to_false":"Set to false if the patient currently does not have a disturbance of consciousness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disturbance of consciousness.","meaning":"Boolean indicating whether the patient currently has a disturbance of consciousness."} ;; "altered state of consciousness"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_disturbance_of_consciousness_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an altered state of consciousness."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_capable_of_ingesting_oral_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of ingesting oral drugs.","when_to_set_to_false":"Set to false if the patient is currently not capable of ingesting oral drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of ingesting oral drugs.","meaning":"Boolean indicating whether the patient is currently capable of ingesting oral drugs."} ;; "capable of ingesting oral drugs"

(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to a drug or medicament."} ;; "drugs"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@administered_orally Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to is administered orally.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to is not administered orally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is administered orally.","meaning":"Boolean indicating whether the drug or medicament is administered orally."} ;; "oral drugs"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_capable_of_ingesting_oral_drugs_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is not capable of ingesting oral drugs."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_taking_steroid_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with any steroid-containing product.","when_to_set_to_false":"Set to false if the patient is currently not being treated with any steroid-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with any steroid-containing product.","meaning":"Boolean indicating whether the patient is currently being treated with any steroid-containing product."} ;; "steroids"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_taking_steroid_containing_product_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is being treated with steroids."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_antiinflammatory_drug_inthepast6hours@@temporalcontext_within6hours_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to antiinflammatory drugs within the 6 hours immediately before the study start.","when_to_set_to_false":"Set to false if the patient was not exposed to antiinflammatory drugs within the 6 hours immediately before the study start.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to antiinflammatory drugs within the 6 hours immediately before the study start.","meaning":"Boolean indicating whether the patient was exposed to antiinflammatory drugs in the 6 hours immediately before the study start."} ;; "the patient has been treated with antiinflammatory drugs in the last 6 hours before the study"
(declare-const patient_is_exposed_to_analgesic_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to analgesic drugs in the 6 hours prior to now.","when_to_set_to_false":"Set to false if the patient was not exposed to analgesic drugs in the 6 hours prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to analgesic drugs in the 6 hours prior to now.","meaning":"Boolean indicating whether the patient was exposed to analgesic drugs in the 6 hours prior to now."} ;; "analgesic drugs"
(declare-const patient_is_exposed_to_analgesic_inthepast6hours@@temporalcontext_within6hours_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to analgesic drugs occurred within the 6 hours immediately before the study start.","when_to_set_to_false":"Set to false if the exposure to analgesic drugs did not occur within the 6 hours immediately before the study start.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to analgesic drugs occurred within the 6 hours immediately before the study start.","meaning":"Boolean indicating whether the exposure window is anchored to the 6 hours before study start."} ;; "the patient has been treated with analgesic drugs in the last 6 hours before the study"
(declare-const patient_is_exposed_to_antipyretic_drug_inthepast6hours@@temporalcontext_within6hours_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to antipyretic drugs within the 6 hours immediately before the study start.","when_to_set_to_false":"Set to false if the patient was not exposed to antipyretic drugs within the 6 hours immediately before the study start.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to antipyretic drugs within the 6 hours immediately before the study start.","meaning":"Boolean indicating whether the patient was exposed to antipyretic drugs in the 6 hours immediately before the study start."} ;; "the patient has been treated with antipyretic drugs in the last 6 hours before the study"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable for analgesic drugs
(assert
(! (=> patient_is_exposed_to_analgesic_inthepast6hours@@temporalcontext_within6hours_before_study
      patient_is_exposed_to_analgesic_inthepast6hours)
:named REQ7_AUXILIARY0)) ;; "the patient has been treated with analgesic drugs in the last 6 hours before the study"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have been treated with any of the three drug classes in the last 6 hours before the study
(assert
(! (not (or patient_is_exposed_to_antiinflammatory_drug_inthepast6hours@@temporalcontext_within6hours_before_study
            patient_is_exposed_to_analgesic_inthepast6hours@@temporalcontext_within6hours_before_study
            patient_is_exposed_to_antipyretic_drug_inthepast6hours@@temporalcontext_within6hours_before_study))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has been treated with antiinflammatory drugs in the last 6 hours before the study) OR (the patient has been treated with analgesic drugs in the last 6 hours before the study) OR (the patient has been treated with antipyretic drugs in the last 6 hours before the study)."
