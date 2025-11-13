;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_radiotherapy_to_thorax_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone radiation therapy to the thorax (chest) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone radiation therapy to the thorax (chest) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone radiation therapy to the thorax (chest).","meaning":"Boolean indicating whether the patient has ever undergone radiation therapy to the thorax (chest) in their history."} ;; "The patient is excluded if the patient has a history of radiation therapy to the chest."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_radiotherapy_to_thorax_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of radiation therapy to the chest."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_head_and_neck_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor of the head and neck.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant tumor of the head and neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant tumor of the head and neck.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant tumor of the head and neck."} ;; "head and neck cancer"

(declare-const patient_has_received_radiation_therapy_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received radiation therapy at any point in their history.","when_to_set_to_false":"Set to false if the patient has never received radiation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received radiation therapy.","meaning":"Boolean indicating whether the patient has ever received radiation therapy."} ;; "received radiation therapy"

(declare-const patient_lung_volume_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if the percentage of the patient's lung volume (apices) included is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's lung volume (apices) included, recorded now."} ;; "more than ten percent of the lung volume (apices) was included"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_has_diagnosis_of_malignant_tumor_of_head_and_neck_now
             patient_has_received_radiation_therapy_ever
             (> patient_lung_volume_value_recorded_now_withunit_percent 10)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has head and neck cancer) AND (the patient received radiation therapy) AND (more than ten percent of the lung volume (apices) was included)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone chemotherapy at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone chemotherapy at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone chemotherapy.","meaning":"Boolean indicating whether the patient has ever undergone chemotherapy in their history."} ;; "chemotherapy"
(declare-const patient_has_undergone_chemotherapy_inthehistory@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the chemotherapy undergone by the patient was systemic.","when_to_set_to_false":"Set to false if the chemotherapy undergone by the patient was not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy was systemic.","meaning":"Boolean indicating whether the chemotherapy undergone by the patient was systemic."} ;; "systemic chemotherapy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_chemotherapy_inthehistory@@systemic
      patient_has_undergone_chemotherapy_inthehistory)
:named REQ2_AUXILIARY0)) ;; "systemic chemotherapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_chemotherapy_inthehistory@@systemic)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of systemic chemotherapy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding (positive status now)."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Link observable entity to main breast-feeding status
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ3_AUXILIARY0)) ;; "breast-feeding"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_infectious_disease_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary infection.","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary infection.","meaning":"Boolean indicating whether the patient currently has a pulmonary infection."} ;; "the patient has an active pulmonary infection"

(declare-const patient_has_finding_of_infectious_disease_of_lung_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pulmonary infection is active.","when_to_set_to_false":"Set to false if the patient's current pulmonary infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pulmonary infection is active.","meaning":"Boolean indicating whether the patient's current pulmonary infection is active."} ;; "active pulmonary infection"

(declare-const patient_has_finding_of_infectious_disease_of_lung_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a pulmonary infection within the past one month.","when_to_set_to_false":"Set to false if the patient has not had a pulmonary infection within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a pulmonary infection within the past one month.","meaning":"Boolean indicating whether the patient has had a pulmonary infection within the past one month."} ;; "recent history of pulmonary infection (within one month)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_infectious_disease_of_lung_now@@active
       patient_has_finding_of_infectious_disease_of_lung_now)
   :named REQ4_AUXILIARY0)) ;; "active pulmonary infection" implies "pulmonary infection now"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have active pulmonary infection now
(assert
(! (not patient_has_finding_of_infectious_disease_of_lung_now@@active)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has an active pulmonary infection"

;; Exclusion: patient must NOT have recent history of pulmonary infection (within one month)
(assert
(! (not patient_has_finding_of_infectious_disease_of_lung_inthepast1months)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a recent history of pulmonary infection (within one month)"

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness.","when_to_set_to_false":"Set to false if the patient currently does not have any illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any illness.","meaning":"Boolean indicating whether the patient currently has any illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@acute_and_intercurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is both acute and intercurrent.","when_to_set_to_false":"Set to false if the patient's current illness is not both acute and intercurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is both acute and intercurrent.","meaning":"Boolean indicating whether the patient's current illness is both acute and intercurrent."} ;; "acute intercurrent illness"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_illness_now@@acute_and_intercurrent
      patient_has_finding_of_illness_now)
:named REQ5_AUXILIARY0)) ;; "acute intercurrent illness" implies "illness"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_illness_now@@acute_and_intercurrent)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acute intercurrent illness."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_undergoing_non_steroidal_anti_inflammatory_agent_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing treatment with non-steroidal anti-inflammatory agents (NSAIDs) at the present time.","when_to_set_to_false":"Set to false if the patient is currently not undergoing treatment with non-steroidal anti-inflammatory agents (NSAIDs) at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing treatment with non-steroidal anti-inflammatory agents (NSAIDs).","meaning":"Boolean indicating whether the patient is currently undergoing treatment with non-steroidal anti-inflammatory agents (NSAIDs)."} ;; "chronic ongoing treatment with non-steroidal anti-inflammatory drugs"
(declare-const patient_is_undergoing_non_steroidal_anti_inflammatory_agent_therapy_now@@excludes_aspirin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current NSAID therapy specifically excludes aspirin (i.e., aspirin is not counted as a qualifying NSAID for this treatment variable).","when_to_set_to_false":"Set to false if the patient's current NSAID therapy includes aspirin as a qualifying NSAID for this treatment variable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin is excluded from the patient's current NSAID therapy.","meaning":"Boolean indicating whether aspirin is excluded from the definition of current NSAID therapy for this variable."} ;; "except aspirin"
(declare-const patient_requires_chronic_ongoing_non_steroidal_anti_inflammatory_agent_treatment_now@@excludes_aspirin Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires chronic ongoing treatment with NSAIDs, and the treatment specifically excludes aspirin as a qualifying drug.","when_to_set_to_false":"Set to false if the patient does not currently require chronic ongoing treatment with NSAIDs, or if the treatment includes aspirin as a qualifying drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires chronic ongoing treatment with NSAIDs excluding aspirin.","meaning":"Boolean indicating whether the patient currently requires chronic ongoing treatment with NSAIDs, specifically excluding aspirin."} ;; "requires chronic ongoing treatment with non-steroidal anti-inflammatory drugs except aspirin"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; The variable with the @@excludes_aspirin qualifier implies the stem variable
(assert
(! (=> patient_is_undergoing_non_steroidal_anti_inflammatory_agent_therapy_now@@excludes_aspirin
       patient_is_undergoing_non_steroidal_anti_inflammatory_agent_therapy_now)
    :named REQ6_AUXILIARY0)) ;; "therapy specifically excludes aspirin"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_requires_chronic_ongoing_non_steroidal_anti_inflammatory_agent_treatment_now@@excludes_aspirin)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires chronic ongoing treatment with non-steroidal anti-inflammatory drugs except aspirin."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident (stroke) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has a history of cerebrovascular accident (stroke)."} ;; "the patient has a history of stroke"
(declare-const patient_has_finding_of_hypertensive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypertensive disorder (hypertension) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a hypertensive disorder (hypertension) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient has a history of hypertensive disorder (hypertension)."} ;; "hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_inthehistory@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertensive disorder (hypertension) in their history is uncontrolled.","when_to_set_to_false":"Set to false if the patient's hypertensive disorder (hypertension) in their history is controlled or not uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypertensive disorder (hypertension) in their history is uncontrolled.","meaning":"Boolean indicating whether the patient's hypertensive disorder (hypertension) in their history is uncontrolled."} ;; "uncontrolled hypertension"
(declare-const patient_has_finding_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had angina pectoris at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had angina pectoris in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had angina pectoris.","meaning":"Boolean indicating whether the patient has a history of angina pectoris."} ;; "angina pectoris"
(declare-const patient_has_finding_of_angina_pectoris_inthehistory@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's angina pectoris in their history is uncontrolled.","when_to_set_to_false":"Set to false if the patient's angina pectoris in their history is controlled or not uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris in their history is uncontrolled.","meaning":"Boolean indicating whether the patient's angina pectoris in their history is uncontrolled."} ;; "uncontrolled angina pectoris"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hypertensive_disorder_inthehistory@@uncontrolled
      patient_has_finding_of_hypertensive_disorder_inthehistory)
   :named REQ7_AUXILIARY0)) ;; "uncontrolled hypertension" implies "hypertensive disorder in history"

(assert
(! (=> patient_has_finding_of_angina_pectoris_inthehistory@@uncontrolled
      patient_has_finding_of_angina_pectoris_inthehistory)
   :named REQ7_AUXILIARY1)) ;; "uncontrolled angina pectoris" implies "angina pectoris in history"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthehistory)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stroke."

(assert
(! (not patient_has_finding_of_hypertensive_disorder_inthehistory@@uncontrolled)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled hypertension."

(assert
(! (not patient_has_finding_of_angina_pectoris_inthehistory@@uncontrolled)
   :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled angina pectoris."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_food_antioxidant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to food antioxidants (e.g., by taking them during the study period).","when_to_set_to_false":"Set to false if the patient is not currently exposed to food antioxidants.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to food antioxidants.","meaning":"Boolean indicating whether the patient is currently exposed to food antioxidants."} ;; "antioxidants"
(declare-const patient_is_exposed_to_food_antioxidant_now@@high_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to food antioxidants and the exposure is at a high dose, as determined by study investigators.","when_to_set_to_false":"Set to false if the patient is currently exposed to food antioxidants but not at a high dose, or not exposed at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to food antioxidants is at a high dose.","meaning":"Boolean indicating whether the patient is currently exposed to food antioxidants at a high dose."} ;; "high dose antioxidants"
(declare-const patient_is_exposed_to_vitamin_e_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to vitamin E (e.g., by taking it during the study period).","when_to_set_to_false":"Set to false if the patient is not currently exposed to vitamin E.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to vitamin E.","meaning":"Boolean indicating whether the patient is currently exposed to vitamin E."} ;; "vitamins E"
(declare-const patient_is_exposed_to_vitamin_e_now@@high_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to vitamin E and the exposure is at a high dose, as determined by study investigators.","when_to_set_to_false":"Set to false if the patient is currently exposed to vitamin E but not at a high dose, or not exposed at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to vitamin E is at a high dose.","meaning":"Boolean indicating whether the patient is currently exposed to vitamin E at a high dose."} ;; "high dose vitamins E"
(declare-const patient_is_exposed_to_ascorbic_acid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ascorbic acid (vitamin C) (e.g., by taking it during the study period).","when_to_set_to_false":"Set to false if the patient is not currently exposed to ascorbic acid (vitamin C).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ascorbic acid (vitamin C).","meaning":"Boolean indicating whether the patient is currently exposed to ascorbic acid (vitamin C)."} ;; "vitamins C"
(declare-const patient_is_exposed_to_ascorbic_acid_now@@high_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ascorbic acid (vitamin C) and the exposure is at a high dose, as determined by study investigators.","when_to_set_to_false":"Set to false if the patient is currently exposed to ascorbic acid (vitamin C) but not at a high dose, or not exposed at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to ascorbic acid (vitamin C) is at a high dose.","meaning":"Boolean indicating whether the patient is currently exposed to ascorbic acid (vitamin C) at a high dose."} ;; "high dose vitamins C"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_food_antioxidant_now@@high_dose
      patient_is_exposed_to_food_antioxidant_now)
    :named REQ8_AUXILIARY0)) ;; "high dose antioxidants"

(assert
(! (=> patient_is_exposed_to_vitamin_e_now@@high_dose
      patient_is_exposed_to_vitamin_e_now)
    :named REQ8_AUXILIARY1)) ;; "high dose vitamins E"

(assert
(! (=> patient_is_exposed_to_ascorbic_acid_now@@high_dose
      patient_is_exposed_to_ascorbic_acid_now)
    :named REQ8_AUXILIARY2)) ;; "high dose vitamins C"

;; High dose antioxidants = high dose vitamin E OR high dose vitamin C (exhaustive subcategories)
(assert
(! (= patient_is_exposed_to_food_antioxidant_now@@high_dose
      (or patient_is_exposed_to_vitamin_e_now@@high_dose
          patient_is_exposed_to_ascorbic_acid_now@@high_dose))
    :named REQ8_AUXILIARY3)) ;; "high dose antioxidants (high dose vitamins E OR high dose vitamins C)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_exposed_to_food_antioxidant_now@@high_dose)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient takes high dose antioxidants (high dose vitamins E OR high dose vitamins C) during the study period, where high dose will be determined by the study investigators."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const additional_vitamin_a_supplementation_to_be_evaluated_by_treating_physician Bool) ;; {"when_to_set_to_true":"Set to true if any additional vitamin A supplementation for the patient will be evaluated at the discretion of the treating physician.","when_to_set_to_false":"Set to false if additional vitamin A supplementation for the patient will not be evaluated at the discretion of the treating physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether additional vitamin A supplementation for the patient will be evaluated at the discretion of the treating physician.","meaning":"Boolean indicating whether any additional vitamin A supplementation for the patient will be evaluated at the discretion of the treating physician."} ;; "any additional supplementation will be evaluated at the discretion of the treating physician."
(declare-const patient_is_taking_multivitamin_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a multivitamin agent.","when_to_set_to_false":"Set to false if the patient is currently not taking a multivitamin agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a multivitamin agent.","meaning":"Boolean indicating whether the patient is currently taking a multivitamin agent."} ;; "multivitamin"
(declare-const patient_is_taking_vitamin_a_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any synthetic vitamin A derivative.","when_to_set_to_false":"Set to false if the patient is currently not taking any synthetic vitamin A derivative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any synthetic vitamin A derivative.","meaning":"Boolean indicating whether the patient is currently taking any synthetic vitamin A derivative."} ;; "vitamin A"
(declare-const patient_is_taking_vitamin_a_now@@synthetic_derivative Bool) ;; {"when_to_set_to_true":"Set to true if the vitamin A currently taken by the patient is a synthetic derivative.","when_to_set_to_false":"Set to false if the vitamin A currently taken by the patient is not a synthetic derivative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vitamin A currently taken by the patient is a synthetic derivative.","meaning":"Boolean indicating whether the vitamin A currently taken by the patient is a synthetic derivative."} ;; "synthetic vitamin A derivative"
(declare-const patient_is_taking_vitamin_a_now@@natural_derivative Bool) ;; {"when_to_set_to_true":"Set to true if the vitamin A currently taken by the patient is a natural derivative.","when_to_set_to_false":"Set to false if the vitamin A currently taken by the patient is not a natural derivative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vitamin A currently taken by the patient is a natural derivative.","meaning":"Boolean indicating whether the vitamin A currently taken by the patient is a natural derivative."} ;; "natural vitamin A derivative"
(declare-const vitamin_a_daily_dose_value_recorded_now_in_international_units Real) ;; {"when_to_set_to_value":"Set to the total daily dose of vitamin A (including all forms and sources) currently taken by the patient, in international units.","when_to_set_to_null":"Set to null if the total daily dose of vitamin A currently taken by the patient is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the total daily dose of vitamin A (including all forms and sources) currently taken by the patient, in international units."} ;; "greater than ten thousand international units per day"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_taking_vitamin_a_now@@synthetic_derivative
      patient_is_taking_vitamin_a_now)
:named REQ9_AUXILIARY0)) ;; "synthetic vitamin A derivative"

(assert
(! (=> patient_is_taking_vitamin_a_now@@natural_derivative
      patient_is_taking_vitamin_a_now)
:named REQ9_AUXILIARY1)) ;; "natural vitamin A derivative"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient takes high dose synthetic vitamin A derivatives
(assert
(! (not (and patient_is_taking_vitamin_a_now@@synthetic_derivative
             (not patient_is_taking_multivitamin_agent_now)))
:named REQ9_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient takes high dose synthetic vitamin A derivatives, where high dose is defined as anything greater than a once-daily multivitamin."

;; Exclusion: patient takes high dose natural vitamin A derivatives (>10,000 IU/day), where high dose is defined as anything greater than a once-daily multivitamin
(assert
(! (not (and patient_is_taking_vitamin_a_now@@natural_derivative
             (or (> vitamin_a_daily_dose_value_recorded_now_in_international_units 10000)
                 (not patient_is_taking_multivitamin_agent_now))))
:named REQ9_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient takes high dose natural vitamin A derivatives (greater than ten thousand international units per day), where high dose is defined as anything greater than a once-daily multivitamin."
