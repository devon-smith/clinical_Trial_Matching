;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const hospitalization_longest_consecutive_duration_in_past_3_months_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours of the longest consecutive hospitalization episode in the preceding three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the longest consecutive hospitalization duration in the preceding three months is.","meaning":"Numeric value representing the longest consecutive duration, in hours, of any hospitalization the patient experienced in the preceding three months."} ;; "hospitalized for greater than or equal to forty-eight consecutive hours in the preceding three months"

(declare-const patient_has_been_hospitalized_in_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been hospitalized at any time in the preceding three months.","when_to_set_to_false":"Set to false if the patient has not been hospitalized at any time in the preceding three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been hospitalized in the preceding three months.","meaning":"Boolean indicating whether the patient has been hospitalized at any time in the preceding three months."} ;; "hospitalized at any time in the preceding three months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and
            patient_has_been_hospitalized_in_past_3_months
            (>= hospitalization_longest_consecutive_duration_in_past_3_months_in_hours 48)
          ))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been hospitalized for greater than or equal to forty-eight consecutive hours in the preceding three months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_immunosuppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any immunosuppressant medication.","when_to_set_to_false":"Set to false if the patient is currently not receiving any immunosuppressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving any immunosuppressant medication.","meaning":"Boolean indicating whether the patient is currently receiving any immunosuppressant medication."} ;; "immunosuppressant medication"
(declare-const patient_is_exposed_to_immunosuppressant_now@@used_for_systemic_illness Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any immunosuppressant medication used for systemic illness.","when_to_set_to_false":"Set to false if the patient is currently receiving immunosuppressant medication but not for systemic illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunosuppressant medication is used for systemic illness.","meaning":"Boolean indicating whether the patient is currently receiving any immunosuppressant medication used for systemic illness."} ;; "any other immunosuppressant medication used for systemic illness"
(declare-const patient_is_exposed_to_immunosuppressant_now@@used_to_prevent_transplant_rejection Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any immunosuppressant medication used to prevent transplant rejection.","when_to_set_to_false":"Set to false if the patient is currently receiving immunosuppressant medication but not for prevention of transplant rejection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunosuppressant medication is used to prevent transplant rejection.","meaning":"Boolean indicating whether the patient is currently receiving any immunosuppressant medication used to prevent transplant rejection."} ;; "any other immunosuppressant medication used to prevent transplant rejection"
(declare-const patient_is_exposed_to_prednisone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving prednisone.","when_to_set_to_false":"Set to false if the patient is currently not receiving prednisone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving prednisone.","meaning":"Boolean indicating whether the patient is currently receiving prednisone."} ;; "prednisone"
(declare-const patient_is_exposed_to_prednisone_now@@dose_mg_per_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving prednisone at a specified daily dose in mg/day.","when_to_set_to_false":"Set to false if the patient is currently receiving prednisone but not at a specified daily dose in mg/day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what daily dose of prednisone the patient is receiving.","meaning":"Boolean indicating whether the patient is currently receiving prednisone at a specified daily dose in mg/day."} ;; "greater than or equal to forty milligrams prednisone daily (or steroid equivalent)"
(declare-const patient_is_exposed_to_prednisone_now@@duration_greater_than_or_equal_2_weeks_preceding_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been receiving prednisone for at least two weeks preceding hospitalization.","when_to_set_to_false":"Set to false if the patient has not been receiving prednisone for at least two weeks preceding hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been receiving prednisone for at least two weeks preceding hospitalization.","meaning":"Boolean indicating whether the patient has been receiving prednisone for at least two weeks preceding hospitalization."} ;; "greater than or equal to two weeks preceding hospitalization"
(declare-const patient_is_exposed_to_steroid_equivalent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving a steroid equivalent medication.","when_to_set_to_false":"Set to false if the patient is currently not receiving a steroid equivalent medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving a steroid equivalent medication.","meaning":"Boolean indicating whether the patient is currently receiving a steroid equivalent medication."} ;; "steroid equivalent"
(declare-const steroid_equivalent_dose_value_now_mg_prednisone_equivalent_per_day Real) ;; {"when_to_set_to_value":"Set to the numeric value of the current daily dose of steroid equivalent medication the patient is receiving, in mg prednisone equivalent per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what daily dose of steroid equivalent medication the patient is receiving.","meaning":"Numeric value indicating the current daily dose of steroid equivalent medication the patient is receiving, in mg prednisone equivalent per day."} ;; "greater than or equal to forty milligrams prednisone daily (or steroid equivalent)"
(declare-const steroid_equivalent_duration_value_preceding_hospitalization_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient has been receiving steroid equivalent medication preceding hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the patient has been receiving steroid equivalent medication preceding hospitalization.","meaning":"Numeric value indicating the number of days the patient has been receiving steroid equivalent medication preceding hospitalization."} ;; "greater than or equal to two weeks preceding hospitalization"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_immunosuppressant_now@@used_for_systemic_illness
      patient_is_exposed_to_immunosuppressant_now)
:named REQ1_AUXILIARY0)) ;; "any other immunosuppressant medication used for systemic illness"

(assert
(! (=> patient_is_exposed_to_immunosuppressant_now@@used_to_prevent_transplant_rejection
      patient_is_exposed_to_immunosuppressant_now)
:named REQ1_AUXILIARY1)) ;; "any other immunosuppressant medication used to prevent transplant rejection"

;; Prednisone qualifiers imply stem variable
(assert
(! (=> patient_is_exposed_to_prednisone_now@@dose_mg_per_day
      patient_is_exposed_to_prednisone_now)
:named REQ1_AUXILIARY2)) ;; "prednisone daily (or steroid equivalent)"

(assert
(! (=> patient_is_exposed_to_prednisone_now@@duration_greater_than_or_equal_2_weeks_preceding_hospitalization
      patient_is_exposed_to_prednisone_now)
:named REQ1_AUXILIARY3)) ;; "prednisone for greater than or equal to two weeks preceding hospitalization"

;; ===================== Constraint Assertions (REQ 1) =====================
;; 1. Prednisone or steroid equivalent: >=40 mg/day for >=2 weeks preceding hospitalization
(assert
(! (not (and
          (or patient_is_exposed_to_prednisone_now
              patient_is_exposed_to_steroid_equivalent_now)
          (or
            (and patient_is_exposed_to_prednisone_now@@dose_mg_per_day
                 (>= steroid_equivalent_dose_value_now_mg_prednisone_equivalent_per_day 40))
            (and patient_is_exposed_to_steroid_equivalent_now
                 (>= steroid_equivalent_dose_value_now_mg_prednisone_equivalent_per_day 40)))
          (or
            patient_is_exposed_to_prednisone_now@@duration_greater_than_or_equal_2_weeks_preceding_hospitalization
            (and patient_is_exposed_to_steroid_equivalent_now
                 (>= steroid_equivalent_duration_value_preceding_hospitalization_in_days 14)))))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "receiving greater than or equal to forty milligrams prednisone daily (or steroid equivalent) for greater than or equal to two weeks preceding hospitalization"

;; 2. Any other immunosuppressant medication used for systemic illness
(assert
(! (not patient_is_exposed_to_immunosuppressant_now@@used_for_systemic_illness)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "any other immunosuppressant medication used for systemic illness"

;; 3. Any other immunosuppressant medication used to prevent transplant rejection
(assert
(! (not patient_is_exposed_to_immunosuppressant_now@@used_to_prevent_transplant_rejection)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "any other immunosuppressant medication used to prevent transplant rejection"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neutropenia.","meaning":"Boolean indicating whether the patient currently has neutropenia."} ;; "neutropenic"

(declare-const patient_polymorphonuclear_leukocyte_count_value_recorded_now_withunit_10e9_cells_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current polymorphonuclear leukocyte count in 10^9 cells per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current polymorphonuclear leukocyte count in 10^9 cells per liter."} ;; "polymorphonuclear cell count less than or equal to 0.5 × 10^9 cells per liter"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: neutropenia is defined as polymorphonuclear cell count ≤ 0.5 × 10^9 cells/L from any cause
(assert
(! (= patient_has_finding_of_neutropenia_now
    (<= patient_polymorphonuclear_leukocyte_count_value_recorded_now_withunit_10e9_cells_per_liter 0.5))
:named REQ2_AUXILIARY0)) ;; "neutropenic, defined as having a polymorphonuclear cell count less than or equal to 0.5 × 10^9 cells per liter from any cause."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_neutropenia_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is neutropenic, defined as having a polymorphonuclear cell count less than or equal to 0.5 × 10^9 cells per liter from any cause."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_patient_immunocompromised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently immunocompromised.","when_to_set_to_false":"Set to false if the patient is currently not immunocompromised.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently immunocompromised.","meaning":"Boolean indicating whether the patient is currently immunocompromised."} ;; "immunocompromised, defined as ((the patient has leukemia) OR (the patient has lymphoma) OR (the patient has human immunodeficiency virus infection with CD4 cell count less than or equal to 200) OR (the patient has undergone splenectomy) OR (the patient is receiving cytotoxic chemotherapy))"
(declare-const patient_has_diagnosis_of_leukemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of leukemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of leukemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of leukemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of leukemia."} ;; "leukemia"
(declare-const patient_has_diagnosis_of_malignant_lymphoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant lymphoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant lymphoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant lymphoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant lymphoma."} ;; "lymphoma"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_cd4_cell_count_value_recorded_now_withunit_cells_per_mm3 Real) ;; {"when_to_set_to_value":"Set to the patient's current CD4 cell count value in cells per mm^3 if available.","when_to_set_to_null":"Set to null if the patient's current CD4 cell count is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current CD4 cell count in cells per mm^3."} ;; "CD4 cell count less than or equal to 200"
(declare-const patient_has_undergone_splenectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone splenectomy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone splenectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone splenectomy.","meaning":"Boolean indicating whether the patient has ever undergone splenectomy."} ;; "undergone splenectomy"
(declare-const patient_is_undergoing_administration_of_antineoplastic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of an antineoplastic agent (chemotherapy).","when_to_set_to_false":"Set to false if the patient is currently not undergoing administration of an antineoplastic agent (chemotherapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing administration of an antineoplastic agent (chemotherapy).","meaning":"Boolean indicating whether the patient is currently undergoing administration of an antineoplastic agent (chemotherapy)."} ;; "chemotherapy"
(declare-const patient_is_undergoing_administration_of_antineoplastic_agent_now@@cytotoxic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of a cytotoxic antineoplastic agent (cytotoxic chemotherapy).","when_to_set_to_false":"Set to false if the patient is currently undergoing administration of an antineoplastic agent that is not cytotoxic, or not undergoing chemotherapy at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy is cytotoxic.","meaning":"Boolean indicating whether the patient is currently undergoing cytotoxic chemotherapy (administration of a cytotoxic antineoplastic agent)."} ;; "cytotoxic chemotherapy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition of immunocompromised as per requirement
(assert
(! (= patient_has_finding_of_patient_immunocompromised_now
(or patient_has_diagnosis_of_leukemia_now
    patient_has_diagnosis_of_malignant_lymphoma_now
    (and patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
         (<= patient_cd4_cell_count_value_recorded_now_withunit_cells_per_mm3 200))
    patient_has_undergone_splenectomy_inthehistory
    patient_is_undergoing_administration_of_antineoplastic_agent_now@@cytotoxic))
:named REQ3_AUXILIARY0)) ;; "immunocompromised, defined as ((the patient has leukemia) OR (the patient has lymphoma) OR (the patient has human immunodeficiency virus infection with CD4 cell count less than or equal to 200) OR (the patient has undergone splenectomy) OR (the patient is receiving cytotoxic chemotherapy))"

;; Qualifier variable implies corresponding stem variable for cytotoxic chemotherapy
(assert
(! (=> patient_is_undergoing_administration_of_antineoplastic_agent_now@@cytotoxic
      patient_is_undergoing_administration_of_antineoplastic_agent_now)
:named REQ3_AUXILIARY1)) ;; "cytotoxic chemotherapy is a type of antineoplastic agent administration"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_patient_immunocompromised_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is immunocompromised, defined as ((the patient has leukemia) OR (the patient has lymphoma) OR (the patient has human immunodeficiency virus infection with CD4 cell count less than or equal to 200) OR (the patient has undergone splenectomy) OR (the patient is receiving cytotoxic chemotherapy)))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_admitted_to_high_acuity_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to a high acuity unit, such as an intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently not admitted to a high acuity unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to a high acuity unit.","meaning":"Boolean indicating whether the patient is currently admitted to a high acuity unit (e.g., intensive care unit)."}

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_admitted_to_high_acuity_unit_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is admitted to a high acuity unit with non-exhaustive examples (intensive care unit)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_requires_mechanical_ventilation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires mechanical ventilation, regardless of the type (invasive or non-invasive).","when_to_set_to_false":"Set to false if the patient currently does not require mechanical ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires mechanical ventilation.","meaning":"Boolean indicating whether the patient currently requires mechanical ventilation."} ;; "requires mechanical ventilation"

(declare-const patient_requires_mechanical_ventilation_now@@non_invasive Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires non-invasive mechanical ventilation.","when_to_set_to_false":"Set to false if the patient currently does not require non-invasive mechanical ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires non-invasive mechanical ventilation.","meaning":"Boolean indicating whether the patient currently requires non-invasive mechanical ventilation."} ;; "non-invasive mechanical ventilation"

(declare-const patient_requires_mechanical_ventilation_now@@invasive Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires invasive mechanical ventilation.","when_to_set_to_false":"Set to false if the patient currently does not require invasive mechanical ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires invasive mechanical ventilation.","meaning":"Boolean indicating whether the patient currently requires invasive mechanical ventilation."} ;; "invasive mechanical ventilation"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_requires_mechanical_ventilation_now@@non_invasive
           patient_requires_mechanical_ventilation_now@@invasive)
       patient_requires_mechanical_ventilation_now)
   :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (non-invasive mechanical ventilation, invasive mechanical ventilation)."

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_requires_mechanical_ventilation_now@@non_invasive
       patient_requires_mechanical_ventilation_now)
   :named REQ5_AUXILIARY1)) ;; "non-invasive mechanical ventilation"

(assert
(! (=> patient_requires_mechanical_ventilation_now@@invasive
       patient_requires_mechanical_ventilation_now)
   :named REQ5_AUXILIARY2)) ;; "invasive mechanical ventilation"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_requires_mechanical_ventilation_now)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires mechanical ventilation with non-exhaustive examples (non-invasive mechanical ventilation, invasive mechanical ventilation)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const life_expectancy_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the value representing the patient's life expectancy in months, as recorded at the current time.","when_to_set_to_null":"Set to null if the patient's life expectancy in months is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's life expectancy in months, recorded at the current time."} ;; "life expectancy less than or equal to three months"

(declare-const patient_has_finding_of_palliative_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented palliative status.","when_to_set_to_false":"Set to false if the patient currently does not have a documented palliative status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented palliative status.","meaning":"Boolean indicating whether the patient currently has a documented palliative status."} ;; "(palliative)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not (and (<= life_expectancy_value_recorded_now_in_months 3)
               patient_has_finding_of_palliative_status_now))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life expectancy less than or equal to three months (palliative)."
