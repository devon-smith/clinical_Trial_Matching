;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_glycopyrrolate_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to glycopyrrolate within the past 24 hours prior to the reference timepoint.","when_to_set_to_false":"Set to false if the patient was not exposed to glycopyrrolate within the past 24 hours prior to the reference timepoint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to glycopyrrolate within the past 24 hours prior to the reference timepoint.","meaning":"Boolean indicating whether the patient was exposed to glycopyrrolate within the past 24 hours."} ;; "glycopyrrolate within a time interval ≤ 24 hours prior to the start of the baseline period"

(declare-const patient_is_exposed_to_glycopyrrolate_inthepast24hours@@temporalcontext_within24hours_before_baseline_period_start_day_minus_2 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to glycopyrrolate within the past 24 hours occurred prior to the start of the baseline period (which began on Day -2).","when_to_set_to_false":"Set to false if the patient's exposure to glycopyrrolate within the past 24 hours did not occur prior to the start of the baseline period (which began on Day -2).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred prior to the start of the baseline period.","meaning":"Boolean indicating whether the patient's exposure to glycopyrrolate within the past 24 hours was prior to the start of the baseline period (Day -2)."} ;; "within a time interval ≤ 24 hours prior to the start of the baseline period (which began on Day -2)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_glycopyrrolate_inthepast24hours@@temporalcontext_within24hours_before_baseline_period_start_day_minus_2
     patient_is_exposed_to_glycopyrrolate_inthepast24hours)
:named REQ0_AUXILIARY0)) ;; "glycopyrrolate within a time interval ≤ 24 hours prior to the start of the baseline period (which began on Day -2)."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_exposed_to_glycopyrrolate_inthepast24hours@@temporalcontext_within24hours_before_baseline_period_start_day_minus_2)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient used glycopyrrolate within a time interval ≤ 24 hours prior to the start of the baseline period (which began on Day -2)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to a drug or medicament at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to a drug or medicament at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to a drug or medicament in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to a drug or medicament in the past."} ;; "medication"

(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@temporalcontext_within_5_plasma_half_lives_prior_to_baseline_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to a drug or medicament occurred within a time interval less than or equal to 5 plasma half-lives of the prohibited medication prior to the start of the baseline period.","when_to_set_to_false":"Set to false if the patient's exposure to a drug or medicament did not occur within this interval prior to baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure occurred within this interval prior to baseline.","meaning":"Boolean indicating whether the patient's exposure to a drug or medicament occurred within ≤ 5 plasma half-lives prior to the baseline period."} ;; "used prohibited medication within a time interval ≤ 5 plasma half-lives of the prohibited medication prior to the start of the baseline period"

(declare-const prohibited_medication_plasma_half_life_value_recorded_in_hours Real) ;; {"when_to_set_to_value":"Set to the value of the plasma half-life of the prohibited medication in hours if known and documented.","when_to_set_to_null":"Set to null if the plasma half-life of the prohibited medication is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the plasma half-life of the prohibited medication in hours."} ;; "plasma half-life of the prohibited medication, recorded in hours"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthehistory@@temporalcontext_within_5_plasma_half_lives_prior_to_baseline_period
      patient_is_exposed_to_drug_or_medicament_inthehistory)
:named REQ1_AUXILIARY0)) ;; "used prohibited medication within a time interval ≤ 5 plasma half-lives of the prohibited medication prior to the start of the baseline period"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthehistory@@temporalcontext_within_5_plasma_half_lives_prior_to_baseline_period)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient used prohibited medication within a time interval ≤ 5 plasma half-lives of the prohibited medication prior to the start of the baseline period."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_received_intrasalivary_gland_botulinum_toxin_injection_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received an injection of botulinum toxin into a salivary gland at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received an injection of botulinum toxin into a salivary gland at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received an injection of botulinum toxin into a salivary gland.","meaning":"Boolean indicating whether the patient has ever received an injection of botulinum toxin into a salivary gland in the past."} ;; "has ever received an injection of botulinum toxin into a salivary gland at any time in the past"
(declare-const patient_has_received_intrasalivary_gland_botulinum_toxin_injection_in_the_history@@temporalcontext_within10months_before_baseline_period_start Bool) ;; {"when_to_set_to_true":"Set to true if the patient's injection of botulinum toxin into a salivary gland occurred within 10 months before the start of the baseline period.","when_to_set_to_false":"Set to false if the patient's injection of botulinum toxin into a salivary gland did not occur within 10 months before the start of the baseline period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's injection of botulinum toxin into a salivary gland occurred within 10 months before the start of the baseline period.","meaning":"Boolean indicating whether the patient's injection of botulinum toxin into a salivary gland occurred within 10 months before the start of the baseline period."} ;; "was injected with intrasalivary gland botulinum toxin within a time interval ≤ 10 months prior to the start of the baseline period"
(declare-const patient_has_taken_clostridium_botulinum_toxin_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a clostridium botulinum toxin containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken a clostridium botulinum toxin containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a clostridium botulinum toxin containing product.","meaning":"Boolean indicating whether the patient has ever taken a clostridium botulinum toxin containing product in the past."} ;; "has ever taken a clostridium botulinum toxin containing product at any time in the past"
(declare-const patient_has_taken_clostridium_botulinum_toxin_containing_product_inthehistory@@temporalcontext_within10months_before_baseline_period_start Bool) ;; {"when_to_set_to_true":"Set to true if the patient's use of clostridium botulinum toxin containing product occurred within 10 months before the start of the baseline period.","when_to_set_to_false":"Set to false if the patient's use of clostridium botulinum toxin containing product did not occur within 10 months before the start of the baseline period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's use of clostridium botulinum toxin containing product occurred within 10 months before the start of the baseline period.","meaning":"Boolean indicating whether the patient's use of clostridium botulinum toxin containing product occurred within 10 months before the start of the baseline period."} ;; "has taken clostridium botulinum toxin containing product within 10 months before baseline period"
(declare-const time_since_last_intrasalivary_gland_botulinum_toxin_injection_before_baseline_period_start_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months between the patient's most recent injection of botulinum toxin into a salivary gland and the start of the baseline period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient's most recent injection of botulinum toxin into a salivary gland occurred relative to the start of the baseline period.","meaning":"Numeric value in months between the patient's most recent injection of botulinum toxin into a salivary gland and the start of the baseline period."} ;; "number of months between most recent injection and start of baseline period"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_received_intrasalivary_gland_botulinum_toxin_injection_in_the_history@@temporalcontext_within10months_before_baseline_period_start
      patient_has_received_intrasalivary_gland_botulinum_toxin_injection_in_the_history)
:named REQ2_AUXILIARY0)) ;; "was injected with intrasalivary gland botulinum toxin within a time interval ≤ 10 months prior to the start of the baseline period"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_taken_clostridium_botulinum_toxin_containing_product_inthehistory@@temporalcontext_within10months_before_baseline_period_start
      patient_has_taken_clostridium_botulinum_toxin_containing_product_inthehistory)
:named REQ2_AUXILIARY1)) ;; "has taken clostridium botulinum toxin containing product within 10 months before baseline period"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_received_intrasalivary_gland_botulinum_toxin_injection_in_the_history@@temporalcontext_within10months_before_baseline_period_start)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was injected with intrasalivary gland botulinum toxin within a time interval ≤ 10 months prior to the start of the baseline period."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_dribbling_from_mouth_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of dribbling from mouth (drooling) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of dribbling from mouth (drooling) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had dribbling from mouth (drooling).","meaning":"Boolean indicating whether the patient has ever had dribbling from mouth (drooling) in the past."} ;; "drooling"

(declare-const patient_has_finding_of_dribbling_from_mouth_inthehistory@@treated_with_intraoral_device_for_drooling_within_1_week_prior_to_baseline_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dribbling from mouth (drooling) was treated with an intraoral device for drooling within 1 week prior to the start of the baseline period.","when_to_set_to_false":"Set to false if the patient's dribbling from mouth (drooling) was not treated with an intraoral device for drooling within 1 week prior to the start of the baseline period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dribbling from mouth (drooling) was treated with an intraoral device for drooling within 1 week prior to the start of the baseline period.","meaning":"Boolean indicating whether the patient's dribbling from mouth (drooling) was treated with an intraoral device for drooling within 1 week prior to the start of the baseline period."} ;; "used intraoral device for the treatment of drooling within a time interval ≤ 1 week prior to the start of the baseline period"

(declare-const patient_has_finding_of_dribbling_from_mouth_inthehistory@@treated_with_intraoral_prosthetic_for_drooling_within_1_week_prior_to_baseline_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dribbling from mouth (drooling) was treated with an intraoral prosthetic for drooling within 1 week prior to the start of the baseline period.","when_to_set_to_false":"Set to false if the patient's dribbling from mouth (drooling) was not treated with an intraoral prosthetic for drooling within 1 week prior to the start of the baseline period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dribbling from mouth (drooling) was treated with an intraoral prosthetic for drooling within 1 week prior to the start of the baseline period.","meaning":"Boolean indicating whether the patient's dribbling from mouth (drooling) was treated with an intraoral prosthetic for drooling within 1 week prior to the start of the baseline period."} ;; "used intraoral prosthetic for the treatment of drooling within a time interval ≤ 1 week prior to the start of the baseline period"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_dribbling_from_mouth_inthehistory@@treated_with_intraoral_device_for_drooling_within_1_week_prior_to_baseline_period
     patient_has_finding_of_dribbling_from_mouth_inthehistory)
:named REQ3_AUXILIARY0)) ;; "used intraoral device for the treatment of drooling within a time interval ≤ 1 week prior to the start of the baseline period"

(assert
(! (=> patient_has_finding_of_dribbling_from_mouth_inthehistory@@treated_with_intraoral_prosthetic_for_drooling_within_1_week_prior_to_baseline_period
     patient_has_finding_of_dribbling_from_mouth_inthehistory)
:named REQ3_AUXILIARY1)) ;; "used intraoral prosthetic for the treatment of drooling within a time interval ≤ 1 week prior to the start of the baseline period"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_finding_of_dribbling_from_mouth_inthehistory@@treated_with_intraoral_device_for_drooling_within_1_week_prior_to_baseline_period
            patient_has_finding_of_dribbling_from_mouth_inthehistory@@treated_with_intraoral_prosthetic_for_drooling_within_1_week_prior_to_baseline_period))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient used intraoral device for the treatment of drooling within a time interval ≤ 1 week prior to the start of the baseline period) OR (the patient used intraoral prosthetic for the treatment of drooling within a time interval ≤ 1 week prior to the start of the baseline period)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_acupuncture_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone acupuncture at any time in the past, regardless of indication or timing.","when_to_set_to_false":"Set to false if the patient has never undergone acupuncture in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone acupuncture.","meaning":"Boolean indicating whether the patient has ever undergone acupuncture in the past."} ;; "acupuncture"
(declare-const patient_has_undergone_acupuncture_inthehistory@@for_treatment_of_drooling Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone acupuncture in the past specifically for the treatment of drooling.","when_to_set_to_false":"Set to false if the patient has undergone acupuncture in the past but not for the treatment of drooling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether acupuncture was for the treatment of drooling.","meaning":"Boolean indicating whether the patient's acupuncture was for the treatment of drooling."} ;; "acupuncture for the treatment of drooling"
(declare-const patient_has_undergone_acupuncture_inthehistory@@temporalcontext_within_3_months_prior_to_baseline_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone acupuncture in the past and the procedure occurred within 3 months prior to the start of the baseline period.","when_to_set_to_false":"Set to false if the patient has undergone acupuncture in the past but not within 3 months prior to the start of the baseline period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether acupuncture occurred within 3 months prior to baseline.","meaning":"Boolean indicating whether the patient's acupuncture occurred within 3 months prior to the start of the baseline period."} ;; "acupuncture within a time interval ≤ 3 months prior to the start of the baseline period"
(declare-const patient_is_receiving_acupuncture_now@@for_treatment_of_drooling Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving acupuncture specifically for the treatment of drooling.","when_to_set_to_false":"Set to false if the patient is currently receiving acupuncture but not for the treatment of drooling, or not receiving acupuncture at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving acupuncture for the treatment of drooling.","meaning":"Boolean indicating whether the patient is currently receiving acupuncture for the treatment of drooling."} ;; "receiving acupuncture for the treatment of drooling"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable: "for the treatment of drooling"
(assert
(! (=> patient_has_undergone_acupuncture_inthehistory@@for_treatment_of_drooling
       patient_has_undergone_acupuncture_inthehistory)
    :named REQ4_AUXILIARY0)) ;; "acupuncture for the treatment of drooling"

;; Qualifier variable implies stem variable: "within 3 months prior to baseline"
(assert
(! (=> patient_has_undergone_acupuncture_inthehistory@@temporalcontext_within_3_months_prior_to_baseline_period
       patient_has_undergone_acupuncture_inthehistory)
    :named REQ4_AUXILIARY1)) ;; "acupuncture within a time interval ≤ 3 months prior to the start of the baseline period"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion if (currently receiving acupuncture for drooling) OR (received acupuncture for drooling within 3 months prior to baseline)
(assert
(! (not (or patient_is_receiving_acupuncture_now@@for_treatment_of_drooling
            (and patient_has_undergone_acupuncture_inthehistory@@for_treatment_of_drooling
                 patient_has_undergone_acupuncture_inthehistory@@temporalcontext_within_3_months_prior_to_baseline_period)))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is receiving acupuncture for the treatment of drooling) OR (the patient has received acupuncture for the treatment of drooling within a time interval ≤ 3 months prior to the start of the baseline period)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_gastroesophageal_reflux_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gastroesophageal reflux.","when_to_set_to_false":"Set to false if the patient currently does not have gastroesophageal reflux.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gastroesophageal reflux.","meaning":"Boolean indicating whether the patient currently has gastroesophageal reflux."} ;; "gastrointestinal reflux"
(declare-const patient_has_finding_of_gastroesophageal_reflux_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastroesophageal reflux contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's gastroesophageal reflux does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's gastroesophageal reflux contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's gastroesophageal reflux contraindicates anticholinergic therapy."} ;; "gastrointestinal reflux contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_narrow_angle_glaucoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has narrow-angle glaucoma.","when_to_set_to_false":"Set to false if the patient currently does not have narrow-angle glaucoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has narrow-angle glaucoma.","meaning":"Boolean indicating whether the patient currently has narrow-angle glaucoma."} ;; "narrow-angle glaucoma"
(declare-const patient_has_finding_of_narrow_angle_glaucoma_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's narrow-angle glaucoma contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's narrow-angle glaucoma does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's narrow-angle glaucoma contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's narrow-angle glaucoma contraindicates anticholinergic therapy."} ;; "narrow-angle glaucoma contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_obstructive_uropathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has obstructive uropathy.","when_to_set_to_false":"Set to false if the patient currently does not have obstructive uropathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obstructive uropathy.","meaning":"Boolean indicating whether the patient currently has obstructive uropathy."} ;; "obstructive uropathy"
(declare-const patient_has_finding_of_obstructive_uropathy_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's obstructive uropathy contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's obstructive uropathy does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's obstructive uropathy contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's obstructive uropathy contraindicates anticholinergic therapy."} ;; "obstructive uropathy contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_obstructive_disease_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has obstructive disease of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have obstructive disease of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obstructive disease of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has obstructive disease of the gastrointestinal tract."} ;; "obstructive disease of the gastrointestinal tract"
(declare-const patient_has_finding_of_obstructive_disease_of_gastrointestinal_tract_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's obstructive disease of the gastrointestinal tract contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's obstructive disease of the gastrointestinal tract does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's obstructive disease of the gastrointestinal tract contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's obstructive disease of the gastrointestinal tract contraindicates anticholinergic therapy."} ;; "obstructive disease of the gastrointestinal tract contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_delayed_gastric_emptying_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has delayed gastric emptying.","when_to_set_to_false":"Set to false if the patient currently does not have delayed gastric emptying.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has delayed gastric emptying.","meaning":"Boolean indicating whether the patient currently has delayed gastric emptying."} ;; "delayed gastric emptying"
(declare-const patient_has_finding_of_delayed_gastric_emptying_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's delayed gastric emptying contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's delayed gastric emptying does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's delayed gastric emptying contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's delayed gastric emptying contraindicates anticholinergic therapy."} ;; "delayed gastric emptying contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_pyloroduodenal_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pyloroduodenal stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have pyloroduodenal stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pyloroduodenal stenosis.","meaning":"Boolean indicating whether the patient currently has pyloroduodenal stenosis."} ;; "pyloroduodenal stenosis"
(declare-const patient_has_finding_of_pyloroduodenal_stenosis_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pyloroduodenal stenosis contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's pyloroduodenal stenosis does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pyloroduodenal stenosis contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's pyloroduodenal stenosis contraindicates anticholinergic therapy."} ;; "pyloroduodenal stenosis contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_paralytic_ileus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has paralytic ileus.","when_to_set_to_false":"Set to false if the patient currently does not have paralytic ileus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paralytic ileus.","meaning":"Boolean indicating whether the patient currently has paralytic ileus."} ;; "paralytic ileus"
(declare-const patient_has_finding_of_paralytic_ileus_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's paralytic ileus contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's paralytic ileus does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's paralytic ileus contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's paralytic ileus contraindicates anticholinergic therapy."} ;; "paralytic ileus contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_intestinal_atony_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intestinal atony.","when_to_set_to_false":"Set to false if the patient currently does not have intestinal atony.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intestinal atony.","meaning":"Boolean indicating whether the patient currently has intestinal atony."} ;; "intestinal atony"
(declare-const patient_has_finding_of_intestinal_atony_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's intestinal atony contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's intestinal atony does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's intestinal atony contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's intestinal atony contraindicates anticholinergic therapy."} ;; "intestinal atony contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_vesicoureteral_reflux_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vesicoureteral reflux.","when_to_set_to_false":"Set to false if the patient currently does not have vesicoureteral reflux.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vesicoureteral reflux.","meaning":"Boolean indicating whether the patient currently has vesicoureteral reflux."} ;; "vesicoureteral reflux"
(declare-const patient_has_finding_of_vesicoureteral_reflux_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's vesicoureteral reflux contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's vesicoureteral reflux does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's vesicoureteral reflux contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's vesicoureteral reflux contraindicates anticholinergic therapy."} ;; "vesicoureteral reflux contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_reactive_airway_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has reactive airway disease.","when_to_set_to_false":"Set to false if the patient currently does not have reactive airway disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has reactive airway disease.","meaning":"Boolean indicating whether the patient currently has reactive airway disease."} ;; "reactive airway disease"
(declare-const patient_has_finding_of_reactive_airway_disease_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's reactive airway disease contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's reactive airway disease does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's reactive airway disease contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's reactive airway disease contraindicates anticholinergic therapy."} ;; "reactive airway disease contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_myasthenia_gravis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myasthenia gravis.","when_to_set_to_false":"Set to false if the patient currently does not have myasthenia gravis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myasthenia gravis.","meaning":"Boolean indicating whether the patient currently has myasthenia gravis."} ;; "myasthenia gravis"
(declare-const patient_has_finding_of_myasthenia_gravis_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myasthenia gravis contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's myasthenia gravis does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myasthenia gravis contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's myasthenia gravis contraindicates anticholinergic therapy."} ;; "myasthenia gravis contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has hyperthyroidism."} ;; "hyperthyroidism"
(declare-const patient_has_finding_of_hyperthyroidism_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hyperthyroidism contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's hyperthyroidism does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hyperthyroidism contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's hyperthyroidism contraindicates anticholinergic therapy."} ;; "hyperthyroidism contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has cardiac arrhythmia."} ;; "cardiac arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac arrhythmia contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's cardiac arrhythmia does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiac arrhythmia contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's cardiac arrhythmia contraindicates anticholinergic therapy."} ;; "cardiac arrhythmia contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachycardia.","meaning":"Boolean indicating whether the patient currently has tachycardia."} ;; "tachycardia"
(declare-const patient_has_finding_of_tachycardia_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tachycardia contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the patient's tachycardia does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tachycardia contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the patient's tachycardia contraindicates anticholinergic therapy."} ;; "tachycardia contraindicating anticholinergic therapy"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal electrocardiogram (ECG) finding.","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal electrocardiogram (ECG) finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal electrocardiogram (ECG) finding.","meaning":"Boolean indicating whether the patient currently has an abnormal electrocardiogram (ECG) finding."} ;; "electrocardiogram abnormality"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal electrocardiogram (ECG) finding is clinically significant.","when_to_set_to_false":"Set to false if the abnormal electrocardiogram (ECG) finding is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal electrocardiogram (ECG) finding is clinically significant.","meaning":"Boolean indicating whether the abnormal electrocardiogram (ECG) finding is clinically significant."} ;; "clinically significant electrocardiogram abnormality"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now@@as_determined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal electrocardiogram (ECG) finding is determined by the investigator.","when_to_set_to_false":"Set to false if the abnormal electrocardiogram (ECG) finding is not determined by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal electrocardiogram (ECG) finding is determined by the investigator.","meaning":"Boolean indicating whether the abnormal electrocardiogram (ECG) finding is determined by the investigator."} ;; "electrocardiogram abnormality as determined by the investigator"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now@@contraindicates_anticholinergic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal electrocardiogram (ECG) finding contraindicates anticholinergic therapy.","when_to_set_to_false":"Set to false if the abnormal electrocardiogram (ECG) finding does not contraindicate anticholinergic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal electrocardiogram (ECG) finding contraindicates anticholinergic therapy.","meaning":"Boolean indicating whether the abnormal electrocardiogram (ECG) finding contraindicates anticholinergic therapy."} ;; "electrocardiogram abnormality contraindicating anticholinergic therapy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_gastroesophageal_reflux_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_gastroesophageal_reflux_now)
:named REQ5_AUXILIARY0)) ;; "gastroesophageal reflux contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_narrow_angle_glaucoma_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_narrow_angle_glaucoma_now)
:named REQ5_AUXILIARY1)) ;; "narrow-angle glaucoma contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_obstructive_uropathy_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_obstructive_uropathy_now)
:named REQ5_AUXILIARY2)) ;; "obstructive uropathy contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_obstructive_disease_of_gastrointestinal_tract_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_obstructive_disease_of_gastrointestinal_tract_now)
:named REQ5_AUXILIARY3)) ;; "obstructive disease of the gastrointestinal tract contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_delayed_gastric_emptying_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_delayed_gastric_emptying_now)
:named REQ5_AUXILIARY4)) ;; "delayed gastric emptying contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_pyloroduodenal_stenosis_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_pyloroduodenal_stenosis_now)
:named REQ5_AUXILIARY5)) ;; "pyloroduodenal stenosis contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_paralytic_ileus_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_paralytic_ileus_now)
:named REQ5_AUXILIARY6)) ;; "paralytic ileus contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_intestinal_atony_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_intestinal_atony_now)
:named REQ5_AUXILIARY7)) ;; "intestinal atony contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_vesicoureteral_reflux_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_vesicoureteral_reflux_now)
:named REQ5_AUXILIARY8)) ;; "vesicoureteral reflux contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_reactive_airway_disease_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_reactive_airway_disease_now)
:named REQ5_AUXILIARY9)) ;; "reactive airway disease contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_myasthenia_gravis_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_myasthenia_gravis_now)
:named REQ5_AUXILIARY10)) ;; "myasthenia gravis contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_hyperthyroidism_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_hyperthyroidism_now)
:named REQ5_AUXILIARY11)) ;; "hyperthyroidism contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_cardiac_arrhythmia_now)
:named REQ5_AUXILIARY12)) ;; "cardiac arrhythmia contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_tachycardia_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_tachycardia_now)
:named REQ5_AUXILIARY13)) ;; "tachycardia contraindicates anticholinergic therapy"

(assert
(! (=> patient_has_finding_of_electrocardiogram_abnormal_now@@clinically_significant
      patient_has_finding_of_electrocardiogram_abnormal_now)
:named REQ5_AUXILIARY14)) ;; "clinically significant electrocardiogram abnormality"

(assert
(! (=> patient_has_finding_of_electrocardiogram_abnormal_now@@as_determined_by_investigator
      patient_has_finding_of_electrocardiogram_abnormal_now)
:named REQ5_AUXILIARY15)) ;; "electrocardiogram abnormality as determined by the investigator"

(assert
(! (=> patient_has_finding_of_electrocardiogram_abnormal_now@@contraindicates_anticholinergic_therapy
      patient_has_finding_of_electrocardiogram_abnormal_now)
:named REQ5_AUXILIARY16)) ;; "electrocardiogram abnormality contraindicating anticholinergic therapy"

;; Non-exhaustive examples: delayed gastric emptying, pyloroduodenal stenosis are examples of obstructive disease of the GI tract
(assert
(! (=> (or patient_has_finding_of_delayed_gastric_emptying_now
         patient_has_finding_of_pyloroduodenal_stenosis_now)
      patient_has_finding_of_obstructive_disease_of_gastrointestinal_tract_now)
:named REQ5_AUXILIARY17)) ;; "obstructive disease of the gastrointestinal tract with non-exhaustive examples (delayed gastric emptying, pyloroduodenal stenosis)"

;; Non-exhaustive examples: delayed gastric emptying, pyloroduodenal stenosis contraindicating anticholinergic therapy are examples of obstructive disease of the GI tract contraindicating anticholinergic therapy
(assert
(! (=> (or patient_has_finding_of_delayed_gastric_emptying_now@@contraindicates_anticholinergic_therapy
         patient_has_finding_of_pyloroduodenal_stenosis_now@@contraindicates_anticholinergic_therapy)
      patient_has_finding_of_obstructive_disease_of_gastrointestinal_tract_now@@contraindicates_anticholinergic_therapy)
:named REQ5_AUXILIARY18)) ;; "obstructive disease of the gastrointestinal tract contraindicating anticholinergic therapy with non-exhaustive examples (delayed gastric emptying, pyloroduodenal stenosis)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or
  patient_has_finding_of_gastroesophageal_reflux_now@@contraindicates_anticholinergic_therapy
  patient_has_finding_of_narrow_angle_glaucoma_now@@contraindicates_anticholinergic_therapy
  patient_has_finding_of_obstructive_uropathy_now@@contraindicates_anticholinergic_therapy
  patient_has_finding_of_obstructive_disease_of_gastrointestinal_tract_now@@contraindicates_anticholinergic_therapy
  patient_has_finding_of_paralytic_ileus_now@@contraindicates_anticholinergic_therapy
  patient_has_finding_of_intestinal_atony_now@@contraindicates_anticholinergic_therapy
  patient_has_finding_of_vesicoureteral_reflux_now@@contraindicates_anticholinergic_therapy
  patient_has_finding_of_reactive_airway_disease_now@@contraindicates_anticholinergic_therapy
  patient_has_finding_of_myasthenia_gravis_now@@contraindicates_anticholinergic_therapy
  patient_has_finding_of_hyperthyroidism_now@@contraindicates_anticholinergic_therapy
  patient_has_finding_of_cardiac_arrhythmia_now@@contraindicates_anticholinergic_therapy
  patient_has_finding_of_tachycardia_now@@contraindicates_anticholinergic_therapy
  (and patient_has_finding_of_electrocardiogram_abnormal_now@@clinically_significant
       patient_has_finding_of_electrocardiogram_abnormal_now@@as_determined_by_investigator
       patient_has_finding_of_electrocardiogram_abnormal_now@@contraindicates_anticholinergic_therapy)
))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has medical condition contraindicating anticholinergic therapy with non-exhaustive examples ((gastrointestinal reflux) OR (narrow-angle glaucoma) OR (obstructive uropathy) OR (obstructive disease of the gastrointestinal tract with non-exhaustive examples (delayed gastric emptying, pyloroduodenal stenosis)) OR (paralytic ileus) OR (intestinal atony) OR (vesicoureteral reflux) OR (reactive airway disease) OR (myasthenia gravis) OR (hyperthyroidism) OR (cardiac arrhythmia) OR (tachycardia) OR (clinically significant electrocardiogram abnormality as determined by the investigator))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_known_contraindication_to_study_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known contraindication to the study medication.","when_to_set_to_false":"Set to false if the patient currently does not have a known contraindication to the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known contraindication to the study medication.","meaning":"Boolean indicating whether the patient currently has a known contraindication to the study medication."} ;; "known contraindication to the study medication"

(declare-const patient_has_finding_of_allergic_disposition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergic disposition (allergy).","when_to_set_to_false":"Set to false if the patient currently does not have an allergic disposition (allergy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergic disposition (allergy).","meaning":"Boolean indicating whether the patient currently has an allergic disposition (allergy)."} ;; "allergy"

(declare-const patient_has_finding_of_allergic_disposition_now@@to_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergic disposition is specifically to the study medication.","when_to_set_to_false":"Set to false if the patient's allergic disposition is not to the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergic disposition is to the study medication.","meaning":"Boolean indicating whether the patient's allergic disposition is specifically to the study medication."} ;; "allergy to the study medication"

(declare-const patient_has_finding_of_allergic_disposition_now@@to_any_component_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergic disposition is specifically to any component of the study medication.","when_to_set_to_false":"Set to false if the patient's allergic disposition is not to any component of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergic disposition is to any component of the study medication.","meaning":"Boolean indicating whether the patient's allergic disposition is specifically to any component of the study medication."} ;; "allergy to any component of the study medication"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_allergic_disposition_now@@to_study_medication
           patient_has_finding_of_allergic_disposition_now@@to_any_component_of_study_medication)
       patient_has_known_contraindication_to_study_medication_now)
   :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (allergy to the study medication, allergy to any component of the study medication)"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergic_disposition_now@@to_study_medication
       patient_has_finding_of_allergic_disposition_now)
   :named REQ6_AUXILIARY1)) ;; "allergy to the study medication"

(assert
(! (=> patient_has_finding_of_allergic_disposition_now@@to_any_component_of_study_medication
       patient_has_finding_of_allergic_disposition_now)
   :named REQ6_AUXILIARY2)) ;; "allergy to any component of the study medication"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_known_contraindication_to_study_medication_now)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known contraindication to the study medication with non-exhaustive examples (allergy to the study medication, allergy to any component of the study medication)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_epilepsy_control_poor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poorly controlled epilepsy (poorly controlled seizures).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poorly controlled epilepsy (poorly controlled seizures).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poorly controlled epilepsy (poorly controlled seizures).","meaning":"Boolean indicating whether the patient currently has poorly controlled epilepsy (poorly controlled seizures)."} ;; "poorly controlled seizure"
(declare-const seizure_frequency_value_recorded_now_withunit_per_day Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's current seizure frequency in units of seizures per day.","when_to_set_to_null":"Set to null if the patient's current seizure frequency in units of seizures per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current seizure frequency, recorded as the number of seizures per day."} ;; "seizure frequency ≥ 1 per day"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Definition: poorly controlled seizure = seizure frequency ≥ 1 per day
(assert
(! (= patient_has_finding_of_epilepsy_control_poor_now
    (>= seizure_frequency_value_recorded_now_withunit_per_day 1))
:named REQ7_AUXILIARY0)) ;; "poorly controlled seizure defined as seizure frequency ≥ 1 per day."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_epilepsy_control_poor_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poorly controlled seizure defined as seizure frequency ≥ 1 per day."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_history_of_obstructive_disease_of_gastrointestinal_tract Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of obstructive disease of the gastrointestinal tract at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of obstructive disease of the gastrointestinal tract at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of obstructive disease of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of obstructive disease of the gastrointestinal tract in their medical history."} ;; "history of obstructive disease of the gastrointestinal tract"

(declare-const patient_has_diagnosis_of_intestinal_obstruction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of intestinal obstruction at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of intestinal obstruction at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of intestinal obstruction.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of intestinal obstruction in their medical history."} ;; "intestinal obstruction"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive example: intestinal obstruction implies history of obstructive disease of the GI tract
(assert
(! (=> patient_has_diagnosis_of_intestinal_obstruction_inthehistory
      patient_has_history_of_obstructive_disease_of_gastrointestinal_tract)
   :named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples (intestinal obstruction)."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_history_of_obstructive_disease_of_gastrointestinal_tract)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of obstructive disease of the gastrointestinal tract with non-exhaustive examples (intestinal obstruction)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_hepatic_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic impairment.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic impairment.","meaning":"Boolean indicating whether the patient currently has hepatic impairment."} ;; "hepatic impairment"
(declare-const patient_has_finding_of_hepatic_impairment_now@@clinically_significant_as_determined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hepatic impairment is considered clinically significant by the investigator.","when_to_set_to_false":"Set to false if the patient's hepatic impairment is not considered clinically significant by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hepatic impairment is clinically significant as determined by the investigator.","meaning":"Boolean indicating whether the patient's hepatic impairment is clinically significant as determined by the investigator."} ;; "clinically significant hepatic impairment as determined by the investigator"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"
(declare-const patient_has_finding_of_renal_impairment_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal impairment is considered clinically significant by the investigator.","when_to_set_to_false":"Set to false if the patient's renal impairment is not considered clinically significant by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal impairment is clinically significant as determined by the investigator.","meaning":"Boolean indicating whether the patient's renal impairment is clinically significant as determined by the investigator."} ;; "clinically significant renal impairment as determined by the investigator"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable (hepatic)
(assert
(! (=> patient_has_finding_of_hepatic_impairment_now@@clinically_significant_as_determined_by_investigator
      patient_has_finding_of_hepatic_impairment_now)
    :named REQ9_AUXILIARY0)) ;; "clinically significant hepatic impairment as determined by the investigator"

;; Qualifier variable implies corresponding stem variable (renal)
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@clinically_significant
      patient_has_finding_of_renal_impairment_now)
    :named REQ9_AUXILIARY1)) ;; "clinically significant renal impairment as determined by the investigator"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_hepatic_impairment_now@@clinically_significant_as_determined_by_investigator)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant hepatic impairment as determined by the investigator."

(assert
(! (not patient_has_finding_of_renal_impairment_now@@clinically_significant)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant renal impairment as determined by the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_received_investigational_drug_within_30_days_prior_to_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received an investigational drug within the 30 days prior to study entry.","when_to_set_to_false":"Set to false if the patient has not received an investigational drug within the 30 days prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received an investigational drug within the 30 days prior to study entry.","meaning":"Boolean indicating whether the patient has received an investigational drug within the 30 days prior to study entry."} ;; "has received investigational drug within thirty days prior to study entry"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past 30 days.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past 30 days."} ;; "drug"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@temporalcontext_within30days_prior_to_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any drug or medicament occurred within the 30 days prior to study entry.","when_to_set_to_false":"Set to false if the patient's exposure to any drug or medicament did not occur within the 30 days prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to any drug or medicament occurred within the 30 days prior to study entry.","meaning":"Boolean indicating whether the patient's exposure to any drug or medicament occurred within the 30 days prior to study entry."} ;; "drug within 30 days prior to study entry"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@temporalcontext_within30days_prior_to_study_entry
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
:named REQ11_AUXILIARY0)) ;; "drug within 30 days prior to study entry"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_received_investigational_drug_within_30_days_prior_to_study_entry)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received investigational drug within thirty days prior to study entry."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_expected_to_be_non_compliant_with_study_procedure_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the investigator judges that the patient is expected to be non-compliant with the study procedure.","when_to_set_to_false":"Set to false if the investigator judges that the patient is not expected to be non-compliant with the study procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to be non-compliant with the study procedure as judged by the investigator.","meaning":"Boolean indicating whether the patient is expected to be non-compliant with the study procedure as judged by the investigator."} ;; "the patient is expected to be non-compliant with the study procedure as judged by the investigator"

(declare-const family_member_is_expected_to_be_non_compliant_with_study_procedure_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the investigator judges that the patient's family member is expected to be non-compliant with the study procedure.","when_to_set_to_false":"Set to false if the investigator judges that the patient's family member is not expected to be non-compliant with the study procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's family member is expected to be non-compliant with the study procedure as judged by the investigator.","meaning":"Boolean indicating whether the patient's family member is expected to be non-compliant with the study procedure as judged by the investigator."} ;; "the patient's family member is expected to be non-compliant with the study procedure as judged by the investigator"

(declare-const parent_is_expected_to_be_non_compliant_with_study_procedure_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the investigator judges that the patient's parent is expected to be non-compliant with the study procedure.","when_to_set_to_false":"Set to false if the investigator judges that the patient's parent is not expected to be non-compliant with the study procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent is expected to be non-compliant with the study procedure as judged by the investigator.","meaning":"Boolean indicating whether the patient's parent is expected to be non-compliant with the study procedure as judged by the investigator."} ;; "the patient's parent is expected to be non-compliant with the study procedure as judged by the investigator"

(declare-const caregiver_is_expected_to_be_non_compliant_with_study_procedure_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the investigator judges that the patient's caregiver is expected to be non-compliant with the study procedure.","when_to_set_to_false":"Set to false if the investigator judges that the patient's caregiver is not expected to be non-compliant with the study procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's caregiver is expected to be non-compliant with the study procedure as judged by the investigator.","meaning":"Boolean indicating whether the patient's caregiver is expected to be non-compliant with the study procedure as judged by the investigator."} ;; "the patient's caregiver is expected to be non-compliant with the study procedure as judged by the investigator"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_expected_to_be_non_compliant_with_study_procedure_as_judged_by_investigator)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is expected to be non-compliant with the study procedure as judged by the investigator."

(assert
(! (not family_member_is_expected_to_be_non_compliant_with_study_procedure_as_judged_by_investigator)
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's family member is expected to be non-compliant with the study procedure as judged by the investigator."

(assert
(! (not parent_is_expected_to_be_non_compliant_with_study_procedure_as_judged_by_investigator)
    :named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's parent is expected to be non-compliant with the study procedure as judged by the investigator."

(assert
(! (not caregiver_is_expected_to_be_non_compliant_with_study_procedure_as_judged_by_investigator)
    :named REQ12_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's caregiver is expected to be non-compliant with the study procedure as judged by the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_unable_to_meet_study_requirement_as_determined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the investigator determines that the patient is unable to meet the requirement of the study for any reason.","when_to_set_to_false":"Set to false if the investigator determines that the patient is able to meet the requirement of the study for all required aspects.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to meet the requirement of the study as determined by the investigator.","meaning":"Boolean indicating whether the patient is unable to meet the requirement of the study for any reason, as determined by the investigator."} ;; "unable to meet the requirement of the study for any reason as determined by the investigator"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_unable_to_meet_study_requirement_as_determined_by_investigator)
:named REQ13_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to meet the requirement of the study for any reason as determined by the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder.","meaning":"Boolean indicating whether the patient currently has a mental disorder."} ;; "mental disease"
(declare-const patient_has_finding_of_mental_disorder_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current mental disorder is unstable as determined by the investigator.","when_to_set_to_false":"Set to false if the patient's current mental disorder is not unstable as determined by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current mental disorder is unstable as determined by the investigator.","meaning":"Boolean indicating whether the patient's current mental disorder is unstable as determined by the investigator."} ;; "unstable mental disease as determined by the investigator"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@unstable
       patient_has_finding_of_mental_disorder_now)
   :named REQ14_AUXILIARY0)) ;; "unstable mental disease as determined by the investigator"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now@@unstable)
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable mental disease as determined by the investigator."
