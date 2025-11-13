;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_speaks_norwegian_properly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently speaks Norwegian properly.","when_to_set_to_false":"Set to false if the patient currently does not speak Norwegian properly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently speaks Norwegian properly.","meaning":"Boolean indicating whether the patient currently speaks Norwegian properly."} ;; "does NOT speak Norwegian properly"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_speaks_norwegian_properly_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT speak Norwegian properly."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_intellectual_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of intellectual disability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of intellectual disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of intellectual disability.","meaning":"Boolean indicating whether the patient currently has intellectual disability."} ;; "mental retardation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_intellectual_disability_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mental retardation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_psychotic_disorder_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of psychotic disorder at any time within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of psychotic disorder at any time within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of psychotic disorder within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of psychotic disorder within the past 6 months."} ;; "psychotic disorder within the last 6 months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_psychotic_disorder_inthepast6months)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had psychotic disorder within the last 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol abuse (current alcohol misuse).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol abuse (current alcohol misuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of alcohol abuse (current alcohol misuse).","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "the patient has current alcohol misuse"
(declare-const patient_has_finding_of_misuses_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of drug misuse (current drug misuse).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of drug misuse (current drug misuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of drug misuse (current drug misuse).","meaning":"Boolean indicating whether the patient currently misuses drugs."} ;; "the patient has current drug misuse"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current alcohol misuse."

(assert
(! (not patient_has_finding_of_misuses_drugs_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current drug misuse."
