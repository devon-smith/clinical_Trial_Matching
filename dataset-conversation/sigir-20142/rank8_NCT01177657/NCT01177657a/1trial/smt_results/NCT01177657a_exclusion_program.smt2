;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_previously_participated_as_case_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated as a case in this study.","when_to_set_to_false":"Set to false if the patient has not previously participated as a case in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated as a case in this study.","meaning":"Boolean indicating whether the patient has previously participated as a case in this study."} ;; "the patient has previously participated as a case in this study"
(declare-const patient_has_previously_participated_as_control_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated as a control in this study.","when_to_set_to_false":"Set to false if the patient has not previously participated as a control in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated as a control in this study.","meaning":"Boolean indicating whether the patient has previously participated as a control in this study."} ;; "the patient has previously participated as a control in this study"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_previously_participated_as_case_in_this_study)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously participated as a case in this study."

(assert
  (! (not patient_has_previously_participated_as_control_in_this_study)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously participated as a control in this study."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const onset_time_of_gastroenteritis_since_hospital_admission_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours between the patient's hospital admission and the onset of gastroenteritis if both times are known.","when_to_set_to_null":"Set to null if either the time of hospital admission or the onset time of gastroenteritis is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the number of hours between the patient's hospital admission and the onset of gastroenteritis."} ;; "onset of severe gastroenteritis more than forty-eight hours after admission to the hospital"

(declare-const patient_has_diagnosis_of_gastroenteritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gastroenteritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gastroenteritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gastroenteritis."} ;; "gastroenteritis"

(declare-const patient_has_diagnosis_of_gastroenteritis_now@@onset_more_than_48_hours_after_admission_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gastroenteritis and the onset of gastroenteritis occurred more than forty-eight hours after admission to the hospital.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of gastroenteritis and the onset occurred forty-eight hours or less after admission to the hospital, or if the patient does not have gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of gastroenteritis occurred more than forty-eight hours after admission to the hospital.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gastroenteritis and the onset occurred more than forty-eight hours after admission to the hospital."} ;; "onset of severe gastroenteritis more than forty-eight hours after admission to the hospital"

(declare-const patient_has_diagnosis_of_healthcare_associated_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of healthcare-associated infectious disease (nosocomial infection).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of healthcare-associated infectious disease (nosocomial infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of healthcare-associated infectious disease (nosocomial infection).","meaning":"Boolean indicating whether the patient currently has a diagnosis of healthcare-associated infectious disease (nosocomial infection)."} ;; "nosocomial infection"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: onset more than 48 hours after admission
(assert
(! (= patient_has_diagnosis_of_gastroenteritis_now@@onset_more_than_48_hours_after_admission_to_hospital
     (and patient_has_diagnosis_of_gastroenteritis_now
          (> onset_time_of_gastroenteritis_since_hospital_admission_in_hours 48)))
:named REQ1_AUXILIARY0)) ;; "onset of severe gastroenteritis more than forty-eight hours after admission to the hospital"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_gastroenteritis_now@@onset_more_than_48_hours_after_admission_to_hospital
       patient_has_diagnosis_of_gastroenteritis_now)
:named REQ1_AUXILIARY1)) ;; "onset of severe gastroenteritis more than forty-eight hours after admission to the hospital"

;; Nosocomial infection is defined as gastroenteritis with onset >48h after admission
(assert
(! (= patient_has_diagnosis_of_healthcare_associated_infectious_disease_now
      patient_has_diagnosis_of_gastroenteritis_now@@onset_more_than_48_hours_after_admission_to_hospital)
:named REQ1_AUXILIARY2)) ;; "nosocomial infection"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_gastroenteritis_now@@onset_more_than_48_hours_after_admission_to_hospital)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has onset of severe gastroenteritis more than forty-eight hours after admission to the hospital (nosocomial infection)."
