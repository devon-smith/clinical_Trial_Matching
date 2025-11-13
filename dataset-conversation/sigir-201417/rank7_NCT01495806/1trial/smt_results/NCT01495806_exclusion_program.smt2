;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of gastrointestinal tract."} ;; "gastrointestinal disease"

(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@established_by_medical_history_or_complete_blood_count_or_urinalysis_or_stool_examination_for_occult_blood_or_stool_examination_for_ova_or_stool_examination_for_parasites_or_blood_chemistries_or_abdominal_ultrasound_or_breath_hydrogen_testing_or_endoscopy_if_needed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of disorder of gastrointestinal tract is established by at least one of the specified diagnostic methods (medical history, complete blood count, urinalysis, stool examination for occult blood, stool examination for ova, stool examination for parasites, blood chemistries, abdominal ultrasound, breath hydrogen testing, or endoscopy if needed).","when_to_set_to_false":"Set to false if the patient's diagnosis of disorder of gastrointestinal tract is not established by any of the specified diagnostic methods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is established by any of the specified methods.","meaning":"Boolean indicating whether the patient's diagnosis of disorder of gastrointestinal tract is established by one or more specified diagnostic methods."} ;; "as established by (medical history) OR (complete blood count) OR (urinalysis) OR (stool examination for occult blood) OR (stool examination for ova) OR (stool examination for parasites) OR (blood chemistries) OR (abdominal ultrasound) OR (breath hydrogen testing) OR (endoscopy, if endoscopy is needed)."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@established_by_medical_history_or_complete_blood_count_or_urinalysis_or_stool_examination_for_occult_blood_or_stool_examination_for_ova_or_stool_examination_for_parasites_or_blood_chemistries_or_abdominal_ultrasound_or_breath_hydrogen_testing_or_endoscopy_if_needed
       patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now)
   :named REQ0_AUXILIARY0)) ;; "diagnosis of disorder of gastrointestinal tract, and the diagnosis is established by one or more of the following: medical history, complete blood count, urinalysis, stool examination for occult blood, stool examination for ova, stool examination for parasites, blood chemistries, abdominal ultrasound, breath hydrogen testing, or endoscopy (if endoscopy is needed)."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@established_by_medical_history_or_complete_blood_count_or_urinalysis_or_stool_examination_for_occult_blood_or_stool_examination_for_ova_or_stool_examination_for_parasites_or_blood_chemistries_or_abdominal_ultrasound_or_breath_hydrogen_testing_or_endoscopy_if_needed)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has organic gastrointestinal disease as established by (medical history) OR (complete blood count) OR (urinalysis) OR (stool examination for occult blood) OR (stool examination for ova) OR (stool examination for parasites) OR (blood chemistries) OR (abdominal ultrasound) OR (breath hydrogen testing) OR (endoscopy, if endoscopy is needed)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any chronic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any chronic disease."} ;; "chronic disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_disease_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another chronic disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_growth_retardation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of growth retardation (growth failure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of growth retardation (growth failure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has growth retardation (growth failure).","meaning":"Boolean indicating whether the patient currently has growth retardation (growth failure)."} ;; "growth failure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_growth_retardation_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has growth failure."
