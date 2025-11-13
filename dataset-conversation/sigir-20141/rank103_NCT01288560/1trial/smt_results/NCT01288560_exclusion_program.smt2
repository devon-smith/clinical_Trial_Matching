;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_serious_physical_health_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious physical health problem (severe medical condition).","when_to_set_to_false":"Set to false if the patient currently does not have a serious physical health problem (severe medical condition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious physical health problem (severe medical condition).","meaning":"Boolean indicating whether the patient currently has a serious physical health problem (severe medical condition)."} ;; "severe medical conditions"
(declare-const patient_has_finding_of_serious_physical_health_problem_now@@significantly_affects_patient_outcome Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current serious physical health problem significantly affects the patient's outcome.","when_to_set_to_false":"Set to false if the patient's current serious physical health problem does not significantly affect the patient's outcome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current serious physical health problem significantly affects the patient's outcome.","meaning":"Boolean indicating whether the patient's current serious physical health problem significantly affects the patient's outcome."} ;; "these severe medical conditions significantly affect the patient's outcome"
(declare-const patient_has_finding_of_serious_physical_health_problem_now@@would_preclude_revascularization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current serious physical health problem would preclude revascularization.","when_to_set_to_false":"Set to false if the patient's current serious physical health problem would not preclude revascularization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current serious physical health problem would preclude revascularization.","meaning":"Boolean indicating whether the patient's current serious physical health problem would preclude revascularization."} ;; "these severe medical conditions would preclude revascularization"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
;; "with non-exhaustive examples (severe chronic obstructive pulmonary disease, active metastatic malignancy)"
(declare-const patient_has_finding_of_severe_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have severe chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has severe chronic obstructive pulmonary disease."} ;; "severe chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_active_metastatic_malignancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active metastatic malignancy.","when_to_set_to_false":"Set to false if the patient currently does not have active metastatic malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active metastatic malignancy.","meaning":"Boolean indicating whether the patient currently has active metastatic malignancy."} ;; "active metastatic malignancy"

(assert
(! (=> (or patient_has_finding_of_severe_chronic_obstructive_pulmonary_disease_now
           patient_has_finding_of_active_metastatic_malignancy_now)
       patient_has_finding_of_serious_physical_health_problem_now)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (severe chronic obstructive pulmonary disease, active metastatic malignancy)"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_serious_physical_health_problem_now@@significantly_affects_patient_outcome
       patient_has_finding_of_serious_physical_health_problem_now)
   :named REQ0_AUXILIARY1)) ;; "these severe medical conditions significantly affect the patient's outcome"

(assert
(! (=> patient_has_finding_of_serious_physical_health_problem_now@@would_preclude_revascularization
       patient_has_finding_of_serious_physical_health_problem_now)
   :named REQ0_AUXILIARY2)) ;; "these severe medical conditions would preclude revascularization"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have a severe medical condition that BOTH significantly affects outcome AND would preclude revascularization
(assert
(! (not (and patient_has_finding_of_serious_physical_health_problem_now
             patient_has_finding_of_serious_physical_health_problem_now@@significantly_affects_patient_outcome
             patient_has_finding_of_serious_physical_health_problem_now@@would_preclude_revascularization))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has severe medical conditions with non-exhaustive examples (severe chronic obstructive pulmonary disease, active metastatic malignancy)) AND (these severe medical conditions significantly affect the patient's outcome) AND (these severe medical conditions would preclude revascularization)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "less than four weeks post ST segment elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of acute ST segment elevation myocardial infarction within the past four weeks.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of acute ST segment elevation myocardial infarction within the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of acute ST segment elevation myocardial infarction within the past four weeks.","meaning":"Boolean indicating whether the patient has had a diagnosis of acute ST segment elevation myocardial infarction within the past four weeks."} ;; "ST segment elevation myocardial infarction"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_inthepast4weeks)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is less than four weeks post ST segment elevation myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_been_identified_as_not_suitable_for_revascularization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has already been identified as not suitable for revascularization.","when_to_set_to_false":"Set to false if the patient has not been identified as not suitable for revascularization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has already been identified as not suitable for revascularization.","meaning":"Boolean indicating whether the patient has already been identified as not suitable for revascularization."} ;; "has already been identified as not suitable for revascularization"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_been_identified_as_not_suitable_for_revascularization)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has already been identified as not suitable for revascularization."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_emergency_revascularization_indicated_now Bool) ;; {"when_to_set_to_true":"Set to true if emergency revascularization is currently indicated for the patient.","when_to_set_to_false":"Set to false if emergency revascularization is currently not indicated for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether emergency revascularization is currently indicated for the patient.","meaning":"Boolean indicating whether emergency revascularization is currently indicated for the patient."} ;; "The patient is excluded if the patient has emergency revascularization indicated."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_emergency_revascularization_indicated_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has emergency revascularization indicated."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart valve disorder (valvular heart disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart valve disorder (valvular heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart valve disorder (valvular heart disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart valve disorder (valvular heart disease)."} ;; "valvular heart disease"
(declare-const patient_has_diagnosis_of_heart_valve_disorder_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of heart valve disorder (valvular heart disease) is severe.","when_to_set_to_false":"Set to false if the patient's current diagnosis of heart valve disorder (valvular heart disease) is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of heart valve disorder (valvular heart disease) is severe.","meaning":"Boolean indicating whether the patient's current diagnosis of heart valve disorder (valvular heart disease) is severe."} ;; "severe valvular heart disease"
(declare-const patient_has_diagnosis_of_heart_valve_disorder_now@@requires_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of heart valve disorder (valvular heart disease) requires surgery.","when_to_set_to_false":"Set to false if the patient's current diagnosis of heart valve disorder (valvular heart disease) does not require surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of heart valve disorder (valvular heart disease) requires surgery.","meaning":"Boolean indicating whether the patient's current diagnosis of heart valve disorder (valvular heart disease) requires surgery."} ;; "valvular heart disease requiring surgery"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_heart_valve_disorder_now@@is_severe
      patient_has_diagnosis_of_heart_valve_disorder_now)
:named REQ4_AUXILIARY0)) ;; "severe valvular heart disease"

(assert
(! (=> patient_has_diagnosis_of_heart_valve_disorder_now@@requires_surgery
      patient_has_diagnosis_of_heart_valve_disorder_now)
:named REQ4_AUXILIARY1)) ;; "valvular heart disease requiring surgery"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have severe valvular heart disease requiring surgery
(assert
(! (not (and patient_has_diagnosis_of_heart_valve_disorder_now@@is_severe
             patient_has_diagnosis_of_heart_valve_disorder_now@@requires_surgery))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe valvular heart disease requiring surgery."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_can_undergo_cardiac_mri_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo cardiac magnetic resonance imaging (cardiac MRI).","when_to_set_to_false":"Set to false if the patient cannot currently undergo cardiac magnetic resonance imaging (cardiac MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo cardiac magnetic resonance imaging (cardiac MRI).","meaning":"Boolean indicating whether the patient can currently undergo cardiac magnetic resonance imaging (cardiac MRI)."} ;; "cardiac magnetic resonance imaging"
(declare-const patient_can_undergo_positron_emission_tomography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo positron emission tomography (PET).","when_to_set_to_false":"Set to false if the patient cannot currently undergo positron emission tomography (PET).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo positron emission tomography (PET).","meaning":"Boolean indicating whether the patient can currently undergo positron emission tomography (PET)."} ;; "positron emission tomography"
(declare-const patient_can_undergo_single_photon_emission_computerized_tomography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo single-photon emission computed tomography (SPECT).","when_to_set_to_false":"Set to false if the patient cannot currently undergo single-photon emission computed tomography (SPECT).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo single-photon emission computed tomography (SPECT).","meaning":"Boolean indicating whether the patient can currently undergo single-photon emission computed tomography (SPECT)."} ;; "single-photon emission computed tomography"
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current glomerular filtration rate (GFR) in milliliters per minute per 1.73 square meters is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current glomerular filtration rate (GFR) in milliliters per minute per 1.73 square meters."} ;; "glomerular filtration rate"
(declare-const patient_has_contraindication_to_cardiac_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to cardiac magnetic resonance imaging (cardiac MRI), such as metallic implant, claustrophobia, or renal failure.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to cardiac magnetic resonance imaging (cardiac MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to cardiac magnetic resonance imaging (cardiac MRI).","meaning":"Boolean indicating whether the patient currently has any contraindication to cardiac magnetic resonance imaging (cardiac MRI)."} ;; "contraindications to cardiac magnetic resonance imaging"
(declare-const patient_has_finding_of_implanted_defibrillator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implanted defibrillator.","when_to_set_to_false":"Set to false if the patient currently does not have an implanted defibrillator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implanted defibrillator.","meaning":"Boolean indicating whether the patient currently has an implanted defibrillator."} ;; "implanted defibrillator"
(declare-const patient_has_finding_of_permanent_cardiac_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a permanent cardiac pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a permanent cardiac pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a permanent cardiac pacemaker.","meaning":"Boolean indicating whether the patient currently has a permanent cardiac pacemaker."} ;; "permanent pacemaker"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_permanent_cardiac_pacemaker_now
           patient_has_finding_of_implanted_defibrillator_now
           (< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters 30))
     patient_has_contraindication_to_cardiac_magnetic_resonance_imaging_now)
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (metallic implant, claustrophobia, renal failure (glomerular filtration rate < 30 milliliters per minute per 1.73 square meters))"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have contraindication to cardiac MRI unless they have permanent pacemaker, implanted defibrillator, or GFR < 30
(assert
(! (not (and patient_has_contraindication_to_cardiac_magnetic_resonance_imaging_now
             (not (or patient_has_finding_of_permanent_cardiac_pacemaker_now
                      patient_has_finding_of_implanted_defibrillator_now
                      (< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters 30)))))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindications to cardiac magnetic resonance imaging ... AND NOT ((the patient has permanent pacemaker) OR (the patient has implanted defibrillator) OR (the patient has glomerular filtration rate < 30 milliliters per minute per 1.73 square meters))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_potential_for_non_compliance_to_tests_involved_in_this_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is judged or documented to have potential for non-compliance to the tests involved in this protocol.","when_to_set_to_false":"Set to false if the patient is judged or documented to have no potential for non-compliance to the tests involved in this protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has potential for non-compliance to the tests involved in this protocol.","meaning":"Boolean indicating whether the patient has potential for non-compliance specifically to the tests involved in this protocol."} ;; "potential for non-compliance to tests involved in this protocol"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_potential_for_non_compliance_to_tests_involved_in_this_protocol)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has potential for non-compliance to tests involved in this protocol."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_incapacity_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has incapacity to provide informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have incapacity to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has incapacity to provide informed consent.","meaning":"Boolean indicating whether the patient currently has incapacity to provide informed consent."} ;; "incapacity to provide informed consent"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_incapacity_to_provide_informed_consent_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has incapacity to provide informed consent."
