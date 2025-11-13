;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_perioperative_care_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone perioperative care management now.","when_to_set_to_false":"Set to false if the patient has not undergone perioperative care management now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone perioperative care management now.","meaning":"Boolean indicating whether the patient has undergone perioperative care management now."} ;; "perioperative management"
(declare-const patient_has_undergone_perioperative_care_management_now@@explicit_instructions_provided_by_surgical_team_to_patient Bool) ;; {"when_to_set_to_true":"Set to true if the perioperative care management consisted of explicit instructions provided to the patient by the surgical team.","when_to_set_to_false":"Set to false if the perioperative care management did not consist of explicit instructions provided to the patient by the surgical team.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether explicit instructions were provided by the surgical team to the patient as part of perioperative care management.","meaning":"Boolean indicating whether perioperative care management consisted of explicit instructions provided by the surgical team to the patient."} ;; "explicit instructions provided to the patient by the surgical team regarding the perioperative management"
(declare-const patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking angiotensin converting enzyme inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking angiotensin converting enzyme inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking angiotensin converting enzyme inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking angiotensin converting enzyme inhibitor containing product."} ;; "angiotensin converting enzyme inhibitor medication"
(declare-const patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now@@perioperative_management_instructions_provided_by_surgical_team Bool) ;; {"when_to_set_to_true":"Set to true if perioperative management instructions regarding angiotensin converting enzyme inhibitor containing product were provided by the surgical team to the patient.","when_to_set_to_false":"Set to false if such instructions were not provided.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether perioperative management instructions regarding this medication were provided by the surgical team.","meaning":"Boolean indicating whether perioperative management instructions regarding angiotensin converting enzyme inhibitor containing product were provided by the surgical team."} ;; "explicit instructions provided to the patient by the surgical team regarding the perioperative management of angiotensin converting enzyme inhibitor medication"
(declare-const patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking angiotensin II receptor antagonist containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking angiotensin II receptor antagonist containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking angiotensin II receptor antagonist containing product.","meaning":"Boolean indicating whether the patient is currently taking angiotensin II receptor antagonist containing product."} ;; "angiotensin receptor blocker medication"
(declare-const patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now@@perioperative_management_instructions_provided_by_surgical_team Bool) ;; {"when_to_set_to_true":"Set to true if perioperative management instructions regarding angiotensin II receptor antagonist containing product were provided by the surgical team to the patient.","when_to_set_to_false":"Set to false if such instructions were not provided.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether perioperative management instructions regarding this medication were provided by the surgical team.","meaning":"Boolean indicating whether perioperative management instructions regarding angiotensin II receptor antagonist containing product were provided by the surgical team."} ;; "explicit instructions provided to the patient by the surgical team regarding the perioperative management of angiotensin receptor blocker medication"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable for perioperative care management
(assert
(! (=> patient_has_undergone_perioperative_care_management_now@@explicit_instructions_provided_by_surgical_team_to_patient
      patient_has_undergone_perioperative_care_management_now)
:named REQ0_AUXILIARY0)) ;; "explicit instructions provided to the patient by the surgical team regarding the perioperative management"

;; Qualifier variable implies stem variable for ACE inhibitor
(assert
(! (=> patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now@@perioperative_management_instructions_provided_by_surgical_team
      patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now)
:named REQ0_AUXILIARY1)) ;; "explicit instructions provided to the patient by the surgical team regarding the perioperative management of angiotensin converting enzyme inhibitor medication"

;; Qualifier variable implies stem variable for ARB
(assert
(! (=> patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now@@perioperative_management_instructions_provided_by_surgical_team
      patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now)
:named REQ0_AUXILIARY2)) ;; "explicit instructions provided to the patient by the surgical team regarding the perioperative management of angiotensin receptor blocker medication"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion if explicit instructions provided regarding perioperative management of ACE inhibitor
(assert
(! (not patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now@@perioperative_management_instructions_provided_by_surgical_team)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "explicit instructions provided to the patient by the surgical team regarding the perioperative management of angiotensin converting enzyme inhibitor medication"

;; Exclusion if explicit instructions provided regarding perioperative management of ARB
(assert
(! (not patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now@@perioperative_management_instructions_provided_by_surgical_team)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "explicit instructions provided to the patient by the surgical team regarding the perioperative management of angiotensin receptor blocker medication"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a hypertensive disorder."} ;; "hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@present_in_pre_operative_assessment_clinic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertensive disorder is present in the pre-operative assessment clinic.","when_to_set_to_false":"Set to false if the patient's hypertensive disorder is not present in the pre-operative assessment clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypertensive disorder is present in the pre-operative assessment clinic.","meaning":"Boolean indicating whether the patient's hypertensive disorder is present in the pre-operative assessment clinic."} ;; "significant hypertension in the pre-operative assessment clinic"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a systolic blood pressure measurement in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@present_in_pre_operative_assessment_clinic Real) ;; {"when_to_set_to_value":"Set to the measured value if a systolic blood pressure measurement in millimeters of mercury is recorded now in the pre-operative assessment clinic.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury measured in the pre-operative assessment clinic."} ;; "systolic blood pressure in the pre-operative assessment clinic"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a diastolic blood pressure measurement in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in millimeters of mercury."} ;; "diastolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@present_in_pre_operative_assessment_clinic Real) ;; {"when_to_set_to_value":"Set to the measured value if a diastolic blood pressure measurement in millimeters of mercury is recorded now in the pre-operative assessment clinic.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in millimeters of mercury measured in the pre-operative assessment clinic."} ;; "diastolic blood pressure in the pre-operative assessment clinic"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: significant hypertension in the pre-operative assessment clinic is defined as (systolic BP ≥ 180 mmHg) OR (diastolic BP ≥ 110 mmHg)
(assert
(! (= patient_has_finding_of_hypertensive_disorder_now@@present_in_pre_operative_assessment_clinic
     (or (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@present_in_pre_operative_assessment_clinic 180)
         (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@present_in_pre_operative_assessment_clinic 110)))
:named REQ1_AUXILIARY0)) ;; "defined as (systolic blood pressure ≥ 180 millimeters of mercury) OR (diastolic blood pressure ≥ 110 millimeters of mercury)"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_hypertensive_disorder_now@@present_in_pre_operative_assessment_clinic
       patient_has_finding_of_hypertensive_disorder_now)
:named REQ1_AUXILIARY1)) ;; "hypertensive disorder present in pre-operative assessment clinic implies hypertensive disorder"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hypertensive_disorder_now@@present_in_pre_operative_assessment_clinic)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant hypertension in the pre-operative assessment clinic, defined as systolic blood pressure ≥ 180 millimeters of mercury or diastolic blood pressure ≥ 110 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypotension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypotension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypotension.","meaning":"Boolean indicating whether the patient currently has hypotension."} ;; "hypotension"
(declare-const patient_has_finding_of_low_blood_pressure_now@@present_in_pre_operative_assessment_clinic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypotension is present in the pre-operative assessment clinic.","when_to_set_to_false":"Set to false if the patient's hypotension is not present in the pre-operative assessment clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypotension is present in the pre-operative assessment clinic.","meaning":"Boolean indicating whether the patient's hypotension is present in the pre-operative assessment clinic."} ;; "significant hypotension in the pre-operative assessment clinic"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@present_in_pre_operative_assessment_clinic Real) ;; {"when_to_set_to_value":"Set to the measured value if a systolic blood pressure measurement in millimeters of mercury is recorded now in the pre-operative assessment clinic.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury measured in the pre-operative assessment clinic."} ;; "systolic blood pressure in the pre-operative assessment clinic"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: significant hypotension in the pre-operative assessment clinic is defined as systolic blood pressure < 90 millimeters of mercury
(assert
(! (= patient_has_finding_of_low_blood_pressure_now@@present_in_pre_operative_assessment_clinic
     (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@present_in_pre_operative_assessment_clinic 90))
:named REQ2_AUXILIARY0)) ;; "significant hypotension in the pre-operative assessment clinic, defined as systolic blood pressure < 90 millimeters of mercury."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_low_blood_pressure_now@@present_in_pre_operative_assessment_clinic
      patient_has_finding_of_low_blood_pressure_now)
:named REQ2_AUXILIARY1)) ;; "hypotension present in pre-operative assessment clinic implies hypotension"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_low_blood_pressure_now@@present_in_pre_operative_assessment_clinic)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant hypotension in the pre-operative assessment clinic, defined as systolic blood pressure < 90 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_enrollment_in_clinical_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone enrollment in a clinical trial at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone enrollment in a clinical trial at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone enrollment in a clinical trial at any time in the past.","meaning":"Boolean indicating whether the patient has ever undergone enrollment in a clinical trial at any time in the past."} ;; "prior enrollment in the study"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_enrollment_in_clinical_trial_inthehistory)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior enrollment in the study."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any hypotensive agent (antihypertensive medication).","when_to_set_to_false":"Set to false if the patient is currently not exposed to any hypotensive agent (antihypertensive medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any hypotensive agent (antihypertensive medication).","meaning":"Boolean indicating whether the patient is currently exposed to any hypotensive agent (antihypertensive medication)."} ;; "antihypertensive medication"
(declare-const patient_is_participating_in_other_research_study_of_antihypertensive_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in another research study of antihypertensive medication.","when_to_set_to_false":"Set to false if the patient is currently not participating in another research study of antihypertensive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another research study of antihypertensive medication.","meaning":"Boolean indicating whether the patient is currently participating in another research study involving antihypertensive medication."} ;; "participating in another research study of antihypertensive medication"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_participating_in_other_research_study_of_antihypertensive_medication_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is participating in another research study of antihypertensive medication."
