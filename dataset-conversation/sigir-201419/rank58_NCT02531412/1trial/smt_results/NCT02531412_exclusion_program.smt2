;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_contraindication_for_enteral_medication_administration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication for enteral medication administration.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication for enteral medication administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication for enteral medication administration.","meaning":"Boolean indicating whether the patient currently has any contraindication for enteral medication administration."} ;; "contraindications for enteral medication administration"

(declare-const patient_has_undergone_administration_of_drug_or_medicament_via_enteral_tube_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at any time in the past or present undergone administration of a drug or medicament via enteral tube.","when_to_set_to_false":"Set to false if the patient has never undergone administration of a drug or medicament via enteral tube.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of a drug or medicament via enteral tube.","meaning":"Boolean indicating whether the patient has ever undergone administration of a drug or medicament via enteral tube."} ;; "enteral medication administration"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_contraindication_for_enteral_medication_administration_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindications for enteral medication administration."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute kidney injury (acute renal failure syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have acute kidney injury (acute renal failure syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute kidney injury (acute renal failure syndrome).","meaning":"Boolean indicating whether the patient currently has acute kidney injury (acute renal failure syndrome)."} ;; "acute kidney injury at the time of admission"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_acute_renal_failure_syndrome_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute kidney injury at the time of admission."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_receiving_renal_replacement_therapy_prior_to_icu_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient is receiving renal replacement therapy at any time prior to ICU admission.","when_to_set_to_false":"Set to false if the patient is not receiving renal replacement therapy at any time prior to ICU admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving renal replacement therapy prior to ICU admission.","meaning":"Boolean indicating whether the patient is receiving renal replacement therapy prior to ICU admission."} ;; "The patient is excluded if the patient is receiving renal replacement therapy prior to intensive care unit admission."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_is_receiving_renal_replacement_therapy_prior_to_icu_admission)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving renal replacement therapy prior to intensive care unit admission."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_chronic_kidney_disease_stage_3b_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received a diagnosis of chronic kidney disease stage G3b at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never received a diagnosis of chronic kidney disease stage G3b at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received a diagnosis of chronic kidney disease stage G3b.","meaning":"Boolean indicating whether the patient has ever received a diagnosis of chronic kidney disease stage G3b in their history."} ;; "previous diagnosis of chronic kidney disease stage G3b"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_diagnosis_of_chronic_kidney_disease_stage_3b_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous diagnosis of chronic kidney disease stage G3b."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_plasma_potassium_level_value_recorded_now_withunit_milliequivalents_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's plasma potassium concentration is recorded now in milliequivalents per liter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's plasma potassium concentration measured now, in milliequivalents per liter."} ;; "plasma potassium concentration"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not (> patient_plasma_potassium_level_value_recorded_now_withunit_milliequivalents_per_liter 5.1))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has plasma potassium concentration > 5.1 milliequivalents per liter."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_allergy_to_spironolactone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented hypersensitivity or allergy to spironolactone.","when_to_set_to_false":"Set to false if the patient currently does not have a documented hypersensitivity or allergy to spironolactone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity or allergy to spironolactone.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity or allergy to spironolactone."} ;; "hypersensitivity to spironolactone"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_spironolactone_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to spironolactone."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has septic shock.","meaning":"Boolean indicating whether the patient currently has septic shock."} ;; "septic shock"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_septic_shock_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has septic shock."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_urinary_tract_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of urinary tract obstruction (obstructive uropathy).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of urinary tract obstruction (obstructive uropathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has urinary tract obstruction (obstructive uropathy).","meaning":"Boolean indicating whether the patient currently has urinary tract obstruction (obstructive uropathy)."} ;; "obstructive uropathy"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_urinary_tract_obstruction_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has obstructive uropathy."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_transplant_of_kidney_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone renal transplantation (kidney transplant) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone renal transplantation (kidney transplant) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone renal transplantation (kidney transplant).","meaning":"Boolean indicating whether the patient has ever undergone renal transplantation (kidney transplant) at any time in their history."} ;; "renal transplantation"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_undergone_transplant_of_kidney_inthehistory)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone renal transplantation."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_postoperative_state_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a postoperative state, regardless of the procedure.","when_to_set_to_false":"Set to false if the patient is currently not in a postoperative state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in a postoperative state.","meaning":"Boolean indicating whether the patient is currently in a postoperative state."} ;; "postoperative period"
(declare-const patient_has_finding_of_postoperative_state_now@@postoperative_state_after_nephrectomy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current postoperative state is specifically following nephrectomy.","when_to_set_to_false":"Set to false if the patient's current postoperative state is not following nephrectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the postoperative state is following nephrectomy.","meaning":"Boolean indicating whether the patient's current postoperative state is specifically after nephrectomy."} ;; "postoperative period of nephrectomy"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_postoperative_state_now@@postoperative_state_after_nephrectomy
      patient_has_finding_of_postoperative_state_now)
   :named REQ9_AUXILIARY0)) ;; "postoperative period of nephrectomy" implies "postoperative period"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_postoperative_state_now@@postoperative_state_after_nephrectomy)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is in the postoperative period of nephrectomy."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_adrenal_cortical_hypofunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of adrenal cortical hypofunction (adrenal insufficiency).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of adrenal cortical hypofunction (adrenal insufficiency).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of adrenal cortical hypofunction (adrenal insufficiency).","meaning":"Boolean indicating whether the patient currently has a diagnosis of adrenal cortical hypofunction (adrenal insufficiency)."} ;; "adrenal insufficiency"
(declare-const patient_has_diagnosis_of_adrenal_cortical_hypofunction_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of adrenal cortical hypofunction (adrenal insufficiency) is known (previously established or documented).","when_to_set_to_false":"Set to false if the patient's diagnosis of adrenal cortical hypofunction (adrenal insufficiency) is not known (not previously established or documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of adrenal cortical hypofunction (adrenal insufficiency) is known.","meaning":"Boolean indicating whether the patient's diagnosis of adrenal cortical hypofunction (adrenal insufficiency) is known (previously established or documented)."} ;; "known adrenal insufficiency"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_adrenal_cortical_hypofunction_now@@known
      patient_has_diagnosis_of_adrenal_cortical_hypofunction_now)
:named REQ11_AUXILIARY0)) ;; "known adrenal insufficiency"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_diagnosis_of_adrenal_cortical_hypofunction_now@@known)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known adrenal insufficiency."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_undergone_resuscitation_using_intravenous_fluid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone intravenous fluid resuscitation now.","when_to_set_to_false":"Set to false if the patient has not undergone intravenous fluid resuscitation now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone intravenous fluid resuscitation now.","meaning":"Boolean indicating whether the patient has undergone intravenous fluid resuscitation now."} ;; "fluid resuscitation"
(declare-const patient_mean_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured mean arterial pressure (in millimeters of mercury) if such a value is available for the patient now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current mean arterial pressure in millimeters of mercury."} ;; "mean arterial pressure"
(declare-const patient_norepinephrine_value_recorded_now_withunit_micrograms_per_kilogram_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured or administered dose of norepinephrine (in micrograms per kilogram per minute) if such a value is available for the patient now.","when_to_set_to_null":"Set to null if no such dose measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current dose of norepinephrine in micrograms per kilogram per minute."} ;; "norepinephrine"
(declare-const patient_norepinephrine_value_recorded_now_withunit_micrograms_per_kilogram_per_minute@@administered_for_more_than_one_hour Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current norepinephrine administration has been ongoing for more than one hour.","when_to_set_to_false":"Set to false if the patient's current norepinephrine administration has not been ongoing for more than one hour.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration has been ongoing for more than one hour.","meaning":"Boolean indicating whether the patient's current norepinephrine administration has been ongoing for more than one hour."} ;; "norepinephrine ... for more than one hour"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (not (and
    (and
      (>= patient_norepinephrine_value_recorded_now_withunit_micrograms_per_kilogram_per_minute 0.1) ;; "dose of norepinephrine greater than or equal to 0.1 micrograms per kilogram per minute"
      patient_norepinephrine_value_recorded_now_withunit_micrograms_per_kilogram_per_minute@@administered_for_more_than_one_hour ;; "for more than one hour"
      (>= patient_mean_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 70) ;; "to maintain mean arterial pressure greater than or equal to 70 millimeters of mercury"
    )
    patient_has_undergone_resuscitation_using_intravenous_fluid_now ;; "the patient has received fluid resuscitation"
  ))
  :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient requires administration of a dose of norepinephrine greater than or equal to 0.1 micrograms per kilogram per minute for more than one hour to maintain mean arterial pressure greater than or equal to 70 millimeters of mercury) AND (the patient has received fluid resuscitation))."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being administered an angiotensin-converting enzyme inhibitor-containing product.","when_to_set_to_false":"Set to false if the patient is currently not being administered an angiotensin-converting enzyme inhibitor-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being administered an angiotensin-converting enzyme inhibitor-containing product.","meaning":"Boolean indicating whether the patient is currently being administered an angiotensin-converting enzyme inhibitor-containing product."} ;; "angiotensin-converting enzyme inhibitor"
(declare-const patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now@@for_management Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being administered an angiotensin-converting enzyme inhibitor-containing product for management.","when_to_set_to_false":"Set to false if the patient is currently being administered an angiotensin-converting enzyme inhibitor-containing product but not for management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration is for management.","meaning":"Boolean indicating whether the administration of angiotensin-converting enzyme inhibitor-containing product is specifically for management."} ;; "requires administration of angiotensin-converting enzyme inhibitor for management"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now@@for_management
      patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now)
:named REQ13_AUXILIARY0)) ;; "for management" qualifier implies administration

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now@@for_management)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires administration of angiotensin-converting enzyme inhibitor for management."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_mean_blood_pressure_value_recorded_inthefuture_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured mean arterial pressure (in millimeters of mercury) for the patient during the follow-up period.","when_to_set_to_null":"Set to null if no such measurement is available for the follow-up period or the value is indeterminate.","meaning":"Numeric value for the patient's mean arterial pressure during follow-up (mmHg)."} ;; "mean arterial pressure greater than or equal to 70 millimeters of mercury during follow-up"
(declare-const patient_norepinephrine_value_recorded_inthefuture_withunit_micrograms_per_kilogram_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured dose of norepinephrine (in micrograms per kilogram per minute) administered to the patient during the follow-up period.","when_to_set_to_null":"Set to null if no such measurement is available for the follow-up period or the value is indeterminate.","meaning":"Numeric value for the patient's norepinephrine dose during follow-up (micrograms/kg/min)."} ;; "dose of norepinephrine ... during follow-up"
(declare-const patient_norepinephrine_dose_percent_increase_during_followup Real) ;; {"when_to_set_to_value":"Set to the calculated percent increase in norepinephrine dose required for the patient during the follow-up period to maintain mean arterial pressure.","when_to_set_to_null":"Set to null if the percent increase cannot be determined or is not applicable.","meaning":"Numeric value for the percent increase in norepinephrine dose required during follow-up."} ;; "increase of greater than or equal to 25 percent of the dose of norepinephrine to maintain mean arterial pressure"
(declare-const patient_norepinephrine_dose_percent_increase_during_followup@@required_to_maintain_mean_arterial_pressure_gte_70_mm_hg Bool) ;; {"when_to_set_to_true":"Set to true if the percent increase in norepinephrine dose is required specifically to maintain mean arterial pressure greater than or equal to 70 mmHg during follow-up.","when_to_set_to_false":"Set to false if the percent increase in norepinephrine dose is not required to maintain mean arterial pressure greater than or equal to 70 mmHg during follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percent increase in norepinephrine dose is required to maintain mean arterial pressure greater than or equal to 70 mmHg during follow-up.","meaning":"Boolean indicating whether the percent increase in norepinephrine dose is required to maintain mean arterial pressure greater than or equal to 70 mmHg during follow-up."} ;; "increase ... required to maintain mean arterial pressure greater than or equal to 70 millimeters of mercury during follow-up"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_norepinephrine_dose_percent_increase_during_followup@@required_to_maintain_mean_arterial_pressure_gte_70_mm_hg
      (and (>= patient_mean_blood_pressure_value_recorded_inthefuture_withunit_millimeters_of_mercury 70)
           (>= patient_norepinephrine_dose_percent_increase_during_followup 0)))
:named REQ14_AUXILIARY0)) ;; "percent increase in norepinephrine dose required to maintain mean arterial pressure greater than or equal to 70 mmHg during follow-up"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (and (>= patient_norepinephrine_dose_percent_increase_during_followup 25)
             patient_norepinephrine_dose_percent_increase_during_followup@@required_to_maintain_mean_arterial_pressure_gte_70_mm_hg))
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "requires an increase of greater than or equal to 25 percent of the dose of norepinephrine to maintain mean arterial pressure greater than or equal to 70 millimeters of mercury during follow-up."
