;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "elderly patient"
(declare-const patient_is_assisted_in_reference_center_for_the_elderly_of_araraquara_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assisted in the Reference Center for the Elderly of Araraquara.","when_to_set_to_false":"Set to false if the patient is currently not assisted in the Reference Center for the Elderly of Araraquara.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently assisted in the Reference Center for the Elderly of Araraquara.","meaning":"Boolean indicating whether the patient is currently assisted in the Reference Center for the Elderly of Araraquara."} // "assisted in the Reference Center for the Elderly of Araraquara"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."} // "diagnosis of Alzheimer's disease"
(declare-const patient_is_exposed_to_rivastigmine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or being treated with rivastigmine.","when_to_set_to_false":"Set to false if the patient is currently not taking or being treated with rivastigmine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or being treated with rivastigmine.","meaning":"Boolean indicating whether the patient is currently exposed to rivastigmine."} // "in use of rivastigmine"
(declare-const patient_is_exposed_to_donepezil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or being treated with donepezil.","when_to_set_to_false":"Set to false if the patient is currently not taking or being treated with donepezil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or being treated with donepezil.","meaning":"Boolean indicating whether the patient is currently exposed to donepezil."} // "in use of donepezil"
(declare-const patient_is_exposed_to_galantamine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or being treated with galantamine.","when_to_set_to_false":"Set to false if the patient is currently not taking or being treated with galantamine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or being treated with galantamine.","meaning":"Boolean indicating whether the patient is currently exposed to galantamine."} // "in use of galantamine"
(declare-const patient_is_assisted_by_program_for_special_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assisted by the Program for Special Drugs.","when_to_set_to_false":"Set to false if the patient is currently not assisted by the Program for Special Drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently assisted by the Program for Special Drugs.","meaning":"Boolean indicating whether the patient is currently assisted by the Program for Special Drugs."} // "assisted by the Program for Special Drugs"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be an elderly patient.
(assert
  (! (>= patient_age_value_recorded_now_in_years 60.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "elderly patient" (commonly defined as age ≥ 60 years in clinical/geriatric contexts)

;; Component 1: The patient must be assisted in the Reference Center for the Elderly of Araraquara.
(assert
  (! patient_is_assisted_in_reference_center_for_the_elderly_of_araraquara_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "assisted in the Reference Center for the Elderly of Araraquara"

;; Component 2: The patient must have a diagnosis of Alzheimer's disease.
(assert
  (! patient_has_diagnosis_of_alzheimer_s_disease_now
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis of Alzheimer's disease"

;; Component 3: The patient must be in use of rivastigmine OR donepezil OR galantamine.
(assert
  (! (or patient_is_exposed_to_rivastigmine_now
         patient_is_exposed_to_donepezil_now
         patient_is_exposed_to_galantamine_now)
     :named REQ0_COMPONENT3_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "in use of rivastigmine OR donepezil OR galantamine"

;; Component 4: The patient must be assisted by the Program for Special Drugs.
(assert
  (! patient_is_assisted_by_program_for_special_drugs_now
     :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "assisted by the Program for Special Drugs"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_resident_in_city_of_araraquara_sao_paulo_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a resident in the city of Araraquara, São Paulo.","when_to_set_to_false":"Set to false if the patient is currently not a resident in the city of Araraquara, São Paulo.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a resident in the city of Araraquara, São Paulo.","meaning":"Boolean indicating whether the patient is currently a resident in the city of Araraquara, São Paulo."} // "the patient must be a resident in the city of Araraquara, São Paulo."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_resident_in_city_of_araraquara_sao_paulo_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a resident in the city of Araraquara, São Paulo."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_accepts_participation_in_pharmacotherapeutic_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if the patient has accepted participation in pharmacotherapeutic follow-up.","when_to_set_to_false":"Set to false if the patient has explicitly declined participation in pharmacotherapeutic follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has accepted participation in pharmacotherapeutic follow-up.","meaning":"Boolean indicating whether the patient accepts participation in pharmacotherapeutic follow-up."} // "the patient must accept participation in pharmacotherapeutic follow-up"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_accepts_participation_in_pharmacotherapeutic_follow_up
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must accept participation in pharmacotherapeutic follow-up"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_signed_statement_of_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed the Statement of Informed Consent Form.","when_to_set_to_false":"Set to false if the patient has not signed the Statement of Informed Consent Form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed the Statement of Informed Consent Form.","meaning":"Boolean indicating whether the patient has signed the Statement of Informed Consent Form."} // "the patient must sign the Statement of Informed Consent Form."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_signed_statement_of_informed_consent_form
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must sign the Statement of Informed Consent Form."
