;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} ;; "the patient must be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient must be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 40 years old at entry"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be male or female"

;; Component 1: The patient must be aged ≥ 40 years old at entry.
(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "aged ≥ 40 years old at entry"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of Alzheimer's disease."} ;; "the patient must have a clinical diagnosis of probable Alzheimer's disease"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dsm_iv_tr_criteria_f00_xx Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Alzheimer's disease diagnosis is made according to DSM-IV-TR criteria [F00.xx].","when_to_set_to_false":"Set to false if the patient's Alzheimer's disease diagnosis is not made according to DSM-IV-TR criteria [F00.xx].","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether DSM-IV-TR criteria [F00.xx] were used for the diagnosis.","meaning":"Boolean indicating whether the patient's Alzheimer's disease diagnosis is made according to DSM-IV-TR criteria [F00.xx]."} ;; "according to Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria [F00.xx]"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_nincds_or_adrda_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Alzheimer's disease diagnosis is made according to either NINCDS or ADRDA criteria.","when_to_set_to_false":"Set to false if the patient's Alzheimer's disease diagnosis is not made according to either NINCDS or ADRDA criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether NINCDS or ADRDA criteria were used for the diagnosis.","meaning":"Boolean indicating whether the patient's Alzheimer's disease diagnosis is made according to either NINCDS or ADRDA criteria."} ;; "according to National Institute of Neurological and Communicative Disorders and Stroke criteria OR Alzheimer's Disease and Related Disorders Association criteria"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@probable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Alzheimer's disease diagnosis is classified as probable.","when_to_set_to_false":"Set to false if the patient's Alzheimer's disease diagnosis is not classified as probable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is classified as probable.","meaning":"Boolean indicating whether the patient's Alzheimer's disease diagnosis is classified as probable."} ;; "clinical diagnosis of probable Alzheimer's disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dsm_iv_tr_criteria_f00_xx
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ1_AUXILIARY0)) ;; "diagnosed according to DSM-IV-TR criteria [F00.xx]"

(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_nincds_or_adrda_criteria
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ1_AUXILIARY1)) ;; "diagnosed according to NINCDS or ADRDA criteria"

(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@probable
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ1_AUXILIARY2)) ;; "diagnosis is classified as probable"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have probable Alzheimer's disease diagnosis according to DSM-IV-TR AND (NINCDS OR ADRDA)
(assert
  (! (and patient_has_diagnosis_of_alzheimer_s_disease_now@@probable
          patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dsm_iv_tr_criteria_f00_xx
          patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_nincds_or_adrda_criteria)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a clinical diagnosis of probable Alzheimer's disease according to (DSM-IV-TR criteria [F00.xx]) AND (NINCDS OR ADRDA criteria)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const written_informed_consent_obtained_from_patient Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from the patient."} ;; "written informed consent obtained from the patient"
(declare-const written_informed_consent_obtained_from_legal_representative_according_to_local_laws_and_regulations Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from a legal representative according to local laws and regulations.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from a legal representative according to local laws and regulations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from a legal representative according to local laws and regulations.","meaning":"Boolean indicating whether written informed consent has been obtained from a legal representative according to local laws and regulations."} ;; "written informed consent obtained from a legal representative according to local laws and regulations"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have written informed consent obtained from the patient OR, if appropriate, have written informed consent obtained from a legal representative according to local laws and regulations.
(assert
  (! (or written_informed_consent_obtained_from_patient
         written_informed_consent_obtained_from_legal_representative_according_to_local_laws_and_regulations)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a cerebral computed tomography scan (CT of brain) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a cerebral computed tomography scan (CT of brain) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a cerebral computed tomography scan (CT of brain) in the past.","meaning":"Boolean indicating whether the patient has ever undergone a cerebral computed tomography scan (CT of brain) in the past."} ;; "cerebral computed tomography scan"
(declare-const patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory@@performed_to_settle_alzheimers_disease_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cerebral computed tomography scan was performed specifically to settle the Alzheimer's disease diagnosis.","when_to_set_to_false":"Set to false if the patient's cerebral computed tomography scan was not performed to settle the Alzheimer's disease diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scan was performed to settle the Alzheimer's disease diagnosis.","meaning":"Boolean indicating whether the cerebral computed tomography scan was performed to settle the Alzheimer's disease diagnosis."} ;; "cerebral computed tomography scan ... performed to settle the Alzheimer's disease diagnosis"
(declare-const patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a cerebral magnetic resonance imaging (MRI of brain and brain stem) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a cerebral magnetic resonance imaging (MRI of brain and brain stem) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a cerebral magnetic resonance imaging (MRI of brain and brain stem) in the past.","meaning":"Boolean indicating whether the patient has ever undergone a cerebral magnetic resonance imaging (MRI of brain and brain stem) in the past."} ;; "cerebral magnetic resonance imaging"
(declare-const patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory@@performed_to_settle_alzheimers_disease_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cerebral magnetic resonance imaging was performed specifically to settle the Alzheimer's disease diagnosis.","when_to_set_to_false":"Set to false if the patient's cerebral magnetic resonance imaging was not performed to settle the Alzheimer's disease diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scan was performed to settle the Alzheimer's disease diagnosis.","meaning":"Boolean indicating whether the cerebral magnetic resonance imaging was performed to settle the Alzheimer's disease diagnosis."} ;; "cerebral magnetic resonance imaging ... performed to settle the Alzheimer's disease diagnosis"
(declare-const patient_has_brain_imaging_result_compatible_with_alzheimers_disease_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's brain imaging result is compatible with the diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient's brain imaging result is not compatible with the diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's brain imaging result is compatible with the diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient's brain imaging result is compatible with the diagnosis of Alzheimer's disease."} ;; "the results are compatible with Alzheimer's disease diagnosis"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory@@performed_to_settle_alzheimers_disease_diagnosis
         patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "cerebral computed tomography scan ... performed to settle the Alzheimer's disease diagnosis"

(assert
  (! (=> patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory@@performed_to_settle_alzheimers_disease_diagnosis
         patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "cerebral magnetic resonance imaging ... performed to settle the Alzheimer's disease diagnosis"

;; Non-exhaustive examples: if either CT or MRI performed to settle AD diagnosis, then brain imaging (for this purpose) was performed
;; (No umbrella variable needed, as the requirement only gives non-exhaustive examples.)

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Evidence that brain imaging (with non-exhaustive examples) was performed to settle the Alzheimer's disease diagnosis
(assert
  (! (or patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory@@performed_to_settle_alzheimers_disease_diagnosis
         patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory@@performed_to_settle_alzheimers_disease_diagnosis)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "evidence that brain imaging (with non-exhaustive examples (cerebral computed tomography scan OR cerebral magnetic resonance imaging)) was performed to settle the Alzheimer's disease diagnosis"

;; Component 1: Evidence that the results are compatible with Alzheimer's disease diagnosis
(assert
  (! patient_has_brain_imaging_result_compatible_with_alzheimers_disease_diagnosis
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "evidence that the results are compatible with Alzheimer's disease diagnosis"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_neurological_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a neurological examination now.","when_to_set_to_false":"Set to false if the patient has not undergone a neurological examination now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a neurological examination now.","meaning":"Boolean indicating whether the patient has undergone a neurological examination now."} ;; "neurological examination"
(declare-const patient_has_undergone_neurological_examination_now@@outcome_is_without_particularities_or_without_specific_focal_signs_unrelated_to_alzheimers_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a neurological examination now and the outcome is without any particularities or without any specific focal signs likely to be related to other conditions than Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient has undergone a neurological examination now and the outcome has particularities or specific focal signs likely to be related to conditions other than Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the outcome of the neurological examination is without particularities or without specific focal signs unrelated to Alzheimer's disease.","meaning":"Boolean indicating whether the outcome of the neurological examination now is without any particularities or without any specific focal signs likely to be related to other conditions than Alzheimer's disease."} ;; "neurological examination without any particularities or without any specific focal signs likely to be related to other conditions than Alzheimer's disease"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_neurological_examination_now@@outcome_is_without_particularities_or_without_specific_focal_signs_unrelated_to_alzheimers_disease
         patient_has_undergone_neurological_examination_now)
     :named REQ4_AUXILIARY0)) ;; "neurological examination outcome qualifier implies examination performed"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: The patient must have a neurological examination without any particularities or without any specific focal signs likely to be related to other conditions than Alzheimer's disease.
(assert
  (! patient_has_undergone_neurological_examination_now@@outcome_is_without_particularities_or_without_specific_focal_signs_unrelated_to_alzheimers_disease
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "neurological examination without any particularities or without any specific focal signs likely to be related to other conditions than Alzheimer's disease"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_compliant_with_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is compliant with all required study procedures.","when_to_set_to_false":"Set to false if the patient is not compliant with all required study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is compliant with study procedures.","meaning":"Boolean indicating whether the patient is compliant with study procedures."} ;; "the patient must be compliant with study procedures"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_compliant_with_study_procedures
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be compliant with study procedures"
