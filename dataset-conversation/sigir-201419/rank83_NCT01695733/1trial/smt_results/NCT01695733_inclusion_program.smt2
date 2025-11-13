;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease."}  ;; "malignancy"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@biopsy_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant neoplastic disease is confirmed by biopsy.","when_to_set_to_false":"Set to false if the patient's malignant neoplastic disease is not confirmed by biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease is biopsy-confirmed.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease is confirmed by biopsy."}  ;; "biopsy-confirmed"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@non_hematological Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant neoplastic disease is non-hematological.","when_to_set_to_false":"Set to false if the patient's malignant neoplastic disease is hematological.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease is non-hematological.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease is non-hematological."}  ;; "non-hematological"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@biopsy_confirmed@@non_hematological Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease, the diagnosis is confirmed by biopsy, and the disease is non-hematological.","when_to_set_to_false":"Set to false if the patient does not currently have a malignant neoplastic disease, or if the diagnosis is not biopsy-confirmed, or if the disease is hematological.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease that is both biopsy-confirmed and non-hematological.","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease that is both biopsy-confirmed and non-hematological."}  ;; "biopsy-confirmed non-hematological malignancy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@biopsy_confirmed
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY0)) ;; "biopsy-confirmed" implies "malignancy"

(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@non_hematological
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY1)) ;; "non-hematological" implies "malignancy"

;; Both qualifiers together imply the doubly qualified variable
(assert
  (! (= patient_has_finding_of_malignant_neoplastic_disease_now@@biopsy_confirmed@@non_hematological
        (and patient_has_finding_of_malignant_neoplastic_disease_now
             patient_has_finding_of_malignant_neoplastic_disease_now@@biopsy_confirmed
             patient_has_finding_of_malignant_neoplastic_disease_now@@non_hematological))
     :named REQ0_AUXILIARY2)) ;; "biopsy-confirmed non-hematological malignancy" definition

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_malignant_neoplastic_disease_now@@biopsy_confirmed@@non_hematological
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a biopsy-confirmed non-hematological malignancy."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_will_undergo_chemotherapy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to receive chemotherapy in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to receive chemotherapy in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to receive chemotherapy in the future.","meaning":"Boolean indicating whether the patient is scheduled to receive chemotherapy in the future."}  ;; "chemotherapy"
(declare-const patient_will_undergo_chemotherapy_inthefuture@@is_cytotoxic Bool) ;; {"when_to_set_to_true":"Set to true if the scheduled chemotherapy in the future is cytotoxic.","when_to_set_to_false":"Set to false if the scheduled chemotherapy in the future is not cytotoxic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduled chemotherapy in the future is cytotoxic.","meaning":"Boolean indicating whether the scheduled chemotherapy in the future is cytotoxic."}  ;; "cytotoxic chemotherapy"
(declare-const patient_will_undergo_immunological_therapy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to receive immunological therapy (immunotherapy) in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to receive immunological therapy (immunotherapy) in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to receive immunological therapy (immunotherapy) in the future.","meaning":"Boolean indicating whether the patient is scheduled to receive immunological therapy (immunotherapy) in the future."}  ;; "immunotherapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_will_undergo_chemotherapy_inthefuture@@is_cytotoxic
         patient_will_undergo_chemotherapy_inthefuture)
     :named REQ1_AUXILIARY0)) ;; "patient must be scheduled to receive cytotoxic chemotherapy"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must be scheduled to receive cytotoxic chemotherapy
(assert
  (! patient_will_undergo_chemotherapy_inthefuture@@is_cytotoxic
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "scheduled to receive cytotoxic chemotherapy"

;; Component 1: patient must NOT be scheduled to receive immunotherapy
(assert
  (! (not patient_will_undergo_immunological_therapy_inthefuture)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "NOT scheduled to receive immunotherapy"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_lymphocyte_component_of_blood_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's absolute lymphocyte count in cells per microliter is recorded immediately prior to influenza vaccination.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's absolute lymphocyte count in cells per microliter measured immediately prior to influenza vaccination."}  ;; "absolute lymphocyte count in cells per microliter measured immediately prior to influenza vaccination"
(declare-const patient_lymphocyte_component_of_blood_value_recorded_now_withunit_cells_per_microliter@@temporalcontext_immediately_prior_to_influenza_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the measurement of absolute lymphocyte count was taken immediately prior to influenza vaccination.","when_to_set_to_false":"Set to false if the measurement was not taken immediately prior to influenza vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken immediately prior to influenza vaccination.","meaning":"Boolean indicating whether the absolute lymphocyte count measurement was taken immediately prior to influenza vaccination."}  ;; "measurement taken immediately prior to influenza vaccination"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have absolute lymphocyte count ≥ 1,000 per microliter immediately prior to influenza vaccination.
(assert
  (! (and patient_lymphocyte_component_of_blood_value_recorded_now_withunit_cells_per_microliter@@temporalcontext_immediately_prior_to_influenza_vaccination
          (>= patient_lymphocyte_component_of_blood_value_recorded_now_withunit_cells_per_microliter 1000.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_ability_to_understand_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to understand information relevant to signing a written informed consent document.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to understand information relevant to signing a written informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to understand information relevant to signing a written informed consent document.","meaning":"Boolean indicating whether the patient currently has the ability to understand information relevant to signing a written informed consent document."} ;; "the patient must have the ability to understand"
(declare-const patient_has_willingness_to_sign_written_informed_consent_document_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the willingness to sign a written informed consent document.","when_to_set_to_false":"Set to false if the patient currently does not have the willingness to sign a written informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the willingness to sign a written informed consent document.","meaning":"Boolean indicating whether the patient currently has the willingness to sign a written informed consent document."} ;; "the patient must have the willingness to sign a written informed consent document"
(declare-const legally_authorized_representative_has_ability_to_understand_now Bool) ;; {"when_to_set_to_true":"Set to true if the legally authorized representative currently has the ability to understand information relevant to signing a written informed consent document.","when_to_set_to_false":"Set to false if the legally authorized representative currently does not have the ability to understand information relevant to signing a written informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legally authorized representative currently has the ability to understand information relevant to signing a written informed consent document.","meaning":"Boolean indicating whether the legally authorized representative currently has the ability to understand information relevant to signing a written informed consent document."} ;; "the legally authorized representative ... must have the ability to understand"
(declare-const legally_authorized_representative_has_willingness_to_sign_written_informed_consent_document_now Bool) ;; {"when_to_set_to_true":"Set to true if the legally authorized representative currently has the willingness to sign a written informed consent document.","when_to_set_to_false":"Set to false if the legally authorized representative currently does not have the willingness to sign a written informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legally authorized representative currently has the willingness to sign a written informed consent document.","meaning":"Boolean indicating whether the legally authorized representative currently has the willingness to sign a written informed consent document."} ;; "the legally authorized representative ... must have the willingness to sign a written informed consent document"

;; ===================== Constraint Assertions (REQ 4) =====================
;; To be included, the patient must have (the ability to understand AND the willingness to sign a written informed consent document) OR (the legally authorized representative of the patient, if applicable, must have the ability to understand AND the willingness to sign a written informed consent document).
(assert
  (! (or (and patient_has_ability_to_understand_now
              patient_has_willingness_to_sign_written_informed_consent_document_now)
         (and legally_authorized_representative_has_ability_to_understand_now
              legally_authorized_representative_has_willingness_to_sign_written_informed_consent_document_now))
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have (the ability to understand AND the willingness to sign a written informed consent document) OR (the legally authorized representative of the patient, if applicable, must have the ability to understand AND the willingness to sign a written informed consent document)."
