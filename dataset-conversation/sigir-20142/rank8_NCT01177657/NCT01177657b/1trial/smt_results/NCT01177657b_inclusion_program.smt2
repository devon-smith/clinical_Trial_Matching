;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_admitted_to_clinic_or_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to a clinic or hospital.","when_to_set_to_false":"Set to false if the patient is not currently admitted to a clinic or hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to a clinic or hospital.","meaning":"Boolean indicating whether the patient is currently admitted to a clinic or hospital."} ;; "the patient must have been admitted ... at the same clinic or hospital as the case"
(declare-const patient_admitted_to_clinic_or_hospital_now@@same_clinic_or_hospital_as_case Bool) ;; {"when_to_set_to_true":"Set to true if the clinic or hospital to which the patient is admitted is the same as the case's clinic or hospital.","when_to_set_to_false":"Set to false if the clinic or hospital to which the patient is admitted is not the same as the case's clinic or hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinic or hospital to which the patient is admitted is the same as the case's clinic or hospital.","meaning":"Boolean indicating whether the clinic or hospital to which the patient is admitted is the same as the case's clinic or hospital."} ;; "at the same clinic or hospital as the case"
(declare-const patient_has_finding_of_gastroenteritis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of gastroenteritis in their history (including at the time of admission).","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of gastroenteritis in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of gastroenteritis.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of gastroenteritis in their history."} ;; "causes other than gastroenteritis"
(declare-const patient_has_finding_of_gastroenteritis_inthehistory@@not_the_cause_for_admission Bool) ;; {"when_to_set_to_true":"Set to true if gastroenteritis was not the cause for the patient's admission.","when_to_set_to_false":"Set to false if gastroenteritis was the cause for the patient's admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether gastroenteritis was the cause for the patient's admission.","meaning":"Boolean indicating whether gastroenteritis was not the cause for the patient's admission."} ;; "causes other than gastroenteritis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for same clinic/hospital implies admission
(assert
  (! (=> patient_admitted_to_clinic_or_hospital_now@@same_clinic_or_hospital_as_case
         patient_admitted_to_clinic_or_hospital_now)
     :named REQ0_AUXILIARY0)) ;; "at the same clinic or hospital as the case"

;; Qualifier variable for gastroenteritis not being the cause for admission implies history of gastroenteritis
(assert
  (! (=> patient_has_finding_of_gastroenteritis_inthehistory@@not_the_cause_for_admission
         patient_has_finding_of_gastroenteritis_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "gastroenteritis ... not the cause for admission"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have been admitted at the same clinic or hospital as the case, and the cause for admission must not be gastroenteritis
(assert
  (! (and patient_admitted_to_clinic_or_hospital_now@@same_clinic_or_hospital_as_case
          patient_has_finding_of_gastroenteritis_inthehistory@@not_the_cause_for_admission)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have been admitted for causes other than gastroenteritis at the same clinic or hospital as the case"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_lived_in_same_neighbourhood_as_case_for_at_least_three_consecutive_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has lived in the same neighbourhood as the case for at least three consecutive months.","when_to_set_to_false":"Set to false if the patient has not lived in the same neighbourhood as the case for at least three consecutive months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has lived in the same neighbourhood as the case for at least three consecutive months.","meaning":"Boolean indicating whether the patient has lived in the same neighbourhood as the case for at least three consecutive months."} ;; "the patient must have lived in the same neighbourhood as the case for at least three consecutive months"

(declare-const patient_has_symptoms_of_gastroenteritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of gastroenteritis.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of gastroenteritis.","meaning":"Boolean indicating whether the patient currently has symptoms of gastroenteritis."} ;; "no symptoms of gastroenteritis (including severe gastroenteritis) on the day of interview"

(declare-const patient_has_symptoms_of_gastroenteritis_now@@on_day_of_interview_of_parent_or_guardian Bool) ;; {"when_to_set_to_true":"Set to true if the patient has symptoms of gastroenteritis on the day of interview of the parent or guardian.","when_to_set_to_false":"Set to false if the patient does not have symptoms of gastroenteritis on the day of interview of the parent or guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has symptoms of gastroenteritis on the day of interview of the parent or guardian.","meaning":"Boolean indicating whether the patient has symptoms of gastroenteritis on the day of interview of the parent or guardian."} ;; "no symptoms of gastroenteritis (including severe gastroenteritis) on the day of interview"

(declare-const patient_has_symptoms_of_severe_gastroenteritis_now@@on_day_of_interview_of_parent_or_guardian Bool) ;; {"when_to_set_to_true":"Set to true if the patient has symptoms of severe gastroenteritis on the day of interview of the parent or guardian.","when_to_set_to_false":"Set to false if the patient does not have symptoms of severe gastroenteritis on the day of interview of the parent or guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has symptoms of severe gastroenteritis on the day of interview of the parent or guardian.","meaning":"Boolean indicating whether the patient has symptoms of severe gastroenteritis on the day of interview of the parent or guardian."} ;; "no symptoms of gastroenteritis (including severe gastroenteritis) on the day of interview"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_symptoms_of_gastroenteritis_now@@on_day_of_interview_of_parent_or_guardian
         patient_has_symptoms_of_gastroenteritis_now)
     :named REQ1_AUXILIARY0)) ;; "no symptoms of gastroenteritis (including severe gastroenteritis) on the day of interview"

;; Severe gastroenteritis is a subclass of gastroenteritis (non-exhaustive example, default to implication)
(assert
  (! (=> patient_has_symptoms_of_severe_gastroenteritis_now@@on_day_of_interview_of_parent_or_guardian
         patient_has_symptoms_of_gastroenteritis_now@@on_day_of_interview_of_parent_or_guardian)
     :named REQ1_AUXILIARY1)) ;; "including severe gastroenteritis"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must have lived in the same neighbourhood as the case for at least three consecutive months
(assert
  (! patient_has_lived_in_same_neighbourhood_as_case_for_at_least_three_consecutive_months
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have lived in the same neighbourhood as the case for at least three consecutive months"

;; Component 1: patient must have NO symptoms of gastroenteritis (including severe gastroenteritis) on the day of interview
(assert
  (! (and (not patient_has_symptoms_of_gastroenteritis_now@@on_day_of_interview_of_parent_or_guardian)
          (not patient_has_symptoms_of_severe_gastroenteritis_now@@on_day_of_interview_of_parent_or_guardian))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "no symptoms of gastroenteritis (including severe gastroenteritis) on the day of interview"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const case_date_of_birth_value_recorded_now_withunit_date Real) ;; {"when_to_set_to_value":"Set to the case's date of birth if it is recorded and available now.","when_to_set_to_null":"Set to null if the case's date of birth is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the case's date of birth."} ;; "date of birth of the case"
(declare-const patient_date_of_birth_value_recorded_now_withunit_date Real) ;; {"when_to_set_to_value":"Set to the patient's date of birth if it is recorded and available now.","when_to_set_to_null":"Set to null if the patient's date of birth is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's date of birth."} ;; "date of birth of the patient"
(declare-const number_of_patients_required_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of patients required for inclusion according to the study protocol.","when_to_set_to_null":"Set to null if the required number is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of patients required for inclusion."} ;; "number required"
(declare-const number_of_patients_within_two_weeks_of_case_date_of_birth_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of patients whose date of birth is within ± two weeks of the case's date of birth.","when_to_set_to_null":"Set to null if the number is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of patients within ± two weeks of the case's date of birth."} ;; "within ± two weeks from the date of birth of the case"
(declare-const number_of_patients_within_four_weeks_of_case_date_of_birth_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of patients whose date of birth is within ± four weeks of the case's date of birth.","when_to_set_to_null":"Set to null if the number is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of patients within ± four weeks of the case's date of birth."} ;; "within ± four weeks from the date of birth of the case"
(declare-const number_of_patients_within_six_weeks_of_case_date_of_birth_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of patients whose date of birth is within ± six weeks of the case's date of birth.","when_to_set_to_null":"Set to null if the number is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of patients within ± six weeks of the case's date of birth."} ;; "within ± six weeks from the date of birth of the case"
(declare-const number_of_patients_within_eight_weeks_of_case_date_of_birth_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of patients whose date of birth is within ± eight weeks of the case's date of birth.","when_to_set_to_null":"Set to null if the number is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of patients within ± eight weeks of the case's date of birth."} ;; "within ± eight weeks from the date of birth of the case"
(declare-const patient_is_hospital_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a hospital control.","when_to_set_to_false":"Set to false if the patient is not currently classified as a hospital control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a hospital control.","meaning":"Boolean indicating whether the patient is currently classified as a hospital control."} ;; "if the patient is a hospital control"
(declare-const patient_is_neighbourhood_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a neighbourhood control.","when_to_set_to_false":"Set to false if the patient is not currently classified as a neighbourhood control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a neighbourhood control.","meaning":"Boolean indicating whether the patient is currently classified as a neighbourhood control."} ;; "if the patient is a neighbourhood control"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Define Boolean variables for each matching window
(declare-const patient_date_of_birth_within_two_weeks_of_case Bool) ;; {"when_to_set_to_true":"Set to true if the patient's date of birth is within ± two weeks of the case's date of birth.","when_to_set_to_false":"Set to false if the patient's date of birth is not within ± two weeks of the case's date of birth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's date of birth is within ± two weeks of the case's date of birth.","meaning":"Boolean indicating whether the patient's date of birth is within ± two weeks of the case's date of birth."} ;; "within ± two weeks from the date of birth of the case"
(declare-const patient_date_of_birth_within_four_weeks_of_case Bool) ;; {"when_to_set_to_true":"Set to true if the patient's date of birth is within ± four weeks of the case's date of birth.","when_to_set_to_false":"Set to false if the patient's date of birth is not within ± four weeks of the case's date of birth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's date of birth is within ± four weeks of the case's date of birth.","meaning":"Boolean indicating whether the patient's date of birth is within ± four weeks of the case's date of birth."} ;; "within ± four weeks from the date of birth of the case"
(declare-const patient_date_of_birth_within_six_weeks_of_case Bool) ;; {"when_to_set_to_true":"Set to true if the patient's date of birth is within ± six weeks of the case's date of birth.","when_to_set_to_false":"Set to false if the patient's date of birth is not within ± six weeks of the case's date of birth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's date of birth is within ± six weeks of the case's date of birth.","meaning":"Boolean indicating whether the patient's date of birth is within ± six weeks of the case's date of birth."} ;; "within ± six weeks from the date of birth of the case"
(declare-const patient_date_of_birth_within_eight_weeks_of_case Bool) ;; {"when_to_set_to_true":"Set to true if the patient's date of birth is within ± eight weeks of the case's date of birth.","when_to_set_to_false":"Set to false if the patient's date of birth is not within ± eight weeks of the case's date of birth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's date of birth is within ± eight weeks of the case's date of birth.","meaning":"Boolean indicating whether the patient's date of birth is within ± eight weeks of the case's date of birth."} ;; "within ± eight weeks from the date of birth of the case"

;; Definitions for matching windows
(assert
  (! (= patient_date_of_birth_within_two_weeks_of_case
        (and (not (= patient_date_of_birth_value_recorded_now_withunit_date case_date_of_birth_value_recorded_now_withunit_date))
             (<= (abs (- patient_date_of_birth_value_recorded_now_withunit_date case_date_of_birth_value_recorded_now_withunit_date)) (/ 14.0 1.0))))
     :named REQ2_AUXILIARY0)) ;; "within ± two weeks from the date of birth of the case"

(assert
  (! (= patient_date_of_birth_within_four_weeks_of_case
        (and (not (= patient_date_of_birth_value_recorded_now_withunit_date case_date_of_birth_value_recorded_now_withunit_date))
             (<= (abs (- patient_date_of_birth_value_recorded_now_withunit_date case_date_of_birth_value_recorded_now_withunit_date)) (/ 28.0 1.0))))
     :named REQ2_AUXILIARY1)) ;; "within ± four weeks from the date of birth of the case"

(assert
  (! (= patient_date_of_birth_within_six_weeks_of_case
        (and (not (= patient_date_of_birth_value_recorded_now_withunit_date case_date_of_birth_value_recorded_now_withunit_date))
             (<= (abs (- patient_date_of_birth_value_recorded_now_withunit_date case_date_of_birth_value_recorded_now_withunit_date)) (/ 42.0 1.0))))
     :named REQ2_AUXILIARY2)) ;; "within ± six weeks from the date of birth of the case"

(assert
  (! (= patient_date_of_birth_within_eight_weeks_of_case
        (and (not (= patient_date_of_birth_value_recorded_now_withunit_date case_date_of_birth_value_recorded_now_withunit_date))
             (<= (abs (- patient_date_of_birth_value_recorded_now_withunit_date case_date_of_birth_value_recorded_now_withunit_date)) (/ 56.0 1.0))))
     :named REQ2_AUXILIARY3)) ;; "within ± eight weeks from the date of birth of the case"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Inclusion logic as per requirement:
;; - If enough patients are available within ±2 weeks, patient must be within ±2 weeks.
;; - Else if enough within ±4 weeks, patient must be within ±4 weeks.
;; - Else if enough within ±6 weeks and patient is hospital control, patient must be within ±6 weeks.
;; - Else if enough within ±8 weeks and patient is neighbourhood control, patient must be within ±8 weeks.

(assert
  (! (or
      (and (>= number_of_patients_within_two_weeks_of_case_date_of_birth_value_recorded_now_withunit_count number_of_patients_required_value_recorded_now_withunit_count)
           patient_date_of_birth_within_two_weeks_of_case)
      (and (< number_of_patients_within_two_weeks_of_case_date_of_birth_value_recorded_now_withunit_count number_of_patients_required_value_recorded_now_withunit_count)
           (>= number_of_patients_within_four_weeks_of_case_date_of_birth_value_recorded_now_withunit_count number_of_patients_required_value_recorded_now_withunit_count)
           patient_date_of_birth_within_four_weeks_of_case)
      (and (< number_of_patients_within_two_weeks_of_case_date_of_birth_value_recorded_now_withunit_count number_of_patients_required_value_recorded_now_withunit_count)
           (< number_of_patients_within_four_weeks_of_case_date_of_birth_value_recorded_now_withunit_count number_of_patients_required_value_recorded_now_withunit_count)
           (>= number_of_patients_within_six_weeks_of_case_date_of_birth_value_recorded_now_withunit_count number_of_patients_required_value_recorded_now_withunit_count)
           patient_is_hospital_control_now
           patient_date_of_birth_within_six_weeks_of_case)
      (and (< number_of_patients_within_two_weeks_of_case_date_of_birth_value_recorded_now_withunit_count number_of_patients_required_value_recorded_now_withunit_count)
           (< number_of_patients_within_four_weeks_of_case_date_of_birth_value_recorded_now_withunit_count number_of_patients_required_value_recorded_now_withunit_count)
           (< number_of_patients_within_six_weeks_of_case_date_of_birth_value_recorded_now_withunit_count number_of_patients_required_value_recorded_now_withunit_count)
           (>= number_of_patients_within_eight_weeks_of_case_date_of_birth_value_recorded_now_withunit_count number_of_patients_required_value_recorded_now_withunit_count)
           patient_is_neighbourhood_control_now
           patient_date_of_birth_within_eight_weeks_of_case)
     )
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been born within ± two weeks from the date of birth of the case OR (if the number required is not available, within ± four weeks from the date of birth of the case) OR (if the number required is still not available and the patient is a hospital control, within ± six weeks from the date of birth of the case) OR (if the patient is a neighbourhood control and the number required is still not available, within ± eight weeks from the date of birth of the case)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const written_informed_consent_obtained_from_parent_or_guardian_of_patient Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from either the parent or the guardian of the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from either the parent or the guardian of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from either the parent or the guardian of the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from either the parent or the guardian of the patient."} ;; "the patient must have written informed consent obtained from the parent OR guardian of the patient."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! written_informed_consent_obtained_from_parent_or_guardian_of_patient
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have written informed consent obtained from the parent OR guardian of the patient."
