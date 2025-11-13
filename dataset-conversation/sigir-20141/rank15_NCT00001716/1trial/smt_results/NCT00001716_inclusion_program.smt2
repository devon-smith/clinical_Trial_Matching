;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be (male OR female).
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (male OR female)."

;; Component 1: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 2: To be included, the patient must be aged ≤ 65 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_sickle_cell_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sickle cell disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sickle cell disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sickle cell disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sickle cell disease."} ;; "diagnosis of sickle cell disease"
(declare-const patient_has_diagnosis_of_sickle_cell_disease_now@@confirmed_by_electrophoretic_documentation_of_ss_homozygosity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of sickle cell disease is confirmed by electrophoretic documentation of SS homozygosity.","when_to_set_to_false":"Set to false if the patient's current diagnosis of sickle cell disease is not confirmed by electrophoretic documentation of SS homozygosity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of sickle cell disease is confirmed by electrophoretic documentation of SS homozygosity.","meaning":"Boolean indicating whether the patient's current diagnosis of sickle cell disease is confirmed by electrophoretic documentation of SS homozygosity."} ;; "electrophoretic documentation of SS homozygosity"
(declare-const patient_is_identified_as_normal_volunteer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently identified as a normal volunteer.","when_to_set_to_false":"Set to false if the patient is currently not identified as a normal volunteer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently identified as a normal volunteer.","meaning":"Boolean indicating whether the patient is currently identified as a normal volunteer."} ;; "identification as a normal volunteer"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_sickle_cell_disease_now@@confirmed_by_electrophoretic_documentation_of_ss_homozygosity
         patient_has_diagnosis_of_sickle_cell_disease_now)
     :named REQ1_AUXILIARY0)) ;; "diagnosis of sickle cell disease (with electrophoretic documentation of SS homozygosity)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (a diagnosis of sickle cell disease (with electrophoretic documentation of SS homozygosity) OR identification as a normal volunteer).
(assert
  (! (or patient_has_diagnosis_of_sickle_cell_disease_now@@confirmed_by_electrophoretic_documentation_of_ss_homozygosity
         patient_is_identified_as_normal_volunteer_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis of sickle cell disease (with electrophoretic documentation of SS homozygosity) OR identification as a normal volunteer"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured hematocrit percentage value if a numeric measurement of hematocrit (packed cell volume) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current hematocrit (packed cell volume) value."} ;; "hematocrit > 18 %"
(declare-const patient_absolute_reticulocyte_count_value_recorded_now_withunit_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured absolute reticulocyte count value per milliliter if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current absolute reticulocyte count per milliliter."} ;; "absolute reticulocyte count > 100,000 per milliliter"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Hematocrit > 18 %
(assert
  (! (> patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent 18.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "hematocrit > 18 %"

;; Component 1: Absolute reticulocyte count > 100,000 per milliliter
(assert
  (! (> patient_absolute_reticulocyte_count_value_recorded_now_withunit_per_milliliter 100000.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "absolute reticulocyte count > 100,000 per milliliter"

;; ===================== Declarations for the criterion (REQ 3) =====================
;; patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent
;; {"when_to_set_to_value":"Set to the measured hematocrit percentage value if a numeric measurement of hematocrit (packed cell volume) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current hematocrit (packed cell volume) value."} ;; "hematocrit ≥ 18 % AND hematocrit ≤ 21 %"
;; patient_absolute_reticulocyte_count_value_recorded_now_withunit_per_milliliter
;; {"when_to_set_to_value":"Set to the measured absolute reticulocyte count value per milliliter if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current absolute reticulocyte count per milliliter."} ;; "absolute reticulocyte count > 100,000 per milliliter"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have hematocrit ≥ 18 %.
(assert
  (! (>= patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent 18.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "hematocrit ≥ 18 %"

;; Component 1: To be included, the patient must have hematocrit ≤ 21 %.
(assert
  (! (<= patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent 21.0)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "hematocrit ≤ 21 %"

;; Component 2: To be included, the patient must have absolute reticulocyte count > 100,000 per milliliter.
(assert
  (! (> patient_absolute_reticulocyte_count_value_recorded_now_withunit_per_milliliter 100000.0)
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "absolute reticulocyte count > 100,000 per milliliter"
