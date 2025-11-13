;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_symptoms_of_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of pharyngitis.","meaning":"Boolean indicating whether the patient currently has symptoms of pharyngitis."} ;; "pharyngitis"
(declare-const patient_has_symptoms_of_pharyngitis_now@@primarily_bacterial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's symptoms of pharyngitis are primarily bacterial in etiology.","when_to_set_to_false":"Set to false if the patient's symptoms of pharyngitis are not primarily bacterial in etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the symptoms of pharyngitis are primarily bacterial.","meaning":"Boolean indicating whether the symptoms of pharyngitis are primarily bacterial in etiology."} ;; "primarily bacterial pharyngitis"
(declare-const patient_has_symptoms_of_bacterial_secondary_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of bacterial secondary infection.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of bacterial secondary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of bacterial secondary infection.","meaning":"Boolean indicating whether the patient currently has symptoms of bacterial secondary infection."} ;; "bacterial secondary infection"
(declare-const patient_has_finding_of_clinical_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding.","meaning":"Boolean indicating whether the patient currently has a clinical finding."} ;; "clinical findings"
(declare-const patient_has_finding_of_clinical_finding_now@@associated_with_bacterial_secondary_infection Bool) ;; {"when_to_set_to_true":"Set to true if the clinical finding is associated with bacterial secondary infection.","when_to_set_to_false":"Set to false if the clinical finding is not associated with bacterial secondary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical finding is associated with bacterial secondary infection.","meaning":"Boolean indicating whether the clinical finding is associated with bacterial secondary infection."} ;; "clinical findings associated with bacterial secondary infection"
(declare-const patient_is_exposed_to_exudate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to exudate.","when_to_set_to_false":"Set to false if the patient is currently not exposed to exudate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to exudate.","meaning":"Boolean indicating whether the patient is currently exposed to exudate."} ;; "assessment of exudate"
(declare-const patient_is_exposed_to_exudate_now@@associated_with_bacterial_secondary_infection Bool) ;; {"when_to_set_to_true":"Set to true if the exudate is associated with bacterial secondary infection.","when_to_set_to_false":"Set to false if the exudate is not associated with bacterial secondary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exudate is associated with bacterial secondary infection.","meaning":"Boolean indicating whether the exudate is associated with bacterial secondary infection."} ;; "assessment of exudate associated with bacterial secondary infection"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable for pharyngitis
(assert
(! (=> patient_has_symptoms_of_pharyngitis_now@@primarily_bacterial
      patient_has_symptoms_of_pharyngitis_now)
    :named REQ0_AUXILIARY0)) ;; "primarily bacterial pharyngitis"

;; Non-exhaustive examples imply umbrella term for bacterial secondary infection
(assert
(! (=> (or patient_has_finding_of_clinical_finding_now@@associated_with_bacterial_secondary_infection
           patient_is_exposed_to_exudate_now@@associated_with_bacterial_secondary_infection)
      patient_has_symptoms_of_bacterial_secondary_infection_now)
    :named REQ0_AUXILIARY1)) ;; "with non-exhaustive examples (clinical findings, assessment of exudate)"

;; Qualifier variable implies corresponding stem variable for clinical finding
(assert
(! (=> patient_has_finding_of_clinical_finding_now@@associated_with_bacterial_secondary_infection
      patient_has_finding_of_clinical_finding_now)
    :named REQ0_AUXILIARY2)) ;; "clinical findings associated with bacterial secondary infection"

;; Qualifier variable implies corresponding stem variable for exudate
(assert
(! (=> patient_is_exposed_to_exudate_now@@associated_with_bacterial_secondary_infection
      patient_is_exposed_to_exudate_now)
    :named REQ0_AUXILIARY3)) ;; "assessment of exudate associated with bacterial secondary infection"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have symptoms of primarily bacterial pharyngitis
(assert
(! (not patient_has_symptoms_of_pharyngitis_now@@primarily_bacterial)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms of primarily bacterial pharyngitis."

;; Exclusion: patient must NOT have symptoms of bacterial secondary infection (with non-exhaustive examples)
(assert
(! (not patient_has_symptoms_of_bacterial_secondary_infection_now)
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms of bacterial secondary infection with non-exhaustive examples (clinical findings, assessment of exudate)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const days_since_first_indication_of_acute_pharyngitis_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's first indication of symptoms of acute pharyngitis (including but not limited to sore throat) as of now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient's first indication of symptoms of acute pharyngitis occurred.","meaning":"Numeric variable indicating the number of days since the patient's first indication of symptoms of acute pharyngitis (including but not limited to sore throat) as of now, measured in days."} ;; "first indication of symptoms of acute pharyngitis ... occurred more than 3 days ago"

(declare-const patient_has_finding_of_acute_pharyngitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of acute pharyngitis at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of acute pharyngitis in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of acute pharyngitis.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of acute pharyngitis in their history."} ;; "acute pharyngitis"

(declare-const patient_has_finding_of_pain_in_throat_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of pain in throat (sore throat) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of pain in throat (sore throat) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of pain in throat (sore throat).","meaning":"Boolean indicating whether the patient has ever had a clinical finding of pain in throat (sore throat) in their history."} ;; "sore throat"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive example: sore throat implies acute pharyngitis subclass
(assert
(! (=> patient_has_finding_of_pain_in_throat_inthehistory
       patient_has_finding_of_acute_pharyngitis_inthehistory)
    :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (sore throat)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_has_finding_of_acute_pharyngitis_inthehistory
             (> days_since_first_indication_of_acute_pharyngitis_value_recorded_now_in_days 3)))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's first indication of symptoms of acute pharyngitis with non-exhaustive examples (sore throat) occurred more than 3 days ago."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_10e9_cells_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's white blood cell count is recorded now in a blood routine examination, in units of 10^9 cells per liter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current white blood cell count measured in a blood routine examination, in units of 10^9 cells per liter."} ;; "white blood cell count in blood routine examination > 10 × 10^9 cells per liter."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_white_blood_cell_count_value_recorded_now_withunit_10e9_cells_per_liter 10))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's white blood cell count in blood routine examination > 10 × 10^9 cells per liter."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_acute_viral_pharyngitis_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has suffered from acute viral pharyngitis within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not suffered from acute viral pharyngitis within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has suffered from acute viral pharyngitis within the past 4 weeks.","meaning":"Boolean indicating whether the patient has suffered from acute viral pharyngitis within the past 4 weeks."} ;; "acute viral pharyngitis in the past 4 weeks"
(declare-const patient_has_finding_of_bacterial_pharyngitis_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has suffered from bacterial pharyngitis within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not suffered from bacterial pharyngitis within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has suffered from bacterial pharyngitis within the past 4 weeks.","meaning":"Boolean indicating whether the patient has suffered from bacterial pharyngitis within the past 4 weeks."} ;; "bacterial pharyngitis in the past 4 weeks"
(declare-const patient_has_finding_of_pharyngitis_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has suffered from pharyngitis within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not suffered from pharyngitis within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has suffered from pharyngitis within the past 4 weeks.","meaning":"Boolean indicating whether the patient has suffered from pharyngitis within the past 4 weeks."} ;; "pharyngitis in the past 4 weeks"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_acute_viral_pharyngitis_inthepast4weeks)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has suffered from acute viral pharyngitis in the past 4 weeks."

(assert
(! (not patient_has_finding_of_bacterial_pharyngitis_inthepast4weeks)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has suffered from bacterial pharyngitis in the past 4 weeks."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_broncho_motor_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has broncho-motor disorders.","when_to_set_to_false":"Set to false if the patient currently does not have broncho-motor disorders.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has broncho-motor disorders.","meaning":"Boolean indicating whether the patient currently has broncho-motor disorders."} ;; "the patient has broncho-motor disorders"

(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has concomitant (co-morbid) diseases.","when_to_set_to_false":"Set to false if the patient currently does not have concomitant (co-morbid) diseases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has concomitant (co-morbid) diseases.","meaning":"Boolean indicating whether the patient currently has concomitant (co-morbid) diseases."} ;; "concomitant diseases"

(declare-const patient_has_finding_of_co_morbid_conditions_now@@associated_with_relatively_large_quantities_of_secretion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's concomitant (co-morbid) diseases are associated with relatively large quantities of secretion.","when_to_set_to_false":"Set to false if the patient's concomitant (co-morbid) diseases are not associated with relatively large quantities of secretion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's concomitant (co-morbid) diseases are associated with relatively large quantities of secretion.","meaning":"Boolean indicating whether the patient's concomitant (co-morbid) diseases are associated with relatively large quantities of secretion."} ;; "concomitant diseases with relatively large quantities of secretion"

(declare-const patient_is_exposed_to_body_secretion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to body secretion.","when_to_set_to_false":"Set to false if the patient is currently not exposed to body secretion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to body secretion.","meaning":"Boolean indicating whether the patient is currently exposed to body secretion."} ;; "secretion"

(declare-const patient_is_exposed_to_body_secretion_now@@present_in_relatively_large_quantities Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to body secretion and the secretion is present in relatively large quantities.","when_to_set_to_false":"Set to false if the patient is currently exposed to body secretion but the secretion is not present in relatively large quantities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the secretion is present in relatively large quantities.","meaning":"Boolean indicating whether the patient is currently exposed to body secretion present in relatively large quantities."} ;; "relatively large quantities of secretion"

(declare-const patient_is_exposed_to_body_secretion_now@@poses_danger_of_secretion_blockage Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to body secretion and the secretion poses a danger of secretion blockage.","when_to_set_to_false":"Set to false if the patient is currently exposed to body secretion but the secretion does not pose a danger of secretion blockage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the secretion poses a danger of secretion blockage.","meaning":"Boolean indicating whether the patient is currently exposed to body secretion that poses a danger of secretion blockage."} ;; "danger of secretion blockage"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable for co-morbid conditions implies stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@associated_with_relatively_large_quantities_of_secretion
      patient_has_finding_of_co_morbid_conditions_now)
:named REQ4_AUXILIARY0)) ;; "concomitant diseases with relatively large quantities of secretion"

;; Qualifier variable for body secretion (large quantities) implies stem variable
(assert
(! (=> patient_is_exposed_to_body_secretion_now@@present_in_relatively_large_quantities
      patient_is_exposed_to_body_secretion_now)
:named REQ4_AUXILIARY1)) ;; "relatively large quantities of secretion"

;; Qualifier variable for body secretion (danger of blockage) implies stem variable
(assert
(! (=> patient_is_exposed_to_body_secretion_now@@poses_danger_of_secretion_blockage
      patient_is_exposed_to_body_secretion_now)
:named REQ4_AUXILIARY2)) ;; "danger of secretion blockage"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion if the patient has broncho-motor disorders
(assert
(! (not patient_has_finding_of_broncho_motor_disorder_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has broncho-motor disorders."

;; Exclusion if the patient has concomitant diseases with relatively large quantities of secretion (danger of secretion blockage)
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@associated_with_relatively_large_quantities_of_secretion)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has concomitant diseases with relatively large quantities of secretion (danger of secretion blockage)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_known_hypersensitivity_to_ambroxol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity to Ambroxol.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity to Ambroxol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity to Ambroxol.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to Ambroxol."} ;; "the patient has known hypersensitivity to Ambroxol"
(declare-const patient_has_known_hypersensitivity_to_auxiliary_substances_in_tablet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity to auxiliary substances contained in the tablet.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity to auxiliary substances contained in the tablet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity to auxiliary substances contained in the tablet.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to auxiliary substances contained in the tablet."} ;; "the patient has known hypersensitivity to auxiliary substances contained in the tablet"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_known_hypersensitivity_to_ambroxol_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to Ambroxol."

(assert
(! (not patient_has_known_hypersensitivity_to_auxiliary_substances_in_tablet_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to auxiliary substances contained in the tablet."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_tumor_finding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a tumor condition at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a tumor condition at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a tumor condition.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a tumor condition in their history."} ;; "previous tumour condition"
(declare-const patient_has_diagnosis_of_tumor_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a tumor condition.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a tumor condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a tumor condition.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a tumor condition."} ;; "existing tumour condition"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_tumor_finding_inthehistory)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous tumour condition."

(assert
(! (not patient_has_diagnosis_of_tumor_finding_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an existing tumour condition."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of alcohol abuse."} ;; "alcohol abuse"
(declare-const patient_has_finding_of_drug_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of drug abuse.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of drug abuse."} ;; "drug abuse"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alcohol abuse."

(assert
(! (not patient_has_finding_of_drug_abuse_now)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has drug abuse."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical trial.","when_to_set_to_false":"Set to false if the patient is currently not participating in a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in a clinical trial."} ;; "simultaneously participating in another clinical trial"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_undergoing_clinical_trial_now)
:named REQ9_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is simultaneously participating in another clinical trial."
