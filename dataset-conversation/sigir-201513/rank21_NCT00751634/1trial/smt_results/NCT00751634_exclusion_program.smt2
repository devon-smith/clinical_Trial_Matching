;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_bacteremia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bacteremia.","when_to_set_to_false":"Set to false if the patient currently does not have bacteremia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bacteremia.","meaning":"Boolean indicating whether the patient currently has bacteremia."} ;; "bacteremia"
(declare-const patient_has_finding_of_fever_with_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a fever with an infectious cause (i.e., there is evidence for an infectious cause of fever).","when_to_set_to_false":"Set to false if the patient currently does not have a fever with an infectious cause (i.e., there is evidence that fever is not due to infection or no evidence for infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a fever with an infectious cause.","meaning":"Boolean indicating whether the patient currently has a fever with an infectious cause."} ;; "evidence for an infectious cause of fever"
(declare-const patient_has_finding_of_infectious_disease_of_central_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infectious disease of the central nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have an infectious disease of the central nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infectious disease of the central nervous system.","meaning":"Boolean indicating whether the patient currently has an infectious disease of the central nervous system."} ;; "central nervous system infection"
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"
(declare-const patient_has_finding_of_urinary_tract_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a urinary tract infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a urinary tract infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a urinary tract infectious disease.","meaning":"Boolean indicating whether the patient currently has a urinary tract infectious disease."} ;; "urinary tract infection"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_pneumonia_now
           patient_has_finding_of_bacteremia_now
           patient_has_finding_of_infectious_disease_of_central_nervous_system_now
           patient_has_finding_of_urinary_tract_infectious_disease_now)
       patient_has_finding_of_fever_with_infection_now)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((pneumonia) OR (bacteremia) OR (central nervous system infection) OR (urinary tract infection))."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_fever_with_infection_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence for an infectious cause of fever with non-exhaustive examples ((pneumonia) OR (bacteremia) OR (central nervous system infection) OR (urinary tract infection))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_expected_to_die_from_any_cause Bool) ;; {"when_to_set_to_true":"Set to true if, based on clinical judgment or documentation, the patient is expected to die from any cause.","when_to_set_to_false":"Set to false if, based on clinical judgment or documentation, the patient is not expected to die from any cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to die from any cause.","meaning":"Boolean indicating whether the patient is expected to die from any cause."} ;; "the patient is expected to die from any cause"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_expected_to_die_from_any_cause)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is expected to die from any cause."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_known_sensitivity_to_the_device Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a sensitivity to the device that is documented or otherwise known.","when_to_set_to_false":"Set to false if the patient does not have a sensitivity to the device, or it is documented that the patient is not sensitive to the device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a sensitivity to the device.","meaning":"Boolean indicating whether the patient has a known sensitivity to the device."} ;; "The patient is excluded if the patient has a known sensitivity to the device."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_known_sensitivity_to_the_device)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known sensitivity to the device."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hypothalamic_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had hypothalamic dysfunction at any time in the past (history).","when_to_set_to_false":"Set to false if the patient has never had hypothalamic dysfunction at any time in the past (history).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had hypothalamic dysfunction in the past.","meaning":"Boolean indicating whether the patient has ever had hypothalamic dysfunction in their history."} ;; "hypothalamic dysfunction"
(declare-const patient_has_finding_of_hypothalamic_syndrome_inthehistory@@occurred_prior_to_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypothalamic dysfunction occurred prior to hospital admission.","when_to_set_to_false":"Set to false if the patient's hypothalamic dysfunction did not occur prior to hospital admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypothalamic dysfunction occurred prior to hospital admission.","meaning":"Boolean indicating whether the patient's hypothalamic dysfunction occurred prior to hospital admission."} ;; "pre-admission hypothalamic dysfunction"
(declare-const patient_has_finding_of_temperature_dysregulation_inthehistory@@occurred_prior_to_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had temperature dysregulation in their history and it occurred prior to hospital admission.","when_to_set_to_false":"Set to false if the patient has never had temperature dysregulation in their history prior to hospital admission, or if all episodes occurred only after admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had temperature dysregulation in their history prior to hospital admission.","meaning":"Boolean indicating whether the patient has ever had temperature dysregulation in their history, and the temperature dysregulation occurred prior to hospital admission."} ;; "pre-admission temperature dysregulation"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable for hypothalamic dysfunction
(assert
(! (=> patient_has_finding_of_hypothalamic_syndrome_inthehistory@@occurred_prior_to_admission
      patient_has_finding_of_hypothalamic_syndrome_inthehistory)
:named REQ3_AUXILIARY0)) ;; "pre-admission hypothalamic dysfunction"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have a history of pre-admission hypothalamic dysfunction
(assert
(! (not patient_has_finding_of_hypothalamic_syndrome_inthehistory@@occurred_prior_to_admission)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pre-admission hypothalamic dysfunction."

;; Exclusion: patient must NOT have a history of pre-admission temperature dysregulation
(assert
(! (not patient_has_finding_of_temperature_dysregulation_inthehistory@@occurred_prior_to_admission)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pre-admission temperature dysregulation."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const vasopressor_medications_count_now_withunit_medications Real) ;; {"when_to_set_to_value":"Set to the number of distinct vasopressor medications the patient is currently using.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many vasopressor medications the patient is currently using.","meaning":"Numeric value representing the count of distinct vasopressor medications the patient is currently using, in units of medications."} ;; "uses ≥ 2 vasopressor medications"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (>= vasopressor_medications_count_now_withunit_medications 2))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses ≥ 2 vasopressor medications."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemodynamic instability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemodynamic instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemodynamic instability.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability."} ;; "hemodynamic instability"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_hemodynamic_instability_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamic instability."
