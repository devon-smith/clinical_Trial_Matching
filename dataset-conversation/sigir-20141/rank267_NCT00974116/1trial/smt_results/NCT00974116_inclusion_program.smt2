;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_childhood_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of childhood obesity.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of childhood obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding or diagnosis of childhood obesity.","meaning":"Boolean indicating whether the patient currently has a finding of childhood obesity."}  ;; "childhood obesity"
(declare-const patient_has_start_date_for_mend_childhood_obesity_treatment_program_recorded Bool) ;; {"when_to_set_to_true":"Set to true if a start date for the MEND childhood obesity treatment program has been recorded for the patient.","when_to_set_to_false":"Set to false if a start date for the MEND childhood obesity treatment program has not been recorded for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a start date for the MEND childhood obesity treatment program has been recorded for the patient.","meaning":"Boolean indicating whether a start date for the MEND childhood obesity treatment program has been recorded for the patient."}  ;; "NOT have been given a start date for the MEND childhood obesity treatment program"
(declare-const patient_is_enrolled_in_mend_childhood_obesity_treatment_program_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in the MEND childhood obesity treatment program.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in the MEND childhood obesity treatment program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in the MEND childhood obesity treatment program.","meaning":"Boolean indicating whether the patient is currently enrolled in the MEND childhood obesity treatment program."}  ;; "be enrolled in the MEND childhood obesity treatment program"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be enrolled in the MEND childhood obesity treatment program.
(assert
  (! patient_is_enrolled_in_mend_childhood_obesity_treatment_program_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be enrolled in the MEND childhood obesity treatment program."

;; Component 1: The patient must NOT have been given a start date for the MEND childhood obesity treatment program.
(assert
  (! (not patient_has_start_date_for_mend_childhood_obesity_treatment_program_recorded)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must NOT have been given a start date for the MEND childhood obesity treatment program."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "be aged ≥ 7 years old AND be aged ≤ 13 years old"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 7 years old.
(assert
  (! (>= patient_age_value_recorded_now_in_years 7)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 7 years old."

;; Component 1: To be included, the patient must be aged ≤ 13 years old.
(assert
  (! (<= patient_age_value_recorded_now_in_years 13)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 13 years old."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m^2 if a current measurement is available.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."}  ;; "body mass index"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2@@measured_using_boys_or_girls_bmi_chart_uk_1997_reference Bool) ;; {"when_to_set_to_true":"Set to true if the BMI value is interpreted using the boys or girls BMI chart from the UK 1997 reference.","when_to_set_to_false":"Set to false if the BMI value is not interpreted using the boys or girls BMI chart from the UK 1997 reference.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the BMI value is interpreted using the boys or girls BMI chart from the UK 1997 reference.","meaning":"Boolean indicating whether the BMI value is interpreted using the boys or girls BMI chart from the UK 1997 reference."}  ;; "body mass index which falls above the 91st centile on the boys body mass index chart or the girls body mass index chart UK cross-sectional reference data:1997/1"
(declare-const patient_has_finding_of_overweight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of overweight.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of overweight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding or diagnosis of overweight.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of overweight."}  ;; "overweight"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex matches the specified sex (male or female) and is known.","when_to_set_to_false":"Set to false if the patient's current sex does not match the specified sex and is known.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates the patient's current sex, which is required to select the appropriate BMI centile chart (boys or girls)."}  ;; "boys body mass index chart or the girls body mass index chart"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex matches the specified sex (male or female) and is known.","when_to_set_to_false":"Set to false if the patient's current sex does not match the specified sex and is known.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates the patient's current sex, which is required to select the appropriate BMI centile chart (boys or girls)."}  ;; "boys body mass index chart or the girls body mass index chart"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies BMI value is interpreted using the UK 1997 reference chart
(assert
  (! (=> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2@@measured_using_boys_or_girls_bmi_chart_uk_1997_reference
         (or patient_sex_is_male_now patient_sex_is_female_now))
     :named REQ2_AUXILIARY0)) ;; "body mass index which falls above the 91st centile on the boys body mass index chart or the girls body mass index chart UK cross-sectional reference data:1997/1"

;; Definition: Overweight or obesity as defined by BMI above 91st centile on UK 1997 reference chart
;; Note: The actual centile calculation is not directly encoded; instead, we use the qualifier variable to indicate the BMI is interpreted using the correct chart.
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding or diagnosis of obesity.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of obesity."}  ;; "obesity as defined by a body mass index which falls above the 91st centile on the boys body mass index chart or the girls body mass index chart UK cross-sectional reference data:1997/1"

(assert
  (! (= patient_has_finding_of_obesity_now
        (and patient_body_mass_index_value_recorded_now_withunit_kg_per_m2@@measured_using_boys_or_girls_bmi_chart_uk_1997_reference
             (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 91.0)))
     :named REQ2_AUXILIARY1)) ;; "obesity as defined by a body mass index which falls above the 91st centile on the boys body mass index chart or the girls body mass index chart UK cross-sectional reference data:1997/1"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have overweight or have obesity as defined above
(assert
  (! (or patient_has_finding_of_overweight_now
         patient_has_finding_of_obesity_now
         patient_has_finding_of_childhood_obesity_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have overweight or have obesity as defined by a body mass index which falls above the 91st centile on the boys body mass index chart or the girls body mass index chart UK cross-sectional reference data:1997/1)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_clinically_well_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently clinically well.","when_to_set_to_false":"Set to false if the patient is currently not clinically well.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently clinically well.","meaning":"Boolean indicating whether the patient is currently clinically well."}  ;; "be clinically well"
(declare-const patient_has_diagnosis_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic disease."}  ;; "chronic illness"
(declare-const patient_has_diagnosis_of_chronic_disease_now@@is_known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of chronic disease is known.","when_to_set_to_false":"Set to false if the patient's diagnosis of chronic disease is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of chronic disease is known.","meaning":"Boolean indicating whether the patient's diagnosis of chronic disease is known."}  ;; "known chronic illness"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_chronic_disease_now@@is_known
         patient_has_diagnosis_of_chronic_disease_now)
     :named REQ3_AUXILIARY0)) ;; "known chronic illness" implies "chronic illness"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Patient must be clinically well
(assert
  (! patient_is_clinically_well_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be clinically well"

;; Component 1: Patient must NOT have any known chronic illness
(assert
  (! (not patient_has_diagnosis_of_chronic_disease_now@@is_known)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT have any known chronic illness"
