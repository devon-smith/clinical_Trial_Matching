;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of delirium.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of delirium.","meaning":"Boolean indicating whether the patient currently has a diagnosis of delirium."} ;; "delirium"
(declare-const patient_has_diagnosis_of_delirium_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of delirium is classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of delirium is not classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of delirium is classified as an Axis I diagnosis according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of delirium is classified as an Axis I diagnosis according to DSM-IV."} ;; "classified as an Axis I diagnosis according to DSM-IV"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_delirium_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv
      patient_has_diagnosis_of_delirium_now)
   :named REQ0_AUXILIARY0)) ;; "classified as an Axis I diagnosis according to DSM-IV"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_delirium_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of delirium classified as an Axis I diagnosis according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_amnestic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of amnestic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of amnestic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of amnestic disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of amnestic disorder."} ;; "amnestic disorder"
(declare-const patient_has_diagnosis_of_amnestic_disorder_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of amnestic disorder is classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of amnestic disorder is not classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of amnestic disorder is classified as an Axis I diagnosis according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of amnestic disorder is classified as an Axis I diagnosis according to DSM-IV."} ;; "classified as an Axis I diagnosis according to DSM-IV"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_amnestic_disorder_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv
      patient_has_diagnosis_of_amnestic_disorder_now)
:named REQ1_AUXILIARY0)) ;; "classified as an Axis I diagnosis according to DSM-IV"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_amnestic_disorder_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of amnestic disorder classified as an Axis I diagnosis according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_bipolar_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bipolar disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bipolar disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bipolar disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bipolar disorder."} ;; "bipolar disorder"
(declare-const patient_has_diagnosis_of_bipolar_disorder_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of bipolar disorder is classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of bipolar disorder is not classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of bipolar disorder is classified as an Axis I diagnosis according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of bipolar disorder is classified as an Axis I diagnosis according to DSM-IV."} ;; "classified as an Axis I diagnosis according to DSM-IV"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_bipolar_disorder_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv
      patient_has_diagnosis_of_bipolar_disorder_now)
:named REQ2_AUXILIARY0)) ;; "classified as an Axis I diagnosis according to DSM-IV"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_bipolar_disorder_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of bipolar disorder classified as an Axis I diagnosis according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_schizophrenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of schizophrenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of schizophrenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of schizophrenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of schizophrenia."} ;; "schizophrenia"
(declare-const patient_has_diagnosis_of_schizophrenia_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of schizophrenia is classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of schizophrenia is not classified as Axis I according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of schizophrenia is classified as Axis I according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of schizophrenia is classified as Axis I according to DSM-IV."} ;; "classified as an Axis I diagnosis according to DSM-IV"
(declare-const patient_has_diagnosis_of_schizoaffective_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of schizoaffective disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of schizoaffective disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of schizoaffective disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of schizoaffective disorder."} ;; "schizoaffective disorder"
(declare-const patient_has_diagnosis_of_schizoaffective_disorder_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of schizoaffective disorder is classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of schizoaffective disorder is not classified as Axis I according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of schizoaffective disorder is classified as Axis I according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of schizoaffective disorder is classified as Axis I according to DSM-IV."} ;; "classified as an Axis I diagnosis according to DSM-IV"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_schizophrenia_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv
       patient_has_diagnosis_of_schizophrenia_now)
   :named REQ3_AUXILIARY0)) ;; "classified as an Axis I diagnosis according to DSM-IV for schizophrenia"

(assert
(! (=> patient_has_diagnosis_of_schizoaffective_disorder_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv
       patient_has_diagnosis_of_schizoaffective_disorder_now)
   :named REQ3_AUXILIARY1)) ;; "classified as an Axis I diagnosis according to DSM-IV for schizoaffective disorder"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_schizophrenia_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of schizophrenia classified as an Axis I diagnosis according to DSM-IV."

(assert
(! (not patient_has_diagnosis_of_schizoaffective_disorder_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of schizoaffective disorder classified as an Axis I diagnosis according to DSM-IV."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_mood_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mood disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mood disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mood disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mood disorder."} ;; "mood disorder"
(declare-const patient_has_diagnosis_of_mood_disorder_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of mood disorder is classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of mood disorder is not classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of mood disorder is classified as an Axis I diagnosis according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of mood disorder is classified as an Axis I diagnosis according to DSM-IV."} ;; "classified as an Axis I diagnosis according to DSM-IV"
(declare-const patient_has_diagnosis_of_mood_disorder_with_psychotic_features_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mood disorder with psychotic features.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mood disorder with psychotic features.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mood disorder with psychotic features.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mood disorder with psychotic features."} ;; "mood disorder with psychotic features"
(declare-const patient_has_diagnosis_of_mood_disorder_with_psychotic_features_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of mood disorder with psychotic features is classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's current diagnosis of mood disorder with psychotic features is not classified as an Axis I diagnosis according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of mood disorder with psychotic features is classified as an Axis I diagnosis according to DSM-IV.","meaning":"Boolean indicating whether the patient's current diagnosis of mood disorder with psychotic features is classified as an Axis I diagnosis according to DSM-IV."} ;; "mood disorder with psychotic features classified as an Axis I diagnosis according to DSM-IV"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_mood_disorder_with_psychotic_features_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv
      patient_has_diagnosis_of_mood_disorder_with_psychotic_features_now)
:named REQ4_AUXILIARY0)) ;; "diagnosis of mood disorder with psychotic features classified as an Axis I diagnosis according to DSM-IV"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_mood_disorder_with_psychotic_features_now@@classified_as_axis_i_diagnosis_according_to_dsm_iv)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of mood disorder with psychotic features classified as an Axis I diagnosis according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@caused_by_reversible_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dementia is caused by a reversible cause.","when_to_set_to_false":"Set to false if the patient's current dementia is not caused by a reversible cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dementia is caused by a reversible cause.","meaning":"Boolean indicating whether the patient's current dementia is caused by a reversible cause."} ;; "reversible cause of dementia"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_dementia_now@@caused_by_reversible_cause
      patient_has_finding_of_dementia_now)
   :named REQ5_AUXILIARY0)) ;; "dementia caused by a reversible cause" implies "dementia"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_dementia_now@@caused_by_reversible_cause)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a reversible cause of dementia."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_psychotic_symptom_finding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had psychotic symptoms at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had psychotic symptoms at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had psychotic symptoms in their history.","meaning":"Boolean indicating whether the patient has ever had psychotic symptoms in their history."} ;; "psychotic symptoms"
(declare-const patient_has_finding_of_psychotic_symptom_finding_inthehistory@@continuously_present_since_prior_to_onset_of_dementia_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient's psychotic symptoms have been continuously present since prior to the onset of dementia symptoms.","when_to_set_to_false":"Set to false if the patient's psychotic symptoms have not been continuously present since prior to the onset of dementia symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's psychotic symptoms have been continuously present since prior to the onset of dementia symptoms.","meaning":"Boolean indicating whether the patient's psychotic symptoms have been continuously present since prior to the onset of dementia symptoms."} ;; "psychotic symptoms that have been continuously present since prior to the onset of the symptoms of dementia"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_psychotic_symptom_finding_inthehistory@@continuously_present_since_prior_to_onset_of_dementia_symptoms
      patient_has_finding_of_psychotic_symptom_finding_inthehistory)
:named REQ6_AUXILIARY0)) ;; "psychotic symptoms that have been continuously present since prior to the onset of the symptoms of dementia"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_psychotic_symptom_finding_inthehistory@@continuously_present_since_prior_to_onset_of_dementia_symptoms)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychotic symptoms that have been continuously present since prior to the onset of the symptoms of dementia."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_psychotic_symptom_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychotic symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have psychotic symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychotic symptoms.","meaning":"Boolean indicating whether the patient currently has psychotic symptoms."} ;; "psychotic symptoms"

(declare-const patient_has_finding_of_psychotic_symptom_finding_now@@better_accounted_for_by_another_general_medical_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychotic symptoms are better accounted for by another general medical condition.","when_to_set_to_false":"Set to false if the patient's current psychotic symptoms are not better accounted for by another general medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychotic symptoms are better accounted for by another general medical condition.","meaning":"Boolean indicating whether the patient's current psychotic symptoms are better accounted for by another general medical condition."} ;; "psychotic symptoms that are better accounted for by another general medical condition"

(declare-const patient_has_finding_of_psychotic_symptom_finding_now@@better_accounted_for_by_the_direct_physiological_effects_of_a_substance Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychotic symptoms are better accounted for by the direct physiological effects of a substance.","when_to_set_to_false":"Set to false if the patient's current psychotic symptoms are not better accounted for by the direct physiological effects of a substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychotic symptoms are better accounted for by the direct physiological effects of a substance.","meaning":"Boolean indicating whether the patient's current psychotic symptoms are better accounted for by the direct physiological effects of a substance."} ;; "psychotic symptoms that are better accounted for by the direct physiological effects of a substance"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_psychotic_symptom_finding_now@@better_accounted_for_by_another_general_medical_condition
      patient_has_finding_of_psychotic_symptom_finding_now)
:named REQ7_AUXILIARY0)) ;; "psychotic symptoms that are better accounted for by another general medical condition"

(assert
(! (=> patient_has_finding_of_psychotic_symptom_finding_now@@better_accounted_for_by_the_direct_physiological_effects_of_a_substance
      patient_has_finding_of_psychotic_symptom_finding_now)
:named REQ7_AUXILIARY1)) ;; "psychotic symptoms that are better accounted for by the direct physiological effects of a substance"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_psychotic_symptom_finding_now@@better_accounted_for_by_another_general_medical_condition)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychotic symptoms that are better accounted for by another general medical condition."

(assert
(! (not patient_has_finding_of_psychotic_symptom_finding_now@@better_accounted_for_by_the_direct_physiological_effects_of_a_substance)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychotic symptoms that are better accounted for by the direct physiological effects of a substance."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_major_depressive_episode_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a major depressive episode.","when_to_set_to_false":"Set to false if the patient currently does not have a major depressive episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a major depressive episode.","meaning":"Boolean indicating whether the patient currently has a major depressive episode."} ;; "major depressive episode"

(declare-const patients_psychotic_symptom_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychotic symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have psychotic symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychotic symptoms.","meaning":"Boolean indicating whether the patient currently has psychotic symptoms."} ;; "psychotic symptoms"

(declare-const patients_psychotic_symptom_is_positive_now@@of_hallucinations Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychotic symptoms and those symptoms are hallucinations.","when_to_set_to_false":"Set to false if the patient currently has psychotic symptoms but those symptoms are not hallucinations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychotic symptoms are hallucinations.","meaning":"Boolean indicating whether the patient's current psychotic symptoms are hallucinations."} ;; "psychotic symptoms of hallucinations"

(declare-const patients_psychotic_symptom_is_positive_now@@of_delusions Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychotic symptoms and those symptoms are delusions.","when_to_set_to_false":"Set to false if the patient currently has psychotic symptoms but those symptoms are not delusions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychotic symptoms are delusions.","meaning":"Boolean indicating whether the patient's current psychotic symptoms are delusions."} ;; "psychotic symptoms of delusions"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patients_psychotic_symptom_is_positive_now@@of_hallucinations
      patients_psychotic_symptom_is_positive_now)
:named REQ8_AUXILIARY0)) ;; "psychotic symptoms of hallucinations"

(assert
(! (=> patients_psychotic_symptom_is_positive_now@@of_delusions
      patients_psychotic_symptom_is_positive_now)
:named REQ8_AUXILIARY1)) ;; "psychotic symptoms of delusions"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have a current major depressive episode with psychotic symptoms of hallucinations
(assert
(! (not (and patient_has_major_depressive_episode_now
             patients_psychotic_symptom_is_positive_now@@of_hallucinations))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current major depressive episode with psychotic symptoms of hallucinations."

;; Exclusion: patient must NOT have a current major depressive episode with psychotic symptoms of delusions
(assert
(! (not (and patient_has_major_depressive_episode_now
             patients_psychotic_symptom_is_positive_now@@of_delusions))
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current major depressive episode with psychotic symptoms of delusions."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_dementia_co_occurrent_with_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia that is co-occurring with infection with human immunodeficiency virus (HIV).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia that is co-occurring with infection with human immunodeficiency virus (HIV).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia that is co-occurring with infection with human immunodeficiency virus (HIV).","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia that is co-occurring with infection with human immunodeficiency virus (HIV)."} ;; "dementia related to infection with human immunodeficiency virus"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_diagnosis_of_dementia_co_occurrent_with_human_immunodeficiency_virus_infection_now)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of dementia related to infection with human immunodeficiency virus."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} ;; "dementia"
(declare-const patient_has_diagnosis_of_dementia_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dementia diagnosis is persistent.","when_to_set_to_false":"Set to false if the patient's current dementia diagnosis is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dementia diagnosis is persistent.","meaning":"Boolean indicating whether the patient's current dementia diagnosis is persistent."} ;; "persistent dementia"
(declare-const patient_has_diagnosis_of_dementia_now@@substance_induced Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dementia diagnosis is substance-induced.","when_to_set_to_false":"Set to false if the patient's current dementia diagnosis is not substance-induced.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dementia diagnosis is substance-induced.","meaning":"Boolean indicating whether the patient's current dementia diagnosis is substance-induced."} ;; "substance-induced dementia"
(declare-const patient_has_diagnosis_of_dementia_now@@persistent@@substance_induced Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia, and the dementia is both persistent and substance-induced.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia that is both persistent and substance-induced.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia that is both persistent and substance-induced.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia, and the dementia is both persistent and substance-induced."} ;; "substance-induced persistent dementia"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_dementia_now@@persistent
       patient_has_diagnosis_of_dementia_now)
   :named REQ10_AUXILIARY0)) ;; "persistent dementia"

(assert
(! (=> patient_has_diagnosis_of_dementia_now@@substance_induced
       patient_has_diagnosis_of_dementia_now)
   :named REQ10_AUXILIARY1)) ;; "substance-induced dementia"

;; Persistent + substance-induced qualifier implies both individual qualifiers
(assert
(! (=> patient_has_diagnosis_of_dementia_now@@persistent@@substance_induced
       (and patient_has_diagnosis_of_dementia_now@@persistent
            patient_has_diagnosis_of_dementia_now@@substance_induced))
   :named REQ10_AUXILIARY2)) ;; "substance-induced persistent dementia"

;; Persistent + substance-induced qualifier implies stem variable
(assert
(! (=> patient_has_diagnosis_of_dementia_now@@persistent@@substance_induced
       patient_has_diagnosis_of_dementia_now)
   :named REQ10_AUXILIARY3)) ;; "substance-induced persistent dementia"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_diagnosis_of_dementia_now@@persistent@@substance_induced)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has substance-induced persistent dementia."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_vascular_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of vascular dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of vascular dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vascular dementia.","meaning":"Boolean indicating whether the patient currently has vascular dementia."} ;; "dementia due to vascular causes"
(declare-const patient_has_finding_of_multi_infarct_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of multi-infarct dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of multi-infarct dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has multi-infarct dementia.","meaning":"Boolean indicating whether the patient currently has multi-infarct dementia."} ;; "dementia due to multi-infarct"
(declare-const patient_has_finding_of_traumatic_encephalopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of traumatic encephalopathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of traumatic encephalopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has traumatic encephalopathy.","meaning":"Boolean indicating whether the patient currently has traumatic encephalopathy."} ;; "dementia due to head trauma"
(declare-const patient_has_finding_of_dementia_due_to_pick_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia due to Pick's disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia due to Pick's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia due to Pick's disease.","meaning":"Boolean indicating whether the patient currently has dementia due to Pick's disease."} ;; "dementia due to Pick's disease"
(declare-const patient_has_finding_of_dementia_due_to_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia due to Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia due to Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia due to Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has dementia due to Parkinson's disease."} ;; "dementia due to Parkinson's disease"
(declare-const patient_has_finding_of_dementia_of_frontal_lobe_type_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia of frontal lobe type.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia of frontal lobe type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia of frontal lobe type.","meaning":"Boolean indicating whether the patient currently has dementia of frontal lobe type."} ;; "dementia due to frontal dementia"
(declare-const patient_has_finding_of_frontotemporal_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of frontotemporal dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of frontotemporal dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has frontotemporal dementia.","meaning":"Boolean indicating whether the patient currently has frontotemporal dementia."} ;; "dementia due to temporal dementia"
(declare-const patient_has_finding_of_senile_dementia_of_the_lewy_body_type_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of senile dementia of the Lewy body type.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of senile dementia of the Lewy body type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has senile dementia of the Lewy body type.","meaning":"Boolean indicating whether the patient currently has senile dementia of the Lewy body type."} ;; "dementia due to Lewy body dementia"
(declare-const patient_has_finding_of_dementia_associated_with_another_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia associated with another disease (any specific non-Alzheimer's type dementia).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia associated with another disease (any specific non-Alzheimer's type dementia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia associated with another disease (any specific non-Alzheimer's type dementia).","meaning":"Boolean indicating whether the patient currently has dementia associated with another disease (any specific non-Alzheimer's type dementia)."} ;; "dementia due to any specific non-Alzheimer's type dementia"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_vascular_dementia_now)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia due to vascular causes."

(assert
(! (not patient_has_finding_of_multi_infarct_dementia_now)
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia due to multi-infarct."

(assert
(! (not patient_has_finding_of_traumatic_encephalopathy_now)
    :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia due to head trauma."

(assert
(! (not patient_has_finding_of_dementia_due_to_pick_s_disease_now)
    :named REQ11_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia due to Pick's disease."

(assert
(! (not patient_has_finding_of_dementia_due_to_parkinson_s_disease_now)
    :named REQ11_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia due to Parkinson's disease."

(assert
(! (not patient_has_finding_of_dementia_of_frontal_lobe_type_now)
    :named REQ11_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia due to frontal dementia."

(assert
(! (not patient_has_finding_of_frontotemporal_dementia_now)
    :named REQ11_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia due to temporal dementia."

(assert
(! (not patient_has_finding_of_senile_dementia_of_the_lewy_body_type_now)
    :named REQ11_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia due to Lewy body dementia."

(assert
(! (not patient_has_finding_of_dementia_associated_with_another_disease_now)
    :named REQ11_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia due to any specific non-Alzheimer's type dementia."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_seizure_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of seizure disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of seizure disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of seizure disorder."} ;; "seizure disorder"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (not patient_has_diagnosis_of_seizure_disorder_now)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a seizure disorder."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_permission_from_bristol_myers_squibb_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has permission from Bristol-Myers Squibb.","when_to_set_to_false":"Set to false if the patient currently does not have permission from Bristol-Myers Squibb.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has permission from Bristol-Myers Squibb.","meaning":"Boolean indicating whether the patient currently has permission from Bristol-Myers Squibb."} ;; "the patient does NOT have permission from Bristol-Myers Squibb"
(declare-const patient_has_symptoms_of_psychotic_symptom_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had psychotic symptoms in the past.","when_to_set_to_false":"Set to false if the patient has never had psychotic symptoms in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had psychotic symptoms in the past.","meaning":"Boolean indicating whether the patient has ever had psychotic symptoms in the past."} ;; "psychotic symptoms in the past"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to anti-psychotic agents (neuroleptic drugs) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to anti-psychotic agents (neuroleptic drugs) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to anti-psychotic agents (neuroleptic drugs) in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to anti-psychotic agents (neuroleptic drugs) in the past."} ;; "neuroleptic drugs used to treat psychotic symptoms in the past"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthehistory@@used_to_treat_psychotic_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to anti-psychotic agents (neuroleptic drugs) in the past was specifically for the treatment of psychotic symptoms.","when_to_set_to_false":"Set to false if the patient's exposure to anti-psychotic agents (neuroleptic drugs) in the past was not for the treatment of psychotic symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was for the treatment of psychotic symptoms.","meaning":"Boolean indicating whether the patient's exposure to anti-psychotic agents (neuroleptic drugs) in the past was for the treatment of psychotic symptoms."} ;; "neuroleptic drugs used to treat psychotic symptoms"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthehistory@@adequate_period_with_therapeutic_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to anti-psychotic agents (neuroleptic drugs) in the past was for an adequate period with a therapeutic dose.","when_to_set_to_false":"Set to false if the exposure was not for an adequate period or not with a therapeutic dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was for an adequate period with a therapeutic dose.","meaning":"Boolean indicating whether the patient's exposure to anti-psychotic agents (neuroleptic drugs) in the past was for an adequate period with a therapeutic dose."} ;; "adequate period with a therapeutic dose"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthehistory@@refractory_to_agent Bool) ;; {"when_to_set_to_true":"Set to true if the patient was refractory to anti-psychotic agents (neuroleptic drugs) when exposed in the past under the specified conditions.","when_to_set_to_false":"Set to false if the patient was not refractory to anti-psychotic agents (neuroleptic drugs) when exposed in the past under the specified conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was refractory to anti-psychotic agents (neuroleptic drugs) when exposed in the past under the specified conditions.","meaning":"Boolean indicating whether the patient was refractory to anti-psychotic agents (neuroleptic drugs) when exposed in the past under the specified conditions."} ;; "refractory to neuroleptic drugs used to treat psychotic symptoms in the past when treated for an adequate period with a therapeutic dose"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_anti_psychotic_agent_inthehistory@@used_to_treat_psychotic_symptoms
      patient_is_exposed_to_anti_psychotic_agent_inthehistory)
:named REQ13_AUXILIARY0)) ;; "neuroleptic drugs used to treat psychotic symptoms"

(assert
(! (=> patient_is_exposed_to_anti_psychotic_agent_inthehistory@@adequate_period_with_therapeutic_dose
      patient_is_exposed_to_anti_psychotic_agent_inthehistory)
:named REQ13_AUXILIARY1)) ;; "adequate period with a therapeutic dose"

(assert
(! (=> patient_is_exposed_to_anti_psychotic_agent_inthehistory@@refractory_to_agent
      patient_is_exposed_to_anti_psychotic_agent_inthehistory)
:named REQ13_AUXILIARY2)) ;; "refractory to neuroleptic drugs used to treat psychotic symptoms in the past when treated for an adequate period with a therapeutic dose"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient has been refractory to neuroleptic drugs used to treat psychotic symptoms in the past when treated for an adequate period with a therapeutic dose AND does NOT have permission from Bristol-Myers Squibb
(assert
(! (not (and
         patient_is_exposed_to_anti_psychotic_agent_inthehistory@@refractory_to_agent
         patient_is_exposed_to_anti_psychotic_agent_inthehistory@@used_to_treat_psychotic_symptoms
         patient_is_exposed_to_anti_psychotic_agent_inthehistory@@adequate_period_with_therapeutic_dose
         (not patient_has_permission_from_bristol_myers_squibb_now)))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has been refractory to neuroleptic drugs used to treat psychotic symptoms in the past when treated for an adequate period with a therapeutic dose) AND (the patient does NOT have permission from Bristol-Myers Squibb)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of psychoactive substance use disorder within the past 6 months.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of psychoactive substance use disorder within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of psychoactive substance use disorder within the past 6 months.","meaning":"Boolean indicating whether the patient has a diagnosis of psychoactive substance use disorder within the past 6 months."} ;; "substance use disorder within the 6 months prior to the start of screening"

(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast6months@@meets_dsm_iv_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of psychoactive substance use disorder within the past 6 months meets DSM-IV criteria.","when_to_set_to_false":"Set to false if the diagnosis does not meet DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis meets DSM-IV criteria.","meaning":"Boolean indicating whether the diagnosis of psychoactive substance use disorder within the past 6 months meets DSM-IV criteria."} ;; "meets the criteria of the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"

(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast6months@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of psychoactive substance use disorder within the past 6 months is considered significant.","when_to_set_to_false":"Set to false if the diagnosis is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is significant.","meaning":"Boolean indicating whether the diagnosis of psychoactive substance use disorder within the past 6 months is considered significant."} ;; "any significant substance use disorder"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast6months@@meets_dsm_iv_criteria
      patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast6months)
:named REQ14_AUXILIARY0)) ;; "meets the criteria of the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition for any significant substance use disorder within the 6 months prior to the start of screening."

(assert
(! (=> patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast6months@@is_significant
      patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast6months)
:named REQ14_AUXILIARY1)) ;; "any significant substance use disorder within the 6 months prior to the start of screening."

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT have met DSM-IV criteria for any significant substance use disorder within the 6 months prior to screening
(assert
(! (not (and patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast6months@@meets_dsm_iv_criteria
             patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthepast6months@@is_significant))
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has met the criteria of the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition for any significant substance use disorder within the 6 months prior to the start of screening."
