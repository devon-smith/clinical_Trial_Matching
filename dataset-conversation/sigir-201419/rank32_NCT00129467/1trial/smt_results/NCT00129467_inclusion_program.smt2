;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_enrolled_in_oregon_health_and_science_university_radiology_clinic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in the Oregon Health & Science University radiology clinic.","when_to_set_to_false":"Set to false if the patient is not currently enrolled in the Oregon Health & Science University radiology clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in the Oregon Health & Science University radiology clinic.","meaning":"Boolean indicating whether the patient is currently enrolled in the Oregon Health & Science University radiology clinic."} // "be enrolled in the Oregon Health & Science University radiology clinic"
(declare-const patient_is_enrolled_in_oregon_health_and_science_university_oncology_clinic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in the Oregon Health & Science University oncology clinic.","when_to_set_to_false":"Set to false if the patient is not currently enrolled in the Oregon Health & Science University oncology clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in the Oregon Health & Science University oncology clinic.","meaning":"Boolean indicating whether the patient is currently enrolled in the Oregon Health & Science University oncology clinic."} // "be enrolled in the Oregon Health & Science University oncology clinic"
(declare-const patient_is_enrolled_in_veterans_affairs_palliative_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in the Veterans Affairs palliative care program.","when_to_set_to_false":"Set to false if the patient is not currently enrolled in the Veterans Affairs palliative care program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in the Veterans Affairs palliative care program.","meaning":"Boolean indicating whether the patient is currently enrolled in the Veterans Affairs palliative care program."} // "be enrolled in the Veterans Affairs palliative care"
(declare-const patient_distance_to_portland_veterans_affairs_medical_center_in_miles Real) ;; {"when_to_set_to_value":"Set to the patient's current distance in miles to the Portland Veterans Affairs Medical Center.","when_to_set_to_null":"Set to null if the patient's distance to the Portland Veterans Affairs Medical Center is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current distance in miles to the Portland Veterans Affairs Medical Center."} // "live within 120 miles of the Portland Veterans Affairs Medical Center"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((be enrolled in the Oregon Health & Science University radiology clinic) OR (be enrolled in the Oregon Health & Science University oncology clinic) OR ((be enrolled in the Veterans Affairs palliative care) AND (live within 120 miles of the Portland Veterans Affairs Medical Center))).
(assert
  (! (or patient_is_enrolled_in_oregon_health_and_science_university_radiology_clinic_now
         patient_is_enrolled_in_oregon_health_and_science_university_oncology_clinic_now
         (and patient_is_enrolled_in_veterans_affairs_palliative_care_now
              (<= patient_distance_to_portland_veterans_affairs_medical_center_in_miles 120.0)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be enrolled in the Oregon Health & Science University radiology clinic) OR (be enrolled in the Oregon Health & Science University oncology clinic) OR ((be enrolled in the Veterans Affairs palliative care) AND (live within 120 miles of the Portland Veterans Affairs Medical Center)))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_life_limiting_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease that is considered life-limiting, regardless of type (including but not limited to solid cancer, blood cancer, or other life-limiting conditions).","when_to_set_to_false":"Set to false if the patient currently does not have any disease that is considered life-limiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a life-limiting disease.","meaning":"Boolean indicating whether the patient currently has a life-limiting disease of any type."} // "the patient must have a life-limiting disease"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any type of malignant neoplastic disease (solid cancer or otherwise).","when_to_set_to_false":"Set to false if the patient currently does not have any type of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any type of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has any type of malignant neoplastic disease."} // "any type of solid cancer"
(declare-const patient_has_finding_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any type of malignant tumor of lymphoid, hemopoietic, or related tissue (blood cancer).","when_to_set_to_false":"Set to false if the patient currently does not have any type of malignant tumor of lymphoid, hemopoietic, or related tissue (blood cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any type of malignant tumor of lymphoid, hemopoietic, or related tissue (blood cancer).","meaning":"Boolean indicating whether the patient currently has any type of malignant tumor of lymphoid, hemopoietic, or related tissue (blood cancer)."} // "any type of blood cancer"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples: any type of solid cancer or any type of blood cancer are examples of life-limiting disease, but other diseases may also qualify.
(assert
  (! (=> (or patient_has_finding_of_malignant_neoplastic_disease_now
            patient_has_finding_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_now)
         patient_has_finding_of_life_limiting_disease_now)
     :named REQ1_AUXILIARY0)) ;; "any type of solid cancer OR any type of blood cancer" are non-exhaustive examples of life-limiting disease

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_life_limiting_disease_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have a life-limiting disease"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_estimated_life_expectancy_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's estimated life expectancy in days, as recorded currently.","when_to_set_to_null":"Set to null if the patient's estimated life expectancy in days is unknown, not documented, or cannot be determined as recorded currently.","meaning":"Numeric value indicating the patient's estimated life expectancy in days, as recorded currently."} // "estimated life expectancy in days"
(declare-const patient_has_finding_of_limited_life_expectancy_of_approximately_one_year_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of limited life expectancy of approximately one year.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of limited life expectancy of approximately one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of limited life expectancy of approximately one year.","meaning":"Boolean indicating whether the patient currently has a limited life expectancy of approximately one year."} // "life expectancy ≤ 1 year"
(declare-const patient_has_finding_of_limited_life_expectancy_of_approximately_one_year_now@@reflected_by_hospice_admission_or_palliative_care_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient's limited life expectancy of approximately one year is reflected by either hospice admission or palliative care status.","when_to_set_to_false":"Set to false if the patient's limited life expectancy of approximately one year is not reflected by either hospice admission or palliative care status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's limited life expectancy of approximately one year is reflected by either hospice admission or palliative care status.","meaning":"Boolean indicating whether the patient's limited life expectancy of approximately one year is reflected by either hospice admission or palliative care status."} // "life expectancy ≤ 1 year as reflected by hospice admission OR palliative care status"
(declare-const patient_is_actively_dying_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently actively dying.","when_to_set_to_false":"Set to false if the patient is currently not actively dying.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently actively dying.","meaning":"Boolean indicating whether the patient is currently actively dying."} // "be actively dying"
;; patient_is_enrolled_in_veterans_affairs_palliative_care_now is already declared and reused.

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_limited_life_expectancy_of_approximately_one_year_now@@reflected_by_hospice_admission_or_palliative_care_status
         patient_has_finding_of_limited_life_expectancy_of_approximately_one_year_now)
     :named REQ3_AUXILIARY0)) ;; "life expectancy ≤ 1 year as reflected by hospice admission OR palliative care status"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must have life expectancy ≤ 1 year as reflected by hospice admission OR palliative care status
(assert
  (! patient_has_finding_of_limited_life_expectancy_of_approximately_one_year_now@@reflected_by_hospice_admission_or_palliative_care_status
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have a life expectancy ≤ 1 year as reflected by hospice admission OR palliative care status"

;; Component 1: Must NOT be actively dying with estimated life expectancy < 10 days
(assert
  (! (not (and patient_is_actively_dying_now
               (< patient_estimated_life_expectancy_value_recorded_now_in_days 10.0)))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT (be actively dying with estimated life expectancy < 10 days)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of major depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of major depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of major depressive disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of major depressive disorder."} // "must have a diagnosis of major depressive disorder"
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now@@determined_by_structured_clinical_interview_for_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of major depressive disorder is determined by the Structured Clinical Interview for Diagnosis.","when_to_set_to_false":"Set to false if the patient's diagnosis of major depressive disorder is not determined by the Structured Clinical Interview for Diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was determined by the Structured Clinical Interview for Diagnosis.","meaning":"Boolean indicating whether the patient's diagnosis of major depressive disorder is determined by the Structured Clinical Interview for Diagnosis."} // "as determined by the Structured Clinical Interview for Diagnosis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_major_depressive_disorder_now@@determined_by_structured_clinical_interview_for_diagnosis
         patient_has_diagnosis_of_major_depressive_disorder_now)
     :named REQ4_AUXILIARY0)) ;; "as determined by the Structured Clinical Interview for Diagnosis" implies "diagnosis of major depressive disorder"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_diagnosis_of_major_depressive_disorder_now@@determined_by_structured_clinical_interview_for_diagnosis
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have a diagnosis of major depressive disorder as determined by the Structured Clinical Interview for Diagnosis"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured MADRS score if a numeric measurement of the Montgomery-Åsberg Depression Rating Scale score recorded now is available.","when_to_set_to_null":"Set to null if no such score measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Montgomery-Åsberg Depression Rating Scale score."} // "Montgomery-Åsberg Depression Rating Scale score > 19"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (> patient_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_score 19)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have significant depressive cognitive symptomatology as determined by a Montgomery-Åsberg Depression Rating Scale score > 19."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_taking_selective_serotonin_re_uptake_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a selective serotonin reuptake inhibitor (SSRI) medication.","when_to_set_to_false":"Set to false if the patient is currently not taking a selective serotonin reuptake inhibitor (SSRI) medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a selective serotonin reuptake inhibitor (SSRI) medication.","meaning":"Boolean indicating whether the patient is currently taking a selective serotonin reuptake inhibitor (SSRI) medication."} // "be currently taking a selective serotonin reuptake inhibitor"
(declare-const patient_has_finding_of_depression_severe_enough_to_meet_eligibility_criteria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has depression that is severe enough to meet the eligibility criteria for inclusion.","when_to_set_to_false":"Set to false if the patient currently does not have depression that is severe enough to meet the eligibility criteria for inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has depression that is severe enough to meet the eligibility criteria for inclusion.","meaning":"Boolean indicating whether the patient currently has depression that is severe enough to meet the eligibility criteria for inclusion."} // "have depression severe enough to meet eligibility criteria"
(declare-const patient_has_finding_of_depression_severe_enough_to_start_on_selective_serotonin_re_uptake_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has depression that is severe enough to warrant starting treatment with a selective serotonin reuptake inhibitor (SSRI).","when_to_set_to_false":"Set to false if the patient currently does not have depression that is severe enough to warrant starting treatment with a selective serotonin reuptake inhibitor (SSRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has depression that is severe enough to warrant starting treatment with a selective serotonin reuptake inhibitor (SSRI).","meaning":"Boolean indicating whether the patient currently has depression that is severe enough to warrant starting treatment with a selective serotonin reuptake inhibitor (SSRI)."} // "have depression severe enough to start on a selective serotonin reuptake inhibitor"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (or
        (and patient_is_taking_selective_serotonin_re_uptake_inhibitor_containing_product_now
             patient_has_finding_of_depression_severe_enough_to_meet_eligibility_criteria_now)
        (and (not patient_is_taking_selective_serotonin_re_uptake_inhibitor_containing_product_now)
             patient_has_finding_of_depression_severe_enough_to_start_on_selective_serotonin_re_uptake_inhibitor_now))
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((be currently taking a selective serotonin reuptake inhibitor AND have depression severe enough to meet eligibility criteria) OR (NOT be currently taking a selective serotonin reuptake inhibitor AND have depression severe enough to start on a selective serotonin reuptake inhibitor))"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_willing_and_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is both willing and able to give informed consent to participate in this study now.","when_to_set_to_false":"Set to false if the patient is not willing and/or not able to give informed consent to participate in this study now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is both willing and able to give informed consent to participate in this study now.","meaning":"Boolean indicating whether the patient is both willing and able to give informed consent to participate in this study at the present time."} // "must be willing AND able to give informed consent to participate in this study"
(declare-const patient_is_willing_and_able_to_give_informed_consent_now@@demonstrated_by_macarthur_competence_assessment_tool_for_clinical_research Bool) ;; {"when_to_set_to_true":"Set to true if the patient's willingness and ability to give informed consent is demonstrated by the MacArthur Competence Assessment Tool for clinical research.","when_to_set_to_false":"Set to false if the patient's willingness and ability to give informed consent is not demonstrated by the MacArthur Competence Assessment Tool for clinical research.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's willingness and ability to give informed consent is demonstrated by the MacArthur Competence Assessment Tool for clinical research.","meaning":"Boolean indicating whether the patient's willingness and ability to give informed consent is demonstrated by the MacArthur Competence Assessment Tool for clinical research."} // "as demonstrated by the MacArthur Competence Assessment Tool for clinical research"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_willing_and_able_to_give_informed_consent_now@@demonstrated_by_macarthur_competence_assessment_tool_for_clinical_research
         patient_is_willing_and_able_to_give_informed_consent_now)
     :named REQ7_AUXILIARY0)) ;; "as demonstrated by the MacArthur Competence Assessment Tool for clinical research"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: patient must be willing to give informed consent as demonstrated by MacArthur tool
(assert
  (! patient_is_willing_and_able_to_give_informed_consent_now@@demonstrated_by_macarthur_competence_assessment_tool_for_clinical_research
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be willing to give informed consent as demonstrated by the MacArthur Competence Assessment Tool for clinical research"

;; Component 1: patient must be able to give informed consent as demonstrated by MacArthur tool
(assert
  (! patient_is_willing_and_able_to_give_informed_consent_now@@demonstrated_by_macarthur_competence_assessment_tool_for_clinical_research
     :named REQ7_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be able to give informed consent as demonstrated by the MacArthur Competence Assessment Tool for clinical research"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_speaks_english Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to speak English.","when_to_set_to_false":"Set to false if the patient is not able to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to speak English.","meaning":"Boolean indicating whether the patient is able to speak English."} // "the patient must speak English"
(declare-const patient_understands_english Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to understand English.","when_to_set_to_false":"Set to false if the patient is not able to understand English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to understand English.","meaning":"Boolean indicating whether the patient is able to understand English."} // "the patient must understand English"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_speaks_english
     :named REQ8_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must speak English"
(assert
  (! patient_understands_english
     :named REQ8_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must understand English"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const caregiver_can_assist_with_administering_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if a caregiver is currently available and able to assist with administering medication.","when_to_set_to_false":"Set to false if a caregiver is currently not available or not able to assist with administering medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a caregiver is currently available and able to assist with administering medication.","meaning":"Boolean indicating whether a caregiver is currently available and able to assist with administering medication."} // "must have a caregiver who can assist with administering medication"
(declare-const patient_cannot_self_administer_medications_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to self-administer medications.","when_to_set_to_false":"Set to false if the patient is currently able to self-administer medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to self-administer medications.","meaning":"Boolean indicating whether the patient is currently unable to self-administer medications."} // "cannot self-administer medications"
(declare-const patient_is_at_home_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently at home.","when_to_set_to_false":"Set to false if the patient is currently not at home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at home.","meaning":"Boolean indicating whether the patient is currently at home."} // "if the patient is at home"
(declare-const patient_is_undergoing_administration_of_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the index patient is currently undergoing administration of medication.","when_to_set_to_false":"Set to false if the index patient is currently not undergoing administration of medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the index patient is currently undergoing administration of medication.","meaning":"Boolean indicating whether the index patient is currently undergoing administration of medication."} // "administering medication"

;; ===================== Constraint Assertions (REQ 9) =====================
;; If the patient is at home AND cannot self-administer medications, then the patient must have a caregiver who can assist with administering medication.
(assert
  (! (=> (and patient_is_at_home_now patient_cannot_self_administer_medications_now)
         caregiver_can_assist_with_administering_medication_now)
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is at home AND cannot self-administer medications, the patient must have a caregiver who can assist with administering medication"
