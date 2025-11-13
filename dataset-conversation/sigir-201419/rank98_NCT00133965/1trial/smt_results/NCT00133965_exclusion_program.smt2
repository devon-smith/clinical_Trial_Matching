;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder (psychiatric disturbance).","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder (psychiatric disturbance).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder (psychiatric disturbance).","meaning":"Boolean indicating whether the patient currently has a mental disorder (psychiatric disturbance)."} ;; "psychiatric disturbance"

(declare-const patient_has_finding_of_mental_disorder_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current mental disorder is significant.","when_to_set_to_false":"Set to false if the patient's current mental disorder is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current mental disorder is significant.","meaning":"Boolean indicating whether the patient's current mental disorder is significant."} ;; "significant psychiatric disturbance"

(declare-const patient_has_finding_of_mental_disorder_now@@sufficient_to_preclude_participation_in_psychotherapeutic_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current mental disorder is sufficient to preclude participation in a psychotherapeutic intervention.","when_to_set_to_false":"Set to false if the patient's current mental disorder is not sufficient to preclude participation in a psychotherapeutic intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current mental disorder is sufficient to preclude participation in a psychotherapeutic intervention.","meaning":"Boolean indicating whether the patient's current mental disorder is sufficient to preclude participation in a psychotherapeutic intervention."} ;; "sufficient to preclude participation in a psychotherapeutic intervention"

(declare-const patient_has_finding_of_psychiatric_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychiatric symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have psychiatric symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychiatric symptoms.","meaning":"Boolean indicating whether the patient currently has psychiatric symptoms."} ;; "psychiatric symptoms"

(declare-const patient_has_finding_of_psychiatric_symptom_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychiatric symptoms are acute.","when_to_set_to_false":"Set to false if the patient's current psychiatric symptoms are not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychiatric symptoms are acute.","meaning":"Boolean indicating whether the patient's current psychiatric symptoms are acute."} ;; "acute psychiatric symptoms"

(declare-const patient_has_finding_of_psychiatric_symptom_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychiatric symptoms are severe.","when_to_set_to_false":"Set to false if the patient's current psychiatric symptoms are not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychiatric symptoms are severe.","meaning":"Boolean indicating whether the patient's current psychiatric symptoms are severe."} ;; "severe psychiatric symptoms"

(declare-const patient_has_finding_of_psychiatric_symptom_now@@would_require_individual_treatment_and_medication_management_rather_than_psychotherapy_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychiatric symptoms would require individual treatment and medication management rather than a psychotherapy intervention.","when_to_set_to_false":"Set to false if the patient's current psychiatric symptoms would not require individual treatment and medication management rather than a psychotherapy intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychiatric symptoms would require individual treatment and medication management rather than a psychotherapy intervention.","meaning":"Boolean indicating whether the patient's current psychiatric symptoms would require individual treatment and medication management rather than a psychotherapy intervention."} ;; "severe psychiatric symptoms which would require individual treatment and medication management rather than a psychotherapy intervention"

(declare-const patient_is_undergoing_management_of_drug_regimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing management of drug regimen (medication management).","when_to_set_to_false":"Set to false if the patient is currently not undergoing management of drug regimen (medication management).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing management of drug regimen (medication management).","meaning":"Boolean indicating whether the patient is currently undergoing management of drug regimen (medication management)."} ;; "medication management"

(declare-const patient_is_undergoing_management_of_drug_regimen_now@@required_rather_than_psychotherapy_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medication management is required rather than a psychotherapy intervention.","when_to_set_to_false":"Set to false if the patient's current medication management is not required rather than a psychotherapy intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medication management is required rather than a psychotherapy intervention.","meaning":"Boolean indicating whether the patient's current medication management is required rather than a psychotherapy intervention."} ;; "medication management ... required rather than a psychotherapy intervention"

(declare-const patient_is_undergoing_psychotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing psychotherapy intervention.","when_to_set_to_false":"Set to false if the patient is currently not undergoing psychotherapy intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing psychotherapy intervention.","meaning":"Boolean indicating whether the patient is currently undergoing psychotherapy intervention."} ;; "psychotherapy intervention"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_psychiatric_symptom_now@@acute
           (and patient_has_finding_of_psychiatric_symptom_now@@severe
                patient_has_finding_of_psychiatric_symptom_now@@would_require_individual_treatment_and_medication_management_rather_than_psychotherapy_intervention))
       patient_has_finding_of_mental_disorder_now@@significant)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (acute psychiatric symptoms OR severe psychiatric symptoms which would require individual treatment and medication management rather than a psychotherapy intervention)"

;; "significant" and "sufficient to preclude participation in a psychotherapeutic intervention" qualifiers are both required for exclusion
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@significant
       patient_has_finding_of_mental_disorder_now)
:named REQ0_AUXILIARY1)) ;; "significant psychiatric disturbance"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@sufficient_to_preclude_participation_in_psychotherapeutic_intervention
       patient_has_finding_of_mental_disorder_now)
:named REQ0_AUXILIARY2)) ;; "sufficient to preclude participation in a psychotherapeutic intervention"

;; Qualifier variables for psychiatric symptoms imply stem variable
(assert
(! (=> patient_has_finding_of_psychiatric_symptom_now@@acute
       patient_has_finding_of_psychiatric_symptom_now)
:named REQ0_AUXILIARY3)) ;; "acute psychiatric symptoms"

(assert
(! (=> patient_has_finding_of_psychiatric_symptom_now@@severe
       patient_has_finding_of_psychiatric_symptom_now)
:named REQ0_AUXILIARY4)) ;; "severe psychiatric symptoms"

(assert
(! (=> patient_has_finding_of_psychiatric_symptom_now@@would_require_individual_treatment_and_medication_management_rather_than_psychotherapy_intervention
       patient_has_finding_of_psychiatric_symptom_now)
:named REQ0_AUXILIARY5)) ;; "would require individual treatment and medication management rather than a psychotherapy intervention"

;; Medication management qualifier implies stem variable
(assert
(! (=> patient_is_undergoing_management_of_drug_regimen_now@@required_rather_than_psychotherapy_intervention
       patient_is_undergoing_management_of_drug_regimen_now)
:named REQ0_AUXILIARY6)) ;; "medication management ... required rather than a psychotherapy intervention"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have a significant psychiatric disturbance sufficient to preclude participation in a psychotherapeutic intervention
(assert
(! (not (and patient_has_finding_of_mental_disorder_now@@significant
             patient_has_finding_of_mental_disorder_now@@sufficient_to_preclude_participation_in_psychotherapeutic_intervention))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant psychiatric disturbance sufficient to preclude participation in a psychotherapeutic intervention with non-exhaustive examples (acute psychiatric symptoms OR severe psychiatric symptoms which would require individual treatment and medication management rather than a psychotherapy intervention)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_psychotic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of psychotic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of psychotic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of psychotic disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of psychotic disorder."} ;; "psychotic mental disorder"
(declare-const patient_has_diagnosis_of_psychotic_disorder_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of psychotic disorder is active.","when_to_set_to_false":"Set to false if the patient's current diagnosis of psychotic disorder is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychotic disorder is active.","meaning":"Boolean indicating whether the patient's current diagnosis of psychotic disorder is active."} ;; "active psychotic mental disorder"
(declare-const patient_has_diagnosis_of_schizophrenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of schizophrenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of schizophrenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of schizophrenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of schizophrenia."} ;; "schizophrenia"
(declare-const patient_has_diagnosis_of_mania_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mania.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mania.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mania.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mania."} ;; "mania"
(declare-const patient_has_diagnosis_of_mania_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of mania is acute.","when_to_set_to_false":"Set to false if the patient's current diagnosis of mania is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mania is acute.","meaning":"Boolean indicating whether the patient's current diagnosis of mania is acute."} ;; "acute mania"
(declare-const patient_has_finding_of_paranoid_ideation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of paranoid ideation.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of paranoid ideation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of paranoid ideation.","meaning":"Boolean indicating whether the patient currently has a finding of paranoid ideation."} ;; "paranoid ideation"
(declare-const patient_has_finding_of_paranoid_ideation_now@@marked Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current finding of paranoid ideation is marked.","when_to_set_to_false":"Set to false if the patient's current finding of paranoid ideation is not marked.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the paranoid ideation is marked.","meaning":"Boolean indicating whether the patient's current finding of paranoid ideation is marked."} ;; "marked paranoid ideation"
(declare-const patient_is_exposed_to_psychotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to psychotropic agents.","when_to_set_to_false":"Set to false if the patient is currently not exposed to psychotropic agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to psychotropic agents.","meaning":"Boolean indicating whether the patient is currently exposed to psychotropic agents."} ;; "psychotropic medications"
(declare-const patient_is_exposed_to_psychotropic_agent_now@@on_stable_regimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to psychotropic agents is on a stable regimen.","when_to_set_to_false":"Set to false if the patient's current exposure to psychotropic agents is not on a stable regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the regimen is stable.","meaning":"Boolean indicating whether the patient's current exposure to psychotropic agents is on a stable regimen."} ;; "on stable regimens of psychotropic medications"
(declare-const patient_is_exposed_to_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antidepressants.","when_to_set_to_false":"Set to false if the patient is currently not exposed to antidepressants.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antidepressants.","meaning":"Boolean indicating whether the patient is currently exposed to antidepressants."} ;; "antidepressants"
(declare-const patient_is_exposed_to_antidepressant_now@@used_for_clinical_depression Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to antidepressants is for clinical depression.","when_to_set_to_false":"Set to false if the patient's current exposure to antidepressants is not for clinical depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antidepressants are used for clinical depression.","meaning":"Boolean indicating whether the patient's current exposure to antidepressants is for clinical depression."} ;; "antidepressants for clinical depression"
(declare-const patient_is_undergoing_group_psychotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing group psychotherapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing group psychotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing group psychotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing group psychotherapy."} ;; "group psychotherapy"
(declare-const patient_is_undergoing_group_psychotherapy_now@@concurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current group psychotherapy is concurrent.","when_to_set_to_false":"Set to false if the patient's current group psychotherapy is not concurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the group psychotherapy is concurrent.","meaning":"Boolean indicating whether the patient's current group psychotherapy is concurrent."} ;; "concurrent group psychotherapy"
(declare-const patient_is_undergoing_individual_psychotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing individual psychotherapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing individual psychotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing individual psychotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing individual psychotherapy."} ;; "individual psychotherapy"
(declare-const patient_is_undergoing_individual_psychotherapy_now@@concurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current individual psychotherapy is concurrent.","when_to_set_to_false":"Set to false if the patient's current individual psychotherapy is not concurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the individual psychotherapy is concurrent.","meaning":"Boolean indicating whether the patient's current individual psychotherapy is concurrent."} ;; "concurrent individual psychotherapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term for active psychotic mental disorder
(assert
(! (=> (or patient_has_diagnosis_of_schizophrenia_now
          patient_has_diagnosis_of_mania_now@@acute)
       patient_has_diagnosis_of_psychotic_disorder_now@@active)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (schizophrenia OR acute mania)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_psychotic_disorder_now@@active
       patient_has_diagnosis_of_psychotic_disorder_now)
:named REQ1_AUXILIARY1)) ;; "active psychotic mental disorder"

(assert
(! (=> patient_has_diagnosis_of_mania_now@@acute
       patient_has_diagnosis_of_mania_now)
:named REQ1_AUXILIARY2)) ;; "acute mania"

(assert
(! (=> patient_has_finding_of_paranoid_ideation_now@@marked
       patient_has_finding_of_paranoid_ideation_now)
:named REQ1_AUXILIARY3)) ;; "marked paranoid ideation"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have an active psychotic mental disorder, unless on stable psychotropic regimen or in concurrent psychotherapy
(assert
(! (not
      (and patient_has_diagnosis_of_psychotic_disorder_now@@active
           (not (or patient_is_exposed_to_psychotropic_agent_now@@on_stable_regimen
                    patient_is_exposed_to_antidepressant_now@@used_for_clinical_depression
                    patient_is_undergoing_group_psychotherapy_now@@concurrent
                    patient_is_undergoing_individual_psychotherapy_now@@concurrent)))
   )
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an active psychotic mental disorder (with non-exhaustive examples (schizophrenia OR acute mania)). Patients who are on stable regimens of psychotropic medications (for example, antidepressants for clinical depression) or who are in concurrent individual psychotherapy or group psychotherapy will NOT be excluded."

;; Exclusion: patient must NOT have marked paranoid ideation
(assert
(! (not patient_has_finding_of_paranoid_ideation_now@@marked)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has marked paranoid ideation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has delirium.","when_to_set_to_false":"Set to false if the patient currently does not have delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has delirium.","meaning":"Boolean indicating whether the patient currently has delirium."} ;; "delirium"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia.","when_to_set_to_false":"Set to false if the patient currently does not have dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impaired cognition (cognitive disturbance).","when_to_set_to_false":"Set to false if the patient currently does not have impaired cognition (cognitive disturbance).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired cognition (cognitive disturbance).","meaning":"Boolean indicating whether the patient currently has impaired cognition (cognitive disturbance)."} ;; "cognitive disturbance"
(declare-const patient_has_finding_of_impaired_cognition_now@@sufficient_to_preclude_participation_in_psychotherapy_or_data_collection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired cognition is sufficient to preclude participation in psychotherapy or data collection.","when_to_set_to_false":"Set to false if the patient's impaired cognition is not sufficient to preclude participation in psychotherapy or data collection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's impaired cognition is sufficient to preclude participation in psychotherapy or data collection.","meaning":"Boolean indicating whether the patient's impaired cognition is sufficient to preclude participation in psychotherapy or data collection."} ;; "sufficient to preclude participation in psychotherapy OR data collection"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_delirium_now
           patient_has_finding_of_dementia_now)
       patient_has_finding_of_impaired_cognition_now)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (delirium OR dementia)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_impaired_cognition_now@@sufficient_to_preclude_participation_in_psychotherapy_or_data_collection
       patient_has_finding_of_impaired_cognition_now)
   :named REQ2_AUXILIARY1)) ;; "sufficient to preclude participation in psychotherapy OR data collection"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_impaired_cognition_now@@sufficient_to_preclude_participation_in_psychotherapy_or_data_collection)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cognitive disturbance with non-exhaustive examples (delirium OR dementia) sufficient to preclude participation in psychotherapy OR data collection."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impairment (physical limitations).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impairment (physical limitations).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of impairment (physical limitations).","meaning":"Boolean indicating whether the patient currently has impairment (physical limitations)."} ;; "physical limitations"
(declare-const patient_has_finding_of_impairment_now@@sufficient_to_preclude_participation_in_psychotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impairment (physical limitations) and the severity is sufficient to preclude participation in psychotherapy.","when_to_set_to_false":"Set to false if the patient currently has impairment (physical limitations) but the severity is not sufficient to preclude participation in psychotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of impairment is sufficient to preclude participation in psychotherapy.","meaning":"Boolean indicating whether the patient's impairment (physical limitations) is sufficient to preclude participation in psychotherapy."} ;; "physical limitations ... sufficient to preclude participation in psychotherapy"
(declare-const patient_has_illness_severity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has illness severity.","when_to_set_to_false":"Set to false if the patient currently does not have illness severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has illness severity.","meaning":"Boolean indicating whether the patient currently has illness severity."} ;; "illness severity"
(declare-const patient_has_illness_severity_now@@sufficient_to_preclude_participation_in_psychotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has illness severity and the severity is sufficient to preclude participation in psychotherapy.","when_to_set_to_false":"Set to false if the patient currently has illness severity but the severity is not sufficient to preclude participation in psychotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of illness is sufficient to preclude participation in psychotherapy.","meaning":"Boolean indicating whether the patient's illness severity is sufficient to preclude participation in psychotherapy."} ;; "illness severity ... sufficient to preclude participation in psychotherapy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_impairment_now@@sufficient_to_preclude_participation_in_psychotherapy
      patient_has_finding_of_impairment_now)
    :named REQ3_AUXILIARY0)) ;; "physical limitations ... sufficient to preclude participation in psychotherapy"

(assert
(! (=> patient_has_illness_severity_now@@sufficient_to_preclude_participation_in_psychotherapy
      patient_has_illness_severity_now)
    :named REQ3_AUXILIARY1)) ;; "illness severity ... sufficient to preclude participation in psychotherapy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_finding_of_impairment_now@@sufficient_to_preclude_participation_in_psychotherapy
            patient_has_illness_severity_now@@sufficient_to_preclude_participation_in_psychotherapy))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has physical limitations OR illness severity sufficient to preclude participation in psychotherapy."
