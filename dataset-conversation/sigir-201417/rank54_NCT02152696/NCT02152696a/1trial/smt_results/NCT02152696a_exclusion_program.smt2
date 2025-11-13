;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing hemodynamic instability.","when_to_set_to_false":"Set to false if the patient is currently not experiencing hemodynamic instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing hemodynamic instability.","meaning":"Boolean indicating whether the patient is currently experiencing hemodynamic instability."} ;; "hemodynamically unstable"
(declare-const patient_is_in_need_of_acute_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in need of acute treatment.","when_to_set_to_false":"Set to false if the patient is currently not in need of acute treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in need of acute treatment.","meaning":"Boolean indicating whether the patient is currently in need of acute treatment."} ;; "in need of acute treatment"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_has_finding_of_hemodynamic_instability_now
               patient_is_in_need_of_acute_treatment_now))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is hemodynamically unstable) AND (the patient is in need of acute treatment)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_human_chorionic_gonadotropin_measurement_value_recorded_now_withunit_milli_international_units_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent human chorionic gonadotropin measurement recorded now, in milli-international units per milliliter, if available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's most recent human chorionic gonadotropin measurement recorded now, in milli-international units per milliliter."} ;; "human chorionic gonadotropin measurement"
(declare-const patient_human_chorionic_gonadotropin_measurement_value_recorded_now_withunit_milli_international_units_per_milliliter@@most_recent_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the value corresponds to the most recent human chorionic gonadotropin measurement available for the patient.","when_to_set_to_false":"Set to false if the value does not correspond to the most recent measurement.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value is from the most recent measurement.","meaning":"Boolean indicating whether the value is from the most recent human chorionic gonadotropin measurement."} ;; "most recent human chorionic gonadotropin measurement"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_human_chorionic_gonadotropin_measurement_value_recorded_now_withunit_milli_international_units_per_milliliter@@most_recent_measurement
             (> patient_human_chorionic_gonadotropin_measurement_value_recorded_now_withunit_milli_international_units_per_milliliter 5000)))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's most recent human chorionic gonadotropin measurement > 5000 milli-international units per milliliter."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_completed_delivery_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a completed delivery at any time in the history.","when_to_set_to_false":"Set to false if the patient has not had a completed delivery at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a completed delivery in the history.","meaning":"Boolean indicating whether the patient has had a completed delivery at any time in the history."} ;; "completed delivery"
(declare-const patient_has_completed_delivery_inthehistory@@recently_completed Bool) ;; {"when_to_set_to_true":"Set to true if the completed delivery occurred recently (per protocol definition of 'recently').","when_to_set_to_false":"Set to false if the completed delivery did not occur recently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the completed delivery was recent.","meaning":"Boolean indicating whether the completed delivery was recently completed."} ;; "recently completed delivery"
(declare-const patient_has_completed_pregnancy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a completed pregnancy at any time in the history.","when_to_set_to_false":"Set to false if the patient has not had a completed pregnancy at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a completed pregnancy in the history.","meaning":"Boolean indicating whether the patient has had a completed pregnancy at any time in the history."} ;; "completed pregnancy"
(declare-const patient_has_completed_pregnancy_inthehistory@@recently_completed Bool) ;; {"when_to_set_to_true":"Set to true if the completed pregnancy occurred recently (per protocol definition of 'recently').","when_to_set_to_false":"Set to false if the completed pregnancy did not occur recently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the completed pregnancy was recent.","meaning":"Boolean indicating whether the completed pregnancy was recently completed."} ;; "recently completed pregnancy"
(declare-const patient_has_finding_of_complete_miscarriage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a completed spontaneous abortion at any time in the history.","when_to_set_to_false":"Set to false if the patient has not had a completed spontaneous abortion at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a completed spontaneous abortion in the history.","meaning":"Boolean indicating whether the patient has had a completed spontaneous abortion at any time in the history."} ;; "completed spontaneous abortion"
(declare-const patient_has_finding_of_complete_miscarriage_inthehistory@@recently_completed Bool) ;; {"when_to_set_to_true":"Set to true if the completed spontaneous abortion occurred recently (per protocol definition of 'recently').","when_to_set_to_false":"Set to false if the completed spontaneous abortion did not occur recently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the completed spontaneous abortion was recent.","meaning":"Boolean indicating whether the completed spontaneous abortion was recently completed."} ;; "recently completed spontaneous abortion"
(declare-const patient_has_undergone_termination_of_pregnancy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a termination of pregnancy (abortion) at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone a termination of pregnancy (abortion) at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a termination of pregnancy in the history.","meaning":"Boolean indicating whether the patient has undergone a termination of pregnancy (abortion) at any time in the history."} ;; "completed elective abortion"
(declare-const patient_has_undergone_termination_of_pregnancy_inthehistory@@recently_completed Bool) ;; {"when_to_set_to_true":"Set to true if the termination of pregnancy (abortion) occurred recently (per protocol definition of 'recently').","when_to_set_to_false":"Set to false if the termination of pregnancy did not occur recently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the termination of pregnancy was recent.","meaning":"Boolean indicating whether the termination of pregnancy (abortion) was recently completed."} ;; "recently completed elective abortion"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_completed_delivery_inthehistory@@recently_completed
          patient_has_finding_of_complete_miscarriage_inthehistory@@recently_completed
          patient_has_undergone_termination_of_pregnancy_inthehistory@@recently_completed)
    patient_has_completed_pregnancy_inthehistory@@recently_completed)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((completed delivery) OR (completed spontaneous abortion) OR (completed elective abortion))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_completed_delivery_inthehistory@@recently_completed
    patient_has_completed_delivery_inthehistory)
:named REQ2_AUXILIARY1)) ;; "recently completed delivery implies completed delivery"

(assert
(! (=> patient_has_finding_of_complete_miscarriage_inthehistory@@recently_completed
    patient_has_finding_of_complete_miscarriage_inthehistory)
:named REQ2_AUXILIARY2)) ;; "recently completed spontaneous abortion implies completed spontaneous abortion"

(assert
(! (=> patient_has_undergone_termination_of_pregnancy_inthehistory@@recently_completed
    patient_has_undergone_termination_of_pregnancy_inthehistory)
:named REQ2_AUXILIARY3)) ;; "recently completed elective abortion implies completed elective abortion"

(assert
(! (=> patient_has_completed_pregnancy_inthehistory@@recently_completed
    patient_has_completed_pregnancy_inthehistory)
:named REQ2_AUXILIARY4)) ;; "recently completed pregnancy implies completed pregnancy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_completed_pregnancy_inthehistory@@recently_completed)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is obtaining care in relation to a recently completed pregnancy with non-exhaustive examples ((completed delivery) OR (completed spontaneous abortion) OR (completed elective abortion))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_gestational_trophoblastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gestational trophoblastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gestational trophoblastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gestational trophoblastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gestational trophoblastic disease."} ;; "gestational trophoblastic disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_gestational_trophoblastic_disease_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of gestational trophoblastic disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_unwilling_to_comply_with_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to comply with study procedures.","when_to_set_to_false":"Set to false if the patient is willing to comply with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to comply with study procedures.","meaning":"Boolean indicating whether the patient is unwilling to comply with study procedures."} ;; "the patient is unwilling to comply with study procedures"
(declare-const patient_is_unable_to_comply_with_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to comply with study procedures.","when_to_set_to_false":"Set to false if the patient is able to comply with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to comply with study procedures.","meaning":"Boolean indicating whether the patient is unable to comply with study procedures."} ;; "the patient is unable to comply with study procedures"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_unwilling_to_comply_with_study_procedures)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to comply with study procedures."

(assert
(! (not patient_is_unable_to_comply_with_study_procedures)
:named REQ4_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to comply with study procedures."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_allergy_to_methotrexate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to methotrexate.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to methotrexate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to methotrexate.","meaning":"Boolean indicating whether the patient currently has an allergy to methotrexate."} ;; "hypersensitivity to methotrexate"
(declare-const patient_has_finding_of_allergy_to_methotrexate_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to methotrexate is known (documented or established).","when_to_set_to_false":"Set to false if the patient's allergy to methotrexate is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to methotrexate is known.","meaning":"Boolean indicating whether the patient's allergy to methotrexate is known (documented or established)."} ;; "known hypersensitivity to methotrexate"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergy_to_methotrexate_now@@known
      patient_has_finding_of_allergy_to_methotrexate_now)
:named REQ5_AUXILIARY0)) ;; "known hypersensitivity to methotrexate"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_allergy_to_methotrexate_now@@known)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to methotrexate."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_clinical_contraindication_for_methotrexate_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinical contraindication for treatment with methotrexate.","when_to_set_to_false":"Set to false if the patient currently does not have any clinical contraindication for treatment with methotrexate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinical contraindication for treatment with methotrexate.","meaning":"Boolean indicating whether the patient currently has any clinical contraindication for treatment with methotrexate."} ;; "clinical contraindications for treatment with methotrexate"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_clinical_contraindication_for_methotrexate_treatment_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical contraindications for treatment with methotrexate."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_had_prior_medical_management_of_this_gestation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had prior medical management for this gestation.","when_to_set_to_false":"Set to false if the patient has not had prior medical management for this gestation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had prior medical management for this gestation.","meaning":"Boolean indicating whether the patient has had prior medical management for this gestation."} ;; "the patient has had prior medical management of this gestation"
(declare-const patient_has_had_prior_surgical_management_of_this_gestation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had prior surgical management for this gestation.","when_to_set_to_false":"Set to false if the patient has not had prior surgical management for this gestation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had prior surgical management for this gestation.","meaning":"Boolean indicating whether the patient has had prior surgical management for this gestation."} ;; "the patient has had prior surgical management of this gestation"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_had_prior_medical_management_of_this_gestation)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior medical management of this gestation."

(assert
(! (not patient_has_had_prior_surgical_management_of_this_gestation)
    :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior surgical management of this gestation."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_can_undergo_transfusion_of_blood_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able and willing to undergo transfusion of blood product.","when_to_set_to_false":"Set to false if the patient is currently unable or unwilling to undergo transfusion of blood product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able and willing to undergo transfusion of blood product.","meaning":"Boolean indicating whether the patient is currently able and willing to undergo transfusion of blood product."} ;; "blood transfusion"
(declare-const patient_is_unwilling_to_accept_blood_transfusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to accept a blood transfusion.","when_to_set_to_false":"Set to false if the patient is currently willing to accept a blood transfusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to accept a blood transfusion.","meaning":"Boolean indicating whether the patient is currently unwilling to accept a blood transfusion."} ;; "unwilling to accept a blood transfusion"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; The patient is unwilling to accept a blood transfusion implies the patient cannot undergo transfusion of blood product
(assert
(! (=> patient_is_unwilling_to_accept_blood_transfusion_now
    (not patient_can_undergo_transfusion_of_blood_product_now))
:named REQ8_AUXILIARY0)) ;; "The patient is excluded if the patient is unwilling to accept a blood transfusion."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_unwilling_to_accept_blood_transfusion_now)
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to accept a blood transfusion."
