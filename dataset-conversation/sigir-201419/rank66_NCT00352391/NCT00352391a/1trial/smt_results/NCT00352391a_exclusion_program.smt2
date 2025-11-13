;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_radiotherapy_to_thorax_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone radiation therapy to the chest (thorax) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone radiation therapy to the chest (thorax) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone radiation therapy to the chest (thorax).","meaning":"Boolean indicating whether the patient has ever undergone radiation therapy to the chest (thorax) in their history."} ;; "has a history of radiation therapy to the chest"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_radiotherapy_to_thorax_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of radiation therapy to the chest."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone administration of an antineoplastic agent (systemic chemotherapy) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone administration of an antineoplastic agent (systemic chemotherapy) at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of an antineoplastic agent (systemic chemotherapy).","meaning":"Boolean indicating whether the patient has ever undergone administration of an antineoplastic agent (systemic chemotherapy) at any time in their history."} ;; "history of systemic chemotherapy"

(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@platinum_based_doublet_regimen Bool) ;; {"when_to_set_to_true":"Set to true if the administration of antineoplastic agent was specifically a platinum-based doublet regimen.","when_to_set_to_false":"Set to false if the administration of antineoplastic agent was not a platinum-based doublet regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration of antineoplastic agent was a platinum-based doublet regimen.","meaning":"Boolean indicating whether the administration of antineoplastic agent was a platinum-based doublet regimen."} ;; "platinum-based doublet chemotherapy"

(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@number_of_cycles Real) ;; {"when_to_set_to_value":"Set to the number of cycles if the number of platinum-based doublet chemotherapy cycles the patient has undergone is known.","when_to_set_to_null":"Set to null if the number of cycles is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of cycles of platinum-based doublet chemotherapy the patient has undergone."} ;; "≤ 4 cycles of platinum-based doublet chemotherapy"

(declare-const patient_has_diagnosis_of_non_small_cell_lung_cancer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of non-small cell lung cancer.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of non-small cell lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of non-small cell lung cancer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of non-small cell lung cancer."} ;; "non-small cell lung cancer"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: The patient is excluded if (the patient has a history of systemic chemotherapy) AND (NOT ((the patient has non-small cell lung cancer) AND (the patient has had ≤ 4 cycles of platinum-based doublet chemotherapy))).
(assert
(! (not (and
          patient_has_undergone_administration_of_antineoplastic_agent_inthehistory
          (not (and
                  patient_has_diagnosis_of_non_small_cell_lung_cancer_now
                  patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@platinum_based_doublet_regimen
                  (<= patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@number_of_cycles 4)
               ))
      ))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of systemic chemotherapy) AND (NOT ((the patient has non-small cell lung cancer) AND (the patient has had ≤ 4 cycles of platinum-based doublet chemotherapy)))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; The variable 'patients_breastfeeding_is_positive_now' is equivalent to 'patient_is_breastfeeding_now'
(assert
(! (= patients_breastfeeding_is_positive_now patient_is_breastfeeding_now)
    :named REQ2_AUXILIARY0)) ;; "breast-feeding" and "the patient is breast-feeding"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT be pregnant
(assert
(! (not patient_is_pregnant_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; Exclusion: patient must NOT be breast-feeding
(assert
(! (not patient_is_breastfeeding_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_infectious_disease_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary infection (active at present).","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary infection (active at present).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary infection (active at present).","meaning":"Boolean indicating whether the patient currently has a pulmonary infection at the present time."} ;; "the patient has an active pulmonary infection"
(declare-const patient_has_finding_of_infectious_disease_of_lung_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pulmonary infection is active.","when_to_set_to_false":"Set to false if the patient's current pulmonary infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pulmonary infection is active.","meaning":"Boolean indicating whether the patient's current pulmonary infection is active."} ;; "active pulmonary infection"
(declare-const patient_has_finding_of_infectious_disease_of_lung_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a pulmonary infection within the past one month.","when_to_set_to_false":"Set to false if the patient has not had a pulmonary infection within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a pulmonary infection within the past one month.","meaning":"Boolean indicating whether the patient has had a pulmonary infection within the past one month."} ;; "recent history of pulmonary infection within one month"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_infectious_disease_of_lung_now@@active_status
       patient_has_finding_of_infectious_disease_of_lung_now)
   :named REQ3_AUXILIARY0)) ;; "active pulmonary infection"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_infectious_disease_of_lung_now@@active_status)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has an active pulmonary infection"

(assert
(! (not patient_has_finding_of_infectious_disease_of_lung_inthepast1months)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a recent history of pulmonary infection within one month"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness.","when_to_set_to_false":"Set to false if the patient currently does not have any illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any illness.","meaning":"Boolean indicating whether the patient currently has any illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is acute.","when_to_set_to_false":"Set to false if the patient's current illness is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is acute.","meaning":"Boolean indicating whether the patient's current illness is acute."} ;; "acute"
(declare-const patient_has_finding_of_illness_now@@intercurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is intercurrent.","when_to_set_to_false":"Set to false if the patient's current illness is not intercurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is intercurrent.","meaning":"Boolean indicating whether the patient's current illness is intercurrent."} ;; "intercurrent"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_illness_now@@acute
      patient_has_finding_of_illness_now)
:named REQ4_AUXILIARY0)) ;; "acute"

(assert
(! (=> patient_has_finding_of_illness_now@@intercurrent
      patient_has_finding_of_illness_now)
:named REQ4_AUXILIARY1)) ;; "intercurrent"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have an acute intercurrent illness
(assert
(! (not (and patient_has_finding_of_illness_now@@acute
             patient_has_finding_of_illness_now@@intercurrent))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acute intercurrent illness."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nonsteroidal anti-inflammatory agents.","when_to_set_to_false":"Set to false if the patient is currently not exposed to nonsteroidal anti-inflammatory agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to nonsteroidal anti-inflammatory agents.","meaning":"Boolean indicating whether the patient is currently exposed to nonsteroidal anti-inflammatory agents."} ;; "nonsteroidal anti-inflammatory drugs"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@chronic_ongoing_treatment_required Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to nonsteroidal anti-inflammatory agents is due to chronic ongoing treatment.","when_to_set_to_false":"Set to false if the patient's current exposure is not due to chronic ongoing treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is due to chronic ongoing treatment.","meaning":"Boolean indicating whether the patient's current exposure to nonsteroidal anti-inflammatory agents is due to chronic ongoing treatment."} ;; "requires chronic ongoing treatment"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@except_aspirin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to nonsteroidal anti-inflammatory agents excludes aspirin (i.e., aspirin is not counted as exposure for this variable).","when_to_set_to_false":"Set to false if aspirin is included as exposure for this variable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin is excluded from exposure for this variable.","meaning":"Boolean indicating whether exposure to aspirin is excluded from the definition of exposure to nonsteroidal anti-inflammatory agents for this variable."} ;; "except aspirin"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@chronic_ongoing_treatment_required@@except_aspirin Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nonsteroidal anti-inflammatory agents (excluding aspirin) and this exposure is due to chronic ongoing treatment.","when_to_set_to_false":"Set to false if the patient is not currently exposed to nonsteroidal anti-inflammatory agents (excluding aspirin) due to chronic ongoing treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to nonsteroidal anti-inflammatory agents (excluding aspirin) due to chronic ongoing treatment.","meaning":"Boolean indicating whether the patient is currently exposed to nonsteroidal anti-inflammatory agents, where the exposure is due to chronic ongoing treatment and aspirin is excluded from the definition of nonsteroidal anti-inflammatory agents."} ;; "requires chronic ongoing treatment with nonsteroidal anti-inflammatory drugs except aspirin"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@chronic_ongoing_treatment_required
      patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now)
:named REQ5_AUXILIARY0)) ;; "chronic ongoing treatment"

(assert
(! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@except_aspirin
      patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now)
:named REQ5_AUXILIARY1)) ;; "except aspirin"

(assert
(! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@chronic_ongoing_treatment_required@@except_aspirin
      (and patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@chronic_ongoing_treatment_required
           patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@except_aspirin))
:named REQ5_AUXILIARY2)) ;; "chronic ongoing treatment with nonsteroidal anti-inflammatory drugs except aspirin"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@chronic_ongoing_treatment_required@@except_aspirin)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires chronic ongoing treatment with nonsteroidal anti-inflammatory drugs except aspirin."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident (stroke) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident (stroke) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident (stroke) in their history."} ;; "the patient has a history of stroke"
(declare-const patient_has_finding_of_poor_hypertension_control_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had poor hypertension control (uncontrolled hypertension) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had poor hypertension control (uncontrolled hypertension) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had poor hypertension control (uncontrolled hypertension).","meaning":"Boolean indicating whether the patient has ever had poor hypertension control (uncontrolled hypertension) in their history."} ;; "the patient has a history of uncontrolled hypertension"
(declare-const patient_has_finding_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had angina pectoris at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had angina pectoris in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had angina pectoris.","meaning":"Boolean indicating whether the patient has ever had angina pectoris in their history."} ;; "the patient has a history of uncontrolled angina pectoris"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthehistory)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stroke."

(assert
(! (not patient_has_finding_of_poor_hypertension_control_inthehistory)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of uncontrolled hypertension."

(assert
(! (not patient_has_finding_of_angina_pectoris_inthehistory)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of uncontrolled angina pectoris."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_food_antioxidant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to food antioxidants (e.g., takes them during the study period).","when_to_set_to_false":"Set to false if the patient is not currently exposed to food antioxidants.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to food antioxidants.","meaning":"Boolean indicating whether the patient is currently exposed to food antioxidants."} ;; "antioxidants"
(declare-const patient_is_exposed_to_food_antioxidant_now@@high_dose_determined_by_study_investigators Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to food antioxidants and the dose is considered high by study investigators.","when_to_set_to_false":"Set to false if the patient is currently exposed to food antioxidants but the dose is not considered high by study investigators.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose is considered high by study investigators.","meaning":"Boolean indicating whether the patient is currently exposed to food antioxidants at a high dose as determined by study investigators."} ;; "high dose antioxidants (high dose determined by the study investigators)"
(declare-const patient_is_exposed_to_vitamin_e_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to vitamin E (e.g., takes it during the study period).","when_to_set_to_false":"Set to false if the patient is not currently exposed to vitamin E.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to vitamin E.","meaning":"Boolean indicating whether the patient is currently exposed to vitamin E."} ;; "vitamin E"
(declare-const patient_is_exposed_to_vitamin_e_now@@high_dose_determined_by_study_investigators Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to vitamin E and the dose is considered high by study investigators.","when_to_set_to_false":"Set to false if the patient is currently exposed to vitamin E but the dose is not considered high by study investigators.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose is considered high by study investigators.","meaning":"Boolean indicating whether the patient is currently exposed to vitamin E at a high dose as determined by study investigators."} ;; "high dose vitamin E (high dose determined by the study investigators)"
(declare-const patient_is_exposed_to_ascorbic_acid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to vitamin C (e.g., takes it during the study period).","when_to_set_to_false":"Set to false if the patient is not currently exposed to vitamin C.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to vitamin C.","meaning":"Boolean indicating whether the patient is currently exposed to vitamin C."} ;; "vitamin C"
(declare-const patient_is_exposed_to_ascorbic_acid_now@@high_dose_determined_by_study_investigators Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to vitamin C and the dose is considered high by study investigators.","when_to_set_to_false":"Set to false if the patient is currently exposed to vitamin C but the dose is not considered high by study investigators.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose is considered high by study investigators.","meaning":"Boolean indicating whether the patient is currently exposed to vitamin C at a high dose as determined by study investigators."} ;; "high dose vitamin C (high dose determined by the study investigators)"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples: high dose vitamin E or high dose vitamin C imply high dose antioxidant exposure
(assert
(! (=> (or patient_is_exposed_to_vitamin_e_now@@high_dose_determined_by_study_investigators
          patient_is_exposed_to_ascorbic_acid_now@@high_dose_determined_by_study_investigators)
    patient_is_exposed_to_food_antioxidant_now@@high_dose_determined_by_study_investigators)
:named REQ7_AUXILIARY0)) ;; "high dose antioxidants (high dose vitamin E OR high dose vitamin C) during the study period, with high dose determined by the study investigators."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_food_antioxidant_now@@high_dose_determined_by_study_investigators
    patient_is_exposed_to_food_antioxidant_now)
:named REQ7_AUXILIARY1)) ;; "high dose antioxidants"

(assert
(! (=> patient_is_exposed_to_vitamin_e_now@@high_dose_determined_by_study_investigators
    patient_is_exposed_to_vitamin_e_now)
:named REQ7_AUXILIARY2)) ;; "high dose vitamin E"

(assert
(! (=> patient_is_exposed_to_ascorbic_acid_now@@high_dose_determined_by_study_investigators
    patient_is_exposed_to_ascorbic_acid_now)
:named REQ7_AUXILIARY3)) ;; "high dose vitamin C"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_food_antioxidant_now@@high_dose_determined_by_study_investigators)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient takes high dose antioxidants (high dose vitamin E OR high dose vitamin C) during the study period, with high dose determined by the study investigators."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_multivitamin_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a multivitamin agent.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a multivitamin agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a multivitamin agent.","meaning":"Boolean indicating whether the patient is currently exposed to a multivitamin agent."} ;; "multivitamin"

(declare-const patient_is_exposed_to_vitamin_a_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to vitamin A derivatives (synthetic or natural).","when_to_set_to_false":"Set to false if the patient is currently not exposed to vitamin A derivatives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to vitamin A derivatives.","meaning":"Boolean indicating whether the patient is currently exposed to vitamin A derivatives."} ;; "vitamin A"

(declare-const patient_is_exposed_to_vitamin_a_now@@synthetic_derivative Bool) ;; {"when_to_set_to_true":"Set to true if the vitamin A derivative exposure is synthetic.","when_to_set_to_false":"Set to false if the vitamin A derivative exposure is not synthetic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vitamin A derivative exposure is synthetic.","meaning":"Boolean indicating whether the vitamin A derivative exposure is synthetic."} ;; "synthetic vitamin A derivatives"

(declare-const patient_is_exposed_to_vitamin_a_now@@natural_derivative Bool) ;; {"when_to_set_to_true":"Set to true if the vitamin A derivative exposure is natural.","when_to_set_to_false":"Set to false if the vitamin A derivative exposure is not natural.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vitamin A derivative exposure is natural.","meaning":"Boolean indicating whether the vitamin A derivative exposure is natural."} ;; "natural vitamin A derivatives"

(declare-const patient_is_exposed_to_vitamin_a_now@@high_dose Bool) ;; {"when_to_set_to_true":"Set to true if the vitamin A derivative exposure is at a high dose as defined in the requirement.","when_to_set_to_false":"Set to false if the vitamin A derivative exposure is not at a high dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vitamin A derivative exposure is at a high dose.","meaning":"Boolean indicating whether the vitamin A derivative exposure is at a high dose."} ;; "high dose (greater than 10,000 international units per day, defined as anything greater than a once-daily multivitamin, or any additional vitamin A supplementation as evaluated at the discretion of the treating physician)"

(declare-const patient_is_exposed_to_vitamin_a_supplementation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any additional vitamin A supplementation.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any additional vitamin A supplementation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any additional vitamin A supplementation.","meaning":"Boolean indicating whether the patient is currently exposed to any additional vitamin A supplementation."} ;; "any additional vitamin A supplementation"

(declare-const patient_is_exposed_to_vitamin_a_supplementation_now@@as_evaluated_at_discretion_of_treating_physician Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to any additional vitamin A supplementation is evaluated at the discretion of the treating physician.","when_to_set_to_false":"Set to false if the exposure to any additional vitamin A supplementation is not evaluated at the discretion of the treating physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to any additional vitamin A supplementation is evaluated at the discretion of the treating physician.","meaning":"Boolean indicating whether the exposure to any additional vitamin A supplementation is evaluated at the discretion of the treating physician."} ;; "as evaluated at the discretion of the treating physician"

(declare-const patient_vitamin_a_dose_value_recorded_now_withunit_international_units_per_day Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current total daily dose of vitamin A derivatives in international units per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's current total daily dose of vitamin A derivatives is.","meaning":"Numeric value indicating the patient's current total daily dose of vitamin A derivatives, recorded in international units per day."} ;; "greater than 10,000 international units per day"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_vitamin_a_now@@synthetic_derivative
       patient_is_exposed_to_vitamin_a_now)
    :named REQ8_AUXILIARY0)) ;; "synthetic vitamin A derivatives"

(assert
(! (=> patient_is_exposed_to_vitamin_a_now@@natural_derivative
       patient_is_exposed_to_vitamin_a_now)
    :named REQ8_AUXILIARY1)) ;; "natural vitamin A derivatives"

(assert
(! (=> patient_is_exposed_to_vitamin_a_now@@high_dose
       patient_is_exposed_to_vitamin_a_now)
    :named REQ8_AUXILIARY2)) ;; "high dose vitamin A derivatives"

;; High dose definition: greater than 10,000 IU/day OR greater than a once-daily multivitamin OR any additional vitamin A supplementation as evaluated at the discretion of the treating physician
(assert
(! (= patient_is_exposed_to_vitamin_a_now@@high_dose
      (or
        (> patient_vitamin_a_dose_value_recorded_now_withunit_international_units_per_day 10000)
        (not patient_is_exposed_to_multivitamin_agent_now) ;; "anything greater than a once-daily multivitamin"
        patient_is_exposed_to_vitamin_a_supplementation_now@@as_evaluated_at_discretion_of_treating_physician))
    :named REQ8_AUXILIARY3)) ;; "greater than 10,000 international units per day, defined as anything greater than a once-daily multivitamin, or any additional vitamin A supplementation as evaluated at the discretion of the treating physician"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: high dose synthetic vitamin A derivatives
(assert
(! (not (and patient_is_exposed_to_vitamin_a_now@@synthetic_derivative
             patient_is_exposed_to_vitamin_a_now@@high_dose))
    :named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient takes high dose synthetic vitamin A derivatives..."

;; Exclusion: high dose natural vitamin A derivatives
(assert
(! (not (and patient_is_exposed_to_vitamin_a_now@@natural_derivative
             patient_is_exposed_to_vitamin_a_now@@high_dose))
    :named REQ8_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient takes high dose natural vitamin A derivatives..."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_history_of_biologic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of biologic therapy at any time prior to the present.","when_to_set_to_false":"Set to false if the patient does not have a documented history of biologic therapy at any time prior to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of biologic therapy.","meaning":"Boolean indicating whether the patient has a history of biologic therapy at any time prior to the present."} ;; "has a history of biologic therapy"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_history_of_biologic_therapy)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of biologic therapy."
