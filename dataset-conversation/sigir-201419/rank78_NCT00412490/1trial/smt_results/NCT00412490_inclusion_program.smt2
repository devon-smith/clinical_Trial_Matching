;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_able_to_provide_written_informed_consent_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide written informed consent to participate.","when_to_set_to_false":"Set to false if the patient is not able to provide written informed consent to participate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide written informed consent to participate.","meaning":"Boolean indicating whether the patient is able to provide written informed consent to participate."} // "the patient must be able to provide written informed consent to participate"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_able_to_provide_written_informed_consent_to_participate
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to provide written informed consent to participate"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy)."} // "have a diagnosis of head malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@involves_oral_cavity_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant neoplastic disease involves an oral cavity site.","when_to_set_to_false":"Set to false if the patient's malignant neoplastic disease does not involve an oral cavity site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignant neoplastic disease involves an oral cavity site.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease involves an oral cavity site."} // "involving an oral cavity site"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@no_previous_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has NOT had previous treatment for malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient has had previous treatment for malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had previous treatment for malignant neoplastic disease.","meaning":"Boolean indicating whether the patient has NOT had previous treatment for malignant neoplastic disease."} // "AND NOT have had previous treatment"
(declare-const patient_has_diagnosis_of_malignant_tumor_of_neck_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor of neck.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant tumor of neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant tumor of neck.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant tumor of neck."} // "have a diagnosis of neck malignancy"
(declare-const patient_has_diagnosis_of_malignant_tumor_of_neck_now@@involves_oral_cavity_site Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant tumor of neck involves an oral cavity site.","when_to_set_to_false":"Set to false if the patient's malignant tumor of neck does not involve an oral cavity site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignant tumor of neck involves an oral cavity site.","meaning":"Boolean indicating whether the patient's malignant tumor of neck involves an oral cavity site."} // "involving an oral cavity site"
(declare-const patient_has_diagnosis_of_malignant_tumor_of_neck_now@@no_previous_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has NOT had previous treatment for malignant tumor of neck.","when_to_set_to_false":"Set to false if the patient has had previous treatment for malignant tumor of neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had previous treatment for malignant tumor of neck.","meaning":"Boolean indicating whether the patient has NOT had previous treatment for malignant tumor of neck."} // "AND NOT have had previous treatment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@involves_oral_cavity_site
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ2_AUXILIARY0)) ;; "malignancy involving an oral cavity site"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@no_previous_treatment
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ2_AUXILIARY1)) ;; "malignancy with no previous treatment"

(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_neck_now@@involves_oral_cavity_site
         patient_has_diagnosis_of_malignant_tumor_of_neck_now)
     :named REQ2_AUXILIARY2)) ;; "neck malignancy involving an oral cavity site"

(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_neck_now@@no_previous_treatment
         patient_has_diagnosis_of_malignant_tumor_of_neck_now)
     :named REQ2_AUXILIARY3)) ;; "neck malignancy with no previous treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: ((head malignancy involving oral cavity site AND NOT previous treatment) OR (neck malignancy involving oral cavity site AND NOT previous treatment))
(assert
  (! (or (and patient_has_diagnosis_of_malignant_neoplastic_disease_now@@involves_oral_cavity_site
              patient_has_diagnosis_of_malignant_neoplastic_disease_now@@no_previous_treatment)
         (and patient_has_diagnosis_of_malignant_tumor_of_neck_now@@involves_oral_cavity_site
              patient_has_diagnosis_of_malignant_tumor_of_neck_now@@no_previous_treatment))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have a diagnosis of head malignancy involving an oral cavity site AND NOT have had previous treatment) OR (have a diagnosis of neck malignancy involving an oral cavity site AND NOT have had previous treatment))"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_treatment_plan_given_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a treatment plan in place.","when_to_set_to_false":"Set to false if the patient currently does not have a treatment plan in place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a treatment plan in place.","meaning":"Boolean indicating whether the patient currently has a treatment plan in place."} // "treatment plan"
(declare-const patient_is_undergoing_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a surgical procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a surgical procedure."} // "surgical intervention"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_has_finding_of_treatment_plan_given_now
          patient_is_undergoing_surgical_procedure_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient's current treatment plan must include surgical intervention."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_english_speaking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently is English speaking.","when_to_set_to_false":"Set to false if the patient currently is not English speaking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently is English speaking.","meaning":"Boolean indicating whether the patient currently is English speaking."} // "the patient must be English speaking."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_english_speaking_now
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be English speaking."
