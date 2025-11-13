;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now Bool) ;; "cancer of the biliary tract" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor (cancer) of the biliary tract, regardless of diagnostic method.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant tumor (cancer) of the biliary tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant tumor (cancer) of the biliary tract.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant tumor (cancer) of the biliary tract."}
(declare-const patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_histologic_confirmation Bool) ;; "histologic confirmation of cancer of the biliary tract" {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant tumor (cancer) of the biliary tract is established by histologic confirmation.","when_to_set_to_false":"Set to false if the diagnosis is not established by histologic confirmation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether histologic confirmation established the diagnosis.","meaning":"Boolean indicating whether the diagnosis of malignant tumor (cancer) of the biliary tract is established by histologic confirmation."}
(declare-const patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_magnetic_resonance_imaging Bool) ;; "stenosis of the biliary tract by magnetic resonance imaging scan" {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant tumor (cancer) of the biliary tract is established by evidence of stenosis of the biliary tract on magnetic resonance imaging scan.","when_to_set_to_false":"Set to false if the diagnosis is not established by this method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether this method established the diagnosis.","meaning":"Boolean indicating whether the diagnosis of malignant tumor (cancer) of the biliary tract is established by evidence of stenosis on magnetic resonance imaging scan."}
(declare-const patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_computed_tomography Bool) ;; "stenosis of the biliary tract by computed tomography scan" {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant tumor (cancer) of the biliary tract is established by evidence of stenosis of the biliary tract on computed tomography scan.","when_to_set_to_false":"Set to false if the diagnosis is not established by this method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether this method established the diagnosis.","meaning":"Boolean indicating whether the diagnosis of malignant tumor (cancer) of the biliary tract is established by evidence of stenosis on computed tomography scan."}
(declare-const patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_echocardiography Bool) ;; "stenosis of the biliary tract by echocardiography" {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant tumor (cancer) of the biliary tract is established by evidence of stenosis of the biliary tract on echocardiography.","when_to_set_to_false":"Set to false if the diagnosis is not established by this method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether this method established the diagnosis.","meaning":"Boolean indicating whether the diagnosis of malignant tumor (cancer) of the biliary tract is established by evidence of stenosis on echocardiography."}
(declare-const patient_has_finding_of_biliary_stricture_now Bool) ;; "stenosis of the biliary tract" {"when_to_set_to_true":"Set to true if the patient currently has a biliary stricture (stenosis of the biliary tract), regardless of identification method.","when_to_set_to_false":"Set to false if the patient currently does not have a biliary stricture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a biliary stricture.","meaning":"Boolean indicating whether the patient currently has a biliary stricture (stenosis of the biliary tract)."}
(declare-const patient_has_finding_of_biliary_stricture_now@@identified_by_magnetic_resonance_imaging Bool) ;; "stenosis of the biliary tract by magnetic resonance imaging scan" {"when_to_set_to_true":"Set to true if the patient's biliary stricture is identified by magnetic resonance imaging scan.","when_to_set_to_false":"Set to false if the finding is not identified by this method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether this method identified the finding.","meaning":"Boolean indicating whether the biliary stricture is identified by magnetic resonance imaging scan."}
(declare-const patient_has_finding_of_biliary_stricture_now@@identified_by_computed_tomography Bool) ;; "stenosis of the biliary tract by computed tomography scan" {"when_to_set_to_true":"Set to true if the patient's biliary stricture is identified by computed tomography scan.","when_to_set_to_false":"Set to false if the finding is not identified by this method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether this method identified the finding.","meaning":"Boolean indicating whether the biliary stricture is identified by computed tomography scan."}
(declare-const patient_has_finding_of_biliary_stricture_now@@identified_by_echocardiography Bool) ;; "stenosis of the biliary tract by echocardiography" {"when_to_set_to_true":"Set to true if the patient's biliary stricture is identified by echocardiography.","when_to_set_to_false":"Set to false if the finding is not identified by this method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether this method identified the finding.","meaning":"Boolean indicating whether the biliary stricture is identified by echocardiography."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_histologic_confirmation
         patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now)
     :named REQ0_AUXILIARY0)) ;; "histologic confirmation of cancer of the biliary tract"

(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_magnetic_resonance_imaging
         patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now)
     :named REQ0_AUXILIARY1)) ;; "stenosis of the biliary tract by magnetic resonance imaging scan"

(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_computed_tomography
         patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now)
     :named REQ0_AUXILIARY2)) ;; "stenosis of the biliary tract by computed tomography scan"

(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_echocardiography
         patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now)
     :named REQ0_AUXILIARY3)) ;; "stenosis of the biliary tract by echocardiography"

;; Imaging-based diagnosis qualifiers imply corresponding biliary stricture findings
(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_magnetic_resonance_imaging
         patient_has_finding_of_biliary_stricture_now@@identified_by_magnetic_resonance_imaging)
     :named REQ0_AUXILIARY4)) ;; "stenosis of the biliary tract by magnetic resonance imaging scan"

(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_computed_tomography
         patient_has_finding_of_biliary_stricture_now@@identified_by_computed_tomography)
     :named REQ0_AUXILIARY5)) ;; "stenosis of the biliary tract by computed tomography scan"

(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_echocardiography
         patient_has_finding_of_biliary_stricture_now@@identified_by_echocardiography)
     :named REQ0_AUXILIARY6)) ;; "stenosis of the biliary tract by echocardiography"

;; Biliary stricture imaging qualifiers imply biliary stricture finding
(assert
  (! (=> patient_has_finding_of_biliary_stricture_now@@identified_by_magnetic_resonance_imaging
         patient_has_finding_of_biliary_stricture_now)
     :named REQ0_AUXILIARY7)) ;; "stenosis of the biliary tract by magnetic resonance imaging scan"

(assert
  (! (=> patient_has_finding_of_biliary_stricture_now@@identified_by_computed_tomography
         patient_has_finding_of_biliary_stricture_now)
     :named REQ0_AUXILIARY8)) ;; "stenosis of the biliary tract by computed tomography scan"

(assert
  (! (=> patient_has_finding_of_biliary_stricture_now@@identified_by_echocardiography
         patient_has_finding_of_biliary_stricture_now)
     :named REQ0_AUXILIARY9)) ;; "stenosis of the biliary tract by echocardiography"

;; ===================== Constraint Assertions (REQ 0) =====================
;; At least one of the diagnostic methods must be present for inclusion
(assert
  (! (or patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_histologic_confirmation
         patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_magnetic_resonance_imaging
         patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_computed_tomography
         patient_has_diagnosis_of_malignant_tumor_of_biliary_tract_now@@diagnosed_by_stenosis_on_echocardiography)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis of cancer of the biliary tract by at least one of the following methods: (histologic confirmation...) OR (stenosis...by MRI) OR (stenosis...by CT) OR (stenosis...by echocardiography)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; "disease" {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."}
(declare-const patient_has_finding_of_disease_now@@unresectable Bool) ;; "unresectable disease" {"when_to_set_to_true":"Set to true if the patient's current disease is unresectable.","when_to_set_to_false":"Set to false if the patient's current disease is resectable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is unresectable.","meaning":"Boolean indicating whether the patient's current disease is unresectable."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_disease_now@@unresectable
         patient_has_finding_of_disease_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have unresectable disease."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_disease_now@@unresectable
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have unresectable disease."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_amenable_to_radiotherapy_now Bool) ;; "To be included, the patient must be amenable to radiotherapy." {"when_to_set_to_true":"Set to true if the patient is currently amenable to radiotherapy, meaning radiotherapy is a feasible and appropriate treatment option for the patient at this time.","when_to_set_to_false":"Set to false if the patient is currently not amenable to radiotherapy, meaning radiotherapy is not a feasible or appropriate treatment option for the patient at this time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently amenable to radiotherapy.","meaning":"Boolean indicating whether the patient is currently amenable to radiotherapy."}

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_amenable_to_radiotherapy_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be amenable to radiotherapy."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now Bool) ;; "metastases" {"when_to_set_to_true":"Set to true if the patient currently has secondary malignant neoplastic disease (metastases).","when_to_set_to_false":"Set to false if the patient currently does not have secondary malignant neoplastic disease (metastases).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary malignant neoplastic disease (metastases).","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplastic disease (metastases)."}

(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@visceral Bool) ;; "no visceral metastases" {"when_to_set_to_true":"Set to true if the patient's current secondary malignant neoplastic disease (metastases) are visceral.","when_to_set_to_false":"Set to false if the patient's current secondary malignant neoplastic disease (metastases) are not visceral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current secondary malignant neoplastic disease (metastases) are visceral.","meaning":"Boolean indicating whether the patient's current secondary malignant neoplastic disease (metastases) are visceral."}

(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@identified_by_imaging Bool) ;; "by imaging" {"when_to_set_to_true":"Set to true if the patient's current secondary malignant neoplastic disease (metastases) are identified by imaging.","when_to_set_to_false":"Set to false if the patient's current secondary malignant neoplastic disease (metastases) are not identified by imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current secondary malignant neoplastic disease (metastases) are identified by imaging.","meaning":"Boolean indicating whether the patient's current secondary malignant neoplastic disease (metastases) are identified by imaging."}

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@visceral
         patient_has_finding_of_secondary_malignant_neoplastic_disease_now)
     :named REQ3_AUXILIARY0)) ;; "no visceral metastases by imaging"

(assert
  (! (=> patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@identified_by_imaging
         patient_has_finding_of_secondary_malignant_neoplastic_disease_now)
     :named REQ3_AUXILIARY1)) ;; "no visceral metastases by imaging"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must have no visceral metastases by imaging.
(assert
  (! (not (and patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@visceral
               patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@identified_by_imaging))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no visceral metastases by imaging."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_hepatic_lymphadenopathy_now Bool) ;; "hepatic adenopathies" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic lymphadenopathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic lymphadenopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hepatic lymphadenopathy.","meaning":"Boolean indicating whether the patient currently has hepatic lymphadenopathy."}
(declare-const patient_has_finding_of_hepatic_lymphadenopathy_now@@can_be_included_in_a_radiation_field Bool) ;; "hepatic adenopathies that can be included in a radiation field" {"when_to_set_to_true":"Set to true if the patient's current hepatic lymphadenopathy can be included in a radiation field.","when_to_set_to_false":"Set to false if the patient's current hepatic lymphadenopathy cannot be included in a radiation field.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hepatic lymphadenopathy can be included in a radiation field.","meaning":"Boolean indicating whether the patient's current hepatic lymphadenopathy can be included in a radiation field."}

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_hepatic_lymphadenopathy_now@@can_be_included_in_a_radiation_field
         patient_has_finding_of_hepatic_lymphadenopathy_now)
     :named REQ4_AUXILIARY0)) ;; "hepatic adenopathies that can be included in a radiation field"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient may have hepatic adenopathies that can be included in a radiation field (permissive inclusion)
(assert
  (! true
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may have hepatic adenopathies that can be included in a radiation field."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_carcinoma_of_ampulla_of_vater_now Bool) ;; "ampulla of Vater cancer" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of carcinoma of ampulla of Vater.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of carcinoma of ampulla of Vater.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of carcinoma of ampulla of Vater.","meaning":"Boolean indicating whether the patient currently has a diagnosis of carcinoma of ampulla of Vater."}
(declare-const patient_has_diagnosis_of_malignant_tumor_of_pancreas_now Bool) ;; "pancreatic cancer" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor of pancreas.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant tumor of pancreas.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant tumor of pancreas.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant tumor of pancreas."}
(declare-const patient_has_diagnosis_of_malignant_tumor_of_pancreas_now@@involves_biliary_tract Bool) ;; "pancreatic cancer involving the biliary tract" {"when_to_set_to_true":"Set to true if the patient's malignant tumor of pancreas involves the biliary tract.","when_to_set_to_false":"Set to false if the patient's malignant tumor of pancreas does not involve the biliary tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignant tumor of pancreas involves the biliary tract.","meaning":"Boolean indicating whether the patient's malignant tumor of pancreas involves the biliary tract."}

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable: if pancreatic cancer involves biliary tract, then pancreatic cancer is present
(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_pancreas_now@@involves_biliary_tract
         patient_has_diagnosis_of_malignant_tumor_of_pancreas_now)
     :named REQ5_AUXILIARY0)) ;; "pancreatic cancer involving the biliary tract" implies "pancreatic cancer"

;; ===================== Constraint Assertions (REQ 5) =====================
;; To be included, the patient must have (no known ampulla of Vater cancer) AND (no known pancreatic cancer involving the biliary tract).
(assert
  (! (and (not patient_has_diagnosis_of_carcinoma_of_ampulla_of_vater_now)
          (not patient_has_diagnosis_of_malignant_tumor_of_pancreas_now@@involves_biliary_tract))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "no known ampulla of Vater cancer" AND "no known pancreatic cancer involving the biliary tract"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_who_performance_status_finding_value_recorded_now_withunit_none Real) ;; "World Health Organization performance status" {"when_to_set_to_value":"Set to the patient's current WHO performance status value if available.","when_to_set_to_null":"Set to null if the patient's current WHO performance status value is not available or indeterminate.","meaning":"Numeric value representing the patient's current WHO performance status (no unit)."}

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must have World Health Organization performance status ≥ 0 AND ≤ 2.
(assert
  (! (and (>= patient_who_performance_status_finding_value_recorded_now_withunit_none 0)
          (<= patient_who_performance_status_finding_value_recorded_now_withunit_none 2))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have World Health Organization performance status ≥ 0 AND ≤ 2."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; "creatinine concentration < 1.5 milligrams per deciliter" {"when_to_set_to_value":"Set to the measured value if a current creatinine concentration in milligrams per deciliter is available for the patient.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine concentration in milligrams per deciliter."}

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (< patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 1.5)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have creatinine concentration < 1.5 milligrams per deciliter."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const absolute_neutrophil_count_value_recorded_withunit_per_cubic_millimeter Real) ;; "absolute neutrophil count ≥ 1,500 per cubic millimeter" {"when_to_set_to_value":"Set to the numeric value of the patient's absolute neutrophil count as measured in per cubic millimeter.","when_to_set_to_null":"Set to null if the patient's absolute neutrophil count is unknown, not documented, or cannot be determined in per cubic millimeter.","meaning":"Numeric value of the patient's absolute neutrophil count in per cubic millimeter."}

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (>= absolute_neutrophil_count_value_recorded_withunit_per_cubic_millimeter 1500.0)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have absolute neutrophil count ≥ 1,500 per cubic millimeter."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter Real) ;; "platelet count ≥ 75,000 per cubic millimeter" {"when_to_set_to_value":"Set to the measured value if the patient's platelet count is recorded now in number per cubic millimeter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count (number per cubic millimeter) measured now."}

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: To be included, the patient must have platelet count ≥ 75,000 per cubic millimeter.
(assert
  (! (>= patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter 75000.0)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_prothrombin_time_value_recorded_now_withunit_percent Real) ;; "prothrombin time" {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's prothrombin time recorded now is available.","when_to_set_to_null":"Set to null if no such percentage measurement recorded now is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current prothrombin time."}

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: To be included, the patient must have prothrombin time > 70%.
(assert
  (! (> patient_prothrombin_time_value_recorded_now_withunit_percent 70.0)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have prothrombin time > 70%."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_bilirubin_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; "bilirubin concentration" {"when_to_set_to_value":"Set to the measured value if the patient's bilirubin concentration (in mg/dL) is recorded now.","when_to_set_to_null":"Set to null if no bilirubin concentration measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current bilirubin concentration in mg/dL."}
(declare-const patient_has_undergone_hepatic_draining_prior_to_bilirubin_measurement_now Bool) ;; "after hepatic draining, if hepatic draining is needed" {"when_to_set_to_true":"Set to true if the patient has undergone hepatic draining prior to the current bilirubin concentration measurement.","when_to_set_to_false":"Set to false if the patient has not undergone hepatic draining prior to the current bilirubin concentration measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hepatic draining prior to the current bilirubin concentration measurement.","meaning":"Boolean indicating whether the patient has undergone hepatic draining prior to the current bilirubin concentration measurement."}
(declare-const patient_hepatic_draining_is_needed_now Bool) ;; "if hepatic draining is needed" {"when_to_set_to_true":"Set to true if hepatic draining is needed for the patient at the current time.","when_to_set_to_false":"Set to false if hepatic draining is not needed for the patient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether hepatic draining is needed for the patient at the current time.","meaning":"Boolean indicating whether hepatic draining is needed for the patient at the current time."}

;; ===================== Constraint Assertions (REQ 11) =====================
;; To be included, the patient must have bilirubin concentration ≤ 2.9 mg/dL (after hepatic draining, if hepatic draining is needed).
(assert
  (! (and
        ;; If hepatic draining is needed, it must have been performed prior to measurement
        (or (not patient_hepatic_draining_is_needed_now)
            patient_has_undergone_hepatic_draining_prior_to_bilirubin_measurement_now)
        ;; Bilirubin concentration must be ≤ 2.9 mg/dL
        (<= patient_bilirubin_level_finding_value_recorded_now_withunit_mg_per_dl 2.9)
     )
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have bilirubin concentration ≤ 2.9 mg/dL (after hepatic draining, if hepatic draining is needed)."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; "unstable angina pectoris" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina pectoris (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina pectoris (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina pectoris (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina pectoris (preinfarction syndrome)."}

;; ===================== Constraint Assertions (REQ 12) =====================
;; Component 0: To be included, the patient must NOT have unstable angina pectoris.
(assert
  (! (not patient_has_finding_of_preinfarction_syndrome_now)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have unstable angina pectoris."

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; "cardiac insufficiency" {"when_to_set_to_true":"Set to true if the patient currently has heart failure (cardiac insufficiency).","when_to_set_to_false":"Set to false if the patient currently does not have heart failure (cardiac insufficiency).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure (cardiac insufficiency).","meaning":"Boolean indicating whether the patient currently has heart failure (cardiac insufficiency) now."}
(declare-const patient_has_finding_of_heart_failure_now@@symptomatic Bool) ;; "symptomatic cardiac insufficiency" {"when_to_set_to_true":"Set to true if the patient currently has heart failure (cardiac insufficiency) and the heart failure is symptomatic.","when_to_set_to_false":"Set to false if the patient currently has heart failure (cardiac insufficiency) and the heart failure is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart failure is symptomatic.","meaning":"Boolean indicating whether the patient's current heart failure (cardiac insufficiency) is symptomatic."}

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies the stem variable (if symptomatic heart failure, then heart failure)
(assert
  (! (=> patient_has_finding_of_heart_failure_now@@symptomatic
         patient_has_finding_of_heart_failure_now)
     :named REQ13_AUXILIARY0)) ;; "symptomatic cardiac insufficiency" implies "cardiac insufficiency"

;; ===================== Constraint Assertions (REQ 13) =====================
;; To be included, the patient must NOT have symptomatic cardiac insufficiency.
(assert
  (! (not patient_has_finding_of_heart_failure_now@@symptomatic)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have symptomatic cardiac insufficiency."

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; "comorbidity" {"when_to_set_to_true":"Set to true if the patient currently has any co-morbid conditions.","when_to_set_to_false":"Set to false if the patient currently does not have any co-morbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any co-morbid conditions.","meaning":"Boolean indicating whether the patient currently has any co-morbid conditions."}
(declare-const patient_has_finding_of_co_morbid_conditions_now@@would_preclude_study_therapy Bool) ;; "comorbidity (where the comorbidity would preclude study therapy)" {"when_to_set_to_true":"Set to true if the patient currently has any co-morbid conditions and those conditions would preclude study therapy.","when_to_set_to_false":"Set to false if the patient currently has any co-morbid conditions but those conditions would not preclude study therapy, or if the patient does not have any co-morbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any co-morbid conditions would preclude study therapy.","meaning":"Boolean indicating whether any co-morbid conditions present would preclude study therapy."}

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_co_morbid_conditions_now@@would_preclude_study_therapy
         patient_has_finding_of_co_morbid_conditions_now)
     :named REQ14_AUXILIARY0)) ;; "comorbidity (where the comorbidity would preclude study therapy)"

;; ===================== Constraint Assertions (REQ 14) =====================
;; To be included, the patient must NOT have any other comorbidity (where the comorbidity would preclude study therapy).
(assert
  (! (not patient_has_finding_of_co_morbid_conditions_now@@would_preclude_study_therapy)
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the inclusion criterion (REQ 15) =====================
(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory Bool) ;; "basal cell carcinoma of the skin" {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with basal cell carcinoma of the skin at any time in the past, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with basal cell carcinoma of the skin at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with basal cell carcinoma of the skin.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of basal cell carcinoma of the skin in their history."}
(declare-const patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory Bool) ;; "carcinoma in situ of the cervix" {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with carcinoma in situ of the uterine cervix at any time in the past, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with carcinoma in situ of the uterine cervix at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with carcinoma in situ of the uterine cervix.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of carcinoma in situ of the uterine cervix in their history."}
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; "malignancy" {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a malignant neoplastic disease (malignancy) at any time in the past, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a malignant neoplastic disease (malignancy) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (malignancy) in their history."}

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; The exceptions (basal cell carcinoma of the skin, carcinoma in situ of the cervix) are specific types of malignancy in history
;; If the patient has a history of basal cell carcinoma of the skin, then they have a history of malignancy
(assert
  (! (=> patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ15_AUXILIARY0)) ;; "basal cell carcinoma of the skin is a type of malignancy in history"

;; If the patient has a history of carcinoma in situ of the cervix, then they have a history of malignancy
(assert
  (! (=> patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ15_AUXILIARY1)) ;; "carcinoma in situ of the cervix is a type of malignancy in history"

;; ===================== Constraint Assertions (REQ 15) =====================
;; To be included, the patient must NOT have any other prior malignancy (except basal cell carcinoma of the skin OR carcinoma in situ of the cervix).
;; That is, the only allowed prior malignancies are basal cell carcinoma of the skin and/or carcinoma in situ of the cervix.
(assert
  (! (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
         (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
              (or patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory
                  patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory)
              (not (and patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory
                        patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory
                        (not (= (ite patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory 1 0)
                                (+ (ite patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory 1 0)
                                   (ite patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory 1 0))))))))
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have any other prior malignancy (except basal cell carcinoma of the skin OR carcinoma in situ of the cervix)."

;; ===================== Declarations for the criterion (REQ 16) =====================
(declare-const patient_has_history_of_hydatid_cyst_prior_to_study_inclusion Bool) ;; "patient must have no prior hydatid cyst" {"when_to_set_to_true":"Set to true if the patient has a documented history of hydatid cyst that occurred prior to study inclusion.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hydatid cyst prior to study inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hydatid cyst prior to study inclusion.","meaning":"Boolean indicating whether the patient has a history of hydatid cyst prior to study inclusion."}
(declare-const patient_has_history_of_alveolar_echinococcosis_prior_to_study_inclusion Bool) ;; "patient must have no prior alveolar echinococcosis" {"when_to_set_to_true":"Set to true if the patient has a documented history of alveolar echinococcosis that occurred prior to study inclusion.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alveolar echinococcosis prior to study inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alveolar echinococcosis prior to study inclusion.","meaning":"Boolean indicating whether the patient has a history of alveolar echinococcosis prior to study inclusion."}

;; ===================== Constraint Assertions (REQ 16) =====================
;; "To be included, the patient must have no prior hydatid cyst or no prior alveolar echinococcosis."
(assert
  (! (or (not patient_has_history_of_hydatid_cyst_prior_to_study_inclusion)
         (not patient_has_history_of_alveolar_echinococcosis_prior_to_study_inclusion))
     :named REQ16_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 17) =====================
(declare-const patient_is_pregnant_now Bool) ;; "must not be pregnant" {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."}
(declare-const patient_is_breastfeeding_now Bool) ;; "must not be nursing" {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."}

;; ===================== Constraint Assertions (REQ 17) =====================
;; To be included, the patient must not be pregnant or not be nursing.
(assert
  (! (or (not patient_is_pregnant_now)
         (not patient_is_breastfeeding_now))
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not be pregnant or not be nursing."

;; ===================== Declarations for the criterion (REQ 18) =====================
(declare-const patient_has_undergone_operation_on_biliary_tract_inthehistory Bool) ;; "biliary tract surgery" {"when_to_set_to_true":"Set to true if the patient has undergone a biliary tract surgery at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a biliary tract surgery in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a biliary tract surgery in their history.","meaning":"Boolean indicating whether the patient has undergone a biliary tract surgery at any time in their history."}
(declare-const patient_has_undergone_operation_on_biliary_tract_inthehistory@@recent Bool) ;; "recent biliary tract surgery" {"when_to_set_to_true":"Set to true if the biliary tract surgery occurred within the timeframe considered 'recent' by study protocol.","when_to_set_to_false":"Set to false if the biliary tract surgery did not occur within the 'recent' timeframe (i.e., it was remote or never occurred).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biliary tract surgery was recent.","meaning":"Boolean indicating whether the biliary tract surgery was recent."}

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_operation_on_biliary_tract_inthehistory@@recent
         patient_has_undergone_operation_on_biliary_tract_inthehistory)
     :named REQ18_AUXILIARY0)) ;; "recent biliary tract surgery" implies "biliary tract surgery"

;; ===================== Constraint Assertions (REQ 18) =====================
;; Component 0: To be included, the patient must NOT have had recent biliary tract surgery.
(assert
  (! (not patient_has_undergone_operation_on_biliary_tract_inthehistory@@recent)
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have had recent biliary tract surgery."

;; ===================== Declarations for the criterion (REQ 19) =====================
(declare-const patient_has_undergone_hepatic_arterial_infusion_chemotherapy_inthehistory Bool) ;; "hepatic intra-arterial chemotherapy" {"when_to_set_to_true":"Set to true if the patient has ever undergone hepatic arterial infusion chemotherapy at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone hepatic arterial infusion chemotherapy at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone hepatic arterial infusion chemotherapy.","meaning":"Boolean indicating whether the patient has ever undergone hepatic arterial infusion chemotherapy at any time in their history."}

;; ===================== Constraint Assertions (REQ 19) =====================
;; To be included, the patient must NOT have had hepatic intra-arterial chemotherapy.
(assert
  (! (not patient_has_undergone_hepatic_arterial_infusion_chemotherapy_inthehistory)
     :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have had hepatic intra-arterial chemotherapy."

;; ===================== Declarations for the criterion (REQ 20) =====================
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory Bool) ;; "anticancer therapy" {"when_to_set_to_true":"Set to true if the patient has ever undergone administration of an antineoplastic agent (anticancer therapy) at any time in their history prior to study inclusion.","when_to_set_to_false":"Set to false if the patient has never undergone administration of an antineoplastic agent (anticancer therapy) at any time in their history prior to study inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of an antineoplastic agent (anticancer therapy) at any time in their history prior to study inclusion.","meaning":"Boolean indicating whether the patient has ever undergone administration of an antineoplastic agent (anticancer therapy) at any time in their history prior to study inclusion."}

;; ===================== Constraint Assertions (REQ 20) =====================
;; Component 0: "To be included, the patient must NOT have had prior anticancer therapy."
(assert
  (! (not patient_has_undergone_administration_of_antineoplastic_agent_inthehistory)
     :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have had prior anticancer therapy."
