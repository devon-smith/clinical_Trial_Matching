;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_admission_to_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to an intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently not admitted to an intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to an intensive care unit.","meaning":"Boolean indicating whether the patient is currently admitted to an intensive care unit."} ;; "admitted to an intensive care unit"
(declare-const patient_is_undergoing_admission_to_high_intensity_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to a high intensity unit.","when_to_set_to_false":"Set to false if the patient is currently not admitted to a high intensity unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to a high intensity unit.","meaning":"Boolean indicating whether the patient is currently admitted to a high intensity unit."} ;; "admitted to a high intensity unit"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_is_undergoing_admission_to_intensive_care_unit_now
            patient_is_undergoing_admission_to_high_intensity_unit_now))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is admitted to an intensive care unit) OR (the patient is admitted to a high intensity unit)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_invasive_ventilation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing invasive ventilation.","when_to_set_to_false":"Set to false if the patient is currently not undergoing invasive ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing invasive ventilation.","meaning":"Boolean indicating whether the patient is currently undergoing invasive ventilation."} ;; "requires invasive ventilation"
(declare-const patient_is_undergoing_noninvasive_ventilation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing noninvasive ventilation.","when_to_set_to_false":"Set to false if the patient is currently not undergoing noninvasive ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing noninvasive ventilation.","meaning":"Boolean indicating whether the patient is currently undergoing noninvasive ventilation."} ;; "requires non-invasive ventilation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_is_undergoing_invasive_ventilation_now
            patient_is_undergoing_noninvasive_ventilation_now))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient requires invasive ventilation) OR (the patient requires non-invasive ventilation)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "life expectancy < 3 months"
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the measured or estimated value if the patient's current life expectancy in months is available.","when_to_set_to_null":"Set to null if no such measurement or estimation is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current life expectancy in months."} ;; "life expectancy < 3 months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (< patient_longevity_value_recorded_now_withunit_months 3))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life expectancy < 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_patient_in_hospital_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been hospitalized at any time within the previous 3 months.","when_to_set_to_false":"Set to false if the patient has not been hospitalized at any time within the previous 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been hospitalized within the previous 3 months.","meaning":"Boolean indicating whether the patient has been hospitalized at any time within the previous 3 months."} ;; "hospitalized within the previous 3 months"
(declare-const patient_has_finding_of_patient_in_hospital_inthepast3months@@hospitalization_duration_at_least_48_consecutive_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hospitalization within the previous 3 months lasted at least 48 consecutive hours.","when_to_set_to_false":"Set to false if the patient's hospitalization within the previous 3 months lasted less than 48 consecutive hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hospitalization within the previous 3 months lasted at least 48 consecutive hours.","meaning":"Boolean indicating whether the patient's hospitalization within the previous 3 months lasted at least 48 consecutive hours."} ;; "hospitalized for ≥ 48 consecutive hours during that hospitalization"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_patient_in_hospital_inthepast3months@@hospitalization_duration_at_least_48_consecutive_hours
       patient_has_finding_of_patient_in_hospital_inthepast3months)
   :named REQ3_AUXILIARY0)) ;; "hospitalized for ≥ 48 consecutive hours during that hospitalization" implies "hospitalized within the previous 3 months"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_patient_in_hospital_inthepast3months@@hospitalization_duration_at_least_48_consecutive_hours)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has been hospitalized within the previous 3 months) AND (the patient was hospitalized for ≥ 48 consecutive hours during that hospitalization)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_patient_immunocompromised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently immunocompromised.","when_to_set_to_false":"Set to false if the patient is currently not immunocompromised.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently immunocompromised.","meaning":"Boolean indicating whether the patient is currently immunocompromised."} ;; "immunocompromised"
(declare-const patient_has_diagnosis_of_leukemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of leukemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of leukemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of leukemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of leukemia."} ;; "leukemia"
(declare-const patient_has_diagnosis_of_malignant_lymphoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant lymphoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant lymphoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant lymphoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant lymphoma."} ;; "lymphoma"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_cd4_count_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the patient's current CD4 count value measured in cells per microliter if available.","when_to_set_to_null":"Set to null if the patient's current CD4 count value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current CD4 count in cells per microliter."} ;; "CD4 count ≤ 200 cells per microliter"
(declare-const patient_has_undergone_splenectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone splenectomy at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone splenectomy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone splenectomy.","meaning":"Boolean indicating whether the patient has undergone splenectomy at any time in the past."} ;; "undergone splenectomy"
(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy."} ;; "chemotherapy"
(declare-const patient_is_undergoing_chemotherapy_now@@cytotoxic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing cytotoxic chemotherapy.","when_to_set_to_false":"Set to false if the patient is currently undergoing non-cytotoxic chemotherapy or not undergoing chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy is cytotoxic.","meaning":"Boolean indicating whether the patient is currently undergoing cytotoxic chemotherapy."} ;; "cytotoxic chemotherapy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: immunocompromised = (leukemia OR lymphoma OR (HIV infection AND CD4 ≤ 200) OR splenectomy OR cytotoxic chemotherapy)
(assert
(! (= patient_has_finding_of_patient_immunocompromised_now
     (or patient_has_diagnosis_of_leukemia_now
         patient_has_diagnosis_of_malignant_lymphoma_now
         (and patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
              (<= patient_cd4_count_value_recorded_now_withunit_cells_per_microliter 200))
         patient_has_undergone_splenectomy_inthehistory
         patient_is_undergoing_chemotherapy_now@@cytotoxic))
:named REQ4_AUXILIARY0)) ;; "immunocompromised, defined as ((the patient has leukemia) OR (the patient has lymphoma) OR (the patient has human immunodeficiency virus infection with CD4 count ≤ 200 cells per microliter) OR (the patient has undergone splenectomy) OR (the patient is on cytotoxic chemotherapy))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_chemotherapy_now@@cytotoxic
       patient_is_undergoing_chemotherapy_now)
:named REQ4_AUXILIARY1)) ;; "cytotoxic chemotherapy" implies "chemotherapy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_patient_immunocompromised_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is immunocompromised, defined as ((the patient has leukemia) OR (the patient has lymphoma) OR (the patient has human immunodeficiency virus infection with CD4 count ≤ 200 cells per microliter) OR (the patient has undergone splenectomy) OR (the patient is on cytotoxic chemotherapy))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_neutropenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has neutropenic disorder (is neutropenic).","when_to_set_to_false":"Set to false if the patient currently does not have neutropenic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neutropenic disorder.","meaning":"Boolean indicating whether the patient currently has neutropenic disorder."} ;; "neutropenic"
(declare-const patient_polymorphonuclear_leukocyte_count_value_recorded_now_withunit_10e9_cells_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's polymorphonuclear leukocyte count (in 10^9 cells per liter) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current polymorphonuclear leukocyte count in 10^9 cells per liter."} ;; "polymorphonuclear leukocyte count ≤ 0.5 × 10^9 cells per liter"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: neutropenic = polymorphonuclear leukocyte count ≤ 0.5 × 10^9 cells per liter
(assert
(! (= patient_has_finding_of_neutropenic_disorder_now
    (<= patient_polymorphonuclear_leukocyte_count_value_recorded_now_withunit_10e9_cells_per_liter 0.5))
:named REQ5_AUXILIARY0)) ;; "neutropenic, defined as a polymorphonuclear leukocyte count ≤ 0.5 × 10^9 cells per liter from any cause"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_neutropenic_disorder_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is neutropenic, defined as a polymorphonuclear leukocyte count ≤ 0.5 × 10^9 cells per liter from any cause)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_immunosuppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any immunosuppressant.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any immunosuppressant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any immunosuppressant.","meaning":"Boolean indicating whether the patient is currently exposed to any immunosuppressant."} ;; "receiving immunosuppressants"
(declare-const patient_is_exposed_to_immunosuppressant_now@@used_for_systemic_illness Bool) ;; {"when_to_set_to_true":"Set to true if the immunosuppressant the patient is exposed to is used for systemic illness.","when_to_set_to_false":"Set to false if the immunosuppressant the patient is exposed to is not used for systemic illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunosuppressant is used for systemic illness.","meaning":"Boolean indicating whether the immunosuppressant the patient is exposed to is used for systemic illness."} ;; "any other immunosuppressant used for systemic illness"
(declare-const patient_is_exposed_to_immunosuppressant_now@@used_to_prevent_transplant_rejection Bool) ;; {"when_to_set_to_true":"Set to true if the immunosuppressant the patient is exposed to is used to prevent transplant rejection.","when_to_set_to_false":"Set to false if the immunosuppressant the patient is exposed to is not used to prevent transplant rejection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunosuppressant is used to prevent transplant rejection.","meaning":"Boolean indicating whether the immunosuppressant the patient is exposed to is used to prevent transplant rejection."} ;; "any other immunosuppressant used to prevent transplant rejection"
(declare-const patient_is_receiving_steroid_equivalent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving a steroid equivalent to prednisone.","when_to_set_to_false":"Set to false if the patient is currently not receiving a steroid equivalent to prednisone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving a steroid equivalent to prednisone.","meaning":"Boolean indicating whether the patient is currently receiving a steroid equivalent to prednisone."} ;; "receiving steroid equivalent"
(declare-const patient_is_taking_prednisone_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a prednisone-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a prednisone-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a prednisone-containing product.","meaning":"Boolean indicating whether the patient is currently taking a prednisone-containing product."} ;; "receiving prednisone"
(declare-const patient_is_undergoing_immunosuppressant_drug_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving immunosuppressant drug therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving immunosuppressant drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving immunosuppressant drug therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunosuppressant drug therapy."} ;; "receiving immunosuppressant drug therapy"
(declare-const patient_prednisone_containing_product_value_recorded_inthepast2weeks_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks if the patient has been continuously taking a prednisone-containing product in the 2 weeks preceding hospitalization and the duration is known.","when_to_set_to_null":"Set to null if the patient has not been taking prednisone in the 2 weeks preceding hospitalization or the duration is unknown.","meaning":"Numeric value representing the number of weeks the patient has been continuously taking a prednisone-containing product in the 2 weeks preceding hospitalization."} ;; "prednisone for ≥ 2 weeks preceding hospitalization"
(declare-const patient_prednisone_containing_product_value_recorded_now_withunit_milligrams Real) ;; {"when_to_set_to_value":"Set to the daily dose in milligrams if the patient is currently taking a prednisone-containing product and the dose is known.","when_to_set_to_null":"Set to null if the patient is not currently taking prednisone or the dose is unknown.","meaning":"Numeric value representing the daily dose of prednisone-containing product the patient is currently taking, in milligrams."} ;; "≥ 40 milligrams prednisone daily"
(declare-const patient_steroid_equivalent_value_recorded_inthepast2weeks_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks if the patient has been continuously receiving a steroid equivalent to prednisone in the 2 weeks preceding hospitalization and the duration is known.","when_to_set_to_null":"Set to null if the patient has not been receiving a steroid equivalent to prednisone in the 2 weeks preceding hospitalization or the duration is unknown.","meaning":"Numeric value representing the number of weeks the patient has been continuously receiving a steroid equivalent to prednisone in the 2 weeks preceding hospitalization."} ;; "steroid equivalent for ≥ 2 weeks preceding hospitalization"
(declare-const patient_steroid_equivalent_value_recorded_now_withunit_milligrams Real) ;; {"when_to_set_to_value":"Set to the daily dose in milligrams if the patient is currently receiving a steroid equivalent to prednisone and the dose is known.","when_to_set_to_null":"Set to null if the patient is not currently receiving a steroid equivalent to prednisone or the dose is unknown.","meaning":"Numeric value representing the daily dose of steroid equivalent to prednisone the patient is currently receiving, in milligrams."} ;; "≥ 40 milligrams steroid equivalent daily"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: patient is exposed to immunosuppressant if any of the three subconditions are true
(assert
(! (= patient_is_exposed_to_immunosuppressant_now
(or
  ;; (the patient is receiving ≥ 40 milligrams prednisone daily (or steroid equivalent) for ≥ 2 weeks preceding hospitalization)
  (or
    (and
      patient_is_taking_prednisone_containing_product_now
      (>= patient_prednisone_containing_product_value_recorded_now_withunit_milligrams 40)
      (>= patient_prednisone_containing_product_value_recorded_inthepast2weeks_withunit_weeks 2)
    )
    (and
      patient_is_receiving_steroid_equivalent_now
      (>= patient_steroid_equivalent_value_recorded_now_withunit_milligrams 40)
      (>= patient_steroid_equivalent_value_recorded_inthepast2weeks_withunit_weeks 2)
    )
  )
  ;; (the patient is receiving any other immunosuppressant used for systemic illness)
  patient_is_exposed_to_immunosuppressant_now@@used_for_systemic_illness
  ;; (the patient is receiving any other immunosuppressant used to prevent transplant rejection)
  patient_is_exposed_to_immunosuppressant_now@@used_to_prevent_transplant_rejection
)
)
:named REQ6_AUXILIARY0)) ;; "immunosuppressants, defined as ((the patient is receiving ≥ 40 milligrams prednisone daily (or steroid equivalent) for ≥ 2 weeks preceding hospitalization) OR (the patient is receiving any other immunosuppressant used for systemic illness) OR (the patient is receiving any other immunosuppressant used to prevent transplant rejection))"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_immunosuppressant_now@@used_for_systemic_illness
      patient_is_exposed_to_immunosuppressant_now)
:named REQ6_AUXILIARY1)) ;; "any other immunosuppressant used for systemic illness"

(assert
(! (=> patient_is_exposed_to_immunosuppressant_now@@used_to_prevent_transplant_rejection
      patient_is_exposed_to_immunosuppressant_now)
:named REQ6_AUXILIARY2)) ;; "any other immunosuppressant used to prevent transplant rejection"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_exposed_to_immunosuppressant_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving immunosuppressants, defined as ((the patient is receiving ≥ 40 milligrams prednisone daily (or steroid equivalent) for ≥ 2 weeks preceding hospitalization) OR (the patient is receiving any other immunosuppressant used for systemic illness) OR (the patient is receiving any other immunosuppressant used to prevent transplant rejection))."
