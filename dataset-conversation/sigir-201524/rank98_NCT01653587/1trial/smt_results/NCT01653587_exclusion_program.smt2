;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is less than eighteen years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than eighteen years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_vitamin_k_antagonist_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a vitamin K antagonist drug.","when_to_set_to_false":"Set to false if the patient is currently not taking a vitamin K antagonist drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a vitamin K antagonist drug.","meaning":"Boolean indicating whether the patient is currently taking a vitamin K antagonist drug."} ;; "vitamin K antagonist drugs"
(declare-const patient_is_taking_vitamin_k_antagonist_drug_now@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a vitamin K antagonist drug and the use is chronic (i.e., ongoing or long-term as defined by protocol).","when_to_set_to_false":"Set to false if the patient is currently taking a vitamin K antagonist drug but the use is not chronic (e.g., short-term or intermittent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use is chronic.","meaning":"Boolean indicating whether the patient's current use of vitamin K antagonist drug is chronic."} ;; "chronic use of vitamin K antagonist drugs"

(declare-const patient_is_taking_direct_thrombin_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a direct thrombin inhibitor-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a direct thrombin inhibitor-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a direct thrombin inhibitor-containing product.","meaning":"Boolean indicating whether the patient is currently taking a direct thrombin inhibitor-containing product."} ;; "direct thrombin inhibitor drugs"
(declare-const patient_is_taking_direct_thrombin_inhibitor_containing_product_now@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a direct thrombin inhibitor-containing product and the use is chronic (i.e., ongoing or long-term as defined by protocol).","when_to_set_to_false":"Set to false if the patient is currently taking a direct thrombin inhibitor-containing product but the use is not chronic (e.g., short-term or intermittent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use is chronic.","meaning":"Boolean indicating whether the patient's current use of direct thrombin inhibitor-containing product is chronic."} ;; "chronic use of direct thrombin inhibitor drugs"

(declare-const patient_is_taking_coagulation_factor_xa_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an oral Xa-factor antagonist-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking an oral Xa-factor antagonist-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an oral Xa-factor antagonist-containing product.","meaning":"Boolean indicating whether the patient is currently taking an oral Xa-factor antagonist-containing product."} ;; "oral Xa-factor antagonist drugs"
(declare-const patient_is_taking_coagulation_factor_xa_inhibitor_containing_product_now@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an oral Xa-factor antagonist-containing product and the use is chronic (i.e., ongoing or long-term as defined by protocol).","when_to_set_to_false":"Set to false if the patient is currently taking an oral Xa-factor antagonist-containing product but the use is not chronic (e.g., short-term or intermittent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use is chronic.","meaning":"Boolean indicating whether the patient's current use of oral Xa-factor antagonist-containing product is chronic."} ;; "chronic use of oral Xa-factor antagonist drugs"

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
   :named REQ2_AUXILIARY2)) ;; "chronic use of oral Xa-factor antagonist drugs"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_taking_vitamin_k_antagonist_drug_now@@chronic_use)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of vitamin K antagonist drugs."

(assert
(! (not patient_is_taking_direct_thrombin_inhibitor_containing_product_now@@chronic_use)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of direct thrombin inhibitor drugs."

(assert
(! (not patient_is_taking_coagulation_factor_xa_inhibitor_containing_product_now@@chronic_use)
   :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of oral Xa-factor antagonist drugs."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_hypersensitivity_to_platelet_aggregation_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to any platelet aggregation inhibitor containing product (antiplatelet drugs).","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to any platelet aggregation inhibitor containing product (antiplatelet drugs).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to any platelet aggregation inhibitor containing product (antiplatelet drugs).","meaning":"Boolean indicating whether the patient currently has hypersensitivity to any platelet aggregation inhibitor containing product (antiplatelet drugs)."} ;; "the patient has hypersensitivity to antiplatelet drugs"
(declare-const patient_has_hypersensitivity_to_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to any anticoagulant substance (anticoagulant drugs).","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to any anticoagulant substance (anticoagulant drugs).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to any anticoagulant substance (anticoagulant drugs).","meaning":"Boolean indicating whether the patient currently has hypersensitivity to any anticoagulant substance (anticoagulant drugs)."} ;; "the patient has hypersensitivity to anticoagulant drugs"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_hypersensitivity_to_platelet_aggregation_inhibitor_containing_product_now
            patient_has_hypersensitivity_to_anticoagulant_now))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has hypersensitivity to antiplatelet drugs) OR (the patient has hypersensitivity to anticoagulant drugs)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bleeding.","meaning":"Boolean indicating whether the patient currently has bleeding."} ;; "bleeding"
(declare-const patient_has_finding_of_bleeding_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bleeding and the bleeding is active.","when_to_set_to_false":"Set to false if the patient currently has bleeding but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bleeding is active.","meaning":"Boolean indicating whether the patient's current bleeding is active."} ;; "active bleeding"
(declare-const patient_has_finding_of_high_risk_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of high risk of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of high risk of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of high risk of bleeding.","meaning":"Boolean indicating whether the patient currently has high risk of bleeding."} ;; "high bleeding risk"
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic (liver) failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic (liver) failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hepatic (liver) failure.","meaning":"Boolean indicating whether the patient currently has hepatic (liver) failure."} ;; "liver failure"
(declare-const patient_has_finding_of_hepatic_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic (liver) failure and the failure is severe.","when_to_set_to_false":"Set to false if the patient currently has hepatic (liver) failure but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic failure is severe.","meaning":"Boolean indicating whether the patient's current hepatic failure is severe."} ;; "severe liver failure"
(declare-const patient_has_finding_of_peptic_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peptic ulcer disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peptic ulcer disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of peptic ulcer disease.","meaning":"Boolean indicating whether the patient currently has peptic ulcer disease."} ;; "peptic ulcer disease"
(declare-const patient_has_finding_of_peptic_ulcer_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peptic ulcer disease and the disease is active.","when_to_set_to_false":"Set to false if the patient currently has peptic ulcer disease but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peptic ulcer disease is active.","meaning":"Boolean indicating whether the patient's current peptic ulcer disease is active."} ;; "active peptic ulcer disease"
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of creatinine clearance (in milliliters per minute) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine clearance in milliliters per minute."} ;; "creatinine clearance less than thirty milliliters per minute"
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of platelet count (in number per cubic millimeter) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count in number per cubic millimeter."} ;; "platelet count less than one hundred thousand per cubic millimeter"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_bleeding_now@@active
      patient_has_finding_of_bleeding_now)
    :named REQ4_AUXILIARY0)) ;; "active bleeding"

(assert
(! (=> patient_has_finding_of_hepatic_failure_now@@severe
      patient_has_finding_of_hepatic_failure_now)
    :named REQ4_AUXILIARY1)) ;; "severe liver failure"

(assert
(! (=> patient_has_finding_of_peptic_ulcer_now@@active
      patient_has_finding_of_peptic_ulcer_now)
    :named REQ4_AUXILIARY2)) ;; "active peptic ulcer disease"

;; Non-exhaustive examples imply umbrella term (high bleeding risk)
(assert
(! (=> (or patient_has_finding_of_hepatic_failure_now@@severe
           patient_has_finding_of_peptic_ulcer_now@@active
           (< patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 30)
           (< patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter 100000))
      patient_has_finding_of_high_risk_of_bleeding_now)
    :named REQ4_AUXILIARY3)) ;; "high bleeding risk with non-exhaustive examples ((severe liver failure) OR (active peptic ulcer disease) OR (creatinine clearance < 30 mL/min) OR (platelet count < 100,000/mm3))"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have active bleeding
(assert
(! (not patient_has_finding_of_bleeding_now@@active)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active bleeding."

;; Exclusion: patient must NOT have high bleeding risk
(assert
(! (not patient_has_finding_of_high_risk_of_bleeding_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has high bleeding risk with non-exhaustive examples ((severe liver failure) OR (active peptic ulcer disease) OR (creatinine clearance less than thirty milliliters per minute) OR (platelet count less than one hundred thousand per cubic millimeter))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (systemic hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (systemic hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (systemic hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (systemic hypertension)."} ;; "systemic hypertension"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of hypertensive disorder (systemic hypertension) is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current diagnosis of hypertensive disorder (systemic hypertension) is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of hypertensive disorder (systemic hypertension) is uncontrolled.","meaning":"Boolean indicating whether the patient's current diagnosis of hypertensive disorder (systemic hypertension) is uncontrolled."} ;; "uncontrolled systemic hypertension"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_hypertensive_disorder_now@@uncontrolled
      patient_has_diagnosis_of_hypertensive_disorder_now)
:named REQ5_AUXILIARY0)) ;; "uncontrolled systemic hypertension"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_hypertensive_disorder_now@@uncontrolled)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled systemic hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_cardiogenic_shock_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiogenic shock."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_myocardial_revascularization_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone myocardial revascularization surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone myocardial revascularization surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone myocardial revascularization surgery.","meaning":"Boolean indicating whether the patient has ever undergone myocardial revascularization surgery."} ;; "myocardial revascularization surgery"

(declare-const patient_has_undergone_myocardial_revascularization_inthehistory@@performed_with_at_least_one_internal_mammary_artery_graft Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial revascularization surgery was performed with at least one internal mammary artery graft.","when_to_set_to_false":"Set to false if the patient's myocardial revascularization surgery was not performed with at least one internal mammary artery graft.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myocardial revascularization surgery was performed with at least one internal mammary artery graft.","meaning":"Boolean indicating whether the patient's myocardial revascularization surgery was performed with at least one internal mammary artery graft."} ;; "previous myocardial revascularization surgery with at least one internal mammary artery graft"

(declare-const patient_has_undergone_myocardial_revascularization_inthehistory@@performed_with_at_least_one_radial_artery_graft Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial revascularization surgery was performed with at least one radial artery graft.","when_to_set_to_false":"Set to false if the patient's myocardial revascularization surgery was not performed with at least one radial artery graft.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myocardial revascularization surgery was performed with at least one radial artery graft.","meaning":"Boolean indicating whether the patient's myocardial revascularization surgery was performed with at least one radial artery graft."} ;; "previous myocardial revascularization surgery with at least one radial artery graft"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_myocardial_revascularization_inthehistory@@performed_with_at_least_one_internal_mammary_artery_graft
      patient_has_undergone_myocardial_revascularization_inthehistory)
   :named REQ7_AUXILIARY0)) ;; "previous myocardial revascularization surgery with at least one internal mammary artery graft"

(assert
(! (=> patient_has_undergone_myocardial_revascularization_inthehistory@@performed_with_at_least_one_radial_artery_graft
      patient_has_undergone_myocardial_revascularization_inthehistory)
   :named REQ7_AUXILIARY1)) ;; "previous myocardial revascularization surgery with at least one radial artery graft"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_undergone_myocardial_revascularization_inthehistory@@performed_with_at_least_one_internal_mammary_artery_graft)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous myocardial revascularization surgery with at least one internal mammary artery graft."

(assert
(! (not patient_has_undergone_myocardial_revascularization_inthehistory@@performed_with_at_least_one_radial_artery_graft)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous myocardial revascularization surgery with at least one radial artery graft."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral arterial occlusive disease.","when_to_set_to_false":"Set to false if the patient currently does not have peripheral arterial occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient currently has peripheral arterial occlusive disease."} ;; "peripheral arterial disease"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peripheral arterial occlusive disease is documented.","when_to_set_to_false":"Set to false if the patient's peripheral arterial occlusive disease is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's peripheral arterial occlusive disease is documented.","meaning":"Boolean indicating whether the patient's peripheral arterial occlusive disease is documented."} ;; "documented"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@prevents_use_of_femoral_technique Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peripheral arterial occlusive disease prevents the use of the femoral technique.","when_to_set_to_false":"Set to false if the patient's peripheral arterial occlusive disease does not prevent the use of the femoral technique.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's peripheral arterial occlusive disease prevents the use of the femoral technique.","meaning":"Boolean indicating whether the patient's peripheral arterial occlusive disease prevents the use of the femoral technique."} ;; "peripheral arterial disease preventing the use of the femoral technique"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@documented
       patient_has_finding_of_peripheral_arterial_occlusive_disease_now)
:named REQ8_AUXILIARY0)) ;; "documented chronic peripheral arterial disease"

(assert
(! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@prevents_use_of_femoral_technique
       patient_has_finding_of_peripheral_arterial_occlusive_disease_now)
:named REQ8_AUXILIARY1)) ;; "peripheral arterial disease preventing the use of the femoral technique"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have documented chronic peripheral arterial disease preventing the use of the femoral technique
(assert
(! (not (and patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@documented
             patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@prevents_use_of_femoral_technique))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has documented chronic peripheral arterial disease preventing the use of the femoral technique."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is severe.","when_to_set_to_false":"Set to false if the disease present in the patient is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is severe.","meaning":"Boolean indicating whether the disease present in the patient is severe."} ;; "severe"
(declare-const patient_has_finding_of_disease_now@@is_concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is concomitant (occurring simultaneously with the index condition).","when_to_set_to_false":"Set to false if the disease present in the patient is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is concomitant.","meaning":"Boolean indicating whether the disease present in the patient is concomitant."} ;; "concomitant"
(declare-const patient_has_finding_of_disease_now@@associated_with_life_expectancy_less_than_twelve_months Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is associated with a life expectancy less than twelve months.","when_to_set_to_false":"Set to false if the disease present in the patient is not associated with a life expectancy less than twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is associated with a life expectancy less than twelve months.","meaning":"Boolean indicating whether the disease present in the patient is associated with a life expectancy less than twelve months."} ;; "life expectancy less than twelve months"
(declare-const patient_life_expectancy_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's estimated life expectancy in months, as recorded at the present time.","when_to_set_to_null":"Set to null if the patient's estimated life expectancy in months is unknown, not documented, or cannot be determined at the present time.","meaning":"Numeric value indicating the patient's estimated life expectancy in months, recorded at the present time."} ;; "life expectancy less than twelve months"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@is_severe
       patient_has_finding_of_disease_now)
   :named REQ9_AUXILIARY0)) ;; "severe concomitant disease"

(assert
(! (=> patient_has_finding_of_disease_now@@is_concomitant
       patient_has_finding_of_disease_now)
   :named REQ9_AUXILIARY1)) ;; "concomitant disease"

(assert
(! (=> patient_has_finding_of_disease_now@@associated_with_life_expectancy_less_than_twelve_months
       patient_has_finding_of_disease_now)
   :named REQ9_AUXILIARY2)) ;; "disease associated with life expectancy less than twelve months"

;; Numeric value for life expectancy less than 12 months implies the corresponding qualifier
(assert
(! (=> (and patient_has_finding_of_disease_now
            (< patient_life_expectancy_value_recorded_now_in_months 12))
       patient_has_finding_of_disease_now@@associated_with_life_expectancy_less_than_twelve_months)
   :named REQ9_AUXILIARY3)) ;; "life expectancy less than twelve months"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have a severe concomitant disease with life expectancy less than twelve months
(assert
(! (not (and patient_has_finding_of_disease_now@@is_severe
             patient_has_finding_of_disease_now@@is_concomitant
             patient_has_finding_of_disease_now@@associated_with_life_expectancy_less_than_twelve_months))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe concomitant disease with life expectancy less than twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_undergone_clinical_drug_trial_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical drug trial within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical drug trial within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical drug trial within the past thirty days.","meaning":"Boolean indicating whether the patient has undergone a clinical drug trial within the past thirty days."} ;; "drug investigative clinical trials within the last thirty days"
(declare-const patient_has_undergone_clinical_device_trial_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical device trial within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical device trial within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical device trial within the past thirty days.","meaning":"Boolean indicating whether the patient has undergone a clinical device trial within the past thirty days."} ;; "device investigative clinical trials within the last thirty days"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_undergone_clinical_drug_trial_inthepast30days)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in drug investigative clinical trials within the last thirty days."

(assert
(! (not patient_has_undergone_clinical_device_trial_inthepast30days)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in device investigative clinical trials within the last thirty days."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_will_undergo_percutaneous_coronary_intervention_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planned to undergo percutaneous coronary intervention at any time in the future.","when_to_set_to_false":"Set to false if the patient is not planned to undergo percutaneous coronary intervention at any time in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planned to undergo percutaneous coronary intervention in the future.","meaning":"Boolean indicating whether the patient is planned to undergo percutaneous coronary intervention in the future."} ;; "percutaneous coronary intervention"

(declare-const patient_will_undergo_percutaneous_coronary_intervention_inthefuture@@timing_is_different_from_immediately_after_coronary_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the planned percutaneous coronary intervention is scheduled at a time different from immediately after coronary angiography.","when_to_set_to_false":"Set to false if the planned percutaneous coronary intervention is scheduled immediately after coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the timing of the planned percutaneous coronary intervention is different from immediately after coronary angiography.","meaning":"Boolean indicating whether the planned percutaneous coronary intervention is scheduled at a time different from immediately after coronary angiography."} ;; "to be performed at a time different from immediately after coronary angiography"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_will_undergo_percutaneous_coronary_intervention_inthefuture@@timing_is_different_from_immediately_after_coronary_angiography
      patient_will_undergo_percutaneous_coronary_intervention_inthefuture)
:named REQ11_AUXILIARY0)) ;; "percutaneous coronary intervention to be performed at a time different from immediately after coronary angiography"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_will_undergo_percutaneous_coronary_intervention_inthefuture@@timing_is_different_from_immediately_after_coronary_angiography)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an indication of elective percutaneous coronary intervention to be performed at a time different from immediately after coronary angiography."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "medical conditions"
(declare-const patient_has_finding_of_disease_condition_finding_now@@impairs_participation_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding that impairs participation in the study.","when_to_set_to_false":"Set to false if the patient currently has any disease, condition, or clinical finding that does not impair participation in the study, or if the patient does not have any such condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disease, condition, or clinical finding impairs participation in the study.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding impairs participation in the study."} ;; "medical conditions impairing participation in the study"
(declare-const patient_has_geographic_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any geographic condition.","when_to_set_to_false":"Set to false if the patient currently does not have any geographic condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any geographic condition.","meaning":"Boolean indicating whether the patient currently has any geographic condition."} ;; "geographic conditions"
(declare-const patient_has_geographic_condition_now@@impairs_participation_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any geographic condition that impairs participation in the study.","when_to_set_to_false":"Set to false if the patient currently has any geographic condition that does not impair participation in the study, or if the patient does not have any such condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's geographic condition impairs participation in the study.","meaning":"Boolean indicating whether the patient's current geographic condition impairs participation in the study."} ;; "geographic conditions impairing participation in the study"
(declare-const patient_has_social_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any social condition.","when_to_set_to_false":"Set to false if the patient currently does not have any social condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any social condition.","meaning":"Boolean indicating whether the patient currently has any social condition."} ;; "social conditions"
(declare-const patient_has_social_condition_now@@impairs_participation_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any social condition that impairs participation in the study.","when_to_set_to_false":"Set to false if the patient currently has any social condition that does not impair participation in the study, or if the patient does not have any such condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's social condition impairs participation in the study.","meaning":"Boolean indicating whether the patient's current social condition impairs participation in the study."} ;; "social conditions impairing participation in the study"
(declare-const patient_has_inability_to_understand_and_sign_informed_consent_term_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to understand and sign the informed consent term.","when_to_set_to_false":"Set to false if the patient currently does not have inability to understand and sign the informed consent term.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to understand and sign the informed consent term.","meaning":"Boolean indicating whether the patient currently has inability to understand and sign the informed consent term."} ;; "inability to understand and sign the informed consent term"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@impairs_participation_in_study
      patient_has_finding_of_disease_condition_finding_now)
    :named REQ12_AUXILIARY0)) ;; "medical conditions impairing participation in the study"

(assert
(! (=> patient_has_geographic_condition_now@@impairs_participation_in_study
      patient_has_geographic_condition_now)
    :named REQ12_AUXILIARY1)) ;; "geographic conditions impairing participation in the study"

(assert
(! (=> patient_has_social_condition_now@@impairs_participation_in_study
      patient_has_social_condition_now)
    :named REQ12_AUXILIARY2)) ;; "social conditions impairing participation in the study"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@impairs_participation_in_study)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has medical conditions impairing participation in the study."

(assert
(! (not patient_has_geographic_condition_now@@impairs_participation_in_study)
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has geographic conditions impairing participation in the study."

(assert
(! (not patient_has_social_condition_now@@impairs_participation_in_study)
    :named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has social conditions impairing participation in the study."

(assert
(! (not patient_has_inability_to_understand_and_sign_informed_consent_term_now)
    :named REQ12_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has inability to understand and sign the informed consent term."
