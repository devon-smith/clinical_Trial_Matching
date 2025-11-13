;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD)."} // "chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@identified_by_software_using_atc_and_icpc_codes Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of chronic obstructive pulmonary disease (COPD) is established by a software program using both ATC prescription codes and ICPC diagnosis codes.","when_to_set_to_false":"Set to false if the diagnosis is not established by a software program using both ATC and ICPC codes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is established by a software program using both ATC and ICPC codes.","meaning":"Boolean indicating whether the COPD diagnosis is established by a software program using both ATC prescription codes and ICPC diagnosis codes."} // "identified by a software program using Anatomical Therapeutical Chemical prescription codes AND International Classification of Primary Care diagnosis codes"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@identified_by_software_using_atc_and_icpc_codes
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ0_AUXILIARY0)) ;; If the diagnosis is identified by software using ATC and ICPC codes, then the patient has a diagnosis of COPD.

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@identified_by_software_using_atc_and_icpc_codes
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; To be included, the patient must have been selected as a potential patient with chronic obstructive pulmonary disease by a software program using (Anatomical Therapeutical Chemical prescription codes AND International Classification of Primary Care diagnosis codes).

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "older than 35 years"
(declare-const patient_has_diagnosis_of_international_classification_of_primary_care_code_r95_96_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis recorded as International Classification of Primary Care code R95 or R96.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis recorded as International Classification of Primary Care code R95 or R96.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis recorded as International Classification of Primary Care code R95 or R96.","meaning":"Boolean indicating whether the patient currently has a diagnosis recorded as International Classification of Primary Care code R95 or R96."} // "International Classification of Primary Care code R95/96"
(declare-const patient_has_taken_bronchodilator_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken bronchodilator medication at any time in their history.","when_to_set_to_false":"Set to false if the patient has never taken bronchodilator medication at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken bronchodilator medication.","meaning":"Boolean indicating whether the patient has ever taken bronchodilator medication at any time in their history."} // "bronchodilator medication"
(declare-const patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03a Bool) ;; {"when_to_set_to_true":"Set to true if the bronchodilator medication taken by the patient is identified by ATC code R03a.","when_to_set_to_false":"Set to false if the bronchodilator medication taken by the patient is not identified by ATC code R03a.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bronchodilator medication is identified by ATC code R03a.","meaning":"Boolean indicating whether the bronchodilator medication taken is identified by ATC code R03a."} // "bronchodilator medication (ATC code R03a)"
(declare-const patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03b Bool) ;; {"when_to_set_to_true":"Set to true if the bronchodilator medication taken by the patient is identified by ATC code R03b.","when_to_set_to_false":"Set to false if the bronchodilator medication taken by the patient is not identified by ATC code R03b.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bronchodilator medication is identified by ATC code R03b.","meaning":"Boolean indicating whether the bronchodilator medication taken is identified by ATC code R03b."} // "bronchodilator medication (ATC code R03b)"
(declare-const patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03c Bool) ;; {"when_to_set_to_true":"Set to true if the bronchodilator medication taken by the patient is identified by ATC code R03c.","when_to_set_to_false":"Set to false if the bronchodilator medication taken by the patient is not identified by ATC code R03c.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bronchodilator medication is identified by ATC code R03c.","meaning":"Boolean indicating whether the bronchodilator medication taken is identified by ATC code R03c."} // "bronchodilator medication (ATC code R03c)"
(declare-const patient_has_taken_bronchodilator_inthehistory@@prescribed_at_least_three_times Bool) ;; {"when_to_set_to_true":"Set to true if the bronchodilator medication has been prescribed at least three times.","when_to_set_to_false":"Set to false if the bronchodilator medication has been prescribed fewer than three times.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times the bronchodilator medication has been prescribed.","meaning":"Boolean indicating whether the bronchodilator medication has been prescribed at least three times."} // "prescription of bronchodilator medication ... at least three times"
(declare-const patient_has_taken_inhaled_anti_inflammatory_medication_in_the_past_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken inhaled anti-inflammatory medication in the past year.","when_to_set_to_false":"Set to false if the patient has not taken inhaled anti-inflammatory medication in the past year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken inhaled anti-inflammatory medication in the past year.","meaning":"Boolean indicating whether the patient has taken inhaled anti-inflammatory medication in the past year."} // "inhaled anti-inflammatory medication in the past year"
(declare-const patient_has_taken_inhaled_anti_inflammatory_medication_in_the_past_year@@identified_by_anatomical_therapeutical_chemical_code_r03 Bool) ;; {"when_to_set_to_true":"Set to true if the inhaled anti-inflammatory medication taken by the patient in the past year is identified by ATC code R03.","when_to_set_to_false":"Set to false if the inhaled anti-inflammatory medication taken by the patient in the past year is not identified by ATC code R03.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inhaled anti-inflammatory medication taken in the past year is identified by ATC code R03.","meaning":"Boolean indicating whether the inhaled anti-inflammatory medication taken in the past year is identified by ATC code R03."} // "inhaled anti-inflammatory medication (ATC code R03) in the past year"
(declare-const patient_has_taken_inhaled_anti_inflammatory_medication_in_the_past_year@@prescribed_at_least_two_times Bool) ;; {"when_to_set_to_true":"Set to true if the inhaled anti-inflammatory medication has been prescribed at least two times in the past year.","when_to_set_to_false":"Set to false if the inhaled anti-inflammatory medication has been prescribed fewer than two times in the past year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times the inhaled anti-inflammatory medication has been prescribed in the past year.","meaning":"Boolean indicating whether the inhaled anti-inflammatory medication has been prescribed at least two times in the past year."} // "prescription of inhaled anti-inflammatory medication ... at least two times in the past year"
(declare-const patient_has_taken_inhaled_anti_inflammatory_medication_in_the_past_year_value_recorded_in_times Real) ;; {"when_to_set_to_value":"Set to the number of times the patient has taken inhaled anti-inflammatory medication in the past year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times the patient has taken inhaled anti-inflammatory medication in the past year.","meaning":"Numeric value indicating the number of times the patient has taken inhaled anti-inflammatory medication in the past year."} // "number of times inhaled anti-inflammatory medication taken in the past year"
(declare-const patient_has_taken_inhaled_anti_inflammatory_medication_in_the_past_year_value_recorded_in_times@@identified_by_anatomical_therapeutical_chemical_code_r03 Real) ;; {"when_to_set_to_value":"Set to the number of times the inhaled anti-inflammatory medication identified by ATC code R03 has been taken in the past year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times the inhaled anti-inflammatory medication identified by ATC code R03 has been taken in the past year.","meaning":"Numeric value indicating the number of times the inhaled anti-inflammatory medication identified by ATC code R03 has been taken in the past year."} // "number of times inhaled anti-inflammatory medication (ATC code R03) taken in the past year"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Bronchodilator medication (ATC code R03a) prescribed at least three times
(assert
  (! (= (and patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03a
             patient_has_taken_bronchodilator_inthehistory@@prescribed_at_least_three_times)
        (and patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03a
             patient_has_taken_bronchodilator_inthehistory@@prescribed_at_least_three_times))
     :named REQ1_AUXILIARY0)) ;; "prescription of bronchodilator medication (ATC code R03a) at least three times"

;; Bronchodilator medication (ATC code R03b) prescribed at least three times
(assert
  (! (= (and patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03b
             patient_has_taken_bronchodilator_inthehistory@@prescribed_at_least_three_times)
        (and patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03b
             patient_has_taken_bronchodilator_inthehistory@@prescribed_at_least_three_times))
     :named REQ1_AUXILIARY1)) ;; "prescription of bronchodilator medication (ATC code R03b) at least three times"

;; Bronchodilator medication (ATC code R03c) prescribed at least three times
(assert
  (! (= (and patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03c
             patient_has_taken_bronchodilator_inthehistory@@prescribed_at_least_three_times)
        (and patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03c
             patient_has_taken_bronchodilator_inthehistory@@prescribed_at_least_three_times))
     :named REQ1_AUXILIARY2)) ;; "prescription of bronchodilator medication (ATC code R03c) at least three times"

;; Inhaled anti-inflammatory medication (ATC code R03) prescribed at least two times in the past year
(assert
  (! (= (and patient_has_taken_inhaled_anti_inflammatory_medication_in_the_past_year@@identified_by_anatomical_therapeutical_chemical_code_r03
             patient_has_taken_inhaled_anti_inflammatory_medication_in_the_past_year@@prescribed_at_least_two_times)
        (and patient_has_taken_inhaled_anti_inflammatory_medication_in_the_past_year@@identified_by_anatomical_therapeutical_chemical_code_r03
             patient_has_taken_inhaled_anti_inflammatory_medication_in_the_past_year@@prescribed_at_least_two_times))
     :named REQ1_AUXILIARY3)) ;; "prescription of inhaled anti-inflammatory medication (ATC code R03) at least two times in the past year"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Age must be older than 35 years
(assert
  (! (> patient_age_value_recorded_now_in_years 35.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "older than 35 years"

;; Component 1: At least one of the following must be true:
;; - diagnosis of chronic obstructive pulmonary disease
;; - diagnosis of ICPC code R95/96
;; - prescription of bronchodilator medication (ATC code R03a) at least three times
;; - prescription of bronchodilator medication (ATC code R03b) at least three times
;; - prescription of bronchodilator medication (ATC code R03c) at least three times
;; - prescription of inhaled anti-inflammatory medication (ATC code R03) at least two times in the past year
(assert
  (! (or patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
         patient_has_diagnosis_of_international_classification_of_primary_care_code_r95_96_now
         (and patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03a
              patient_has_taken_bronchodilator_inthehistory@@prescribed_at_least_three_times)
         (and patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03b
              patient_has_taken_bronchodilator_inthehistory@@prescribed_at_least_three_times)
         (and patient_has_taken_bronchodilator_inthehistory@@identified_by_anatomical_therapeutical_chemical_code_r03c
              patient_has_taken_bronchodilator_inthehistory@@prescribed_at_least_three_times)
         (and patient_has_taken_inhaled_anti_inflammatory_medication_in_the_past_year@@identified_by_anatomical_therapeutical_chemical_code_r03
              patient_has_taken_inhaled_anti_inflammatory_medication_in_the_past_year@@prescribed_at_least_two_times))
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis or prescription criteria as specified"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@confirmed_by_general_practitioner Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of chronic obstructive pulmonary disease (COPD) is confirmed by a general practitioner.","when_to_set_to_false":"Set to false if the patient's current diagnosis of COPD is not confirmed by a general practitioner.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of COPD is confirmed by a general practitioner.","meaning":"Boolean indicating whether the patient's current diagnosis of COPD is confirmed by a general practitioner."} // "diagnosis of chronic obstructive pulmonary disease confirmed by a general practitioner"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@confirmed_by_general_practitioner
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ2_AUXILIARY0)) ;; "diagnosis of chronic obstructive pulmonary disease confirmed by a general practitioner" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@confirmed_by_general_practitioner
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis of chronic obstructive pulmonary disease confirmed by a general practitioner" (must be confirmed by GP)

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker (actively smokes tobacco products at the present time).","when_to_set_to_false":"Set to false if the patient is not currently a smoker (does not actively smoke tobacco products at the present time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "current smoker"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a current smoker."

;; ===================== Declarations for the criterion (REQ 4) =====================
;; No new variable declarations needed; all required variables are already declared.

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@confirmed_by_general_practitioner
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ4_AUXILIARY0)) ;; "diagnosis of chronic obstructive pulmonary disease confirmed by a general practitioner" implies "chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must be suffering from chronic obstructive pulmonary disease according to the general practitioner's diagnosis.
(assert
  (! (and patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
          patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@confirmed_by_general_practitioner)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be suffering from chronic obstructive pulmonary disease according to the general practitioner's diagnosis."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_in_command_of_dutch_language_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in command of the Dutch language.","when_to_set_to_false":"Set to false if the patient is currently not in command of the Dutch language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in command of the Dutch language.","meaning":"Boolean indicating whether the patient is currently in command of the Dutch language."} // "the patient must be in command of the Dutch language"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_in_command_of_dutch_language_now
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be in command of the Dutch language"
