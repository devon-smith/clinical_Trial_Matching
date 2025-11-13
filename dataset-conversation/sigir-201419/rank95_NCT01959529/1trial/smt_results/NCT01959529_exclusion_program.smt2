;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_history_of_acute_coronary_event_within_60_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute coronary event that occurred within the previous sixty days.","when_to_set_to_false":"Set to false if the patient has not had an acute coronary event within the previous sixty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute coronary event within the previous sixty days.","meaning":"Boolean indicating whether the patient has had an acute coronary event within the previous sixty days."} ;; "the patient has had an acute coronary event within the previous sixty days"

(declare-const patient_has_history_of_acute_cerebrovascular_event_within_60_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute cerebrovascular event that occurred within the previous sixty days.","when_to_set_to_false":"Set to false if the patient has not had an acute cerebrovascular event within the previous sixty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute cerebrovascular event within the previous sixty days.","meaning":"Boolean indicating whether the patient has had an acute cerebrovascular event within the previous sixty days."} ;; "the patient has had an acute cerebrovascular event within the previous sixty days"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_history_of_acute_coronary_event_within_60_days)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had an acute coronary event within the previous sixty days."

(assert
(! (not patient_has_history_of_acute_cerebrovascular_event_within_60_days)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had an acute cerebrovascular event within the previous sixty days."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_planned_coronary_artery_revascularisation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a planned coronary artery revascularisation.","when_to_set_to_false":"Set to false if the patient does not have a planned coronary artery revascularisation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a planned coronary artery revascularisation.","meaning":"Boolean indicating whether the patient has a planned coronary artery revascularisation."} ;; "the patient has planned coronary artery revascularisation"
(declare-const patient_has_planned_carotid_artery_revascularisation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a planned carotid artery revascularisation.","when_to_set_to_false":"Set to false if the patient does not have a planned carotid artery revascularisation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a planned carotid artery revascularisation.","meaning":"Boolean indicating whether the patient has a planned carotid artery revascularisation."} ;; "the patient has planned carotid artery revascularisation"
(declare-const patient_has_planned_peripheral_artery_revascularisation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a planned peripheral artery revascularisation.","when_to_set_to_false":"Set to false if the patient does not have a planned peripheral artery revascularisation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a planned peripheral artery revascularisation.","meaning":"Boolean indicating whether the patient has a planned peripheral artery revascularisation."} ;; "the patient has planned peripheral artery revascularisation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_planned_coronary_artery_revascularisation)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has planned coronary artery revascularisation."

(assert
  (! (not patient_has_planned_carotid_artery_revascularisation)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has planned carotid artery revascularisation."

(assert
  (! (not patient_has_planned_peripheral_artery_revascularisation)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has planned peripheral artery revascularisation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chronic_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic heart failure.","meaning":"Boolean indicating whether the patient currently has chronic heart failure."} ;; "chronic heart failure"
(declare-const patient_has_finding_of_chronic_heart_failure_now@@nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic heart failure is classified as NYHA class IV.","when_to_set_to_false":"Set to false if the patient's chronic heart failure is not classified as NYHA class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic heart failure is NYHA class IV.","meaning":"Boolean indicating whether the patient's chronic heart failure is NYHA class IV."} ;; "chronic heart failure New York Heart Association (NYHA) class IV"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_chronic_heart_failure_now@@nyha_class_iv
      patient_has_finding_of_chronic_heart_failure_now)
:named REQ2_AUXILIARY0)) ;; "chronic heart failure New York Heart Association (NYHA) class IV""

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_chronic_heart_failure_now@@nyha_class_iv)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic heart failure New York Heart Association (NYHA) class IV."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease."} ;; "the patient has current malignant neoplasms"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@excludes_basal_cell_skin_carcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of malignant neoplastic disease excludes basal cell skin carcinoma.","when_to_set_to_false":"Set to false if the diagnosis of malignant neoplastic disease does not exclude basal cell skin carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether basal cell skin carcinoma is excluded from the diagnosis.","meaning":"Boolean indicating whether basal cell skin carcinoma is excluded from the diagnosis of malignant neoplastic disease."} ;; "except basal cell skin carcinoma"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@excludes_squamous_cell_skin_carcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of malignant neoplastic disease excludes squamous cell skin carcinoma.","when_to_set_to_false":"Set to false if the diagnosis of malignant neoplastic disease does not exclude squamous cell skin carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether squamous cell skin carcinoma is excluded from the diagnosis.","meaning":"Boolean indicating whether squamous cell skin carcinoma is excluded from the diagnosis of malignant neoplastic disease."} ;; "except squamous cell skin carcinoma"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malignant neoplastic disease within the past five years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malignant neoplastic disease within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malignant neoplastic disease within the past five years.","meaning":"Boolean indicating whether the patient has had a diagnosis of malignant neoplastic disease within the past five years."} ;; "the patient has past malignant neoplasms within the last five years"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@excludes_basal_cell_skin_carcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of malignant neoplastic disease within the past five years excludes basal cell skin carcinoma.","when_to_set_to_false":"Set to false if the diagnosis of malignant neoplastic disease within the past five years does not exclude basal cell skin carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether basal cell skin carcinoma is excluded from the diagnosis within the past five years.","meaning":"Boolean indicating whether basal cell skin carcinoma is excluded from the diagnosis of malignant neoplastic disease within the past five years."} ;; "except basal cell skin carcinoma"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@excludes_squamous_cell_skin_carcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of malignant neoplastic disease within the past five years excludes squamous cell skin carcinoma.","when_to_set_to_false":"Set to false if the diagnosis of malignant neoplastic disease within the past five years does not exclude squamous cell skin carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether squamous cell skin carcinoma is excluded from the diagnosis within the past five years.","meaning":"Boolean indicating whether squamous cell skin carcinoma is excluded from the diagnosis of malignant neoplastic disease within the past five years."} ;; "except squamous cell skin carcinoma"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables (current)
(assert
(! (=> (or patient_has_diagnosis_of_malignant_neoplastic_disease_now@@excludes_basal_cell_skin_carcinoma
           patient_has_diagnosis_of_malignant_neoplastic_disease_now@@excludes_squamous_cell_skin_carcinoma)
       patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ3_AUXILIARY0)) ;; "except basal cell skin carcinoma except squamous cell skin carcinoma" (current malignant neoplasms)

;; Qualifier variables imply corresponding stem variables (past 5 years)
(assert
(! (=> (or patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@excludes_basal_cell_skin_carcinoma
           patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@excludes_squamous_cell_skin_carcinoma)
       patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years)
:named REQ3_AUXILIARY1)) ;; "except basal cell skin carcinoma except squamous cell skin carcinoma" (past malignant neoplasms within the last five years)

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have current malignant neoplasms except basal cell skin carcinoma except squamous cell skin carcinoma
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_now
             (not patient_has_diagnosis_of_malignant_neoplastic_disease_now@@excludes_basal_cell_skin_carcinoma)
             (not patient_has_diagnosis_of_malignant_neoplastic_disease_now@@excludes_squamous_cell_skin_carcinoma)))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current malignant neoplasms except basal cell skin carcinoma except squamous cell skin carcinoma."

;; Exclusion: patient must NOT have past malignant neoplasms within the last five years except basal cell skin carcinoma except squamous cell skin carcinoma
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years
             (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@excludes_basal_cell_skin_carcinoma)
             (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@excludes_squamous_cell_skin_carcinoma)))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has past malignant neoplasms within the last five years except basal cell skin carcinoma except squamous cell skin carcinoma."
