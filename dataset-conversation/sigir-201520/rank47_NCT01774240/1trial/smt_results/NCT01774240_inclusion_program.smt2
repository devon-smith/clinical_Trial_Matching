;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "adult patient"
(declare-const patient_is_adult_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an adult (age 18 years or older).","when_to_set_to_false":"Set to false if the patient is currently not an adult (age less than 18 years).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an adult.","meaning":"Boolean indicating whether the patient is currently an adult (i.e., age 18 years or older)."}  ;; "adult patient"

(declare-const patient_has_undergone_operation_on_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a cardiac operation (operation on heart) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a cardiac operation (operation on heart) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a cardiac operation (operation on heart) in their history.","meaning":"Boolean indicating whether the patient has undergone a cardiac operation (operation on heart) at any time in their history."}  ;; "cardiac surgery"
(declare-const patient_has_undergone_operation_on_heart_inthehistory@@performed_at_department_of_cardiothoracic_surgery_at_rigshospitalet_denmark Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac operation (operation on heart) was performed at the department of cardiothoracic surgery at Rigshospitalet, Denmark.","when_to_set_to_false":"Set to false if the patient's cardiac operation (operation on heart) was not performed at the department of cardiothoracic surgery at Rigshospitalet, Denmark.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiac operation (operation on heart) was performed at the department of cardiothoracic surgery at Rigshospitalet, Denmark.","meaning":"Boolean indicating whether the patient's cardiac operation (operation on heart) was performed at the department of cardiothoracic surgery at Rigshospitalet, Denmark."}  ;; "admitted for cardiac surgery at the department of cardiothoracic surgery at Rigshospitalet, Denmark"

(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any surgical procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone any surgical procedure in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any surgical procedure in their history.","meaning":"Boolean indicating whether the patient has undergone any surgical procedure at any time in their history."}  ;; "surgery"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@performed_at_department_of_cardiothoracic_surgery_at_rigshospitalet_denmark Bool) ;; {"when_to_set_to_true":"Set to true if the patient's surgical procedure was performed at the department of cardiothoracic surgery at Rigshospitalet, Denmark.","when_to_set_to_false":"Set to false if the patient's surgical procedure was not performed at the department of cardiothoracic surgery at Rigshospitalet, Denmark.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's surgical procedure was performed at the department of cardiothoracic surgery at Rigshospitalet, Denmark.","meaning":"Boolean indicating whether the patient's surgical procedure was performed at the department of cardiothoracic surgery at Rigshospitalet, Denmark."}  ;; "surgery at the department of cardiothoracic surgery at Rigshospitalet, Denmark"

(declare-const patient_is_admitted_for_cardiac_surgery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted for cardiac surgery.","when_to_set_to_false":"Set to false if the patient is currently not admitted for cardiac surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted for cardiac surgery.","meaning":"Boolean indicating whether the patient is currently admitted for cardiac surgery."}  ;; "admitted for cardiac surgery"
(declare-const patient_is_admitted_for_cardiac_surgery_now@@at_department_of_cardiothoracic_surgery_at_rigshospitalet_denmark Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current admission for cardiac surgery is at the department of cardiothoracic surgery at Rigshospitalet, Denmark.","when_to_set_to_false":"Set to false if the patient's current admission for cardiac surgery is not at the department of cardiothoracic surgery at Rigshospitalet, Denmark.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current admission for cardiac surgery is at the department of cardiothoracic surgery at Rigshospitalet, Denmark.","meaning":"Boolean indicating whether the patient's current admission for cardiac surgery is at the department of cardiothoracic surgery at Rigshospitalet, Denmark."}  ;; "admitted for cardiac surgery at the department of cardiothoracic surgery at Rigshospitalet, Denmark"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: patient is adult if age >= 18
(assert
  (! (= patient_is_adult_now
        (>= patient_age_value_recorded_now_in_years 18.0))
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must be an adult patient."

;; Qualifier variable for cardiac operation at Rigshospitalet implies cardiac operation in history
(assert
  (! (=> patient_has_undergone_operation_on_heart_inthehistory@@performed_at_department_of_cardiothoracic_surgery_at_rigshospitalet_denmark
         patient_has_undergone_operation_on_heart_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "admitted for cardiac surgery at the department of cardiothoracic surgery at Rigshospitalet, Denmark"

;; Qualifier variable for surgical procedure at Rigshospitalet implies surgical procedure in history
(assert
  (! (=> patient_has_undergone_surgical_procedure_inthehistory@@performed_at_department_of_cardiothoracic_surgery_at_rigshospitalet_denmark
         patient_has_undergone_surgical_procedure_inthehistory)
     :named REQ0_AUXILIARY2)) ;; "surgery at the department of cardiothoracic surgery at Rigshospitalet, Denmark"

;; Qualifier variable for current admission for cardiac surgery at Rigshospitalet implies current admission for cardiac surgery
(assert
  (! (=> patient_is_admitted_for_cardiac_surgery_now@@at_department_of_cardiothoracic_surgery_at_rigshospitalet_denmark
         patient_is_admitted_for_cardiac_surgery_now)
     :named REQ0_AUXILIARY3)) ;; "admitted for cardiac surgery at the department of cardiothoracic surgery at Rigshospitalet, Denmark"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be an adult
(assert
  (! patient_is_adult_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an adult patient."

;; Component 1: patient must be admitted for cardiac surgery at the department of cardiothoracic surgery at Rigshospitalet, Denmark
(assert
  (! patient_is_admitted_for_cardiac_surgery_now@@at_department_of_cardiothoracic_surgery_at_rigshospitalet_denmark
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be admitted for cardiac surgery at the department of cardiothoracic surgery at Rigshospitalet, Denmark."
