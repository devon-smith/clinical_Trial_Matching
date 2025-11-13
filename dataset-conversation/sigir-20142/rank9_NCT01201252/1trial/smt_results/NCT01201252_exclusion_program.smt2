;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_for_treatment_of_acute_gastroenteritis_at_study_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis for treatment at the study site that includes acute gastroenteritis.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis for treatment at the study site that includes acute gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis for treatment at the study site that includes acute gastroenteritis.","meaning":"Boolean indicating whether the patient has a diagnosis for treatment at the study site that includes acute gastroenteritis."} ;; "diagnosis for treatment at the study site that includes acute gastroenteritis"

(declare-const patient_has_diagnosis_of_acute_gastroenteritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute gastroenteritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute gastroenteritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute gastroenteritis."} ;; "acute gastroenteritis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; If the patient has a diagnosis for treatment at the study site that includes acute gastroenteritis, then the patient must currently have a diagnosis of acute gastroenteritis.
(assert
(! (=> patient_has_diagnosis_for_treatment_of_acute_gastroenteritis_at_study_site
     patient_has_diagnosis_of_acute_gastroenteritis_now)
:named REQ0_AUXILIARY0)) ;; "diagnosis for treatment at the study site that includes acute gastroenteritis"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT lack a diagnosis for treatment at the study site that includes acute gastroenteritis
(assert
(! (not patient_has_diagnosis_for_treatment_of_acute_gastroenteritis_at_study_site)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have a diagnosis for treatment at the study site that includes acute gastroenteritis."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const onset_time_of_acute_gastroenteritis_since_hospital_admission_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours between hospital admission and the onset of acute gastroenteritis in the patient, if known and documented.","when_to_set_to_null":"Set to null if the time from hospital admission to onset of acute gastroenteritis is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time in hours from hospital admission to the onset of acute gastroenteritis in the patient."} ;; "greater than or equal to forty-eight hours after hospital admission"

(declare-const patient_has_finding_of_acute_gastroenteritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute gastroenteritis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute gastroenteritis.","meaning":"Boolean indicating whether the patient currently has acute gastroenteritis."} ;; "acute gastroenteritis"

(declare-const patient_has_finding_of_acute_gastroenteritis_now@@onset_after_hospital_admission_greater_equal_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the onset of acute gastroenteritis in the patient occurred at or after 48 hours following hospital admission.","when_to_set_to_false":"Set to false if the onset of acute gastroenteritis in the patient occurred before 48 hours following hospital admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of acute gastroenteritis occurred at or after 48 hours post-admission.","meaning":"Boolean indicating whether the onset of acute gastroenteritis occurred at or after 48 hours following hospital admission."} ;; "onset of acute gastroenteritis occurs after admission to the hospital, defined as greater than or equal to forty-eight hours after hospital admission"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: onset after hospital admission >= 48 hours
(assert
(! (= patient_has_finding_of_acute_gastroenteritis_now@@onset_after_hospital_admission_greater_equal_48_hours
(and patient_has_finding_of_acute_gastroenteritis_now
    (>= onset_time_of_acute_gastroenteritis_since_hospital_admission_in_hours 48)))
:named REQ1_AUXILIARY0)) ;; "onset of acute gastroenteritis occurs after admission to the hospital, defined as greater than or equal to forty-eight hours after hospital admission"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_acute_gastroenteritis_now@@onset_after_hospital_admission_greater_equal_48_hours
       patient_has_finding_of_acute_gastroenteritis_now)
:named REQ1_AUXILIARY1)) ;; "acute gastroenteritis with onset after hospital admission >= 48 hours implies acute gastroenteritis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_acute_gastroenteritis_now@@onset_after_hospital_admission_greater_equal_48_hours)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the onset of acute gastroenteritis in the patient occurs greater than or equal to forty-eight hours after hospital admission."
