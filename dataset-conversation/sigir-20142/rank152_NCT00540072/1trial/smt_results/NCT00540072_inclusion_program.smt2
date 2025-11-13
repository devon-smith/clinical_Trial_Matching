;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_provided_informed_consent_signed_and_dated Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent and the consent document is both signed and dated.","when_to_set_to_false":"Set to false if the patient has not provided informed consent, or the consent document is missing either a signature or a date.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent that is both signed and dated.","meaning":"Boolean indicating whether the patient has provided informed consent that is both signed and dated."} ;; "To be included, the patient must provide (signed AND dated) informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_provided_informed_consent_signed_and_dated
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide signed informed consent."

(assert
  (! patient_has_provided_informed_consent_signed_and_dated
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide dated informed consent."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "age ≥ 18 years"
(declare-const patient_weight_value_recorded_now_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the patient's current body weight in kilograms if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current body weight in kilograms is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current body weight in kilograms."} ;; "weight ≤ 150 kilograms"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be an adult (age ≥ 18 years).
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an adult (age ≥ 18 years)."

;; Component 1: The patient must have weight ≤ 150 kilograms.
(assert
  (! (<= patient_weight_value_recorded_now_withunit_kg 150.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have weight ≤ 150 kilograms."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown or not documented.","meaning":"Indicates whether the patient's current recorded sex is female."} ;; "female of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's current childbearing potential status is unknown or not documented.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "female of childbearing potential"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or not documented.","meaning":"Indicates whether the patient is currently pregnant."} ;; "nonpregnant (confirmed by negative serum pregnancy test)"
(declare-const patient_has_undergone_serum_pregnancy_test_now_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a serum pregnancy test now and the result is negative.","when_to_set_to_false":"Set to false if the patient has undergone a serum pregnancy test now and the result is not negative (i.e., positive or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a serum pregnancy test now with a negative result.","meaning":"Boolean indicating whether the patient has undergone a serum pregnancy test now and the outcome is negative."} ;; "serum pregnancy test"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or not documented.","meaning":"Indicates whether the patient is currently lactating."} ;; "nonlactating"
(declare-const patient_is_willing_to_practice_reliable_birth_control_measures_during_treatment_with_study_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to practice reliable birth control measures during treatment with study drug(s).","when_to_set_to_false":"Set to false if the patient is not willing to practice reliable birth control measures during treatment with study drug(s).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to practice reliable birth control measures during treatment with study drug(s).","meaning":"Boolean indicating whether the patient is willing to practice reliable birth control measures during treatment with study drug(s)."} ;; "willing to practice reliable birth control measures during treatment with study drug(s)"
(declare-const patient_is_willing_to_practice_reliable_birth_control_measures_for_at_least_30_days_after_treatment_with_study_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to practice reliable birth control measures for at least 30 days after treatment with study drug(s).","when_to_set_to_false":"Set to false if the patient is not willing to practice reliable birth control measures for at least 30 days after treatment with study drug(s).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to practice reliable birth control measures for at least 30 days after treatment with study drug(s).","meaning":"Boolean indicating whether the patient is willing to practice reliable birth control measures for at least 30 days after treatment with study drug(s)."} ;; "willing to practice reliable birth control measures for at least 30 days after treatment with study drug(s)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; If the patient is a female of childbearing potential, then the negative serum pregnancy test implies not pregnant
(assert
  (! (=> (and patient_sex_is_female_now patient_has_childbearing_potential_now)
         (=> patient_has_undergone_serum_pregnancy_test_now_outcome_is_negative
             (not patient_is_pregnant_now)))
     :named REQ2_AUXILIARY0)) ;; "nonpregnant (confirmed by negative serum pregnancy test)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: If the patient is a female of childbearing potential, she must be nonpregnant (confirmed by negative serum pregnancy test)
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (and (not patient_is_pregnant_now)
              patient_has_undergone_serum_pregnancy_test_now_outcome_is_negative))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, if the patient is a female of childbearing potential, the patient must be nonpregnant (confirmed by negative serum pregnancy test)."

;; Component 1: If the patient is a female of childbearing potential, she must be nonlactating
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (not patient_is_lactating_now))
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, if the patient is a female of childbearing potential, the patient must be nonlactating."

;; Component 2: If the patient is a female of childbearing potential, she must be willing to practice reliable birth control measures during treatment with study drug(s)
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_is_willing_to_practice_reliable_birth_control_measures_during_treatment_with_study_drugs)
     :named REQ2_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, if the patient is a female of childbearing potential, the patient must be willing to practice reliable birth control measures during treatment with study drug(s)."

;; Component 3: If the patient is a female of childbearing potential, she must be willing to practice reliable birth control measures for at least 30 days after treatment with study drug(s)
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_is_willing_to_practice_reliable_birth_control_measures_for_at_least_30_days_after_treatment_with_study_drugs)
     :named REQ2_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, if the patient is a female of childbearing potential, the patient must be willing to practice reliable birth control measures for at least 30 days after treatment with study drug(s)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary infiltrate (radiologic infiltrate of lung).","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary infiltrate (radiologic infiltrate of lung).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary infiltrate (radiologic infiltrate of lung).","meaning":"Boolean indicating whether the patient currently has a pulmonary infiltrate (radiologic infiltrate of lung)."} ;; "pulmonary infiltrate"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now@@detected_on_chest_radiograph Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary infiltrate is detected on chest radiograph.","when_to_set_to_false":"Set to false if the patient's pulmonary infiltrate is not detected on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary infiltrate is detected on chest radiograph.","meaning":"Boolean indicating whether the patient's pulmonary infiltrate is detected on chest radiograph."} ;; "detected on chest radiograph"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now@@new Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary infiltrate is new (not previously present).","when_to_set_to_false":"Set to false if the patient's pulmonary infiltrate is not new (was previously present).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary infiltrate is new.","meaning":"Boolean indicating whether the patient's pulmonary infiltrate is new (not previously present)."} ;; "new pulmonary infiltrate"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_radiologic_infiltrate_of_lung_now@@detected_on_chest_radiograph
         patient_has_finding_of_radiologic_infiltrate_of_lung_now)
     :named REQ3_AUXILIARY0)) ;; "detected on chest radiograph"

(assert
  (! (=> patient_has_finding_of_radiologic_infiltrate_of_lung_now@@new
         patient_has_finding_of_radiologic_infiltrate_of_lung_now)
     :named REQ3_AUXILIARY1)) ;; "new pulmonary infiltrate"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_has_finding_of_radiologic_infiltrate_of_lung_now@@new
          patient_has_finding_of_radiologic_infiltrate_of_lung_now@@detected_on_chest_radiograph)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a new pulmonary infiltrate on chest radiograph."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_symptoms_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits cough as a symptom.","when_to_set_to_false":"Set to false if the patient currently does not exhibit cough as a symptom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits cough as a symptom.","meaning":"Boolean indicating whether the patient currently exhibits cough as a symptom."} ;; "cough"
(declare-const patient_has_symptoms_of_purulent_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently produces purulent sputum.","when_to_set_to_false":"Set to false if the patient currently does not produce purulent sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently produces purulent sputum.","meaning":"Boolean indicating whether the patient currently produces purulent sputum."} ;; "purulent sputum"
(declare-const patient_is_exposed_to_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently produces sputum.","when_to_set_to_false":"Set to false if the patient currently does not produce sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently produces sputum.","meaning":"Boolean indicating whether the patient currently produces sputum."} ;; "sputum"
(declare-const patient_is_exposed_to_sputum_now@@character_changed Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently produces sputum and the character of the sputum has changed.","when_to_set_to_false":"Set to false if the patient currently produces sputum but the character has not changed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the character of the sputum has changed.","meaning":"Boolean indicating whether the patient currently produces sputum and the character of the sputum has changed."} ;; "change in character of sputum"
(declare-const patient_has_finding_of_finding_by_auscultation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has auscultatory findings on examination.","when_to_set_to_false":"Set to false if the patient currently does not have auscultatory findings on examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has auscultatory findings on examination.","meaning":"Boolean indicating whether the patient currently has auscultatory findings on examination."} ;; "auscultatory findings"
(declare-const patient_has_finding_of_finding_by_auscultation_now@@of_rales Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has auscultatory findings and those findings are of rales.","when_to_set_to_false":"Set to false if the patient currently has auscultatory findings but those findings are not of rales.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the auscultatory findings are of rales.","meaning":"Boolean indicating whether the patient currently has auscultatory findings and those findings are of rales."} ;; "auscultatory findings of rales"
(declare-const patient_has_finding_of_lung_consolidation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of pulmonary consolidation.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of pulmonary consolidation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of pulmonary consolidation.","meaning":"Boolean indicating whether the patient currently has evidence of pulmonary consolidation."} ;; "pulmonary consolidation"
(declare-const patient_has_symptoms_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not exhibit dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits dyspnea.","meaning":"Boolean indicating whether the patient currently exhibits dyspnea."} ;; "dyspnea"
(declare-const patient_has_symptoms_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits tachypnea.","when_to_set_to_false":"Set to false if the patient currently does not exhibit tachypnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits tachypnea.","meaning":"Boolean indicating whether the patient currently exhibits tachypnea."} ;; "tachypnea"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has documented fever.","when_to_set_to_false":"Set to false if the patient currently does not have documented fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has documented fever.","meaning":"Boolean indicating whether the patient currently has documented fever."} ;; "documented fever"
(declare-const patient_has_finding_of_hypothermia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypothermia.","when_to_set_to_false":"Set to false if the patient currently does not have hypothermia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypothermia.","meaning":"Boolean indicating whether the patient currently has hypothermia."} ;; "hypothermia"
(declare-const patient_has_finding_of_increased_blood_leukocyte_number_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an increased total peripheral white blood cell count.","when_to_set_to_false":"Set to false if the patient currently does not have an increased total peripheral white blood cell count.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an increased total peripheral white blood cell count.","meaning":"Boolean indicating whether the patient currently has an increased total peripheral white blood cell count."} ;; "elevated total peripheral white blood cell count"
(declare-const patient_has_finding_of_decreased_blood_leukocyte_number_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has decreased total peripheral white blood cell count (leukopenia).","when_to_set_to_false":"Set to false if the patient currently does not have decreased total peripheral white blood cell count (leukopenia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased total peripheral white blood cell count (leukopenia).","meaning":"Boolean indicating whether the patient currently has decreased total peripheral white blood cell count (leukopenia)."} ;; "leukopenia"
(declare-const patient_has_finding_of_immature_neutrophil_percentage_now Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the percentage of immature neutrophils (bands) in the patient's peripheral blood currently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the percentage of immature neutrophils (bands) is currently.","meaning":"Numeric value indicating the percentage of immature neutrophils (bands) in the patient's peripheral blood currently."} ;; "> 15 percent immature neutrophils (bands)"
(declare-const patient_has_finding_of_hypoxemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypoxemia.","when_to_set_to_false":"Set to false if the patient currently does not have hypoxemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoxemia.","meaning":"Boolean indicating whether the patient currently has hypoxemia."} ;; "hypoxemia"

;; Additional numeric variables for lab values and measurements
(declare-const patient_total_peripheral_white_blood_cell_count_value_now_per_mm3 Real) ;; {"when_to_set_to_value":"Set to the patient's current total peripheral white blood cell count in cells per cubic millimeter if known and documented.","when_to_set_to_null":"Set to null if the patient's current total peripheral white blood cell count is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current total peripheral white blood cell count in cells per cubic millimeter."} ;; "white blood cell count > 10,000 per cubic millimeter; < 4,500 per cubic millimeter"
(declare-const patient_partial_pressure_of_oxygen_value_now_mmHg Real) ;; {"when_to_set_to_value":"Set to the patient's current partial pressure of oxygen in mmHg if known and documented.","when_to_set_to_null":"Set to null if the patient's current partial pressure of oxygen is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current partial pressure of oxygen in mmHg."} ;; "partial pressure of oxygen < 60 mmHg"
(declare-const patient_oxygen_saturation_value_now_percent Real) ;; {"when_to_set_to_value":"Set to the patient's current oxygen saturation in percent if known and documented.","when_to_set_to_null":"Set to null if the patient's current oxygen saturation is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current oxygen saturation in percent."} ;; "oxygen saturation < 90 percent"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Sputum character changed implies sputum production
(assert
  (! (=> patient_is_exposed_to_sputum_now@@character_changed
         patient_is_exposed_to_sputum_now)
     :named REQ4_AUXILIARY0)) ;; "change in character of sputum" implies "sputum"

;; Auscultatory finding of rales implies auscultatory finding
(assert
  (! (=> patient_has_finding_of_finding_by_auscultation_now@@of_rales
         patient_has_finding_of_finding_by_auscultation_now)
     :named REQ4_AUXILIARY1)) ;; "auscultatory findings of rales" implies "auscultatory findings"

;; Pulmonary consolidation umbrella: non-exhaustive examples (dullness to percussion, bronchial breath sounds, egophony) not explicitly listed, so not encoded here.

;; Increased WBC count definition
(assert
  (! (= patient_has_finding_of_increased_blood_leukocyte_number_now
        (> patient_total_peripheral_white_blood_cell_count_value_now_per_mm3 10000.0))
     :named REQ4_AUXILIARY2)) ;; "elevated total peripheral white blood cell count (white blood cell count > 10,000 per cubic millimeter)"

;; Decreased WBC count (leukopenia) definition
(assert
  (! (= patient_has_finding_of_decreased_blood_leukocyte_number_now
        (< patient_total_peripheral_white_blood_cell_count_value_now_per_mm3 4500.0))
     :named REQ4_AUXILIARY3)) ;; "leukopenia (total white blood cell count < 4,500 per cubic millimeter)"

;; Immature neutrophil percentage > 15% definition
(define-fun patient_has_finding_of_immature_neutrophil_percentage_above_15_now () Bool
  (> patient_has_finding_of_immature_neutrophil_percentage_now 15.0)) ;; "> 15 percent immature neutrophils (bands)"

;; Hypoxemia definition: partial pressure of oxygen < 60 mmHg OR oxygen saturation < 90%
(define-fun patient_has_finding_of_hypoxemia_by_lab_now () Bool
  (or (< patient_partial_pressure_of_oxygen_value_now_mmHg 60.0)
      (< patient_oxygen_saturation_value_now_percent 90.0))) ;; "partial pressure of oxygen < 60 mmHg OR oxygen saturation < 90 percent"

(assert
  (! (= patient_has_finding_of_hypoxemia_now
        patient_has_finding_of_hypoxemia_by_lab_now)
     :named REQ4_AUXILIARY4)) ;; "hypoxemia" defined by lab values

;; ===================== Constraint Assertions (REQ 4) =====================
;; At least two of the following symptoms/findings must be present:
;; cough
;; purulent sputum
;; change in character of sputum
;; auscultatory findings of rales
;; pulmonary consolidation
;; dyspnea
;; tachypnea
;; documented fever
;; hypothermia
;; elevated total peripheral white blood cell count
;; >15% immature neutrophils (bands)
;; leukopenia
;; hypoxemia

(define-fun REQ4_symptom_count () Int
  (+ (ite patient_has_symptoms_of_cough_now 1 0)
     (ite patient_has_symptoms_of_purulent_sputum_now 1 0)
     (ite patient_is_exposed_to_sputum_now@@character_changed 1 0)
     (ite patient_has_finding_of_finding_by_auscultation_now@@of_rales 1 0)
     (ite patient_has_finding_of_lung_consolidation_now 1 0)
     (ite patient_has_symptoms_of_dyspnea_now 1 0)
     (ite patient_has_symptoms_of_tachypnea_now 1 0)
     (ite patient_has_finding_of_fever_now 1 0)
     (ite patient_has_finding_of_hypothermia_now 1 0)
     (ite patient_has_finding_of_increased_blood_leukocyte_number_now 1 0)
     (ite patient_has_finding_of_immature_neutrophil_percentage_above_15_now 1 0)
     (ite patient_has_finding_of_decreased_blood_leukocyte_number_now 1 0)
     (ite patient_has_finding_of_hypoxemia_now 1 0)
  )) ;; "at least two of the following clinical symptoms of pneumonia..."

(assert
  (! (>= REQ4_symptom_count 2)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must exhibit at least two of the following clinical symptoms of pneumonia..."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "To be included, the patient must have pneumonia which requires (hospitalization AND intravenous therapy for ≥ 5 days)."
(declare-const patient_has_finding_of_pneumonia_now@@requires_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia requires hospitalization.","when_to_set_to_false":"Set to false if the patient's current pneumonia does not require hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia requires hospitalization.","meaning":"Boolean indicating whether the patient's current pneumonia requires hospitalization."} ;; "To be included, the patient must have pneumonia which requires hospitalization."
(declare-const patient_has_finding_of_pneumonia_now@@requires_intravenous_therapy_for_at_least_5_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia requires intravenous therapy for at least 5 days.","when_to_set_to_false":"Set to false if the patient's current pneumonia does not require intravenous therapy for at least 5 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia requires intravenous therapy for at least 5 days.","meaning":"Boolean indicating whether the patient's current pneumonia requires intravenous therapy for at least 5 days."} ;; "To be included, the patient must have pneumonia which requires intravenous therapy for ≥ 5 days."
(declare-const patient_has_finding_of_pneumonia_now@@intravenous_therapy_duration_days Real) ;; {"when_to_set_to_value":"Set to the number of days of intravenous therapy required for the patient's current pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days of intravenous therapy are required for the patient's current pneumonia.","meaning":"Numeric value indicating the number of days of intravenous therapy required for the patient's current pneumonia (unit: days)."} ;; "intravenous therapy for ≥ 5 days"
(declare-const patient_has_finding_of_pneumonia_now@@requires_intravenous_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia and the pneumonia requires intravenous therapy.","when_to_set_to_false":"Set to false if the patient currently has pneumonia and the pneumonia does not require intravenous therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia requires intravenous therapy.","meaning":"Boolean indicating whether the patient's current pneumonia requires intravenous therapy."} ;; "pneumonia which requires intravenous therapy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_pneumonia_now@@requires_hospitalization
         patient_has_finding_of_pneumonia_now)
     :named REQ5_AUXILIARY0)) ;; "pneumonia which requires hospitalization"

(assert
  (! (=> patient_has_finding_of_pneumonia_now@@requires_intravenous_therapy_for_at_least_5_days
         patient_has_finding_of_pneumonia_now)
     :named REQ5_AUXILIARY1)) ;; "pneumonia which requires intravenous therapy for ≥ 5 days"

;; Duration-based definition for intravenous therapy requirement
(assert
  (! (= patient_has_finding_of_pneumonia_now@@requires_intravenous_therapy_for_at_least_5_days
        (and patient_has_finding_of_pneumonia_now@@requires_intravenous_therapy
             (>= patient_has_finding_of_pneumonia_now@@intravenous_therapy_duration_days 5.0)))
     :named REQ5_AUXILIARY2)) ;; "requires intravenous therapy for ≥ 5 days" is true iff requires intravenous therapy AND duration ≥ 5 days

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: pneumonia which requires hospitalization
(assert
  (! patient_has_finding_of_pneumonia_now@@requires_hospitalization
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have pneumonia which requires hospitalization."

;; Component 1: pneumonia which requires intravenous therapy for ≥ 5 days
(assert
  (! patient_has_finding_of_pneumonia_now@@requires_intravenous_therapy_for_at_least_5_days
     :named REQ5_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have pneumonia which requires intravenous therapy for ≥ 5 days."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_willing_to_participate_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to participate in this study.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to participate in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to participate in this study.","meaning":"Boolean indicating whether the patient is willing to participate in this study."} ;; "To be included, the patient must be willing to participate in this study."
(declare-const patient_is_willing_to_complete_all_follow_up_assessments Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to complete all follow-up assessments required by the study.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to complete all follow-up assessments required by the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to complete all follow-up assessments required by the study.","meaning":"Boolean indicating whether the patient is willing to complete all follow-up assessments required by the study."} ;; "To be included, the patient must be willing to complete all follow-up assessments."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_willing_to_participate_in_this_study
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to participate in this study."

(assert
  (! patient_is_willing_to_complete_all_follow_up_assessments
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to complete all follow-up assessments."
