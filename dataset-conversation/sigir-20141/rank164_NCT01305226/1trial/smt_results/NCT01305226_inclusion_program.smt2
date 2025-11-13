;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently documented as male.","when_to_set_to_false":"Set to false if the patient's sex is currently documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."}  ;; "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently documented as female.","when_to_set_to_false":"Set to false if the patient's sex is currently documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."}  ;; "be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 30 years AND age ≤ 75 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((be male) OR ((be female) AND (age ≥ 30 years AND age ≤ 75 years))).
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (>= patient_age_value_recorded_now_in_years 30)
              (<= patient_age_value_recorded_now_in_years 75)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_symptoms_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms presumed secondary to an acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms presumed secondary to an acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms presumed secondary to an acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has symptoms presumed secondary to an acute myocardial infarction."} ;; "symptoms presumed secondary to an acute myocardial infarction"
(declare-const patient_has_symptoms_of_acute_myocardial_infarction_duration_value_recorded_now_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the duration in minutes of symptoms presumed secondary to an acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how long the symptoms lasted.","meaning":"Numeric value indicating the duration in minutes of symptoms presumed secondary to an acute myocardial infarction."} ;; "lasting at least 20 minutes"
(declare-const patient_presentation_time_from_symptom_onset_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours from the onset of symptoms to the time the patient presents for care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours elapsed from symptom onset to presentation.","meaning":"Numeric value indicating the number of hours from the onset of symptoms to the time the patient presents for care."} ;; "present within 12 hours"
(declare-const patient_has_undergone_electrocardiographic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an electrocardiogram procedure now.","when_to_set_to_false":"Set to false if the patient has not undergone an electrocardiogram procedure now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electrocardiogram procedure now.","meaning":"Boolean indicating whether the patient has undergone an electrocardiogram procedure now."} ;; "electrocardiogram evidence"
(declare-const patient_st_segment_elevation_in_limb_leads_value_recorded_now_withunit_millimeters Real) ;; {"when_to_set_to_value":"Set to the magnitude of ST segment elevation in limb leads in millimeters on electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the magnitude of ST segment elevation in limb leads is.","meaning":"Numeric value indicating the magnitude of ST segment elevation in limb leads in millimeters on electrocardiogram."} ;; "ST segment elevation > 1 millimeter in limb leads"
(declare-const patient_number_of_limb_leads_with_st_segment_elevation_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of limb leads with ST segment elevation on electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many limb leads have ST segment elevation.","meaning":"Numeric value indicating the number of limb leads with ST segment elevation on electrocardiogram."} ;; "in ≥ 2 limb leads"
(declare-const patient_st_segment_elevation_in_precordial_leads_value_recorded_now_withunit_millimeters Real) ;; {"when_to_set_to_value":"Set to the magnitude of ST segment elevation in precordial leads in millimeters on electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the magnitude of ST segment elevation in precordial leads is.","meaning":"Numeric value indicating the magnitude of ST segment elevation in precordial leads in millimeters on electrocardiogram."} ;; "ST segment elevation > 2 millimeters in precordial leads"
(declare-const patient_number_of_precordial_leads_with_st_segment_elevation_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of precordial leads with ST segment elevation on electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many precordial leads have ST segment elevation.","meaning":"Numeric value indicating the number of precordial leads with ST segment elevation on electrocardiogram."} ;; "in ≥ 2 contiguous precordial leads"
(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have a left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a left bundle branch block.","meaning":"Boolean indicating whether the patient currently has a left bundle branch block."} ;; "left bundle branch block"
(declare-const patient_has_finding_of_left_bundle_branch_block_now@@new Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a left bundle branch block and the finding is new.","when_to_set_to_false":"Set to false if the patient currently has a left bundle branch block and the finding is not new.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the left bundle branch block is new.","meaning":"Boolean indicating whether the patient currently has a left bundle branch block and the finding is new."} ;; "new left bundle branch block"
(declare-const patient_has_finding_of_left_bundle_branch_block_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a left bundle branch block and the finding is suspected.","when_to_set_to_false":"Set to false if the patient currently has a left bundle branch block and the finding is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the left bundle branch block is suspected.","meaning":"Boolean indicating whether the patient currently has a left bundle branch block and the finding is suspected."} ;; "suspected left bundle branch block"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_left_bundle_branch_block_now@@new
         patient_has_finding_of_left_bundle_branch_block_now)
     :named REQ1_AUXILIARY0)) ;; "new left bundle branch block" implies "left bundle branch block"

(assert
  (! (=> patient_has_finding_of_left_bundle_branch_block_now@@suspected
         patient_has_finding_of_left_bundle_branch_block_now)
     :named REQ1_AUXILIARY1)) ;; "suspected left bundle branch block" implies "left bundle branch block"

;; Definition: "suspected new left bundle branch block" means both "suspected" and "new"
(define-fun patient_has_finding_of_suspected_new_left_bundle_branch_block_now () Bool
  (and patient_has_finding_of_left_bundle_branch_block_now@@suspected
       patient_has_finding_of_left_bundle_branch_block_now@@new)) ;; "suspected new left bundle branch block"

;; Definition: ST segment elevation > 1mm in ≥ 2 limb leads
(define-fun patient_has_st_segment_elevation_criteria_limb_leads_now () Bool
  (and (>= patient_st_segment_elevation_in_limb_leads_value_recorded_now_withunit_millimeters 1.0)
       (>= patient_number_of_limb_leads_with_st_segment_elevation_value_recorded_now_withunit_count 2))) ;; "ST segment elevation > 1 millimeter in ≥ 2 limb leads"

;; Definition: ST segment elevation > 2mm in ≥ 2 contiguous precordial leads
(define-fun patient_has_st_segment_elevation_criteria_precordial_leads_now () Bool
  (and (>= patient_st_segment_elevation_in_precordial_leads_value_recorded_now_withunit_millimeters 2.0)
       (>= patient_number_of_precordial_leads_with_st_segment_elevation_value_recorded_now_withunit_count 2))) ;; "ST segment elevation > 2 millimeters in ≥ 2 contiguous precordial leads"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Present within 12 hours with symptoms presumed secondary to an acute myocardial infarction lasting at least 20 minutes
(assert
  (! (and
        (<= patient_presentation_time_from_symptom_onset_value_recorded_now_withunit_hours 12.0) ;; "present within 12 hours"
        patient_has_symptoms_of_acute_myocardial_infarction_now ;; "symptoms presumed secondary to an acute myocardial infarction"
        (>= patient_has_symptoms_of_acute_myocardial_infarction_duration_value_recorded_now_withunit_minutes 20.0) ;; "lasting at least 20 minutes"
     )
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 1: Electrocardiogram evidence of (ST segment elevation > 1mm in ≥ 2 limb leads) OR (ST segment elevation > 2mm in ≥ 2 contiguous precordial leads) OR (suspected new left bundle branch block)
(assert
  (! (and
        patient_has_undergone_electrocardiographic_procedure_now ;; "electrocardiogram evidence"
        (or patient_has_st_segment_elevation_criteria_limb_leads_now
            patient_has_st_segment_elevation_criteria_precordial_leads_now
            patient_has_finding_of_suspected_new_left_bundle_branch_block_now)
     )
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_in_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in the hospital.","when_to_set_to_false":"Set to false if the patient is currently not in the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in the hospital.","meaning":"Boolean indicating whether the patient is currently in the hospital."} ;; "be in the hospital"
(declare-const patient_is_in_emergency_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in the emergency department.","when_to_set_to_false":"Set to false if the patient is currently not in the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in the emergency department.","meaning":"Boolean indicating whether the patient is currently in the emergency department."} ;; "be in the emergency department"
(declare-const patient_is_able_to_receive_study_medication_within_12_hours_of_symptom_onset_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to receive the study medication within 12 hours of onset of symptoms.","when_to_set_to_false":"Set to false if the patient is currently not able to receive the study medication within 12 hours of onset of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to receive the study medication within 12 hours of onset of symptoms.","meaning":"Boolean indicating whether the patient is currently able to receive the study medication within 12 hours of onset of symptoms."} ;; "able to receive the study medication within 12 hours of onset of symptoms"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must ((be in the hospital) OR (be in the emergency department AND able to receive the study medication within 12 hours of onset of symptoms)).
(assert
  (! (or patient_is_in_hospital_now
         (and patient_is_in_emergency_department_now
              patient_is_able_to_receive_study_medication_within_12_hours_of_symptom_onset_now))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be in the hospital) OR (be in the emergency department AND able to receive the study medication within 12 hours of onset of symptoms))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_urine_pregnancy_test_now_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine pregnancy test now and the result is negative.","when_to_set_to_false":"Set to false if the patient has undergone a urine pregnancy test now and the result is not negative (i.e., positive or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a urine pregnancy test now with a negative result.","meaning":"Boolean indicating whether the patient has undergone a urine pregnancy test now and the outcome is negative."} ;; "the patient must have a negative urine pregnancy test"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to become pregnant, meaning she has childbearing potential and is not using a generally accepted method of contraception.","when_to_set_to_false":"Set to false if the patient is not able to become pregnant, either due to infertility, menopause, or use of a generally accepted method of contraception.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is able to become pregnant.","meaning":"Boolean value indicating whether the patient is currently able to become pregnant."} ;; "female of child-bearing age AND NOT using a generally accepted method of contraception"
(declare-const patient_is_using_generally_accepted_method_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a generally accepted method of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using a generally accepted method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a generally accepted method of contraception.","meaning":"Boolean indicating whether the patient is currently using a generally accepted method of contraception."} ;; "using a generally accepted method of contraception"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: patient is able to be pregnant if female, of child-bearing age, and not using contraception
(assert
  (! (= patient_is_able_to_be_pregnant_now
        (and patient_sex_is_female_now
             ;; The definition of "child-bearing age" is not specified in the requirement; assumed to be encoded in the data population or set externally.
             (not patient_is_using_generally_accepted_method_of_contraception_now)))
     :named REQ3_AUXILIARY0)) ;; "female of child-bearing age AND NOT using a generally accepted method of contraception"

;; ===================== Constraint Assertions (REQ 3) =====================
;; If the patient is able to be pregnant, she must have a negative urine pregnancy test
(assert
  (! (or (not patient_is_able_to_be_pregnant_now)
         patient_has_undergone_urine_pregnancy_test_now_outcome_is_negative)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is (female of child-bearing age AND NOT using a generally accepted method of contraception), the patient must have a negative urine pregnancy test"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_provided_written_informed_consent_prior_to_study_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent prior to inclusion in the study.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent prior to inclusion in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent prior to inclusion in the study.","meaning":"Boolean indicating whether the patient has provided written informed consent prior to inclusion in the study."} ;; "written informed consent must be obtained from the patient prior to inclusion in the study"
(declare-const patient_has_provided_informed_verbal_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed verbal consent.","when_to_set_to_false":"Set to false if the patient has not provided informed verbal consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed verbal consent.","meaning":"Boolean indicating whether the patient has provided informed verbal consent."} ;; "if unable to provide written informed consent, informed verbal consent must be obtained from the patient"
(declare-const legally_acceptable_representative_has_provided_written_consent Bool) ;; {"when_to_set_to_true":"Set to true if a legally acceptable representative has provided written consent.","when_to_set_to_false":"Set to false if a legally acceptable representative has not provided written consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a legally acceptable representative has provided written consent.","meaning":"Boolean indicating whether a legally acceptable representative has provided written consent."} ;; "if neither written nor verbal consent is possible, a legally acceptable representative (relative) must provide written consent"
(declare-const legally_acceptable_representative_is_relative Bool) ;; {"when_to_set_to_true":"Set to true if the legally acceptable representative is a relative.","when_to_set_to_false":"Set to false if the legally acceptable representative is not a relative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legally acceptable representative is a relative.","meaning":"Boolean indicating whether the legally acceptable representative is a relative."} ;; "a legally acceptable representative (relative)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient is eligible if any of the following is true:
;; (1) Patient has provided written informed consent prior to study inclusion
;; (2) Patient has provided informed verbal consent (if unable to provide written consent)
;; (3) A legally acceptable representative (relative) has provided written consent (if neither written nor verbal consent is possible)
(assert
  (! (or patient_has_provided_written_informed_consent_prior_to_study_inclusion
         patient_has_provided_informed_verbal_consent
         (and legally_acceptable_representative_has_provided_written_consent
              legally_acceptable_representative_is_relative))
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "written informed consent must be obtained from the patient prior to inclusion in the study OR if unable to provide written informed consent, informed verbal consent must be obtained from the patient OR if neither written nor verbal consent is possible, a legally acceptable representative (relative) must provide written consent"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_provided_written_informed_consent_at_earliest_subsequent_opportunity Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent at the earliest subsequent opportunity after inclusion, in cases where only verbal or written consent was obtained prior to inclusion.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent at the earliest subsequent opportunity after inclusion, in cases where only verbal or written consent was obtained prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent at the earliest subsequent opportunity after inclusion, in cases where only verbal or written consent was obtained prior to inclusion.","meaning":"Boolean indicating whether the patient has provided written informed consent at the earliest subsequent opportunity after inclusion, if only verbal or written consent was obtained prior to inclusion."} ;; "written informed consent from the patient must be obtained at the earliest subsequent opportunity"

;; ===================== Constraint Assertions (REQ 5) =====================
;; If verbal or written consent was obtained prior to inclusion, written informed consent at the earliest subsequent opportunity is required
(assert
  (! (=> (or patient_has_provided_informed_verbal_consent
            patient_has_provided_written_informed_consent_prior_to_study_inclusion)
         patient_has_provided_written_informed_consent_at_earliest_subsequent_opportunity)
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if verbal or written consent was obtained prior to inclusion, written informed consent from the patient must be obtained at the earliest subsequent opportunity"
