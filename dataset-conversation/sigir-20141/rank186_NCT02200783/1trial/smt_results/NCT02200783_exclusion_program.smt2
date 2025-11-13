;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "less than 18 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than 18 years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as confirmed by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_vitamin_k_antagonist_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a vitamin K antagonist drug.","when_to_set_to_false":"Set to false if the patient is not currently taking a vitamin K antagonist drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a vitamin K antagonist drug.","meaning":"Boolean indicating whether the patient is currently taking a vitamin K antagonist drug."} ;; "vitamin K antagonist drugs"
(declare-const patient_is_taking_vitamin_k_antagonist_drug_now@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current use of a vitamin K antagonist drug is chronic (long-term, ongoing).","when_to_set_to_false":"Set to false if the patient's current use is not chronic (e.g., acute, short-term, or one-time use).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use is chronic.","meaning":"Boolean indicating whether the patient's current use of a vitamin K antagonist drug is chronic."} ;; "chronic use of vitamin K antagonist drugs"
(declare-const patient_is_taking_direct_thrombin_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a direct thrombin inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a direct thrombin inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a direct thrombin inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking a direct thrombin inhibitor containing product."} ;; "direct thrombin inhibitor drugs"
(declare-const patient_is_taking_direct_thrombin_inhibitor_containing_product_now@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current use of a direct thrombin inhibitor containing product is chronic (long-term, ongoing).","when_to_set_to_false":"Set to false if the patient's current use is not chronic (e.g., acute, short-term, or one-time use).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use is chronic.","meaning":"Boolean indicating whether the patient's current use of a direct thrombin inhibitor containing product is chronic."} ;; "chronic use of direct thrombin inhibitor drugs"
(declare-const patient_is_taking_coagulation_factor_xa_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a coagulation factor Xa inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a coagulation factor Xa inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a coagulation factor Xa inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking a coagulation factor Xa inhibitor containing product."} ;; "factor Xa antagonist drugs"
(declare-const patient_is_taking_coagulation_factor_xa_inhibitor_containing_product_now@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current use of a coagulation factor Xa inhibitor containing product is chronic (long-term, ongoing).","when_to_set_to_false":"Set to false if the patient's current use is not chronic (e.g., acute, short-term, or one-time use).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use is chronic.","meaning":"Boolean indicating whether the patient's current use of a coagulation factor Xa inhibitor containing product is chronic."} ;; "chronic use of factor Xa antagonist drugs"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_vitamin_k_antagonist_drug_now@@chronic_use
      patient_is_taking_vitamin_k_antagonist_drug_now)
    :named REQ2_AUXILIARY0)) ;; "chronic use of vitamin K antagonist drugs"

(assert
(! (=> patient_is_taking_direct_thrombin_inhibitor_containing_product_now@@chronic_use
      patient_is_taking_direct_thrombin_inhibitor_containing_product_now)
    :named REQ2_AUXILIARY1)) ;; "chronic use of direct thrombin inhibitor drugs"

(assert
(! (=> patient_is_taking_coagulation_factor_xa_inhibitor_containing_product_now@@chronic_use
      patient_is_taking_coagulation_factor_xa_inhibitor_containing_product_now)
    :named REQ2_AUXILIARY2)) ;; "chronic use of factor Xa antagonist drugs"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_taking_vitamin_k_antagonist_drug_now@@chronic_use)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of vitamin K antagonist drugs."

(assert
(! (not patient_is_taking_direct_thrombin_inhibitor_containing_product_now@@chronic_use)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of direct thrombin inhibitor drugs."

(assert
(! (not patient_is_taking_coagulation_factor_xa_inhibitor_containing_product_now@@chronic_use)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of factor Xa antagonist drugs."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have active bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active bleeding.","meaning":"Boolean indicating whether the patient currently has active bleeding."} ;; "the patient has active bleeding"

(declare-const patient_has_finding_of_high_risk_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a high risk of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have a high risk of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a high risk of bleeding.","meaning":"Boolean indicating whether the patient currently has high risk of bleeding."} ;; "high risk of bleeding"

(declare-const patient_has_finding_of_hepatic_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic insufficiency.","meaning":"Boolean indicating whether the patient currently has hepatic insufficiency."} ;; "hepatic insufficiency"

(declare-const patient_has_finding_of_hepatic_insufficiency_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hepatic insufficiency is severe.","when_to_set_to_false":"Set to false if the patient's current hepatic insufficiency is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hepatic insufficiency is severe.","meaning":"Boolean indicating whether the patient's current hepatic insufficiency is severe."} ;; "severe hepatic insufficiency"

(declare-const patient_has_finding_of_peptic_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active peptic ulcer disease.","when_to_set_to_false":"Set to false if the patient currently does not have active peptic ulcer disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active peptic ulcer disease.","meaning":"Boolean indicating whether the patient currently has active peptic ulcer disease."} ;; "active peptic ulcer disease"

(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of creatinine clearance in milliliters per minute is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine clearance in milliliters per minute."} ;; "creatinine clearance less than 30 milliliters per minute"

(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of platelet count in number per cubic millimeter is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count in number per cubic millimeter."} ;; "platelet count less than 100,000 per cubic millimeter"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_hepatic_insufficiency_now@@severe
           patient_has_finding_of_peptic_ulcer_now
           (< patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 30)
           (< patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter 100000))
    patient_has_finding_of_high_risk_of_bleeding_now)
:named REQ3_AUXILIARY0)) ;; "high risk of bleeding with non-exhaustive examples ((severe hepatic insufficiency) OR (active peptic ulcer disease) OR (creatinine clearance less than 30 milliliters per minute) OR (platelet count less than 100,000 per cubic millimeter))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hepatic_insufficiency_now@@severe
       patient_has_finding_of_hepatic_insufficiency_now)
:named REQ3_AUXILIARY1)) ;; "severe hepatic insufficiency" implies "hepatic insufficiency"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_bleeding_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has active bleeding"

(assert
(! (not patient_has_finding_of_high_risk_of_bleeding_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has high risk of bleeding with non-exhaustive examples ((severe hepatic insufficiency) OR (active peptic ulcer disease) OR (creatinine clearance less than 30 milliliters per minute) OR (platelet count less than 100,000 per cubic millimeter))"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poor hypertension control (uncontrolled hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poor hypertension control (uncontrolled hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor hypertension control (uncontrolled hypertension).","meaning":"Boolean indicating whether the patient currently has poor hypertension control (uncontrolled hypertension)."} ;; "uncontrolled hypertension"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_poor_hypertension_control_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_cardiogenic_shock_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiogenic shock."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const number_of_grafts_used_in_coronary_artery_bypass_graft_surgery_in_the_history_value_recorded_in_integer Real) ;; {"when_to_set_to_value":"Set to the integer value representing the number of grafts used in the patient's coronary artery bypass graft surgery in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many grafts were used in the patient's coronary artery bypass graft surgery in the history.","meaning":"Integer value indicating the number of grafts used in any coronary artery bypass graft surgery the patient has undergone at any time in the past."} ;; "the use of one graft" / "the use of more than one graft"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass graft surgery at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass graft surgery at any time in the past."} ;; "previous coronary artery bypass graft surgery"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@number_of_grafts_used Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft surgery at any time in the past and the number of grafts used matches the specified criterion (e.g., exactly one or more than one).","when_to_set_to_false":"Set to false if the patient has ever undergone coronary artery bypass graft surgery at any time in the past and the number of grafts used does not match the specified criterion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many grafts were used in the patient's coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient's past coronary artery bypass graft surgery was performed with a specific number of grafts used (to be specified in assertion logic)."} ;; "previous coronary artery bypass graft surgery with the use of one graft" / "previous coronary artery bypass graft surgery with the use of more than one graft"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@number_of_grafts_used
      patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ6_AUXILIARY0)) ;; "coronary artery bypass graft surgery with the use of one graft or more than one graft"

;; Definition: qualifier variable is true if patient has undergone CABG in history AND number of grafts is exactly one OR more than one
(assert
(! (= patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@number_of_grafts_used
      (and patient_has_undergone_coronary_artery_bypass_graft_inthehistory
           (or (= number_of_grafts_used_in_coronary_artery_bypass_graft_surgery_in_the_history_value_recorded_in_integer 1)
               (> number_of_grafts_used_in_coronary_artery_bypass_graft_surgery_in_the_history_value_recorded_in_integer 1))))
:named REQ6_AUXILIARY1)) ;; "previous coronary artery bypass graft surgery with the use of one graft OR previous coronary artery bypass graft surgery with the use of more than one graft"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have had previous CABG with one graft
(assert
(! (not (and patient_has_undergone_coronary_artery_bypass_graft_inthehistory
             (= number_of_grafts_used_in_coronary_artery_bypass_graft_surgery_in_the_history_value_recorded_in_integer 1)))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous coronary artery bypass graft surgery with the use of one graft."

;; Exclusion: patient must NOT have had previous CABG with more than one graft
(assert
(! (not (and patient_has_undergone_coronary_artery_bypass_graft_inthehistory
             (> number_of_grafts_used_in_coronary_artery_bypass_graft_surgery_in_the_history_value_recorded_in_integer 1)))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous coronary artery bypass graft surgery with the use of more than one graft."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_candidate_for_any_specified_vascular_access_technique_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a candidate for at least one of the specified vascular access techniques.","when_to_set_to_false":"Set to false if the patient is currently not a candidate for any of the specified vascular access techniques.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a candidate for any of the specified vascular access techniques.","meaning":"Boolean indicating whether the patient is currently a candidate for any of the specified vascular access techniques."} ;; "is not a candidate for the use of any of the specified vascular access techniques."
(declare-const patient_is_candidate_for_any_specified_vascular_access_technique_now@@only_specified_techniques_considered Bool) ;; {"when_to_set_to_true":"Set to true if the candidate status is determined considering only the specified vascular access techniques.","when_to_set_to_false":"Set to false if the candidate status is determined considering techniques other than the specified ones.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether only the specified techniques are considered in determining candidate status.","meaning":"Boolean indicating whether only the specified vascular access techniques are considered in determining candidate status."} ;; "only the specified vascular access techniques are considered"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_candidate_for_any_specified_vascular_access_technique_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is not a candidate for the use of any of the specified vascular access techniques."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."} ;; "disease"

(declare-const patient_has_finding_of_disease_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is severe.","when_to_set_to_false":"Set to false if the disease present in the patient is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present in the patient is severe.","meaning":"Boolean indicating whether the disease present in the patient is severe."} ;; "severe disease"

(declare-const patient_has_finding_of_disease_now@@is_concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is concomitant (occurring at the same time as the index condition).","when_to_set_to_false":"Set to false if the disease present in the patient is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present in the patient is concomitant.","meaning":"Boolean indicating whether the disease present in the patient is concomitant."} ;; "concomitant disease"

(declare-const patient_has_finding_of_disease_now@@associated_with_life_expectancy_less_than_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is associated with life expectancy less than 12 months.","when_to_set_to_false":"Set to false if the disease present in the patient is not associated with life expectancy less than 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present in the patient is associated with life expectancy less than 12 months.","meaning":"Boolean indicating whether the disease present in the patient is associated with life expectancy less than 12 months."} ;; "disease with life expectancy less than 12 months"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@is_severe
       patient_has_finding_of_disease_now)
   :named REQ8_AUXILIARY0)) ;; "severe disease"

(assert
(! (=> patient_has_finding_of_disease_now@@is_concomitant
       patient_has_finding_of_disease_now)
   :named REQ8_AUXILIARY1)) ;; "concomitant disease"

(assert
(! (=> patient_has_finding_of_disease_now@@associated_with_life_expectancy_less_than_12_months
       patient_has_finding_of_disease_now)
   :named REQ8_AUXILIARY2)) ;; "disease with life expectancy less than 12 months"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have a concomitant severe disease with life expectancy less than 12 months
(assert
(! (not (and patient_has_finding_of_disease_now@@is_concomitant
             patient_has_finding_of_disease_now@@is_severe
             patient_has_finding_of_disease_now@@associated_with_life_expectancy_less_than_12_months))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concomitant severe disease with life expectancy less than 12 months."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease, condition, or medical finding.","when_to_set_to_false":"Set to false if the patient currently does not have a disease, condition, or medical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease, condition, or medical finding.","meaning":"Boolean indicating whether the patient currently has a disease, condition, or medical finding."} ;; "medical conditions"

(declare-const patient_has_finding_of_disease_condition_finding_now@@impedes_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease, condition, or medical finding impedes study participation.","when_to_set_to_false":"Set to false if the patient's current disease, condition, or medical finding does not impede study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease, condition, or medical finding impedes study participation.","meaning":"Boolean indicating whether the patient's current disease, condition, or medical finding impedes study participation."} ;; "medical conditions that impede study participation"

(declare-const patient_has_finding_of_geographical_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a geographical condition.","when_to_set_to_false":"Set to false if the patient currently does not have a geographical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a geographical condition.","meaning":"Boolean indicating whether the patient currently has a geographical condition."} ;; "geographical conditions"

(declare-const patient_has_finding_of_geographical_condition_now@@impedes_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current geographical condition impedes study participation.","when_to_set_to_false":"Set to false if the patient's current geographical condition does not impede study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current geographical condition impedes study participation.","meaning":"Boolean indicating whether the patient's current geographical condition impedes study participation."} ;; "geographical conditions that impede study participation"

(declare-const patient_has_finding_of_social_context_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a social context or condition.","when_to_set_to_false":"Set to false if the patient currently does not have a social context or condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a social context or condition.","meaning":"Boolean indicating whether the patient currently has a social context or condition."} ;; "social conditions"

(declare-const patient_has_finding_of_social_context_finding_now@@impedes_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current social context or condition impedes study participation.","when_to_set_to_false":"Set to false if the patient's current social context or condition does not impede study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current social context or condition impedes study participation.","meaning":"Boolean indicating whether the patient's current social context or condition impedes study participation."} ;; "social conditions that impede study participation"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@impedes_study_participation
      patient_has_finding_of_disease_condition_finding_now)
   :named REQ9_AUXILIARY0)) ;; "medical conditions that impede study participation"

(assert
(! (=> patient_has_finding_of_geographical_condition_now@@impedes_study_participation
      patient_has_finding_of_geographical_condition_now)
   :named REQ9_AUXILIARY1)) ;; "geographical conditions that impede study participation"

(assert
(! (=> patient_has_finding_of_social_context_finding_now@@impedes_study_participation
      patient_has_finding_of_social_context_finding_now)
   :named REQ9_AUXILIARY2)) ;; "social conditions that impede study participation"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@impedes_study_participation)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has medical conditions that impede study participation."

(assert
(! (not patient_has_finding_of_geographical_condition_now@@impedes_study_participation)
   :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has geographical conditions that impede study participation."

(assert
(! (not patient_has_finding_of_social_context_finding_now@@impedes_study_participation)
   :named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has social conditions that impede study participation."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_refuses_to_sign_informed_consent_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently refuses to sign the informed consent form.","when_to_set_to_false":"Set to false if the patient currently does not refuse to sign the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently refuses to sign the informed consent form.","meaning":"Boolean indicating whether the patient currently refuses to sign the informed consent form."} ;; "the patient refuses to sign the informed consent form"
(declare-const patient_unable_to_sign_informed_consent_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to sign the informed consent form.","when_to_set_to_false":"Set to false if the patient is currently able to sign the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to sign the informed consent form.","meaning":"Boolean indicating whether the patient is currently unable to sign the informed consent form."} ;; "the patient is unable to sign the informed consent form"
(declare-const patient_unable_to_understand_informed_consent_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to understand the informed consent form.","when_to_set_to_false":"Set to false if the patient is currently able to understand the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to understand the informed consent form.","meaning":"Boolean indicating whether the patient is currently unable to understand the informed consent form."} ;; "the patient is unable to understand the informed consent form"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_refuses_to_sign_informed_consent_form_now)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to sign the informed consent form."

(assert
(! (not patient_unable_to_understand_informed_consent_form_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to understand the informed consent form."

(assert
(! (not patient_unable_to_sign_informed_consent_form_now)
:named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to sign the informed consent form."
