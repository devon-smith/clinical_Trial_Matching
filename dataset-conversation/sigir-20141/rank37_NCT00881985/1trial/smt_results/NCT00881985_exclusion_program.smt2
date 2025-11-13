;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's glomerular filtration rate (GFR) in mL/min/m² is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current glomerular filtration rate (GFR) in mL/min/m²."} ;; "glomerular filtration rate < 30 mL/min/m²"

(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"

(declare-const patient_has_finding_of_renal_impairment_now@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal impairment is moderate in severity.","when_to_set_to_false":"Set to false if the patient's renal impairment is not moderate in severity (i.e., mild or severe).","when_to_set_to_null":"Set to null if the severity of the patient's renal impairment is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's renal impairment is moderate in severity."} ;; "moderate renal impairment"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: moderate renal impairment = renal impairment AND (GFR < 30 mL/min/m²)
(assert
(! (= patient_has_finding_of_renal_impairment_now@@severity_moderate
     (and patient_has_finding_of_renal_impairment_now
          (< patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min_per_m2 30)))
:named REQ0_AUXILIARY0)) ;; "moderate renal impairment (glomerular filtration rate < 30 mL/min/m²)"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severity_moderate
       patient_has_finding_of_renal_impairment_now)
:named REQ0_AUXILIARY1)) ;; "moderate renal impairment" implies "renal impairment"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now@@severity_moderate)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate renal impairment (glomerular filtration rate < 30 mL/min/m²)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hypertension_secondary_to_endocrine_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has secondary hypertension that is attributed to endocrine causes.","when_to_set_to_false":"Set to false if the patient currently does not have secondary hypertension due to endocrine causes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary hypertension due to endocrine causes.","meaning":"Boolean indicating whether the patient currently has secondary hypertension due to endocrine causes."} ;; "endocrine causes of secondary hypertension"
(declare-const patient_has_finding_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has secondary hypertension, regardless of cause.","when_to_set_to_false":"Set to false if the patient currently does not have secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary hypertension.","meaning":"Boolean indicating whether the patient currently has secondary hypertension."} ;; "secondary hypertension"
(declare-const patient_has_finding_of_secondary_hypertension_now@@attributed_to_renal_causes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current secondary hypertension is attributed to renal causes.","when_to_set_to_false":"Set to false if the patient's current secondary hypertension is not attributed to renal causes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current secondary hypertension is attributed to renal causes.","meaning":"Boolean indicating whether the patient's current secondary hypertension is attributed to renal causes."} ;; "renal causes of secondary hypertension"
(declare-const patient_has_finding_of_secondary_hypertension_now@@attributed_to_cardiac_causes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current secondary hypertension is attributed to cardiac causes.","when_to_set_to_false":"Set to false if the patient's current secondary hypertension is not attributed to cardiac causes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current secondary hypertension is attributed to cardiac causes.","meaning":"Boolean indicating whether the patient's current secondary hypertension is attributed to cardiac causes."} ;; "cardiac causes of secondary hypertension"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_secondary_hypertension_now@@attributed_to_renal_causes
      patient_has_finding_of_secondary_hypertension_now)
:named REQ1_AUXILIARY0)) ;; "secondary hypertension attributed to renal causes implies secondary hypertension"

(assert
(! (=> patient_has_finding_of_secondary_hypertension_now@@attributed_to_cardiac_causes
      patient_has_finding_of_secondary_hypertension_now)
:named REQ1_AUXILIARY1)) ;; "secondary hypertension attributed to cardiac causes implies secondary hypertension"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hypertension_secondary_to_endocrine_disorder_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has endocrine causes of secondary hypertension."

(assert
(! (not patient_has_finding_of_secondary_hypertension_now@@attributed_to_renal_causes)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal causes of secondary hypertension."

(assert
(! (not patient_has_finding_of_secondary_hypertension_now@@attributed_to_cardiac_causes)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiac causes of secondary hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_is_clinically_fluid_overloaded_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently clinically fluid overloaded.","when_to_set_to_false":"Set to false if the patient is currently not clinically fluid overloaded.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently clinically fluid overloaded.","meaning":"Boolean indicating whether the patient is currently clinically fluid overloaded."} ;; "clinically fluid overloaded"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (and patient_has_finding_of_congestive_heart_failure_now
               patient_is_clinically_fluid_overloaded_now))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure AND the patient is clinically fluid overloaded."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current blood pressure in mm Hg is recorded.","when_to_set_to_null":"Set to null if no current blood pressure measurement in mm Hg is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood pressure in mm Hg."} ;; "blood pressure"
(declare-const patient_blood_pressure_value_recorded_now_withunit_mm_hg@@elevated_due_to_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current blood pressure elevation is causally attributed to drug exposure.","when_to_set_to_false":"Set to false if the patient's current blood pressure elevation is not causally attributed to drug exposure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the elevation is due to drug exposure.","meaning":"Boolean indicating whether the patient's current blood pressure elevation is causally attributed to drug exposure."} ;; "blood pressure elevation is causally attributed to drug exposure"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to non-steroidal anti-inflammatory agents.","when_to_set_to_false":"Set to false if the patient is currently not exposed to non-steroidal anti-inflammatory agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to non-steroidal anti-inflammatory agents.","meaning":"Boolean indicating whether the patient is currently exposed to non-steroidal anti-inflammatory agents."} ;; "non-steroidal anti-inflammatory drugs"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a corticosteroid or corticosteroid derivative containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product."} ;; "corticosteroids"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now
           patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
    patient_blood_pressure_value_recorded_now_withunit_mm_hg@@elevated_due_to_drugs)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (non-steroidal anti-inflammatory drugs, corticosteroids)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_blood_pressure_value_recorded_now_withunit_mm_hg@@elevated_due_to_drugs
    (>= patient_blood_pressure_value_recorded_now_withunit_mm_hg 0))
:named REQ3_AUXILIARY1)) ;; "blood pressure elevation due to drugs implies blood pressure is measured"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_blood_pressure_value_recorded_now_withunit_mm_hg@@elevated_due_to_drugs)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on drugs that elevate blood pressure with non-exhaustive examples (non-steroidal anti-inflammatory drugs, corticosteroids)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (i.e., taking or prescribed) any hypotensive agent (anti-hypertensive medication).","when_to_set_to_false":"Set to false if the patient is not currently exposed to any hypotensive agent (anti-hypertensive medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any hypotensive agent (anti-hypertensive medication).","meaning":"Boolean indicating whether the patient is currently exposed to any hypotensive agent (anti-hypertensive medication)."} ;; "anti-hypertensive medications"
(declare-const patient_is_non_compliant_with_anti_hypertensive_medications_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently non-compliant with anti-hypertensive medications.","when_to_set_to_false":"Set to false if the patient is currently compliant with anti-hypertensive medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently non-compliant with anti-hypertensive medications.","meaning":"Boolean indicating whether the patient is currently non-compliant with anti-hypertensive medications."} ;; "non-compliant with anti-hypertensive medications"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_non_compliant_with_anti_hypertensive_medications_now)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is non-compliant with anti-hypertensive medications."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_unstable_medical_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any unstable medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have any unstable medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any unstable medical condition.","meaning":"Boolean indicating whether the patient currently has any unstable medical condition."} ;; "the patient has unstable medical conditions"
(declare-const patient_has_finding_of_unstable_medical_condition_now@@non_exhaustive_examples_include_unstable_angina Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current unstable medical condition includes, as a non-exhaustive example, unstable angina.","when_to_set_to_false":"Set to false if the patient's current unstable medical condition does not include unstable angina as a non-exhaustive example.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current unstable medical condition includes unstable angina as a non-exhaustive example.","meaning":"Boolean indicating whether the patient's current unstable medical condition includes unstable angina as a non-exhaustive example."} ;; "with non-exhaustive examples (unstable angina)"
(declare-const patient_has_diagnosis_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of preinfarction syndrome (unstable angina).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of preinfarction syndrome (unstable angina).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of preinfarction syndrome (unstable angina).","meaning":"Boolean indicating whether the patient currently has a diagnosis of preinfarction syndrome (unstable angina)."} ;; "unstable angina"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of myocardial infarction."} ;; "myocardial infarction"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of myocardial infarction is considered recent per study definition (e.g., within a specified time window).","when_to_set_to_false":"Set to false if the patient's history of myocardial infarction is not considered recent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction is recent.","meaning":"Boolean indicating whether the patient's history of myocardial infarction is recent."} ;; "recent myocardial infarction"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of cerebrovascular accident (stroke).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cerebrovascular accident (stroke)."} ;; "stroke"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@temporalcontext_within3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of cerebrovascular accident (stroke) occurred within the past 3 months.","when_to_set_to_false":"Set to false if the patient's history of cerebrovascular accident (stroke) did not occur within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cerebrovascular accident (stroke) occurred within the past 3 months.","meaning":"Boolean indicating whether the patient's history of cerebrovascular accident (stroke) occurred within the past 3 months."} ;; "stroke within 3 months"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive example: unstable angina implies unstable medical condition
(assert
(! (=> patient_has_diagnosis_of_preinfarction_syndrome_now
       patient_has_finding_of_unstable_medical_condition_now@@non_exhaustive_examples_include_unstable_angina)
    :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (unstable angina)"

;; Qualifier variable implies stem variable for unstable medical condition
(assert
(! (=> patient_has_finding_of_unstable_medical_condition_now@@non_exhaustive_examples_include_unstable_angina
       patient_has_finding_of_unstable_medical_condition_now)
    :named REQ5_AUXILIARY1)) ;; "unstable medical condition includes unstable angina"

;; Qualifier variable implies stem variable for recent myocardial infarction
(assert
(! (=> patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_recent
       patient_has_diagnosis_of_myocardial_infarction_inthehistory)
    :named REQ5_AUXILIARY2)) ;; "recent myocardial infarction"

;; Qualifier variable implies stem variable for stroke within 3 months
(assert
(! (=> patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@temporalcontext_within3months
       patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
    :named REQ5_AUXILIARY3)) ;; "stroke within 3 months"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: unstable medical condition (with non-exhaustive examples)
(assert
(! (not patient_has_finding_of_unstable_medical_condition_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has unstable medical conditions with non-exhaustive examples (unstable angina)"

;; Exclusion: recent myocardial infarction
(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_recent)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has recent myocardial infarction"

;; Exclusion: stroke within 3 months
(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@temporalcontext_within3months)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has stroke within 3 months"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_active_inflammatory_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of an active inflammatory condition.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of an active inflammatory condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of an active inflammatory condition.","meaning":"Boolean indicating whether the patient currently has an active inflammatory condition."} ;; "active inflammatory conditions"
(declare-const patient_has_finding_of_rheumatoid_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has a finding of rheumatoid arthritis."} ;; "rheumatoid arthritis"
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a finding of disorder due to infection."} ;; "infective conditions"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive example: rheumatoid arthritis is an example of active inflammatory condition
(assert
(! (=> patient_has_finding_of_rheumatoid_arthritis_now
      patient_has_finding_of_active_inflammatory_condition_now)
    :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (rheumatoid arthritis)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion if patient has active inflammatory condition
(assert
(! (not patient_has_finding_of_active_inflammatory_condition_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active inflammatory conditions with non-exhaustive examples (rheumatoid arthritis)."

;; Exclusion if patient has active infective condition
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active infective conditions."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_hypersomnia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypersomnia (excessive sleepiness).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypersomnia (excessive sleepiness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersomnia (excessive sleepiness).","meaning":"Boolean indicating whether the patient currently has hypersomnia (excessive sleepiness) now."} ;; "excessive sleepiness"
(declare-const patient_has_finding_of_hypersomnia_now@@is_risky Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersomnia (excessive sleepiness) is considered risky (e.g., patient is an occupational driver or machine operator).","when_to_set_to_false":"Set to false if the patient's hypersomnia (excessive sleepiness) is not considered risky.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypersomnia (excessive sleepiness) is risky.","meaning":"Boolean indicating whether the patient's hypersomnia (excessive sleepiness) is considered risky."} ;; "excessive sleepiness that can be risky (e.g., is an occupational driver or is a machine operator)"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_hypersomnia_now@@is_risky
       patient_has_finding_of_hypersomnia_now)
   :named REQ7_AUXILIARY0)) ;; "excessive sleepiness that can be risky"

;; Non-exhaustive examples imply the risky qualifier
(assert
(! (=> (or ;; is an occupational driver, is a machine operator
         false ;; Placeholder: patient_is_occupational_driver_now (not declared)
         false ;; Placeholder: patient_is_machine_operator_now (not declared)
       )
       patient_has_finding_of_hypersomnia_now@@is_risky)
   :named REQ7_AUXILIARY1)) ;; "with non-exhaustive examples (is an occupational driver, is a machine operator)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_hypersomnia_now@@is_risky)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has excessive sleepiness that can be risky with non-exhaustive examples (is an occupational driver, is a machine operator)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_antihypertensive_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a modification of antihypertensive therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a modification of antihypertensive therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a modification of antihypertensive therapy.","meaning":"Boolean indicating whether the patient has ever undergone a modification of antihypertensive therapy at any time in the past."} ;; "the patient has had modification of anti-hypertensive regimen"

(declare-const patient_has_undergone_antihypertensive_therapy_inthepast8weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a change in antihypertensive therapy within the past 8 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone a change in antihypertensive therapy within the past 8 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a change in antihypertensive therapy within the past 8 weeks.","meaning":"Boolean indicating whether the patient has undergone a change in antihypertensive therapy within the past 8 weeks."} ;; "the patient has had changes of anti-hypertensive regimen within 8 weeks"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_undergone_antihypertensive_therapy_inthehistory
            patient_has_undergone_antihypertensive_therapy_inthepast8weeks))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had modification of anti-hypertensive regimen) OR (the patient has had changes of anti-hypertensive regimen within 8 weeks)."
