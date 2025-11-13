;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."}  ;; "male or female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."}  ;; "male or female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 40 years old at entry"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: The patient must be aged ≥ 40 years old at entry.
(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 40 years old at entry."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of dementia."} ;; "clinical diagnosis of dementia"
(declare-const patient_has_diagnosis_of_dementia_now@@diagnosed_as_exhaustive_subcategory Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of dementia and the diagnosis is made as one of the exhaustive subcategories specified in the requirement.","when_to_set_to_false":"Set to false if the patient currently has a clinical diagnosis of dementia but the diagnosis does not match any of the exhaustive subcategories specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia diagnosis matches any of the exhaustive subcategories specified.","meaning":"Boolean indicating whether the patient's current dementia diagnosis matches one of the exhaustive subcategories required by the eligibility criterion."} ;; "diagnosed as one of the exhaustive subcategories"

(declare-const patient_has_diagnosis_of_vascular_dementia_now@@ninds_airen_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of vascular dementia according to National Institute of Neurological Disorders and Stroke and Association Internationale pour la Recherche et l'Enseignement en Neurosciences (NINDS-AIREN) criteria.","when_to_set_to_false":"Set to false if the patient does not have a clinical diagnosis of vascular dementia according to NINDS-AIREN criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical diagnosis of vascular dementia according to NINDS-AIREN criteria.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of vascular dementia according to NINDS-AIREN criteria."} ;; "vascular dementia according to NINDS-AIREN criteria"
(declare-const patient_has_diagnosis_of_lewy_body_dementia_now@@mckeith_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of Lewy body dementia according to McKeith's criteria.","when_to_set_to_false":"Set to false if the patient does not have a clinical diagnosis of Lewy body dementia according to McKeith's criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical diagnosis of Lewy body dementia according to McKeith's criteria.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of Lewy body dementia according to McKeith's criteria."} ;; "Lewy body dementia according to McKeith's criteria"
(declare-const patient_has_diagnosis_of_frontotemporal_dementia_now@@neary_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of frontotemporal dementia according to Neary's criteria.","when_to_set_to_false":"Set to false if the patient does not have a clinical diagnosis of frontotemporal dementia according to Neary's criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical diagnosis of frontotemporal dementia according to Neary's criteria.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of frontotemporal dementia according to Neary's criteria."} ;; "frontotemporal dementia according to Neary's criteria"
(declare-const patient_has_diagnosis_of_frontotemporal_dementia_now@@lund_manchester_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of frontotemporal dementia according to Lund and Manchester criteria.","when_to_set_to_false":"Set to false if the patient does not have a clinical diagnosis of frontotemporal dementia according to Lund and Manchester criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical diagnosis of frontotemporal dementia according to Lund and Manchester criteria.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of frontotemporal dementia according to Lund and Manchester criteria."} ;; "frontotemporal dementia according to Lund and Manchester criteria"
(declare-const patient_has_diagnosis_of_parkinsons_disease_dementia_now@@dsm_iv_tr_f02x Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of Parkinson's disease dementia according to DSM-IV-TR criteria [F02.x].","when_to_set_to_false":"Set to false if the patient does not have a clinical diagnosis of Parkinson's disease dementia according to DSM-IV-TR criteria [F02.x].","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical diagnosis of Parkinson's disease dementia according to DSM-IV-TR criteria [F02.x].","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of Parkinson's disease dementia according to DSM-IV-TR criteria [F02.x]."} ;; "Parkinson's disease dementia according to DSM-IV-TR criteria [F02.x]"
(declare-const patient_has_diagnosis_of_mixed_dementia_now@@dsm_iv_tr_f028_definition_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of mixed dementia as defined in this study: fulfilling DSM-IV-TR criteria [F02.8] for dementia with multiple aetiologies focusing on dementia of Alzheimer type with secondary occurrence of vascular dementia.","when_to_set_to_false":"Set to false if the patient does not have a clinical diagnosis of mixed dementia as defined in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical diagnosis of mixed dementia as defined in this study.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of mixed dementia as defined in this study (DSM-IV-TR F02.8 for dementia with multiple aetiologies focusing on Alzheimer type with secondary vascular dementia)."} ;; "mixed dementia (defined as DSM-IV-TR F02.8 for dementia with multiple aetiologies focusing on Alzheimer type with secondary vascular dementia)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
  (! (= patient_has_diagnosis_of_dementia_now@@diagnosed_as_exhaustive_subcategory
        (or patient_has_diagnosis_of_vascular_dementia_now@@ninds_airen_criteria
            patient_has_diagnosis_of_lewy_body_dementia_now@@mckeith_criteria
            patient_has_diagnosis_of_frontotemporal_dementia_now@@neary_criteria
            patient_has_diagnosis_of_frontotemporal_dementia_now@@lund_manchester_criteria
            patient_has_diagnosis_of_parkinsons_disease_dementia_now@@dsm_iv_tr_f02x
            patient_has_diagnosis_of_mixed_dementia_now@@dsm_iv_tr_f028_definition_in_this_study))
     :named REQ1_AUXILIARY0)) ;; "exhaustive subcategories: vascular dementia (NINDS-AIREN), Lewy body dementia (McKeith), frontotemporal dementia (Neary or Lund-Manchester), Parkinson's disease dementia (DSM-IV-TR F02.x), mixed dementia (DSM-IV-TR F02.8 as defined in this study)"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@diagnosed_as_exhaustive_subcategory
         patient_has_diagnosis_of_dementia_now)
     :named REQ1_AUXILIARY1)) ;; "diagnosed as one of the exhaustive subcategories" implies "clinical diagnosis of dementia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patient_has_diagnosis_of_dementia_now
          patient_has_diagnosis_of_dementia_now@@diagnosed_as_exhaustive_subcategory)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of dementia with exhaustive subcategories (see above)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const written_informed_consent_obtained_from_patient Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from the patient."} ;; "written informed consent obtained from the patient"
(declare-const written_informed_consent_obtained_from_legal_representative_according_to_local_laws_and_regulations Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from a legal representative according to local laws and regulations.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from a legal representative according to local laws and regulations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from a legal representative according to local laws and regulations.","meaning":"Boolean indicating whether written informed consent has been obtained from a legal representative according to local laws and regulations."} ;; "written informed consent obtained from a legal representative according to local laws and regulations"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or written_informed_consent_obtained_from_patient
         written_informed_consent_obtained_from_legal_representative_according_to_local_laws_and_regulations)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have written informed consent obtained from the patient OR, if appropriate, written informed consent obtained from a legal representative according to local laws and regulations."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_dementia_now@@settled_by_brain_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of dementia was settled by brain imaging (CT or MRI).","when_to_set_to_false":"Set to false if the diagnosis of dementia was not settled by brain imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of dementia was settled by brain imaging.","meaning":"Boolean indicating whether the diagnosis of dementia was settled by brain imaging (CT or MRI)."} ;; "evidence that brain imaging (either cerebral computed tomography scan OR cerebral magnetic resonance imaging) was performed to settle the diagnosis of dementia"
(declare-const patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a cerebral computed tomography scan (CT of brain) at any time in the history.","when_to_set_to_false":"Set to false if the patient has never undergone a cerebral computed tomography scan (CT of brain) at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a cerebral computed tomography scan (CT of brain).","meaning":"Boolean indicating whether the patient has ever undergone a cerebral computed tomography scan (CT of brain) at any time in the history."} ;; "cerebral computed tomography scan"
(declare-const patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory@@performed_to_settle_diagnosis_of_dementia Bool) ;; {"when_to_set_to_true":"Set to true if the cerebral computed tomography scan was performed specifically to settle the diagnosis of dementia.","when_to_set_to_false":"Set to false if the cerebral computed tomography scan was not performed to settle the diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scan was performed to settle the diagnosis of dementia.","meaning":"Boolean indicating whether the cerebral computed tomography scan was performed to settle the diagnosis of dementia."} ;; "CT performed to settle diagnosis of dementia"
(declare-const patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone cerebral magnetic resonance imaging (MRI of brain and brain stem) at any time in the history.","when_to_set_to_false":"Set to false if the patient has never undergone cerebral magnetic resonance imaging (MRI of brain and brain stem) at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone cerebral magnetic resonance imaging (MRI of brain and brain stem).","meaning":"Boolean indicating whether the patient has ever undergone cerebral magnetic resonance imaging (MRI of brain and brain stem) at any time in the history."} ;; "cerebral magnetic resonance imaging"
(declare-const patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory@@performed_to_settle_diagnosis_of_dementia Bool) ;; {"when_to_set_to_true":"Set to true if the cerebral magnetic resonance imaging was performed specifically to settle the diagnosis of dementia.","when_to_set_to_false":"Set to false if the cerebral magnetic resonance imaging was not performed to settle the diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the MRI was performed to settle the diagnosis of dementia.","meaning":"Boolean indicating whether the cerebral magnetic resonance imaging was performed to settle the diagnosis of dementia."} ;; "MRI performed to settle diagnosis of dementia"
(declare-const patient_has_diagnosis_of_dementia_now@@brain_imaging_results_compatible_with_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the brain imaging results are compatible with the diagnosis of dementia.","when_to_set_to_false":"Set to false if the brain imaging results are not compatible with the diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the brain imaging results are compatible with the diagnosis of dementia.","meaning":"Boolean indicating whether the brain imaging results are compatible with the diagnosis of dementia."} ;; "results are compatible with the diagnosis of dementia"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; If CT or MRI was performed to settle the diagnosis of dementia, then the diagnosis was settled by brain imaging
(assert
  (! (= patient_has_diagnosis_of_dementia_now@@settled_by_brain_imaging
        (or patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory@@performed_to_settle_diagnosis_of_dementia
            patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory@@performed_to_settle_diagnosis_of_dementia))
     :named REQ3_AUXILIARY0)) ;; "brain imaging (either CT or MRI) was performed to settle the diagnosis of dementia"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory@@performed_to_settle_diagnosis_of_dementia
         patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "CT performed to settle diagnosis of dementia" implies CT was done

(assert
  (! (=> patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory@@performed_to_settle_diagnosis_of_dementia
         patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory)
     :named REQ3_AUXILIARY2)) ;; "MRI performed to settle diagnosis of dementia" implies MRI was done

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Evidence that brain imaging (CT or MRI) was performed to settle the diagnosis of dementia
(assert
  (! patient_has_diagnosis_of_dementia_now@@settled_by_brain_imaging
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "evidence that brain imaging (either CT or MRI) was performed to settle the diagnosis of dementia"

;; Component 1: Results of brain imaging are compatible with the diagnosis of dementia
(assert
  (! patient_has_diagnosis_of_dementia_now@@brain_imaging_results_compatible_with_diagnosis
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "results are compatible with the diagnosis of dementia"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_clinical_signs_of_sign_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinical signs present.","when_to_set_to_false":"Set to false if the patient currently does not have any clinical signs present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinical signs.","meaning":"Boolean indicating whether the patient currently has any clinical signs."} ;; "absence of other signs"
(declare-const patient_has_symptoms_better_explained_by_other_dementia_type_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms that are better explained by another type of dementia than the current dementia diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms that are better explained by another type of dementia than the current dementia diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms that are better explained by another type of dementia than the current dementia diagnosis.","meaning":"Boolean indicating whether the patient currently has symptoms that are better explained by another type of dementia than the current dementia diagnosis."} ;; "absence of other symptoms that may be better related to another type of dementia than the current dementia diagnosis"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must have absence of other signs or symptoms that may be better related to another type of dementia than the current dementia diagnosis.
(assert
  (! (and (not patient_has_clinical_signs_of_sign_now)
          (not patient_has_symptoms_better_explained_by_other_dementia_type_now))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absence of other signs or symptoms that may be better related to another type of dementia than the current dementia diagnosis"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_compliant_with_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is compliant with all required study procedures as specified by the study protocol.","when_to_set_to_false":"Set to false if the patient is not compliant with all required study procedures as specified by the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is compliant with study procedures.","meaning":"Boolean indicating whether the patient is compliant with study procedures as required by the study protocol."} ;; "the patient must be compliant with study procedures"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_compliant_with_study_procedures
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be compliant with study procedures"
