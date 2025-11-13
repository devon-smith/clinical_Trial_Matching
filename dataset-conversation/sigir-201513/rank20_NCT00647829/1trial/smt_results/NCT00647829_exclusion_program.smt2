;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_throat_lozenge_inthepast2hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to throat lozenges within the past two hours.","when_to_set_to_false":"Set to false if the patient was not exposed to throat lozenges within the past two hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to throat lozenges within the past two hours.","meaning":"Boolean indicating whether the patient was exposed to throat lozenges within the past two hours."} ;; "throat lozenges within two hours"
(declare-const patient_is_exposed_to_throat_spray_inthepast2hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to throat spray within the past two hours.","when_to_set_to_false":"Set to false if the patient was not exposed to throat spray within the past two hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to throat spray within the past two hours.","meaning":"Boolean indicating whether the patient was exposed to throat spray within the past two hours."} ;; "throat spray within two hours"
(declare-const patient_is_exposed_to_cough_drop_inthepast2hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to cough drops within the past two hours.","when_to_set_to_false":"Set to false if the patient was not exposed to cough drops within the past two hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to cough drops within the past two hours.","meaning":"Boolean indicating whether the patient was exposed to cough drops within the past two hours."} ;; "cough drops within two hours"
(declare-const patient_is_taking_menthol_containing_product_inthepast2hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient was taking menthol-containing products within the past two hours.","when_to_set_to_false":"Set to false if the patient was not taking menthol-containing products within the past two hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was taking menthol-containing products within the past two hours.","meaning":"Boolean indicating whether the patient was taking menthol-containing products within the past two hours."} ;; "menthol-containing products within two hours"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_exposed_to_throat_lozenge_inthepast2hours)
     :named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient used throat lozenges within two hours."

(assert
  (! (not patient_is_exposed_to_throat_spray_inthepast2hours)
     :named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient used throat spray within two hours."

(assert
  (! (not patient_is_exposed_to_cough_drop_inthepast2hours)
     :named REQ0_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient used cough drops within two hours."

(assert
  (! (not patient_is_taking_menthol_containing_product_inthepast2hours)
     :named REQ0_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient used menthol-containing products within two hours."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_analgesic_inthepast8hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any analgesic within the past 8 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to any analgesic within the past 8 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any analgesic within the past 8 hours.","meaning":"Boolean indicating whether the patient has been exposed to any analgesic within the past 8 hours."} ;; "analgesics"
(declare-const patient_is_exposed_to_analgesic_inthepast8hours@@short_acting Bool) ;; {"when_to_set_to_true":"Set to true if the analgesic exposure within the past 8 hours is to a short-acting analgesic.","when_to_set_to_false":"Set to false if the analgesic exposure within the past 8 hours is not to a short-acting analgesic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the analgesic exposure within the past 8 hours is to a short-acting analgesic.","meaning":"Boolean indicating whether the analgesic exposure within the past 8 hours is to a short-acting analgesic."} ;; "short-acting analgesics"
(declare-const patient_is_exposed_to_antipyretic_inthepast8hours@@short_acting Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any short-acting antipyretic within the past 8 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to any short-acting antipyretic within the past 8 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any short-acting antipyretic within the past 8 hours.","meaning":"Boolean indicating whether the patient has been exposed to any short-acting antipyretic within the past 8 hours."} ;; "short-acting antipyretics"
(declare-const patient_is_exposed_to_cold_medication_inthepast8hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any form of cold medication within the past 8 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to any form of cold medication within the past 8 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any form of cold medication within the past 8 hours.","meaning":"Boolean indicating whether the patient has been exposed to any form of cold medication within the past 8 hours."} ;; "any form of cold medication"
(declare-const patient_is_exposed_to_ibuprofen_inthepast8hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to ibuprofen within the past 8 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to ibuprofen within the past 8 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to ibuprofen within the past 8 hours.","meaning":"Boolean indicating whether the patient has been exposed to ibuprofen within the past 8 hours."} ;; "ibuprofen"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive example: ibuprofen implies short-acting analgesic exposure
(assert
(! (=> patient_is_exposed_to_ibuprofen_inthepast8hours
     patient_is_exposed_to_analgesic_inthepast8hours@@short_acting)
:named REQ1_AUXILIARY0)) ;; "short-acting analgesics with non-exhaustive examples (ibuprofen)"

;; Non-exhaustive example: ibuprofen implies short-acting antipyretic exposure
(assert
(! (=> patient_is_exposed_to_ibuprofen_inthepast8hours
     patient_is_exposed_to_antipyretic_inthepast8hours@@short_acting)
:named REQ1_AUXILIARY1)) ;; "short-acting antipyretics with non-exhaustive examples (ibuprofen)"

;; Qualifier variable implies corresponding stem variable for analgesics
(assert
(! (=> patient_is_exposed_to_analgesic_inthepast8hours@@short_acting
     patient_is_exposed_to_analgesic_inthepast8hours)
:named REQ1_AUXILIARY2)) ;; "short-acting analgesics is a subset of analgesics"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have used short-acting analgesics within 8 hours
(assert
(! (not patient_is_exposed_to_analgesic_inthepast8hours@@short_acting)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient used short-acting analgesics within eight hours."

;; Exclusion: patient must NOT have used short-acting antipyretics within 8 hours
(assert
(! (not patient_is_exposed_to_antipyretic_inthepast8hours@@short_acting)
:named REQ1_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient used short-acting antipyretics within eight hours."

;; Exclusion: patient must NOT have used any form of cold medication within 8 hours
(assert
(! (not patient_is_exposed_to_cold_medication_inthepast8hours)
:named REQ1_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient used any form of cold medication within eight hours."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_used_antibiotics_for_acute_disease_within_24_hours_of_first_study_medication_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient used antibiotics for acute disease within twenty-four hours of the first dose of study medication.","when_to_set_to_false":"Set to false if the patient did not use antibiotics for acute disease within twenty-four hours of the first dose of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient used antibiotics for acute disease within twenty-four hours of the first dose of study medication.","meaning":"Boolean indicating whether the patient used antibiotics for acute disease within twenty-four hours of the first dose of study medication."} ;; "used antibiotics for acute disease within twenty-four hours of the first dose of study medication"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_used_antibiotics_for_acute_disease_within_24_hours_of_first_study_medication_dose)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient used antibiotics for acute disease within twenty-four hours of the first dose of study medication."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_presumed_diagnosis_of_infectious_mononucleosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a presumed diagnosis of infectious mononucleosis.","when_to_set_to_false":"Set to false if the patient currently does not have a presumed diagnosis of infectious mononucleosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a presumed diagnosis of infectious mononucleosis.","meaning":"Boolean indicating whether the patient currently has a presumed diagnosis of infectious mononucleosis."} ;; "has a presumed diagnosis of infectious mononucleosis"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_presumed_diagnosis_of_infectious_mononucleosis_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a presumed diagnosis of infectious mononucleosis."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_allergy_to_non_steroidal_anti_inflammatory_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known allergy to nonsteroidal anti-inflammatory drugs at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented or known allergy to nonsteroidal anti-inflammatory drugs at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known allergy to nonsteroidal anti-inflammatory drugs.","meaning":"Boolean indicating whether the patient has a known allergy to nonsteroidal anti-inflammatory drugs at any time in their history."} ;; "known allergy to nonsteroidal anti-inflammatory drugs"
(declare-const patient_has_allergy_to_cyclooxygenase_2_inhibitor_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known allergy to cyclooxygenase-2 specific inhibitors at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented or known allergy to cyclooxygenase-2 specific inhibitors at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known allergy to cyclooxygenase-2 specific inhibitors.","meaning":"Boolean indicating whether the patient has a known allergy to cyclooxygenase-2 specific inhibitors at any time in their history."} ;; "known allergy to cyclooxygenase-2 specific inhibitors"
(declare-const patient_has_allergy_to_sulfonamide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known allergy to sulfonamides at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented or known allergy to sulfonamides at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known allergy to sulfonamides.","meaning":"Boolean indicating whether the patient has a known allergy to sulfonamides at any time in their history."} ;; "known allergy to sulfonamides"
(declare-const patient_has_allergy_to_acetaminophen_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known allergy to acetaminophen at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented or known allergy to acetaminophen at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known allergy to acetaminophen.","meaning":"Boolean indicating whether the patient has a known allergy to acetaminophen at any time in their history."} ;; "known allergy to acetaminophen"
(declare-const patient_has_hypersensitivity_to_non_steroidal_anti_inflammatory_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known hypersensitivity to nonsteroidal anti-inflammatory agents at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented or known hypersensitivity to nonsteroidal anti-inflammatory agents at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known hypersensitivity to nonsteroidal anti-inflammatory agents.","meaning":"Boolean indicating whether the patient has a known hypersensitivity to nonsteroidal anti-inflammatory agents at any time in their history."} ;; "known hypersensitivity to nonsteroidal anti-inflammatory drugs"
(declare-const patient_has_hypersensitivity_to_cyclooxygenase_2_inhibitor_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known hypersensitivity to cyclooxygenase-2 inhibitors at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented or known hypersensitivity to cyclooxygenase-2 inhibitors at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known hypersensitivity to cyclooxygenase-2 inhibitors.","meaning":"Boolean indicating whether the patient has a known hypersensitivity to cyclooxygenase-2 inhibitors at any time in their history."} ;; "known hypersensitivity to cyclooxygenase-2 specific inhibitors"
(declare-const patient_has_hypersensitivity_to_sulfonamide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known hypersensitivity to sulfonamides at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented or known hypersensitivity to sulfonamides at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known hypersensitivity to sulfonamides.","meaning":"Boolean indicating whether the patient has a known hypersensitivity to sulfonamides at any time in their history."} ;; "known hypersensitivity to sulfonamides"
(declare-const patient_has_hypersensitivity_to_acetaminophen_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known hypersensitivity to acetaminophen at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented or known hypersensitivity to acetaminophen at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known hypersensitivity to acetaminophen.","meaning":"Boolean indicating whether the patient has a known hypersensitivity to acetaminophen at any time in their history."} ;; "known hypersensitivity to acetaminophen"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_allergy_to_non_steroidal_anti_inflammatory_agent_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to nonsteroidal anti-inflammatory drugs."

(assert
(! (not patient_has_allergy_to_cyclooxygenase_2_inhibitor_inthehistory)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to cyclooxygenase-2 specific inhibitors."

(assert
(! (not patient_has_allergy_to_sulfonamide_inthehistory)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to sulfonamides."

(assert
(! (not patient_has_allergy_to_acetaminophen_inthehistory)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to acetaminophen."

(assert
(! (not patient_has_hypersensitivity_to_non_steroidal_anti_inflammatory_agent_inthehistory)
:named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to nonsteroidal anti-inflammatory drugs."

(assert
(! (not patient_has_hypersensitivity_to_cyclooxygenase_2_inhibitor_inthehistory)
:named REQ4_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to cyclooxygenase-2 specific inhibitors."

(assert
(! (not patient_has_hypersensitivity_to_sulfonamide_inthehistory)
:named REQ4_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to sulfonamides."

(assert
(! (not patient_has_hypersensitivity_to_acetaminophen_inthehistory)
:named REQ4_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to acetaminophen."
