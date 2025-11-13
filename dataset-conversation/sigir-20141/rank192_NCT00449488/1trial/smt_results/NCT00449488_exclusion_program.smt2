;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_hemoglobin_finding_value_recorded_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current hemoglobin level in mmol/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin level in mmol/L."} ;; "hemoglobin level"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (> patient_hemoglobin_finding_value_recorded_now_withunit_mmol_per_l 10.6))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemoglobin level > 10.6 mmol/L."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_will_undergo_procedure_inthefuture4months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is anticipated to undergo a procedure within the next 4 months.","when_to_set_to_false":"Set to false if the patient is not anticipated to undergo a procedure within the next 4 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is anticipated to undergo a procedure within the next 4 months.","meaning":"Boolean indicating whether the patient is anticipated to undergo a procedure within the next 4 months."} ;; "anticipated additional revascularisation procedure within 4 months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_will_undergo_procedure_inthefuture4months)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anticipated additional revascularisation procedure within 4 months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_cardiogenic_shock_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiogenic shock."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_another_serious_medical_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another serious medical condition (distinct from the index condition under study).","when_to_set_to_false":"Set to false if the patient currently does not have another serious medical condition (distinct from the index condition under study).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another serious medical condition (distinct from the index condition under study).","meaning":"Boolean indicating whether the patient currently has another serious medical condition (distinct from the index condition under study)."} ;; "The patient is excluded if the patient has another serious medical condition."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_another_serious_medical_condition_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another serious medical condition."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breastfeeding"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Link observable to main variable for breastfeeding
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ4_AUXILIARY0)) ;; "breastfeeding"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_is_pregnant_now patient_is_breastfeeding_now))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient is breastfeeding)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_malignant_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malignant hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malignant hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant hypertension.","meaning":"Boolean indicating whether the patient currently has malignant hypertension."} ;; "malignant hypertension"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_malignant_hypertension_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_micromoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current creatinine level in micromoles per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine level in micromoles per liter."} ;; "creatinine level"
(declare-const patient_has_diagnosis_of_end_stage_renal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of end stage renal disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of end stage renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of end stage renal disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of end stage renal disease."} ;; "end stage renal failure"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: end stage renal failure is defined as creatinine level > 220 micromoles per liter
(assert
(! (= patient_has_diagnosis_of_end_stage_renal_disease_now
     (> patient_creatinine_level_finding_value_recorded_now_withunit_micromoles_per_liter 220))
   :named REQ6_AUXILIARY0)) ;; "defined as creatinine level > 220 micromoles per liter."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_end_stage_renal_disease_now)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has end stage renal failure, defined as creatinine level > 220 micromoles per liter."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_erythropoietin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to erythropoietin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to erythropoietin at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to erythropoietin.","meaning":"Boolean indicating whether the patient has ever been exposed to erythropoietin at any time in the past."} ;; "previous treatment with recombinant human erythropoietin"
(declare-const patient_is_exposed_to_erythropoietin_inthehistory@@recombinant_human_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to erythropoietin was specifically to recombinant human erythropoietin.","when_to_set_to_false":"Set to false if the patient's exposure to erythropoietin was not to recombinant human erythropoietin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the erythropoietin exposure was to recombinant human erythropoietin.","meaning":"Boolean indicating whether the patient's exposure to erythropoietin was specifically to recombinant human erythropoietin."} ;; "previous treatment with recombinant human erythropoietin"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_erythropoietin_inthehistory@@recombinant_human_form
      patient_is_exposed_to_erythropoietin_inthehistory)
:named REQ7_AUXILIARY0)) ;; "recombinant human form exposure implies erythropoietin exposure"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_erythropoietin_inthehistory@@recombinant_human_form)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous treatment with recombinant human erythropoietin."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_transfusion_of_blood_product_inthepast12weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone transfusion of blood product within the past 12 weeks prior to randomisation.","when_to_set_to_false":"Set to false if the patient has not undergone transfusion of blood product within the past 12 weeks prior to randomisation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone transfusion of blood product within the past 12 weeks prior to randomisation.","meaning":"Boolean indicating whether the patient has undergone transfusion of blood product within the past 12 weeks."} ;; "blood transfusion < 12 weeks prior to randomisation"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_undergone_transfusion_of_blood_product_inthepast12weeks)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had blood transfusion < 12 weeks prior to randomisation."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_polycythemia_vera_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has polycythemia vera.","when_to_set_to_false":"Set to false if the patient currently does not have polycythemia vera.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has polycythemia vera.","meaning":"Boolean indicating whether the patient currently has polycythemia vera."} ;; "The patient is excluded if the patient has polycythemia vera."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_finding_of_polycythemia_vera_now)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has polycythemia vera."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with acute myocardial infarction at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with acute myocardial infarction at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with acute myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with acute myocardial infarction at any time in their history."} ;; "acute myocardial infarction"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_diagnosis_of_acute_myocardial_infarction_inthehistory)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had at least one previous acute myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_inflammatory_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of an inflammatory disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of an inflammatory disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of an inflammatory disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of an inflammatory disorder."} ;; "inflammatory disease"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a malignant neoplastic disease."} ;; "malignant disease"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not (or patient_has_diagnosis_of_inflammatory_disorder_now
              patient_has_diagnosis_of_malignant_neoplastic_disease_now))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a concomitant inflammatory disease) OR (the patient has a concomitant malignant disease)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_traumatic_injury_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a traumatic injury within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not had a traumatic injury within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a traumatic injury within the past 30 days.","meaning":"Boolean indicating whether the patient has had a traumatic injury within the past 30 days."} ;; "the patient has had recent trauma"

(declare-const patient_has_undergone_surgical_procedure_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within the past 30 days.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within the past 30 days."} ;; "the patient has had recent major surgery"

(declare-const patient_has_undergone_surgical_procedure_inthepast30days@@major Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone by the patient within the past 30 days was major.","when_to_set_to_false":"Set to false if the surgical procedure undergone by the patient within the past 30 days was not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure was major.","meaning":"Boolean indicating whether the surgical procedure undergone within the past 30 days was major."} ;; "recent major surgery"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_surgical_procedure_inthepast30days@@major
      patient_has_undergone_surgical_procedure_inthepast30days)
   :named REQ12_AUXILIARY0)) ;; "major surgery" implies "surgical procedure"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (or patient_has_finding_of_traumatic_injury_inthepast30days
            patient_has_undergone_surgical_procedure_inthepast30days@@major))
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had recent trauma) OR (the patient has had recent major surgery)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_willing_to_sign_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to sign informed consent.","when_to_set_to_false":"Set to false if the patient is currently unwilling to sign informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to sign informed consent.","meaning":"Boolean indicating whether the patient is currently willing to sign informed consent."} ;; "The patient is excluded if the patient is unwilling to sign informed consent."

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (not patient_is_willing_to_sign_informed_consent_now)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unwilling to sign informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has atrial fibrillation."} ;; "atrial fibrillation"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_atrial_fibrillation_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrial fibrillation."
