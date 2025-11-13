;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient has age < 18 years"
(declare-const patient_meets_legal_age_limitations_country_specific_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the legal age limitations for their country.","when_to_set_to_false":"Set to false if the patient currently does not meet the legal age limitations for their country.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the legal age limitations for their country.","meaning":"Boolean indicating whether the patient currently meets the legal age limitations that are country specific."} ;; "the patient does NOT meet legal age limitations (country specific)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (not patient_meets_legal_age_limitations_country_specific_now))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT meet legal age limitations (country specific)."

(assert
  (! (not (< patient_age_value_recorded_now_in_years 18))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has age < 18 years."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy, regardless of the indication.","when_to_set_to_false":"Set to false if the patient is not currently undergoing anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing anticoagulant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy."} ;; "anticoagulant therapy"
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@indication_is_other_than_deep_venous_thrombosis_or_pulmonary_embolism Bool) ;; {"when_to_set_to_true":"Set to true if the indication for the patient's current anticoagulant therapy is neither deep venous thrombosis nor pulmonary embolism.","when_to_set_to_false":"Set to false if the indication for the patient's current anticoagulant therapy is deep venous thrombosis or pulmonary embolism.","when_to_set_to_null":"Set to null if the indication for the patient's current anticoagulant therapy is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the indication for the patient's current anticoagulant therapy is not deep venous thrombosis and not pulmonary embolism."} ;; "indications for anticoagulant therapy other than deep venous thrombosis or other than pulmonary embolism"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_undergoing_anticoagulant_therapy_now@@indication_is_other_than_deep_venous_thrombosis_or_pulmonary_embolism
      patient_is_undergoing_anticoagulant_therapy_now)
:named REQ1_AUXILIARY0)) ;; "among patients currently undergoing anticoagulant therapy, the indication is not deep venous thrombosis and not pulmonary embolism"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_undergoing_anticoagulant_therapy_now@@indication_is_other_than_deep_venous_thrombosis_or_pulmonary_embolism)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has indications for anticoagulant therapy other than deep venous thrombosis or other than pulmonary embolism."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_contraindication_listed_in_local_labeling_of_low_molecular_weight_heparin Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any contraindication that is listed in the local labeling of low molecular weight heparin.","when_to_set_to_false":"Set to false if the patient does not have any contraindication that is listed in the local labeling of low molecular weight heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any contraindication listed in the local labeling of low molecular weight heparin.","meaning":"Boolean indicating whether the patient has any contraindication listed in the local labeling of low molecular weight heparin."} ;; "the patient has any contraindication listed in the local labeling of low molecular weight heparin"
(declare-const patient_has_contraindication_listed_in_local_labeling_of_vitamin_k_antagonists Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any contraindication that is listed in the local labeling of vitamin K antagonists.","when_to_set_to_false":"Set to false if the patient does not have any contraindication that is listed in the local labeling of vitamin K antagonists.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any contraindication listed in the local labeling of vitamin K antagonists.","meaning":"Boolean indicating whether the patient has any contraindication listed in the local labeling of vitamin K antagonists."} ;; "the patient has any contraindication listed in the local labeling of vitamin K antagonists"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_contraindication_listed_in_local_labeling_of_low_molecular_weight_heparin)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any contraindication listed in the local labeling of low molecular weight heparin."

(assert
(! (not patient_has_contraindication_listed_in_local_labeling_of_vitamin_k_antagonists)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any contraindication listed in the local labeling of vitamin K antagonists."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of becoming pregnant (i.e., has childbearing potential).","when_to_set_to_false":"Set to false if the patient is currently not capable of becoming pregnant (i.e., does not have childbearing potential).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient has childbearing potential"
(declare-const patient_has_childbearing_potential_without_proper_contraceptive_measures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential and is not using proper contraceptive measures.","when_to_set_to_false":"Set to false if the patient does not have childbearing potential or is using proper contraceptive measures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has childbearing potential without proper contraceptive measures.","meaning":"Boolean indicating whether the patient currently has childbearing potential and is not using proper contraceptive measures."} ;; "the patient has childbearing potential without proper contraceptive measures"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_childbearing_potential_without_proper_contraceptive_measures_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has childbearing potential without proper contraceptive measures."

(assert
(! (not patient_is_pregnant_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "life expectancy < 3 months"
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the estimated number of months if the patient's current life expectancy is documented or can be determined.","when_to_set_to_null":"Set to null if the patient's current life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in months."} ;; "life expectancy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (< patient_longevity_value_recorded_now_withunit_months 3))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has life expectancy < 3 months."
