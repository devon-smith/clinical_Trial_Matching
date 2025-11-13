;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criteria (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (any cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (any cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (any cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (any cancer)."} // "the patient must have any cancer"
(declare-const patient_is_exposed_to_cetuximab_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cetuximab.","when_to_set_to_false":"Set to false if the patient is currently not exposed to cetuximab.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cetuximab.","meaning":"Boolean indicating whether the patient is currently exposed to cetuximab."} // "be receiving cetuximab treatment"
(declare-const patient_is_exposed_to_cetuximab_now@@received_as_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cetuximab and is receiving it as a treatment.","when_to_set_to_false":"Set to false if the patient is currently exposed to cetuximab but is not receiving it as a treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving cetuximab as a treatment.","meaning":"Boolean indicating whether the patient is currently exposed to cetuximab and is receiving it as a treatment."} // "be receiving cetuximab treatment"
(declare-const patient_is_exposed_to_cetuximab_now@@administered_on_weekly_or_every_2_weeks_basis Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cetuximab and the administration schedule is weekly or every 2 weeks.","when_to_set_to_false":"Set to false if the patient is currently exposed to cetuximab but the administration schedule is not weekly or every 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration schedule is weekly or every 2 weeks.","meaning":"Boolean indicating whether the patient is currently exposed to cetuximab and the administration is on a weekly or every 2 weeks basis."} // "on a weekly or every 2 weeks basis"
(declare-const patient_is_exposed_to_cetuximab_now@@administered_on_weekly_or_every_2_weeks_basis@@received_as_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cetuximab, the administration schedule is weekly or every 2 weeks, and the patient is receiving it as a treatment.","when_to_set_to_false":"Set to false if the patient is currently exposed to cetuximab, but either the administration schedule is not weekly or every 2 weeks, or the patient is not receiving it as a treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cetuximab, the administration schedule is weekly or every 2 weeks, and the patient is receiving it as a treatment.","meaning":"Boolean indicating whether the patient is currently exposed to cetuximab, the administration is on a weekly or every 2 weeks basis, and the patient is receiving it as a treatment."} // "be receiving cetuximab treatment on a weekly or every 2 weeks basis"
(declare-const patient_is_exposed_to_panitumumab_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to panitumumab.","when_to_set_to_false":"Set to false if the patient is currently not exposed to panitumumab.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to panitumumab.","meaning":"Boolean indicating whether the patient is currently exposed to panitumumab."} // "be receiving panitumumab treatment"
(declare-const patient_is_exposed_to_panitumumab_now@@received_as_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to panitumumab and is receiving it as a treatment.","when_to_set_to_false":"Set to false if the patient is currently exposed to panitumumab but is not receiving it as a treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving panitumumab as a treatment.","meaning":"Boolean indicating whether the patient is currently exposed to panitumumab and is receiving it as a treatment."} // "be receiving panitumumab treatment"
(declare-const patient_is_exposed_to_panitumumab_now@@administered_on_weekly_or_every_2_weeks_basis Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to panitumumab and the administration schedule is weekly or every 2 weeks.","when_to_set_to_false":"Set to false if the patient is currently exposed to panitumumab but the administration schedule is not weekly or every 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration schedule is weekly or every 2 weeks.","meaning":"Boolean indicating whether the patient is currently exposed to panitumumab and the administration is on a weekly or every 2 weeks basis."} // "on a weekly or every 2 weeks basis"
(declare-const patient_is_exposed_to_panitumumab_now@@administered_on_weekly_or_every_2_weeks_basis@@received_as_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to panitumumab, the administration schedule is weekly or every 2 weeks, and the patient is receiving it as a treatment.","when_to_set_to_false":"Set to false if the patient is currently exposed to panitumumab, but either the administration schedule is not weekly or every 2 weeks, or the patient is not receiving it as a treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to panitumumab, the administration schedule is weekly or every 2 weeks, and the patient is receiving it as a treatment.","meaning":"Boolean indicating whether the patient is currently exposed to panitumumab, the administration is on a weekly or every 2 weeks basis, and the patient is receiving it as a treatment."} // "be receiving panitumumab treatment on a weekly or every 2 weeks basis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_is_exposed_to_cetuximab_now@@received_as_treatment
         patient_is_exposed_to_cetuximab_now)
     :named REQ1_AUXILIARY0)) ;; "be receiving cetuximab treatment"

(assert
  (! (=> patient_is_exposed_to_cetuximab_now@@administered_on_weekly_or_every_2_weeks_basis
         patient_is_exposed_to_cetuximab_now)
     :named REQ1_AUXILIARY1)) ;; "on a weekly or every 2 weeks basis" for cetuximab

(assert
  (! (=> patient_is_exposed_to_cetuximab_now@@administered_on_weekly_or_every_2_weeks_basis@@received_as_treatment
         (and patient_is_exposed_to_cetuximab_now@@administered_on_weekly_or_every_2_weeks_basis
              patient_is_exposed_to_cetuximab_now@@received_as_treatment))
     :named REQ1_AUXILIARY2)) ;; "be receiving cetuximab treatment on a weekly or every 2 weeks basis"

(assert
  (! (=> patient_is_exposed_to_panitumumab_now@@received_as_treatment
         patient_is_exposed_to_panitumumab_now)
     :named REQ1_AUXILIARY3)) ;; "be receiving panitumumab treatment"

(assert
  (! (=> patient_is_exposed_to_panitumumab_now@@administered_on_weekly_or_every_2_weeks_basis
         patient_is_exposed_to_panitumumab_now)
     :named REQ1_AUXILIARY4)) ;; "on a weekly or every 2 weeks basis" for panitumumab

(assert
  (! (=> patient_is_exposed_to_panitumumab_now@@administered_on_weekly_or_every_2_weeks_basis@@received_as_treatment
         (and patient_is_exposed_to_panitumumab_now@@administered_on_weekly_or_every_2_weeks_basis
              patient_is_exposed_to_panitumumab_now@@received_as_treatment))
     :named REQ1_AUXILIARY5)) ;; "be receiving panitumumab treatment on a weekly or every 2 weeks basis"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must have any cancer
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have any cancer"

;; Component 1: The patient must (be receiving cetuximab treatment OR be receiving panitumumab treatment) on a weekly or every 2 weeks basis
(assert
  (! (or patient_is_exposed_to_cetuximab_now@@administered_on_weekly_or_every_2_weeks_basis@@received_as_treatment
         patient_is_exposed_to_panitumumab_now@@administered_on_weekly_or_every_2_weeks_basis@@received_as_treatment)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be receiving cetuximab treatment OR be receiving panitumumab treatment on a weekly or every 2 weeks basis"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_will_undergo_cetuximab_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to start treatment with a cetuximab-containing product in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to start treatment with a cetuximab-containing product in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to start treatment with a cetuximab-containing product in the future.","meaning":"Boolean indicating whether the patient is scheduled to start treatment with a cetuximab-containing product in the future."} // "be scheduled to start cetuximab treatment"
(declare-const patient_will_undergo_panitumumab_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to start treatment with a panitumumab-containing product in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to start treatment with a panitumumab-containing product in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to start treatment with a panitumumab-containing product in the future.","meaning":"Boolean indicating whether the patient is scheduled to start treatment with a panitumumab-containing product in the future."} // "be scheduled to start panitumumab treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_will_undergo_cetuximab_containing_product_inthefuture
         patient_will_undergo_panitumumab_containing_product_inthefuture)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (be scheduled to start cetuximab treatment OR be scheduled to start panitumumab treatment)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_male Bool) ;; {"when_to_set_to_true":"Set to true if the patient is male.","when_to_set_to_false":"Set to false if the patient is not male.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is male.","meaning":"Boolean indicating whether the patient is male."} // "be male"
(declare-const patient_is_female Bool) ;; {"when_to_set_to_true":"Set to true if the patient is female.","when_to_set_to_false":"Set to false if the patient is not female.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is female.","meaning":"Boolean indicating whether the patient is female."} // "be female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pregnant.","meaning":"Boolean indicating whether the patient is currently pregnant."} // "NOT be pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently lactating.","meaning":"Boolean indicating whether the patient is currently lactating."} // "NOT be lactating"
(declare-const patient_is_postmenopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently postmenopausal.","when_to_set_to_false":"Set to false if the patient is currently not postmenopausal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently postmenopausal.","meaning":"Boolean indicating whether the patient is currently postmenopausal."} // "be postmenopausal"
(declare-const patient_is_naturally_sterile_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently naturally sterile.","when_to_set_to_false":"Set to false if the patient is currently not naturally sterile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently naturally sterile.","meaning":"Boolean indicating whether the patient is currently naturally sterile."} // "be naturally sterile"
(declare-const patient_is_surgically_sterile_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically sterile.","when_to_set_to_false":"Set to false if the patient is currently not surgically sterile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically sterile.","meaning":"Boolean indicating whether the patient is currently surgically sterile."} // "be surgically sterile"
(declare-const patient_has_negative_subunit_human_chorionic_gonadotropin_pregnancy_test_immediately_prior_to_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a negative subunit hCG pregnancy test result immediately prior to study entry.","when_to_set_to_false":"Set to false if the patient does not have a negative subunit hCG pregnancy test result immediately prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a negative subunit hCG pregnancy test result immediately prior to study entry.","meaning":"Boolean indicating whether the patient has a negative subunit hCG pregnancy test result immediately prior to study entry."} // "have a negative subunit human chorionic gonadotropin pregnancy test immediately prior to study entry"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "To be included, the patient must (be male OR (be female AND (NOT be pregnant) AND (NOT be lactating) AND (be postmenopausal OR be naturally sterile OR be surgically sterile OR have a negative subunit human chorionic gonadotropin pregnancy test immediately prior to study entry)))."
(assert
  (!
    (or
      patient_is_male
      (and
        patient_is_female
        (not patient_is_pregnant_now)
        (not patient_is_lactating_now)
        (or
          patient_is_postmenopausal_now
          patient_is_naturally_sterile_now
          patient_is_surgically_sterile_now
          patient_has_negative_subunit_human_chorionic_gonadotropin_pregnancy_test_immediately_prior_to_study_entry
        )
      )
    )
    :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE
  )
) ;; "To be included, the patient must (be male OR (be female AND (NOT be pregnant) AND (NOT be lactating) AND (be postmenopausal OR be naturally sterile OR be surgically sterile OR have a negative subunit human chorionic gonadotropin pregnancy test immediately prior to study entry)))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_able_to_understand_and_provide_signed_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand and provide signed informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to understand and/or provide signed informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand and provide signed informed consent.","meaning":"Boolean indicating whether the patient is currently able to understand and provide signed informed consent."} // "the patient must be able to understand and provide signed informed consent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_able_to_understand_and_provide_signed_informed_consent_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to understand and provide signed informed consent"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_ability_to_reliably_apply_topical_fdx104_antibiotic_foam_and_topical_vehicle_twice_a_day_to_appropriate_part_of_face Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to reliably apply both topical FDX104 antibiotic foam and topical vehicle twice a day to the appropriate part of the face.","when_to_set_to_false":"Set to false if the patient does not have the ability to reliably apply both topical FDX104 antibiotic foam and topical vehicle twice a day to the appropriate part of the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to reliably apply both topical FDX104 antibiotic foam and topical vehicle twice a day to the appropriate part of the face.","meaning":"Boolean indicating whether the patient has the ability to reliably apply both topical FDX104 antibiotic foam and topical vehicle twice a day to the appropriate part of the face."} // "the patient must have the ability to reliably apply (topical FDX104 antibiotic foam AND topical vehicle) twice a day to the appropriate part of the face."
(declare-const patient_is_taking_drug_vehicle_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or using a topical vehicle product.","when_to_set_to_false":"Set to false if the patient is currently not taking or using a topical vehicle product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or using a topical vehicle product.","meaning":"Boolean indicating whether the patient is currently taking or using a topical vehicle product."} // "topical vehicle"
(declare-const patient_is_taking_drug_vehicle_now@@applied_to_appropriate_part_of_face Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a topical vehicle and it is applied to the appropriate part of the face.","when_to_set_to_false":"Set to false if the patient is currently using a topical vehicle but it is not applied to the appropriate part of the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the topical vehicle is applied to the appropriate part of the face.","meaning":"Boolean indicating that the topical vehicle is applied to the appropriate part of the face."} // "topical vehicle applied to the appropriate part of the face"
(declare-const patient_is_taking_drug_vehicle_now@@applied_twice_a_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a topical vehicle and it is applied twice a day.","when_to_set_to_false":"Set to false if the patient is currently using a topical vehicle but it is not applied twice a day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the topical vehicle is applied twice a day.","meaning":"Boolean indicating that the topical vehicle is applied twice a day."} // "topical vehicle applied twice a day"

;; Declare new variables for FDX104 antibiotic foam application
(declare-const patient_is_taking_fdx104_antibiotic_foam_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or using topical FDX104 antibiotic foam.","when_to_set_to_false":"Set to false if the patient is currently not taking or using topical FDX104 antibiotic foam.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or using topical FDX104 antibiotic foam.","meaning":"Boolean indicating whether the patient is currently taking or using topical FDX104 antibiotic foam."} // "topical FDX104 antibiotic foam"
(declare-const patient_is_taking_fdx104_antibiotic_foam_now@@applied_to_appropriate_part_of_face Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using topical FDX104 antibiotic foam and it is applied to the appropriate part of the face.","when_to_set_to_false":"Set to false if the patient is currently using topical FDX104 antibiotic foam but it is not applied to the appropriate part of the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the topical FDX104 antibiotic foam is applied to the appropriate part of the face.","meaning":"Boolean indicating that the topical FDX104 antibiotic foam is applied to the appropriate part of the face."} // "topical FDX104 antibiotic foam applied to the appropriate part of the face"
(declare-const patient_is_taking_fdx104_antibiotic_foam_now@@applied_twice_a_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using topical FDX104 antibiotic foam and it is applied twice a day.","when_to_set_to_false":"Set to false if the patient is currently using topical FDX104 antibiotic foam but it is not applied twice a day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the topical FDX104 antibiotic foam is applied twice a day.","meaning":"Boolean indicating that the topical FDX104 antibiotic foam is applied twice a day."} // "topical FDX104 antibiotic foam applied twice a day"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_taking_drug_vehicle_now@@applied_to_appropriate_part_of_face
         patient_is_taking_drug_vehicle_now)
     :named REQ5_AUXILIARY0)) ;; "topical vehicle applied to the appropriate part of the face" implies "topical vehicle"

(assert
  (! (=> patient_is_taking_drug_vehicle_now@@applied_twice_a_day
         patient_is_taking_drug_vehicle_now)
     :named REQ5_AUXILIARY1)) ;; "topical vehicle applied twice a day" implies "topical vehicle"

(assert
  (! (=> patient_is_taking_fdx104_antibiotic_foam_now@@applied_to_appropriate_part_of_face
         patient_is_taking_fdx104_antibiotic_foam_now)
     :named REQ5_AUXILIARY2)) ;; "topical FDX104 antibiotic foam applied to the appropriate part of the face" implies "topical FDX104 antibiotic foam"

(assert
  (! (=> patient_is_taking_fdx104_antibiotic_foam_now@@applied_twice_a_day
         patient_is_taking_fdx104_antibiotic_foam_now)
     :named REQ5_AUXILIARY3)) ;; "topical FDX104 antibiotic foam applied twice a day" implies "topical FDX104 antibiotic foam"

;; Definition: patient has ability to reliably apply both products twice a day to the appropriate part of the face
(assert
  (! (= patient_has_ability_to_reliably_apply_topical_fdx104_antibiotic_foam_and_topical_vehicle_twice_a_day_to_appropriate_part_of_face
        (and patient_is_taking_fdx104_antibiotic_foam_now@@applied_to_appropriate_part_of_face
             patient_is_taking_fdx104_antibiotic_foam_now@@applied_twice_a_day
             patient_is_taking_drug_vehicle_now@@applied_to_appropriate_part_of_face
             patient_is_taking_drug_vehicle_now@@applied_twice_a_day))
     :named REQ5_AUXILIARY4)) ;; "the patient must have the ability to reliably apply (topical FDX104 antibiotic foam AND topical vehicle) twice a day to the appropriate part of the face."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_ability_to_reliably_apply_topical_fdx104_antibiotic_foam_and_topical_vehicle_twice_a_day_to_appropriate_part_of_face
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have the ability to reliably apply (topical FDX104 antibiotic foam AND topical vehicle) twice a day to the appropriate part of the face."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_willing_to_minimize_sun_exposure_for_5_weeks_from_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to minimize sun exposure for 5 weeks from the time of randomization.","when_to_set_to_false":"Set to false if the patient is not willing to minimize sun exposure for 5 weeks from the time of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to minimize sun exposure for 5 weeks from randomization.","meaning":"Boolean indicating whether the patient is willing to minimize sun exposure for 5 weeks from randomization."} // "the patient must be willing to minimize sun exposure for 5 weeks from randomization."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_willing_to_minimize_sun_exposure_for_5_weeks_from_randomization
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to minimize sun exposure for 5 weeks from randomization."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_eastern_cooperative_oncology_group_performance_status_value_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the integer value representing the patient's current ECOG performance status (0, 1, or 2) if documented.","when_to_set_to_null":"Set to null if the patient's current ECOG performance status is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current ECOG performance status (0, 1, or 2)."} // "have an Eastern Cooperative Oncology Group performance status of 0 OR ... 1 OR ... 2"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (or (= patient_eastern_cooperative_oncology_group_performance_status_value_now_withunit_integer 0)
         (= patient_eastern_cooperative_oncology_group_performance_status_value_now_withunit_integer 1)
         (= patient_eastern_cooperative_oncology_group_performance_status_value_now_withunit_integer 2))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have an Eastern Cooperative Oncology Group performance status of 0 OR have an Eastern Cooperative Oncology Group performance status of 1 OR have an Eastern Cooperative Oncology Group performance status of 2"
