;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than 18 years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than 18 years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_non_compliant_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented history of non-compliant behavior at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of non-compliant behavior at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of non-compliant behavior.","meaning":"Boolean indicating whether the patient has ever had non-compliant behavior documented in their history."} ;; "has a history of non-compliance"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_non_compliant_behavior_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of non-compliance."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hepatic_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic (liver) insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic (liver) insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic (liver) insufficiency.","meaning":"Boolean indicating whether the patient currently has hepatic (liver) insufficiency."} ;; "liver insufficiency"
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic (liver) failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic (liver) failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic (liver) failure.","meaning":"Boolean indicating whether the patient currently has hepatic (liver) failure."} ;; "liver failure"
(declare-const patient_has_finding_of_renal_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal failure.","when_to_set_to_false":"Set to false if the patient currently does not have renal failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal failure.","meaning":"Boolean indicating whether the patient currently has renal failure."} ;; "renal failure"
(declare-const patient_measurement_of_renal_clearance_of_creatinine_value_recorded_now_withunit_cubic_centimeters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of calculated creatinine clearance in cubic centimeters per minute is available for the patient now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current calculated creatinine clearance in cubic centimeters per minute."} ;; "calculated creatinine clearance < 50 cubic centimeters per minute"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hepatic_insufficiency_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver insufficiency."

(assert
(! (not patient_has_finding_of_renal_insufficiency_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal insufficiency."

(assert
(! (not patient_has_finding_of_hepatic_failure_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver failure."

(assert
(! (not (or patient_has_finding_of_renal_failure_now
            (< patient_measurement_of_renal_clearance_of_creatinine_value_recorded_now_withunit_cubic_centimeters_per_minute 50)))
:named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal failure defined as calculated creatinine clearance < 50 cubic centimeters per minute."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_systemic_lupus_erythematosus_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a flare of systemic lupus erythematosus within the past 6 weeks.","when_to_set_to_false":"Set to false if the patient has not had a flare of systemic lupus erythematosus within the past 6 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a flare of systemic lupus erythematosus within the past 6 weeks.","meaning":"Boolean indicating whether the patient has had a flare of systemic lupus erythematosus within the past 6 weeks."} ;; "has had a severe systemic lupus erythematosus flare in the last 6 weeks"
(declare-const patient_has_finding_of_systemic_lupus_erythematosus_inthepast6weeks@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a severe flare of systemic lupus erythematosus within the past 6 weeks.","when_to_set_to_false":"Set to false if the patient has had a flare of systemic lupus erythematosus within the past 6 weeks but it was not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the flare of systemic lupus erythematosus within the past 6 weeks was severe.","meaning":"Boolean indicating whether the patient has had a severe flare of systemic lupus erythematosus within the past 6 weeks."} ;; "severe systemic lupus erythematosus flare in the last 6 weeks"
(declare-const systemic_lupus_erythematosus_disease_activity_index_value_recorded_in_the_past_6_weeks_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's SLEDAI score recorded within the past 6 weeks, measured in points.","when_to_set_to_null":"Set to null if the SLEDAI score within the past 6 weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's SLEDAI score recorded within the past 6 weeks, measured in points."} ;; "systemic lupus erythematosus disease activity index > 12 points"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: severe SLE flare in past 6 weeks = SLEDAI > 12
(assert
(! (= patient_has_finding_of_systemic_lupus_erythematosus_inthepast6weeks@@severe
     (and patient_has_finding_of_systemic_lupus_erythematosus_inthepast6weeks
          (> systemic_lupus_erythematosus_disease_activity_index_value_recorded_in_the_past_6_weeks_withunit_points 12)))
:named REQ4_AUXILIARY0)) ;; "defined as systemic lupus erythematosus disease activity index > 12 points"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_systemic_lupus_erythematosus_inthepast6weeks@@severe
       patient_has_finding_of_systemic_lupus_erythematosus_inthepast6weeks)
:named REQ4_AUXILIARY1)) ;; "severe flare implies flare"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_systemic_lupus_erythematosus_inthepast6weeks@@severe)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a severe systemic lupus erythematosus flare in the last 6 weeks defined as systemic lupus erythematosus disease activity index > 12 points."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_had_change_in_medication_relevant_to_cognitive_dysfunction_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a change in any medication relevant to cognitive dysfunction within the last 4 weeks.","when_to_set_to_false":"Set to false if the patient has not had a change in any medication relevant to cognitive dysfunction within the last 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a change in any medication relevant to cognitive dysfunction within the last 4 weeks.","meaning":"Boolean indicating whether the patient has had a change within the last 4 weeks in any medication relevant to cognitive dysfunction."} ;; "has had a change within the last 4 weeks in any medication relevant to cognitive dysfunction"
(declare-const patient_has_had_change_in_prednisone_containing_product_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a change in prednisone-containing medication within the last 4 weeks.","when_to_set_to_false":"Set to false if the patient has not had a change in prednisone-containing medication within the last 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a change in prednisone-containing medication within the last 4 weeks.","meaning":"Boolean indicating whether the patient has had a change within the last 4 weeks in prednisone-containing medication."} ;; "prednisone"
(declare-const patient_has_had_change_in_prednisone_containing_product_inthepast4weeks@@relevant_to_impaired_cognition Bool) ;; {"when_to_set_to_true":"Set to true if the prednisone-containing medication changed in the last 4 weeks is relevant to impaired cognition (cognitive dysfunction).","when_to_set_to_false":"Set to false if the prednisone-containing medication changed in the last 4 weeks is not relevant to impaired cognition (cognitive dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prednisone-containing medication changed in the last 4 weeks is relevant to impaired cognition.","meaning":"Boolean indicating whether the prednisone-containing medication changed in the last 4 weeks is relevant to impaired cognition."} ;; "prednisone ... relevant to cognitive dysfunction"
(declare-const patient_has_had_change_in_antidepressant_medication_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a change in antidepressant medication within the last 4 weeks.","when_to_set_to_false":"Set to false if the patient has not had a change in antidepressant medication within the last 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a change in antidepressant medication within the last 4 weeks.","meaning":"Boolean indicating whether the patient has had a change within the last 4 weeks in antidepressant medication."} ;; "anti-depressant medication"
(declare-const patient_has_had_change_in_medication_for_insomnia_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a change in medication for insomnia within the last 4 weeks.","when_to_set_to_false":"Set to false if the patient has not had a change in medication for insomnia within the last 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a change in medication for insomnia within the last 4 weeks.","meaning":"Boolean indicating whether the patient has had a change within the last 4 weeks in medication for insomnia."} ;; "medication for insomnia"
(declare-const patient_has_had_change_in_opioid_receptor_agonist_containing_product_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a change in narcotic (opioid receptor agonist) medication within the last 4 weeks.","when_to_set_to_false":"Set to false if the patient has not had a change in narcotic (opioid receptor agonist) medication within the last 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a change in narcotic (opioid receptor agonist) medication within the last 4 weeks.","meaning":"Boolean indicating whether the patient has had a change within the last 4 weeks in narcotic (opioid receptor agonist) medication."} ;; "narcotic medication"
(declare-const patient_has_had_change_in_attention_deficit_disorder_medication_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a change in attention deficit disorder medication within the last 4 weeks.","when_to_set_to_false":"Set to false if the patient has not had a change in attention deficit disorder medication within the last 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a change in attention deficit disorder medication within the last 4 weeks.","meaning":"Boolean indicating whether the patient has had a change within the last 4 weeks in attention deficit disorder medication."} ;; "attention deficit disorder medication"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_had_change_in_prednisone_containing_product_inthepast4weeks@@relevant_to_impaired_cognition
           patient_has_had_change_in_antidepressant_medication_inthepast4weeks
           patient_has_had_change_in_medication_for_insomnia_inthepast4weeks
           patient_has_had_change_in_opioid_receptor_agonist_containing_product_inthepast4weeks
           patient_has_had_change_in_attention_deficit_disorder_medication_inthepast4weeks)
        patient_has_had_change_in_medication_relevant_to_cognitive_dysfunction_inthepast4weeks)
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (prednisone, anti-depressant medication, medication for insomnia, narcotic medication, attention deficit disorder medication)."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_had_change_in_prednisone_containing_product_inthepast4weeks@@relevant_to_impaired_cognition
       patient_has_had_change_in_prednisone_containing_product_inthepast4weeks)
:named REQ5_AUXILIARY1)) ;; "prednisone ... relevant to cognitive dysfunction"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_had_change_in_medication_relevant_to_cognitive_dysfunction_inthepast4weeks)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a change within the last 4 weeks in any medication relevant to cognitive dysfunction with non-exhaustive examples (prednisone, anti-depressant medication, medication for insomnia, narcotic medication, attention deficit disorder medication)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient currently abuses alcohol."} ;; "abuses alcohol"
(declare-const patient_has_finding_of_illicit_medication_use_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of illicit medication use (abuse of illicit drugs).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of illicit medication use (abuse of illicit drugs).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of illicit medication use (abuse of illicit drugs).","meaning":"Boolean indicating whether the patient currently abuses illicit drugs."} ;; "abuses illicit drugs"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_has_finding_of_alcohol_abuse_now
            patient_has_finding_of_illicit_medication_use_now))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient currently abuses alcohol) OR (the patient currently abuses illicit drugs)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_taking_memantine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a memantine-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a memantine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a memantine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a memantine-containing product."} ;; "the patient currently uses memantine"
(declare-const patient_is_taking_donepezil_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a donepezil-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a donepezil-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a donepezil-containing product.","meaning":"Boolean indicating whether the patient is currently taking a donepezil-containing product."} ;; "the patient currently uses donepezil"
(declare-const patient_is_taking_modafinil_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a modafinil-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a modafinil-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a modafinil-containing product.","meaning":"Boolean indicating whether the patient is currently taking a modafinil-containing product."} ;; "the patient currently uses modafinil"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_taking_memantine_containing_product_now)
    :named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient currently uses memantine."

(assert
(! (not patient_is_taking_donepezil_containing_product_now)
    :named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient currently uses donepezil."

(assert
(! (not patient_is_taking_modafinil_containing_product_now)
    :named REQ7_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient currently uses modafinil."
