;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with coronary arteriosclerosis (coronary disease) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with coronary arteriosclerosis (coronary disease) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with coronary arteriosclerosis (coronary disease).","meaning":"Boolean indicating whether the patient has ever been diagnosed with coronary arteriosclerosis (coronary disease) at any time in their history."} ;; "coronary disease"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction at any time in their history."} ;; "myocardial infarction"
(declare-const patient_has_undergone_revascularization_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a revascularization procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a revascularization procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a revascularization procedure.","meaning":"Boolean indicating whether the patient has ever undergone a revascularization procedure at any time in their history."} ;; "previous revascularization"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous coronary disease."

(assert
  (! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous myocardial infarction."

(assert
  (! (not patient_has_undergone_revascularization_inthehistory)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous revascularization."
