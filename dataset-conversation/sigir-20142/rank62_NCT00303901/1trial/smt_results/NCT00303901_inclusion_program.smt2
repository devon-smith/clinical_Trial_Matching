;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_tumor_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant tumor of the lung (malignant pulmonary neoplasm).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant tumor of the lung (malignant pulmonary neoplasm).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant tumor of the lung (malignant pulmonary neoplasm).","meaning":"Boolean indicating whether the patient currently has a malignant tumor of the lung (malignant pulmonary neoplasm)." } ;; "malignant pulmonary neoplasm"
(declare-const patient_has_finding_of_malignant_tumor_of_lung_now@@histologically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant tumor of the lung (malignant pulmonary neoplasm) is histologically confirmed.","when_to_set_to_false":"Set to false if the patient's malignant tumor of the lung (malignant pulmonary neoplasm) is not histologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant tumor of the lung (malignant pulmonary neoplasm) is histologically confirmed.","meaning":"Boolean indicating whether the patient's malignant tumor of the lung (malignant pulmonary neoplasm) is histologically confirmed."} ;; "histologically confirmed malignant pulmonary neoplasm"
(declare-const patient_has_finding_of_malignant_tumor_of_lung_now@@cytologically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant tumor of the lung (malignant pulmonary neoplasm) is cytologically confirmed.","when_to_set_to_false":"Set to false if the patient's malignant tumor of the lung (malignant pulmonary neoplasm) is not cytologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant tumor of the lung (malignant pulmonary neoplasm) is cytologically confirmed.","meaning":"Boolean indicating whether the patient's malignant tumor of the lung (malignant pulmonary neoplasm) is cytologically confirmed."} ;; "cytologically confirmed malignant pulmonary neoplasm"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_malignant_tumor_of_lung_now@@histologically_confirmed
         patient_has_finding_of_malignant_tumor_of_lung_now)
     :named REQ0_AUXILIARY0)) ;; "histologically confirmed malignant pulmonary neoplasm" implies "malignant pulmonary neoplasm"

(assert
  (! (=> patient_has_finding_of_malignant_tumor_of_lung_now@@cytologically_confirmed
         patient_has_finding_of_malignant_tumor_of_lung_now)
     :named REQ0_AUXILIARY1)) ;; "cytologically confirmed malignant pulmonary neoplasm" implies "malignant pulmonary neoplasm"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have (histologically confirmed malignant pulmonary neoplasm OR cytologically confirmed malignant pulmonary neoplasm)
(assert
  (! (or patient_has_finding_of_malignant_tumor_of_lung_now@@histologically_confirmed
         patient_has_finding_of_malignant_tumor_of_lung_now@@cytologically_confirmed)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (histologically confirmed malignant pulmonary neoplasm OR cytologically confirmed malignant pulmonary neoplasm)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_lesion_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion of the lung (pulmonary lesion).","when_to_set_to_false":"Set to false if the patient currently does not have a lesion of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lesion of the lung (pulmonary lesion).","meaning":"Boolean indicating whether the patient currently has a lesion of the lung."} ;; "pulmonary lesion"
(declare-const patient_has_finding_of_lesion_of_lung_now@@new_lesion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion of the lung and the lesion is new.","when_to_set_to_false":"Set to false if the patient currently has a lesion of the lung but the lesion is not new.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is new.","meaning":"Boolean indicating whether the patient's current lesion of the lung is new."} ;; "new pulmonary lesion"
(declare-const patient_has_finding_of_lesion_of_lung_now@@accompanied_by_definitive_clinical_features_of_primary_or_metastatic_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current lesion of the lung is accompanied by definitive clinical features of either primary pulmonary disease or metastatic pulmonary disease.","when_to_set_to_false":"Set to false if the patient's current lesion of the lung is not accompanied by definitive clinical features of either primary or metastatic pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is accompanied by definitive clinical features of primary or metastatic pulmonary disease.","meaning":"Boolean indicating whether the patient's current lesion of the lung is accompanied by definitive clinical features of primary or metastatic pulmonary disease."} ;; "definitive clinical features of primary pulmonary disease OR definitive clinical features of metastatic pulmonary disease"
(declare-const patient_has_finding_of_lesion_of_lung_now@@accompanied_by_definitive_imaging_features_of_primary_or_metastatic_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current lesion of the lung is accompanied by definitive imaging features of either primary pulmonary disease or metastatic pulmonary disease.","when_to_set_to_false":"Set to false if the patient's current lesion of the lung is not accompanied by definitive imaging features of either primary or metastatic pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is accompanied by definitive imaging features of primary or metastatic pulmonary disease.","meaning":"Boolean indicating whether the patient's current lesion of the lung is accompanied by definitive imaging features of primary or metastatic pulmonary disease."} ;; "definitive imaging features of primary pulmonary disease OR definitive imaging features of metastatic pulmonary disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient may have (new pulmonary lesion with (definitive clinical features of primary pulmonary disease OR definitive clinical features of metastatic pulmonary disease) AND (definitive imaging features of primary pulmonary disease OR definitive imaging features of metastatic pulmonary disease)).
(assert
  (! (and patient_has_finding_of_lesion_of_lung_now@@new_lesion
          patient_has_finding_of_lesion_of_lung_now@@accompanied_by_definitive_clinical_features_of_primary_or_metastatic_pulmonary_disease
          patient_has_finding_of_lesion_of_lung_now@@accompanied_by_definitive_imaging_features_of_primary_or_metastatic_pulmonary_disease)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may have (new pulmonary lesion with (definitive clinical features of primary pulmonary disease OR definitive clinical features of metastatic pulmonary disease) AND (definitive imaging features of primary pulmonary disease OR definitive imaging features of metastatic pulmonary disease))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_imaging_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has imaging findings.","when_to_set_to_false":"Set to false if the patient currently does not have imaging findings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has imaging findings.","meaning":"Boolean indicating whether the patient currently has imaging findings."} ;; "imaging findings"
(declare-const patient_has_finding_of_imaging_finding_now@@compatible_with_localized_treatment_failure_after_prior_cryotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current imaging findings are compatible with localized treatment failure after prior cryotherapy.","when_to_set_to_false":"Set to false if the patient's current imaging findings are not compatible with localized treatment failure after prior cryotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current imaging findings are compatible with localized treatment failure after prior cryotherapy.","meaning":"Boolean indicating whether the patient's current imaging findings are compatible with localized treatment failure after prior cryotherapy."} ;; "imaging findings compatible with localized treatment failure after prior cryotherapy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_imaging_finding_now@@compatible_with_localized_treatment_failure_after_prior_cryotherapy
         patient_has_finding_of_imaging_finding_now)
     :named REQ2_AUXILIARY0)) ;; "the patient may have imaging findings compatible with localized treatment failure after prior cryotherapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_imaging_finding_now@@compatible_with_localized_treatment_failure_after_prior_cryotherapy
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient may have imaging findings compatible with localized treatment failure after prior cryotherapy"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_lung_mass_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary (lung) mass.","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary (lung) mass.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary (lung) mass.","meaning":"Boolean indicating whether the patient currently has a pulmonary (lung) mass."} ;; "pulmonary mass"
(declare-const patient_has_finding_of_lung_mass_now@@distinct Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary mass is distinct.","when_to_set_to_false":"Set to false if the patient's pulmonary mass is not distinct.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary mass is distinct.","meaning":"Boolean indicating whether the patient's pulmonary mass is distinct."} ;; "distinct measurable pulmonary mass"
(declare-const patient_has_finding_of_lung_mass_now@@measurable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary mass is measurable.","when_to_set_to_false":"Set to false if the patient's pulmonary mass is not measurable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary mass is measurable.","meaning":"Boolean indicating whether the patient's pulmonary mass is measurable."} ;; "distinct measurable pulmonary mass"
(declare-const patient_has_finding_of_lung_mass_now@@amenable_to_cryotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary mass is amenable to cryotherapy.","when_to_set_to_false":"Set to false if the patient's pulmonary mass is not amenable to cryotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary mass is amenable to cryotherapy.","meaning":"Boolean indicating whether the patient's pulmonary mass is amenable to cryotherapy."} ;; "distinct measurable pulmonary mass amenable to cryotherapy"
(declare-const patient_has_finding_of_pleural_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pleural effusion.","when_to_set_to_false":"Set to false if the patient currently does not have pleural effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleural effusion.","meaning":"Boolean indicating whether the patient currently has pleural effusion."} ;; "pleural effusion"
(declare-const patient_has_finding_of_pleural_effusion_now@@malignant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pleural effusion is malignant.","when_to_set_to_false":"Set to false if the patient's pleural effusion is not malignant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pleural effusion is malignant.","meaning":"Boolean indicating whether the patient's pleural effusion is malignant."} ;; "malignant pleural effusion"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for pleural effusion implies stem variable
(assert
  (! (=> patient_has_finding_of_pleural_effusion_now@@malignant
         patient_has_finding_of_pleural_effusion_now)
     :named REQ3_AUXILIARY0)) ;; "malignant pleural effusion only if (the patient has distinct measurable pulmonary mass amenable to cryotherapy)"

;; Qualifier variables for lung mass imply stem variable
(assert
  (! (=> patient_has_finding_of_lung_mass_now@@distinct
         patient_has_finding_of_lung_mass_now)
     :named REQ3_AUXILIARY1)) ;; "distinct measurable pulmonary mass amenable to cryotherapy"

(assert
  (! (=> patient_has_finding_of_lung_mass_now@@measurable
         patient_has_finding_of_lung_mass_now)
     :named REQ3_AUXILIARY2)) ;; "distinct measurable pulmonary mass amenable to cryotherapy"

(assert
  (! (=> patient_has_finding_of_lung_mass_now@@amenable_to_cryotherapy
         patient_has_finding_of_lung_mass_now)
     :named REQ3_AUXILIARY3)) ;; "distinct measurable pulmonary mass amenable to cryotherapy"

;; ===================== Constraint Assertions (REQ 3) =====================
;; If the patient has malignant pleural effusion, then must have a distinct, measurable pulmonary mass amenable to cryotherapy
(assert
  (! (=> patient_has_finding_of_pleural_effusion_now@@malignant
         (and patient_has_finding_of_lung_mass_now@@distinct
              patient_has_finding_of_lung_mass_now@@measurable
              patient_has_finding_of_lung_mass_now@@amenable_to_cryotherapy))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may have malignant pleural effusion only if (the patient has distinct measurable pulmonary mass amenable to cryotherapy)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_metastatic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has metastatic disease.","when_to_set_to_false":"Set to false if the patient currently does not have metastatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metastatic disease.","meaning":"Boolean indicating whether the patient currently has metastatic disease."} ;; "if the patient has metastatic disease"
(declare-const patient_has_undergone_excision_of_neoplasm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone excision (resection) of a neoplasm.","when_to_set_to_false":"Set to false if the patient has not currently undergone excision (resection) of a neoplasm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone excision (resection) of a neoplasm.","meaning":"Boolean indicating whether the patient has currently undergone excision (resection) of a neoplasm."} ;; "primary tumor resection"
(declare-const patient_has_finding_of_primary_tumor_controlled_by_other_therapies_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has primary tumor control achieved by therapies other than resection.","when_to_set_to_false":"Set to false if the patient currently does not have primary tumor control achieved by therapies other than resection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has primary tumor control achieved by therapies other than resection.","meaning":"Boolean indicating whether the patient currently has primary tumor control achieved by therapies other than resection."} ;; "primary tumor control by other therapies"
(declare-const patient_has_finding_of_widespread_metastatic_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has widespread metastatic malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have widespread metastatic malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has widespread metastatic malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has widespread metastatic malignant neoplastic disease."} ;; "other widespread metastatic disease is evident"
(declare-const patient_has_finding_of_multiple_hepatic_metastases_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has multiple hepatic metastases.","when_to_set_to_false":"Set to false if the patient currently does not have multiple hepatic metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has multiple hepatic metastases.","meaning":"Boolean indicating whether the patient currently has multiple hepatic metastases."} ;; "multiple hepatic metastases"
(declare-const patient_has_finding_of_multiple_brain_metastases_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has multiple brain metastases.","when_to_set_to_false":"Set to false if the patient currently does not have multiple brain metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has multiple brain metastases.","meaning":"Boolean indicating whether the patient currently has multiple brain metastases."} ;; "multiple brain metastases"
(declare-const patient_has_finding_of_lung_mass_now@@amenable_to_cryotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary mass is amenable to cryotherapy.","when_to_set_to_false":"Set to false if the patient's pulmonary mass is not amenable to cryotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary mass is amenable to cryotherapy.","meaning":"Boolean indicating whether the patient's pulmonary mass is amenable to cryotherapy."} ;; "each pulmonary mass is amenable to computed tomography-guided percutaneous cryotherapy approach"
(declare-const patient_has_finding_of_hilar_mass_now@@amenable_to_cryotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hilar mass that is amenable to computed tomography-guided percutaneous cryotherapy.","when_to_set_to_false":"Set to false if the patient currently does not have a hilar mass that is amenable to computed tomography-guided percutaneous cryotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hilar mass that is amenable to computed tomography-guided percutaneous cryotherapy.","meaning":"Boolean indicating whether the patient currently has a hilar mass that is amenable to computed tomography-guided percutaneous cryotherapy."} ;; "each hilar mass is amenable to computed tomography-guided percutaneous cryotherapy approach"
(declare-const patient_has_finding_of_mediastinal_mass_now@@amenable_to_cryotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mediastinal mass that is amenable to computed tomography-guided percutaneous cryotherapy.","when_to_set_to_false":"Set to false if the patient currently does not have a mediastinal mass that is amenable to computed tomography-guided percutaneous cryotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mediastinal mass that is amenable to computed tomography-guided percutaneous cryotherapy.","meaning":"Boolean indicating whether the patient currently has a mediastinal mass that is amenable to computed tomography-guided percutaneous cryotherapy."} ;; "each mediastinal mass is amenable to computed tomography-guided percutaneous cryotherapy approach"
(declare-const patient_has_finding_of_chest_wall_mass_now@@amenable_to_cryotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chest wall mass that is amenable to computed tomography-guided percutaneous cryotherapy.","when_to_set_to_false":"Set to false if the patient currently does not have a chest wall mass that is amenable to computed tomography-guided percutaneous cryotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chest wall mass that is amenable to computed tomography-guided percutaneous cryotherapy.","meaning":"Boolean indicating whether the patient currently has a chest wall mass that is amenable to computed tomography-guided percutaneous cryotherapy."} ;; "each chest wall mass is amenable to computed tomography-guided percutaneous cryotherapy approach"
(declare-const patient_mass_of_body_structure_value_recorded_now_withunit_count Int) ;; {"when_to_set_to_value":"Set to the count value if the number of masses of body structure currently targeted for study therapy is known.","when_to_set_to_null":"Set to null if the count is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of masses of body structure currently targeted for study therapy."} ;; "number of targeted masses for study therapy"
(declare-const patient_mass_of_body_structure_value_recorded_now_withunit_cm Real) ;; {"when_to_set_to_value":"Set to the measured average diameter in centimeters if available for each target mass of body structure currently present.","when_to_set_to_null":"Set to null if the average diameter is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the average diameter in centimeters of each target mass of body structure currently present."} ;; "average diameter > 1 cm AND average diameter < 10 cm"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply the umbrella term for widespread metastatic disease
(assert
  (! (=> (or patient_has_finding_of_multiple_hepatic_metastases_now
            patient_has_finding_of_multiple_brain_metastases_now)
         patient_has_finding_of_widespread_metastatic_malignant_neoplastic_disease_now)
     :named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (multiple hepatic metastases OR multiple brain metastases)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: If metastatic disease, must have (primary tumor resection OR primary tumor control by other therapies)
(assert
  (! (=> patient_has_finding_of_metastatic_disease_now
         (or patient_has_undergone_excision_of_neoplasm_now
             patient_has_finding_of_primary_tumor_controlled_by_other_therapies_now))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has (primary tumor resection OR primary tumor control by other therapies)"

;; Component 1: If metastatic disease, must NOT have other widespread metastatic disease evident
(assert
  (! (=> patient_has_finding_of_metastatic_disease_now
         (not patient_has_finding_of_widespread_metastatic_malignant_neoplastic_disease_now))
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT other widespread metastatic disease is evident"

;; Component 2: If metastatic disease, each pulmonary mass must be amenable to CT-guided percutaneous cryotherapy
(assert
  (! (=> patient_has_finding_of_metastatic_disease_now
         patient_has_finding_of_lung_mass_now@@amenable_to_cryotherapy)
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "each pulmonary mass is amenable to computed tomography-guided percutaneous cryotherapy approach"

;; Component 3: If metastatic disease, number of targeted masses for study therapy ≤ 5
(assert
  (! (=> patient_has_finding_of_metastatic_disease_now
         (<= patient_mass_of_body_structure_value_recorded_now_withunit_count 5))
     :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "number of targeted masses for study therapy ≤ 5"

;; Component 4: If metastatic disease, each target mass is defined as (pulmonary mass OR hilar mass OR mediastinal mass OR chest wall mass) AND average diameter > 1 cm AND average diameter < 10 cm
(assert
  (! (=> patient_has_finding_of_metastatic_disease_now
         (and
           (or patient_has_finding_of_lung_mass_now@@amenable_to_cryotherapy
               patient_has_finding_of_hilar_mass_now@@amenable_to_cryotherapy
               patient_has_finding_of_mediastinal_mass_now@@amenable_to_cryotherapy
               patient_has_finding_of_chest_wall_mass_now@@amenable_to_cryotherapy)
           (> patient_mass_of_body_structure_value_recorded_now_withunit_cm 1.0)
           (< patient_mass_of_body_structure_value_recorded_now_withunit_cm 10.0)))
     :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "each target mass is defined as (pulmonary mass OR hilar mass OR mediastinal mass OR chest wall mass) AND average diameter > 1 cm AND average diameter < 10 cm"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "the patient must have (unresectable disease by surgical consultation OR refused surgical options)"
(declare-const patient_has_finding_of_disease_now@@unresectable_by_surgical_consultation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the disease is unresectable as determined by surgical consultation.","when_to_set_to_false":"Set to false if the patient currently has a disease and the disease is not unresectable as determined by surgical consultation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is unresectable by surgical consultation.","meaning":"Boolean indicating whether the patient's current disease is unresectable by surgical consultation."} ;; "unresectable disease by surgical consultation"
(declare-const patient_has_finding_of_disease_now@@refused_surgical_options Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the patient has refused surgical options for the disease.","when_to_set_to_false":"Set to false if the patient currently has a disease and the patient has not refused surgical options for the disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has refused surgical options for the disease.","meaning":"Boolean indicating whether the patient with current disease has refused surgical options."} ;; "refused surgical options"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable: unresectable by surgical consultation
(assert
  (! (=> patient_has_finding_of_disease_now@@unresectable_by_surgical_consultation
         patient_has_finding_of_disease_now)
     :named REQ5_AUXILIARY0)) ;; "unresectable disease by surgical consultation" implies "disease"

;; Qualifier variable implies stem variable: refused surgical options
(assert
  (! (=> patient_has_finding_of_disease_now@@refused_surgical_options
         patient_has_finding_of_disease_now)
     :named REQ5_AUXILIARY1)) ;; "refused surgical options" implies "disease"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must have (unresectable disease by surgical consultation OR refused surgical options).
(assert
  (! (or patient_has_finding_of_disease_now@@unresectable_by_surgical_consultation
         patient_has_finding_of_disease_now@@refused_surgical_options)
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have (unresectable disease by surgical consultation OR refused surgical options)"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_neoplasm_of_thorax_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of neoplasm of the thorax (thoracic tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of neoplasm of the thorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of neoplasm of the thorax.","meaning":"Boolean indicating whether the patient currently has a diagnosis of neoplasm of the thorax."} ;; "thoracic tumors"
(declare-const patient_has_undergone_ct_without_contrast_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a nonenhanced computed tomography (CT) scan within the past 6 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone a nonenhanced computed tomography (CT) scan within the past 6 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a nonenhanced computed tomography (CT) scan within the past 6 weeks.","meaning":"Boolean indicating whether the patient has undergone a nonenhanced computed tomography (CT) scan within the past 6 weeks."} ;; "nonenhanced computed tomography scan"
(declare-const patient_has_undergone_ct_without_contrast_inthepast6weeks@@performed_at_4_to_5_mm_increments Bool) ;; {"when_to_set_to_true":"Set to true if the nonenhanced CT scan within the past 6 weeks was performed at 4-5 mm increments.","when_to_set_to_false":"Set to false if the nonenhanced CT scan within the past 6 weeks was not performed at 4-5 mm increments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nonenhanced CT scan within the past 6 weeks was performed at 4-5 mm increments.","meaning":"Boolean indicating whether the nonenhanced CT scan within the past 6 weeks was performed at 4-5 mm increments."} ;; "done at 4-5 mm increments"
(declare-const patient_has_undergone_ct_without_contrast_inthepast6weeks@@has_available_soft_tissue_windows Bool) ;; {"when_to_set_to_true":"Set to true if the nonenhanced CT scan within the past 6 weeks has available soft tissue windows.","when_to_set_to_false":"Set to false if the nonenhanced CT scan within the past 6 weeks does not have available soft tissue windows.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nonenhanced CT scan within the past 6 weeks has available soft tissue windows.","meaning":"Boolean indicating whether the nonenhanced CT scan within the past 6 weeks has available soft tissue windows."} ;; "available soft tissue windows"
(declare-const patient_has_undergone_ct_without_contrast_inthepast6weeks@@has_available_mediastinal_windows Bool) ;; {"when_to_set_to_true":"Set to true if the nonenhanced CT scan within the past 6 weeks has available mediastinal windows.","when_to_set_to_false":"Set to false if the nonenhanced CT scan within the past 6 weeks does not have available mediastinal windows.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nonenhanced CT scan within the past 6 weeks has available mediastinal windows.","meaning":"Boolean indicating whether the nonenhanced CT scan within the past 6 weeks has available mediastinal windows."} ;; "available mediastinal windows"
(declare-const patient_has_undergone_ct_with_contrast_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an enhanced computed tomography (CT) scan within the past 6 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone an enhanced computed tomography (CT) scan within the past 6 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an enhanced computed tomography (CT) scan within the past 6 weeks.","meaning":"Boolean indicating whether the patient has undergone an enhanced computed tomography (CT) scan within the past 6 weeks."} ;; "enhanced computed tomography scan"
(declare-const patient_has_undergone_ct_with_contrast_inthepast6weeks@@performed_at_4_to_5_mm_increments Bool) ;; {"when_to_set_to_true":"Set to true if the enhanced CT scan within the past 6 weeks was performed at 4-5 mm increments.","when_to_set_to_false":"Set to false if the enhanced CT scan within the past 6 weeks was not performed at 4-5 mm increments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the enhanced CT scan within the past 6 weeks was performed at 4-5 mm increments.","meaning":"Boolean indicating whether the enhanced CT scan within the past 6 weeks was performed at 4-5 mm increments."} ;; "done at 4-5 mm increments"
(declare-const patient_has_undergone_ct_with_contrast_inthepast6weeks@@has_available_soft_tissue_windows Bool) ;; {"when_to_set_to_true":"Set to true if the enhanced CT scan within the past 6 weeks has available soft tissue windows.","when_to_set_to_false":"Set to false if the enhanced CT scan within the past 6 weeks does not have available soft tissue windows.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the enhanced CT scan within the past 6 weeks has available soft tissue windows.","meaning":"Boolean indicating whether the enhanced CT scan within the past 6 weeks has available soft tissue windows."} ;; "available soft tissue windows"
(declare-const patient_has_undergone_ct_with_contrast_inthepast6weeks@@has_available_mediastinal_windows Bool) ;; {"when_to_set_to_true":"Set to true if the enhanced CT scan within the past 6 weeks has available mediastinal windows.","when_to_set_to_false":"Set to false if the enhanced CT scan within the past 6 weeks does not have available mediastinal windows.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the enhanced CT scan within the past 6 weeks has available mediastinal windows.","meaning":"Boolean indicating whether the enhanced CT scan within the past 6 weeks has available mediastinal windows."} ;; "available mediastinal windows"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables (nonenhanced CT)
(assert
  (! (=> patient_has_undergone_ct_without_contrast_inthepast6weeks@@performed_at_4_to_5_mm_increments
         patient_has_undergone_ct_without_contrast_inthepast6weeks)
     :named REQ6_AUXILIARY0)) ;; "nonenhanced CT scan performed at 4-5 mm increments"

(assert
  (! (=> patient_has_undergone_ct_without_contrast_inthepast6weeks@@has_available_soft_tissue_windows
         patient_has_undergone_ct_without_contrast_inthepast6weeks)
     :named REQ6_AUXILIARY1)) ;; "nonenhanced CT scan has available soft tissue windows"

(assert
  (! (=> patient_has_undergone_ct_without_contrast_inthepast6weeks@@has_available_mediastinal_windows
         patient_has_undergone_ct_without_contrast_inthepast6weeks)
     :named REQ6_AUXILIARY2)) ;; "nonenhanced CT scan has available mediastinal windows"

;; Qualifier variables imply corresponding stem variables (enhanced CT)
(assert
  (! (=> patient_has_undergone_ct_with_contrast_inthepast6weeks@@performed_at_4_to_5_mm_increments
         patient_has_undergone_ct_with_contrast_inthepast6weeks)
     :named REQ6_AUXILIARY3)) ;; "enhanced CT scan performed at 4-5 mm increments"

(assert
  (! (=> patient_has_undergone_ct_with_contrast_inthepast6weeks@@has_available_soft_tissue_windows
         patient_has_undergone_ct_with_contrast_inthepast6weeks)
     :named REQ6_AUXILIARY4)) ;; "enhanced CT scan has available soft tissue windows"

(assert
  (! (=> patient_has_undergone_ct_with_contrast_inthepast6weeks@@has_available_mediastinal_windows
         patient_has_undergone_ct_with_contrast_inthepast6weeks)
     :named REQ6_AUXILIARY5)) ;; "enhanced CT scan has available mediastinal windows"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must have had (nonenhanced CT scan AND enhanced CT scan) within the past 6 weeks done at 4-5 mm increments with available soft tissue windows AND available mediastinal windows to assess size AND extent of all thoracic tumors.
(assert
  (! (and
        patient_has_diagnosis_of_neoplasm_of_thorax_now
        (and patient_has_undergone_ct_without_contrast_inthepast6weeks
             patient_has_undergone_ct_without_contrast_inthepast6weeks@@performed_at_4_to_5_mm_increments
             patient_has_undergone_ct_without_contrast_inthepast6weeks@@has_available_soft_tissue_windows
             patient_has_undergone_ct_without_contrast_inthepast6weeks@@has_available_mediastinal_windows)
        (and patient_has_undergone_ct_with_contrast_inthepast6weeks
             patient_has_undergone_ct_with_contrast_inthepast6weeks@@performed_at_4_to_5_mm_increments
             patient_has_undergone_ct_with_contrast_inthepast6weeks@@has_available_soft_tissue_windows
             patient_has_undergone_ct_with_contrast_inthepast6weeks@@has_available_mediastinal_windows)
     )
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had (nonenhanced computed tomography scan AND enhanced computed tomography scan) within the past 6 weeks done at 4-5 mm increments with available soft tissue windows AND available mediastinal windows to assess size AND extent of all thoracic tumors."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_undergone_positron_emission_tomography_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a positron emission tomography (PET) scan within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone a positron emission tomography (PET) scan within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a positron emission tomography (PET) scan within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone a positron emission tomography (PET) scan within the past 6 months."} ;; "positron emission tomography (PET) scan within the past 6 months"
(declare-const patient_has_undergone_positron_emission_tomography_inthepast6months@@notes_correlation_with_above_computed_tomography_locations Bool) ;; {"when_to_set_to_true":"Set to true if the PET scan notes the correlation with the above computed tomography (CT) locations.","when_to_set_to_false":"Set to false if the PET scan does not note the correlation with the above computed tomography (CT) locations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PET scan notes the correlation with the above CT locations.","meaning":"Boolean indicating whether the PET scan notes the correlation with the above CT locations."} ;; "noting the correlation with the above computed tomography (CT) locations"
(declare-const patient_has_undergone_positron_emission_tomography_inthepast6months@@not_already_obtained_by_combined_positron_emission_tomography_with_computed_tomography_scanner Bool) ;; {"when_to_set_to_true":"Set to true if the PET scan was not already obtained by a combined positron emission tomography/computed tomography (PET/CT) scanner.","when_to_set_to_false":"Set to false if the PET scan was already obtained by a combined PET/CT scanner.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PET scan was already obtained by a combined PET/CT scanner.","meaning":"Boolean indicating whether the PET scan was not already obtained by a combined PET/CT scanner."} ;; "if not already obtained by a combined positron emission tomography/computed tomography (PET/CT) scanner"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_positron_emission_tomography_inthepast6months@@notes_correlation_with_above_computed_tomography_locations
         patient_has_undergone_positron_emission_tomography_inthepast6months)
     :named REQ7_AUXILIARY0)) ;; "noting the correlation with the above computed tomography (CT) locations"

(assert
  (! (=> patient_has_undergone_positron_emission_tomography_inthepast6months@@not_already_obtained_by_combined_positron_emission_tomography_with_computed_tomography_scanner
         patient_has_undergone_positron_emission_tomography_inthepast6months)
     :named REQ7_AUXILIARY1)) ;; "if not already obtained by a combined positron emission tomography/computed tomography (PET/CT) scanner"

;; ===================== Constraint Assertions (REQ 7) =====================
;; To be included, the patient must have had a PET scan within the past 6 months noting the correlation with the above CT locations, if not already obtained by a combined PET/CT scanner.
(assert
  (! (or
        ;; If PET/CT scan was already obtained, requirement is satisfied
        (not patient_has_undergone_positron_emission_tomography_inthepast6months@@not_already_obtained_by_combined_positron_emission_tomography_with_computed_tomography_scanner)
        ;; Otherwise, must have PET scan within 6 months AND notes correlation with above CT locations
        (and patient_has_undergone_positron_emission_tomography_inthepast6months
             patient_has_undergone_positron_emission_tomography_inthepast6months@@notes_correlation_with_above_computed_tomography_locations))
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have had a positron emission tomography (PET) scan within the past 6 months noting the correlation with the above computed tomography (CT) locations, if not already obtained by a combined positron emission tomography/computed tomography (PET/CT) scanner."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_kps_karnofsky_performance_status_score_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured Karnofsky performance status score (percent) if recorded now.","when_to_set_to_null":"Set to null if no Karnofsky performance status score is recorded now or the value is indeterminate.","meaning":"Numeric percent value representing the patient's Karnofsky performance status score recorded now."} ;; "Karnofsky performance status > 60% AND Karnofsky performance status ≤ 100%"
(declare-const patient_who_performance_status_finding_value_recorded_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the measured WHO performance status score (integer) if recorded now.","when_to_set_to_null":"Set to null if no WHO performance status score is recorded now or the value is indeterminate.","meaning":"Numeric integer value representing the patient's WHO performance status score recorded now."} ;; "World Health Organization (WHO) performance status 0-2"
(declare-const patient_ecog_performance_status_value_recorded_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the measured ECOG performance status score (integer) if recorded now.","when_to_set_to_null":"Set to null if no ECOG performance status score is recorded now or the value is indeterminate.","meaning":"Numeric integer value representing the patient's ECOG performance status score recorded now."} ;; "Eastern Cooperative Oncology Group (ECOG) performance status 0-2"
(declare-const patient_zubrod_performance_status_value_recorded_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the measured Zubrod performance status score (integer) if recorded now.","when_to_set_to_null":"Set to null if no Zubrod performance status score is recorded now or the value is indeterminate.","meaning":"Numeric integer value representing the patient's Zubrod performance status score recorded now."} ;; "Zubrod performance status 0-2"

;; ===================== Constraint Assertions (REQ 8) =====================
;; To be included, the patient must have (Karnofsky performance status > 60% AND Karnofsky performance status ≤ 100%) OR (World Health Organization (WHO) performance status 0-2) OR (Eastern Cooperative Oncology Group (ECOG) performance status 0-2) OR (Zubrod performance status 0-2).
(assert
  (! (or (and (> patient_kps_karnofsky_performance_status_score_value_recorded_now_withunit_percent 60.0)
              (<= patient_kps_karnofsky_performance_status_score_value_recorded_now_withunit_percent 100.0))
         (and (<= 0 patient_who_performance_status_finding_value_recorded_now_withunit_integer)
              (<= patient_who_performance_status_finding_value_recorded_now_withunit_integer 2))
         (and (<= 0 patient_ecog_performance_status_value_recorded_now_withunit_integer)
              (<= patient_ecog_performance_status_value_recorded_now_withunit_integer 2))
         (and (<= 0 patient_zubrod_performance_status_value_recorded_now_withunit_integer)
              (<= patient_zubrod_performance_status_value_recorded_now_withunit_integer 2)))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's forced expiratory volume in one second (FEV1) as percent of predicted is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current FEV1 as percent of predicted."} ;; "forced expiratory volume in one second (FEV1)"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (> patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted 30.0)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have forced expiratory volume in one second (FEV1) > 30% of predicted."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_carbon_monoxide_diffusing_capacity_measurement_value_recorded_now_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the measured percent of predicted value if a current DLCO measurement is available for the patient.","when_to_set_to_null":"Set to null if no current DLCO measurement as percent of predicted is available or the value is indeterminate.","meaning":"Numeric percent of predicted representing the patient's current diffusing capacity of the lung for carbon monoxide (DLCO)."} ;; "diffusing capacity of the lung for carbon monoxide > 40% of predicted"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (> patient_carbon_monoxide_diffusing_capacity_measurement_value_recorded_now_withunit_percent_of_predicted 40.0)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (diffusing capacity of the lung for carbon monoxide > 40% of predicted)."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count is recorded now in number per cubic millimeter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count measured in number per cubic millimeter."} ;; "platelet count"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (>= patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter 70000)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (platelet count ≥ 70,000 per cubic millimeter)."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_international_normalized_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured INR value if a numeric measurement of the patient's international normalized ratio is recorded now.","when_to_set_to_null":"Set to null if no such INR measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current international normalized ratio (INR)."} ;; "international normalized ratio"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (< patient_international_normalized_ratio_value_recorded_now_withunit_ratio 1.5)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (international normalized ratio < 1.5)."

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const patient_has_finding_of_bleeding_diathesis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bleeding diathesis.","when_to_set_to_false":"Set to false if the patient currently does not have bleeding diathesis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bleeding diathesis.","meaning":"Boolean indicating whether the patient currently has bleeding diathesis."} ;; "bleeding diathesis"
(declare-const patient_international_normalized_ratio_value_recorded_now_withunit_ratio@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coagulopathy is considered uncontrolled based on clinical criteria (e.g., INR above threshold, not corrected by treatment).","when_to_set_to_false":"Set to false if the patient's coagulopathy is controlled (e.g., INR within acceptable range or corrected by treatment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coagulopathy is uncontrolled.","meaning":"Boolean indicating whether the patient's coagulopathy is uncontrolled."} ;; "uncontrolled coagulopathy"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable for uncontrolled coagulopathy implies the patient has coagulopathy (if such a stem variable exists, but not declared here)
;; No additional auxiliary assertions needed for this requirement.

;; ===================== Constraint Assertions (REQ 13) =====================
;; Component 0: To be included, the patient must NOT have (uncontrolled coagulopathy) AND NOT have (bleeding diathesis).
(assert
  (! (and (not patient_international_normalized_ratio_value_recorded_now_withunit_ratio@@uncontrolled)
          (not patient_has_finding_of_bleeding_diathesis_now))
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (uncontrolled coagulopathy) AND NOT have (bleeding diathesis)."

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient must not be pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient must not be nursing"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Component 0: To be included, the patient must not be pregnant or the patient must not be nursing.
(assert
  (! (or (not patient_is_pregnant_now)
         (not patient_is_breastfeeding_now))
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not be pregnant or the patient must not be nursing."

;; ===================== Declarations for the criterion (REQ 15) =====================
(declare-const patient_has_pregnancy_test_result_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented pregnancy test result.","when_to_set_to_false":"Set to false if the patient currently does not have a documented pregnancy test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented pregnancy test result.","meaning":"Boolean indicating whether the patient currently has a documented pregnancy test result."} ;; "the patient must have a negative pregnancy test"
(declare-const pregnancy_test_result_value_now_withunit_binary Int) ;; {"when_to_set_to_value":"Set to 0 if the patient's current pregnancy test result is negative; set to 1 if positive.","when_to_set_to_null":"Set to null if the pregnancy test result is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the result of the patient's current pregnancy test, encoded as a binary value (0 for negative, 1 for positive)."} ;; "negative pregnancy test"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (and patient_has_pregnancy_test_result_now
          (= pregnancy_test_result_value_now_withunit_binary 0))
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (negative pregnancy test)."

;; ===================== Declarations for the criterion (REQ 16) =====================
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congestive heart failure is uncontrolled.","when_to_set_to_false":"Set to false if the patient's congestive heart failure is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure is uncontrolled.","meaning":"Boolean indicating whether the patient's congestive heart failure is uncontrolled."} ;; "uncontrolled congestive heart failure"
(declare-const patient_has_diagnosis_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of angina pectoris.","meaning":"Boolean indicating whether the patient currently has a diagnosis of angina pectoris."} ;; "angina pectoris"
(declare-const patient_has_diagnosis_of_angina_pectoris_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's angina pectoris is uncontrolled.","when_to_set_to_false":"Set to false if the patient's angina pectoris is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's angina pectoris is uncontrolled.","meaning":"Boolean indicating whether the patient's angina pectoris is uncontrolled."} ;; "uncontrolled angina pectoris"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of myocardial infarction in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of myocardial infarction."} ;; "myocardial infarction"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction occurred within 6 months prior to study entry.","when_to_set_to_false":"Set to false if the patient's myocardial infarction did not occur within 6 months prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myocardial infarction occurred within 6 months prior to study entry.","meaning":"Boolean indicating whether the patient's myocardial infarction occurred within 6 months prior to study entry."} ;; "myocardial infarction within 6 months prior to study entry"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of cerebrovascular accident at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of cerebrovascular accident in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of cerebrovascular accident.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cerebrovascular accident."} ;; "cerebrovascular event"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@temporalcontext_within6months_before_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cerebrovascular accident occurred within 6 months prior to study entry.","when_to_set_to_false":"Set to false if the patient's cerebrovascular accident did not occur within 6 months prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cerebrovascular accident occurred within 6 months prior to study entry.","meaning":"Boolean indicating whether the patient's cerebrovascular accident occurred within 6 months prior to study entry."} ;; "cerebrovascular event within 6 months prior to study entry"
(declare-const patient_has_serious_medical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious medical illness (as determined by clinical judgment, not limited to the listed examples).","when_to_set_to_false":"Set to false if the patient currently does not have a serious medical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious medical illness.","meaning":"Boolean indicating whether the patient currently has a serious medical illness."} ;; "serious medical illness"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_congestive_heart_failure_now@@uncontrolled
         patient_has_diagnosis_of_congestive_heart_failure_now)
     :named REQ16_AUXILIARY0)) ;; "uncontrolled congestive heart failure implies congestive heart failure"

(assert
  (! (=> patient_has_diagnosis_of_angina_pectoris_now@@uncontrolled
         patient_has_diagnosis_of_angina_pectoris_now)
     :named REQ16_AUXILIARY1)) ;; "uncontrolled angina pectoris implies angina pectoris"

(assert
  (! (=> patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_study_entry
         patient_has_diagnosis_of_myocardial_infarction_inthehistory)
     :named REQ16_AUXILIARY2)) ;; "myocardial infarction within 6 months implies MI in history"

(assert
  (! (=> patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@temporalcontext_within6months_before_study_entry
         patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
     :named REQ16_AUXILIARY3)) ;; "cerebrovascular event within 6 months implies CVA in history"

;; Non-exhaustive examples imply umbrella term
(assert
  (! (=> (or patient_has_diagnosis_of_congestive_heart_failure_now@@uncontrolled
             patient_has_diagnosis_of_angina_pectoris_now@@uncontrolled
             patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_study_entry
             patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@temporalcontext_within6months_before_study_entry)
         patient_has_serious_medical_illness_now)
     :named REQ16_AUXILIARY4)) ;; "non-exhaustive examples imply serious medical illness"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Component 0: To be included, the patient must NOT have serious medical illness (with non-exhaustive examples)
(assert
  (! (not patient_has_serious_medical_illness_now)
     :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "patient must NOT have serious medical illness (including uncontrolled CHF, uncontrolled angina, MI within 6 months, CVA within 6 months)"

;; ===================== Declarations for the criterion (REQ 17) =====================
(declare-const patient_has_medical_contraindication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any medical contraindication.","when_to_set_to_false":"Set to false if the patient currently does not have any medical contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any medical contraindication.","meaning":"Boolean indicating whether the patient currently has any medical contraindication."} ;; "medical contraindication"
(declare-const patient_has_finding_of_at_risk_for_noncompliance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a potential problem that would preclude study compliance (is at risk for noncompliance).","when_to_set_to_false":"Set to false if the patient currently does not have a potential problem that would preclude study compliance (is not at risk for noncompliance).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a potential problem that would preclude study compliance.","meaning":"Boolean indicating whether the patient currently has a potential problem that would preclude study compliance (is at risk for noncompliance) at the present time."} ;; "potential problem that would preclude study compliance"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Component 0: To be included, the patient must NOT have (medical contraindication) AND NOT have (potential problem that would preclude study compliance).
(assert
  (! (and (not patient_has_medical_contraindication_now)
          (not patient_has_finding_of_at_risk_for_noncompliance_now))
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (medical contraindication) AND NOT have (potential problem that would preclude study compliance)."

;; ===================== Declarations for the criterion (REQ 18) =====================
(declare-const days_since_last_administration_of_aspirin_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's last administration of aspirin, as of now, in days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have passed since the patient's last administration of aspirin.","meaning":"Numeric value representing the number of days since the patient's last administration of aspirin, in days."} ;; "at least 7 days since prior aspirin administration"
(declare-const days_since_last_administration_of_aspirin_like_medication_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's last administration of an aspirin-like medication, as of now, in days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have passed since the patient's last administration of an aspirin-like medication.","meaning":"Numeric value representing the number of days since the patient's last administration of an aspirin-like medication, in days."} ;; "at least 7 days since prior administration of aspirin-like medications"
(declare-const patient_has_undergone_administration_of_aspirin_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone administration of aspirin within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not undergone administration of aspirin within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone administration of aspirin within the past 7 days.","meaning":"Boolean indicating whether the patient has undergone administration of aspirin within the past 7 days."} ;; "aspirin administration within the past 7 days"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament (aspirin-like medication) within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament (aspirin-like medication) within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament (aspirin-like medication) within the past 7 days.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament (aspirin-like medication) within the past 7 days."} ;; "aspirin-like medication administration within the past 7 days"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Definition: patient_has_undergone_administration_of_aspirin_inthepast7days is true iff days_since_last_administration_of_aspirin_value_recorded_now_in_days < 7
(assert
  (! (= patient_has_undergone_administration_of_aspirin_inthepast7days
        (< days_since_last_administration_of_aspirin_value_recorded_now_in_days 7))
     :named REQ18_AUXILIARY0)) ;; "aspirin administration within the past 7 days"

;; Definition: patient_is_exposed_to_drug_or_medicament_inthepast7days is true iff days_since_last_administration_of_aspirin_like_medication_value_recorded_now_in_days < 7
(assert
  (! (= patient_is_exposed_to_drug_or_medicament_inthepast7days
        (< days_since_last_administration_of_aspirin_like_medication_value_recorded_now_in_days 7))
     :named REQ18_AUXILIARY1)) ;; "aspirin-like medication administration within the past 7 days"

;; ===================== Constraint Assertions (REQ 18) =====================
;; Component 0: At least 7 days since prior aspirin administration
(assert
  (! (>= days_since_last_administration_of_aspirin_value_recorded_now_in_days 7)
     :named REQ18_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "at least 7 days since prior aspirin administration"

;; Component 1: At least 7 days since prior administration of aspirin-like medications
(assert
  (! (>= days_since_last_administration_of_aspirin_like_medication_value_recorded_now_in_days 7)
     :named REQ18_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "at least 7 days since prior administration of aspirin-like medications"

;; ===================== Declarations for the criterion (REQ 19) =====================
(declare-const patient_warfarin_value_recorded_inthehistory_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's most recent administration of warfarin, if such information is available in the patient's history.","when_to_set_to_null":"Set to null if the number of days since last warfarin administration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days since the patient's most recent administration of warfarin."} ;; "at least 3 days since prior warfarin administration"
(declare-const patient_clopidogrel_bisulfate_value_recorded_inthehistory_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's most recent administration of clopidogrel bisulfate, if such information is available in the patient's history.","when_to_set_to_null":"Set to null if the number of days since last clopidogrel bisulfate administration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days since the patient's most recent administration of clopidogrel bisulfate."} ;; "at least 3 days since prior clopidogrel bisulfate administration"
(declare-const days_since_last_administration_of_similar_compounds_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's most recent administration of similar compounds, if such information is available at the current time.","when_to_set_to_null":"Set to null if the number of days since last administration of similar compounds is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days since the patient's most recent administration of similar compounds, in days."} ;; "at least 3 days since prior administration of similar compounds"

;; ===================== Constraint Assertions (REQ 19) =====================
;; To be included, the patient must have (at least 3 days since prior warfarin administration) OR (at least 3 days since prior clopidogrel bisulfate administration) OR (at least 3 days since prior administration of similar compounds).
(assert
  (! (or (>= patient_warfarin_value_recorded_inthehistory_withunit_days 3)
         (>= patient_clopidogrel_bisulfate_value_recorded_inthehistory_withunit_days 3)
         (>= days_since_last_administration_of_similar_compounds_value_recorded_now_in_days 3))
     :named REQ19_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the criterion (REQ 20) =====================
(declare-const patient_is_taking_concurrent_drugs_causing_bleeding_tendencies_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drugs that cause bleeding tendencies concurrently (e.g., aspirin, warfarin, clopidogrel bisulfate, or other similar agents).","when_to_set_to_false":"Set to false if the patient is not currently taking any drugs that cause bleeding tendencies concurrently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drugs that cause bleeding tendencies concurrently.","meaning":"Boolean indicating whether the patient is currently taking any drugs that cause bleeding tendencies concurrently."} ;; "the patient must NOT be taking concurrent drugs causing bleeding tendencies"
(declare-const patient_is_taking_concurrent_drugs_causing_bleeding_tendencies_now@@concurrently Bool) ;; {"when_to_set_to_true":"Set to true if the drugs causing bleeding tendencies are being taken at the same time as the index event or period of interest.","when_to_set_to_false":"Set to false if the drugs causing bleeding tendencies are not being taken at the same time as the index event or period of interest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drugs causing bleeding tendencies are being taken concurrently.","meaning":"Boolean indicating whether the drugs causing bleeding tendencies are being taken concurrently with the index event or period of interest."} ;; "concurrently"

(declare-const patient_is_taking_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking aspirin.","when_to_set_to_false":"Set to false if the patient is not currently taking aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking aspirin.","meaning":"Boolean indicating whether the patient is currently taking aspirin."} ;; "aspirin administration"
(declare-const patient_is_taking_warfarin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking warfarin.","when_to_set_to_false":"Set to false if the patient is not currently taking warfarin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking warfarin.","meaning":"Boolean indicating whether the patient is currently taking warfarin."} ;; "warfarin administration"
(declare-const patient_is_taking_clopidogrel_bisulfate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking clopidogrel bisulfate.","when_to_set_to_false":"Set to false if the patient is not currently taking clopidogrel bisulfate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking clopidogrel bisulfate.","meaning":"Boolean indicating whether the patient is currently taking clopidogrel bisulfate."} ;; "clopidogrel bisulfate administration"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Non-exhaustive examples imply the umbrella term
(assert
  (! (=> (or patient_is_taking_aspirin_now
             patient_is_taking_warfarin_now
             patient_is_taking_clopidogrel_bisulfate_now)
         patient_is_taking_concurrent_drugs_causing_bleeding_tendencies_now)
     :named REQ20_AUXILIARY0)) ;; "with non-exhaustive examples (aspirin administration OR warfarin administration OR clopidogrel bisulfate administration)"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_taking_concurrent_drugs_causing_bleeding_tendencies_now@@concurrently
         patient_is_taking_concurrent_drugs_causing_bleeding_tendencies_now)
     :named REQ20_AUXILIARY1)) ;; "concurrently"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
  (! (not patient_is_taking_concurrent_drugs_causing_bleeding_tendencies_now)
     :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT be taking concurrent drugs causing bleeding tendencies"

;; ===================== Declarations for the criterion (REQ 21) =====================
(declare-const patient_is_participating_in_other_experimental_studies_concurrently Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in other experimental studies concurrently with study inclusion.","when_to_set_to_false":"Set to false if the patient is not currently participating in other experimental studies concurrently with study inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in other experimental studies concurrently with study inclusion.","meaning":"Boolean indicating whether the patient is currently participating in other experimental studies concurrently with study inclusion."} ;; "the patient must NOT be participating concurrently in other experimental studies."
(declare-const patient_is_participating_in_other_experimental_studies_concurrently@@other_than_index_study Bool) ;; {"when_to_set_to_true":"Set to true if the concurrent experimental studies in which the patient is participating are other than the index study.","when_to_set_to_false":"Set to false if the concurrent experimental studies in which the patient is participating are not other than the index study (i.e., only the index study).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the concurrent experimental studies are other than the index study.","meaning":"Boolean indicating whether the concurrent experimental studies in which the patient is participating are other than the index study."} ;; "other than the index study"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_participating_in_other_experimental_studies_concurrently@@other_than_index_study
         patient_is_participating_in_other_experimental_studies_concurrently)
     :named REQ21_AUXILIARY0)) ;; "other than the index study" implies "participating in other experimental studies concurrently"

;; ===================== Constraint Assertions (REQ 21) =====================
;; Component 0: The patient must NOT be participating concurrently in other experimental studies.
(assert
  (! (not patient_is_participating_in_other_experimental_studies_concurrently)
     :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT be participating concurrently in other experimental studies."
