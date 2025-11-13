;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_presented_to_emergency_department_now Bool) ;; "Boolean indicating whether the patient is currently presenting to the emergency department." {"when_to_set_to_true":"Set to true if the patient is currently presenting to the emergency department.","when_to_set_to_false":"Set to false if the patient is not currently presenting to the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting to the emergency department.","meaning":"Boolean indicating whether the patient is currently presenting to the emergency department."}
(declare-const patient_has_suspicion_of_pneumonia_now Bool) ;; "Boolean indicating whether the patient currently has a clinical suspicion of pneumonia." {"when_to_set_to_true":"Set to true if the patient currently has a clinical suspicion of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical suspicion of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical suspicion of pneumonia.","meaning":"Boolean indicating whether the patient currently has a clinical suspicion of pneumonia."}
(declare-const patient_has_suspicion_of_pneumonia_now@@suspicion_based_on_respiratory_symptoms Bool) ;; "Boolean indicating whether the patient currently has a clinical suspicion of pneumonia, and the suspicion is specifically based on respiratory symptoms." {"when_to_set_to_true":"Set to true if the patient's current clinical suspicion of pneumonia is specifically based on respiratory symptoms.","when_to_set_to_false":"Set to false if the patient's current clinical suspicion of pneumonia is not based on respiratory symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspicion of pneumonia is based on respiratory symptoms.","meaning":"Boolean indicating whether the patient's current suspicion of pneumonia is based on respiratory symptoms."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_suspicion_of_pneumonia_now@@suspicion_based_on_respiratory_symptoms
         patient_has_suspicion_of_pneumonia_now)
     :named REQ0_AUXILIARY0)) ;; "the suspicion is specifically based on respiratory symptoms" implies "suspicion of pneumonia"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must present to the emergency department
(assert
  (! patient_has_presented_to_emergency_department_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must present to the emergency department"

;; Component 1: patient must have respiratory symptoms suspicious for pneumonia
(assert
  (! patient_has_suspicion_of_pneumonia_now@@suspicion_based_on_respiratory_symptoms
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have respiratory symptoms suspicious for pneumonia"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_can_undergo_imaging_now Bool) ;; "Boolean variable indicating whether the patient is able or eligible to undergo diagnostic imaging now, without regard to the treating physician's belief." {"when_to_set_to_true":"Set to true if the patient is able or eligible to undergo diagnostic imaging now, regardless of the treating physician's belief.","when_to_set_to_false":"Set to false if the patient is not able or not eligible to undergo diagnostic imaging now, regardless of the treating physician's belief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can undergo diagnostic imaging now.","meaning":"Boolean indicating whether the patient can undergo diagnostic imaging now."}
(declare-const patient_can_undergo_imaging_now@@treating_physician_believes_patient_would_benefit Bool) ;; "Boolean variable indicating that, in addition to the patient being eligible to undergo diagnostic imaging now, the treating physician believes the patient would benefit from the imaging." {"when_to_set_to_true":"Set to true if the treating physician believes the patient would benefit from diagnostic imaging now.","when_to_set_to_false":"Set to false if the treating physician does not believe the patient would benefit from diagnostic imaging now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the treating physician believes the patient would benefit from diagnostic imaging now.","meaning":"Boolean indicating whether the treating physician believes the patient would benefit from diagnostic imaging now."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_can_undergo_imaging_now@@treating_physician_believes_patient_would_benefit
         patient_can_undergo_imaging_now)
     :named REQ1_AUXILIARY0)) ;; "Boolean variable indicating that, in addition to the patient being eligible to undergo diagnostic imaging now, the treating physician believes the patient would benefit from the imaging."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_can_undergo_imaging_now@@treating_physician_believes_patient_would_benefit
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the treating physician must believe the patient would benefit from diagnostic imaging."
