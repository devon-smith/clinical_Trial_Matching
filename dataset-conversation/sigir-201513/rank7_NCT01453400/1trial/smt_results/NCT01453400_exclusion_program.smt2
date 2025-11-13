;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity condition documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a hypersensitivity condition documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypersensitivity condition in their history.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity condition in their history."} ;; "hypersensitivity"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_aspirin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity condition in their history was caused by aspirin.","when_to_set_to_false":"Set to false if the patient's hypersensitivity condition in their history was not caused by aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin caused the hypersensitivity condition in the patient's history.","meaning":"Boolean indicating whether the patient's hypersensitivity condition in their history was caused by aspirin."} ;; "hypersensitivity to aspirin"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_salicylates Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity condition in their history was caused by salicylates.","when_to_set_to_false":"Set to false if the patient's hypersensitivity condition in their history was not caused by salicylates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether salicylates caused the hypersensitivity condition in the patient's history.","meaning":"Boolean indicating whether the patient's hypersensitivity condition in their history was caused by salicylates."} ;; "hypersensitivity to salicylates"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_nonsteroidal_anti_inflammatory_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity condition in their history was caused by nonsteroidal anti-inflammatory drugs.","when_to_set_to_false":"Set to false if the patient's hypersensitivity condition in their history was not caused by nonsteroidal anti-inflammatory drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether nonsteroidal anti-inflammatory drugs caused the hypersensitivity condition in the patient's history.","meaning":"Boolean indicating whether the patient's hypersensitivity condition in their history was caused by nonsteroidal anti-inflammatory drugs."} ;; "hypersensitivity to nonsteroidal anti-inflammatory drugs"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_acetaminophen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity condition in their history was caused by acetaminophen.","when_to_set_to_false":"Set to false if the patient's hypersensitivity condition in their history was not caused by acetaminophen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether acetaminophen caused the hypersensitivity condition in the patient's history.","meaning":"Boolean indicating whether the patient's hypersensitivity condition in their history was caused by acetaminophen."} ;; "hypersensitivity to acetaminophen"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_opioid_analgesics Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity condition in their history was caused by opioid analgesics.","when_to_set_to_false":"Set to false if the patient's hypersensitivity condition in their history was not caused by opioid analgesics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether opioid analgesics caused the hypersensitivity condition in the patient's history.","meaning":"Boolean indicating whether the patient's hypersensitivity condition in their history was caused by opioid analgesics."} ;; "hypersensitivity to opioid analgesics"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_drugs_with_similar_pharmacological_properties Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity condition in their history was caused by drugs with similar pharmacological properties.","when_to_set_to_false":"Set to false if the patient's hypersensitivity condition in their history was not caused by drugs with similar pharmacological properties.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether drugs with similar pharmacological properties caused the hypersensitivity condition in the patient's history.","meaning":"Boolean indicating whether the patient's hypersensitivity condition in their history was caused by drugs with similar pharmacological properties."} ;; "hypersensitivity to drugs with similar pharmacological properties"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_aspirin
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ0_AUXILIARY0)) ;; "hypersensitivity to aspirin"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_salicylates
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ0_AUXILIARY1)) ;; "hypersensitivity to salicylates"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_nonsteroidal_anti_inflammatory_drugs
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ0_AUXILIARY2)) ;; "hypersensitivity to nonsteroidal anti-inflammatory drugs"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_acetaminophen
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ0_AUXILIARY3)) ;; "hypersensitivity to acetaminophen"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_opioid_analgesics
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ0_AUXILIARY4)) ;; "hypersensitivity to opioid analgesics"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_drugs_with_similar_pharmacological_properties
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ0_AUXILIARY5)) ;; "hypersensitivity to drugs with similar pharmacological properties"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_aspirin)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to aspirin."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_salicylates)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to salicylates."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_nonsteroidal_anti_inflammatory_drugs)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to nonsteroidal anti-inflammatory drugs."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_acetaminophen)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to acetaminophen."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_opioid_analgesics)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to opioid analgesics."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_drugs_with_similar_pharmacological_properties)
:named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to drugs with similar pharmacological properties."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_cold_medication_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any cold medication within the four hours preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the patient has not used any cold medication within the four hours preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any cold medication within the four hours preceding administration of the investigational product.","meaning":"Boolean indicating whether the patient has been exposed to any cold medication within the four hours preceding administration of the investigational product."} ;; "used any cold medication within four hours preceding administration of the investigational product"
(declare-const patient_is_exposed_to_decongestant_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a decongestant within the four hours preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the patient has not been exposed to a decongestant within the four hours preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a decongestant within the four hours preceding administration of the investigational product.","meaning":"Boolean indicating whether the patient has been exposed to a decongestant in the four hours prior to now."} ;; "decongestant medication"
(declare-const patient_is_exposed_to_histamine_receptor_antagonist_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a histamine receptor antagonist within the four hours preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the patient has not been exposed to a histamine receptor antagonist within the four hours preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a histamine receptor antagonist within the four hours preceding administration of the investigational product.","meaning":"Boolean indicating whether the patient has been exposed to a histamine receptor antagonist in the four hours prior to now."} ;; "antihistamine medication"
(declare-const patient_is_exposed_to_expectorant_agent_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an expectorant agent within the four hours preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the patient has not been exposed to an expectorant agent within the four hours preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to an expectorant agent within the four hours preceding administration of the investigational product.","meaning":"Boolean indicating whether the patient has been exposed to an expectorant agent in the four hours prior to now."} ;; "expectorant medication"
(declare-const patient_is_exposed_to_antitussive_agent_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an antitussive agent within the four hours preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the patient has not been exposed to an antitussive agent within the four hours preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to an antitussive agent within the four hours preceding administration of the investigational product.","meaning":"Boolean indicating whether the patient has been exposed to an antitussive agent in the four hours prior to now."} ;; "antitussive medication"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_decongestant_inthepast4hours
           patient_is_exposed_to_histamine_receptor_antagonist_inthepast4hours
           patient_is_exposed_to_expectorant_agent_inthepast4hours
           patient_is_exposed_to_antitussive_agent_inthepast4hours)
        patient_is_exposed_to_cold_medication_inthepast4hours)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (decongestant medication, antihistamine medication, expectorant medication, antitussive medication)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_exposed_to_cold_medication_inthepast4hours)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any cold medication within four hours preceding administration of the investigational product."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_analgesic_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any analgesic substance within the past 4 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to any analgesic substance within the past 4 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any analgesic substance within the past 4 hours.","meaning":"Boolean indicating whether the patient has been exposed to any analgesic substance within the past 4 hours."} ;; "used any immediate release analgesic medication within four hours preceding administration of the investigational product"
(declare-const patient_is_exposed_to_analgesic_inthepast4hours@@temporalcontext_within4hours_before_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to analgesic substance occurred within the 4 hours immediately preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the exposure did not occur within the 4 hours immediately preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within the 4 hours immediately preceding administration of the investigational product.","meaning":"Boolean indicating whether the exposure to analgesic substance occurred within the 4 hours immediately preceding administration of the investigational product."} ;; "within four hours preceding administration of the investigational product"
(declare-const patient_is_exposed_to_antipyretic_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any antipyretic medication within the past 4 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to any antipyretic medication within the past 4 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any antipyretic medication within the past 4 hours.","meaning":"Boolean indicating whether the patient has been exposed to any antipyretic medication within the past 4 hours."} ;; "used any immediate release antipyretic medication within four hours preceding administration of the investigational product"
(declare-const patient_is_exposed_to_antipyretic_inthepast4hours@@form_immediate_release Bool) ;; {"when_to_set_to_true":"Set to true if the exposure was specifically to an immediate release form of antipyretic medication within the past 4 hours.","when_to_set_to_false":"Set to false if the exposure was not to an immediate release form of antipyretic medication within the past 4 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was to an immediate release form of antipyretic medication within the past 4 hours.","meaning":"Boolean indicating whether the exposure was to an immediate release form of antipyretic medication within the past 4 hours."} ;; "immediate release antipyretic medication within four hours"
(declare-const patient_is_exposed_to_antipyretic_inthepast4hours@@temporalcontext_within4hours_before_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to antipyretic medication occurred within the 4 hours immediately preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the exposure did not occur within the 4 hours immediately preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within the 4 hours immediately preceding administration of the investigational product.","meaning":"Boolean indicating whether the exposure to antipyretic medication occurred within the 4 hours immediately preceding administration of the investigational product."} ;; "within four hours preceding administration of the investigational product"
(declare-const patient_is_exposed_to_analgesic_inthepast12hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any analgesic substance within the past 12 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to any analgesic substance within the past 12 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any analgesic substance within the past 12 hours.","meaning":"Boolean indicating whether the patient has been exposed to any analgesic substance within the past 12 hours."} ;; "used any sustained release analgesic medication within twelve hours preceding administration of the investigational product"
(declare-const patient_is_exposed_to_analgesic_inthepast12hours@@form_long_acting Bool) ;; {"when_to_set_to_true":"Set to true if the exposure was specifically to a long-acting form of analgesic substance within the past 12 hours.","when_to_set_to_false":"Set to false if the exposure was not to a long-acting form of analgesic substance within the past 12 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was to a long-acting form of analgesic substance within the past 12 hours.","meaning":"Boolean indicating whether the exposure was to a long-acting form of analgesic substance within the past 12 hours."} ;; "used any long-acting analgesic medication within twelve hours preceding administration of the investigational product"
(declare-const patient_is_exposed_to_analgesic_inthepast12hours@@temporalcontext_within12hours_before_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to analgesic substance occurred within the 12 hours immediately preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the exposure did not occur within the 12 hours immediately preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within the 12 hours immediately preceding administration of the investigational product.","meaning":"Boolean indicating whether the exposure to analgesic substance occurred within the 12 hours immediately preceding administration of the investigational product."} ;; "within twelve hours preceding administration of the investigational product"
(declare-const patient_is_exposed_to_antipyretic_inthepast12hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any antipyretic medication within the past 12 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to any antipyretic medication within the past 12 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any antipyretic medication within the past 12 hours.","meaning":"Boolean indicating whether the patient has been exposed to any antipyretic medication within the past 12 hours."} ;; "used any sustained release antipyretic medication within twelve hours preceding administration of the investigational product"
(declare-const patient_is_exposed_to_antipyretic_inthepast12hours@@form_sustained_release Bool) ;; {"when_to_set_to_true":"Set to true if the exposure was specifically to a sustained release form of antipyretic medication within the past 12 hours.","when_to_set_to_false":"Set to false if the exposure was not to a sustained release form of antipyretic medication within the past 12 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was to a sustained release form of antipyretic medication within the past 12 hours.","meaning":"Boolean indicating whether the exposure was to a sustained release form of antipyretic medication within the past 12 hours."} ;; "used any sustained release antipyretic medication within twelve hours preceding administration of the investigational product"
(declare-const patient_is_exposed_to_antipyretic_inthepast12hours@@form_long_acting Bool) ;; {"when_to_set_to_true":"Set to true if the exposure was specifically to a long-acting form of antipyretic medication within the past 12 hours.","when_to_set_to_false":"Set to false if the exposure was not to a long-acting form of antipyretic medication within the past 12 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was to a long-acting form of antipyretic medication within the past 12 hours.","meaning":"Boolean indicating whether the exposure was to a long-acting form of antipyretic medication within the past 12 hours."} ;; "used any long-acting antipyretic medication within twelve hours preceding administration of the investigational product"
(declare-const patient_is_exposed_to_antipyretic_inthepast12hours@@temporalcontext_within12hours_before_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to antipyretic medication occurred within the 12 hours immediately preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the exposure did not occur within the 12 hours immediately preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within the 12 hours immediately preceding administration of the investigational product.","meaning":"Boolean indicating whether the exposure to antipyretic medication occurred within the 12 hours immediately preceding administration of the investigational product."} ;; "within twelve hours preceding administration of the investigational product"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_exposed_to_analgesic_inthepast4hours)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used any immediate release analgesic medication within four hours preceding administration of the investigational product."

(assert
(! (not patient_is_exposed_to_antipyretic_inthepast4hours)
:named REQ2_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used any immediate release antipyretic medication within four hours preceding administration of the investigational product."

(assert
(! (not patient_is_exposed_to_analgesic_inthepast12hours)
:named REQ2_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used any sustained release analgesic medication within twelve hours preceding administration of the investigational product."

(assert
(! (not patient_is_exposed_to_antipyretic_inthepast12hours@@form_sustained_release)
:named REQ2_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used any sustained release antipyretic medication within twelve hours preceding administration of the investigational product."

(assert
(! (not patient_is_exposed_to_analgesic_inthepast12hours@@form_long_acting)
:named REQ2_COMPONENT4_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used any long-acting analgesic medication within twelve hours preceding administration of the investigational product."

(assert
(! (not patient_is_exposed_to_antipyretic_inthepast12hours@@form_long_acting)
:named REQ2_COMPONENT5_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used any long-acting antipyretic medication within twelve hours preceding administration of the investigational product."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_alcoholic_beverage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to alcoholic beverages at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to alcoholic beverages in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to alcoholic beverages in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to alcoholic beverages at any time in the past."} ;; "alcoholic beverages"
(declare-const patient_is_exposed_to_alcoholic_beverage_inthehistory@@temporalcontext_within2hours_prior_to_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to alcoholic beverages occurred within two hours prior to administration of the investigational product.","when_to_set_to_false":"Set to false if the patient's exposure to alcoholic beverages did not occur within two hours prior to administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to alcoholic beverages occurred within two hours prior to administration of the investigational product.","meaning":"Boolean indicating whether the patient's exposure to alcoholic beverages occurred within two hours prior to administration of the investigational product."} ;; "alcoholic beverages within two hours prior to administration of the investigational product"
(declare-const patient_is_exposed_to_xanthine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to xanthines at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to xanthines in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to xanthines in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to xanthines at any time in the past."} ;; "xanthines"
(declare-const patient_is_exposed_to_xanthine_inthehistory@@exposure_via_food Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to xanthines was via foods.","when_to_set_to_false":"Set to false if the patient's exposure to xanthines was not via foods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to xanthines was via foods.","meaning":"Boolean indicating whether the patient's exposure to xanthines was via foods."} ;; "foods containing xanthines"
(declare-const patient_is_exposed_to_xanthine_inthehistory@@exposure_via_beverage Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to xanthines was via beverages.","when_to_set_to_false":"Set to false if the patient's exposure to xanthines was not via beverages.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to xanthines was via beverages.","meaning":"Boolean indicating whether the patient's exposure to xanthines was via beverages."} ;; "beverages containing xanthines"
(declare-const patient_is_exposed_to_xanthine_inthehistory@@temporalcontext_within2hours_prior_to_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to xanthines occurred within two hours prior to administration of the investigational product.","when_to_set_to_false":"Set to false if the patient's exposure to xanthines did not occur within two hours prior to administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to xanthines occurred within two hours prior to administration of the investigational product.","meaning":"Boolean indicating whether the patient's exposure to xanthines occurred within two hours prior to administration of the investigational product."} ;; "xanthines within two hours prior to administration of the investigational product"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_alcoholic_beverage_inthehistory@@temporalcontext_within2hours_prior_to_administration_of_investigational_product
      patient_is_exposed_to_alcoholic_beverage_inthehistory)
:named REQ3_AUXILIARY0)) ;; "alcoholic beverages within two hours prior to administration of the investigational product"

(assert
(! (=> patient_is_exposed_to_xanthine_inthehistory@@exposure_via_food
      patient_is_exposed_to_xanthine_inthehistory)
:named REQ3_AUXILIARY1)) ;; "foods containing xanthines"

(assert
(! (=> patient_is_exposed_to_xanthine_inthehistory@@exposure_via_beverage
      patient_is_exposed_to_xanthine_inthehistory)
:named REQ3_AUXILIARY2)) ;; "beverages containing xanthines"

(assert
(! (=> patient_is_exposed_to_xanthine_inthehistory@@temporalcontext_within2hours_prior_to_administration_of_investigational_product
      patient_is_exposed_to_xanthine_inthehistory)
:named REQ3_AUXILIARY3)) ;; "xanthines within two hours prior to administration of the investigational product"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_exposed_to_alcoholic_beverage_inthehistory@@temporalcontext_within2hours_prior_to_administration_of_investigational_product)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has consumed alcoholic beverages within two hours prior to administration of the investigational product"

(assert
(! (not (and patient_is_exposed_to_xanthine_inthehistory@@exposure_via_food
             patient_is_exposed_to_xanthine_inthehistory@@temporalcontext_within2hours_prior_to_administration_of_investigational_product))
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has consumed foods containing xanthines within two hours prior to administration of the investigational product"

(assert
(! (not (and patient_is_exposed_to_xanthine_inthehistory@@exposure_via_beverage
             patient_is_exposed_to_xanthine_inthehistory@@temporalcontext_within2hours_prior_to_administration_of_investigational_product))
:named REQ3_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has consumed beverages containing xanthines within two hours prior to administration of the investigational product"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_used_sore_throat_lozenge_within_one_hour_preceding_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any sore throat lozenge within one hour preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the patient has not used any sore throat lozenge within one hour preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any sore throat lozenge within one hour preceding administration of the investigational product.","meaning":"Boolean indicating whether the patient has used any sore throat lozenge within one hour preceding administration of the investigational product."} ;; "the patient has used any sore throat lozenge within one hour preceding administration of the investigational product"

(declare-const patient_has_used_sore_throat_spray_within_one_hour_preceding_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any sore throat spray within one hour preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the patient has not used any sore throat spray within one hour preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any sore throat spray within one hour preceding administration of the investigational product.","meaning":"Boolean indicating whether the patient has used any sore throat spray within one hour preceding administration of the investigational product."} ;; "the patient has used any sore throat spray within one hour preceding administration of the investigational product"

(declare-const patient_is_exposed_to_cough_drop_now@@temporalcontext_within_one_hour_preceding_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used a cough drop within one hour preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the patient has not used a cough drop within one hour preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used a cough drop within one hour preceding administration of the investigational product.","meaning":"Boolean indicating whether the patient has used a cough drop within one hour preceding administration of the investigational product."} ;; "the patient has used any cough drop within one hour preceding administration of the investigational product"

(declare-const patient_has_taken_menthol_containing_product_now@@temporalcontext_within_one_hour_preceding_administration_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a menthol-containing product within one hour preceding administration of the investigational product.","when_to_set_to_false":"Set to false if the patient has not taken a menthol-containing product within one hour preceding administration of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a menthol-containing product within one hour preceding administration of the investigational product.","meaning":"Boolean indicating whether the patient has taken a menthol-containing product within one hour preceding administration of the investigational product."} ;; "the patient has used any menthol-containing product within one hour preceding administration of the investigational product"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_used_sore_throat_lozenge_within_one_hour_preceding_administration_of_investigational_product)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any sore throat lozenge within one hour preceding administration of the investigational product."

(assert
(! (not patient_has_used_sore_throat_spray_within_one_hour_preceding_administration_of_investigational_product)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any sore throat spray within one hour preceding administration of the investigational product."

(assert
(! (not patient_is_exposed_to_cough_drop_now@@temporalcontext_within_one_hour_preceding_administration_of_investigational_product)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any cough drop within one hour preceding administration of the investigational product."

(assert
(! (not patient_has_taken_menthol_containing_product_now@@temporalcontext_within_one_hour_preceding_administration_of_investigational_product)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any menthol-containing product within one hour preceding administration of the investigational product."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cough.","when_to_set_to_false":"Set to false if the patient currently does not have a cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cough.","meaning":"Boolean indicating whether the patient currently has a cough."} ;; "cough"
(declare-const patient_has_finding_of_cough_now@@causes_throat_discomfort Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cough causes throat discomfort.","when_to_set_to_false":"Set to false if the patient's current cough does not cause throat discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cough causes throat discomfort.","meaning":"Boolean indicating whether the patient's current cough causes throat discomfort."} ;; "cough that causes throat discomfort"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cough_now@@causes_throat_discomfort
      patient_has_finding_of_cough_now)
   :named REQ5_AUXILIARY0)) ;; "cough that causes throat discomfort"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_cough_now@@causes_throat_discomfort)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cough that causes throat discomfort."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_mouth_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of mouth-breathing.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of mouth-breathing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mouth-breathing.","meaning":"Boolean indicating whether the patient currently has mouth-breathing."} ;; "mouth-breathing"
(declare-const patient_has_breathing_compromised_by_respiratory_condition_investigator_judgment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any respiratory condition that, in the Investigator's judgment, could compromise breathing.","when_to_set_to_false":"Set to false if the patient currently does not have any respiratory condition that, in the Investigator's judgment, could compromise breathing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any respiratory condition that, in the Investigator's judgment, could compromise breathing.","meaning":"Boolean indicating whether the patient currently has any respiratory condition that, in the Investigator's judgment, could compromise breathing."} ;; "any respiratory condition that, in the Investigator's judgment, could compromise breathing"
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder of the respiratory system.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder of the respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder of the respiratory system.","meaning":"Boolean indicating whether the patient currently has any disorder of the respiratory system."} ;; "respiratory condition"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_mouth_breathing_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mouth-breathing."

(assert
(! (not patient_has_breathing_compromised_by_respiratory_condition_investigator_judgment_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any respiratory condition that, in the Investigator's judgment, could compromise breathing."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_disorder_of_cellular_component_of_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of cellular component of blood (hematological disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of cellular component of blood (hematological disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of cellular component of blood (hematological disease).","meaning":"Boolean indicating whether the patient currently has a disorder of cellular component of blood (hematological disease)."} ;; "hematological disease"
(declare-const patient_has_finding_of_disorder_of_cellular_component_of_blood_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hematological disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's hematological disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hematological disease is clinically significant.","meaning":"Boolean indicating whether the patient's hematological disease is clinically significant."} ;; "clinically significant hematological disease"
(declare-const patient_has_finding_of_disorder_of_cellular_component_of_blood_now@@aspirin_or_acetaminophen_contraindicated Bool) ;; {"when_to_set_to_true":"Set to true if aspirin or acetaminophen is contraindicated for the patient's hematological disease.","when_to_set_to_false":"Set to false if neither aspirin nor acetaminophen is contraindicated for the patient's hematological disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin or acetaminophen is contraindicated for the patient's hematological disease.","meaning":"Boolean indicating whether aspirin or acetaminophen is contraindicated for the patient's hematological disease."} ;; "hematological disease for which aspirin or acetaminophen is contraindicated"

(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease (renal disease).","when_to_set_to_false":"Set to false if the patient currently does not have kidney disease (renal disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease (renal disease).","meaning":"Boolean indicating whether the patient currently has kidney disease (renal disease)."} ;; "renal disease"
(declare-const patient_has_finding_of_kidney_disease_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's renal disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal disease is clinically significant.","meaning":"Boolean indicating whether the patient's renal disease is clinically significant."} ;; "clinically significant renal disease"
(declare-const patient_has_finding_of_kidney_disease_now@@aspirin_or_acetaminophen_contraindicated Bool) ;; {"when_to_set_to_true":"Set to true if aspirin or acetaminophen is contraindicated for the patient's renal disease.","when_to_set_to_false":"Set to false if neither aspirin nor acetaminophen is contraindicated for the patient's renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin or acetaminophen is contraindicated for the patient's renal disease.","meaning":"Boolean indicating whether aspirin or acetaminophen is contraindicated for the patient's renal disease."} ;; "renal disease for which aspirin or acetaminophen is contraindicated"

(declare-const patient_has_finding_of_disorder_of_endocrine_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disorder of endocrine system (endocrine disease).","when_to_set_to_false":"Set to false if the patient currently does not have disorder of endocrine system (endocrine disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disorder of endocrine system (endocrine disease).","meaning":"Boolean indicating whether the patient currently has disorder of endocrine system (endocrine disease)."} ;; "endocrine disease"
(declare-const patient_has_finding_of_disorder_of_endocrine_system_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's endocrine disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's endocrine disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's endocrine disease is clinically significant.","meaning":"Boolean indicating whether the patient's endocrine disease is clinically significant."} ;; "clinically significant endocrine disease"
(declare-const patient_has_finding_of_disorder_of_endocrine_system_now@@aspirin_or_acetaminophen_contraindicated Bool) ;; {"when_to_set_to_true":"Set to true if aspirin or acetaminophen is contraindicated for the patient's endocrine disease.","when_to_set_to_false":"Set to false if neither aspirin nor acetaminophen is contraindicated for the patient's endocrine disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin or acetaminophen is contraindicated for the patient's endocrine disease.","meaning":"Boolean indicating whether aspirin or acetaminophen is contraindicated for the patient's endocrine disease."} ;; "endocrine disease for which aspirin or acetaminophen is contraindicated"

(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disorder of lung (pulmonary disease).","when_to_set_to_false":"Set to false if the patient currently does not have disorder of lung (pulmonary disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disorder of lung (pulmonary disease).","meaning":"Boolean indicating whether the patient currently has disorder of lung (pulmonary disease)."} ;; "pulmonary disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's pulmonary disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary disease is clinically significant.","meaning":"Boolean indicating whether the patient's pulmonary disease is clinically significant."} ;; "clinically significant pulmonary disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@aspirin_or_acetaminophen_contraindicated Bool) ;; {"when_to_set_to_true":"Set to true if aspirin or acetaminophen is contraindicated for the patient's pulmonary disease.","when_to_set_to_false":"Set to false if neither aspirin nor acetaminophen is contraindicated for the patient's pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin or acetaminophen is contraindicated for the patient's pulmonary disease.","meaning":"Boolean indicating whether aspirin or acetaminophen is contraindicated for the patient's pulmonary disease."} ;; "pulmonary disease for which aspirin or acetaminophen is contraindicated"

(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disorder of gastrointestinal tract (gastrointestinal disease).","when_to_set_to_false":"Set to false if the patient currently does not have disorder of gastrointestinal tract (gastrointestinal disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disorder of gastrointestinal tract (gastrointestinal disease).","meaning":"Boolean indicating whether the patient currently has disorder of gastrointestinal tract (gastrointestinal disease)."} ;; "gastrointestinal disease"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastrointestinal disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's gastrointestinal disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's gastrointestinal disease is clinically significant.","meaning":"Boolean indicating whether the patient's gastrointestinal disease is clinically significant."} ;; "clinically significant gastrointestinal disease"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@aspirin_or_acetaminophen_contraindicated Bool) ;; {"when_to_set_to_true":"Set to true if aspirin or acetaminophen is contraindicated for the patient's gastrointestinal disease.","when_to_set_to_false":"Set to false if neither aspirin nor acetaminophen is contraindicated for the patient's gastrointestinal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin or acetaminophen is contraindicated for the patient's gastrointestinal disease.","meaning":"Boolean indicating whether aspirin or acetaminophen is contraindicated for the patient's gastrointestinal disease."} ;; "gastrointestinal disease for which aspirin or acetaminophen is contraindicated"

(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disorder of cardiovascular system (cardiovascular disease).","when_to_set_to_false":"Set to false if the patient currently does not have disorder of cardiovascular system (cardiovascular disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disorder of cardiovascular system (cardiovascular disease).","meaning":"Boolean indicating whether the patient currently has disorder of cardiovascular system (cardiovascular disease)."} ;; "cardiovascular disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiovascular disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's cardiovascular disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiovascular disease is clinically significant.","meaning":"Boolean indicating whether the patient's cardiovascular disease is clinically significant."} ;; "clinically significant cardiovascular disease"

(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disease of liver (hepatic disease).","when_to_set_to_false":"Set to false if the patient currently does not have disease of liver (hepatic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disease of liver (hepatic disease).","meaning":"Boolean indicating whether the patient currently has disease of liver (hepatic disease)."} ;; "hepatic disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hepatic disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's hepatic disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hepatic disease is clinically significant.","meaning":"Boolean indicating whether the patient's hepatic disease is clinically significant."} ;; "clinically significant hepatic disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@aspirin_or_acetaminophen_contraindicated Bool) ;; {"when_to_set_to_true":"Set to true if aspirin or acetaminophen is contraindicated for the patient's hepatic disease.","when_to_set_to_false":"Set to false if neither aspirin nor acetaminophen is contraindicated for the patient's hepatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin or acetaminophen is contraindicated for the patient's hepatic disease.","meaning":"Boolean indicating whether aspirin or acetaminophen is contraindicated for the patient's hepatic disease."} ;; "hepatic disease for which aspirin or acetaminophen is contraindicated"

(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mental disorder (psychiatric disease).","when_to_set_to_false":"Set to false if the patient currently does not have mental disorder (psychiatric disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mental disorder (psychiatric disease).","meaning":"Boolean indicating whether the patient currently has mental disorder (psychiatric disease)."} ;; "psychiatric disease"
(declare-const patient_has_finding_of_mental_disorder_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's psychiatric disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's psychiatric disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's psychiatric disease is clinically significant.","meaning":"Boolean indicating whether the patient's psychiatric disease is clinically significant."} ;; "clinically significant psychiatric disease"
(declare-const patient_has_finding_of_mental_disorder_now@@aspirin_or_acetaminophen_contraindicated Bool) ;; {"when_to_set_to_true":"Set to true if aspirin or acetaminophen is contraindicated for the patient's psychiatric disease.","when_to_set_to_false":"Set to false if neither aspirin nor acetaminophen is contraindicated for the patient's psychiatric disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin or acetaminophen is contraindicated for the patient's psychiatric disease.","meaning":"Boolean indicating whether aspirin or acetaminophen is contraindicated for the patient's psychiatric disease."} ;; "psychiatric disease for which aspirin or acetaminophen is contraindicated"

(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has disorder of nervous system (neurologic disease).","when_to_set_to_false":"Set to false if the patient currently does not have disorder of nervous system (neurologic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disorder of nervous system (neurologic disease).","meaning":"Boolean indicating whether the patient currently has disorder of nervous system (neurologic disease)."} ;; "neurologic disease"
(declare-const patient_has_finding_of_disorder_of_nervous_system_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neurologic disease is clinically significant.","when_to_set_to_false":"Set to false if the patient's neurologic disease is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neurologic disease is clinically significant.","meaning":"Boolean indicating whether the patient's neurologic disease is clinically significant."} ;; "clinically significant neurologic disease"
(declare-const patient_has_finding_of_disorder_of_nervous_system_now@@aspirin_or_acetaminophen_contraindicated Bool) ;; {"when_to_set_to_true":"Set to true if aspirin or acetaminophen is contraindicated for the patient's neurologic disease.","when_to_set_to_false":"Set to false if neither aspirin nor acetaminophen is contraindicated for the patient's neurologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin or acetaminophen is contraindicated for the patient's neurologic disease.","meaning":"Boolean indicating whether aspirin or acetaminophen is contraindicated for the patient's neurologic disease."} ;; "neurologic disease for which aspirin or acetaminophen is contraindicated"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease (malignancy)."} ;; "malignancy"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignancy is clinically significant.","when_to_set_to_false":"Set to false if the patient's malignancy is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignancy is clinically significant.","meaning":"Boolean indicating whether the patient's malignancy is clinically significant."} ;; "clinically significant malignancy"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@aspirin_or_acetaminophen_contraindicated Bool) ;; {"when_to_set_to_true":"Set to true if aspirin or acetaminophen is contraindicated for the patient's malignancy.","when_to_set_to_false":"Set to false if neither aspirin nor acetaminophen is contraindicated for the patient's malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin or acetaminophen is contraindicated for the patient's malignancy.","meaning":"Boolean indicating whether aspirin or acetaminophen is contraindicated for the patient's malignancy."} ;; "malignancy for which aspirin or acetaminophen is contraindicated"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_cellular_component_of_blood_now@@clinically_significant
      patient_has_finding_of_disorder_of_cellular_component_of_blood_now)
:named REQ7_AUXILIARY0)) ;; "clinically significant hematological disease"

(assert
(! (=> patient_has_finding_of_disorder_of_cellular_component_of_blood_now@@aspirin_or_acetaminophen_contraindicated
      patient_has_finding_of_disorder_of_cellular_component_of_blood_now)
:named REQ7_AUXILIARY1)) ;; "hematological disease for which aspirin or acetaminophen is contraindicated"

(assert
(! (=> patient_has_finding_of_kidney_disease_now@@clinically_significant
      patient_has_finding_of_kidney_disease_now)
:named REQ7_AUXILIARY2)) ;; "clinically significant renal disease"

(assert
(! (=> patient_has_finding_of_kidney_disease_now@@aspirin_or_acetaminophen_contraindicated
      patient_has_finding_of_kidney_disease_now)
:named REQ7_AUXILIARY3)) ;; "renal disease for which aspirin or acetaminophen is contraindicated"

(assert
(! (=> patient_has_finding_of_disorder_of_endocrine_system_now@@clinically_significant
      patient_has_finding_of_disorder_of_endocrine_system_now)
:named REQ7_AUXILIARY4)) ;; "clinically significant endocrine disease"

(assert
(! (=> patient_has_finding_of_disorder_of_endocrine_system_now@@aspirin_or_acetaminophen_contraindicated
      patient_has_finding_of_disorder_of_endocrine_system_now)
:named REQ7_AUXILIARY5)) ;; "endocrine disease for which aspirin or acetaminophen is contraindicated"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@clinically_significant
      patient_has_finding_of_disorder_of_lung_now)
:named REQ7_AUXILIARY6)) ;; "clinically significant pulmonary disease"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@aspirin_or_acetaminophen_contraindicated
      patient_has_finding_of_disorder_of_lung_now)
:named REQ7_AUXILIARY7)) ;; "pulmonary disease for which aspirin or acetaminophen is contraindicated"

(assert
(! (=> patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@clinically_significant
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ7_AUXILIARY8)) ;; "clinically significant gastrointestinal disease"

(assert
(! (=> patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@aspirin_or_acetaminophen_contraindicated
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ7_AUXILIARY9)) ;; "gastrointestinal disease for which aspirin or acetaminophen is contraindicated"

(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_now@@clinically_significant
      patient_has_finding_of_disorder_of_cardiovascular_system_now)
:named REQ7_AUXILIARY10)) ;; "clinically significant cardiovascular disease"

(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@clinically_significant
      patient_has_finding_of_disease_of_liver_now)
:named REQ7_AUXILIARY11)) ;; "clinically significant hepatic disease"

(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@aspirin_or_acetaminophen_contraindicated
      patient_has_finding_of_disease_of_liver_now)
:named REQ7_AUXILIARY12)) ;; "hepatic disease for which aspirin or acetaminophen is contraindicated"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@clinically_significant
      patient_has_finding_of_mental_disorder_now)
:named REQ7_AUXILIARY13)) ;; "clinically significant psychiatric disease"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@aspirin_or_acetaminophen_contraindicated
      patient_has_finding_of_mental_disorder_now)
:named REQ7_AUXILIARY14)) ;; "psychiatric disease for which aspirin or acetaminophen is contraindicated"

(assert
(! (=> patient_has_finding_of_disorder_of_nervous_system_now@@clinically_significant
      patient_has_finding_of_disorder_of_nervous_system_now)
:named REQ7_AUXILIARY15)) ;; "clinically significant neurologic disease"

(assert
(! (=> patient_has_finding_of_disorder_of_nervous_system_now@@aspirin_or_acetaminophen_contraindicated
      patient_has_finding_of_disorder_of_nervous_system_now)
:named REQ7_AUXILIARY16)) ;; "neurologic disease for which aspirin or acetaminophen is contraindicated"

(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@clinically_significant
      patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ7_AUXILIARY17)) ;; "clinically significant malignancy"

(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@aspirin_or_acetaminophen_contraindicated
      patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ7_AUXILIARY18)) ;; "malignancy for which aspirin or acetaminophen is contraindicated"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and patient_has_finding_of_disorder_of_cellular_component_of_blood_now@@clinically_significant
             patient_has_finding_of_disorder_of_cellular_component_of_blood_now@@aspirin_or_acetaminophen_contraindicated))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically significant hematological disease for which aspirin or acetaminophen is contraindicated."

(assert
(! (not (and patient_has_finding_of_kidney_disease_now@@clinically_significant
             patient_has_finding_of_kidney_disease_now@@aspirin_or_acetaminophen_contraindicated))
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically significant renal disease for which aspirin or acetaminophen is contraindicated."

(assert
(! (not (and patient_has_finding_of_disorder_of_endocrine_system_now@@clinically_significant
             patient_has_finding_of_disorder_of_endocrine_system_now@@aspirin_or_acetaminophen_contraindicated))
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically significant endocrine disease for which aspirin or acetaminophen is contraindicated."

(assert
(! (not (and patient_has_finding_of_disorder_of_lung_now@@clinically_significant
             patient_has_finding_of_disorder_of_lung_now@@aspirin_or_acetaminophen_contraindicated))
:named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically significant pulmonary disease for which aspirin or acetaminophen is contraindicated."

(assert
(! (not (and patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@clinically_significant
             patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@aspirin_or_acetaminophen_contraindicated))
:named REQ7_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically significant gastrointestinal disease for which aspirin or acetaminophen is contraindicated."

(assert
(! (not (and patient_has_finding_of_disorder_of_cardiovascular_system_now@@clinically_significant
             ;; No explicit contraindication qualifier for cardiovascular disease in new_variable_declarations
             ;; So only clinically significant cardiovascular disease is asserted
             ;; If contraindication qualifier is later added, update accordingly
             true))
:named REQ7_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically significant cardiovascular disease for which aspirin or acetaminophen is contraindicated."

(assert
(! (not (and patient_has_finding_of_disease_of_liver_now@@clinically_significant
             patient_has_finding_of_disease_of_liver_now@@aspirin_or_acetaminophen_contraindicated))
:named REQ7_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically significant hepatic disease for which aspirin or acetaminophen is contraindicated."

(assert
(! (not (and patient_has_finding_of_mental_disorder_now@@clinically_significant
             patient_has_finding_of_mental_disorder_now@@aspirin_or_acetaminophen_contraindicated))
:named REQ7_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically significant psychiatric disease for which aspirin or acetaminophen is contraindicated."

(assert
(! (not (and patient_has_finding_of_disorder_of_nervous_system_now@@clinically_significant
             patient_has_finding_of_disorder_of_nervous_system_now@@aspirin_or_acetaminophen_contraindicated))
:named REQ7_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically significant neurologic disease for which aspirin or acetaminophen is contraindicated."

(assert
(! (not (and patient_has_finding_of_malignant_neoplastic_disease_now@@clinically_significant
             patient_has_finding_of_malignant_neoplastic_disease_now@@aspirin_or_acetaminophen_contraindicated))
:named REQ7_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically significant malignancy for which aspirin or acetaminophen is contraindicated."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a co-morbid condition (concomitant disease).","when_to_set_to_false":"Set to false if the patient currently does not have a co-morbid condition (concomitant disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a co-morbid condition (concomitant disease).","meaning":"Boolean indicating whether the patient currently has a co-morbid condition (concomitant disease) now."} ;; "concomitant disease"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's co-morbid condition (concomitant disease) is considered relevant to the exclusion criteria.","when_to_set_to_false":"Set to false if the patient's co-morbid condition (concomitant disease) is not considered relevant to the exclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's co-morbid condition (concomitant disease) is relevant.","meaning":"Boolean indicating whether the patient's co-morbid condition (concomitant disease) is relevant to the exclusion criteria."} ;; "relevant concomitant disease"
(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has asthma.","when_to_set_to_false":"Set to false if the patient currently does not have asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has asthma.","meaning":"Boolean indicating whether the patient currently has asthma now."} ;; "asthma"
(declare-const patient_has_finding_of_asthma_now@@medically_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's asthma is medically uncontrolled.","when_to_set_to_false":"Set to false if the patient's asthma is not medically uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's asthma is medically uncontrolled.","meaning":"Boolean indicating whether the patient's asthma is medically uncontrolled."} ;; "medically uncontrolled asthma"
(declare-const patient_has_finding_of_chronic_sinusitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic sinusitis.","when_to_set_to_false":"Set to false if the patient currently does not have chronic sinusitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic sinusitis.","meaning":"Boolean indicating whether the patient currently has chronic sinusitis now."} ;; "chronic sinusitis"
(declare-const patient_has_finding_of_nasal_structural_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a nasal structural abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have a nasal structural abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a nasal structural abnormality.","meaning":"Boolean indicating whether the patient currently has a nasal structural abnormality."} ;; "nasal structural abnormality"
(declare-const patient_has_finding_of_nasal_structural_abnormality_now@@causing_greater_than_50_percent_obstruction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's nasal structural abnormality causes greater than fifty percent obstruction.","when_to_set_to_false":"Set to false if the patient's nasal structural abnormality does not cause greater than fifty percent obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's nasal structural abnormality causes greater than fifty percent obstruction.","meaning":"Boolean indicating whether the patient's nasal structural abnormality causes greater than fifty percent obstruction."} ;; "nasal structural abnormality causing greater than fifty percent obstruction"
(declare-const nasal_obstruction_percentage_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the percentage value if the patient's current nasal obstruction percentage is known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's current nasal obstruction percentage is.","meaning":"Numeric value indicating the percentage of nasal obstruction currently present in the patient, with unit percent."} ;; "greater than fifty percent obstruction"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive example: Medically uncontrolled asthma is a relevant concomitant disease
(assert
(! (=> patient_has_finding_of_asthma_now@@medically_uncontrolled
     patient_has_finding_of_co_morbid_conditions_now@@relevant)
:named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples (medically uncontrolled asthma)"

;; Qualifier variable implies stem variable for co-morbid conditions
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@relevant
     patient_has_finding_of_co_morbid_conditions_now)
:named REQ8_AUXILIARY1)) ;; "relevant concomitant disease"

;; Qualifier variable implies stem variable for asthma
(assert
(! (=> patient_has_finding_of_asthma_now@@medically_uncontrolled
     patient_has_finding_of_asthma_now)
:named REQ8_AUXILIARY2)) ;; "medically uncontrolled asthma"

;; Qualifier variable implies stem variable for nasal structural abnormality
(assert
(! (=> patient_has_finding_of_nasal_structural_abnormality_now@@causing_greater_than_50_percent_obstruction
     patient_has_finding_of_nasal_structural_abnormality_now)
:named REQ8_AUXILIARY3)) ;; "nasal structural abnormality causing greater than fifty percent obstruction"

;; Definitional link: Nasal structural abnormality causing >50% obstruction iff obstruction percentage > 50
(assert
(! (= patient_has_finding_of_nasal_structural_abnormality_now@@causing_greater_than_50_percent_obstruction
     (> nasal_obstruction_percentage_value_recorded_now_withunit_percent 50))
:named REQ8_AUXILIARY4)) ;; "causing greater than fifty percent obstruction"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: relevant concomitant disease (with non-exhaustive example medically uncontrolled asthma)
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@relevant)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a relevant concomitant disease with non-exhaustive examples (medically uncontrolled asthma)"

;; Exclusion: chronic sinusitis
(assert
(! (not patient_has_finding_of_chronic_sinusitis_now)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has chronic sinusitis"

;; Exclusion: nasal structural abnormality causing >50% obstruction
(assert
(! (not patient_has_finding_of_nasal_structural_abnormality_now@@causing_greater_than_50_percent_obstruction)
:named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has nasal structural abnormality causing greater than fifty percent obstruction"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_gastrointestinal_hemorrhage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of gastrointestinal hemorrhage (bleeding) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a history of gastrointestinal hemorrhage (bleeding) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of gastrointestinal hemorrhage (bleeding).","meaning":"Boolean indicating whether the patient has ever had a history of gastrointestinal hemorrhage (bleeding)."} ;; "gastrointestinal bleeding"

(declare-const patient_has_finding_of_gastrointestinal_perforation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of gastrointestinal perforation at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a history of gastrointestinal perforation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of gastrointestinal perforation.","meaning":"Boolean indicating whether the patient has ever had a history of gastrointestinal perforation."} ;; "gastrointestinal perforation"

(declare-const patient_has_finding_of_gastrointestinal_perforation_inthehistory@@related_to_previous_nonsteroidal_anti_inflammatory_agent_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of gastrointestinal perforation is related to previous nonsteroidal anti-inflammatory drug therapy.","when_to_set_to_false":"Set to false if the patient's history of gastrointestinal perforation is not related to previous nonsteroidal anti-inflammatory drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of gastrointestinal perforation is related to previous nonsteroidal anti-inflammatory drug therapy.","meaning":"Boolean indicating whether the patient's history of gastrointestinal perforation is related to previous nonsteroidal anti-inflammatory drug therapy."} ;; "gastrointestinal perforation related to previous nonsteroidal anti-inflammatory drug therapy"

(declare-const patient_has_undergone_non_steroidal_anti_inflammatory_agent_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever previously undergone nonsteroidal anti-inflammatory drug therapy.","when_to_set_to_false":"Set to false if the patient has never previously undergone nonsteroidal anti-inflammatory drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever previously undergone nonsteroidal anti-inflammatory drug therapy.","meaning":"Boolean indicating whether the patient has ever previously undergone nonsteroidal anti-inflammatory drug therapy."} ;; "nonsteroidal anti-inflammatory drug therapy"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_gastrointestinal_perforation_inthehistory@@related_to_previous_nonsteroidal_anti_inflammatory_agent_therapy
      patient_has_finding_of_gastrointestinal_perforation_inthehistory)
    :named REQ9_AUXILIARY0)) ;; "gastrointestinal perforation related to previous nonsteroidal anti-inflammatory drug therapy"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: history of gastrointestinal bleeding
(assert
(! (not patient_has_finding_of_gastrointestinal_hemorrhage_inthehistory)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of gastrointestinal bleeding."

;; Exclusion: history of gastrointestinal perforation related to previous nonsteroidal anti-inflammatory drug therapy
(assert
(! (not patient_has_finding_of_gastrointestinal_perforation_inthehistory@@related_to_previous_nonsteroidal_anti_inflammatory_agent_therapy)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of gastrointestinal perforation related to previous nonsteroidal anti-inflammatory drug therapy."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of blood coagulation disorder (bleeding disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of blood coagulation disorder (bleeding disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of blood coagulation disorder (bleeding disorder).","meaning":"Boolean indicating whether the patient currently has a clinical finding of blood coagulation disorder (bleeding disorder)."} ;; "the patient has a current history of bleeding disorder"
(declare-const patient_has_finding_of_blood_coagulation_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinical finding of blood coagulation disorder (bleeding disorder) documented in their past history.","when_to_set_to_false":"Set to false if the patient does not have a clinical finding of blood coagulation disorder (bleeding disorder) documented in their past history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical finding of blood coagulation disorder (bleeding disorder) in their past history.","meaning":"Boolean indicating whether the patient has a clinical finding of blood coagulation disorder (bleeding disorder) in their past history."} ;; "the patient has a past history of bleeding disorder"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current history of bleeding disorder."

(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_inthehistory)
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of bleeding disorder."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_alcoholism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis or history of alcoholism at any time in the past, including self-reported cases.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis or history of alcoholism at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis or history of alcoholism.","meaning":"Boolean indicating whether the patient has ever had a diagnosis or history of alcoholism."} ;; "the patient has self-reported alcoholism"
(declare-const patient_has_diagnosis_of_alcoholism_inthehistory@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of alcoholism is based on self-report.","when_to_set_to_false":"Set to false if the patient's history of alcoholism is not based on self-report.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of alcoholism is self-reported.","meaning":"Boolean indicating whether the patient's history of alcoholism is self-reported."} ;; "the patient has self-reported alcoholism"
(declare-const patient_has_history_of_drug_abuse_within_2_years_prior_to_screening@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a self-reported history of drug abuse that occurred within two years prior to screening.","when_to_set_to_false":"Set to false if the patient does not have a self-reported history of drug abuse within two years prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a self-reported history of drug abuse within two years prior to screening.","meaning":"Boolean indicating whether the patient has a self-reported history of drug abuse within two years prior to screening."} ;; "the patient has self-reported drug abuse within two years prior to screening"
(declare-const patient_alcoholic_beverage_value_recorded_now_withunit_beverages_per_day Real) ;; {"when_to_set_to_value":"Set to the measured or self-reported number of alcohol-containing beverages the patient routinely consumes per day, if available.","when_to_set_to_null":"Set to null if the patient's routine daily consumption of alcohol-containing beverages is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current routine daily consumption of alcohol-containing beverages in beverages per day."} ;; "the patient has routine consumption of greater than or equal to three alcohol-containing beverages per day"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable for alcoholism
(assert
(! (=> patient_has_diagnosis_of_alcoholism_inthehistory@@self_reported
       patient_has_diagnosis_of_alcoholism_inthehistory)
   :named REQ11_AUXILIARY0)) ;; "the patient has self-reported alcoholism"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT have self-reported alcoholism
(assert
(! (not patient_has_diagnosis_of_alcoholism_inthehistory@@self_reported)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has self-reported alcoholism"

;; Exclusion: patient must NOT have self-reported drug abuse within two years prior to screening
(assert
(! (not patient_has_history_of_drug_abuse_within_2_years_prior_to_screening@@self_reported)
   :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has self-reported drug abuse within two years prior to screening"

;; Exclusion: patient must NOT have routine consumption of >= 3 alcohol-containing beverages per day
(assert
(! (not (>= patient_alcoholic_beverage_value_recorded_now_withunit_beverages_per_day 3))
   :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has routine consumption of greater than or equal to three alcohol-containing beverages per day"

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_habituation_to_analgesic_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has habituation to analgesic drugs.","when_to_set_to_false":"Set to false if the patient currently does not have habituation to analgesic drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has habituation to analgesic drugs.","meaning":"Boolean indicating whether the patient currently has habituation to analgesic drugs."} ;; "the patient has habituation to analgesic drugs"
(declare-const patient_has_habituation_to_tranquilizer_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has habituation to tranquilizer drugs.","when_to_set_to_false":"Set to false if the patient currently does not have habituation to tranquilizer drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has habituation to tranquilizer drugs.","meaning":"Boolean indicating whether the patient currently has habituation to tranquilizer drugs."} ;; "the patient has habituation to tranquilizer drugs"
(declare-const patient_routine_use_of_analgesic_drugs_per_week_value_recorded_in_the_history_withunit_times_per_week Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the number of times per week the patient has routinely used analgesic drugs, as recorded in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times per week the patient has routinely used analgesic drugs in the history.","meaning":"Numeric value indicating the number of times per week the patient has routinely used analgesic drugs, as recorded in the history."} ;; "routine use greater than or equal to five times per week"
(declare-const patient_duration_of_routine_analgesic_drug_use_value_recorded_in_the_history_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the duration in weeks of the patient's routine use of analgesic drugs, as recorded in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many weeks the patient has routinely used analgesic drugs in the history.","meaning":"Numeric value indicating the duration in weeks of the patient's routine use of analgesic drugs, as recorded in the history."} ;; "routine use for greater than three weeks"
(declare-const patient_routine_use_of_tranquilizer_drugs_per_week_value_recorded_in_the_history_withunit_times_per_week Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the number of times per week the patient has routinely used tranquilizer drugs, as recorded in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times per week the patient has routinely used tranquilizer drugs in the history.","meaning":"Numeric value indicating the number of times per week the patient has routinely used tranquilizer drugs, as recorded in the history."} ;; "routine use greater than or equal to five times per week"
(declare-const patient_duration_of_routine_tranquilizer_drug_use_value_recorded_in_the_history_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the duration in weeks of the patient's routine use of tranquilizer drugs, as recorded in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many weeks the patient has routinely used tranquilizer drugs in the history.","meaning":"Numeric value indicating the duration in weeks of the patient's routine use of tranquilizer drugs, as recorded in the history."} ;; "routine use for greater than three weeks"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Definition: Habituation to analgesic drugs = routine use >= 5 times/week for > 3 weeks
(assert
(! (= patient_has_habituation_to_analgesic_drugs_now
(and (>= patient_routine_use_of_analgesic_drugs_per_week_value_recorded_in_the_history_withunit_times_per_week 5)
     (> patient_duration_of_routine_analgesic_drug_use_value_recorded_in_the_history_withunit_weeks 3)))
:named REQ12_AUXILIARY0)) ;; "habituation to analgesic drugs defined as routine use greater than or equal to five times per week for greater than three weeks"

;; Definition: Habituation to tranquilizer drugs = routine use >= 5 times/week for > 3 weeks
(assert
(! (= patient_has_habituation_to_tranquilizer_drugs_now
(and (>= patient_routine_use_of_tranquilizer_drugs_per_week_value_recorded_in_the_history_withunit_times_per_week 5)
     (> patient_duration_of_routine_tranquilizer_drug_use_value_recorded_in_the_history_withunit_weeks 3)))
:named REQ12_AUXILIARY1)) ;; "habituation to tranquilizer drugs defined as routine use greater than or equal to five times per week for greater than three weeks"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_habituation_to_analgesic_drugs_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has habituation to analgesic drugs defined as routine use greater than or equal to five times per week for greater than three weeks."

(assert
(! (not patient_has_habituation_to_tranquilizer_drugs_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has habituation to tranquilizer drugs defined as routine use greater than or equal to five times per week for greater than three weeks."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute illness.","when_to_set_to_false":"Set to false if the patient currently does not have an acute illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute illness.","meaning":"Boolean indicating whether the patient currently has an acute illness."} ;; "acute illness"
(declare-const patient_has_finding_of_localized_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a localized infection.","when_to_set_to_false":"Set to false if the patient currently does not have a localized infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a localized infection.","meaning":"Boolean indicating whether the patient currently has a localized infection."} ;; "local infection"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@can_interfere_with_conduct_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's relevant co-morbid disease can interfere with the conduct of the study.","when_to_set_to_false":"Set to false if the patient's relevant co-morbid disease cannot interfere with the conduct of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease can interfere with the conduct of the study.","meaning":"Boolean indicating whether the patient's relevant co-morbid disease can interfere with the conduct of the study."} ;; "can interfere with the conduct of the study"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@other_than_upper_respiratory_tract_infection_with_pharyngeal_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's relevant co-morbid disease is other than upper respiratory tract infection with pharyngeal infection.","when_to_set_to_false":"Set to false if the patient's relevant co-morbid disease is an upper respiratory tract infection with pharyngeal infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is other than upper respiratory tract infection with pharyngeal infection.","meaning":"Boolean indicating whether the patient's relevant co-morbid disease is other than upper respiratory tract infection with pharyngeal infection."} ;; "other than upper respiratory tract infection with pharyngeal infection"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@relevant
       patient_has_finding_of_co_morbid_conditions_now)
   :named REQ13_AUXILIARY0)) ;; "relevant concomitant disease"

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@can_interfere_with_conduct_of_study
       patient_has_finding_of_co_morbid_conditions_now@@relevant)
   :named REQ13_AUXILIARY1)) ;; "can interfere with the conduct of the study"

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@other_than_upper_respiratory_tract_infection_with_pharyngeal_infection
       patient_has_finding_of_co_morbid_conditions_now@@relevant)
   :named REQ13_AUXILIARY2)) ;; "other than upper respiratory tract infection with pharyngeal infection"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: acute illness
(assert
(! (not patient_has_finding_of_acute_disease_now)
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acute illness."

;; Exclusion: local infection
(assert
(! (not patient_has_finding_of_localized_infection_now)
   :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a local infection."

;; Exclusion: disease other than upper respiratory tract infection with pharyngeal infection that can interfere with the conduct of the study
(assert
(! (not (and patient_has_finding_of_co_morbid_conditions_now@@relevant
             patient_has_finding_of_co_morbid_conditions_now@@can_interfere_with_conduct_of_study
             patient_has_finding_of_co_morbid_conditions_now@@other_than_upper_respiratory_tract_infection_with_pharyngeal_infection))
   :named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a disease other than upper respiratory tract infection with pharyngeal infection that can interfere with the conduct of the study."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_using_blood_thinning_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a blood thinning drug.","when_to_set_to_false":"Set to false if the patient is currently not using a blood thinning drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a blood thinning drug.","meaning":"Boolean indicating whether the patient is currently using a blood thinning drug."} ;; "the patient is currently using blood thinning drug"
(declare-const patient_is_exposed_to_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or exposed to an anticoagulant.","when_to_set_to_false":"Set to false if the patient is currently not using or exposed to an anticoagulant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using or exposed to an anticoagulant.","meaning":"Boolean indicating whether the patient is currently using or exposed to an anticoagulant."} ;; "the patient is currently using anticoagulant drug"
(declare-const patient_is_exposed_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or exposed to aspirin.","when_to_set_to_false":"Set to false if the patient is currently not using or exposed to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using or exposed to aspirin.","meaning":"Boolean indicating whether the patient is currently using or exposed to aspirin."} ;; "the patient is currently using aspirin"
(declare-const patient_is_exposed_to_aspirin_now@@low_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or exposed to aspirin and the aspirin is at a low dose.","when_to_set_to_false":"Set to false if the patient is currently using or exposed to aspirin but it is not at a low dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the aspirin is at a low dose.","meaning":"Boolean indicating whether the patient is currently using or exposed to aspirin at a low dose."} ;; "the patient is currently using low dose aspirin"
(declare-const patient_is_taking_steroid_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a steroid-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a steroid-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a steroid-containing product.","meaning":"Boolean indicating whether the patient is currently taking a steroid-containing product."} ;; "the patient is currently using steroid drug"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable for low dose aspirin implies stem variable
(assert
(! (=> patient_is_exposed_to_aspirin_now@@low_dose
      patient_is_exposed_to_aspirin_now)
:named REQ14_AUXILIARY0)) ;; "the patient is currently using low dose aspirin"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_using_blood_thinning_drug_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is currently using blood thinning drug"

(assert
(! (not patient_is_exposed_to_anticoagulant_now)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is currently using anticoagulant drug"

(assert
(! (not patient_is_exposed_to_aspirin_now@@low_dose)
:named REQ14_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is currently using low dose aspirin"

(assert
(! (not patient_is_taking_steroid_containing_product_now)
:named REQ14_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient is currently using steroid drug"

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_undergone_antidepressant_therapy_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has initiated antidepressant therapy within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not initiated antidepressant therapy within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has initiated antidepressant therapy within the past thirty days.","meaning":"Boolean indicating whether the patient has initiated antidepressant therapy within the past thirty days."} ;; "treatment for depression within the past thirty days"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_undergone_antidepressant_therapy_inthepast30days)
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has initiated treatment for depression within the past thirty days."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as not currently lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is female and the patient is pregnant."

(assert
(! (not (and patient_sex_is_female_now patient_is_lactating_now))
:named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is female and the patient is lactating."
