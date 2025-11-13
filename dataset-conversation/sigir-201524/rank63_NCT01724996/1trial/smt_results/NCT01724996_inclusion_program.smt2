;; ===================== Declarations for the inclusion criteria (REQ 0) =====================

;; "be over the age of 18 years"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "be over the age of 18 years"

;; "acute chest pain"
(declare-const patient_has_finding_of_acute_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute chest pain.","meaning":"Boolean indicating whether the patient currently has acute chest pain."} ;; "acute chest pain"

;; "acute chest pain is the leading symptom"
(declare-const patient_has_finding_of_acute_chest_pain_now@@is_leading_symptom Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute chest pain is the leading symptom.","when_to_set_to_false":"Set to false if the patient's current acute chest pain is not the leading symptom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acute chest pain is the leading symptom.","meaning":"Boolean indicating whether the patient's current acute chest pain is the leading symptom."} ;; "leading symptom of acute chest pain"

;; "acute chest pain is present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich"
(declare-const patient_has_finding_of_acute_chest_pain_now@@present_in_emergency_room_internal_medicine_uhz Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute chest pain is present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich.","when_to_set_to_false":"Set to false if the patient's current acute chest pain is not present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acute chest pain is present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich.","meaning":"Boolean indicating whether the patient's current acute chest pain is present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich."} ;; "present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich"

;; "recurrent acute chest pain"
(declare-const patient_has_finding_of_recurrent_acute_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of recurrent acute chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of recurrent acute chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of recurrent acute chest pain.","meaning":"Boolean indicating whether the patient currently has recurrent acute chest pain."} ;; "recurrent acute chest pain"

;; "recurrent acute chest pain is the leading symptom"
(declare-const patient_has_finding_of_recurrent_acute_chest_pain_now@@is_leading_symptom Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recurrent acute chest pain is the leading symptom.","when_to_set_to_false":"Set to false if the patient's current recurrent acute chest pain is not the leading symptom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current recurrent acute chest pain is the leading symptom.","meaning":"Boolean indicating whether the patient's current recurrent acute chest pain is the leading symptom."} ;; "leading symptom of recurrent acute chest pain"

;; "recurrent acute chest pain is present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich"
(declare-const patient_has_finding_of_recurrent_acute_chest_pain_now@@present_in_emergency_room_internal_medicine_uhz Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recurrent acute chest pain is present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich.","when_to_set_to_false":"Set to false if the patient's current recurrent acute chest pain is not present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current recurrent acute chest pain is present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich.","meaning":"Boolean indicating whether the patient's current recurrent acute chest pain is present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich."} ;; "present in the emergency room of the Department of Internal Medicine, University Hospital of Zurich"

;; ===================== Auxiliary Assertions (REQ 0) =====================

;; Qualifier variables imply their stem variables for acute chest pain
(assert
  (! (=> patient_has_finding_of_acute_chest_pain_now@@is_leading_symptom
         patient_has_finding_of_acute_chest_pain_now)
     :named REQ0_AUXILIARY0)) ;; If acute chest pain is the leading symptom, patient must have acute chest pain

(assert
  (! (=> patient_has_finding_of_acute_chest_pain_now@@present_in_emergency_room_internal_medicine_uhz
         patient_has_finding_of_acute_chest_pain_now)
     :named REQ0_AUXILIARY1)) ;; If acute chest pain is present in ER, patient must have acute chest pain

;; Qualifier variables imply their stem variables for recurrent acute chest pain
(assert
  (! (=> patient_has_finding_of_recurrent_acute_chest_pain_now@@is_leading_symptom
         patient_has_finding_of_recurrent_acute_chest_pain_now)
     :named REQ0_AUXILIARY2)) ;; If recurrent acute chest pain is the leading symptom, patient must have recurrent acute chest pain

(assert
  (! (=> patient_has_finding_of_recurrent_acute_chest_pain_now@@present_in_emergency_room_internal_medicine_uhz
         patient_has_finding_of_recurrent_acute_chest_pain_now)
     :named REQ0_AUXILIARY3)) ;; If recurrent acute chest pain is present in ER, patient must have recurrent acute chest pain

;; ===================== Constraint Assertions (REQ 0) =====================

;; Component 0: "be over the age of 18 years"
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; To be included, the patient must be over the age of 18 years.

;; Component 1: "present with the leading symptom of (first time acute chest pain OR recurrent acute chest pain) in the emergency room of the Department of Internal Medicine, University Hospital of Zurich"
(assert
  (! (or
        (and patient_has_finding_of_acute_chest_pain_now@@is_leading_symptom
             patient_has_finding_of_acute_chest_pain_now@@present_in_emergency_room_internal_medicine_uhz)
        (and patient_has_finding_of_recurrent_acute_chest_pain_now@@is_leading_symptom
             patient_has_finding_of_recurrent_acute_chest_pain_now@@present_in_emergency_room_internal_medicine_uhz))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; To be included, the patient must present with the leading symptom of (first time acute chest pain OR recurrent acute chest pain) in the emergency room of the Department of Internal Medicine, University Hospital of Zurich.
