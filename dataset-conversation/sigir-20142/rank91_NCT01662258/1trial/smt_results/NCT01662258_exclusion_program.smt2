;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_underlying_immunosuppressive_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an underlying immunosuppressive illness, regardless of specific diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have an underlying immunosuppressive illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an underlying immunosuppressive illness.","meaning":"Boolean indicating whether the patient currently has an underlying immunosuppressive illness, regardless of specific diagnosis."} ;; "underlying immunosuppressive illness"

(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

(declare-const patient_has_diagnosis_of_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of neutropenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of neutropenia."} ;; "neutropenia"

(declare-const patient_has_diagnosis_of_asplenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asplenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asplenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asplenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asplenia."} ;; "asplenia"

(declare-const patient_has_finding_of_transplant_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a transplant recipient (has a transplanted organ or tissue).","when_to_set_to_false":"Set to false if the patient is not currently a transplant recipient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a transplant recipient.","meaning":"Boolean indicating whether the patient is currently a transplant recipient."} ;; "transplant recipient"

(declare-const patient_has_diagnosis_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis."} ;; "cystic fibrosis"

(declare-const patient_is_exposed_to_immunosuppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to an immunosuppressive medication.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to an immunosuppressive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to an immunosuppressive medication.","meaning":"Boolean indicating whether the patient is currently receiving or exposed to an immunosuppressive medication."} ;; "immunosuppressive medication"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a corticosteroid or corticosteroid derivative containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product."} ;; "corticosteroid medication"

(declare-const patient_prednisone_containing_product_value_recorded_now_withunit_mg Real) ;; {"when_to_set_to_value":"Set to the current daily dose in milligrams if the patient is taking prednisone (or equivalent) now.","when_to_set_to_null":"Set to null if the current daily dose is unknown, not documented, or the patient is not taking prednisone (or equivalent) now.","meaning":"Numeric value representing the current daily dose of prednisone (or equivalent) the patient is taking, in milligrams."} ;; "prednisone > 10 mg"

(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy."} ;; "cancer chemotherapy medication"

(declare-const patient_is_taking_tumor_necrosis_factor_alpha_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a tumor necrosis factor alpha inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a tumor necrosis factor alpha inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a tumor necrosis factor alpha inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking a tumor necrosis factor alpha inhibitor containing product."} ;; "anti-tumor necrosis factor agent medication"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term (underlying immunosuppressive illness)
(assert
(! (=> (or patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
          patient_has_diagnosis_of_neutropenia_now
          patient_has_diagnosis_of_asplenia_now
          patient_has_finding_of_transplant_present_now
          patient_has_diagnosis_of_cystic_fibrosis_now)
    patient_has_underlying_immunosuppressive_illness_now)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((human immunodeficiency virus infection) OR (neutropenia) OR (asplenia) OR (is a transplant recipient) OR (cystic fibrosis))"

;; Non-exhaustive examples imply umbrella term (immunosuppressive medication)
(assert
(! (=> (or (and patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now
                (> patient_prednisone_containing_product_value_recorded_now_withunit_mg 10))
          patient_is_undergoing_chemotherapy_now
          patient_is_taking_tumor_necrosis_factor_alpha_inhibitor_containing_product_now)
    patient_is_exposed_to_immunosuppressant_now)
:named REQ0_AUXILIARY1)) ;; "with non-exhaustive examples ((corticosteroid medication (equivalent of prednisone > 10 mg)) OR (cancer chemotherapy medication) OR (anti-tumor necrosis factor agent medication))"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have underlying immunosuppressive illness
(assert
(! (not patient_has_underlying_immunosuppressive_illness_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an underlying immunosuppressive illness..."

;; Exclusion: patient must NOT be receiving immunosuppressive medication
(assert
(! (not patient_is_exposed_to_immunosuppressant_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving immunosuppressive medication..."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_resides_in_long_term_care_facility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in a long-term care facility.","when_to_set_to_false":"Set to false if the patient currently does not reside in a long-term care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in a long-term care facility.","meaning":"Boolean indicating whether the patient currently resides in a long-term care facility."} ;; "resides in a long-term care facility"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_resides_in_long_term_care_facility_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient resides in a long-term care facility."
