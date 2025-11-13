;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_black_ethnicity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently identifies as having Black ethnicity.","when_to_set_to_false":"Set to false if the patient currently does not identify as having Black ethnicity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently identifies as having Black ethnicity.","meaning":"Boolean indicating whether the patient currently identifies as having Black ethnicity."} ;; "patient is of Black ethnicity"
(declare-const patient_has_american_ethnicity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently identifies as having American ethnicity.","when_to_set_to_false":"Set to false if the patient currently does not identify as having American ethnicity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently identifies as having American ethnicity.","meaning":"Boolean indicating whether the patient currently identifies as having American ethnicity."} ;; "patient is of American ethnicity"
(declare-const patient_has_african_ethnicity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently identifies as having African ethnicity.","when_to_set_to_false":"Set to false if the patient currently does not identify as having African ethnicity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently identifies as having African ethnicity.","meaning":"Boolean indicating whether the patient currently identifies as having African ethnicity."} ;; "patient is of African ethnicity"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient is of Black ethnicity AND NOT of American ethnicity AND NOT of African ethnicity
(assert
(! (not (and patient_has_black_ethnicity_now
             (not patient_has_american_ethnicity_now)
             (not patient_has_african_ethnicity_now)))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is of Black ethnicity AND is NOT of American ethnicity AND is NOT of African ethnicity (i.e., only Black individuals who are American or African are included)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_african_american_and_american_born_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an African American individual who is American born.","when_to_set_to_false":"Set to false if the patient is currently not an African American individual who is American born.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an African American individual who is American born.","meaning":"Boolean indicating whether the patient is currently an African American individual who is American born."} ;; "the patient is NOT an African American individual who is American born"
(declare-const patient_is_african_and_african_born_living_in_united_states_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an African individual living in the United States who is African born.","when_to_set_to_false":"Set to false if the patient is currently not an African individual living in the United States who is African born.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an African individual living in the United States who is African born.","meaning":"Boolean indicating whether the patient is currently an African individual living in the United States who is African born."} ;; "the patient is NOT an African individual living in the United States who is African born"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_has_black_ethnicity_now
               (not patient_is_african_american_and_american_born_now)
               (not patient_is_african_and_african_born_living_in_united_states_now)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a Black individual) AND (the patient is NOT an African American individual who is American born) AND (the patient is NOT an African individual living in the United States who is African born)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is not currently taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "medications"

(declare-const patient_is_taking_drug_or_medicament_now@@known_to_alter_parameters_under_investigation_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently taking is known to alter the parameters under investigation in this study.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently taking is not known to alter the parameters under investigation in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament the patient is currently taking is known to alter the parameters under investigation in this study.","meaning":"Boolean indicating whether the drug or medicament the patient is currently taking is known to alter the parameters under investigation in this study."} ;; "medications that are known to alter the parameters which are under investigation in this study"

(declare-const patient_is_taking_drug_or_medicament_now@@used_to_treat_hyperlipidemia Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently taking is used to treat hyperlipidemia.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently taking is not used to treat hyperlipidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament the patient is currently taking is used to treat hyperlipidemia.","meaning":"Boolean indicating whether the drug or medicament the patient is currently taking is used to treat hyperlipidemia."} ;; "medications to treat hyperlipidemia"

(declare-const patient_is_undergoing_thyroid_hormone_replacement_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing thyroid hormone replacement therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing thyroid hormone replacement therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing thyroid hormone replacement therapy.","meaning":"Boolean indicating whether the patient is currently undergoing thyroid hormone replacement therapy."} ;; "thyroid hormone replacement therapy"

(declare-const patient_is_undergoing_thyroid_hormone_replacement_therapy_now@@included_if_thyroid_stimulating_hormone_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing thyroid hormone replacement therapy and thyroid stimulating hormone is normal.","when_to_set_to_false":"Set to false if the patient is currently undergoing thyroid hormone replacement therapy and thyroid stimulating hormone is not normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing thyroid hormone replacement therapy and thyroid stimulating hormone is normal.","meaning":"Boolean indicating whether the patient is currently undergoing thyroid hormone replacement therapy and thyroid stimulating hormone is normal."} ;; "thyroid hormone replacement therapy (who will be included if thyroid stimulating hormone is normal)"

(declare-const patient_thyroid_stimulating_hormone_value_now_in_milliunits_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's current thyroid stimulating hormone (TSH) in milliunits per liter (mU/L).","when_to_set_to_null":"Set to null if the patient's current TSH value is unknown, not documented, or cannot be determined.","meaning":"Numeric laboratory value indicating the patient's current thyroid stimulating hormone (TSH) level, measured in milliunits per liter (mU/L)."} ;; "thyroid stimulating hormone is normal"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@known_to_alter_parameters_under_investigation_in_this_study
      patient_is_taking_drug_or_medicament_now)
:named REQ2_AUXILIARY0)) ;; "medications that are known to alter the parameters which are under investigation in this study"

(assert
(! (=> patient_is_taking_drug_or_medicament_now@@used_to_treat_hyperlipidemia
      patient_is_taking_drug_or_medicament_now)
:named REQ2_AUXILIARY1)) ;; "medications to treat hyperlipidemia"

(assert
(! (=> patient_is_undergoing_thyroid_hormone_replacement_therapy_now@@included_if_thyroid_stimulating_hormone_is_normal
      patient_is_undergoing_thyroid_hormone_replacement_therapy_now)
:named REQ2_AUXILIARY2)) ;; "thyroid hormone replacement therapy (who will be included if thyroid stimulating hormone is normal)"

;; Definition: patient_is_undergoing_thyroid_hormone_replacement_therapy_now@@included_if_thyroid_stimulating_hormone_is_normal means patient is on therapy AND TSH is normal (assume normal: 0.4 <= TSH <= 4.0)
(assert
(! (= patient_is_undergoing_thyroid_hormone_replacement_therapy_now@@included_if_thyroid_stimulating_hormone_is_normal
      (and patient_is_undergoing_thyroid_hormone_replacement_therapy_now
           (>= patient_thyroid_stimulating_hormone_value_now_in_milliunits_per_liter 0.4)
           (<= patient_thyroid_stimulating_hormone_value_now_in_milliunits_per_liter 4.0)))
:named REQ2_AUXILIARY3)) ;; "included if thyroid stimulating hormone is normal"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient is taking a medication known to alter study parameters, except if it is for hyperlipidemia or thyroid hormone replacement therapy with normal TSH
(assert
(! (not (and patient_is_taking_drug_or_medicament_now@@known_to_alter_parameters_under_investigation_in_this_study
             (not patient_is_taking_drug_or_medicament_now@@used_to_treat_hyperlipidemia)
             (not patient_is_undergoing_thyroid_hormone_replacement_therapy_now@@included_if_thyroid_stimulating_hormone_is_normal)))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient takes medications that are known to alter the parameters which are under investigation in this study, except for medications to treat hyperlipidemia (who will be included with adjusted analyses) and thyroid hormone replacement therapy (who will be included if thyroid stimulating hormone is normal)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "the patient is a woman"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is documented as not currently breastfeeding.","when_to_set_to_null":"Set to null if the patient's breastfeeding status is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patient_has_infant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infant (a child under the care of the patient).","when_to_set_to_false":"Set to false if the patient currently does not have an infant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infant.","meaning":"Boolean indicating whether the patient currently has an infant (a child under the care of the patient)."} ;; "the patient has an infant"
(declare-const infant_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the current age in months of the infant (child of the patient) if known.","when_to_set_to_null":"Set to null if the age of the infant is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value indicating the current age of the infant (child of the patient) in months."} ;; "the infant is less than four months of age"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient is a woman who is pregnant
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

;; Exclusion: patient is a woman who is breastfeeding
(assert
(! (not (and patient_sex_is_female_now patient_is_breastfeeding_now))
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is breastfeeding."

;; Exclusion: patient is a woman who has an infant AND the infant is less than four months of age
(assert
(! (not (and patient_sex_is_female_now patient_has_infant_now (< infant_age_value_recorded_now_in_months 4)))
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who has an infant AND the infant is less than four months of age."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_on_injectable_hormonal_contraception_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on any type of injectable hormonal contraception therapy.","when_to_set_to_false":"Set to false if the patient is currently not on any type of injectable hormonal contraception therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on any type of injectable hormonal contraception therapy.","meaning":"Boolean indicating whether the patient is currently on any type of injectable hormonal contraception therapy."} ;; "any type of injectable hormonal contraception therapy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_sex_is_female_now patient_is_on_injectable_hormonal_contraception_therapy_now))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman on any type of injectable hormonal contraception therapy."
