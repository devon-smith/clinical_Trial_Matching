;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_english_speaking Bool) ;; {"when_to_set_to_true":"Set to true if the patient is an English speaking patient.","when_to_set_to_false":"Set to false if the patient is not an English speaking patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is an English speaking patient.","meaning":"Boolean indicating whether the patient is an English speaking patient."} // "an English speaking patient"
(declare-const patient_is_non_english_speaking Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a non-English speaking patient.","when_to_set_to_false":"Set to false if the patient is not a non-English speaking patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a non-English speaking patient.","meaning":"Boolean indicating whether the patient is a non-English speaking patient."} // "a non-English speaking patient"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_is_english_speaking
         patient_is_non_english_speaking)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be (an English speaking patient OR a non-English speaking patient)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged greater than or equal to 8 years AND aged less than or equal to 17 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged greater than or equal to 8 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 8)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 8 years."

;; Component 1: To be included, the patient must be aged less than or equal to 17 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 17)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged less than or equal to 17 years."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of appendicitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of appendicitis.","meaning":"Boolean indicating whether the patient currently has appendicitis."} // "appendicitis"
(declare-const patient_has_finding_of_appendicitis_now@@early Bool) ;; {"when_to_set_to_true":"Set to true if the patient's appendicitis is classified as early.","when_to_set_to_false":"Set to false if the patient's appendicitis is not classified as early.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the appendicitis is early.","meaning":"Boolean indicating whether the patient's appendicitis is classified as early."} // "early appendicitis"
(declare-const patient_has_finding_of_appendicitis_now@@confirmed_by_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient's appendicitis diagnosis is confirmed by ultrasound.","when_to_set_to_false":"Set to false if the patient's appendicitis diagnosis is not confirmed by ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the appendicitis diagnosis is confirmed by ultrasound.","meaning":"Boolean indicating whether the patient's appendicitis diagnosis is confirmed by ultrasound."} // "confirmed by ultrasound"
(declare-const patient_has_finding_of_appendicitis_now@@confirmed_by_computed_tomography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's appendicitis diagnosis is confirmed by computed tomography.","when_to_set_to_false":"Set to false if the patient's appendicitis diagnosis is not confirmed by computed tomography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the appendicitis diagnosis is confirmed by computed tomography.","meaning":"Boolean indicating whether the patient's appendicitis diagnosis is confirmed by computed tomography."} // "confirmed by computed tomography"
(declare-const patient_has_undergone_ultrasonography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography (ultrasound) now.","when_to_set_to_false":"Set to false if the patient has not undergone ultrasonography (ultrasound) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultrasonography (ultrasound) now.","meaning":"Boolean indicating whether the patient has undergone ultrasonography (ultrasound) now."} // "ultrasound"
(declare-const patient_has_undergone_computerized_axial_tomography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone computed tomography (CT) now.","when_to_set_to_false":"Set to false if the patient has not undergone computed tomography (CT) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone computed tomography (CT) now.","meaning":"Boolean indicating whether the patient has undergone computed tomography (CT) now."} // "computed tomography"
(declare-const ultrasound_shows_hyperemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ultrasound shows hyperemia.","when_to_set_to_false":"Set to false if the patient's current ultrasound does not show hyperemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ultrasound shows hyperemia.","meaning":"Boolean indicating whether the patient's current ultrasound shows hyperemia."} // "ultrasound shows hyperemia"
(declare-const computed_tomography_shows_hyperemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current computed tomography shows hyperemia.","when_to_set_to_false":"Set to false if the patient's current computed tomography does not show hyperemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current computed tomography shows hyperemia.","meaning":"Boolean indicating whether the patient's current computed tomography shows hyperemia."} // "computed tomography shows hyperemia"
(declare-const ultrasound_measured_appendix_diameter_value_now_in_centimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value of the appendix diameter measured on the patient's current ultrasound, in centimeters.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the appendix diameter is on the patient's current ultrasound.","meaning":"Numeric value indicating the diameter of the appendix measured on the patient's current ultrasound, in centimeters."} // "ultrasound shows diameter less than or equal to 1.1 centimeters"
(declare-const computed_tomography_measured_appendix_diameter_value_now_in_centimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value of the appendix diameter measured on the patient's current computed tomography, in centimeters.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the appendix diameter is on the patient's current computed tomography.","meaning":"Numeric value indicating the diameter of the appendix measured on the patient's current computed tomography, in centimeters."} // "computed tomography shows diameter less than or equal to 1.1 centimeters"
(declare-const ultrasound_shows_compressible_appendix_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ultrasound shows a compressible appendix.","when_to_set_to_false":"Set to false if the patient's current ultrasound does not show a compressible appendix.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ultrasound shows a compressible appendix.","meaning":"Boolean indicating whether the patient's current ultrasound shows a compressible appendix."} // "ultrasound shows compressible appendix"
(declare-const ultrasound_shows_non_compressible_appendix_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ultrasound shows a non-compressible appendix.","when_to_set_to_false":"Set to false if the patient's current ultrasound does not show a non-compressible appendix.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ultrasound shows a non-compressible appendix.","meaning":"Boolean indicating whether the patient's current ultrasound shows a non-compressible appendix."} // "ultrasound shows non-compressible appendix"
(declare-const ultrasound_shows_no_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ultrasound shows no abscess.","when_to_set_to_false":"Set to false if the patient's current ultrasound shows an abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ultrasound shows no abscess.","meaning":"Boolean indicating whether the patient's current ultrasound shows no abscess."} // "ultrasound shows no abscess"
(declare-const computed_tomography_shows_no_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current computed tomography shows no abscess.","when_to_set_to_false":"Set to false if the patient's current computed tomography shows an abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current computed tomography shows no abscess.","meaning":"Boolean indicating whether the patient's current computed tomography shows no abscess."} // "computed tomography shows no abscess"
(declare-const ultrasound_shows_no_fecalith_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ultrasound shows no fecalith.","when_to_set_to_false":"Set to false if the patient's current ultrasound shows a fecalith.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ultrasound shows no fecalith.","meaning":"Boolean indicating whether the patient's current ultrasound shows no fecalith."} // "ultrasound shows no fecalith"
(declare-const computed_tomography_shows_no_fecalith_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current computed tomography shows no fecalith.","when_to_set_to_false":"Set to false if the patient's current computed tomography shows a fecalith.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current computed tomography shows no fecalith.","meaning":"Boolean indicating whether the patient's current computed tomography shows no fecalith."} // "computed tomography shows no fecalith"
(declare-const ultrasound_shows_no_phlegmon_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ultrasound shows no phlegmon.","when_to_set_to_false":"Set to false if the patient's current ultrasound shows a phlegmon.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ultrasound shows no phlegmon.","meaning":"Boolean indicating whether the patient's current ultrasound shows no phlegmon."} // "ultrasound shows no phlegmon"
(declare-const computed_tomography_shows_no_phlegmon_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current computed tomography shows no phlegmon.","when_to_set_to_false":"Set to false if the patient's current computed tomography shows a phlegmon.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current computed tomography shows no phlegmon.","meaning":"Boolean indicating whether the patient's current computed tomography shows no phlegmon."} // "computed tomography shows no phlegmon"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_appendicitis_now@@early
         patient_has_finding_of_appendicitis_now)
     :named REQ2_AUXILIARY0)) ;; "early appendicitis"

(assert
  (! (=> patient_has_finding_of_appendicitis_now@@confirmed_by_ultrasound
         patient_has_finding_of_appendicitis_now)
     :named REQ2_AUXILIARY1)) ;; "confirmed by ultrasound"

(assert
  (! (=> patient_has_finding_of_appendicitis_now@@confirmed_by_computed_tomography
         patient_has_finding_of_appendicitis_now)
     :named REQ2_AUXILIARY2)) ;; "confirmed by computed tomography"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: (early appendicitis confirmed by ultrasound OR early appendicitis confirmed by computed tomography)
(assert
  (! (or
        (and patient_has_finding_of_appendicitis_now@@early
             patient_has_finding_of_appendicitis_now@@confirmed_by_ultrasound)
        (and patient_has_finding_of_appendicitis_now@@early
             patient_has_finding_of_appendicitis_now@@confirmed_by_computed_tomography))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "early appendicitis confirmed by ultrasound OR early appendicitis confirmed by computed tomography"

;; Component 1: ((if confirmed by ultrasound, ultrasound shows hyperemia) OR (if confirmed by computed tomography, computed tomography shows hyperemia))
(assert
  (! (or
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_ultrasound
             ultrasound_shows_hyperemia_now)
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_computed_tomography
             computed_tomography_shows_hyperemia_now))
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if confirmed by ultrasound, ultrasound shows hyperemia OR if confirmed by computed tomography, computed tomography shows hyperemia"

;; Component 2: ((if confirmed by ultrasound, ultrasound shows diameter ≤ 1.1 cm) OR (if confirmed by computed tomography, computed tomography shows diameter ≤ 1.1 cm))
(assert
  (! (or
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_ultrasound
             (<= ultrasound_measured_appendix_diameter_value_now_in_centimeters 1.1))
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_computed_tomography
             (<= computed_tomography_measured_appendix_diameter_value_now_in_centimeters 1.1)))
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "if confirmed by ultrasound, ultrasound shows diameter ≤ 1.1 cm OR if confirmed by computed tomography, computed tomography shows diameter ≤ 1.1 cm"

;; Component 3: ((if confirmed by ultrasound, ultrasound shows compressible appendix OR ultrasound shows non-compressible appendix))
(assert
  (! (or
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_ultrasound
             (or ultrasound_shows_compressible_appendix_now
                 ultrasound_shows_non_compressible_appendix_now))
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_computed_tomography
             true)) ;; No compressibility requirement for CT
     :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "if confirmed by ultrasound, ultrasound shows compressible appendix OR ultrasound shows non-compressible appendix"

;; Component 4: ((if confirmed by ultrasound, ultrasound shows no abscess) OR (if confirmed by computed tomography, computed tomography shows no abscess))
(assert
  (! (or
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_ultrasound
             ultrasound_shows_no_abscess_now)
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_computed_tomography
             computed_tomography_shows_no_abscess_now))
     :named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "if confirmed by ultrasound, ultrasound shows no abscess OR if confirmed by computed tomography, computed tomography shows no abscess"

;; Component 5: ((if confirmed by ultrasound, ultrasound shows no fecalith) OR (if confirmed by computed tomography, computed tomography shows no fecalith))
(assert
  (! (or
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_ultrasound
             ultrasound_shows_no_fecalith_now)
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_computed_tomography
             computed_tomography_shows_no_fecalith_now))
     :named REQ2_COMPONENT5_OTHER_REQUIREMENTS)) ;; "if confirmed by ultrasound, ultrasound shows no fecalith OR if confirmed by computed tomography, computed tomography shows no fecalith"

;; Component 6: ((if confirmed by ultrasound, ultrasound shows no phlegmon) OR (if confirmed by computed tomography, computed tomography shows no phlegmon))
(assert
  (! (or
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_ultrasound
             ultrasound_shows_no_phlegmon_now)
        (and patient_has_finding_of_appendicitis_now@@confirmed_by_computed_tomography
             computed_tomography_shows_no_phlegmon_now))
     :named REQ2_COMPONENT6_OTHER_REQUIREMENTS)) ;; "if confirmed by ultrasound, ultrasound shows no phlegmon OR if confirmed by computed tomography, computed tomography shows no phlegmon"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current white blood cell count per microliter is available.","when_to_set_to_null":"Set to null if no current white blood cell count per microliter is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current white blood cell count per microliter."} // "white blood cell count"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: white blood cell count greater than 5,000 per microliter
(assert
  (! (> patient_white_blood_cell_count_value_recorded_now_withunit_per_microliter 5000.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "white blood cell count greater than 5,000 per microliter"

;; Component 1: white blood cell count less than or equal to 18,000 per microliter
(assert
  (! (<= patient_white_blood_cell_count_value_recorded_now_withunit_per_microliter 18000.0)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "white blood cell count less than or equal to 18,000 per microliter"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const abdominal_pain_duration_prior_to_receiving_antibiotics_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient experienced abdominal pain prior to receiving antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient experienced abdominal pain prior to receiving antibiotics.","meaning":"Numeric value representing the duration in hours of abdominal pain prior to receiving antibiotics."} // "abdominal pain for less than or equal to 48 hours prior to receiving antibiotics"
(declare-const patient_has_finding_of_abdominal_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had abdominal pain at any time in the past (history).","when_to_set_to_false":"Set to false if the patient has never had abdominal pain in the past (history).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had abdominal pain in the past (history).","meaning":"Boolean indicating whether the patient has had abdominal pain in the past (history)."} // "abdominal pain"
(declare-const patient_has_finding_of_abdominal_pain_inthehistory@@duration_less_than_or_equal_to_48_hours_prior_to_receiving_antibiotics Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had abdominal pain in the past (history) and the duration of abdominal pain was less than or equal to 48 hours prior to receiving antibiotics.","when_to_set_to_false":"Set to false if the patient has had abdominal pain in the past (history) but the duration was greater than 48 hours prior to receiving antibiotics, or if abdominal pain did not occur prior to antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of abdominal pain was less than or equal to 48 hours prior to receiving antibiotics.","meaning":"Boolean indicating whether the patient's abdominal pain in the past (history) lasted less than or equal to 48 hours prior to receiving antibiotics."} // "abdominal pain for less than or equal to 48 hours prior to receiving antibiotics"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_abdominal_pain_inthehistory@@duration_less_than_or_equal_to_48_hours_prior_to_receiving_antibiotics
         patient_has_finding_of_abdominal_pain_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "abdominal pain for less than or equal to 48 hours prior to receiving antibiotics" implies "abdominal pain"

;; Definition of the qualifier variable in terms of numeric duration
(assert
  (! (= patient_has_finding_of_abdominal_pain_inthehistory@@duration_less_than_or_equal_to_48_hours_prior_to_receiving_antibiotics
        (and patient_has_finding_of_abdominal_pain_inthehistory
             (<= abdominal_pain_duration_prior_to_receiving_antibiotics_in_hours 48.0)))
     :named REQ4_AUXILIARY1)) ;; "abdominal pain for less than or equal to 48 hours prior to receiving antibiotics" defined as abdominal pain in history AND duration <= 48 hours

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_abdominal_pain_inthehistory@@duration_less_than_or_equal_to_48_hours_prior_to_receiving_antibiotics
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have abdominal pain for less than or equal to 48 hours prior to receiving antibiotics."
