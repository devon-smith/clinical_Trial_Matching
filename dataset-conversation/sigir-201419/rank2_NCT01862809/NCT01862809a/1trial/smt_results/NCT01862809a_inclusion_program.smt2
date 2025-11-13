;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_cigarettes_smoked_last_24_hours_value_recorded_in_count Real) ;; {"when_to_set_to_value":"Set to the number of cigarettes the patient has smoked in the last 24 hours, recorded as a count.","when_to_set_to_null":"Set to null if the number of cigarettes smoked in the last 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of cigarettes the patient has smoked in the last 24 hours, in count."} // "has smoked ≥ 5 cigarettes in the last 24 hours"
(declare-const patient_cigarettes_smoked_lifetime_value_recorded_in_count Real) ;; {"when_to_set_to_value":"Set to the total number of cigarettes the patient has smoked in their lifetime, recorded as a count.","when_to_set_to_null":"Set to null if the total number of cigarettes smoked in the patient's lifetime is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of cigarettes the patient has smoked in their lifetime, in count."} // "has smoked more than 100 cigarettes in the individual's lifetime"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "current smoker"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition in the requirement: "current smoker" is defined as (lifetime > 100) AND (last 24h ≥ 5)
(assert
  (! (= patient_has_finding_of_smoker_now
        (and (> patient_cigarettes_smoked_lifetime_value_recorded_in_count 100)
             (>= patient_cigarettes_smoked_last_24_hours_value_recorded_in_count 5)))
     :named REQ0_AUXILIARY0)) ;; "current smoker (defined as (an individual who has smoked more than 100 cigarettes in the individual's lifetime) AND (has smoked ≥ 5 cigarettes in the last 24 hours))"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a current smoker"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const smoking_history_duration_value_recorded_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years corresponding to the patient's total smoking history duration as recorded.","when_to_set_to_null":"Set to null if the patient's smoking history duration in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's total smoking history duration in years."} // "smoking history duration ≥ 5 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= smoking_history_duration_value_recorded_in_years 5.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a smoking history duration ≥ 5 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_chewing_tobacco_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to chewing tobacco at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to chewing tobacco at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to chewing tobacco at any time in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to chewing tobacco at any time in the past."} // "chewing tobacco"
(declare-const patient_is_exposed_to_chewing_tobacco_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to chewing tobacco within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to chewing tobacco within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to chewing tobacco within the past 6 months.","meaning":"Boolean indicating whether the patient has been exposed to chewing tobacco within the past 6 months."} // "chewing tobacco"
(declare-const patient_is_exposed_to_cigar_smoking_tobacco_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to cigar smoking tobacco at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to cigar smoking tobacco at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to cigar smoking tobacco at any time in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to cigar smoking tobacco at any time in the past."} // "cigar tobacco"
(declare-const patient_is_exposed_to_cigar_smoking_tobacco_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to cigar smoking tobacco within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to cigar smoking tobacco within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to cigar smoking tobacco within the past 6 months.","meaning":"Boolean indicating whether the patient has been exposed to cigar smoking tobacco within the past 6 months."} // "cigar tobacco"
(declare-const patient_is_exposed_to_cigarillo_tobacco_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to cigarillo tobacco at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to cigarillo tobacco at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to cigarillo tobacco at any time in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to cigarillo tobacco at any time in the past."} // "cigarillo tobacco"
(declare-const patient_is_exposed_to_cigarillo_tobacco_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to cigarillo tobacco within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to cigarillo tobacco within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to cigarillo tobacco within the past 6 months.","meaning":"Boolean indicating whether the patient has been exposed to cigarillo tobacco within the past 6 months."} // "cigarillo tobacco"
(declare-const patient_is_exposed_to_pipe_smoking_tobacco_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to pipe smoking tobacco at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to pipe smoking tobacco at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to pipe smoking tobacco at any time in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to pipe smoking tobacco at any time in the past."} // "pipe tobacco"
(declare-const patient_is_exposed_to_pipe_smoking_tobacco_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to pipe smoking tobacco within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to pipe smoking tobacco within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to pipe smoking tobacco within the past 6 months.","meaning":"Boolean indicating whether the patient has been exposed to pipe smoking tobacco within the past 6 months."} // "pipe tobacco"
(declare-const patient_is_exposed_to_snuff_tobacco_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to snuff tobacco at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to snuff tobacco at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to snuff tobacco at any time in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to snuff tobacco at any time in the past."} // "snuff tobacco"
(declare-const patient_is_exposed_to_snuff_tobacco_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to snuff tobacco within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to snuff tobacco within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to snuff tobacco within the past 6 months.","meaning":"Boolean indicating whether the patient has been exposed to snuff tobacco within the past 6 months."} // "snuff tobacco"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Exhaustive subcategories for "other tobacco products" (pipe, cigar, snuff, cigarillo, chewing tobacco)
(declare-const patient_has_recent_use_of_other_tobacco_products Bool) ;; {"when_to_set_to_true":"Set to true if the patient has recent use (within the past 6 months) of any of the following tobacco products: pipe tobacco, cigar tobacco, snuff tobacco, cigarillo tobacco, or chewing tobacco.","when_to_set_to_false":"Set to false if the patient has not had recent use (within the past 6 months) of any of the listed tobacco products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had recent use of any of the listed tobacco products.","meaning":"Boolean indicating whether the patient has recent use (within the past 6 months) of any of the listed other tobacco products."} // "recent use of other tobacco products (with exhaustive subcategories...)"
(assert
  (! (= patient_has_recent_use_of_other_tobacco_products
        (or patient_is_exposed_to_pipe_smoking_tobacco_inthepast6months
            patient_is_exposed_to_cigar_smoking_tobacco_inthepast6months
            patient_is_exposed_to_snuff_tobacco_inthepast6months
            patient_is_exposed_to_cigarillo_tobacco_inthepast6months
            patient_is_exposed_to_chewing_tobacco_inthepast6months))
     :named REQ3_AUXILIARY0)) ;; "recent use of other tobacco products (with exhaustive subcategories...)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: NOT have recent use of other tobacco products (with exhaustive subcategories)
(assert
  (! (not patient_has_recent_use_of_other_tobacco_products)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have recent use of other tobacco products (with exhaustive subcategories...)"

;; Component 1: Use of any listed tobacco product in the remote past (> 6 months ago) is acceptable in smokers
(assert
  (! (or
        (and patient_has_finding_of_smoker_now
             (or (and patient_is_exposed_to_pipe_smoking_tobacco_inthehistory
                      (not patient_is_exposed_to_pipe_smoking_tobacco_inthepast6months))
                 (and patient_is_exposed_to_cigar_smoking_tobacco_inthehistory
                      (not patient_is_exposed_to_cigar_smoking_tobacco_inthepast6months))
                 (and patient_is_exposed_to_snuff_tobacco_inthehistory
                      (not patient_is_exposed_to_snuff_tobacco_inthepast6months))
                 (and patient_is_exposed_to_cigarillo_tobacco_inthehistory
                      (not patient_is_exposed_to_cigarillo_tobacco_inthepast6months))
                 (and patient_is_exposed_to_chewing_tobacco_inthehistory
                      (not patient_is_exposed_to_chewing_tobacco_inthepast6months)))))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "use of [pipe/cigar/snuff/cigarillo/chewing tobacco] in the remote past (> 6 months ago) is acceptable in smokers"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const age_median_value_in_years Real) ;; {"when_to_set_to_value":"Set to the median age value in years for the relevant population or cohort.","when_to_set_to_null":"Set to null if the median age value is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the median age value in years for the study population or matching cohort."} // "age above the median OR age below the median OR estimated to be 50 years"
(declare-const age_value_recorded_now_in_years_estimated Real) ;; {"when_to_set_to_value":"Set to the estimated value of the patient's age in years at the current time.","when_to_set_to_null":"Set to null if the patient's age estimation is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the patient's age in years as estimated at the current time."} // "estimated to be 50 years"
(declare-const patient_ethnicity_is_african_american_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ethnicity is documented as African-American.","when_to_set_to_false":"Set to false if the patient's current ethnicity is documented as not African-American.","when_to_set_to_null":"Set to null if the patient's current ethnicity is unknown, not documented, or cannot be determined.","meaning":"Boolean variable indicating whether the patient's current ethnicity is African-American."} // "African-American ethnicity"
(declare-const patient_ethnicity_is_white_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ethnicity is documented as White.","when_to_set_to_false":"Set to false if the patient's current ethnicity is documented as not White.","when_to_set_to_null":"Set to null if the patient's current ethnicity is unknown, not documented, or cannot be determined.","meaning":"Boolean variable indicating whether the patient's current ethnicity is White."} // "White ethnicity"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean variable indicating whether the patient's current sex is female."} // "female gender"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean variable indicating whether the patient's current sex is male."} // "male gender"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Exhaustive subcategories for ethnicity: only White or African-American qualify
(assert
  (! (= (or patient_ethnicity_is_white_now
            patient_ethnicity_is_african_american_now)
        (or patient_ethnicity_is_white_now
            patient_ethnicity_is_african_american_now))
     :named REQ4_AUXILIARY0)) ;; "ethnicity (with exhaustive subcategories (White ethnicity, African-American ethnicity))"

;; Exhaustive subcategories for gender: only male or female qualify
(assert
  (! (= (or patient_sex_is_male_now
            patient_sex_is_female_now)
        (or patient_sex_is_male_now
            patient_sex_is_female_now))
     :named REQ4_AUXILIARY1)) ;; "gender (with exhaustive subcategories (male gender, female gender))"

;; Age matching: above median, below median, or estimated to be 50 years
(define-fun patient_age_is_above_median_now () Bool
  (> patient_age_value_recorded_now_in_years age_median_value_in_years)) ;; {"when_to_set_to_true":"Set to true if the patient's current age in years is greater than the median age value.","when_to_set_to_false":"Set to false if the patient's current age in years is less than or equal to the median age value.","when_to_set_to_null":"Set to null if either value is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's current age is above the median."} // "age above the median"

(define-fun patient_age_is_below_median_now () Bool
  (< patient_age_value_recorded_now_in_years age_median_value_in_years)) ;; {"when_to_set_to_true":"Set to true if the patient's current age in years is less than the median age value.","when_to_set_to_false":"Set to false if the patient's current age in years is greater than or equal to the median age value.","when_to_set_to_null":"Set to null if either value is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's current age is below the median."} // "age below the median"

(define-fun patient_age_is_estimated_50_now () Bool
  (= age_value_recorded_now_in_years_estimated 50.0)) ;; {"when_to_set_to_true":"Set to true if the patient's estimated age in years is exactly 50.","when_to_set_to_false":"Set to false if the patient's estimated age in years is not 50.","when_to_set_to_null":"Set to null if the estimated age is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's estimated age is 50 years."} // "estimated to be 50 years"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: patient must be a smoker AND must match on ethnicity, gender, and age as specified
(assert
  (! (and patient_has_finding_of_smoker_now
          (or patient_ethnicity_is_white_now
              patient_ethnicity_is_african_american_now)
          (or patient_sex_is_male_now
              patient_sex_is_female_now)
          (or patient_age_is_above_median_now
              patient_age_is_below_median_now
              patient_age_is_estimated_50_now))
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a smoker who will be frequency matched to non-smokers based on (ethnicity (with exhaustive subcategories (White ethnicity, African-American ethnicity)) AND gender (with exhaustive subcategories (male gender, female gender)) AND age (age above the median OR age below the median OR estimated to be 50 years))."
