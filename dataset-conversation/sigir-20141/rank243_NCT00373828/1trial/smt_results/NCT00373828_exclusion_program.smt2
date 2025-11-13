;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "acute coronary syndrome"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_acute_coronary_syndrome_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute coronary syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention at any time in the past (prior to the present assessment).","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention at any time in the past (prior to the present assessment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention at any time in the past.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention at any time in the past (up to the present)."} ;; "percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone percutaneous coronary intervention."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a coronary artery bypass graft procedure at any time prior to the assessment for trial eligibility.","when_to_set_to_false":"Set to false if the patient has never undergone a coronary artery bypass graft procedure prior to the assessment for trial eligibility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a coronary artery bypass graft procedure prior to the assessment for trial eligibility.","meaning":"Boolean indicating whether the patient has ever undergone a coronary artery bypass graft procedure at any time in the past."} ;; "coronary artery bypass grafting"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone coronary artery bypass grafting."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of another disease (distinct from the index condition).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of another disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of another disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of another disease."} ;; "another disease"

(declare-const patient_has_diagnosis_of_disease_now@@diagnosed_during_this_admission Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of another disease was made during this admission.","when_to_set_to_false":"Set to false if the diagnosis of another disease was not made during this admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of another disease was made during this admission.","meaning":"Boolean indicating whether the diagnosis of another disease was made during this admission."} ;; "diagnosed during this admission"

(declare-const patient_has_diagnosis_of_disease_now@@likely_cause_of_acute_episode_of_chest_pain Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosed disease is likely to have caused the acute episode of chest pain.","when_to_set_to_false":"Set to false if the diagnosed disease is not likely to have caused the acute episode of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosed disease is likely to have caused the acute episode of chest pain.","meaning":"Boolean indicating whether the diagnosed disease is likely to have caused the acute episode of chest pain."} ;; "the other disease is likely to have caused the acute episode of chest pain"

(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"

(declare-const patient_has_finding_of_chest_pain_now@@acute_episode Bool) ;; {"when_to_set_to_true":"Set to true if the chest pain is an acute episode.","when_to_set_to_false":"Set to false if the chest pain is not an acute episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest pain is an acute episode.","meaning":"Boolean indicating whether the chest pain is an acute episode."} ;; "acute episode of chest pain"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disease_now@@diagnosed_during_this_admission
      patient_has_diagnosis_of_disease_now)
:named REQ3_AUXILIARY0)) ;; "diagnosed during this admission"

(assert
(! (=> patient_has_diagnosis_of_disease_now@@likely_cause_of_acute_episode_of_chest_pain
      patient_has_diagnosis_of_disease_now)
:named REQ3_AUXILIARY1)) ;; "the other disease is likely to have caused the acute episode of chest pain"

(assert
(! (=> patient_has_finding_of_chest_pain_now@@acute_episode
      patient_has_finding_of_chest_pain_now)
:named REQ3_AUXILIARY2)) ;; "acute episode of chest pain"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have another disease (diagnosed during this admission) AND (the other disease is likely to have caused the acute episode of chest pain)
(assert
(! (not (and patient_has_diagnosis_of_disease_now@@diagnosed_during_this_admission
             patient_has_diagnosis_of_disease_now@@likely_cause_of_acute_episode_of_chest_pain))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another disease (diagnosed during this admission) AND (the other disease is likely to have caused the acute episode of chest pain)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_provided_written_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written consent.","when_to_set_to_false":"Set to false if the patient has not provided written consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written consent.","meaning":"Boolean indicating whether the patient has provided written consent."} ;; "does NOT provide written consent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_provided_written_consent)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does NOT provide written consent."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_arthropathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of arthropathy (inflammatory joint disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of arthropathy (inflammatory joint disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of arthropathy (inflammatory joint disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of arthropathy (inflammatory joint disease)."} ;; "inflammatory joint disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_arthropathy_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inflammatory joint disease."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 1 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 1 diabetes mellitus."} ;; "diabetes mellitus type I"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus type I."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_fibromyalgia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of fibromyalgia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of fibromyalgia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of fibromyalgia.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of fibromyalgia."} ;; "fibromyalgia"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_fibromyalgia_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fibromyalgia."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_chest_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a chest injury (sharp trauma to the chest) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a chest injury (sharp trauma to the chest) at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a chest injury (sharp trauma to the chest).","meaning":"Boolean indicating whether the patient has ever had a chest injury (sharp trauma to the chest) at any time in their medical history."} ;; "has experienced sharp trauma to the chest"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_chest_injury_inthehistory)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has experienced sharp trauma to the chest."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease."} ;; "malignant disease"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant disease."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_apoplexy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has apoplexy.","when_to_set_to_false":"Set to false if the patient currently does not have apoplexy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has apoplexy.","meaning":"Boolean indicating whether the patient currently has apoplexy."} ;; "The patient is excluded if the patient has apoplexy."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_apoplexy_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has apoplexy."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_gross_osseous_anomalies_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gross osseous anomalies.","when_to_set_to_false":"Set to false if the patient currently does not have gross osseous anomalies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gross osseous anomalies.","meaning":"Boolean indicating whether the patient currently has gross osseous anomalies."} ;; "gross osseous anomalies"
(declare-const patient_has_finding_of_pronounced_scoliosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pronounced scoliosis.","when_to_set_to_false":"Set to false if the patient currently does not have pronounced scoliosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pronounced scoliosis.","meaning":"Boolean indicating whether the patient currently has pronounced scoliosis."} ;; "pronounced scoliosis"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive example: pronounced scoliosis is an example of gross osseous anomalies
(assert
(! (=> patient_has_finding_of_pronounced_scoliosis_now
      patient_has_finding_of_gross_osseous_anomalies_now)
:named REQ11_AUXILIARY0)) ;; "with non-exhaustive examples (pronounced scoliosis)"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_gross_osseous_anomalies_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has gross osseous anomalies with non-exhaustive examples (pronounced scoliosis)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_osteoporosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known diagnosis of osteoporosis.","when_to_set_to_false":"Set to false if the patient currently does not have a known diagnosis of osteoporosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known diagnosis of osteoporosis.","meaning":"Boolean indicating whether the patient currently has a known diagnosis of osteoporosis."} ;; "known osteoporosis"
(declare-const patient_has_suspicion_of_osteoporosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have osteoporosis.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have osteoporosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have osteoporosis.","meaning":"Boolean indicating whether the patient is currently suspected to have osteoporosis."} ;; "suspected osteoporosis"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_osteoporosis_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known osteoporosis."

(assert
(! (not patient_has_suspicion_of_osteoporosis_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected osteoporosis."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_is_unable_to_cooperate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to cooperate.","when_to_set_to_false":"Set to false if the patient is currently able to cooperate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to cooperate.","meaning":"Boolean indicating whether the patient is currently unable to cooperate."} ;; "unable to cooperate"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_dementia_now)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia."

(assert
(! (not patient_is_unable_to_cooperate_now)
    :named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to cooperate."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_resides_in_county_of_funen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in the County of Funen.","when_to_set_to_false":"Set to false if the patient currently does not reside in the County of Funen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in the County of Funen.","meaning":"Boolean indicating whether the patient currently resides in the County of Funen."} ;; "reside in the County of Funen"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_resides_in_county_of_funen_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT reside in the County of Funen."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_wants_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses a desire to participate in the study.","when_to_set_to_false":"Set to false if the patient expresses a desire NOT to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient wants to participate in the study.","meaning":"Boolean indicating whether the patient wants to participate in the study."} ;; "does NOT want to participate"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_wants_to_participate)
:named REQ16_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does NOT want to participate."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_meets_another_reason_for_exclusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets another reason for exclusion, and this reason is noted in the record.","when_to_set_to_false":"Set to false if the patient currently does not meet another reason for exclusion, or no such reason is noted in the record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets another reason for exclusion.","meaning":"Boolean indicating whether the patient currently meets another reason for exclusion, as noted in the record."} ;; "The patient is excluded if the patient meets another reason for exclusion (which will be noted)."

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
  (! (not patient_meets_another_reason_for_exclusion_now)
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient meets another reason for exclusion (which will be noted)."
