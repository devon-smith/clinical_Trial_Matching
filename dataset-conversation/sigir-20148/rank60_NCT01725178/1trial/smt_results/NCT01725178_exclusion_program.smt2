;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia.","when_to_set_to_false":"Set to false if the patient currently does not have dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia now."} ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@moderate_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia and the dementia is of moderate severity.","when_to_set_to_false":"Set to false if the patient currently has dementia but it is not of moderate severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia is of moderate severity.","meaning":"Boolean indicating whether the patient's current dementia is of moderate severity."} ;; "moderate dementia"
(declare-const patient_has_finding_of_dementia_now@@severe_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia and the dementia is of severe severity.","when_to_set_to_false":"Set to false if the patient currently has dementia but it is not of severe severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia is of severe severity.","meaning":"Boolean indicating whether the patient's current dementia is of severe severity."} ;; "severe dementia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_dementia_now@@moderate_severity
       patient_has_finding_of_dementia_now)
   :named REQ0_AUXILIARY0)) ;; "moderate dementia"

(assert
(! (=> patient_has_finding_of_dementia_now@@severe_severity
       patient_has_finding_of_dementia_now)
   :named REQ0_AUXILIARY1)) ;; "severe dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_dementia_now@@moderate_severity)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate dementia."

(assert
(! (not patient_has_finding_of_dementia_now@@severe_severity)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dementia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_clinical_signs_of_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of depressive disorder.","meaning":"Boolean indicating whether the patient currently has clinical signs of depressive disorder."} ;; "depressive disorder"
(declare-const patient_has_clinical_signs_of_other_primary_psychiatric_disorders_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of other primary psychiatric disorders.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of other primary psychiatric disorders.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of other primary psychiatric disorders.","meaning":"Boolean indicating whether the patient currently has clinical signs of other primary psychiatric disorders."} ;; "other primary psychiatric disorders"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_clinical_signs_of_depressive_disorder_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical signs of depressive disorder."

(assert
  (! (not patient_has_clinical_signs_of_other_primary_psychiatric_disorders_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical signs of other primary psychiatric disorders."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of neoplastic disease."} ;; "neoplastic diseases"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_neoplastic_disease_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neoplastic diseases."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_neurological_deficit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a neurological deficit.","when_to_set_to_false":"Set to false if the patient currently does not have a neurological deficit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neurological deficit.","meaning":"Boolean indicating whether the patient currently has a neurological deficit."} ;; "neurologic deficits"
(declare-const patient_has_finding_of_neurological_deficit_now@@bars_neuropsychological_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current neurological deficit bars neuropsychological examination.","when_to_set_to_false":"Set to false if the patient's current neurological deficit does not bar neuropsychological examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neurological deficit bars neuropsychological examination.","meaning":"Boolean indicating whether the patient's current neurological deficit bars neuropsychological examination."} ;; "neurologic deficits that bar neuropsychological examination"
(declare-const patient_has_finding_of_neurological_deficit_now@@bars_physical_training Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current neurological deficit bars physical training.","when_to_set_to_false":"Set to false if the patient's current neurological deficit does not bar physical training.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neurological deficit bars physical training.","meaning":"Boolean indicating whether the patient's current neurological deficit bars physical training."} ;; "neurologic deficits that bar physical training"
(declare-const patient_has_finding_of_neurological_deficit_now@@bars_cognitive_training Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current neurological deficit bars cognitive training.","when_to_set_to_false":"Set to false if the patient's current neurological deficit does not bar cognitive training.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neurological deficit bars cognitive training.","meaning":"Boolean indicating whether the patient's current neurological deficit bars cognitive training."} ;; "neurologic deficits that bar cognitive training"
(declare-const patient_has_finding_of_musculoskeletal_deficit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a musculoskeletal deficit.","when_to_set_to_false":"Set to false if the patient currently does not have a musculoskeletal deficit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a musculoskeletal deficit.","meaning":"Boolean indicating whether the patient currently has a musculoskeletal deficit."} ;; "musculoskeletal deficits"
(declare-const patient_has_finding_of_musculoskeletal_deficit_now@@bars_neuropsychological_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current musculoskeletal deficit bars neuropsychological examination.","when_to_set_to_false":"Set to false if the patient's current musculoskeletal deficit does not bar neuropsychological examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's musculoskeletal deficit bars neuropsychological examination.","meaning":"Boolean indicating whether the patient's current musculoskeletal deficit bars neuropsychological examination."} ;; "musculoskeletal deficits that bar neuropsychological examination"
(declare-const patient_has_finding_of_musculoskeletal_deficit_now@@bars_physical_training Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current musculoskeletal deficit bars physical training.","when_to_set_to_false":"Set to false if the patient's current musculoskeletal deficit does not bar physical training.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's musculoskeletal deficit bars physical training.","meaning":"Boolean indicating whether the patient's current musculoskeletal deficit bars physical training."} ;; "musculoskeletal deficits that bar physical training"
(declare-const patient_has_finding_of_musculoskeletal_deficit_now@@bars_cognitive_training Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current musculoskeletal deficit bars cognitive training.","when_to_set_to_false":"Set to false if the patient's current musculoskeletal deficit does not bar cognitive training.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's musculoskeletal deficit bars cognitive training.","meaning":"Boolean indicating whether the patient's current musculoskeletal deficit bars cognitive training."} ;; "musculoskeletal deficits that bar cognitive training"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_neurological_deficit_now@@bars_neuropsychological_examination
      patient_has_finding_of_neurological_deficit_now)
   :named REQ3_AUXILIARY0)) ;; "neurologic deficits that bar neuropsychological examination"

(assert
(! (=> patient_has_finding_of_neurological_deficit_now@@bars_physical_training
      patient_has_finding_of_neurological_deficit_now)
   :named REQ3_AUXILIARY1)) ;; "neurologic deficits that bar physical training"

(assert
(! (=> patient_has_finding_of_neurological_deficit_now@@bars_cognitive_training
      patient_has_finding_of_neurological_deficit_now)
   :named REQ3_AUXILIARY2)) ;; "neurologic deficits that bar cognitive training"

(assert
(! (=> patient_has_finding_of_musculoskeletal_deficit_now@@bars_neuropsychological_examination
      patient_has_finding_of_musculoskeletal_deficit_now)
   :named REQ3_AUXILIARY3)) ;; "musculoskeletal deficits that bar neuropsychological examination"

(assert
(! (=> patient_has_finding_of_musculoskeletal_deficit_now@@bars_physical_training
      patient_has_finding_of_musculoskeletal_deficit_now)
   :named REQ3_AUXILIARY4)) ;; "musculoskeletal deficits that bar physical training"

(assert
(! (=> patient_has_finding_of_musculoskeletal_deficit_now@@bars_cognitive_training
      patient_has_finding_of_musculoskeletal_deficit_now)
   :named REQ3_AUXILIARY5)) ;; "musculoskeletal deficits that bar cognitive training"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_neurological_deficit_now@@bars_neuropsychological_examination)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neurologic deficits that bar neuropsychological examination."

(assert
(! (not patient_has_finding_of_neurological_deficit_now@@bars_physical_training)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neurologic deficits that bar physical training."

(assert
(! (not patient_has_finding_of_neurological_deficit_now@@bars_cognitive_training)
   :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neurologic deficits that bar cognitive training."

(assert
(! (not patient_has_finding_of_musculoskeletal_deficit_now@@bars_neuropsychological_examination)
   :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has musculoskeletal deficits that bar neuropsychological examination."

(assert
(! (not patient_has_finding_of_musculoskeletal_deficit_now@@bars_physical_training)
   :named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has musculoskeletal deficits that bar physical training."

(assert
(! (not patient_has_finding_of_musculoskeletal_deficit_now@@bars_cognitive_training)
   :named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has musculoskeletal deficits that bar cognitive training."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "heart disease"
(declare-const patient_has_finding_of_heart_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease and the heart disease is severe.","when_to_set_to_false":"Set to false if the patient currently has heart disease but it is not severe, or if the patient does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart disease is severe.","meaning":"Boolean indicating whether the patient's current heart disease is severe."} ;; "severe heart disease"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_disease_now@@severe
       patient_has_finding_of_heart_disease_now)
   :named REQ4_AUXILIARY0)) ;; "severe heart disease" implies "heart disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_heart_disease_now@@severe)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current estimated glomerular filtration rate (eGFR) in milliliters per minute per 1.73 square meters is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current estimated glomerular filtration rate (eGFR) in milliliters per minute per 1.73 square meters."} ;; "estimated glomerular filtration rate < 35 milliliters per minute per 1.73 square meters"

(declare-const patient_has_diagnosis_of_end_stage_renal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of end stage renal disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of end stage renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of end stage renal disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of end stage renal disease."} ;; "end stage renal disease"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: end stage renal disease is defined by eGFR < 35 ml/min/1.73 m2
(assert
(! (= patient_has_diagnosis_of_end_stage_renal_disease_now
(< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters 35))
:named REQ5_AUXILIARY0)) ;; "end stage renal disease (estimated glomerular filtration rate < 35 milliliters per minute per 1.73 square meters)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_end_stage_renal_disease_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has end stage renal disease (estimated glomerular filtration rate < 35 milliliters per minute per 1.73 square meters)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_severe_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has severe chronic obstructive pulmonary disease."} ;; "severe chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory failure.","meaning":"Boolean indicating whether the patient currently has respiratory failure."} ;; "respiratory failure"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_severe_chronic_obstructive_pulmonary_disease_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe chronic obstructive pulmonary disease."

(assert
(! (not patient_has_finding_of_respiratory_failure_now)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has respiratory failure."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_diabetic_complication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes with complications (complicated diabetes).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes with complications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes with complications.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes with complications."} ;; "complicated diabetes"
(declare-const patient_has_diagnosis_of_decompensated_diabetes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of decompensated diabetes.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of decompensated diabetes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of decompensated diabetes.","meaning":"Boolean indicating whether the patient currently has a diagnosis of decompensated diabetes."} ;; "decompensated diabetes"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_diagnosis_of_diabetic_complication_now
            patient_has_diagnosis_of_decompensated_diabetes_now))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has complicated diabetes) OR (the patient has decompensated diabetes)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peripheral arterial occlusive disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peripheral arterial occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient currently has peripheral arterial occlusive disease."} ;; "peripheral artery disease"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_peripheral_arterial_occlusive_disease_now)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has overt peripheral artery disease."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_can_undergo_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can successfully complete a magnetic resonance imaging procedure now.","when_to_set_to_false":"Set to false if the patient cannot successfully complete a magnetic resonance imaging procedure now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can successfully complete a magnetic resonance imaging procedure now.","meaning":"Boolean indicating whether the patient can successfully complete a magnetic resonance imaging procedure now."} ;; "magnetic resonance scan"
(declare-const patient_can_undergo_magnetic_resonance_imaging_now@@anatomical_site_brain Bool) ;; {"when_to_set_to_true":"Set to true if the patient can successfully complete a magnetic resonance imaging procedure now and the procedure is of the brain.","when_to_set_to_false":"Set to false if the patient cannot successfully complete a magnetic resonance imaging procedure now and/or the procedure is not of the brain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can successfully complete a magnetic resonance imaging procedure of the brain now.","meaning":"Boolean indicating whether the patient can successfully complete a magnetic resonance imaging procedure of the brain now."} ;; "brain magnetic resonance scan"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_can_undergo_magnetic_resonance_imaging_now@@anatomical_site_brain
      patient_can_undergo_magnetic_resonance_imaging_now)
   :named REQ9_AUXILIARY0)) ;; "brain magnetic resonance scan""

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_can_undergo_magnetic_resonance_imaging_now@@anatomical_site_brain)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any inability to successfully complete a brain magnetic resonance scan."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_epilepsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of epilepsy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of epilepsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of epilepsy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of epilepsy."} ;; "epilepsy"
(declare-const patient_has_diagnosis_of_drug_addiction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of drug addiction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of drug addiction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of drug addiction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of drug addiction."} ;; "drug addiction"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (not patient_has_diagnosis_of_epilepsy_now)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has epilepsy."

(assert
  (! (not patient_has_diagnosis_of_drug_addiction_now)
     :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has drug addiction."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has one or more acute diseases.","when_to_set_to_false":"Set to false if the patient currently does not have any acute diseases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any acute diseases.","meaning":"Boolean indicating whether the patient currently has one or more acute diseases."} ;; "the patient has current acute diseases"

(declare-const patient_has_finding_of_injury_of_head_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had head trauma at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had head trauma in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had head trauma in their history.","meaning":"Boolean indicating whether the patient has had head trauma at any time in their history."} ;; "head trauma"

(declare-const patient_has_finding_of_injury_of_head_inthehistory@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had head trauma in their history and the trauma is recent (as defined by study protocol).","when_to_set_to_false":"Set to false if the patient has had head trauma in their history but the trauma is not recent, or if the patient has never had head trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had recent head trauma.\",\"meaning\":\"Boolean indicating whether the patient has had recent head trauma in their history."} ;; "recent head trauma"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_injury_of_head_inthehistory@@recent
       patient_has_finding_of_injury_of_head_inthehistory)
   :named REQ11_AUXILIARY0)) ;; "recent head trauma" implies "head trauma"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (or patient_has_finding_of_acute_disease_now
            patient_has_finding_of_injury_of_head_inthehistory@@recent))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has current acute diseases) OR (the patient has recent head trauma)."
