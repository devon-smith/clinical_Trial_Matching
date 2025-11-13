;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_epileptic_seizure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an epileptic seizure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had an epileptic seizure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an epileptic seizure.","meaning":"Boolean indicating whether the patient has ever had an epileptic seizure in their medical history."} ;; "has a history of epileptic seizure"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_epileptic_seizure_inthehistory)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of epileptic seizure."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_transcranial_magnetic_stimulation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently to participate in or is undergoing transcranial magnetic stimulation.","when_to_set_to_false":"Set to false if the patient is not currently to participate in or is not undergoing transcranial magnetic stimulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently to participate in or is undergoing transcranial magnetic stimulation.","meaning":"Boolean indicating whether the patient is currently to participate in or is undergoing transcranial magnetic stimulation."} ;; "the patient is to participate in transcranial magnetic stimulation"

(declare-const patient_has_finding_of_cardiac_rhythm_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of any cardiac rhythm condition (including but not limited to heart murmur, cardiac arrhythmia).","when_to_set_to_false":"Set to false if the patient does not have a history of any cardiac rhythm condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of any cardiac rhythm condition.","meaning":"Boolean indicating whether the patient has a history of any cardiac rhythm condition."} ;; "has a history of cardiac rhythm condition"

(declare-const patient_has_finding_of_heart_murmur_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of heart murmur.","when_to_set_to_false":"Set to false if the patient does not have a history of heart murmur.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of heart murmur.","meaning":"Boolean indicating whether the patient has a history of heart murmur."} ;; "heart murmur"

(declare-const patient_has_finding_of_cardiac_arrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient does not have a history of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient has a history of cardiac arrhythmia."} ;; "cardiac arrhythmia"

(declare-const patient_has_cardiac_pacemaker_in_place_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac pacemaker in place.","when_to_set_to_false":"Set to false if the patient does not currently have a cardiac pacemaker in place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac pacemaker in place.","meaning":"Boolean indicating whether the patient currently has a cardiac pacemaker in place."} ;; "cardiac pacemaker in place"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_heart_murmur_inthehistory
          patient_has_finding_of_cardiac_arrhythmia_inthehistory)
    patient_has_finding_of_cardiac_rhythm_condition_inthehistory)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (heart murmur, cardiac arrhythmia)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT satisfy the exclusion criteria
(assert
(! (not (and patient_is_undergoing_transcranial_magnetic_stimulation_now
             patient_has_finding_of_cardiac_rhythm_condition_inthehistory))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is to participate in transcranial magnetic stimulation) AND (the patient has a history of cardiac rhythm condition with non-exhaustive examples (heart murmur, cardiac arrhythmia))."

(assert
(! (not (and patient_is_undergoing_transcranial_magnetic_stimulation_now
             patient_has_cardiac_pacemaker_in_place_now))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is to participate in transcranial magnetic stimulation) AND (the patient has a cardiac pacemaker in place)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_amyotrophic_lateral_sclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with amyotrophic lateral sclerosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with amyotrophic lateral sclerosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with amyotrophic lateral sclerosis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with amyotrophic lateral sclerosis in their medical history."} ;; "amyotrophic lateral sclerosis"
(declare-const patient_has_diagnosis_of_dementia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with dementia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with dementia at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with dementia.","meaning":"Boolean indicating whether the patient has ever been diagnosed with dementia in their medical history."} ;; "dementia"
(declare-const patient_has_diagnosis_of_multiple_sclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with multiple sclerosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with multiple sclerosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with multiple sclerosis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with multiple sclerosis in their medical history."} ;; "multiple sclerosis"
(declare-const patient_has_diagnosis_of_parkinson_s_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with Parkinson's disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with Parkinson's disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with Parkinson's disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with Parkinson's disease in their medical history."} ;; "Parkinson's disease"
(declare-const patient_has_history_of_progressive_neurodegenerative_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any progressive neurodegenerative disorder at any point in their medical history, including but not limited to progressive dementia, Parkinson's disease, multiple sclerosis, or amyotrophic lateral sclerosis.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any progressive neurodegenerative disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any progressive neurodegenerative disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a progressive neurodegenerative disorder in their medical history."} ;; "history of progressive neurodegenerative disorder"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_dementia_inthehistory
           patient_has_diagnosis_of_parkinson_s_disease_inthehistory
           patient_has_diagnosis_of_multiple_sclerosis_inthehistory
           patient_has_diagnosis_of_amyotrophic_lateral_sclerosis_inthehistory)
        patient_has_history_of_progressive_neurodegenerative_disorder)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (progressive dementia, Parkinson's disease, multiple sclerosis, amyotrophic lateral sclerosis)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_history_of_progressive_neurodegenerative_disorder)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of progressive neurodegenerative disorder with non-exhaustive examples (progressive dementia, Parkinson's disease, multiple sclerosis, amyotrophic lateral sclerosis)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_brain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplasm of the brain (malignant brain tumor) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplasm of the brain (malignant brain tumor) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplasm of the brain (malignant brain tumor).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplasm of the brain (malignant brain tumor) in their history."} ;; "malignant brain tumor"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplasm_of_brain_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of malignant brain tumor."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_oral_phase_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an oral phase swallowing deficit.","when_to_set_to_false":"Set to false if the patient currently does not have an oral phase swallowing deficit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an oral phase swallowing deficit.","meaning":"Boolean indicating whether the patient currently has an oral phase swallowing deficit."} ;; "oral phase swallowing deficit"
(declare-const patient_has_finding_of_oral_phase_dysphagia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current oral phase swallowing deficit is severe.","when_to_set_to_false":"Set to false if the patient's current oral phase swallowing deficit is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current oral phase swallowing deficit is severe.","meaning":"Boolean indicating whether the patient's current oral phase swallowing deficit is severe."} ;; "severe oral phase swallowing deficit"
(declare-const patient_has_finding_of_oral_phase_dysphagia_now@@prevents_bolus_retention_in_oral_cavity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current oral phase swallowing deficit prevents bolus retention in the oral cavity.","when_to_set_to_false":"Set to false if the patient's current oral phase swallowing deficit does not prevent bolus retention in the oral cavity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current oral phase swallowing deficit prevents bolus retention in the oral cavity.","meaning":"Boolean indicating whether the patient's current oral phase swallowing deficit prevents bolus retention in the oral cavity."} ;; "the severe oral phase swallowing deficit prevents bolus retention in the oral cavity"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_oral_phase_dysphagia_now@@severe
      patient_has_finding_of_oral_phase_dysphagia_now)
:named REQ4_AUXILIARY0)) ;; "severe oral phase swallowing deficit"

(assert
(! (=> patient_has_finding_of_oral_phase_dysphagia_now@@prevents_bolus_retention_in_oral_cavity
      patient_has_finding_of_oral_phase_dysphagia_now)
:named REQ4_AUXILIARY1)) ;; "oral phase swallowing deficit prevents bolus retention in the oral cavity"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_finding_of_oral_phase_dysphagia_now@@severe
             patient_has_finding_of_oral_phase_dysphagia_now@@prevents_bolus_retention_in_oral_cavity))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe oral phase swallowing deficit AND the severe oral phase swallowing deficit prevents bolus retention in the oral cavity."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_esophageal_motility_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has esophageal motility disorder.","when_to_set_to_false":"Set to false if the patient currently does not have esophageal motility disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has esophageal motility disorder.","meaning":"Boolean indicating whether the patient currently has esophageal motility disorder."} ;; "the patient has esophageal motility disorder"
(declare-const patient_has_finding_of_esophageal_motility_disorder_now@@prevents_food_or_liquid_from_adequately_moving_through_esophagus_into_stomach Bool) ;; {"when_to_set_to_true":"Set to true if the patient's esophageal motility disorder prevents food or liquid from adequately moving through the esophagus into the stomach.","when_to_set_to_false":"Set to false if the patient's esophageal motility disorder does not prevent food or liquid from adequately moving through the esophagus into the stomach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's esophageal motility disorder prevents food or liquid from adequately moving through the esophagus into the stomach.","meaning":"Boolean indicating whether the patient's esophageal motility disorder prevents food or liquid from adequately moving through the esophagus into the stomach."} ;; "the esophageal motility disorder prevents food OR liquid from adequately moving through the esophagus into the stomach"
(declare-const patient_is_exposed_to_foods_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to foods.","when_to_set_to_false":"Set to false if the patient is currently not exposed to foods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to foods.","meaning":"Boolean indicating whether the patient is currently exposed to foods."} ;; "food"
(declare-const patient_is_exposed_to_foods_now@@moves_adequately_through_esophagus_into_stomach Bool) ;; {"when_to_set_to_true":"Set to true if foods to which the patient is currently exposed move adequately through the esophagus into the stomach.","when_to_set_to_false":"Set to false if foods to which the patient is currently exposed do not move adequately through the esophagus into the stomach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether foods move adequately through the esophagus into the stomach.","meaning":"Boolean indicating whether foods move adequately through the esophagus into the stomach."} ;; "food ... adequately moving through the esophagus into the stomach"
(declare-const patient_is_exposed_to_liquid_substance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to liquid substances.","when_to_set_to_false":"Set to false if the patient is currently not exposed to liquid substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to liquid substances.","meaning":"Boolean indicating whether the patient is currently exposed to liquid substances."} ;; "liquid"
(declare-const patient_is_exposed_to_liquid_substance_now@@moves_adequately_through_esophagus_into_stomach Bool) ;; {"when_to_set_to_true":"Set to true if liquid substances to which the patient is currently exposed move adequately through the esophagus into the stomach.","when_to_set_to_false":"Set to false if liquid substances to which the patient is currently exposed do not move adequately through the esophagus into the stomach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether liquid substances move adequately through the esophagus into the stomach.","meaning":"Boolean indicating whether liquid substances move adequately through the esophagus into the stomach."} ;; "liquid ... adequately moving through the esophagus into the stomach"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_esophageal_motility_disorder_now@@prevents_food_or_liquid_from_adequately_moving_through_esophagus_into_stomach
      patient_has_finding_of_esophageal_motility_disorder_now)
:named REQ5_AUXILIARY0)) ;; "the esophageal motility disorder prevents food OR liquid from adequately moving through the esophagus into the stomach"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have esophageal motility disorder AND the disorder prevents food OR liquid from adequately moving through the esophagus into the stomach
(assert
(! (not (and patient_has_finding_of_esophageal_motility_disorder_now@@prevents_food_or_liquid_from_adequately_moving_through_esophagus_into_stomach
             patient_has_finding_of_esophageal_motility_disorder_now))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has esophageal motility disorder) AND (the esophageal motility disorder prevents food OR liquid from adequately moving through the esophagus into the stomach)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any mental disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any mental disorder."} ;; "psychiatric disorder"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@other_than_depression Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a mental disorder and that disorder is not depression.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of a mental disorder and that disorder is depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disorder is other than depression.","meaning":"Boolean indicating whether the patient's current mental disorder diagnosis is for a disorder other than depression."} ;; "psychiatric disorder other than depression"
(declare-const patient_is_under_care_of_psychiatrist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently under the care of a psychiatrist.","when_to_set_to_false":"Set to false if the patient is not currently under the care of a psychiatrist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently under the care of a psychiatrist.","meaning":"Boolean indicating whether the patient is currently under the care of a psychiatrist."} ;; "the patient is under the care of a psychiatrist"
(declare-const patient_is_on_medications_for_psychiatric_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on medications for treatment of a psychiatric disorder.","when_to_set_to_false":"Set to false if the patient is not currently on medications for treatment of a psychiatric disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on medications for treatment of a psychiatric disorder.","meaning":"Boolean indicating whether the patient is currently on medications for treatment of a psychiatric disorder."} ;; "the patient is on medications for treatment of a psychiatric disorder"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@being_treated_with_medications Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a mental disorder and is being treated with medications for that disorder.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of a mental disorder and is not being treated with medications for that disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is being treated with medications for the mental disorder.","meaning":"Boolean indicating whether the patient's current mental disorder diagnosis is being treated with medications."} ;; "the patient is on medications for treatment of a psychiatric disorder"

;; Specific psychiatric disorder examples (non-exhaustive)
(declare-const patient_has_diagnosis_of_somatoform_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of somatoform disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of somatoform disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of somatoform disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of somatoform disorder."} ;; "somatoform disorder"
(declare-const patient_has_diagnosis_of_conversion_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of conversion disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of conversion disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of conversion disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of conversion disorder."} ;; "conversion disorder"
(declare-const patient_has_diagnosis_of_schizophrenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of schizophrenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of schizophrenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of schizophrenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of schizophrenia."} ;; "schizophrenia"
(declare-const patient_has_diagnosis_of_bipolar_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bipolar disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bipolar disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bipolar disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bipolar disorder."} ;; "bipolar disorder"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@other_than_depression
      patient_has_diagnosis_of_mental_disorder_now)
    :named REQ7_AUXILIARY0)) ;; "psychiatric disorder other than depression"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@being_treated_with_medications
      patient_has_diagnosis_of_mental_disorder_now)
    :named REQ7_AUXILIARY1)) ;; "the patient is on medications for treatment of a psychiatric disorder"

;; Non-exhaustive examples: being on medication for these disorders implies being on medication for a psychiatric disorder
(assert
(! (=> (or patient_has_diagnosis_of_somatoform_disorder_now
          patient_has_diagnosis_of_conversion_disorder_now
          patient_has_diagnosis_of_schizophrenia_now
          patient_has_diagnosis_of_bipolar_disorder_now)
        patient_is_on_medications_for_psychiatric_disorder_now)
    :named REQ7_AUXILIARY2)) ;; "with non-exhaustive examples (somatoform disorder, conversion disorder, schizophrenia, bipolar disorder)"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: (the patient has a current psychiatric disorder other than depression) AND (the patient is under the care of a psychiatrist)
(assert
(! (not (and patient_has_diagnosis_of_mental_disorder_now@@other_than_depression
             patient_is_under_care_of_psychiatrist_now))
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a current psychiatric disorder other than depression) AND (the patient is under the care of a psychiatrist)."

;; Component 1: (the patient has a current psychiatric disorder other than depression) AND (the patient is on medications for treatment of a psychiatric disorder)
(assert
(! (not (and patient_has_diagnosis_of_mental_disorder_now@@other_than_depression
             patient_is_on_medications_for_psychiatric_disorder_now))
    :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a current psychiatric disorder other than depression) AND (the patient is on medications for treatment of a psychiatric disorder with non-exhaustive examples (somatoform disorder, conversion disorder, schizophrenia, bipolar disorder))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_metal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to metal (e.g., has metal in the body).","when_to_set_to_false":"Set to false if the patient is not currently exposed to metal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to metal.","meaning":"Boolean indicating whether the patient is currently exposed to metal (i.e., has metal in the body)."} ;; "the patient has the presence of metal in the body"
(declare-const patient_is_exposed_to_metal_now@@is_magnetic_resonance_imaging_compatible_implant Bool) ;; {"when_to_set_to_true":"Set to true if the metal the patient is exposed to is both MRI-compatible and is an implant.","when_to_set_to_false":"Set to false if the metal is not MRI-compatible and/or is not an implant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the metal is MRI-compatible and is an implant.","meaning":"Boolean indicating whether the metal the patient is exposed to is both MRI-compatible and is an implant."} ;; "magnetic resonance imaging-compatible metal implant"
(declare-const documentation_of_device_material_and_safety_reviewed_by_pi_lss_physician_and_mri_technologist Bool) ;; {"when_to_set_to_true":"Set to true if documentation regarding the device material and safety of the device in a 3T scanner has been reviewed and discussed by the Principal Investigator, LSS staff physician, and a magnetic resonance imaging technologist.","when_to_set_to_false":"Set to false if such documentation has not been reviewed and discussed by all three parties.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether such documentation has been reviewed and discussed by all three parties.","meaning":"Boolean indicating whether documentation regarding the device material and safety of the device in a 3T scanner has been reviewed and discussed by the Principal Investigator, LSS staff physician, and a magnetic resonance imaging technologist."} ;; "documentation regarding the device material and safety of the device in a 3T scanner has been reviewed and discussed by the Principal Investigator, LSS staff physician, and a magnetic resonance imaging technologist"
(declare-const patient_has_finding_of_tattoo_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a tattoo of the skin.","when_to_set_to_false":"Set to false if the patient currently does not have a tattoo of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a tattoo of the skin.","meaning":"Boolean indicating whether the patient currently has a tattoo of the skin."} ;; "the patient has a tattoo"
(declare-const patient_has_finding_of_tattoo_of_skin_now@@contains_ferromagnetic_metal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tattoo of the skin contains ferromagnetic metal.","when_to_set_to_false":"Set to false if the patient's tattoo of the skin does not contain ferromagnetic metal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tattoo of the skin contains ferromagnetic metal.","meaning":"Boolean indicating whether the patient's tattoo of the skin contains ferromagnetic metal."} ;; "the patient has a tattoo with ferromagnetic metal"
(declare-const patient_has_finding_of_permanent_makeup_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has permanent makeup.","when_to_set_to_false":"Set to false if the patient currently does not have permanent makeup.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has permanent makeup.","meaning":"Boolean indicating whether the patient currently has permanent makeup."} ;; "the patient has permanent makeup"
(declare-const patient_is_undergoing_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing or is to participate in magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient is not currently undergoing and is not to participate in magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing or is to participate in magnetic resonance imaging.","meaning":"Boolean indicating whether the patient is currently undergoing or is to participate in magnetic resonance imaging."} ;; "the patient is to participate in magnetic resonance imaging"
(declare-const patient_is_undergoing_magnetic_resonance_imaging_now@@performed_in_3t_scanner Bool) ;; {"when_to_set_to_true":"Set to true if the MRI is performed in a 3T scanner.","when_to_set_to_false":"Set to false if the MRI is not performed in a 3T scanner.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the MRI is performed in a 3T scanner.","meaning":"Boolean indicating whether the MRI is performed in a 3T scanner."} ;; "magnetic resonance imaging ... performed in a 3T scanner"
(declare-const patient_is_to_participate_in_functional_magnetic_resonance_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient is to participate in functional magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient is not to participate in functional magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is to participate in functional magnetic resonance imaging.","meaning":"Boolean indicating whether the patient is to participate in functional magnetic resonance imaging."} ;; "the patient is to participate in functional magnetic resonance imaging"
(declare-const patient_has_history_of_occupation_as_metal_worker Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of occupation as a metal worker.","when_to_set_to_false":"Set to false if the patient does not have a history of occupation as a metal worker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of occupation as a metal worker.","meaning":"Boolean indicating whether the patient has a history of occupation as a metal worker."} ;; "the patient was a metal worker as a previous occupation"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive examples for "presence of metal in the body" (prosthesis, electrode, shrapnel, aneurism clip, other medical hardware) are only examples, so we do not enumerate them here, but if any are present, they imply "presence of metal in the body".
;; Non-exhaustive examples for "magnetic resonance imaging-compatible metal implant" (e.g., titanium implant) are only examples, so if present, they imply MRI-compatible metal implant.

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_metal_now@@is_magnetic_resonance_imaging_compatible_implant
      patient_is_exposed_to_metal_now)
:named REQ8_AUXILIARY0)) ;; "magnetic resonance imaging-compatible metal implant"

(assert
(! (=> patient_has_finding_of_tattoo_of_skin_now@@contains_ferromagnetic_metal
      patient_has_finding_of_tattoo_of_skin_now)
:named REQ8_AUXILIARY1)) ;; "tattoo with ferromagnetic metal"

(assert
(! (=> patient_is_undergoing_magnetic_resonance_imaging_now@@performed_in_3t_scanner
      patient_is_undergoing_magnetic_resonance_imaging_now)
:named REQ8_AUXILIARY2)) ;; "MRI performed in a 3T scanner"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: Exclude if (metal in body OR tattoo with ferromagnetic metal OR permanent makeup) AND (MRI OR fMRI OR TMS)
(assert
(! (not
     (and
       (or patient_is_exposed_to_metal_now
           patient_has_finding_of_tattoo_of_skin_now@@contains_ferromagnetic_metal
           patient_has_finding_of_permanent_makeup_now)
       (or patient_is_undergoing_magnetic_resonance_imaging_now
           patient_is_to_participate_in_functional_magnetic_resonance_imaging
           patient_is_undergoing_transcranial_magnetic_stimulation_now)))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has the presence of metal in the body ... OR ... OR ...) AND ((the patient is to participate in magnetic resonance imaging OR ... OR ...))."

;; Component 1: Exclude if (metal worker as previous occupation) AND (MRI OR TMS)
(assert
(! (not
     (and
       patient_has_history_of_occupation_as_metal_worker
       (or patient_is_undergoing_magnetic_resonance_imaging_now
           patient_is_undergoing_transcranial_magnetic_stimulation_now)))
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is also excluded from magnetic resonance imaging OR transcranial magnetic stimulation procedures if the patient was a metal worker as a previous occupation."

;; Exception: NOT excluded from MRI study if MRI-compatible metal implant AND documentation reviewed
(assert
(! (not
     (and
       patient_is_exposed_to_metal_now@@is_magnetic_resonance_imaging_compatible_implant
       documentation_of_device_material_and_safety_reviewed_by_pi_lss_physician_and_mri_technologist
       patient_is_undergoing_magnetic_resonance_imaging_now))
   :named REQ8_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is NOT excluded from magnetic resonance imaging study if the patient has magnetic resonance imaging-compatible metal implant ... AND documentation ... has been reviewed and discussed ..."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_broken_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of broken skin.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of broken skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of broken skin.","meaning":"Boolean indicating whether the patient currently has broken skin."} ;; "broken skin"
(declare-const patient_has_finding_of_broken_skin_now@@in_area_of_transcranial_direct_current_stimulation_stimulating_electrode Bool) ;; {"when_to_set_to_true":"Set to true if the patient's broken skin is located in the area of the transcranial direct current stimulation stimulating electrode.","when_to_set_to_false":"Set to false if the patient's broken skin is not located in the area of the transcranial direct current stimulation stimulating electrode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's broken skin is in the area of the transcranial direct current stimulation stimulating electrode.","meaning":"Boolean indicating whether the patient's broken skin is in the area of the transcranial direct current stimulation stimulating electrode."} ;; "broken skin in the area of the transcranial direct current stimulation stimulating electrode"
(declare-const patient_has_finding_of_broken_skin_now@@in_area_of_transcranial_magnetic_stimulation_stimulating_electrode Bool) ;; {"when_to_set_to_true":"Set to true if the patient's broken skin is located in the area of the transcranial magnetic stimulation stimulating electrode.","when_to_set_to_false":"Set to false if the patient's broken skin is not located in the area of the transcranial magnetic stimulation stimulating electrode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's broken skin is in the area of the transcranial magnetic stimulation stimulating electrode.","meaning":"Boolean indicating whether the patient's broken skin is in the area of the transcranial magnetic stimulation stimulating electrode."} ;; "broken skin in the area of the transcranial magnetic stimulation stimulating electrode"
(declare-const patient_is_to_participate_in_transcranial_direct_current_stimulation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is intended or scheduled to participate in transcranial direct current stimulation.","when_to_set_to_false":"Set to false if the patient is not intended or scheduled to participate in transcranial direct current stimulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is intended or scheduled to participate in transcranial direct current stimulation.","meaning":"Boolean indicating whether the patient is intended or scheduled to participate in transcranial direct current stimulation."} ;; "the patient is to participate in transcranial direct current stimulation"
(declare-const patient_is_to_participate_in_transcranial_magnetic_stimulation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is intended or scheduled to participate in transcranial magnetic stimulation.","when_to_set_to_false":"Set to false if the patient is not intended or scheduled to participate in transcranial magnetic stimulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is intended or scheduled to participate in transcranial magnetic stimulation.","meaning":"Boolean indicating whether the patient is intended or scheduled to participate in transcranial magnetic stimulation."} ;; "the patient is to participate in transcranial magnetic stimulation"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_broken_skin_now@@in_area_of_transcranial_direct_current_stimulation_stimulating_electrode
      patient_has_finding_of_broken_skin_now)
:named REQ9_AUXILIARY0)) ;; "broken skin in the area of the transcranial direct current stimulation stimulating electrode"

(assert
(! (=> patient_has_finding_of_broken_skin_now@@in_area_of_transcranial_magnetic_stimulation_stimulating_electrode
      patient_has_finding_of_broken_skin_now)
:named REQ9_AUXILIARY1)) ;; "broken skin in the area of the transcranial magnetic stimulation stimulating electrode"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (and
         (or patient_has_finding_of_broken_skin_now@@in_area_of_transcranial_direct_current_stimulation_stimulating_electrode
             patient_has_finding_of_broken_skin_now@@in_area_of_transcranial_magnetic_stimulation_stimulating_electrode)
         (or patient_is_to_participate_in_transcranial_direct_current_stimulation
             patient_is_to_participate_in_transcranial_magnetic_stimulation)))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has broken skin in the area of the transcranial direct current stimulation stimulating electrode) OR (the patient has broken skin in the area of the transcranial magnetic stimulation stimulating electrode)) AND ((the patient is to participate in transcranial direct current stimulation) OR (the patient is to participate in transcranial magnetic stimulation))."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_unable_to_coordinate_button_press_or_switch_press_with_swallow_during_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to coordinate button press or switch press with swallow during screening.","when_to_set_to_false":"Set to false if the patient is able to coordinate button press or switch press with swallow during screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to coordinate button press or switch press with swallow during screening.","meaning":"Boolean indicating whether the patient is unable to coordinate button press or switch press with swallow as determined during screening."} ;; "A patient is excluded if the patient is unable to coordinate button press or switch press with swallow as determined during screening."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_unable_to_coordinate_button_press_or_switch_press_with_swallow_during_screening)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is unable to coordinate button press or switch press with swallow as determined during screening."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const internal_medicine_service_has_determined_severity_of_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the Internal Medicine Service has made a determination regarding the severity of the patient's pulmonary disease at the current time.","when_to_set_to_false":"Set to false if the Internal Medicine Service has not made a determination regarding the severity of the patient's pulmonary disease at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Internal Medicine Service has made a determination regarding the severity of the patient's pulmonary disease at the current time.","meaning":"Boolean indicating whether the Internal Medicine Service has made a determination regarding the severity of the patient's pulmonary disease at the current time."} ;; "at the discretion of the Internal Medicine Service"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "predicted value based on sex, age, and height"
(declare-const patient_forced_expiratory_volume_in_one_second_value_recorded_now_withunit_percent_predicted Real) ;; {"when_to_set_to_value":"Set to the patient's current forced expiratory volume in one second (FEV1) as a percent of the predicted value based on sex, age, and height, if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current FEV1 as a percent of predicted is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's forced expiratory volume in one second (FEV1) as a percent of the predicted value based on sex, age, and height, measured at the current time."} ;; "forced expiratory volume in one second < 50 percent of the predicted value based on sex, age, and height"
(declare-const patient_has_diagnosis_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary disease (disorder of lung).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary disease (disorder of lung).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary disease (disorder of lung).","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary disease (disorder of lung)."} ;; "pulmonary disease"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown or not documented at the current time.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "predicted value based on sex"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown or not documented at the current time.","meaning":"Indicates whether the patient's sex is male at the current time."} ;; "predicted value based on sex"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; No additional auxiliary assertions are required, as the definition is directly encoded in the constraint.

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (and
          patient_has_diagnosis_of_disorder_of_lung_now
          internal_medicine_service_has_determined_severity_of_pulmonary_disease_now
          (< patient_forced_expiratory_volume_in_one_second_value_recorded_now_withunit_percent_predicted 50)
      ))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe pulmonary disease, defined in pulmonary testing by forced expiratory volume in one second < 50 percent of the predicted value based on sex, age, and height, at the discretion of the Internal Medicine Service."
