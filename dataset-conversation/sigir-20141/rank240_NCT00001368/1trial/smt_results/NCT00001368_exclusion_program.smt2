;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 30 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of cerebrovascular accident (stroke) within the past 30 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 30 days prior to enrollment.","meaning":"Boolean indicating whether the patient has had a diagnosis of cerebrovascular accident (stroke) within the past 30 days."} ;; "stroke"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of myocardial infarction within the past 30 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of myocardial infarction within the past 30 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of myocardial infarction within the past 30 days prior to enrollment.","meaning":"Boolean indicating whether the patient has had a diagnosis of myocardial infarction within the past 30 days."} ;; "myocardial infarction"
(declare-const patient_has_undergone_surgical_procedure_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within the past 30 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure within the past 30 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within the past 30 days prior to enrollment.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within the past 30 days."} ;; "surgery"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_cerebrovascular_accident_inthepast30days)
     :named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient enrolls within thirty days of a stroke."
(assert
  (! (not patient_has_diagnosis_of_myocardial_infarction_inthepast30days)
     :named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient enrolls within thirty days of a myocardial infarction."
(assert
  (! (not patient_has_undergone_surgical_procedure_inthepast30days)
     :named REQ0_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient enrolls within thirty days of surgery."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving immunosuppressive therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving immunosuppressive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving immunosuppressive therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunosuppressive therapy."} ;; "immunosuppressive therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_undergoing_immunosuppressive_therapy_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on immunosuppressive therapy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_able_to_follow_up_for_1_year_from_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to follow up for one year from the time of enrollment.","when_to_set_to_false":"Set to false if the patient is unable to follow up for one year from the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to follow up for one year from the time of enrollment.","meaning":"Boolean indicating whether the patient is able to follow up for one year from the time of enrollment."} ;; "unable to follow up for one year from the time of enrollment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_able_to_follow_up_for_1_year_from_enrollment)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to follow up for one year from the time of enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_identifiable_cardiac_source_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an identifiable cardiac source, including but not limited to atrial fibrillation, mural thrombus, or valvular disease with vegetation.","when_to_set_to_false":"Set to false if the patient currently does not have an identifiable cardiac source.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an identifiable cardiac source.","meaning":"Boolean indicating whether the patient currently has an identifiable cardiac source (such as atrial fibrillation, mural thrombus, or valvular disease with vegetation)."} ;; "identifiable cardiac source (such as atrial fibrillation, mural thrombus, or valvular disease with vegetation)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have BOTH (stroke) AND (identifiable cardiac source)
(assert
(! (not (and patient_has_diagnosis_of_cerebrovascular_accident_inthepast30days
             patient_has_identifiable_cardiac_source_now))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had a stroke) AND (the patient has an identifiable cardiac source with non-exhaustive examples (atrial fibrillation, mural thrombus, valvular disease with vegetation))."
