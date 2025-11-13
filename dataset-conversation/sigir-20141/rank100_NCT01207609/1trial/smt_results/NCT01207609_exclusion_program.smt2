;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than 18 years old OR the patient is older than 60 years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than 18 years old."

(assert
(! (not (> patient_age_value_recorded_now_in_years 60))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is older than 60 years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has pregnancy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pregnancy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_major_depressive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with major depressive disorder at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with major depressive disorder at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with major depressive disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of major depressive disorder in their history."} ;; "the patient has a history of major depressive disorder"
(declare-const patient_has_diagnosis_of_psychosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with psychosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with psychosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with psychosis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of psychosis in their history."} ;; "the patient has a history of psychosis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_major_depressive_disorder_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of major depressive disorder."

(assert
(! (not patient_has_diagnosis_of_psychosis_inthehistory)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psychosis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bariatric operative procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a bariatric operative procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a bariatric operative procedure.","meaning":"Boolean indicating whether the patient has ever undergone a bariatric operative procedure at any time in their history."} ;; "the patient has a history of previous bariatric surgery"

(declare-const patient_has_undergone_operation_on_stomach_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an operation on the stomach at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone an operation on the stomach at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an operation on the stomach.","meaning":"Boolean indicating whether the patient has ever undergone an operation on the stomach at any time in their history."} ;; "the patient has a history of previous gastric surgery"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_bariatric_operative_procedure_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of previous bariatric surgery."

(assert
(! (not patient_has_undergone_operation_on_stomach_inthehistory)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of previous gastric surgery."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_achalasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of achalasia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of achalasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has achalasia.","meaning":"Boolean indicating whether the patient currently has achalasia."} ;; "achalasia"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_achalasia_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has achalasia."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_patient_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition (diagnosis or clinical finding) present.","when_to_set_to_false":"Set to false if the patient currently does not have any condition (diagnosis or clinical finding) present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any condition.","meaning":"Boolean indicating whether the patient currently has any condition (diagnosis or clinical finding)."} ;; "any condition"

(declare-const patient_has_finding_of_patient_condition_finding_now@@investigator_judges_condition_places_patient_at_undue_risk_or_compromises_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition and, in the judgment of the investigator, this condition would place the patient at undue risk or could potentially compromise the results or interpretation of the study.","when_to_set_to_false":"Set to false if the patient currently has any condition and, in the judgment of the investigator, this condition would NOT place the patient at undue risk and would NOT compromise the results or interpretation of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges the condition as placing the patient at undue risk or compromising the study.","meaning":"Boolean indicating whether the patient currently has any condition and the investigator judges it as placing the patient at undue risk or compromising the study/results/interpretation."} ;; "in the judgment of the investigator, would (place the patient at undue risk OR could potentially compromise the results OR could potentially compromise the interpretation of the study)"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_patient_condition_finding_now@@investigator_judges_condition_places_patient_at_undue_risk_or_compromises_study
      patient_has_finding_of_patient_condition_finding_now)
:named REQ5_AUXILIARY0)) ;; "any condition that, in the judgment of the investigator, would (place the patient at undue risk OR could potentially compromise the results OR could potentially compromise the interpretation of the study)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_patient_condition_finding_now@@investigator_judges_condition_places_patient_at_undue_risk_or_compromises_study)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition that, in the judgment of the investigator, would (place the patient at undue risk OR could potentially compromise the results OR could potentially compromise the interpretation of the study)."
