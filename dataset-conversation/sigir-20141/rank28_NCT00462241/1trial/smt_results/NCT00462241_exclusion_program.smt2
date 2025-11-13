;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "acute coronary syndrome"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_acute_coronary_syndrome_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute coronary syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention in the past."} ;; "percutaneous coronary intervention"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass grafting at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass grafting in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass grafting in the past."} ;; "coronary artery bypass grafting"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had percutaneous coronary intervention."

(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had coronary artery bypass grafting."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pulmonary_embolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has a finding of pulmonary embolism."} ;; "pulmonary embolism"
(declare-const patient_has_finding_of_pulmonary_embolism_now@@verified_clinically_during_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary embolism finding is verified clinically during admission.","when_to_set_to_false":"Set to false if the patient's pulmonary embolism finding is not verified clinically during admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary embolism finding is verified clinically during admission.","meaning":"Boolean indicating whether the patient's pulmonary embolism finding is verified clinically during admission."} ;; "pulmonary embolism verified clinically during admission"
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has a finding of pneumonia."} ;; "pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@verified_clinically_during_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pneumonia finding is verified clinically during admission.","when_to_set_to_false":"Set to false if the patient's pneumonia finding is not verified clinically during admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia finding is verified clinically during admission.","meaning":"Boolean indicating whether the patient's pneumonia finding is verified clinically during admission."} ;; "pneumonia verified clinically during admission"
(declare-const patient_has_finding_of_dissection_of_aorta_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of dissection of the aorta.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of dissection of the aorta.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of dissection of the aorta.","meaning":"Boolean indicating whether the patient currently has a finding of dissection of the aorta."} ;; "dissection of the aorta"
(declare-const patient_has_finding_of_dissection_of_aorta_now@@verified_clinically_during_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dissection of the aorta finding is verified clinically during admission.","when_to_set_to_false":"Set to false if the patient's dissection of the aorta finding is not verified clinically during admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dissection of the aorta finding is verified clinically during admission.","meaning":"Boolean indicating whether the patient's dissection of the aorta finding is verified clinically during admission."} ;; "dissection of the aorta verified clinically during admission"
(declare-const patient_has_condition_likely_to_result_in_episode_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a condition that is likely to result in an episode of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have a condition likely to result in an episode of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a condition likely to result in an episode of chest pain.","meaning":"Boolean indicating whether the patient currently has a condition likely to result in an episode of chest pain."} ;; "condition that is likely to result in the episode of chest pain"
(declare-const patient_has_condition_likely_to_result_in_episode_of_chest_pain_now@@verified_clinically_during_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's condition likely to result in chest pain is verified clinically during admission.","when_to_set_to_false":"Set to false if the patient's condition likely to result in chest pain is not verified clinically during admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the condition is verified clinically during admission.","meaning":"Boolean indicating whether the patient's condition likely to result in chest pain is verified clinically during admission."} ;; "condition likely to result in chest pain verified clinically during admission"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_pulmonary_embolism_now@@verified_clinically_during_admission
           patient_has_finding_of_pneumonia_now@@verified_clinically_during_admission
           patient_has_finding_of_dissection_of_aorta_now@@verified_clinically_during_admission)
    patient_has_condition_likely_to_result_in_episode_of_chest_pain_now@@verified_clinically_during_admission)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (pulmonary embolism, pneumonia, dissection of the aorta)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_pulmonary_embolism_now@@verified_clinically_during_admission
       patient_has_finding_of_pulmonary_embolism_now)
:named REQ2_AUXILIARY1)) ;; "pulmonary embolism verified clinically during admission"

(assert
(! (=> patient_has_finding_of_pneumonia_now@@verified_clinically_during_admission
       patient_has_finding_of_pneumonia_now)
:named REQ2_AUXILIARY2)) ;; "pneumonia verified clinically during admission"

(assert
(! (=> patient_has_finding_of_dissection_of_aorta_now@@verified_clinically_during_admission
       patient_has_finding_of_dissection_of_aorta_now)
:named REQ2_AUXILIARY3)) ;; "dissection of the aorta verified clinically during admission"

;; Qualifier variable for umbrella implies stem variable
(assert
(! (=> patient_has_condition_likely_to_result_in_episode_of_chest_pain_now@@verified_clinically_during_admission
       patient_has_condition_likely_to_result_in_episode_of_chest_pain_now)
:named REQ2_AUXILIARY4)) ;; "condition likely to result in chest pain verified clinically during admission"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_condition_likely_to_result_in_episode_of_chest_pain_now@@verified_clinically_during_admission)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a condition that is likely to result in the episode of chest pain, and the condition is verified clinically during admission with non-exhaustive examples (pulmonary embolism, pneumonia, dissection of the aorta)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_arthropathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of arthropathy (inflammatory joint disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of arthropathy (inflammatory joint disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of arthropathy (inflammatory joint disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of arthropathy (inflammatory joint disease)."} ;; "inflammatory joint disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_arthropathy_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inflammatory joint disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of type 1 diabetes mellitus (insulin dependent diabetes mellitus).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of type 1 diabetes mellitus (insulin dependent diabetes mellitus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has type 1 diabetes mellitus (insulin dependent diabetes mellitus).","meaning":"Boolean indicating whether the patient currently has type 1 diabetes mellitus (insulin dependent diabetes mellitus)."} ;; "insulin dependent diabetes mellitus"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_type_1_diabetes_mellitus_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has insulin dependent diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_fibromyalgia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of fibromyalgia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of fibromyalgia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of fibromyalgia.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of fibromyalgia."} ;; "fibromyalgia"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_fibromyalgia_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fibromyalgia."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease."} ;; "malignant disease"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant disease."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_apoplexy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has apoplexy.","when_to_set_to_false":"Set to false if the patient currently does not have apoplexy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has apoplexy.","meaning":"Boolean indicating whether the patient currently has apoplexy."} ;; "the patient has apoplexy"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "the patient has dementia"
(declare-const patient_is_unable_to_cooperate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to cooperate.","when_to_set_to_false":"Set to false if the patient is currently able to cooperate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to cooperate.","meaning":"Boolean indicating whether the patient is currently unable to cooperate."} ;; "the patient is unable to cooperate"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_apoplexy_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has apoplexy."

(assert
  (! (not patient_has_finding_of_dementia_now)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia."

(assert
  (! (not patient_is_unable_to_cooperate_now)
     :named REQ7_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to cooperate."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_major_osseous_anomaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a major osseous anomaly.","when_to_set_to_false":"Set to false if the patient currently does not have a major osseous anomaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a major osseous anomaly.","meaning":"Boolean indicating whether the patient currently has a major osseous anomaly."} ;; "The patient is excluded if the patient has a major osseous anomaly."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_finding_of_major_osseous_anomaly_now)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a major osseous anomaly."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_osteoporosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of osteoporosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of osteoporosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has osteoporosis.","meaning":"Boolean indicating whether the patient currently has osteoporosis now."} ;; "osteoporosis"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_osteoporosis_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has osteoporosis."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_wants_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient wants to participate in the study.","when_to_set_to_false":"Set to false if the patient does not want to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient wants to participate in the study.","meaning":"Boolean indicating whether the patient wants to participate in the study."} ;; "the patient does NOT want to participate"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (not patient_wants_to_participate))
:named REQ11_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does NOT want to participate."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_other_reason_for_non_inclusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another reason for non-inclusion (exclusion) that is documented or registered.","when_to_set_to_false":"Set to false if the patient currently does not have any other reason for non-inclusion (exclusion) documented or registered.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another reason for non-inclusion (exclusion).","meaning":"Boolean indicating whether the patient currently has another reason for non-inclusion (exclusion from the study or trial), regardless of specific reason."} ;; "The patient is excluded if the patient has another reason for non-inclusion (the reason will be registered)."

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_other_reason_for_non_inclusion_now)
:named REQ12_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has another reason for non-inclusion (the reason will be registered)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain.","when_to_set_to_false":"Set to false if the patient currently does not have pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain.","meaning":"Boolean indicating whether the patient currently has pain."} ;; "pain"

(declare-const patient_has_finding_of_pain_now@@not_related_to_joints_of_neck Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pain is NOT related to the joints of the neck.","when_to_set_to_false":"Set to false if the patient's current pain is related to the joints of the neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pain is related to the joints of the neck.","meaning":"Boolean indicating whether the patient's current pain is NOT related to the joints of the neck."} ;; "pain NOT related to the joints of the neck"

(declare-const patient_has_finding_of_pain_now@@not_related_to_joints_of_thorax Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pain is NOT related to the joints of the thorax.","when_to_set_to_false":"Set to false if the patient's current pain is related to the joints of the thorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pain is related to the joints of the thorax.","meaning":"Boolean indicating whether the patient's current pain is NOT related to the joints of the thorax."} ;; "pain NOT related to the joints of the thorax"

(declare-const patient_has_finding_of_pain_now@@not_related_to_muscles_of_neck Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pain is NOT related to the muscles of the neck.","when_to_set_to_false":"Set to false if the patient's current pain is related to the muscles of the neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pain is related to the muscles of the neck.","meaning":"Boolean indicating whether the patient's current pain is NOT related to the muscles of the neck."} ;; "pain NOT related to the muscles of the neck"

(declare-const patient_has_finding_of_pain_now@@not_related_to_muscles_of_thorax Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pain is NOT related to the muscles of the thorax.","when_to_set_to_false":"Set to false if the patient's current pain is related to the muscles of the thorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pain is related to the muscles of the thorax.","meaning":"Boolean indicating whether the patient's current pain is NOT related to the muscles of the thorax."} ;; "pain NOT related to the muscles of the thorax"

(declare-const patient_has_undergone_ct_angiography_now_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone computed tomography angiography now and the outcome is negative.","when_to_set_to_false":"Set to false if the patient has undergone computed tomography angiography now and the outcome is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone computed tomography angiography now and the outcome is negative.","meaning":"Boolean indicating whether the patient has undergone computed tomography angiography now and the outcome is negative."} ;; "computed tomography angiography negative"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_pain_now@@not_related_to_joints_of_neck
      patient_has_finding_of_pain_now)
:named REQ13_AUXILIARY0)) ;; "pain NOT related to the joints of the neck"

(assert
(! (=> patient_has_finding_of_pain_now@@not_related_to_joints_of_thorax
      patient_has_finding_of_pain_now)
:named REQ13_AUXILIARY1)) ;; "pain NOT related to the joints of the thorax"

(assert
(! (=> patient_has_finding_of_pain_now@@not_related_to_muscles_of_neck
      patient_has_finding_of_pain_now)
:named REQ13_AUXILIARY2)) ;; "pain NOT related to the muscles of the neck"

(assert
(! (=> patient_has_finding_of_pain_now@@not_related_to_muscles_of_thorax
      patient_has_finding_of_pain_now)
:named REQ13_AUXILIARY3)) ;; "pain NOT related to the muscles of the thorax"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (and patient_has_undergone_ct_angiography_now_outcome_is_negative
             (or patient_has_finding_of_pain_now@@not_related_to_joints_of_neck
                 patient_has_finding_of_pain_now@@not_related_to_joints_of_thorax
                 patient_has_finding_of_pain_now@@not_related_to_muscles_of_neck
                 patient_has_finding_of_pain_now@@not_related_to_muscles_of_thorax)))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pain NOT related to the joints of the neck OR pain NOT related to the joints of the thorax OR pain NOT related to the muscles of the neck OR pain NOT related to the muscles of the thorax (computed tomography angiography negative)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_new_incidence_of_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a new incidence of any of the above mentioned conditions.","when_to_set_to_false":"Set to false if the patient currently does not have a new incidence of any of the above mentioned conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a new incidence of any of the above mentioned conditions.","meaning":"Boolean indicating whether the patient currently has a new incidence of any of the above mentioned conditions."} ;; "has a new incidence of any of the above mentioned conditions"
(declare-const patient_has_new_incidence_of_condition_now@@new_incidence Bool) ;; {"when_to_set_to_true":"Set to true if the condition is a new incidence.","when_to_set_to_false":"Set to false if the condition is not a new incidence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the condition is a new incidence.","meaning":"Boolean indicating whether the condition is a new incidence."} ;; "new incidence" qualifier for conditions
(declare-const patient_has_new_incidence_of_pathology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a new incidence of any of the above mentioned pathologies.","when_to_set_to_false":"Set to false if the patient currently does not have a new incidence of any of the above mentioned pathologies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a new incidence of any of the above mentioned pathologies.","meaning":"Boolean indicating whether the patient currently has a new incidence of any of the above mentioned pathologies."} ;; "has a new incidence of any of the above mentioned pathologies"
(declare-const patient_has_new_incidence_of_pathology_now@@new_incidence Bool) ;; {"when_to_set_to_true":"Set to true if the pathology is a new incidence.","when_to_set_to_false":"Set to false if the pathology is not a new incidence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pathology is a new incidence.","meaning":"Boolean indicating whether the pathology is a new incidence."} ;; "new incidence" qualifier for pathologies

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable for conditions
(assert
(! (=> patient_has_new_incidence_of_condition_now@@new_incidence
       patient_has_new_incidence_of_condition_now)
   :named REQ14_AUXILIARY0)) ;; "new incidence" qualifier for conditions

;; Qualifier variable implies corresponding stem variable for pathologies
(assert
(! (=> patient_has_new_incidence_of_pathology_now@@new_incidence
       patient_has_new_incidence_of_pathology_now)
   :named REQ14_AUXILIARY1)) ;; "new incidence" qualifier for pathologies

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT have a new incidence of any of the above mentioned conditions
(assert
(! (not patient_has_new_incidence_of_condition_now)
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a new incidence of any of the above mentioned conditions."

;; Exclusion: patient must NOT have a new incidence of any of the above mentioned pathologies
(assert
(! (not patient_has_new_incidence_of_pathology_now)
   :named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a new incidence of any of the above mentioned pathologies."
