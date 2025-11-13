;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_contraindication_to_study_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to the administration of any of the study treatments.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to the administration of any of the study treatments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to the administration of any of the study treatments.","meaning":"Boolean indicating whether the patient currently has a contraindication to the administration of any of the study treatments."} ;; "contraindication to the administration of any of the study treatments"

(declare-const patient_has_hypersensitivity_to_glycopeptide_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to any glycopeptide-containing product.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to any glycopeptide-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to any glycopeptide-containing product.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to any glycopeptide-containing product."} ;; "hypersensitivity to any of the glycopeptide agents"

(declare-const patient_has_finding_of_beta_lactam_adverse_reaction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of adverse reaction (hypersensitivity) to any beta-lactam agent.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of adverse reaction (hypersensitivity) to any beta-lactam agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of adverse reaction (hypersensitivity) to any beta-lactam agent.","meaning":"Boolean indicating whether the patient currently has a clinical finding of adverse reaction (hypersensitivity) to any beta-lactam agent."} ;; "hypersensitivity to any of the beta-lactam agents"

(declare-const patient_has_hypersensitivity_to_linezolid_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to linezolid-containing product.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to linezolid-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to linezolid-containing product.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to linezolid-containing product."} ;; "hypersensitivity to linezolid"

(declare-const patient_has_finding_of_macrolide_adverse_reaction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of adverse reaction (hypersensitivity) to any macrolide antibiotic.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of adverse reaction (hypersensitivity) to any macrolide antibiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of adverse reaction (hypersensitivity) to any macrolide antibiotic.","meaning":"Boolean indicating whether the patient currently has a clinical finding of adverse reaction (hypersensitivity) to any macrolide antibiotic."} ;; "hypersensitivity to any of the macrolide antibiotics"

(declare-const patient_is_taking_monoamine_oxidase_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a monoamine oxidase inhibitor-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a monoamine oxidase inhibitor-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a monoamine oxidase inhibitor-containing product.","meaning":"Boolean indicating whether the patient is currently taking a monoamine oxidase inhibitor-containing product."} ;; "current use of monoamine oxidase inhibitor drugs"

(declare-const patient_has_taken_monoamine_oxidase_inhibitor_containing_product_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a monoamine oxidase inhibitor-containing product within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not taken a monoamine oxidase inhibitor-containing product within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a monoamine oxidase inhibitor-containing product within the past 2 weeks.","meaning":"Boolean indicating whether the patient has taken a monoamine oxidase inhibitor-containing product within the past 2 weeks."} ;; "recent use of monoamine oxidase inhibitor drugs within 2 weeks"

(declare-const patient_is_exposed_to_serotonin_uptake_inhibitor_inthepast5weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to serotonergic antidepressant drugs within the past 5 weeks.","when_to_set_to_false":"Set to false if the patient is not currently exposed to serotonergic antidepressant drugs within the past 5 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to serotonergic antidepressant drugs within the past 5 weeks.","meaning":"Boolean indicating whether the patient is currently exposed to serotonergic antidepressant drugs within the past 5 weeks."} ;; "current use of serotonergic antidepressant drugs within 5 weeks for fluoxetine" and "recent use of serotonergic antidepressant drugs within 5 weeks for fluoxetine"

(declare-const patient_is_exposed_to_serotonin_uptake_inhibitor_inthepast5weeks@@specific_to_fluoxetine Bool) ;; {"when_to_set_to_true":"Set to true if the serotonergic antidepressant drug exposure within the past 5 weeks is specifically fluoxetine.","when_to_set_to_false":"Set to false if the serotonergic antidepressant drug exposure within the past 5 weeks is not specifically fluoxetine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serotonergic antidepressant drug exposure within the past 5 weeks is specifically fluoxetine.","meaning":"Boolean indicating whether the patient is currently exposed to serotonergic antidepressant drugs within the past 5 weeks, specifically fluoxetine."} ;; "current use of serotonergic antidepressant drugs within 5 weeks for fluoxetine" and "recent use of serotonergic antidepressant drugs within 5 weeks for fluoxetine"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_hypersensitivity_to_glycopeptide_containing_product_now
           patient_has_finding_of_beta_lactam_adverse_reaction_now
           patient_has_hypersensitivity_to_linezolid_containing_product_now
           patient_has_finding_of_macrolide_adverse_reaction_now
           patient_is_taking_monoamine_oxidase_inhibitor_containing_product_now
           patient_has_taken_monoamine_oxidase_inhibitor_containing_product_inthepast2weeks
           patient_is_exposed_to_serotonin_uptake_inhibitor_inthepast5weeks
           patient_is_exposed_to_serotonin_uptake_inhibitor_inthepast5weeks@@specific_to_fluoxetine)
    patient_has_contraindication_to_study_treatment_now)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((hypersensitivity to any of the glycopeptide agents) OR (hypersensitivity to any of the beta-lactam agents) OR (hypersensitivity to linezolid) OR (hypersensitivity to any of the macrolide antibiotics) OR (current use of monoamine oxidase inhibitor drugs) OR (recent use of monoamine oxidase inhibitor drugs within 2 weeks) OR (current use of serotonergic antidepressant drugs within 5 weeks for fluoxetine) OR (recent use of serotonergic antidepressant drugs within 5 weeks for fluoxetine))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_serotonin_uptake_inhibitor_inthepast5weeks@@specific_to_fluoxetine
       patient_is_exposed_to_serotonin_uptake_inhibitor_inthepast5weeks)
:named REQ0_AUXILIARY1)) ;; "within 5 weeks for fluoxetine"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_contraindication_to_study_treatment_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to the administration of any of the study treatments with non-exhaustive examples..."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_antibiotic_therapy_inthepast4days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy at any time in the 4 days prior to screening.","when_to_set_to_false":"Set to false if the patient has not undergone antibiotic therapy in the 4 days prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic therapy in the 4 days prior to screening.","meaning":"Boolean indicating whether the patient has undergone antibiotic therapy in the 4 days prior to screening."} ;; "the patient has received antibiotic therapy in the 4 days prior to screening"
(declare-const patient_has_undergone_antibiotic_therapy_inthepast4days@@temporalcontext_within4days_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the 4-day window for antibiotic therapy is anchored to the period immediately prior to the screening event.","when_to_set_to_false":"Set to false if the 4-day window is not anchored to the screening event or is anchored to a different event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the 4-day window is anchored to the screening event.","meaning":"Boolean indicating whether the 4-day window for antibiotic therapy is anchored to the screening event."} ;; "in the 4 days prior to screening"
(declare-const patient_has_received_single_dose_of_short_acting_antibiotic_with_half_life_less_than_8_hours_in_the_past_4_days_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received only a single dose of a short acting antibiotic with half life less than 8 hours in the 4 days prior to screening.","when_to_set_to_false":"Set to false if the patient has not received only a single dose of a short acting antibiotic with half life less than 8 hours in the 4 days prior to screening, or has received more than one dose, or the antibiotic is not short acting with half life less than 8 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received only a single dose of a short acting antibiotic with half life less than 8 hours in the 4 days prior to screening.","meaning":"Boolean indicating whether the patient has received only a single dose of a short acting antibiotic with half life less than 8 hours in the 4 days prior to screening."} ;; "the patient has received only a single dose of a short acting antibiotic with half life less than 8 hours in the 4 days prior to screening"
(declare-const proportion_of_patients_enrolled_with_single_dose_short_acting_antibiotic_with_half_life_less_than_8_hours Real) ;; {"when_to_set_to_value":"Set to the proportion (decimal between 0 and 1) of patients enrolled who have received only a single dose of a short acting antibiotic with half life less than 8 hours in the 4 days prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what proportion of patients enrolled have received only a single dose of a short acting antibiotic with half life less than 8 hours in the 4 days prior to screening.","meaning":"Numeric value representing the proportion (decimal between 0 and 1) of patients enrolled who have received only a single dose of a short acting antibiotic with half life less than 8 hours in the 4 days prior to screening."} ;; "the proportion of such patients enrolled is less than 25%"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_antibiotic_therapy_inthepast4days@@temporalcontext_within4days_prior_to_screening
      patient_has_undergone_antibiotic_therapy_inthepast4days)
:named REQ1_AUXILIARY0)) ;; "in the 4 days prior to screening"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient has received antibiotic therapy in the 4 days prior to screening AND NOT (single dose of short acting antibiotic with half life <8h AND proportion <25%)
(assert
(! (not (and patient_has_undergone_antibiotic_therapy_inthepast4days@@temporalcontext_within4days_prior_to_screening
             (not (and patient_has_received_single_dose_of_short_acting_antibiotic_with_half_life_less_than_8_hours_in_the_past_4_days_prior_to_screening
                       (< proportion_of_patients_enrolled_with_single_dose_short_acting_antibiotic_with_half_life_less_than_8_hours 0.25)))))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received antibiotic therapy in the 4 days prior to screening AND NOT (the patient has received only a single dose of a short acting antibiotic with half life less than 8 hours AND the proportion of such patients enrolled is less than 25%))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_aspiration_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aspiration pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aspiration pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of aspiration pneumonia.","meaning":"Boolean indicating whether the patient currently has aspiration pneumonia."} ;; "aspiration pneumonia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_aspiration_pneumonia_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has aspiration pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hospital_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hospital acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hospital acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hospital acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has hospital acquired pneumonia."} ;; "hospital acquired pneumonia"
(declare-const patient_has_finding_of_ventilator_associated_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventilator associated pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventilator associated pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ventilator associated pneumonia.","meaning":"Boolean indicating whether the patient currently has ventilator associated pneumonia."} ;; "ventilator associated pneumonia"
(declare-const patient_has_finding_of_healthcare_associated_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of healthcare associated pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of healthcare associated pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has healthcare associated pneumonia.","meaning":"Boolean indicating whether the patient currently has healthcare associated pneumonia."} ;; "healthcare associated pneumonia"
(declare-const days_spent_in_hospital_in_previous_90_days_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the total number of days the patient has spent in hospital during the previous 90 days, measured in days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the patient has spent in hospital during the previous 90 days.","meaning":"Numeric value indicating the total number of days the patient has spent in hospital during the previous 90 days, measured in days."} ;; "spent greater than or equal to 2 days in hospital in the previous 90 days"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hospital_acquired_pneumonia_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hospital acquired pneumonia."

(assert
(! (not patient_has_finding_of_ventilator_associated_pneumonia_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ventilator associated pneumonia."

(assert
(! (not patient_has_finding_of_healthcare_associated_pneumonia_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has healthcare associated pneumonia."

(assert
(! (not (>= days_spent_in_hospital_in_previous_90_days_value_recorded_in_days 2))
:named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has spent greater than or equal to 2 days in hospital in the previous 90 days."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis."} ;; "the patient has cystic fibrosis"

(declare-const patient_has_diagnosis_of_pneumocystosis_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Pneumocystis pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Pneumocystis pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Pneumocystis pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Pneumocystis pneumonia."} ;; "the patient has known Pneumocystis pneumonia" or "the patient has suspected Pneumocystis pneumonia"

(declare-const patient_has_diagnosis_of_pneumocystosis_pneumonia_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Pneumocystis pneumonia and the diagnosis is known (confirmed).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of Pneumocystis pneumonia but the diagnosis is not known (e.g., only suspected).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of Pneumocystis pneumonia is known.","meaning":"Boolean indicating whether the patient's current diagnosis of Pneumocystis pneumonia is known (confirmed)."} ;; "the patient has known Pneumocystis pneumonia"

(declare-const patient_has_diagnosis_of_pneumocystosis_pneumonia_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Pneumocystis pneumonia and the diagnosis is suspected (not confirmed).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of Pneumocystis pneumonia but the diagnosis is not suspected (e.g., known/confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of Pneumocystis pneumonia is suspected.","meaning":"Boolean indicating whether the patient's current diagnosis of Pneumocystis pneumonia is suspected (not confirmed)."} ;; "the patient has suspected Pneumocystis pneumonia"

(declare-const patient_has_diagnosis_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of active tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of active tuberculosis."} ;; "the patient has known active tuberculosis" or "the patient has suspected active tuberculosis"

(declare-const patient_has_diagnosis_of_active_tuberculosis_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of active tuberculosis and the diagnosis is known (confirmed).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of active tuberculosis but the diagnosis is not known (e.g., only suspected).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of active tuberculosis is known.","meaning":"Boolean indicating whether the patient's current diagnosis of active tuberculosis is known (confirmed)."} ;; "the patient has known active tuberculosis"

(declare-const patient_has_diagnosis_of_active_tuberculosis_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of active tuberculosis and the diagnosis is suspected (not confirmed).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of active tuberculosis but the diagnosis is not suspected (e.g., known/confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of active tuberculosis is suspected.","meaning":"Boolean indicating whether the patient's current diagnosis of active tuberculosis is suspected (not confirmed)."} ;; "the patient has suspected active tuberculosis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables for Pneumocystis pneumonia
(assert
(! (=> patient_has_diagnosis_of_pneumocystosis_pneumonia_now@@known
       patient_has_diagnosis_of_pneumocystosis_pneumonia_now)
    :named REQ4_AUXILIARY0)) ;; "the patient has known Pneumocystis pneumonia"

(assert
(! (=> patient_has_diagnosis_of_pneumocystosis_pneumonia_now@@suspected
       patient_has_diagnosis_of_pneumocystosis_pneumonia_now)
    :named REQ4_AUXILIARY1)) ;; "the patient has suspected Pneumocystis pneumonia"

;; Qualifier variables imply corresponding stem variables for active tuberculosis
(assert
(! (=> patient_has_diagnosis_of_active_tuberculosis_now@@known
       patient_has_diagnosis_of_active_tuberculosis_now)
    :named REQ4_AUXILIARY2)) ;; "the patient has known active tuberculosis"

(assert
(! (=> patient_has_diagnosis_of_active_tuberculosis_now@@suspected
       patient_has_diagnosis_of_active_tuberculosis_now)
    :named REQ4_AUXILIARY3)) ;; "the patient has suspected active tuberculosis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_cystic_fibrosis_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cystic fibrosis."

(assert
(! (not patient_has_diagnosis_of_pneumocystosis_pneumonia_now@@known)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known Pneumocystis pneumonia."

(assert
(! (not patient_has_diagnosis_of_pneumocystosis_pneumonia_now@@suspected)
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected Pneumocystis pneumonia."

(assert
(! (not patient_has_diagnosis_of_active_tuberculosis_now@@known)
    :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known active tuberculosis."

(assert
(! (not patient_has_diagnosis_of_active_tuberculosis_now@@suspected)
    :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected active tuberculosis."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is female.","when_to_set_to_false":"Set to false if the patient's current sex is not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown or cannot be determined.","meaning":"Boolean indicating whether the patient's current sex is female."} ;; "the patient is a female"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently of child-bearing potential (i.e., biologically capable of becoming pregnant).","when_to_set_to_false":"Set to false if the patient is not currently of child-bearing potential (e.g., postmenopausal, surgically sterile, or otherwise incapable of becoming pregnant).","when_to_set_to_null":"Set to null if the patient's child-bearing potential status is unknown or cannot be determined.","meaning":"Boolean indicating whether the patient is currently of child-bearing potential."} ;; "the patient is a female of child-bearing potential"
(declare-const patient_is_unable_to_take_adequate_contraceptive_precautions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to take adequate contraceptive precautions.","when_to_set_to_false":"Set to false if the patient is currently able to take adequate contraceptive precautions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to take adequate contraceptive precautions.","meaning":"Boolean indicating whether the patient is currently unable to take adequate contraceptive precautions."} ;; "unable to take adequate contraceptive precautions"
(declare-const patient_has_positive_pregnancy_test_result_within_24_hours_prior_to_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a positive pregnancy test result within 24 hours prior to study entry.","when_to_set_to_false":"Set to false if the patient does not have a positive pregnancy test result within 24 hours prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a positive pregnancy test result within 24 hours prior to study entry.","meaning":"Boolean indicating whether the patient has a positive pregnancy test result within 24 hours prior to study entry."} ;; "the patient has a positive pregnancy test result within 24 hours prior to study entry"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean indicating whether the patient is currently pregnant."} ;; "the patient is known to be pregnant"
(declare-const patient_has_finding_of_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breastfeeding"
(declare-const patient_has_finding_of_breastfeeding_now@@involves_infant Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding and the breastfeeding involves an infant.","when_to_set_to_false":"Set to false if the patient is currently breastfeeding but the breastfeeding does not involve an infant, or if the patient is not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the breastfeeding involves an infant.","meaning":"Boolean indicating whether the patient's current breastfeeding involves an infant."} ;; "the patient is currently breastfeeding an infant"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_breastfeeding_now@@involves_infant
       patient_has_finding_of_breastfeeding_now)
   :named REQ5_AUXILIARY0)) ;; "the patient is currently breastfeeding an infant"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: female of child-bearing potential unable to take adequate contraceptive precautions
(assert
(! (not (and patient_sex_is_female_now
             patient_has_childbearing_potential_now
             patient_is_unable_to_take_adequate_contraceptive_precautions_now))
   :named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is a female of child-bearing potential who is unable to take adequate contraceptive precautions"

;; Exclusion: positive pregnancy test result within 24 hours prior to study entry
(assert
(! (not patient_has_positive_pregnancy_test_result_within_24_hours_prior_to_study_entry)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a positive pregnancy test result within 24 hours prior to study entry"

;; Exclusion: known to be pregnant
(assert
(! (not patient_is_pregnant_now)
   :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is known to be pregnant"

;; Exclusion: currently breastfeeding an infant
(assert
(! (not patient_has_finding_of_breastfeeding_now@@involves_infant)
   :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient is currently breastfeeding an infant"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of lung (primary lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of lung (primary lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of lung."} ;; "primary lung cancer"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary malignant neoplasm of lung (metastatic lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary malignant neoplasm of lung (metastatic lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary malignant neoplasm of lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary malignant neoplasm of lung."} ;; "metastatic lung cancer"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has primary lung cancer."

(assert
(! (not patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has metastatic lung cancer."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_obstruction_of_bronchus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has obstruction of the bronchus.","when_to_set_to_false":"Set to false if the patient currently does not have obstruction of the bronchus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obstruction of the bronchus.","meaning":"Boolean indicating whether the patient currently has obstruction of the bronchus."} ;; "the patient has known bronchial obstruction"

(declare-const patient_has_finding_of_obstruction_of_bronchus_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's obstruction of the bronchus is known (documented or established).","when_to_set_to_false":"Set to false if the patient's obstruction of the bronchus is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's obstruction of the bronchus is known.","meaning":"Boolean indicating whether the patient's obstruction of the bronchus is known (documented or established)."} ;; "the patient has known bronchial obstruction"

(declare-const patient_has_finding_of_postobstructive_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of post-obstructive pneumonia.","when_to_set_to_false":"Set to false if the patient does not have a history of post-obstructive pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of post-obstructive pneumonia.","meaning":"Boolean indicating whether the patient has a history of post-obstructive pneumonia."} ;; "the patient has a history of post-obstructive pneumonia"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_obstruction_of_bronchus_now@@known
       patient_has_finding_of_obstruction_of_bronchus_now)
   :named REQ7_AUXILIARY0)) ;; "the patient has known bronchial obstruction"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have known bronchial obstruction or a history of post-obstructive pneumonia
(assert
(! (not (or patient_has_finding_of_obstruction_of_bronchus_now@@known
            patient_has_finding_of_postobstructive_pneumonia_inthehistory))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has known bronchial obstruction) OR (the patient has a history of post-obstructive pneumonia))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_undergoing_admission_to_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing admission to intensive care unit (i.e., requires ICU admission at baseline).","when_to_set_to_false":"Set to false if the patient is not currently undergoing admission to intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing admission to intensive care unit.","meaning":"Boolean indicating whether the patient is currently undergoing admission to intensive care unit."} ;; "requires admission to intensive care unit at baseline"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_is_undergoing_admission_to_intensive_care_unit_now)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires admission to intensive care unit at baseline."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_empyema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of empyema.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of empyema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has empyema.","meaning":"Boolean indicating whether the patient currently has empyema."} ;; "empyema"
(declare-const patient_has_finding_of_empyema_now@@requiring_drainage Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current empyema requires drainage.","when_to_set_to_false":"Set to false if the patient's current empyema does not require drainage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current empyema requires drainage.","meaning":"Boolean indicating whether the patient's current empyema requires drainage."} ;; "empyema requiring drainage"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_empyema_now@@requiring_drainage
       patient_has_finding_of_empyema_now)
   :named REQ9_AUXILIARY0)) ;; "empyema requiring drainage" implies "empyema"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_empyema_now@@requiring_drainage)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has empyema requiring drainage."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@causative_organism_known_prior_to_study_entry_to_be_resistant_to_either_treatment_regimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the causative organism was known prior to study entry to be resistant to either treatment regimen.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the causative organism was not known prior to study entry to be resistant to either treatment regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the causative organism was known prior to study entry to be resistant to either treatment regimen.","meaning":"Boolean indicating whether the patient's current infection is due to an organism known prior to study entry to be resistant to either treatment regimen."} ;; "infection due to an organism known prior to study entry to be resistant to either treatment regimen"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@causative_organism_known_prior_to_study_entry_to_be_resistant_to_either_treatment_regimen
      patient_has_finding_of_disorder_due_to_infection_now)
   :named REQ10_AUXILIARY0)) ;; "infection due to an organism known prior to study entry to be resistant to either treatment regimen"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@causative_organism_known_prior_to_study_entry_to_be_resistant_to_either_treatment_regimen)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an infection due to an organism known prior to study entry to be resistant to either treatment regimen."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@due_solely_to_atypical_pathogen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection is due solely to an atypical pathogen (e.g., Mycoplasma species, Chlamydia species, Legionella species).","when_to_set_to_false":"Set to false if the patient's current disorder due to infection is not due solely to an atypical pathogen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is due solely to an atypical pathogen.","meaning":"Boolean indicating whether the patient's current disorder due to infection is due solely to an atypical pathogen."} ;; "due solely to an atypical pathogen (e.g., Mycoplasma species, Chlamydia species, Legionella species)"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@known_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is known.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the infection is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is known.","meaning":"Boolean indicating whether the patient's current disorder due to infection is known."} ;; "known infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@suspected_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is suspected.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the infection is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is suspected.","meaning":"Boolean indicating whether the patient's current disorder due to infection is suspected."} ;; "suspected infection"

(declare-const patient_has_legionella_urinary_antigen_test_result_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a Legionella urinary antigen test result at baseline.","when_to_set_to_false":"Set to false if the patient does not have a Legionella urinary antigen test result at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a Legionella urinary antigen test result at baseline.","meaning":"Boolean indicating whether the patient has a Legionella urinary antigen test result at baseline."} ;; "Legionella urinary antigen test at baseline"

(declare-const patient_has_legionella_urinary_antigen_test_result_at_baseline@@positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Legionella urinary antigen test result at baseline is positive.","when_to_set_to_false":"Set to false if the patient's Legionella urinary antigen test result at baseline is not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Legionella urinary antigen test result at baseline is positive.","meaning":"Boolean indicating whether the patient's Legionella urinary antigen test result at baseline is positive."} ;; "positive Legionella urinary antigen test at baseline"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive examples imply umbrella term for atypical pathogen
(assert
(! (=> (or 
        ;; Mycoplasma species
        false
        ;; Chlamydia species
        false
        ;; Legionella species
        false)
    patient_has_finding_of_disorder_due_to_infection_now@@due_solely_to_atypical_pathogen)
:named REQ11_AUXILIARY0)) ;; "with non-exhaustive examples (Mycoplasma species, Chlamydia species, Legionella species)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@due_solely_to_atypical_pathogen
       patient_has_finding_of_disorder_due_to_infection_now)
:named REQ11_AUXILIARY1)) ;; "due solely to an atypical pathogen"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@known_infection
       patient_has_finding_of_disorder_due_to_infection_now)
:named REQ11_AUXILIARY2)) ;; "known infection"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@suspected_infection
       patient_has_finding_of_disorder_due_to_infection_now)
:named REQ11_AUXILIARY3)) ;; "suspected infection"

(assert
(! (=> patient_has_legionella_urinary_antigen_test_result_at_baseline@@positive
       patient_has_legionella_urinary_antigen_test_result_at_baseline)
:named REQ11_AUXILIARY4)) ;; "positive Legionella urinary antigen test at baseline"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: known infection due solely to an atypical pathogen
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_now@@known_infection
             patient_has_finding_of_disorder_due_to_infection_now@@due_solely_to_atypical_pathogen))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known infection due solely to an atypical pathogen..."

;; Exclusion: suspected infection due solely to an atypical pathogen
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_now@@suspected_infection
             patient_has_finding_of_disorder_due_to_infection_now@@due_solely_to_atypical_pathogen))
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected infection due solely to an atypical pathogen..."

;; Exclusion: positive Legionella urinary antigen test at baseline
(assert
(! (not patient_has_legionella_urinary_antigen_test_result_at_baseline@@positive)
:named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive Legionella urinary antigen test at baseline."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const absolute_neutrophil_count_value_recorded_now_withunit_cells_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's absolute neutrophil count measured now, in cells per cubic millimeter.","when_to_set_to_null":"Set to null if the absolute neutrophil count measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's absolute neutrophil count measured now, in cells per cubic millimeter."} ;; "absolute neutrophil count < 500 cells per cubic millimeter"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (< absolute_neutrophil_count_value_recorded_now_withunit_cells_per_cubic_millimeter 500))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an absolute neutrophil count < 500 cells per cubic millimeter."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently known to be infected with HIV.","when_to_set_to_false":"Set to false if the patient is currently known not to be infected with HIV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently known to be infected with HIV.","meaning":"Boolean indicating whether the patient is currently known to be infected with HIV."} ;; "known to be human immunodeficiency virus infected"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to be infected with HIV.","when_to_set_to_false":"Set to false if the patient is not currently suspected to be infected with HIV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to be infected with HIV.","meaning":"Boolean indicating whether the patient is currently suspected to be infected with HIV."} ;; "suspected to be human immunodeficiency virus infected"
(declare-const patient_detection_of_lymphocytes_positive_for_cd4_antigen_value_recorded_now_withunit_cells_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current CD4 cell count in cells per cubic millimeter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current CD4 cell count in cells per cubic millimeter."} ;; "CD4 cell count < 200 cells per cubic millimeter"
(declare-const patient_detection_of_lymphocytes_positive_for_cd4_antigen_value_recorded_now_withunit_cells_per_cubic_millimeter@@unknown Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current CD4 cell count is unknown.","when_to_set_to_false":"Set to false if the patient's current CD4 cell count is known.","when_to_set_to_null":"Set to null if it is indeterminate or not documented whether the patient's current CD4 cell count is unknown.","meaning":"Boolean indicating whether the patient's current CD4 cell count is unknown."} ;; "unknown CD4 cell count"
(declare-const patient_has_diagnosis_of_aids_associated_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of AIDS-defining condition.","when_to_set_to_false":"Set to false if the patient does not have a history of AIDS-defining condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of AIDS-defining condition.","meaning":"Boolean indicating whether the patient has a history of AIDS-defining condition."} ;; "past acquired immunodeficiency syndrome defining condition"
(declare-const patient_has_diagnosis_of_aids_associated_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an AIDS-defining condition.","when_to_set_to_false":"Set to false if the patient does not currently have an AIDS-defining condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an AIDS-defining condition.","meaning":"Boolean indicating whether the patient currently has an AIDS-defining condition."} ;; "current acquired immunodeficiency syndrome defining condition"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: known HIV infection AND CD4 < 200
(assert
(! (not (and patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
             (< patient_detection_of_lymphocytes_positive_for_cd4_antigen_value_recorded_now_withunit_cells_per_cubic_millimeter 200)))
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is known to be human immunodeficiency virus infected AND the patient has a CD4 cell count < 200 cells per cubic millimeter."

;; Exclusion: suspected HIV infection AND CD4 < 200
(assert
(! (not (and patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now@@suspected
             (< patient_detection_of_lymphocytes_positive_for_cd4_antigen_value_recorded_now_withunit_cells_per_cubic_millimeter 200)))
    :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected to be human immunodeficiency virus infected AND the patient has a CD4 cell count < 200 cells per cubic millimeter."

;; Exclusion: known HIV infection AND past AIDS-defining condition AND unknown CD4
(assert
(! (not (and patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
             patient_has_diagnosis_of_aids_associated_disorder_inthehistory
             patient_detection_of_lymphocytes_positive_for_cd4_antigen_value_recorded_now_withunit_cells_per_cubic_millimeter@@unknown))
    :named REQ13_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is known to be human immunodeficiency virus infected AND the patient has a past acquired immunodeficiency syndrome defining condition AND the patient has an unknown CD4 cell count."

;; Exclusion: known HIV infection AND current AIDS-defining condition AND unknown CD4
(assert
(! (not (and patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
             patient_has_diagnosis_of_aids_associated_disorder_now
             patient_detection_of_lymphocytes_positive_for_cd4_antigen_value_recorded_now_withunit_cells_per_cubic_millimeter@@unknown))
    :named REQ13_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is known to be human immunodeficiency virus infected AND the patient has a current acquired immunodeficiency syndrome defining condition AND the patient has an unknown CD4 cell count."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_undergone_transplantation_of_bone_marrow_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a bone marrow transplant at or near the present time (i.e., recently).","when_to_set_to_false":"Set to false if the patient has not undergone a bone marrow transplant at or near the present time (i.e., not recently).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a bone marrow transplant at or near the present time.","meaning":"Boolean indicating whether the patient has undergone a bone marrow transplant at or near the present time."} ;; "bone marrow transplant"
(declare-const patient_is_in_post_transplant_hospital_stay_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in the hospital stay period following a bone marrow transplant.","when_to_set_to_false":"Set to false if the patient is not currently in the hospital stay period following a bone marrow transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in the hospital stay period following a bone marrow transplant.","meaning":"Boolean indicating whether the patient is currently in the post-transplant hospital stay following a bone marrow transplant."} ;; "the patient is in the post-transplant hospital stay"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (and patient_has_undergone_transplantation_of_bone_marrow_now
             patient_is_in_post_transplant_hospital_stay_now))
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had a recent bone marrow transplant AND the patient is in the post-transplant hospital stay)."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_prednisolone_value_recorded_now_withunit_mg_per_day Real) ;; {"when_to_set_to_value":"Set to the current daily dose (in mg per day) of prednisolone (or equivalent oral steroid) the patient is receiving, if available.","when_to_set_to_null":"Set to null if the current daily dose of prednisolone (or equivalent oral steroid) is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the patient's current daily dose of prednisolone (or equivalent oral steroid) in mg per day."} ;; "oral steroid drugs > 40 mg prednisolone per day (or equivalent)"
(declare-const patient_is_receiving_immunosuppressant_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving immunosuppressant drugs.","when_to_set_to_false":"Set to false if the patient is currently not receiving immunosuppressant drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving immunosuppressant drugs.","meaning":"Boolean indicating whether the patient is currently receiving immunosuppressant drugs."} ;; "receiving immunosuppressant drugs"
(declare-const patient_is_receiving_immunosuppressant_drugs_now@@after_organ_transplantation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving immunosuppressant drugs after organ transplantation.","when_to_set_to_false":"Set to false if the patient is currently receiving immunosuppressant drugs but not after organ transplantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving immunosuppressant drugs after organ transplantation.","meaning":"Boolean indicating whether the patient is currently receiving immunosuppressant drugs after organ transplantation."} ;; "receiving immunosuppressant drugs after organ transplantation"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_receiving_immunosuppressant_drugs_now@@after_organ_transplantation
      patient_is_receiving_immunosuppressant_drugs_now)
:named REQ15_AUXILIARY0)) ;; "receiving immunosuppressant drugs after organ transplantation"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion: patient must NOT be receiving oral steroid drugs > 40 mg prednisolone per day (or equivalent)
(assert
(! (not (> patient_prednisolone_value_recorded_now_withunit_mg_per_day 40))
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "receiving oral steroid drugs > 40 mg prednisolone per day (or equivalent)"

;; Exclusion: patient must NOT be receiving immunosuppressant drugs after organ transplantation
(assert
(! (not patient_is_receiving_immunosuppressant_drugs_now@@after_organ_transplantation)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "receiving immunosuppressant drugs after organ transplantation"

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness.","when_to_set_to_false":"Set to false if the patient currently does not have an illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an illness.","meaning":"Boolean indicating whether the patient currently has an illness."} ;; "illness"

(declare-const patient_has_finding_of_illness_now@@rapidly_fatal Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness and that illness is rapidly fatal.","when_to_set_to_false":"Set to false if the patient currently has an illness and that illness is not rapidly fatal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is rapidly fatal.","meaning":"Boolean indicating whether the patient's current illness is rapidly fatal."} ;; "rapidly fatal illness"

(declare-const patient_expected_survival_time_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's expected survival time from now, in months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's expected survival time from now is.","meaning":"Numeric value indicating the patient's expected survival time from now, in months."} ;; "not expected to survive for 3 months"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_illness_now@@rapidly_fatal
       patient_has_finding_of_illness_now)
   :named REQ16_AUXILIARY0)) ;; "the patient has a rapidly fatal illness"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (and patient_has_finding_of_illness_now@@rapidly_fatal
             (< patient_expected_survival_time_value_recorded_now_withunit_months 3)))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a rapidly fatal illness AND the patient is not expected to survive for 3 months)."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute disease.","when_to_set_to_false":"Set to false if the patient currently does not have an acute disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute disease.","meaning":"Boolean indicating whether the patient currently has an acute disease."} ;; "acute medical condition"
(declare-const patient_has_finding_of_acute_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has an acute disease but the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute disease is severe.","meaning":"Boolean indicating whether the patient currently has a severe acute disease."} ;; "severe acute medical condition"
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease.","meaning":"Boolean indicating whether the patient currently has a chronic disease."} ;; "chronic medical condition"
(declare-const patient_has_finding_of_chronic_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has a chronic disease but the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic disease is severe.","meaning":"Boolean indicating whether the patient currently has a severe chronic disease."} ;; "severe chronic medical condition"
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder.","meaning":"Boolean indicating whether the patient currently has a mental disorder."} ;; "psychiatric condition"
(declare-const patient_has_finding_of_mental_disorder_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder and the disorder is acute.","when_to_set_to_false":"Set to false if the patient currently has a mental disorder but the disorder is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disorder is acute.","meaning":"Boolean indicating whether the patient currently has an acute mental disorder."} ;; "acute psychiatric condition"
(declare-const patient_has_finding_of_mental_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder and the disorder is severe.","when_to_set_to_false":"Set to false if the patient currently has a mental disorder but the disorder is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disorder is severe.","meaning":"Boolean indicating whether the patient currently has a severe mental disorder."} ;; "severe psychiatric condition"
(declare-const patient_has_finding_of_chronic_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic mental disorder.","meaning":"Boolean indicating whether the patient currently has a chronic mental disorder."} ;; "chronic psychiatric condition"
(declare-const patient_has_finding_of_chronic_mental_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic mental disorder and the disorder is severe.","when_to_set_to_false":"Set to false if the patient currently has a chronic mental disorder but the disorder is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic mental disorder is severe.","meaning":"Boolean indicating whether the patient currently has a severe chronic mental disorder."} ;; "severe chronic psychiatric condition"
(declare-const patient_has_finding_of_laboratory_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a laboratory abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have a laboratory abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a laboratory abnormality.","meaning":"Boolean indicating whether the patient currently has a laboratory abnormality."} ;; "laboratory abnormality"
(declare-const patient_has_finding_of_laboratory_abnormality_now@@increases_risk_or_interferes_with_study_and_investigator_judges_inappropriate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current laboratory abnormality may increase the risk associated with study participation or investigational product administration or may interfere with the interpretation of study results and, in the judgment of the investigator, would make the patient inappropriate for entry into this study.","when_to_set_to_false":"Set to false if the patient's current laboratory abnormality does not meet these criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the laboratory abnormality meets these criteria.","meaning":"Boolean indicating whether the patient's current laboratory abnormality may increase risk or interfere with study and, in the investigator's judgment, makes the patient inappropriate for study entry."} ;; "laboratory abnormality that may increase the risk associated with study participation or investigational product administration or may interfere with the interpretation of study results AND, in the judgment of the investigator, would make the patient inappropriate for entry into this study"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_acute_disease_now@@severe
      patient_has_finding_of_acute_disease_now)
    :named REQ17_AUXILIARY0)) ;; "severe acute medical condition"

(assert
(! (=> patient_has_finding_of_chronic_disease_now@@severe
      patient_has_finding_of_chronic_disease_now)
    :named REQ17_AUXILIARY1)) ;; "severe chronic medical condition"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@acute
      patient_has_finding_of_mental_disorder_now)
    :named REQ17_AUXILIARY2)) ;; "acute psychiatric condition"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@severe
      patient_has_finding_of_mental_disorder_now)
    :named REQ17_AUXILIARY3)) ;; "severe psychiatric condition"

(assert
(! (=> patient_has_finding_of_chronic_mental_disorder_now@@severe
      patient_has_finding_of_chronic_mental_disorder_now)
    :named REQ17_AUXILIARY4)) ;; "severe chronic psychiatric condition"

(assert
(! (=> patient_has_finding_of_laboratory_abnormality_now@@increases_risk_or_interferes_with_study_and_investigator_judges_inappropriate
      patient_has_finding_of_laboratory_abnormality_now)
    :named REQ17_AUXILIARY5)) ;; "laboratory abnormality that may increase risk or interfere with study and, in the investigator's judgment, makes the patient inappropriate for study entry"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not (or
         patient_has_finding_of_acute_disease_now@@severe
         patient_has_finding_of_chronic_disease_now@@severe
         (and patient_has_finding_of_mental_disorder_now@@acute patient_has_finding_of_mental_disorder_now@@severe)
         patient_has_finding_of_chronic_mental_disorder_now@@severe
         patient_has_finding_of_laboratory_abnormality_now@@increases_risk_or_interferes_with_study_and_investigator_judges_inappropriate))
    :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has another severe acute medical condition ... OR ... another severe chronic medical condition ... OR ... another severe acute psychiatric condition ... OR ... another severe chronic psychiatric condition ... OR ... laboratory abnormality that may increase the risk ... AND, in the judgment of the investigator, would make the patient inappropriate for entry into this study))."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a pharmaceutical or biologic product at any time in the 30 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not taken any pharmaceutical or biologic product in the 30 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a pharmaceutical or biologic product in the 30 days prior to enrollment.","meaning":"Boolean indicating whether the patient has taken a pharmaceutical or biologic product in the 30 days prior to enrollment."} ;; "pharmaceutical product in the 30 days prior to enrollment"
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthepast30days@@investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the pharmaceutical or biologic product taken by the patient in the 30 days prior to enrollment was investigational.","when_to_set_to_false":"Set to false if the pharmaceutical or biologic product taken was not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product was investigational.","meaning":"Boolean indicating whether the pharmaceutical or biologic product taken was investigational."} ;; "investigational pharmaceutical product"
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthepast30days@@as_part_of_another_clinical_trial Bool) ;; {"when_to_set_to_true":"Set to true if the pharmaceutical or biologic product taken by the patient in the 30 days prior to enrollment was taken as part of another clinical trial.","when_to_set_to_false":"Set to false if the product was not taken as part of another clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product was taken as part of another clinical trial.","meaning":"Boolean indicating whether the pharmaceutical or biologic product taken was as part of another clinical trial."} ;; "participated in another trial of an investigational pharmaceutical product in the 30 days prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_taken_pharmaceutical_biologic_product_inthepast30days@@investigational_product
      patient_has_taken_pharmaceutical_biologic_product_inthepast30days)
:named REQ18_AUXILIARY0)) ;; "pharmaceutical or biologic product taken was investigational"

(assert
(! (=> patient_has_taken_pharmaceutical_biologic_product_inthepast30days@@as_part_of_another_clinical_trial
      patient_has_taken_pharmaceutical_biologic_product_inthepast30days)
:named REQ18_AUXILIARY1)) ;; "pharmaceutical or biologic product taken was as part of another clinical trial"

;; Both qualifiers must be true to satisfy the exclusion criterion
(assert
(! (= (and patient_has_taken_pharmaceutical_biologic_product_inthepast30days@@investigational_product
           patient_has_taken_pharmaceutical_biologic_product_inthepast30days@@as_part_of_another_clinical_trial)
      patient_has_taken_pharmaceutical_biologic_product_inthepast30days)
:named REQ18_AUXILIARY2)) ;; "participated in another trial of an investigational pharmaceutical product in the 30 days prior to enrollment"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (and patient_has_taken_pharmaceutical_biologic_product_inthepast30days@@investigational_product
             patient_has_taken_pharmaceutical_biologic_product_inthepast30days@@as_part_of_another_clinical_trial))
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in another trial of an investigational pharmaceutical product in the 30 days prior to enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_undergone_clinical_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever previously participated in this specific clinical trial at any time in the past.","when_to_set_to_false":"Set to false if the patient has never previously participated in this specific clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in this clinical trial.","meaning":"Boolean indicating whether the patient has ever previously participated in this clinical trial."} ;; "prior participation in this trial"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_undergone_clinical_trial_inthehistory)
    :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior participation in this trial."
