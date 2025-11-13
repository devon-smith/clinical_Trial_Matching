;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myocardial infarction.","meaning":"Boolean indicating whether the patient currently has myocardial infarction."} ;; "myocardial infarction"
(declare-const patient_has_finding_of_myocardial_infarction_now@@type_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myocardial infarction and the infarction is classified as type 1.","when_to_set_to_false":"Set to false if the patient currently has myocardial infarction but it is not classified as type 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myocardial infarction is type 1.","meaning":"Boolean indicating whether the patient's current myocardial infarction is type 1."} ;; "type 1 myocardial infarction"
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina (preinfarction syndrome)."} ;; "unstable angina"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_myocardial_infarction_now@@type_1
      patient_has_finding_of_myocardial_infarction_now)
   :named REQ0_AUXILIARY0)) ;; "type 1 myocardial infarction" qualifier implies myocardial infarction

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have unstable angina OR type 1 myocardial infarction
(assert
(! (not (or patient_has_finding_of_preinfarction_syndrome_now
            patient_has_finding_of_myocardial_infarction_now@@type_1))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has unstable angina) OR (the patient has type 1 myocardial infarction)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_myocardial_revascularization_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone myocardial revascularization within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not undergone myocardial revascularization within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone myocardial revascularization within the past 7 days.","meaning":"Boolean indicating whether the patient has undergone myocardial revascularization within the past 7 days."} ;; "coronary revascularization"
(declare-const patient_has_undergone_myocardial_revascularization_inthepast7days@@percutaneous_method Bool) ;; {"when_to_set_to_true":"Set to true if the myocardial revascularization within the past 7 days was performed by a percutaneous method.","when_to_set_to_false":"Set to false if the myocardial revascularization within the past 7 days was not performed by a percutaneous method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial revascularization within the past 7 days was performed by a percutaneous method.","meaning":"Boolean indicating whether the myocardial revascularization within the past 7 days was performed by a percutaneous method."} ;; "percutaneous coronary revascularization within 7 days"
(declare-const patient_has_undergone_myocardial_revascularization_inthepast7days@@surgical_method Bool) ;; {"when_to_set_to_true":"Set to true if the myocardial revascularization within the past 7 days was performed by a surgical method.","when_to_set_to_false":"Set to false if the myocardial revascularization within the past 7 days was not performed by a surgical method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial revascularization within the past 7 days was performed by a surgical method.","meaning":"Boolean indicating whether the myocardial revascularization within the past 7 days was performed by a surgical method."} ;; "surgical coronary revascularization within 7 days"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_myocardial_revascularization_inthepast7days@@percutaneous_method
      patient_has_undergone_myocardial_revascularization_inthepast7days)
:named REQ1_AUXILIARY0)) ;; "percutaneous coronary revascularization within 7 days"

(assert
(! (=> patient_has_undergone_myocardial_revascularization_inthepast7days@@surgical_method
      patient_has_undergone_myocardial_revascularization_inthepast7days)
:named REQ1_AUXILIARY1)) ;; "surgical coronary revascularization within 7 days"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_myocardial_revascularization_inthepast7days@@percutaneous_method)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone percutaneous coronary revascularization within 7 days."

(assert
(! (not patient_has_undergone_myocardial_revascularization_inthepast7days@@surgical_method)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone surgical coronary revascularization within 7 days."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_exacerbation_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of exacerbation of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of exacerbation of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of exacerbation of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has an exacerbation of congestive heart failure."} ;; "heart failure exacerbation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_exacerbation_of_congestive_heart_failure_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure exacerbation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a heart valve disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a heart valve disorder.","meaning":"Boolean indicating whether the patient currently has a heart valve disorder."} ;; "valvular disorder"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@is_primary Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart valve disorder is primary.","when_to_set_to_false":"Set to false if the patient's current heart valve disorder is not primary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart valve disorder is primary.","meaning":"Boolean indicating whether the patient's current heart valve disorder is primary."} ;; "primary valvular disorder"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@is_primary
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ3_AUXILIARY0)) ;; "primary valvular disorder" implies "valvular disorder"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@is_primary)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a primary valvular disorder."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_dissection_of_aorta_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of aortic dissection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of aortic dissection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of aortic dissection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of aortic dissection."} ;; "aortic dissection"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_dissection_of_aorta_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has aortic dissection."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "heart disease"
(declare-const patient_has_finding_of_heart_disease_now@@infiltrative_subtype Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease and the heart disease is infiltrative.","when_to_set_to_false":"Set to false if the patient currently has heart disease and the heart disease is not infiltrative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart disease is infiltrative.","meaning":"Boolean indicating whether the patient's current heart disease is infiltrative."} ;; "infiltrative heart disease"
(declare-const patient_has_finding_of_hypertrophic_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertrophic cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have hypertrophic cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertrophic cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has hypertrophic cardiomyopathy."} ;; "hypertrophic cardiomyopathy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for infiltrative subtype implies heart disease
(assert
(! (=> patient_has_finding_of_heart_disease_now@@infiltrative_subtype
      patient_has_finding_of_heart_disease_now)
    :named REQ5_AUXILIARY0)) ;; "infiltrative heart disease"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have infiltrative heart disease
(assert
(! (not patient_has_finding_of_heart_disease_now@@infiltrative_subtype)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infiltrative heart disease."

;; Exclusion: patient must NOT have hypertrophic cardiomyopathy
(assert
(! (not patient_has_finding_of_hypertrophic_cardiomyopathy_now)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypertrophic cardiomyopathy."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_myocarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of myocarditis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of myocarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myocarditis.","meaning":"Boolean indicating whether the patient currently has myocarditis."} ;; "myocarditis"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_myocarditis_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has myocarditis."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_pulmonary_embolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary embolism."} ;; "pulmonary embolism"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_pulmonary_embolism_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary embolism."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_electrocardiographic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an electrocardiographic procedure (electrocardiogram) now.","when_to_set_to_false":"Set to false if the patient has not undergone an electrocardiographic procedure (electrocardiogram) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electrocardiographic procedure (electrocardiogram) now.","meaning":"Boolean indicating whether the patient has undergone an electrocardiographic procedure (electrocardiogram) now."} ;; "electrocardiogram"

(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value (in millimeters) of ST segment elevation recorded now if available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's ST segment elevation (in millimeters) recorded now."} ;; "ST segment elevation"

(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millimeter@@present_in_two_consecutive_leads Bool) ;; {"when_to_set_to_true":"Set to true if the measured ST segment elevation (in millimeters) recorded now is present in two consecutive leads.","when_to_set_to_false":"Set to false if the measured ST segment elevation (in millimeters) recorded now is not present in two consecutive leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST segment elevation is present in two consecutive leads.","meaning":"Boolean indicating whether the measured ST segment elevation (in millimeters) recorded now is present in two consecutive leads."} ;; "ST segment elevation > 1 millimeter in two consecutive leads"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not (and
            patient_has_undergone_electrocardiographic_procedure_now
            (> patient_st_segment_elevation_value_recorded_now_withunit_millimeter 1)
            patient_st_segment_elevation_value_recorded_now_withunit_millimeter@@present_in_two_consecutive_leads))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an electrocardiogram showing ST segment elevation > 1 millimeter in two consecutive leads."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_serum_troponin_i_measurement_99th_percentile_upper_reference_limit_value_withunit_nanogram_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the value of the 99th percentile upper reference limit for serum cardiac troponin I concentration in nanograms per milliliter as defined by the laboratory or reference standard.","when_to_set_to_null":"Set to null if the 99th percentile upper reference limit value is not available, not documented, or indeterminate.","meaning":"Numeric value representing the 99th percentile upper reference limit for serum cardiac troponin I concentration in nanograms per milliliter for the patient."} ;; "serum cardiac troponin concentration > 99th percentile upper reference limit"

(declare-const patient_serum_troponin_i_measurement_value_recorded_now_withunit_nanogram_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's serum cardiac troponin I concentration in nanograms per milliliter is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum cardiac troponin I concentration in nanograms per milliliter."} ;; "serum cardiac troponin concentration"

(declare-const patient_serum_troponin_i_measurement_has_clear_rise_or_fall_pattern_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current serum cardiac troponin I concentration demonstrates a clear rise or fall pattern.","when_to_set_to_false":"Set to false if the patient's current serum cardiac troponin I concentration does not demonstrate a clear rise or fall pattern.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current serum cardiac troponin I concentration demonstrates a clear rise or fall pattern.","meaning":"Boolean indicating whether the patient's current serum cardiac troponin I concentration demonstrates a clear rise or fall pattern."} ;; "the patient does NOT have a clear rise or fall pattern in serum cardiac troponin concentration"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (and
         (> patient_serum_troponin_i_measurement_value_recorded_now_withunit_nanogram_per_milliliter
            patient_serum_troponin_i_measurement_99th_percentile_upper_reference_limit_value_withunit_nanogram_per_milliliter)
         (not patient_serum_troponin_i_measurement_has_clear_rise_or_fall_pattern_now)))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has serum cardiac troponin concentration > 99th percentile upper reference limit) AND (the patient does NOT have a clear rise or fall pattern in serum cardiac troponin concentration)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_chronic_inflammatory_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a chronic inflammatory disorder at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a chronic inflammatory disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a chronic inflammatory disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of chronic inflammatory disorder in their medical history."} ;; "chronic inflammatory disease"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_inflammatory_disorder_inthehistory)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chronic inflammatory disease."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any anticoagulant agent.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any anticoagulant agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any anticoagulant agent.","meaning":"Boolean indicating whether the patient is currently exposed to any anticoagulant agent."} ;; "anticoagulant agents"
(declare-const patient_is_exposed_to_anticoagulant_now@@therapeutic_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any anticoagulant agent at a therapeutic dose.","when_to_set_to_false":"Set to false if the patient is currently exposed to any anticoagulant agent but not at a therapeutic dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is at a therapeutic dose.","meaning":"Boolean indicating whether the patient is currently exposed to any anticoagulant agent at a therapeutic dose."} ;; "therapeutic-dose anticoagulant agents"
(declare-const patient_is_taking_platelet_aggregation_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any platelet aggregation inhibitor containing product (antiplatelet agent).","when_to_set_to_false":"Set to false if the patient is currently not taking any platelet aggregation inhibitor containing product (antiplatelet agent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any platelet aggregation inhibitor containing product (antiplatelet agent).","meaning":"Boolean indicating whether the patient is currently taking any platelet aggregation inhibitor containing product (antiplatelet agent)."} ;; "antiplatelet agents"
(declare-const patient_is_taking_platelet_aggregation_inhibitor_containing_product_now@@other_than_aspirin Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any antiplatelet agent other than aspirin.","when_to_set_to_false":"Set to false if the patient is currently taking only aspirin as an antiplatelet agent, or not taking any antiplatelet agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any antiplatelet agent other than aspirin.","meaning":"Boolean indicating whether the patient is currently taking any antiplatelet agent other than aspirin."} ;; "antiplatelet agents other than aspirin"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable for therapeutic-dose anticoagulant implies stem variable
(assert
(! (=> patient_is_exposed_to_anticoagulant_now@@therapeutic_dose
       patient_is_exposed_to_anticoagulant_now)
:named REQ11_AUXILIARY0)) ;; "therapeutic-dose anticoagulant agents"

;; Qualifier variable for antiplatelet agents other than aspirin implies stem variable
(assert
(! (=> patient_is_taking_platelet_aggregation_inhibitor_containing_product_now@@other_than_aspirin
       patient_is_taking_platelet_aggregation_inhibitor_containing_product_now)
:named REQ11_AUXILIARY1)) ;; "antiplatelet agents other than aspirin"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient is excluded if (uses therapeutic-dose anticoagulant agents) OR (uses antiplatelet agents other than aspirin)
(assert
(! (not (or patient_is_exposed_to_anticoagulant_now@@therapeutic_dose
            patient_is_taking_platelet_aggregation_inhibitor_containing_product_now@@other_than_aspirin))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient uses therapeutic-dose anticoagulant agents) OR (the patient uses antiplatelet agents other than aspirin)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_incarcerated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently incarcerated as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not incarcerated as documented or reported.","when_to_set_to_null":"Set to null if the patient's current incarceration status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently incarcerated."} ;; "the patient is incarcerated"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_incarcerated_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is incarcerated."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_enrolled_in_competing_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in a competing study.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in a competing study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in a competing study.","meaning":"Boolean indicating whether the patient is currently enrolled in a competing study."} ;; "The patient is excluded if the patient is enrolled in a competing study."

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_enrolled_in_competing_study_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is enrolled in a competing study."
