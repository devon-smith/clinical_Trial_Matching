;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@is_serious Bool) ;; {"when_to_set_to_true":"Set to true if the disease/condition/finding present in the patient is serious.","when_to_set_to_false":"Set to false if the disease/condition/finding present in the patient is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease/condition/finding present in the patient is serious.","meaning":"Boolean indicating whether the disease/condition/finding present in the patient is serious."} ;; "serious medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@may_adversely_affect_safety_of_patient Bool) ;; {"when_to_set_to_true":"Set to true if the serious disease/condition/finding present in the patient may adversely affect the safety of the patient.","when_to_set_to_false":"Set to false if the serious disease/condition/finding present in the patient does not adversely affect the safety of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serious disease/condition/finding present in the patient may adversely affect safety.","meaning":"Boolean indicating whether the serious disease/condition/finding present in the patient may adversely affect the safety of the patient."} ;; "may adversely affect the safety of the patient"
(declare-const patient_has_finding_of_disease_condition_finding_now@@may_limit_ability_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the serious disease/condition/finding present in the patient may limit the ability of the patient to participate in the study.","when_to_set_to_false":"Set to false if the serious disease/condition/finding present in the patient does not limit the ability to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serious disease/condition/finding present in the patient may limit study participation.","meaning":"Boolean indicating whether the serious disease/condition/finding present in the patient may limit the ability to participate in the study."} ;; "may limit the ability of the patient to participate in the study"
(declare-const patient_has_finding_of_disease_condition_finding_now@@may_limit_ability_to_comply_with_follow_up_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the serious disease, condition, or finding present in the patient may limit the ability of the patient to comply with follow-up requirements.","when_to_set_to_false":"Set to false if the serious disease, condition, or finding present in the patient does not limit the ability to comply with follow-up requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serious disease, condition, or finding present in the patient may limit the ability to comply with follow-up requirements.","meaning":"Boolean indicating whether the serious disease, condition, or finding present in the patient may limit the ability to comply with follow-up requirements."} ;; "may limit the ability of the patient to comply with follow-up requirements"
(declare-const patient_has_finding_of_disease_condition_finding_now@@may_impact_scientific_integrity_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the serious disease/condition/finding present in the patient may impact the scientific integrity of the study.","when_to_set_to_false":"Set to false if the serious disease/condition/finding present in the patient does not impact the scientific integrity of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serious disease/condition/finding present in the patient may impact scientific integrity.","meaning":"Boolean indicating whether the serious disease/condition/finding present in the patient may impact the scientific integrity of the study."} ;; "may impact the scientific integrity of the study"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@is_serious
      patient_has_finding_of_disease_condition_finding_now)
:named REQ0_AUXILIARY0)) ;; "serious medical condition"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@may_adversely_affect_safety_of_patient
      patient_has_finding_of_disease_condition_finding_now@@is_serious)
:named REQ0_AUXILIARY1)) ;; "serious medical condition that may adversely affect the safety of the patient"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@may_limit_ability_to_participate_in_study
      patient_has_finding_of_disease_condition_finding_now@@is_serious)
:named REQ0_AUXILIARY2)) ;; "serious medical condition that may limit the ability of the patient to participate in the study"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@may_limit_ability_to_comply_with_follow_up_requirements
      patient_has_finding_of_disease_condition_finding_now@@is_serious)
:named REQ0_AUXILIARY3)) ;; "serious medical condition that may limit the ability of the patient to comply with follow-up requirements"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@may_impact_scientific_integrity_of_study
      patient_has_finding_of_disease_condition_finding_now@@is_serious)
:named REQ0_AUXILIARY4)) ;; "serious medical condition that may impact the scientific integrity of the study"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@may_adversely_affect_safety_of_patient)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious medical condition that may adversely affect the safety of the patient."

(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@may_limit_ability_to_participate_in_study)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious medical condition that may limit the ability of the patient to participate in the study."

(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@may_limit_ability_to_comply_with_follow_up_requirements)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious medical condition that may limit the ability of the patient to comply with follow-up requirements."

(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@may_impact_scientific_integrity_of_study)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious medical condition that may impact the scientific integrity of the study."
