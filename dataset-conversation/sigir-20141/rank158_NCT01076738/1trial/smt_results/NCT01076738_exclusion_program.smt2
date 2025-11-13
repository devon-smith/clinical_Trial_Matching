;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of peripheral arterial occlusive disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of peripheral arterial occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient has a finding of peripheral arterial occlusive disease at any time in their history."} ;; "peripheral arterial disease"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@previously_known Bool) ;; {"when_to_set_to_true":"Set to true if the finding of peripheral arterial occlusive disease in the patient's history is previously known (documented/recognized by clinicians).","when_to_set_to_false":"Set to false if the finding is not previously known (not documented/recognized).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the finding is previously known.","meaning":"Boolean indicating whether the finding of peripheral arterial occlusive disease in the patient's history is previously known."} ;; "previously known"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the finding of peripheral arterial occlusive disease in the patient's history was symptomatic (presented with symptoms).","when_to_set_to_false":"Set to false if the finding was asymptomatic (no symptoms).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the finding was symptomatic.","meaning":"Boolean indicating whether the finding of peripheral arterial occlusive disease in the patient's history was symptomatic."} ;; "symptomatic"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@asymptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the finding of peripheral arterial occlusive disease in the patient's history was asymptomatic (no symptoms).","when_to_set_to_false":"Set to false if the finding was symptomatic (presented with symptoms).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the finding was asymptomatic.","meaning":"Boolean indicating whether the finding of peripheral arterial occlusive disease in the patient's history was asymptomatic."} ;; "asymptomatic"
(declare-const patient_has_undergone_non_invasive_study_of_peripheral_vessel_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a non-invasive study of peripheral vessel at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone such a procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a non-invasive study of peripheral vessel in their history.","meaning":"Boolean indicating whether the patient has undergone a non-invasive study of peripheral vessel at any time in their history."} ;; "non-invasive vascular diagnostic tool"
(declare-const patient_has_undergone_invasive_vascular_diagnostic_tool_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an invasive vascular diagnostic tool at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone an invasive vascular diagnostic tool at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an invasive vascular diagnostic tool in their history.","meaning":"Boolean indicating whether the patient has undergone an invasive vascular diagnostic tool at any time in their history."} ;; "invasive vascular diagnostic tool"
(declare-const patient_has_undergone_previous_related_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a previous related intervention (such as angioplasty, stenting, atherectomy, peripheral arterial bypass graft, or other vascular intervention including amputation) at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone any such intervention at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a previous related intervention in their history.","meaning":"Boolean indicating whether the patient has undergone a previous related intervention (such as angioplasty, stenting, atherectomy, peripheral arterial bypass graft, or other vascular intervention including amputation) at any time in their history."} ;; "previous related intervention"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@previously_known
      patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory)
    :named REQ0_AUXILIARY0)) ;; "previously known symptomatic/asymptomatic peripheral arterial disease"

(assert
(! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@symptomatic
      patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory)
    :named REQ0_AUXILIARY1)) ;; "symptomatic peripheral arterial disease"

(assert
(! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@asymptomatic
      patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory)
    :named REQ0_AUXILIARY2)) ;; "asymptomatic peripheral arterial disease"

;; Non-exhaustive examples: diagnostic tools/interventions imply umbrella categories
(assert
(! (=> patient_has_undergone_non_invasive_study_of_peripheral_vessel_inthehistory
      patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@asymptomatic)
    :named REQ0_AUXILIARY3)) ;; "non-invasive vascular diagnostic tool with non-exhaustive examples"

(assert
(! (=> patient_has_undergone_invasive_vascular_diagnostic_tool_inthehistory
      patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@asymptomatic)
    :named REQ0_AUXILIARY4)) ;; "invasive vascular diagnostic tool with non-exhaustive examples"

(assert
(! (=> patient_has_undergone_previous_related_intervention_inthehistory
      patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@asymptomatic)
    :named REQ0_AUXILIARY5)) ;; "previous related intervention with non-exhaustive examples"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: previously known symptomatic peripheral arterial disease
(assert
(! (not (and patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@previously_known
             patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@symptomatic))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously known symptomatic peripheral arterial disease."

;; Exclusion: previously known asymptomatic peripheral arterial disease confirmed by at least one diagnostic method/intervention
(assert
(! (not (and patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@previously_known
             patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@asymptomatic
             (or patient_has_undergone_non_invasive_study_of_peripheral_vessel_inthehistory
                 patient_has_undergone_invasive_vascular_diagnostic_tool_inthehistory
                 patient_has_undergone_previous_related_intervention_inthehistory)))
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously known asymptomatic peripheral arterial disease confirmed by at least one of the following diagnostic methods or interventions (documented in the patient's medical record)..."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patients_ankle_brachial_pressure_index_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ankle-brachial pressure index measurement is normal and can be measured accurately now.","when_to_set_to_false":"Set to false if the patient's ankle-brachial pressure index measurement is not normal or cannot be measured accurately now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ankle-brachial pressure index measurement is normal and can be measured accurately now.","meaning":"Boolean indicating whether the patient's ankle-brachial pressure index measurement is normal and can be measured accurately now."} ;; "ankle-brachial index"
(declare-const patients_ankle_brachial_pressure_index_is_normal_now@@cannot_be_measured_accurately Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ankle-brachial pressure index cannot be measured accurately now.","when_to_set_to_false":"Set to false if the patient's ankle-brachial pressure index can be measured accurately now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ankle-brachial pressure index can be measured accurately now.","meaning":"Boolean indicating whether the patient's ankle-brachial pressure index cannot be measured accurately now."} ;; "ankle-brachial index cannot be measured accurately"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patients_ankle_brachial_pressure_index_is_normal_now@@cannot_be_measured_accurately
     patients_ankle_brachial_pressure_index_is_normal_now)
:named REQ1_AUXILIARY0)) ;; "ankle-brachial index cannot be measured accurately"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patients_ankle_brachial_pressure_index_is_normal_now@@cannot_be_measured_accurately)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's ankle-brachial index cannot be measured accurately."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in or actively participating in a clinical trial.","when_to_set_to_false":"Set to false if the patient is not currently enrolled in or actively participating in a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in a clinical trial.","meaning":"Boolean indicating whether the patient is currently enrolled in a clinical trial."} ;; "the patient is already in a clinical trial"
(declare-const patient_is_already_in_product_registry_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is already enrolled in a product registry at the time of assessment.","when_to_set_to_false":"Set to false if the patient is not already enrolled in a product registry at the time of assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is already enrolled in a product registry at the time of assessment.","meaning":"Boolean indicating whether the patient is already enrolled in a product registry at the time of assessment."} ;; "the patient is already in a product registry"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_undergoing_clinical_trial_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is already in a clinical trial."

(assert
(! (not patient_is_already_in_product_registry_now)
:named REQ2_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is already in a product registry."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_inpatient_stay_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized (i.e., undergoing an inpatient stay at the present time).","when_to_set_to_false":"Set to false if the patient is currently not hospitalized (i.e., not undergoing an inpatient stay at the present time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized (undergoing an inpatient stay)."} ;; "hospitalized"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_inpatient_stay_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is hospitalized."
