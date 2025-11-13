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
(declare-const patient_has_finding_of_inpatient_stay_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an inpatient stay (hospitalisation) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an inpatient stay (hospitalisation) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an inpatient stay (hospitalisation).","meaning":"Boolean indicating whether the patient has ever had an inpatient stay (hospitalisation) at any time in their history."} ;; "hospitalisation"
(declare-const patient_has_finding_of_inpatient_stay_inthehistory@@not_related_to_gastroenteritis Bool) ;; {"when_to_set_to_true":"Set to true if the hospitalisation (inpatient stay) in the patient's history is NOT related to gastroenteritis.","when_to_set_to_false":"Set to false if the hospitalisation is related to gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hospitalisation is related to gastroenteritis.","meaning":"Boolean indicating whether the hospitalisation is NOT related to gastroenteritis."} ;; "hospitalisation ... NOT related to gastroenteritis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies base variable
(assert
(! (=> patient_has_finding_of_inpatient_stay_inthehistory@@not_related_to_gastroenteritis
      patient_has_finding_of_inpatient_stay_inthehistory)
:named REQ1_AUXILIARY0)) ;; "hospitalisation ... NOT related to gastroenteritis" implies "hospitalisation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_inpatient_stay_inthehistory@@not_related_to_gastroenteritis)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the hospitalisation of the patient is NOT related to gastroenteritis."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const onset_time_of_severe_gastroenteritis_in_patient_value_recorded_in_hours_since_admission_to_hospital Real) ;; {"when_to_set_to_value":"Set to the number of hours between the patient's admission to the hospital and the onset of severe gastroenteritis, if known and documented.","when_to_set_to_null":"Set to null if the time of onset of severe gastroenteritis relative to hospital admission is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the hours elapsed from hospital admission to onset of severe gastroenteritis."} ;; "the onset of severe gastroenteritis in the patient occurs more than forty-eight hours after admission to the hospital"

(declare-const patient_has_finding_of_gastroenteritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of gastroenteritis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of gastroenteritis.","meaning":"Boolean indicating whether the patient currently has gastroenteritis."} ;; "gastroenteritis"

(declare-const patient_has_finding_of_gastroenteritis_now@@temporalcontext_onset_more_than_48_hours_after_admission_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gastroenteritis and the onset of gastroenteritis occurred more than forty-eight hours after admission to the hospital.","when_to_set_to_false":"Set to false if the patient currently has gastroenteritis but the onset occurred forty-eight hours or less after admission to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of gastroenteritis occurred more than forty-eight hours after admission to the hospital.","meaning":"Boolean indicating whether the patient currently has gastroenteritis and its onset was more than forty-eight hours after hospital admission."} ;; "gastroenteritis ... onset more than forty-eight hours after admission to the hospital"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: qualifier variable for onset > 48 hours after admission
(assert
(! (= patient_has_finding_of_gastroenteritis_now@@temporalcontext_onset_more_than_48_hours_after_admission_to_hospital
(and patient_has_finding_of_gastroenteritis_now
    (> onset_time_of_severe_gastroenteritis_in_patient_value_recorded_in_hours_since_admission_to_hospital 48)))
:named REQ2_AUXILIARY0)) ;; "the onset of severe gastroenteritis in the patient occurs more than forty-eight hours after admission to the hospital"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_gastroenteritis_now@@temporalcontext_onset_more_than_48_hours_after_admission_to_hospital
       patient_has_finding_of_gastroenteritis_now)
:named REQ2_AUXILIARY1)) ;; "gastroenteritis ... onset more than forty-eight hours after admission to the hospital"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_gastroenteritis_now@@temporalcontext_onset_more_than_48_hours_after_admission_to_hospital)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the onset of severe gastroenteritis in the patient occurs more than forty-eight hours after admission to the hospital."
