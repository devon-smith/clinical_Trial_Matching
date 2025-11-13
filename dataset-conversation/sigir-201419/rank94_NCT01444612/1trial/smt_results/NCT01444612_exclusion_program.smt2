;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const number_of_distinct_injectable_anticoagulant_medications_received_on_day_1_of_injectable_anticoagulant_therapy_value_recorded_day_1_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of distinct injectable anticoagulant medications received by the patient on Day 1 of injectable anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many distinct injectable anticoagulant medications the patient received on Day 1 of injectable anticoagulant therapy.","meaning":"Numeric value indicating the number of distinct injectable anticoagulant medications received by the patient on Day 1 of injectable anticoagulant therapy. Unit: count."} ;; "received more than one injectable anticoagulant medication (dalteparin OR enoxaparin OR fondaparinux OR unfractionated heparin) on Day 1 of injectable anticoagulant therapy."

(declare-const patient_has_taken_dalteparin_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a dalteparin-containing product at any time in their history.","when_to_set_to_false":"Set to false if the patient has never taken a dalteparin-containing product at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a dalteparin-containing product.","meaning":"Boolean indicating whether the patient has ever taken a dalteparin-containing product at any time in their history."} ;; "dalteparin"
(declare-const patient_has_taken_dalteparin_containing_product_inthehistory@@received_on_day_1_of_injectable_anticoagulant_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a dalteparin-containing product specifically on Day 1 of injectable anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient has not taken a dalteparin-containing product on Day 1 of injectable anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a dalteparin-containing product on Day 1 of injectable anticoagulant therapy.","meaning":"Boolean indicating whether the patient has taken a dalteparin-containing product on Day 1 of injectable anticoagulant therapy."} ;; "dalteparin ... on Day 1 of injectable anticoagulant therapy"

(declare-const patient_has_taken_enoxaparin_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken an enoxaparin-containing product at any time in their history.","when_to_set_to_false":"Set to false if the patient has never taken an enoxaparin-containing product at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken an enoxaparin-containing product.","meaning":"Boolean indicating whether the patient has ever taken an enoxaparin-containing product at any time in their history."} ;; "enoxaparin"
(declare-const patient_has_taken_enoxaparin_containing_product_inthehistory@@received_on_day_1_of_injectable_anticoagulant_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an enoxaparin-containing product specifically on Day 1 of injectable anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient has not taken an enoxaparin-containing product on Day 1 of injectable anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an enoxaparin-containing product on Day 1 of injectable anticoagulant therapy.","meaning":"Boolean indicating whether the patient has taken an enoxaparin-containing product on Day 1 of injectable anticoagulant therapy."} ;; "enoxaparin ... on Day 1 of injectable anticoagulant therapy"

(declare-const patient_has_taken_fondaparinux_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a fondaparinux-containing product at any time in their history.","when_to_set_to_false":"Set to false if the patient has never taken a fondaparinux-containing product at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a fondaparinux-containing product.","meaning":"Boolean indicating whether the patient has ever taken a fondaparinux-containing product at any time in their history."} ;; "fondaparinux"
(declare-const patient_has_taken_fondaparinux_containing_product_inthehistory@@received_on_day_1_of_injectable_anticoagulant_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a fondaparinux-containing product specifically on Day 1 of injectable anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient has not taken a fondaparinux-containing product on Day 1 of injectable anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a fondaparinux-containing product on Day 1 of injectable anticoagulant therapy.","meaning":"Boolean indicating whether the patient has taken a fondaparinux-containing product on Day 1 of injectable anticoagulant therapy."} ;; "fondaparinux ... on Day 1 of injectable anticoagulant therapy"

(declare-const patient_has_taken_unfractionated_heparin_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken an unfractionated heparin-containing product at any time in their history.","when_to_set_to_false":"Set to false if the patient has never taken an unfractionated heparin-containing product at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken an unfractionated heparin-containing product.","meaning":"Boolean indicating whether the patient has ever taken an unfractionated heparin-containing product at any time in their history."} ;; "unfractionated heparin"
(declare-const patient_has_taken_unfractionated_heparin_containing_product_inthehistory@@received_on_day_1_of_injectable_anticoagulant_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an unfractionated heparin-containing product specifically on Day 1 of injectable anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient has not taken an unfractionated heparin-containing product on Day 1 of injectable anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an unfractionated heparin-containing product on Day 1 of injectable anticoagulant therapy.","meaning":"Boolean indicating whether the patient has taken an unfractionated heparin-containing product on Day 1 of injectable anticoagulant therapy."} ;; "unfractionated heparin ... on Day 1 of injectable anticoagulant therapy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_taken_dalteparin_containing_product_inthehistory@@received_on_day_1_of_injectable_anticoagulant_therapy
       patient_has_taken_dalteparin_containing_product_inthehistory)
    :named REQ0_AUXILIARY0)) ;; "dalteparin ... on Day 1 of injectable anticoagulant therapy"

(assert
(! (=> patient_has_taken_enoxaparin_containing_product_inthehistory@@received_on_day_1_of_injectable_anticoagulant_therapy
       patient_has_taken_enoxaparin_containing_product_inthehistory)
    :named REQ0_AUXILIARY1)) ;; "enoxaparin ... on Day 1 of injectable anticoagulant therapy"

(assert
(! (=> patient_has_taken_fondaparinux_containing_product_inthehistory@@received_on_day_1_of_injectable_anticoagulant_therapy
       patient_has_taken_fondaparinux_containing_product_inthehistory)
    :named REQ0_AUXILIARY2)) ;; "fondaparinux ... on Day 1 of injectable anticoagulant therapy"

(assert
(! (=> patient_has_taken_unfractionated_heparin_containing_product_inthehistory@@received_on_day_1_of_injectable_anticoagulant_therapy
       patient_has_taken_unfractionated_heparin_containing_product_inthehistory)
    :named REQ0_AUXILIARY3)) ;; "unfractionated heparin ... on Day 1 of injectable anticoagulant therapy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (> number_of_distinct_injectable_anticoagulant_medications_received_on_day_1_of_injectable_anticoagulant_therapy_value_recorded_day_1_withunit_count 1))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient received more than one injectable anticoagulant medication (dalteparin OR enoxaparin OR fondaparinux OR unfractionated heparin) on Day 1 of injectable anticoagulant therapy."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_anticoagulant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any anticoagulant at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any anticoagulant at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any anticoagulant.","meaning":"Boolean indicating whether the patient has ever been exposed to any anticoagulant in the past."} ;; "anticoagulant"
(declare-const patient_is_exposed_to_anticoagulant_inthehistory@@prior_to_index_injectable_anticoagulant_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any anticoagulant occurred prior to the index injectable anticoagulant medication.","when_to_set_to_false":"Set to false if the patient's exposure to any anticoagulant did not occur prior to the index injectable anticoagulant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to any anticoagulant occurred prior to the index injectable anticoagulant medication.","meaning":"Boolean indicating whether the patient's exposure to any anticoagulant occurred prior to the index injectable anticoagulant medication."} ;; "received injectable anticoagulant therapy ... prior to the index injectable anticoagulant medication"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_exposed_to_anticoagulant_inthehistory@@prior_to_index_injectable_anticoagulant_medication)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient received injectable anticoagulant therapy (dalteparin OR enoxaparin OR fondaparinux OR unfractionated heparin) prior to the index injectable anticoagulant medication (dalteparin OR enoxaparin OR fondaparinux OR unfractionated heparin)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a primary diagnosis code of deep vein thrombosis.","when_to_set_to_false":"Set to false if the patient currently does not have a primary diagnosis code of deep vein thrombosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a primary diagnosis code of deep vein thrombosis.","meaning":"Boolean indicating whether the patient currently has a primary diagnosis code of deep vein thrombosis."} ;; "the patient has a primary diagnosis code of deep vein thrombosis"
(declare-const patient_has_diagnosis_of_pulmonary_embolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a primary diagnosis code of pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have a primary diagnosis code of pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a primary diagnosis code of pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has a primary diagnosis code of pulmonary embolism."} ;; "the patient has a primary diagnosis code of pulmonary embolism"
(declare-const patient_has_diagnosis_of_major_bleed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a primary diagnosis code of major bleed.","when_to_set_to_false":"Set to false if the patient currently does not have a primary diagnosis code of major bleed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a primary diagnosis code of major bleed.","meaning":"Boolean indicating whether the patient currently has a primary diagnosis code of major bleed."} ;; "the patient has a primary diagnosis code of major bleed"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_deep_venous_thrombosis_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a primary diagnosis code of deep vein thrombosis."

(assert
(! (not patient_has_diagnosis_of_pulmonary_embolism_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a primary diagnosis code of pulmonary embolism."

(assert
(! (not patient_has_diagnosis_of_major_bleed_now)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a primary diagnosis code of major bleed."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of deep venous thrombosis in the past 6 months.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of deep venous thrombosis in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of deep venous thrombosis in the past 6 months.","meaning":"Boolean indicating whether the patient has a diagnosis of deep venous thrombosis in the past 6 months."} ;; "deep vein thrombosis during the 6 months prior to the index hospitalization"
(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_inthepast6months@@diagnosis_code_in_emergency_department_patient_visit Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis code for deep vein thrombosis is included in an emergency department patient visit in the past 6 months.","when_to_set_to_false":"Set to false if the diagnosis code for deep vein thrombosis is not included in an emergency department patient visit in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis code for deep vein thrombosis is included in an emergency department patient visit in the past 6 months.","meaning":"Boolean indicating whether the diagnosis code for deep vein thrombosis is included in an emergency department patient visit in the past 6 months."} ;; "outpatient emergency department visit that included a diagnosis code for deep vein thrombosis during the 6 months prior to the index hospitalization"
(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_inthepast6months@@diagnosis_code_in_hospital_outpatient_clinic_visit Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis code for deep venous thrombosis is included in a hospital outpatient clinic visit in the past 6 months.","when_to_set_to_false":"Set to false if the diagnosis code for deep venous thrombosis is not included in a hospital outpatient clinic visit in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis code for deep venous thrombosis is included in a hospital outpatient clinic visit in the past 6 months.","meaning":"Boolean indicating whether the diagnosis code for deep venous thrombosis is included in a hospital outpatient clinic visit in the past 6 months."} ;; "hospital outpatient clinic visit that included a diagnosis code for deep vein thrombosis during the 6 months prior to the index hospitalization"
(declare-const patient_has_diagnosis_of_pulmonary_embolism_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of pulmonary embolism in the past 6 months.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of pulmonary embolism in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of pulmonary embolism in the past 6 months.","meaning":"Boolean indicating whether the patient has a diagnosis of pulmonary embolism in the past 6 months."} ;; "pulmonary embolism during the 6 months prior to the index hospitalization"
(declare-const patient_has_diagnosis_of_pulmonary_embolism_inthepast6months@@diagnosis_code_in_emergency_department_patient_visit Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis code for pulmonary embolism is included in an emergency department patient visit in the past 6 months.","when_to_set_to_false":"Set to false if the diagnosis code for pulmonary embolism is not included in an emergency department patient visit in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis code for pulmonary embolism is included in an emergency department patient visit in the past 6 months.","meaning":"Boolean indicating whether the diagnosis code for pulmonary embolism is included in an emergency department patient visit in the past 6 months."} ;; "outpatient emergency department visit that included a diagnosis code for pulmonary embolism during the 6 months prior to the index hospitalization"
(declare-const patient_has_diagnosis_of_pulmonary_embolism_inthepast6months@@diagnosis_code_in_hospital_outpatient_clinic_visit Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis code for pulmonary embolism is included in a hospital outpatient clinic visit in the past 6 months.","when_to_set_to_false":"Set to false if the diagnosis code for pulmonary embolism is not included in a hospital outpatient clinic visit in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis code for pulmonary embolism is included in a hospital outpatient clinic visit in the past 6 months.","meaning":"Boolean indicating whether the diagnosis code for pulmonary embolism is included in a hospital outpatient clinic visit in the past 6 months."} ;; "hospital outpatient clinic visit that included a diagnosis code for pulmonary embolism during the 6 months prior to the index hospitalization"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_deep_venous_thrombosis_inthepast6months@@diagnosis_code_in_emergency_department_patient_visit)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of an outpatient emergency department visit that included a diagnosis code for deep vein thrombosis during the 6 months prior to the index hospitalization."

(assert
(! (not patient_has_diagnosis_of_pulmonary_embolism_inthepast6months@@diagnosis_code_in_emergency_department_patient_visit)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of an outpatient emergency department visit that included a diagnosis code for pulmonary embolism during the 6 months prior to the index hospitalization."

(assert
(! (not patient_has_diagnosis_of_deep_venous_thrombosis_inthepast6months@@diagnosis_code_in_hospital_outpatient_clinic_visit)
    :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of a hospital outpatient clinic visit that included a diagnosis code for deep vein thrombosis during the 6 months prior to the index hospitalization."

(assert
(! (not patient_has_diagnosis_of_pulmonary_embolism_inthepast6months@@diagnosis_code_in_hospital_outpatient_clinic_visit)
    :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of a hospital outpatient clinic visit that included a diagnosis code for pulmonary embolism during the 6 months prior to the index hospitalization."

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_deep_venous_thrombosis_inthepast6months@@diagnosis_code_in_emergency_department_patient_visit
      patient_has_diagnosis_of_deep_venous_thrombosis_inthepast6months)
    :named REQ3_AUXILIARY0)) ;; "diagnosis code for deep vein thrombosis is included in an emergency department patient visit in the past 6 months"

(assert
(! (=> patient_has_diagnosis_of_deep_venous_thrombosis_inthepast6months@@diagnosis_code_in_hospital_outpatient_clinic_visit
      patient_has_diagnosis_of_deep_venous_thrombosis_inthepast6months)
    :named REQ3_AUXILIARY1)) ;; "diagnosis code for deep vein thrombosis is included in a hospital outpatient clinic visit in the past 6 months"

(assert
(! (=> patient_has_diagnosis_of_pulmonary_embolism_inthepast6months@@diagnosis_code_in_emergency_department_patient_visit
      patient_has_diagnosis_of_pulmonary_embolism_inthepast6months)
    :named REQ3_AUXILIARY2)) ;; "diagnosis code for pulmonary embolism is included in an emergency department patient visit in the past 6 months"

(assert
(! (=> patient_has_diagnosis_of_pulmonary_embolism_inthepast6months@@diagnosis_code_in_hospital_outpatient_clinic_visit
      patient_has_diagnosis_of_pulmonary_embolism_inthepast6months)
    :named REQ3_AUXILIARY3)) ;; "diagnosis code for pulmonary embolism is included in a hospital outpatient clinic visit in the past 6 months"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_patient_transfer_to_another_health_care_facility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a transfer from another health care facility during the index hospitalization.","when_to_set_to_false":"Set to false if the patient has not undergone a transfer from another health care facility during the index hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a transfer from another health care facility during the index hospitalization.","meaning":"Boolean indicating whether the patient has undergone a transfer from another health care facility during the index hospitalization."} ;; "transferred from another facility outside the Premier system on index hospitalization."
(declare-const patient_has_undergone_patient_transfer_to_another_health_care_facility_now@@from_facility_outside_premier_system Bool) ;; {"when_to_set_to_true":"Set to true if the transferring facility is outside the Premier system.","when_to_set_to_false":"Set to false if the transferring facility is within the Premier system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the transferring facility is outside the Premier system.","meaning":"Boolean indicating whether the transferring facility is outside the Premier system for the patient's transfer during index hospitalization."} ;; "transferred from another facility outside the Premier system on index hospitalization."

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_patient_transfer_to_another_health_care_facility_now@@from_facility_outside_premier_system
      patient_has_undergone_patient_transfer_to_another_health_care_facility_now)
:named REQ4_AUXILIARY0)) ;; "transferred from another facility outside the Premier system on index hospitalization."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_patient_transfer_to_another_health_care_facility_now@@from_facility_outside_premier_system)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was transferred from another facility outside the Premier system on index hospitalization."
