;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_or_legal_representative_has_provided_written_informed_assent_prior_to_study_procedure_initiation Bool) ;; {"when_to_set_to_true":"Set to true if either the patient or the patient's legal representative has provided written informed assent before any study procedure is initiated.","when_to_set_to_false":"Set to false if neither the patient nor the patient's legal representative has provided written informed assent before any study procedure is initiated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed assent was provided prior to initiation of any study procedure by the patient or legal representative.","meaning":"Boolean indicating whether the patient or the patient's legal representative has provided written informed assent prior to initiation of any study procedure."} ;; "written informed assent OR written informed consent provided by patient or legal representative prior to initiation of any study procedure"
(declare-const patient_or_legal_representative_has_provided_written_informed_consent_prior_to_study_procedure_initiation Bool) ;; {"when_to_set_to_true":"Set to true if either the patient or the patient's legal representative has provided written informed consent before any study procedure is initiated.","when_to_set_to_false":"Set to false if neither the patient nor the patient's legal representative has provided written informed consent before any study procedure is initiated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent was provided prior to initiation of any study procedure by the patient or legal representative.","meaning":"Boolean indicating whether the patient or the patient's legal representative has provided written informed consent prior to initiation of any study procedure."} ;; "written informed consent OR written informed assent provided by patient or legal representative prior to initiation of any study procedure"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have (the patient OR the patient's legal representative) provide (written informed consent OR written informed assent) prior to initiation of any study procedure.
(assert
  (! (or patient_or_legal_representative_has_provided_written_informed_consent_prior_to_study_procedure_initiation
         patient_or_legal_representative_has_provided_written_informed_assent_prior_to_study_procedure_initiation)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have (the patient OR the patient's legal representative) provide (written informed consent OR written informed assent) prior to initiation of any study procedure."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_is_infant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an infant.","when_to_set_to_false":"Set to false if the patient is currently not classified as an infant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an infant.","meaning":"Boolean indicating whether the patient is currently classified as an infant."} ;; "an infant"
(declare-const patient_is_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a child.","when_to_set_to_false":"Set to false if the patient is currently not classified as a child.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a child.","meaning":"Boolean indicating whether the patient is currently classified as a child."} ;; "a child"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged < 18 years"
(declare-const patient_has_diagnosis_of_acute_febrile_mucocutaneous_lymph_node_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute Kawasaki Disease (acute febrile mucocutaneous lymph node syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute Kawasaki Disease (acute febrile mucocutaneous lymph node syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute Kawasaki Disease (acute febrile mucocutaneous lymph node syndrome).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute Kawasaki Disease (acute febrile mucocutaneous lymph node syndrome)."} ;; "acute Kawasaki Disease"
(declare-const patient_has_remained_febrile_after_48hr_post_ivig_2g_per_kg Bool) ;; {"when_to_set_to_true":"Set to true if the patient has remained febrile (body temperature ≥ 38.3°C or ≥ 101.0°F) after the end of the 48-hour period following completion of intravenous immunoglobulin infusion at a dose of 2 grams per kilogram.","when_to_set_to_false":"Set to false if the patient has not remained febrile after the end of the 48-hour period following completion of intravenous immunoglobulin infusion at a dose of 2 grams per kilogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has remained febrile after the end of the 48-hour period following completion of intravenous immunoglobulin infusion at a dose of 2 grams per kilogram.","meaning":"Boolean indicating whether the patient has remained febrile after the end of the 48-hour period following completion of intravenous immunoglobulin infusion at a dose of 2 grams per kilogram."} ;; "remain febrile ... after the end of the 48-hour period after completing intravenous immunoglobulin infusion (dose = 2 grams per kilogram)"
(declare-const patient_has_become_febrile_after_48hr_post_ivig_2g_per_kg Bool) ;; {"when_to_set_to_true":"Set to true if the patient has become febrile (body temperature ≥ 38.3°C or ≥ 101.0°F) after the end of the 48-hour period following completion of intravenous immunoglobulin infusion at a dose of 2 grams per kilogram.","when_to_set_to_false":"Set to false if the patient has not become febrile after the end of the 48-hour period following completion of intravenous immunoglobulin infusion at a dose of 2 grams per kilogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has become febrile after the end of the 48-hour period following completion of intravenous immunoglobulin infusion at a dose of 2 grams per kilogram.","meaning":"Boolean indicating whether the patient has become febrile after the end of the 48-hour period following completion of intravenous immunoglobulin infusion at a dose of 2 grams per kilogram."} ;; "become febrile ... after the end of the 48-hour period after completing intravenous immunoglobulin infusion (dose = 2 grams per kilogram)"
(declare-const patient_body_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature in degrees Celsius is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body temperature in degrees Celsius recorded now."} ;; "body temperature ≥ 38.3 degrees Celsius"
(declare-const patient_body_temperature_value_recorded_now_withunit_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature in degrees Fahrenheit is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body temperature in degrees Fahrenheit recorded now."} ;; "body temperature ≥ 101.0 degrees Fahrenheit"
(declare-const patient_has_undergone_administration_of_immunoglobulin_by_intravenous_route_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone intravenous immunoglobulin infusion (IVIG) by now.","when_to_set_to_false":"Set to false if the patient has not undergone intravenous immunoglobulin infusion (IVIG) by now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone intravenous immunoglobulin infusion (IVIG) by now.","meaning":"Boolean indicating whether the patient has undergone intravenous immunoglobulin infusion (IVIG) by now."} ;; "intravenous immunoglobulin infusion"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; "an infant OR a child"
(assert
  (! (= (or patient_is_infant_now patient_is_child_now)
        (or patient_is_infant_now patient_is_child_now))
     :named REQ1_AUXILIARY0)) ;; "an infant OR a child"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must be ((an infant OR a child) AND aged < 18 years AND have acute Kawasaki Disease AND ((remain febrile ... after IVIG) OR (become febrile ... after IVIG)))
(assert
  (! (and
        (or patient_is_infant_now patient_is_child_now) ;; "an infant OR a child"
        (< patient_age_value_recorded_now_in_years 18) ;; "aged < 18 years"
        patient_has_diagnosis_of_acute_febrile_mucocutaneous_lymph_node_syndrome_now ;; "acute Kawasaki Disease"
        (or patient_has_remained_febrile_after_48hr_post_ivig_2g_per_kg
            patient_has_become_febrile_after_48hr_post_ivig_2g_per_kg) ;; "remain febrile ... OR become febrile ... after IVIG"
     )
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_persistent_fever_after_48hr_of_observation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has persistent fever after more than 48 hours of observation.","when_to_set_to_false":"Set to false if the patient does not have persistent fever after more than 48 hours of observation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has persistent fever after more than 48 hours of observation.","meaning":"Boolean indicating whether the patient has persistent fever after more than 48 hours of observation."} ;; "persistent fever after > 48 hours of observation"
(declare-const patient_has_recurrence_of_fever_after_48hr_of_observation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has recurrence of fever after more than 48 hours of observation.","when_to_set_to_false":"Set to false if the patient does not have recurrence of fever after more than 48 hours of observation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has recurrence of fever after more than 48 hours of observation.","meaning":"Boolean indicating whether the patient has recurrence of fever after more than 48 hours of observation."} ;; "recurrence of fever after > 48 hours of observation"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (persistent fever after > 48 hours of observation) OR (recurrence of fever after > 48 hours of observation).
(assert
  (! (or patient_has_persistent_fever_after_48hr_of_observation
         patient_has_recurrence_of_fever_after_48hr_of_observation)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "persistent fever after > 48 hours of observation OR recurrence of fever after > 48 hours of observation"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_fever_value_recorded_inthehistory_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient has had fever prior to intravenous immunoglobulin treatment.","when_to_set_to_null":"Set to null if the duration of fever is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days the patient has had fever at any time in the past."} ;; "febrile for ≥ 3 days prior to initial intravenous immunoglobulin treatment"
(declare-const patient_has_finding_of_fever_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had fever at any time in the past prior to intravenous immunoglobulin treatment.","when_to_set_to_false":"Set to false if the patient has not had fever at any time in the past prior to intravenous immunoglobulin treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had fever at any time in the past prior to intravenous immunoglobulin treatment.","meaning":"Boolean indicating whether the patient has had fever at any time in the past."} ;; "fever prior to initial intravenous immunoglobulin treatment"
(declare-const patient_has_undergone_administration_of_immunoglobulin_by_intravenous_route_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone administration of immunoglobulin by intravenous route at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone administration of immunoglobulin by intravenous route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone administration of immunoglobulin by intravenous route.","meaning":"Boolean indicating whether the patient has undergone administration of immunoglobulin by intravenous route at any time in the past."} ;; "prior to initial intravenous immunoglobulin treatment"
(declare-const patient_number_of_standard_clinical_criteria_met_prior_to_intravenous_immunoglobulin_treatment_value_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of standard clinical criteria (out of 5) that the patient has met prior to initial intravenous immunoglobulin treatment.","when_to_set_to_null":"Set to null if the number of standard clinical criteria met is unknown, not documented, or cannot be determined prior to initial intravenous immunoglobulin treatment.","meaning":"Numeric value representing the number of standard clinical criteria (out of 5) that the patient has met prior to initial intravenous immunoglobulin treatment."} ;; "met ≥ 4 out of 5 standard clinical criteria (Table 1) prior to initial intravenous immunoglobulin treatment"
(declare-const patient_has_undergone_echocardiography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone echocardiography at any time in the past prior to intravenous immunoglobulin treatment.","when_to_set_to_false":"Set to false if the patient has not undergone echocardiography at any time in the past prior to intravenous immunoglobulin treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone echocardiography at any time in the past prior to intravenous immunoglobulin treatment.","meaning":"Boolean indicating whether the patient has undergone echocardiography at any time in the past."} ;; "echocardiogram prior to initial intravenous immunoglobulin treatment"
(declare-const patient_has_undergone_echocardiography_inthehistory@@demonstrates_at_least_one_coronary_artery_segment Bool) ;; {"when_to_set_to_true":"Set to true if the echocardiogram demonstrates at least one coronary artery segment.","when_to_set_to_false":"Set to false if the echocardiogram does not demonstrate at least one coronary artery segment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the echocardiogram demonstrates at least one coronary artery segment.","meaning":"Boolean indicating whether the echocardiogram demonstrates at least one coronary artery segment."} ;; "echocardiogram demonstrating at least one coronary artery segment"
(declare-const patient_has_undergone_echocardiography_inthehistory@@z_score_greater_than_2 Bool) ;; {"when_to_set_to_true":"Set to true if the echocardiogram shows a Z score greater than 2 for at least one coronary artery segment.","when_to_set_to_false":"Set to false if the echocardiogram does not show a Z score greater than 2 for any coronary artery segment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the echocardiogram shows a Z score greater than 2 for any coronary artery segment.","meaning":"Boolean indicating whether the echocardiogram shows a Z score greater than 2 for at least one coronary artery segment."} ;; "echocardiogram demonstrating at least one coronary artery segment with a Z score > 2"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_echocardiography_inthehistory@@demonstrates_at_least_one_coronary_artery_segment
         patient_has_undergone_echocardiography_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "echocardiogram demonstrates at least one coronary artery segment" ⇒ "echocardiography performed"

(assert
  (! (=> patient_has_undergone_echocardiography_inthehistory@@z_score_greater_than_2
         patient_has_undergone_echocardiography_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "echocardiogram shows Z score > 2" ⇒ "echocardiography performed"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: ((febrile for ≥ 3 days AND met ≥ 4/5 criteria) OR (fever AND met 3/5 criteria AND echo with Z > 2)), all prior to initial IVIG
(assert
  (! (or
        (and
          (not patient_has_undergone_administration_of_immunoglobulin_by_intravenous_route_inthehistory) ;; "prior to initial intravenous immunoglobulin treatment"
          (>= patient_fever_value_recorded_inthehistory_withunit_days 3) ;; "febrile for ≥ 3 days"
          (>= patient_number_of_standard_clinical_criteria_met_prior_to_intravenous_immunoglobulin_treatment_value_recorded_inthehistory_withunit_count 4) ;; "met ≥ 4 out of 5 standard clinical criteria"
        )
        (and
          (not patient_has_undergone_administration_of_immunoglobulin_by_intravenous_route_inthehistory) ;; "prior to initial intravenous immunoglobulin treatment"
          patient_has_finding_of_fever_inthehistory ;; "fever"
          (= patient_number_of_standard_clinical_criteria_met_prior_to_intravenous_immunoglobulin_treatment_value_recorded_inthehistory_withunit_count 3) ;; "met 3 out of 5 clinical criteria"
          patient_has_undergone_echocardiography_inthehistory@@z_score_greater_than_2 ;; "echocardiogram demonstrating at least one coronary artery segment with a Z score > 2"
        )
     )
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, prior to the initial intravenous immunoglobulin treatment, the patient must ((have been febrile for ≥ 3 days AND have met ≥ 4 out of 5 standard clinical criteria (Table 1)) OR (have fever AND have met 3 out of 5 clinical criteria AND have an echocardiogram demonstrating at least one coronary artery segment with a Z score > 2))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const illness_day_value_recorded_at_initial_diagnosis_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since fever onset at the time of initial diagnosis, in days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days since fever onset at the time of initial diagnosis.","meaning":"Numeric value indicating the number of days since fever onset at the time of initial diagnosis, in days."} ;; "within the first 14 days after fever onset (Illness Day 14) at initial diagnosis"
(declare-const patient_has_undergone_administration_of_immunoglobulin_by_intravenous_route_inthehistory@@temporalcontext_within14days_after_fever_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone administration of immunoglobulin by intravenous route and the procedure occurred within the first 14 days after fever onset.","when_to_set_to_false":"Set to false if the patient has undergone administration of immunoglobulin by intravenous route but the procedure did not occur within the first 14 days after fever onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred within the first 14 days after fever onset.","meaning":"Boolean indicating whether the procedure occurred within the first 14 days after fever onset."} ;; "intravenous immunoglobulin treatment within the first 14 days after fever onset"
(declare-const patient_has_undergone_initial_diagnosis_within_14_days_after_fever_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone initial diagnosis and the diagnosis occurred within the first 14 days after fever onset.","when_to_set_to_false":"Set to false if the patient has undergone initial diagnosis but the diagnosis did not occur within the first 14 days after fever onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the initial diagnosis occurred within the first 14 days after fever onset.","meaning":"Boolean indicating whether the initial diagnosis occurred within the first 14 days after fever onset."} ;; "initial diagnosis within the first 14 days after fever onset"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: initial diagnosis within 14 days after fever onset
(assert
  (! (= patient_has_undergone_initial_diagnosis_within_14_days_after_fever_onset
        (and (>= illness_day_value_recorded_at_initial_diagnosis_in_days 0)
             (<= illness_day_value_recorded_at_initial_diagnosis_in_days 14)))
     :named REQ4_AUXILIARY0)) ;; "initial diagnosis within the first 14 days after fever onset (Illness Day 14)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Must present for (initial diagnosis AND intravenous immunoglobulin treatment) within the first 14 days after fever onset
(assert
  (! (and patient_has_undergone_initial_diagnosis_within_14_days_after_fever_onset
          patient_has_undergone_administration_of_immunoglobulin_by_intravenous_route_inthehistory@@temporalcontext_within14days_after_fever_onset)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "present for (initial diagnosis AND intravenous immunoglobulin treatment) within the first 14 days after fever onset (Illness Day 14)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "the patient is a female of childbearing potential"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is male."} ;; "the patient is a male"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently assessed to not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "female of childbearing potential"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@used_throughout_the_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and this use is maintained throughout the trial duration.","when_to_set_to_false":"Set to false if the patient is currently using contraception but not throughout the trial, or if contraception is not used throughout the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether contraception is used throughout the trial.","meaning":"Boolean indicating whether the patient's contraception use is maintained throughout the trial."} ;; "contraception used throughout the trial"
(declare-const patient_has_finding_of_contraception_now@@subcategory_abstinence_or_oral_contraceptives_or_intrauterine_device_or_barrier_method_with_spermicide_or_surgical_sterilization Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and the method is one of: abstinence, oral contraceptives, intrauterine device, barrier method with spermicide, or surgical sterilization.","when_to_set_to_false":"Set to false if the patient is currently using contraception but the method is not one of the specified subcategories, or if contraception is not used.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception method is one of the specified subcategories.","meaning":"Boolean indicating whether the patient's contraception method is one of the exhaustive required subcategories."} ;; "contraception method is one of: abstinence, oral contraceptives, intrauterine device, barrier method with spermicide, or surgical sterilization"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
  (! (= patient_has_finding_of_contraception_now@@subcategory_abstinence_or_oral_contraceptives_or_intrauterine_device_or_barrier_method_with_spermicide_or_surgical_sterilization
        (and patient_has_finding_of_contraception_now
             ;; The method is one of the exhaustive subcategories (definition is encoded in the variable meaning)
        ))
     :named REQ5_AUXILIARY0)) ;; "contraception method is one of: abstinence, oral contraceptives, intrauterine device, barrier method with spermicide, or surgical sterilization"

;; Qualifier variable for "used throughout the trial" implies stem variable
(assert
  (! (=> patient_has_finding_of_contraception_now@@used_throughout_the_trial
         patient_has_finding_of_contraception_now)
     :named REQ5_AUXILIARY1)) ;; "contraception used throughout the trial"

;; Qualifier variable for exhaustive subcategory implies stem variable
(assert
  (! (=> patient_has_finding_of_contraception_now@@subcategory_abstinence_or_oral_contraceptives_or_intrauterine_device_or_barrier_method_with_spermicide_or_surgical_sterilization
         patient_has_finding_of_contraception_now)
     :named REQ5_AUXILIARY2)) ;; "contraception method is one of: abstinence, oral contraceptives, intrauterine device, barrier method with spermicide, or surgical sterilization"

;; ===================== Constraint Assertions (REQ 5) =====================
;; If (female of childbearing potential) OR (male), then must be using adequate contraception (exhaustive subcategories) throughout the trial
(assert
  (! (=> (or (and patient_sex_is_female_now patient_has_childbearing_potential_now)
             patient_sex_is_male_now)
         (and patient_has_finding_of_contraception_now@@used_throughout_the_trial
              patient_has_finding_of_contraception_now@@subcategory_abstinence_or_oral_contraceptives_or_intrauterine_device_or_barrier_method_with_spermicide_or_surgical_sterilization))
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if (female of childbearing potential) OR (male), must use adequate contraception (exhaustive subcategories) throughout the trial"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a finding of disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a finding of malignant neoplastic disease."} ;; "malignancy"
(declare-const patient_has_undergone_infusion_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an infusion at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an infusion at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an infusion.","meaning":"Boolean indicating whether the patient has ever undergone an infusion in the past."} ;; "infusion"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a plain chest x-ray at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a plain chest x-ray at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a plain chest x-ray.","meaning":"Boolean indicating whether the patient has ever undergone a plain chest x-ray in the past."} ;; "chest radiograph"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_within_one_week_prior_to_first_infusion_of_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient's plain chest x-ray was performed within one week prior to the first infusion of study drug.","when_to_set_to_false":"Set to false if the patient's plain chest x-ray was not performed within one week prior to the first infusion of study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the timing of the chest x-ray was within one week prior to the first infusion of study drug.","meaning":"Boolean indicating whether the patient's plain chest x-ray was performed within one week prior to the first infusion of study drug."} ;; "chest radiograph within one week prior to first infusion of study drug"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory@@outcome_no_evidence_of_malignancy_infection_or_fibrosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's plain chest x-ray showed no evidence of malignancy, infection, or fibrosis.","when_to_set_to_false":"Set to false if the patient's plain chest x-ray showed evidence of malignancy, infection, or fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest x-ray showed evidence of malignancy, infection, or fibrosis.","meaning":"Boolean indicating whether the patient's plain chest x-ray showed no evidence of malignancy, infection, or fibrosis."} ;; "no evidence of malignancy, infection, or fibrosis on chest radiograph"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_within_one_week_prior_to_first_infusion_of_study_drug@@outcome_no_evidence_of_malignancy_infection_or_fibrosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's plain chest x-ray was performed within one week prior to the first infusion of study drug and showed no evidence of malignancy, infection, or fibrosis.","when_to_set_to_false":"Set to false if the patient's plain chest x-ray was performed within one week prior to the first infusion of study drug and showed evidence of malignancy, infection, or fibrosis, or if no chest x-ray was performed within that timeframe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest x-ray was performed within one week prior to the first infusion of study drug and showed no evidence of malignancy, infection, or fibrosis.","meaning":"Boolean indicating whether the patient's plain chest x-ray was performed within one week prior to the first infusion of study drug and showed no evidence of malignancy, infection, or fibrosis."} ;; "chest radiograph within one week prior to first infusion of study drug with no evidence of malignancy, infection, or fibrosis"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable for timing implies stem variable
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_within_one_week_prior_to_first_infusion_of_study_drug
         patient_has_undergone_plain_chest_x_ray_inthehistory)
     :named REQ6_AUXILIARY0)) ;; "chest radiograph within one week prior to first infusion of study drug" implies "chest radiograph in the history"

;; Qualifier variable for outcome implies stem variable
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_inthehistory@@outcome_no_evidence_of_malignancy_infection_or_fibrosis
         patient_has_undergone_plain_chest_x_ray_inthehistory)
     :named REQ6_AUXILIARY1)) ;; "no evidence of malignancy, infection, or fibrosis on chest radiograph" implies "chest radiograph in the history"

;; Double qualifier variable implies both single qualifiers
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_within_one_week_prior_to_first_infusion_of_study_drug@@outcome_no_evidence_of_malignancy_infection_or_fibrosis
         (and patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_within_one_week_prior_to_first_infusion_of_study_drug
              patient_has_undergone_plain_chest_x_ray_inthehistory@@outcome_no_evidence_of_malignancy_infection_or_fibrosis))
     :named REQ6_AUXILIARY2)) ;; "chest radiograph within one week prior to first infusion of study drug with no evidence of malignancy, infection, or fibrosis" implies both timing and outcome qualifiers

;; Double qualifier variable implies stem variable
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_within_one_week_prior_to_first_infusion_of_study_drug@@outcome_no_evidence_of_malignancy_infection_or_fibrosis
         patient_has_undergone_plain_chest_x_ray_inthehistory)
     :named REQ6_AUXILIARY3)) ;; "chest radiograph within one week prior to first infusion of study drug with no evidence of malignancy, infection, or fibrosis" implies "chest radiograph in the history"

;; ===================== Constraint Assertions (REQ 6) =====================
;; The patient must have a chest radiograph within one week prior to first infusion of study drug with no evidence of malignancy, infection, or fibrosis
(assert
  (! patient_has_undergone_plain_chest_x_ray_inthehistory@@temporalcontext_within_one_week_prior_to_first_infusion_of_study_drug@@outcome_no_evidence_of_malignancy_infection_or_fibrosis
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a chest radiograph within one week prior to first infusion of study drug with no evidence of malignancy, no evidence of infection, or no evidence of fibrosis."
