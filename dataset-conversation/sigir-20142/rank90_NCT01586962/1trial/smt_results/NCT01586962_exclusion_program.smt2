;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pain_in_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sore throat pain.","when_to_set_to_false":"Set to false if the patient currently does not have sore throat pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sore throat pain.","meaning":"Boolean indicating whether the patient currently has sore throat pain."} ;; "sore throat pain"
(declare-const patient_has_finding_of_pain_in_throat_now@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sore throat pain is present at baseline.","when_to_set_to_false":"Set to false if the patient's sore throat pain is not present at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sore throat pain is present at baseline.","meaning":"Boolean indicating whether the patient's sore throat pain is present at baseline."} ;; "baseline sore throat pain"
(declare-const patient_sore_throat_pain_intensity_value_recorded_at_baseline_withunit_ordinal_0_to_3 Real) ;; {"when_to_set_to_value":"Set to the value (0, 1, 2, or 3) that corresponds to the patient's sore throat pain intensity at baseline, as recorded on the 4-point ordinal scale.","when_to_set_to_null":"Set to null if the patient's sore throat pain intensity at baseline is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's sore throat pain intensity at baseline, on a 4-point ordinal scale (0 = not present, 1 = mild, 2 = moderate, 3 = severe)."} ;; "rated as 3 on a 4-point ordinal scale (0 = not present, 1 = mild, 2 = moderate, 3 = severe)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Example rating of 3 implies severe intensity at baseline
(assert
(! (=> (= patient_sore_throat_pain_intensity_value_recorded_at_baseline_withunit_ordinal_0_to_3 3)
       patient_has_finding_of_pain_in_throat_now@@at_baseline)
:named REQ0_AUXILIARY0)) ;; "for example, rated as 3 on a 4-point ordinal scale (0 = not present, 1 = mild, 2 = moderate, 3 = severe)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_pain_in_throat_now@@at_baseline
       patient_has_finding_of_pain_in_throat_now)
:named REQ0_AUXILIARY1)) ;; "baseline sore throat pain"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_pain_in_throat_now@@at_baseline)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has baseline sore throat pain of severe intensity (for example, rated as 3 on a 4-point ordinal scale (0 = not present, 1 = mild, 2 = moderate, 3 = severe))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const dry_cough_intensity_value_recorded_at_baseline_withunit_ordinal_scale_0_to_3 Real) ;; {"when_to_set_to_value":"Set to the recorded value (0, 1, 2, or 3) if the patient's dry cough intensity at baseline is documented on the 4-point ordinal scale.","when_to_set_to_null":"Set to null if the patient's dry cough intensity at baseline is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the intensity of the patient's dry cough at baseline, on a 4-point ordinal scale (0 = not present, 1 = mild, 2 = moderate, 3 = severe)."} ;; "rated as 3 on a 4-point ordinal scale (0 = not present, 1 = mild, 2 = moderate, 3 = severe)"
(declare-const patient_has_finding_of_dry_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dry cough.","when_to_set_to_false":"Set to false if the patient currently does not have dry cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dry cough.","meaning":"Boolean indicating whether the patient currently has dry cough."} ;; "dry cough"
(declare-const patient_has_finding_of_dry_cough_now@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dry cough is present at baseline.","when_to_set_to_false":"Set to false if the patient's dry cough is not present at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dry cough is present at baseline.","meaning":"Boolean indicating whether the patient's dry cough is present at baseline."} ;; "baseline dry cough"
(declare-const patient_has_finding_of_dry_cough_now@@severe_intensity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dry cough is of severe intensity.","when_to_set_to_false":"Set to false if the patient's dry cough is not of severe intensity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dry cough is of severe intensity.","meaning":"Boolean indicating whether the patient's dry cough is of severe intensity."} ;; "dry cough of severe intensity"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; "for example, rated as 3 on a 4-point ordinal scale (0 = not present, 1 = mild, 2 = moderate, 3 = severe)"
(assert
(! (=> (= dry_cough_intensity_value_recorded_at_baseline_withunit_ordinal_scale_0_to_3 3)
        patient_has_finding_of_dry_cough_now@@severe_intensity)
:named REQ1_AUXILIARY0))

;; Qualifier variable implies stem variable: "dry cough of severe intensity" implies "dry cough"
(assert
(! (=> patient_has_finding_of_dry_cough_now@@severe_intensity
        patient_has_finding_of_dry_cough_now)
:named REQ1_AUXILIARY1))

;; Qualifier variable implies stem variable: "dry cough at baseline" implies "dry cough"
(assert
(! (=> patient_has_finding_of_dry_cough_now@@at_baseline
        patient_has_finding_of_dry_cough_now)
:named REQ1_AUXILIARY2))

;; "dry cough of severe intensity" at baseline means both at baseline and severe intensity
(assert
(! (= patient_has_finding_of_dry_cough_now@@severe_intensity
       (and patient_has_finding_of_dry_cough_now@@at_baseline
            (= dry_cough_intensity_value_recorded_at_baseline_withunit_ordinal_scale_0_to_3 3)))
:named REQ1_AUXILIARY3)) ;; "baseline dry cough of severe intensity (for example, rated as 3 on a 4-point ordinal scale...)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_dry_cough_now@@severe_intensity)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has baseline dry cough of severe intensity (for example, rated as 3 on a 4-point ordinal scale (0 = not present, 1 = mild, 2 = moderate, 3 = severe))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_productive_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a productive cough.","when_to_set_to_false":"Set to false if the patient currently does not have a productive cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a productive cough.","meaning":"Boolean indicating whether the patient currently has a productive cough."} ;; "productive cough"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_productive_cough_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a productive cough."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity condition at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a hypersensitivity condition at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypersensitivity condition in their history.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity condition in their history."} ;; "hypersensitivity"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_of_the_study_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity condition in their history was to any of the study drugs.","when_to_set_to_false":"Set to false if the patient's hypersensitivity condition in their history was not to any of the study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypersensitivity condition in their history was to any of the study drugs.","meaning":"Boolean indicating whether the patient's historical hypersensitivity condition was to any of the study drugs."} ;; "hypersensitivity to any of the study drugs"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_of_the_listed_excipients Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity condition in their history was to any of the listed excipients.","when_to_set_to_false":"Set to false if the patient's hypersensitivity condition in their history was not to any of the listed excipients.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypersensitivity condition in their history was to any of the listed excipients.","meaning":"Boolean indicating whether the patient's historical hypersensitivity condition was to any of the listed excipients."} ;; "hypersensitivity to any of the listed excipients"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_drugs_of_similar_chemical_classes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity condition in their history was to drugs of similar chemical classes.","when_to_set_to_false":"Set to false if the patient's hypersensitivity condition in their history was not to drugs of similar chemical classes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypersensitivity condition in their history was to drugs of similar chemical classes.","meaning":"Boolean indicating whether the patient's historical hypersensitivity condition was to drugs of similar chemical classes."} ;; "hypersensitivity to drugs of similar chemical classes"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_of_the_study_drugs
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ3_AUXILIARY0)) ;; "the patient has a history of hypersensitivity to any of the study drugs"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_of_the_listed_excipients
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ3_AUXILIARY1)) ;; "the patient has a history of hypersensitivity to any of the listed excipients"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_drugs_of_similar_chemical_classes
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ3_AUXILIARY2)) ;; "the patient has a history of hypersensitivity to drugs of similar chemical classes"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_of_the_study_drugs)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to any of the study drugs."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_of_the_listed_excipients)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to any of the listed excipients."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_drugs_of_similar_chemical_classes)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to drugs of similar chemical classes."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergic_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of allergic asthma.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of allergic asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of allergic asthma.","meaning":"Boolean indicating whether the patient currently has allergic asthma."} ;; "allergic asthma"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_allergic_asthma_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergic asthma."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_used_inhaler_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any inhaler in the 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not used any inhaler in the 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any inhaler in the 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has used any inhaler in the 6 hours prior to dosing."} ;; "has used any inhaler in the 6 hours prior to dosing"
(declare-const patient_has_used_medicated_confectionary_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any medicated confectionary in the 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not used any medicated confectionary in the 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any medicated confectionary in the 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has used any medicated confectionary in the 6 hours prior to dosing."} ;; "has used any medicated confectionary in the 6 hours prior to dosing"
(declare-const patient_has_used_throat_lozenges_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any throat lozenges in the 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not used any throat lozenges in the 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any throat lozenges in the 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has used any throat lozenges in the 6 hours prior to dosing."} ;; "has used any throat lozenges in the 6 hours prior to dosing"
(declare-const patient_has_used_throat_pastilles_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any throat pastilles in the 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not used any throat pastilles in the 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any throat pastilles in the 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has used any throat pastilles in the 6 hours prior to dosing."} ;; "has used any throat pastilles in the 6 hours prior to dosing"
(declare-const patient_has_used_sprays_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any sprays in the 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not used any sprays in the 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any sprays in the 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has used any sprays in the 6 hours prior to dosing."} ;; "has used any sprays in the 6 hours prior to dosing"
(declare-const patient_has_used_products_with_demulcent_properties_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any products with demulcent properties in the 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not used any products with demulcent properties in the 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any products with demulcent properties in the 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has used any products with demulcent properties in the 6 hours prior to dosing."} ;; "has used any products with demulcent properties in the 6 hours prior to dosing"
(declare-const patient_has_used_chewing_gums_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any chewing gums in the 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not used any chewing gums in the 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any chewing gums in the 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has used any chewing gums in the 6 hours prior to dosing."} ;; "chewing gums in the 6 hours prior to dosing"
(declare-const patient_is_exposed_to_hard_candy_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to hard candy (boiled sweets) in the 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not been exposed to hard candy (boiled sweets) in the 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to hard candy (boiled sweets) in the 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has been exposed to hard candy (boiled sweets) in the 6 hours prior to dosing."} ;; "boiled sweets in the 6 hours prior to dosing"
(declare-const patient_is_exposed_to_mint_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to mint (mints) in the 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not been exposed to mint (mints) in the 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to mint (mints) in the 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has been exposed to mint (mints) in the 6 hours prior to dosing."} ;; "mints in the 6 hours prior to dosing"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_used_chewing_gums_inthepast6hours
          patient_is_exposed_to_hard_candy_inthepast6hours
          patient_is_exposed_to_mint_inthepast6hours)
patient_has_used_products_with_demulcent_properties_inthepast6hours)
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (chewing gums, boiled sweets, mints) in the 6 hours prior to dosing"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_used_inhaler_inthepast6hours)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any inhaler in the 6 hours prior to dosing."

(assert
(! (not patient_has_used_medicated_confectionary_inthepast6hours)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any medicated confectionary in the 6 hours prior to dosing."

(assert
(! (not patient_has_used_throat_lozenges_inthepast6hours)
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any throat lozenges in the 6 hours prior to dosing."

(assert
(! (not patient_has_used_throat_pastilles_inthepast6hours)
:named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any throat pastilles in the 6 hours prior to dosing."

(assert
(! (not patient_has_used_sprays_inthepast6hours)
:named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any sprays in the 6 hours prior to dosing."

(assert
(! (not patient_has_used_products_with_demulcent_properties_inthepast6hours)
:named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any products with demulcent properties with non-exhaustive examples (chewing gums, boiled sweets, mints) in the 6 hours prior to dosing."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_used_medication_for_sore_throat_containing_local_anesthetic_within_past_6_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any medication for sore throat containing a local anaesthetic within the 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not used any medication for sore throat containing a local anaesthetic within the 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any medication for sore throat containing a local anaesthetic within the 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has used any medication for sore throat containing a local anaesthetic within the 6 hours prior to dosing."} ;; "has used any medication for sore throat containing a local anaesthetic within the 6 hours prior to dosing"
(declare-const patient_is_exposed_to_local_anesthetic_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any local anaesthetic substance within the past 6 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to any local anaesthetic substance within the past 6 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any local anaesthetic substance within the past 6 hours.","meaning":"Boolean indicating whether the patient has been exposed to any local anaesthetic substance within the past 6 hours."} ;; "local anaesthetic within the past 6 hours"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_used_medication_for_sore_throat_containing_local_anesthetic_within_past_6_hours)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any medication for sore throat containing a local anaesthetic within the 6 hours prior to dosing."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_taken_acetaminophen_containing_product_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any acetaminophen-containing product within the past 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not taken any acetaminophen-containing product within the past 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any acetaminophen-containing product within the past 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has taken any acetaminophen-containing product within the past 6 hours prior to dosing."} ;; "paracetamol within 6 hours prior to dosing"

(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any non-steroidal anti-inflammatory agent within the past 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not been exposed to any non-steroidal anti-inflammatory agent within the past 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any non-steroidal anti-inflammatory agent within the past 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has been exposed to any non-steroidal anti-inflammatory agent within the past 6 hours prior to dosing."} ;; "non-steroidal anti-inflammatory drug within 6 hours prior to dosing"

(declare-const patient_is_exposed_to_decongestant_inthepast6hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any decongestant within the past 6 hours prior to dosing.","when_to_set_to_false":"Set to false if the patient has not been exposed to any decongestant within the past 6 hours prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any decongestant within the past 6 hours prior to dosing.","meaning":"Boolean indicating whether the patient has been exposed to any decongestant within the past 6 hours prior to dosing."} ;; "any oral nasal decongestant within 6 hours prior to dosing"

(declare-const patient_is_exposed_to_decongestant_inthepast6hours@@oral_route Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to decongestant within the past 6 hours was via the oral route.","when_to_set_to_false":"Set to false if the patient's exposure to decongestant within the past 6 hours was not via the oral route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to decongestant within the past 6 hours was via the oral route.","meaning":"Boolean indicating whether the exposure to decongestant within the past 6 hours was via the oral route."} ;; "oral nasal decongestant within 6 hours prior to dosing"

(declare-const patient_is_exposed_to_decongestant_inthepast6hours@@nasal_route Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to decongestant within the past 6 hours was via the nasal route.","when_to_set_to_false":"Set to false if the patient's exposure to decongestant within the past 6 hours was not via the nasal route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to decongestant within the past 6 hours was via the nasal route.","meaning":"Boolean indicating whether the exposure to decongestant within the past 6 hours was via the nasal route."} ;; "oral nasal decongestant within 6 hours prior to dosing"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_decongestant_inthepast6hours@@oral_route
patient_is_exposed_to_decongestant_inthepast6hours)
:named REQ7_AUXILIARY0)) ;; "oral nasal decongestant within 6 hours prior to dosing"

(assert
(! (=> patient_is_exposed_to_decongestant_inthepast6hours@@nasal_route
patient_is_exposed_to_decongestant_inthepast6hours)
:named REQ7_AUXILIARY1)) ;; "oral nasal decongestant within 6 hours prior to dosing"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_taken_acetaminophen_containing_product_inthepast6hours)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used paracetamol within 6 hours prior to dosing."

(assert
(! (not patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast6hours)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any non-steroidal anti-inflammatory drug within 6 hours prior to dosing."

(assert
(! (not patient_is_exposed_to_decongestant_inthepast6hours@@oral_route)
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any oral nasal decongestant within 6 hours prior to dosing."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_used_substance_of_abuse_within_past_24_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any substance of abuse within the past 24 hours of dosing.","when_to_set_to_false":"Set to false if the patient has not used any substance of abuse within the past 24 hours of dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any substance of abuse within the past 24 hours of dosing.","meaning":"Boolean indicating whether the patient has used any substance of abuse within the past 24 hours of dosing."} ;; "the patient has used substances of abuse within 24 hours of dosing"

(declare-const patient_is_exposed_to_histamine_receptor_antagonist_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a histamine receptor antagonist (antihistamine) at any time within the past 24 hours of dosing.","when_to_set_to_false":"Set to false if the patient has not been exposed to a histamine receptor antagonist (antihistamine) at any time within the past 24 hours of dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a histamine receptor antagonist (antihistamine) within the past 24 hours of dosing.","meaning":"Boolean indicating whether the patient has been exposed to a histamine receptor antagonist (antihistamine) within the past 24 hours."} ;; "the patient has used antihistamines within 24 hours of dosing"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_used_substance_of_abuse_within_past_24_hours)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used substances of abuse within 24 hours of dosing."

(assert
(! (not patient_is_exposed_to_histamine_receptor_antagonist_inthepast24hours)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used antihistamines within 24 hours of dosing."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_tea_inthepast1hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to tea within the 1 hour prior to dosing.","when_to_set_to_false":"Set to false if the patient has not been exposed to tea within the 1 hour prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to tea within the 1 hour prior to dosing.","meaning":"Boolean indicating whether the patient has been exposed to tea within the 1 hour prior to dosing."} ;; "the patient has drunk tea 1 hour prior to dosing"
(declare-const patient_is_exposed_to_coffee_inthepast1hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to coffee within the 1 hour prior to dosing.","when_to_set_to_false":"Set to false if the patient has not been exposed to coffee within the 1 hour prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to coffee within the 1 hour prior to dosing.","meaning":"Boolean indicating whether the patient has been exposed to coffee within the 1 hour prior to dosing."} ;; "the patient has drunk coffee 1 hour prior to dosing"
(declare-const patient_is_exposed_to_other_caffeinated_beverages_inthepast1hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to other caffeinated beverages within the 1 hour prior to dosing.","when_to_set_to_false":"Set to false if the patient has not been exposed to other caffeinated beverages within the 1 hour prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to other caffeinated beverages within the 1 hour prior to dosing.","meaning":"Boolean indicating whether the patient has been exposed to other caffeinated beverages within the 1 hour prior to dosing."} ;; "the patient has drunk other caffeinated beverages 1 hour prior to dosing"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_exposed_to_tea_inthepast1hours)
:named REQ9_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has drunk tea 1 hour prior to dosing."

(assert
(! (not patient_is_exposed_to_coffee_inthepast1hours)
:named REQ9_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has drunk coffee 1 hour prior to dosing."

(assert
(! (not patient_is_exposed_to_other_caffeinated_beverages_inthepast1hours)
:named REQ9_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has drunk other caffeinated beverages 1 hour prior to dosing."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_hepatic_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic impairment.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic impairment.","meaning":"Boolean indicating whether the patient currently has hepatic impairment."} ;; "hepatic impairment"

(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"

(declare-const patient_has_finding_of_renal_impairment_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal impairment is severe.","when_to_set_to_false":"Set to false if the patient's current renal impairment is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal impairment is severe.","meaning":"Boolean indicating whether the patient's current renal impairment is severe."} ;; "severe renal impairment"

(declare-const patient_has_finding_of_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertension.","meaning":"Boolean indicating whether the patient currently has hypertension."} ;; "hypertension"

(declare-const patient_has_finding_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has hyperthyroidism."} ;; "hyperthyroidism"

(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"

(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "heart disease"

(declare-const patient_has_finding_of_other_acute_medical_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another acute medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have another acute medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another acute medical condition.","meaning":"Boolean indicating whether the patient currently has another acute medical condition."} ;; "other acute medical condition"

(declare-const patient_has_finding_of_other_acute_medical_condition_now@@in_the_opinion_of_investigator_would_put_patient_at_higher_risk_or_affect_study Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the investigator, the patient's current acute medical condition would put the patient at a higher risk or affect the conduct or results of the study.","when_to_set_to_false":"Set to false if, in the opinion of the investigator, the patient's current acute medical condition would not put the patient at a higher risk or affect the conduct or results of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the investigator, the patient's current acute medical condition would put the patient at a higher risk or affect the conduct or results of the study.","meaning":"Boolean indicating whether, in the opinion of the investigator, the patient's current acute medical condition would put the patient at a higher risk or affect the conduct or results of the study."} ;; "other acute medical condition that, in the opinion of the investigator, would put the patient at a higher risk OR affect the conduct OR the results of the study"

(declare-const patient_has_finding_of_other_chronic_medical_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another chronic medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have another chronic medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another chronic medical condition.","meaning":"Boolean indicating whether the patient currently has another chronic medical condition."} ;; "other chronic medical condition"

(declare-const patient_has_finding_of_other_chronic_medical_condition_now@@in_the_opinion_of_investigator_would_put_patient_at_higher_risk_or_affect_study Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the investigator, the patient's current chronic medical condition would put the patient at a higher risk or affect the conduct or results of the study.","when_to_set_to_false":"Set to false if, in the opinion of the investigator, the patient's current chronic medical condition would not put the patient at a higher risk or affect the conduct or results of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the investigator, the patient's current chronic medical condition would put the patient at a higher risk or affect the conduct or results of the study.","meaning":"Boolean indicating whether, in the opinion of the investigator, the patient's current chronic medical condition would put the patient at a higher risk or affect the conduct or results of the study."} ;; "other chronic medical condition that, in the opinion of the investigator, would put the patient at a higher risk OR affect the conduct OR the results of the study"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable for severe renal impairment implies renal impairment
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severity_severe
       patient_has_finding_of_renal_impairment_now)
   :named REQ10_AUXILIARY0)) ;; "severe renal impairment"

;; Qualifier variable for acute medical condition (investigator opinion) implies acute medical condition
(assert
(! (=> patient_has_finding_of_other_acute_medical_condition_now@@in_the_opinion_of_investigator_would_put_patient_at_higher_risk_or_affect_study
       patient_has_finding_of_other_acute_medical_condition_now)
   :named REQ10_AUXILIARY1)) ;; "other acute medical condition that, in the opinion of the investigator, would put the patient at a higher risk OR affect the conduct OR the results of the study"

;; Qualifier variable for chronic medical condition (investigator opinion) implies chronic medical condition
(assert
(! (=> patient_has_finding_of_other_chronic_medical_condition_now@@in_the_opinion_of_investigator_would_put_patient_at_higher_risk_or_affect_study
       patient_has_finding_of_other_chronic_medical_condition_now)
   :named REQ10_AUXILIARY2)) ;; "other chronic medical condition that, in the opinion of the investigator, would put the patient at a higher risk OR affect the conduct OR the results of the study"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_hepatic_impairment_now)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from hepatic impairment."

(assert
(! (not patient_has_finding_of_renal_impairment_now@@severity_severe)
   :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from severe renal impairment."

(assert
(! (not patient_has_finding_of_hypertension_now)
   :named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from hypertension."

(assert
(! (not patient_has_finding_of_hyperthyroidism_now)
   :named REQ10_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from hyperthyroidism."

(assert
(! (not patient_has_finding_of_diabetes_mellitus_now)
   :named REQ10_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from diabetes mellitus."

(assert
(! (not patient_has_finding_of_heart_disease_now)
   :named REQ10_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from heart disease."

(assert
(! (not patient_has_finding_of_other_acute_medical_condition_now@@in_the_opinion_of_investigator_would_put_patient_at_higher_risk_or_affect_study)
   :named REQ10_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from other acute medical condition that, in the opinion of the investigator, would put the patient at a higher risk OR affect the conduct OR the results of the study."

(assert
(! (not patient_has_finding_of_other_chronic_medical_condition_now@@in_the_opinion_of_investigator_would_put_patient_at_higher_risk_or_affect_study)
   :named REQ10_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from other chronic medical condition that, in the opinion of the investigator, would put the patient at a higher risk OR affect the conduct OR the results of the study."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_antidepressant_inthepast28days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any antidepressant in the 28 days prior to dosing.","when_to_set_to_false":"Set to false if the patient has not been exposed to any antidepressant in the 28 days prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any antidepressant in the 28 days prior to dosing.","meaning":"Boolean indicating whether the patient has been exposed to any antidepressant in the 28 days prior to dosing."} ;; "the patient has used any antidepressant in the twenty-eight days prior to dosing"
(declare-const patient_is_exposed_to_monoamine_oxidase_inhibitor_inthepast28days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any monoamine oxidase inhibitor in the 28 days prior to dosing.","when_to_set_to_false":"Set to false if the patient has not been exposed to any monoamine oxidase inhibitor in the 28 days prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any monoamine oxidase inhibitor in the 28 days prior to dosing.","meaning":"Boolean indicating whether the patient has been exposed to any monoamine oxidase inhibitor in the 28 days prior to dosing."} ;; "the patient has used any monoamine oxidase inhibitor in the twenty-eight days prior to dosing"
(declare-const patient_is_exposed_to_beta_adrenergic_receptor_antagonist_inthepast28days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any beta-adrenergic receptor antagonist in the 28 days prior to dosing.","when_to_set_to_false":"Set to false if the patient has not been exposed to any beta-adrenergic receptor antagonist in the 28 days prior to dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any beta-adrenergic receptor antagonist in the 28 days prior to dosing.","meaning":"Boolean indicating whether the patient has been exposed to any beta-adrenergic receptor antagonist in the 28 days prior to dosing."} ;; "the patient has used any beta-blocking drug in the twenty-eight days prior to dosing"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_exposed_to_antidepressant_inthepast28days)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any antidepressant in the twenty-eight days prior to dosing."

(assert
(! (not patient_is_exposed_to_monoamine_oxidase_inhibitor_inthepast28days)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any monoamine oxidase inhibitor in the twenty-eight days prior to dosing."

(assert
(! (not patient_is_exposed_to_beta_adrenergic_receptor_antagonist_inthepast28days)
:named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any beta-blocking drug in the twenty-eight days prior to dosing."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with alcohol abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with alcohol abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had alcohol abuse.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse."} ;; "the patient has a history of alcohol abuse"

(declare-const patient_alcohol_value_recorded_now_withunit_units Real) ;; {"when_to_set_to_value":"Set to the measured or self-reported number of units of alcohol consumed per week by the patient, recorded now.","when_to_set_to_null":"Set to null if the patient's current weekly alcohol consumption is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current weekly alcohol consumption in units."} ;; "regular consumption of alcohol in excess of the recommended weekly limits"

(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as male or other.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "twenty-one units for females"

(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as female or other.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is male."} ;; "twenty-eight units for males"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion if the patient has a history of alcohol abuse
(assert
(! (not patient_has_finding_of_alcohol_abuse_inthehistory)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse."

;; Exclusion if the patient admits to regular consumption of alcohol in excess of recommended weekly limits
(assert
(! (not (or
          (and patient_sex_is_female_now
               (> patient_alcohol_value_recorded_now_withunit_units 21))
          (and patient_sex_is_male_now
               (> patient_alcohol_value_recorded_now_withunit_units 28))))
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient admits to regular consumption of alcohol in excess of the recommended weekly limits of twenty-one units for females OR twenty-eight units for males."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_cigarette_smoking_quantity_value_recorded_now_withunit_cigarettes_per_day Real) ;; {"when_to_set_to_value":"Set to the number of cigarettes the patient currently smokes per day if documented.","when_to_set_to_null":"Set to null if the number of cigarettes currently smoked per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of cigarettes the patient currently smokes per day."} ;; "current smoker of ten or more cigarettes per day"

(declare-const patient_has_finding_of_equivalent_tobacco_product_smoking_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently reports smoking habits using other tobacco products in a manner equivalent to smoking ten or more cigarettes per day.","when_to_set_to_false":"Set to false if the patient does not currently report smoking habits using other tobacco products in a manner equivalent to smoking ten or more cigarettes per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently reports smoking habits using other tobacco products in a manner equivalent to smoking ten or more cigarettes per day.","meaning":"Boolean indicating whether the patient currently reports smoking habits using other tobacco products in a manner equivalent to smoking ten or more cigarettes per day."} ;; "reports equivalent smoking habits using other tobacco products"

(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exhibiting tobacco smoking behavior, including smoking cigarettes or using other tobacco products in a manner equivalent to smoking.","when_to_set_to_false":"Set to false if the patient is not currently exhibiting tobacco smoking behavior, including not smoking cigarettes or using other tobacco products in a manner equivalent to smoking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exhibiting tobacco smoking behavior.","meaning":"Boolean indicating whether the patient is currently exhibiting tobacco smoking behavior (including cigarettes or equivalent tobacco products)."} ;; "smoking habits"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; If the patient currently smokes ten or more cigarettes per day, then they are currently exhibiting tobacco smoking behavior
(assert
(! (=> (>= patient_cigarette_smoking_quantity_value_recorded_now_withunit_cigarettes_per_day 10)
        patient_has_finding_of_tobacco_smoking_behavior_finding_now)
    :named REQ13_AUXILIARY0)) ;; "current smoker of ten or more cigarettes per day"

;; If the patient currently reports equivalent smoking habits using other tobacco products, then they are currently exhibiting tobacco smoking behavior
(assert
(! (=> patient_has_finding_of_equivalent_tobacco_product_smoking_behavior_now
        patient_has_finding_of_tobacco_smoking_behavior_finding_now)
    :named REQ13_AUXILIARY1)) ;; "reports equivalent smoking habits using other tobacco products"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient is a current smoker of ten or more cigarettes per day
(assert
(! (not (>= patient_cigarette_smoking_quantity_value_recorded_now_withunit_cigarettes_per_day 10))
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a current smoker of ten or more cigarettes per day."

;; Exclusion: patient reports equivalent smoking habits using other tobacco products
(assert
(! (not patient_has_finding_of_equivalent_tobacco_product_smoking_behavior_now)
    :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient reports equivalent smoking habits using other tobacco products."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_smokes_products_containing_tobacco_inthepast12hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has smoked products containing tobacco at any time within the past 12 hours.","when_to_set_to_false":"Set to false if the patient has not smoked products containing tobacco at any time within the past 12 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has smoked products containing tobacco within the past 12 hours.","meaning":"Boolean indicating whether the patient has smoked products containing tobacco within the past 12 hours."} ;; "the patient has smoked tobacco products within twelve hours of dosing"
(declare-const patient_has_finding_of_chews_products_containing_tobacco_inthepast12hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has chewed products containing tobacco at any time within the past 12 hours.","when_to_set_to_false":"Set to false if the patient has not chewed products containing tobacco at any time within the past 12 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has chewed products containing tobacco within the past 12 hours.","meaning":"Boolean indicating whether the patient has chewed products containing tobacco within the past 12 hours."} ;; "the patient has chewed tobacco products within twelve hours of dosing"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_smokes_products_containing_tobacco_inthepast12hours)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has smoked tobacco products within twelve hours of dosing."

(assert
(! (not patient_has_finding_of_chews_products_containing_tobacco_inthepast12hours)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chewed tobacco products within twelve hours of dosing."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a malignant neoplastic disease (malignancy of any organ system) at any time within the past five years, regardless of treatment status or evidence of recurrence/metastases.","when_to_set_to_false":"Set to false if the patient has not had a malignant neoplastic disease (malignancy of any organ system) within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a malignant neoplastic disease within the past five years.","meaning":"Boolean indicating whether the patient has had a malignant neoplastic disease (malignancy of any organ system) within the past five years."} ;; "malignancy of any organ system, treated or untreated, within the past five years, regardless of whether there is evidence of local recurrence OR metastases"

(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had secondary malignant neoplastic disease (metastases) at any time within the past five years.","when_to_set_to_false":"Set to false if the patient has not had secondary malignant neoplastic disease (metastases) within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had secondary malignant neoplastic disease within the past five years.","meaning":"Boolean indicating whether the patient has had secondary malignant neoplastic disease (metastases) within the past five years."} ;; "metastases within the past five years"

(declare-const patient_has_finding_of_basal_cell_carcinoma_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has basal cell carcinoma of the skin.","when_to_set_to_false":"Set to false if the patient currently does not have basal cell carcinoma of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has basal cell carcinoma of the skin.","meaning":"Boolean indicating whether the patient currently has basal cell carcinoma of the skin."} ;; "basal cell carcinoma of the skin"

(declare-const patient_has_finding_of_basal_cell_carcinoma_of_skin_now@@localized Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has basal cell carcinoma of the skin and the carcinoma is localized.","when_to_set_to_false":"Set to false if the patient currently has basal cell carcinoma of the skin and the carcinoma is not localized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the basal cell carcinoma of the skin is localized.","meaning":"Boolean indicating whether the patient's current basal cell carcinoma of the skin is localized."} ;; "localized basal cell carcinoma of the skin"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_basal_cell_carcinoma_of_skin_now@@localized
       patient_has_finding_of_basal_cell_carcinoma_of_skin_now)
   :named REQ15_AUXILIARY0)) ;; "localized basal cell carcinoma of the skin" implies "basal cell carcinoma of the skin"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion: patient has a history of malignancy of any organ system (within 5 years) AND does NOT have localized basal cell carcinoma of the skin
(assert
(! (not (and patient_has_finding_of_malignant_neoplastic_disease_inthepast5years
             (not patient_has_finding_of_basal_cell_carcinoma_of_skin_now@@localized)))
   :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of malignancy of any organ system, treated or untreated, within the past five years, regardless of whether there is evidence of local recurrence OR metastases) AND (the patient does NOT have localized basal cell carcinoma of the skin))."
