;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_unable_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to give informed consent.","meaning":"Boolean indicating whether the patient is currently unable to give informed consent."} ;; "the patient is unable to give informed consent"
(declare-const patient_is_unwilling_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently willing to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to give informed consent.","meaning":"Boolean indicating whether the patient is currently unwilling to give informed consent."} ;; "the patient is unwilling to give informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_is_unable_to_give_informed_consent_now
            patient_is_unwilling_to_give_informed_consent_now))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is unable to give informed consent) OR (the patient is unwilling to give informed consent)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_taken_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that the patient has ever taken the study medication at any time in the past.","when_to_set_to_false":"Set to false if there is evidence that the patient has never taken the study medication at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken the study medication in the past.","meaning":"Boolean indicating whether the patient has ever taken the study medication at any time in the past."} ;; "has previously taken the study medication"
(declare-const patient_has_taken_drug_or_medicament_inthehistory@@confirmed_by_dispensing_records Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of taking the study medication is confirmed by dispensing records.","when_to_set_to_false":"Set to false if the patient's history of taking the study medication is not confirmed by dispensing records.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether dispensing records confirm the patient's history of taking the study medication.","meaning":"Boolean indicating whether the patient's history of taking the study medication is confirmed by dispensing records."} ;; "according to dispensing records"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_taken_drug_or_medicament_inthehistory@@confirmed_by_dispensing_records
      patient_has_taken_drug_or_medicament_inthehistory)
   :named REQ1_AUXILIARY0)) ;; "confirmed by dispensing records" implies "has previously taken the study medication"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_taken_drug_or_medicament_inthehistory@@confirmed_by_dispensing_records)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously taken the study medication according to dispensing records."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_allergy_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to the study medication.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to the study medication.","meaning":"Boolean indicating whether the patient currently has an allergy to the study medication."} ;; "allergy to the study medication"
(declare-const patient_has_finding_of_intolerance_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intolerance to the study medication.","when_to_set_to_false":"Set to false if the patient currently does not have an intolerance to the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intolerance to the study medication.","meaning":"Boolean indicating whether the patient currently has an intolerance to the study medication."} ;; "intolerance to the study medication"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_drug_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to the study medication."

(assert
  (! (not patient_has_finding_of_intolerance_to_drug_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an intolerance to the study medication."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_resident_of_long_term_care_facility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a resident of a long-term care facility.","when_to_set_to_false":"Set to false if the patient is currently not a resident of a long-term care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a resident of a long-term care facility.","meaning":"Boolean indicating whether the patient is currently a resident of a long-term care facility."} ;; "the patient is a resident of a long-term care facility"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_resident_of_long_term_care_facility_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a resident of a long-term care facility."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_able_to_confirm_diagnosis_of_ischemic_heart_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to confirm a diagnosis of ischemic heart disease.","when_to_set_to_false":"Set to false if the patient is unable to confirm a diagnosis of ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to confirm a diagnosis of ischemic heart disease.","meaning":"Boolean indicating whether the patient is able to confirm a diagnosis of ischemic heart disease."} ;; "the patient is unable to confirm a diagnosis of ischemic heart disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_able_to_confirm_diagnosis_of_ischemic_heart_disease)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to confirm a diagnosis of ischemic heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const primary_care_physician_patient_contribution_count_in_study Real) ;; {"when_to_set_to_value":"Set to the number of patients that the primary care physician of the patient has already contributed to the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many patients the primary care physician of the patient has already contributed to the study.","meaning":"Numeric value representing the number of patients contributed by the primary care physician of the patient to the study."} ;; "the primary care physician of the patient has already contributed 5 patients to the study"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (>= primary_care_physician_patient_contribution_count_in_study 5))
    :named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the primary care physician of the patient has already contributed 5 patients to the study."
