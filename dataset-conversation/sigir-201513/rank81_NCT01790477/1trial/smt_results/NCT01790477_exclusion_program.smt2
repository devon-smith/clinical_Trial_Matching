;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_acupuncture_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone acupuncture at any time prior to now (i.e., any documented history of acupuncture use).","when_to_set_to_false":"Set to false if the patient has never undergone acupuncture at any time prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone acupuncture prior to now.","meaning":"Boolean indicating whether the patient has ever undergone acupuncture in their history."} ;; "acupuncture"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_acupuncture_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior use of acupuncture."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "age < 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is age < 18 years."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_tonsillectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a tonsillectomy at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a tonsillectomy at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a tonsillectomy.","meaning":"Boolean indicating whether the patient has ever undergone a tonsillectomy."} ;; "tonsillectomy"
(declare-const patient_has_undergone_tonsillectomy_inthehistory@@performed_with_other_surgical_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tonsillectomy was performed together with other surgical procedures.","when_to_set_to_false":"Set to false if the patient's tonsillectomy was not performed together with other surgical procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tonsillectomy was performed together with other surgical procedures.","meaning":"Boolean indicating whether the tonsillectomy was performed together with other surgical procedures."} ;; "tonsillectomy performed with other surgical procedures"
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any surgical procedure at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone any surgical procedure at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone any surgical procedure.","meaning":"Boolean indicating whether the patient has ever undergone any surgical procedure."} ;; "surgical procedures"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@performed_together_with_tonsillectomy Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure was performed together with tonsillectomy.","when_to_set_to_false":"Set to false if the surgical procedure was not performed together with tonsillectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure was performed together with tonsillectomy.","meaning":"Boolean indicating whether the surgical procedure was performed together with tonsillectomy."} ;; "surgical procedure performed together with tonsillectomy"
(declare-const patient_has_undergone_uvulopalatopharyngoplasty_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone uvulopalatopharyngoplasty at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone uvulopalatopharyngoplasty at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone uvulopalatopharyngoplasty.","meaning":"Boolean indicating whether the patient has ever undergone uvulopalatopharyngoplasty."} ;; "uvulopalatopharyngoplasty"
(declare-const patient_has_undergone_adenoid_excision_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone adenoid excision (adenoidectomy) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone adenoid excision (adenoidectomy) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone adenoid excision (adenoidectomy).","meaning":"Boolean indicating whether the patient has ever undergone adenoid excision (adenoidectomy)."} ;; "adenoidectomy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply the umbrella term
(assert
(! (=> (or patient_has_undergone_uvulopalatopharyngoplasty_inthehistory
           patient_has_undergone_adenoid_excision_inthehistory)
    patient_has_undergone_tonsillectomy_inthehistory@@performed_with_other_surgical_procedures)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (uvulopalatopharyngoplasty, adenoidectomy)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_tonsillectomy_inthehistory@@performed_with_other_surgical_procedures
    patient_has_undergone_tonsillectomy_inthehistory)
:named REQ2_AUXILIARY1)) ;; "tonsillectomy performed with other surgical procedures"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@performed_together_with_tonsillectomy
    patient_has_undergone_surgical_procedure_inthehistory)
:named REQ2_AUXILIARY2)) ;; "surgical procedure performed together with tonsillectomy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_tonsillectomy_inthehistory@@performed_with_other_surgical_procedures)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tonsillectomy performed with other surgical procedures with non-exhaustive examples (uvulopalatopharyngoplasty, adenoidectomy)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented personal history of blood coagulation disorder (bleeding disorder) at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented personal history of blood coagulation disorder (bleeding disorder) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a personal history of blood coagulation disorder (bleeding disorder).","meaning":"Boolean indicating whether the patient has a personal history of blood coagulation disorder (bleeding disorder)."} ;; "the patient has a known personal history of a bleeding disorder"
(declare-const patient_has_finding_of_blood_coagulation_disorder_inthehistory@@family_history_context Bool) ;; {"when_to_set_to_true":"Set to true if the finding of blood coagulation disorder (bleeding disorder) is present in the patient's family history (i.e., in a family member).","when_to_set_to_false":"Set to false if the finding of blood coagulation disorder (bleeding disorder) is not present in the patient's family history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is present in the patient's family history.","meaning":"Boolean indicating whether the finding of blood coagulation disorder (bleeding disorder) is present in the patient's family history."} ;; "the patient has a known family history of a bleeding disorder"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (or patient_has_finding_of_blood_coagulation_disorder_inthehistory
              patient_has_finding_of_blood_coagulation_disorder_inthehistory@@family_history_context))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a known personal history of a bleeding disorder) OR (the patient has a known family history of a bleeding disorder)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with kidney disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with kidney disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with kidney disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of kidney disease in their history."} ;; "kidney problems"
(declare-const patient_has_diagnosis_of_liver_problem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with liver problems at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with liver problems at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with liver problems.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of liver problems in their history."} ;; "liver problems"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_diagnosis_of_kidney_disease_inthehistory
            patient_has_diagnosis_of_liver_problem_inthehistory))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of kidney problems) OR (the patient has a history of liver problems)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently confirmed to be pregnant.","when_to_set_to_false":"Set to false if the patient is currently confirmed not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is found to be pregnant"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is found to be pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_unwilling_to_enroll_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to enroll in the study.","when_to_set_to_false":"Set to false if the patient is willing to enroll in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to enroll in the study.","meaning":"Boolean indicating whether the patient is unwilling to enroll in the study."} ;; "The patient is excluded if the patient is unwilling to enroll in the study."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_unwilling_to_enroll_in_study)
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to enroll in the study."
