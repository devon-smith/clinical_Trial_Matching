;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_dependence_on_wheelchair_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had dependence on a wheelchair at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had dependence on a wheelchair at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had dependence on a wheelchair.","meaning":"Boolean indicating whether the patient has ever had dependence on a wheelchair in their history."} ;; "wheelchair-bound"
(declare-const patient_has_finding_of_dependence_on_wheelchair_inthehistory@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dependence on a wheelchair occurred at baseline.","when_to_set_to_false":"Set to false if the patient's dependence on a wheelchair did not occur at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dependence on a wheelchair occurred at baseline.","meaning":"Boolean indicating whether the patient's dependence on a wheelchair occurred at baseline."} ;; "at baseline"
(declare-const patient_has_finding_of_dependence_on_wheelchair_inthehistory@@in_the_home Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dependence on a wheelchair occurred in the home setting.","when_to_set_to_false":"Set to false if the patient's dependence on a wheelchair did not occur in the home setting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dependence on a wheelchair occurred in the home setting.","meaning":"Boolean indicating whether the patient's dependence on a wheelchair occurred in the home setting."} ;; "in the home"
(declare-const patient_has_finding_of_dependence_on_wheelchair_inthehistory@@at_baseline@@in_the_home Bool) ;; {"when_to_set_to_true":"Set to true if the patient had dependence on a wheelchair at baseline in the home setting.","when_to_set_to_false":"Set to false if the patient did not have dependence on a wheelchair at baseline in the home setting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had dependence on a wheelchair at baseline in the home setting.","meaning":"Boolean indicating whether the patient had dependence on a wheelchair at baseline in the home setting."} ;; "wheelchair-bound in the home at baseline"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_dependence_on_wheelchair_inthehistory@@at_baseline
      patient_has_finding_of_dependence_on_wheelchair_inthehistory)
:named REQ0_AUXILIARY0)) ;; "at baseline"

(assert
(! (=> patient_has_finding_of_dependence_on_wheelchair_inthehistory@@in_the_home
      patient_has_finding_of_dependence_on_wheelchair_inthehistory)
:named REQ0_AUXILIARY1)) ;; "in the home"

;; The double qualifier variable implies both single qualifiers
(assert
(! (=> patient_has_finding_of_dependence_on_wheelchair_inthehistory@@at_baseline@@in_the_home
      (and patient_has_finding_of_dependence_on_wheelchair_inthehistory@@at_baseline
           patient_has_finding_of_dependence_on_wheelchair_inthehistory@@in_the_home))
:named REQ0_AUXILIARY2)) ;; "wheelchair-bound in the home at baseline"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_dependence_on_wheelchair_inthehistory@@at_baseline@@in_the_home)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was wheelchair-bound in the home at baseline."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient does not currently have a finding of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a finding of malignant neoplastic disease."} ;; "malignant neoplastic disease"

(declare-const patient_is_receiving_hospice_treatment_for_malignant_neoplastic_disease_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient was receiving hospice treatment for malignant neoplastic disease at baseline.","when_to_set_to_false":"Set to false if the patient was not receiving hospice treatment for malignant neoplastic disease at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was receiving hospice treatment for malignant neoplastic disease at baseline.","meaning":"Boolean indicating whether the patient was receiving hospice treatment for malignant neoplastic disease at baseline."} ;; "was receiving hospice treatment for malignant neoplastic disease at baseline"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_receiving_hospice_treatment_for_malignant_neoplastic_disease_at_baseline)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was receiving hospice treatment for malignant neoplastic disease at baseline."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_receiving_radiation_therapy_for_malignant_neoplastic_disease_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient was receiving radiation therapy for malignant neoplastic disease at baseline.","when_to_set_to_false":"Set to false if the patient was not receiving radiation therapy for malignant neoplastic disease at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was receiving radiation therapy for malignant neoplastic disease at baseline.","meaning":"Boolean indicating whether the patient was receiving radiation therapy for malignant neoplastic disease at baseline."} ;; "was receiving radiation therapy for malignant neoplastic disease at baseline"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_is_receiving_radiation_therapy_for_malignant_neoplastic_disease_at_baseline)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was receiving radiation therapy for malignant neoplastic disease at baseline."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_chemotherapy_for_malignant_neoplastic_disease_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient was receiving chemotherapy for malignant neoplastic disease at baseline.","when_to_set_to_false":"Set to false if the patient was not receiving chemotherapy for malignant neoplastic disease at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was receiving chemotherapy for malignant neoplastic disease at baseline.","meaning":"Boolean indicating whether the patient was receiving chemotherapy for malignant neoplastic disease at baseline."} ;; "was receiving chemotherapy for malignant neoplastic disease at baseline"
(declare-const patient_has_undergone_chemotherapy_for_malignant_neoplastic_disease_at_baseline@@for_malignant_neoplastic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the chemotherapy at baseline was specifically for malignant neoplastic disease.","when_to_set_to_false":"Set to false if the chemotherapy at baseline was not for malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy at baseline was for malignant neoplastic disease.","meaning":"Boolean indicating whether the chemotherapy at baseline was specifically for malignant neoplastic disease."} ;; "chemotherapy at baseline was specifically for malignant neoplastic disease"
(declare-const patient_has_undergone_chemotherapy_for_malignant_neoplastic_disease_at_baseline@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the chemotherapy for malignant neoplastic disease occurred at baseline.","when_to_set_to_false":"Set to false if the chemotherapy for malignant neoplastic disease did not occur at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy for malignant neoplastic disease occurred at baseline.","meaning":"Boolean indicating whether the chemotherapy for malignant neoplastic disease occurred at baseline."} ;; "chemotherapy for malignant neoplastic disease occurred at baseline"
(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone chemotherapy at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone chemotherapy at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone chemotherapy.","meaning":"Boolean indicating whether the patient has ever undergone chemotherapy in their history."} ;; "chemotherapy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_chemotherapy_for_malignant_neoplastic_disease_at_baseline@@for_malignant_neoplastic_disease
     patient_has_undergone_chemotherapy_for_malignant_neoplastic_disease_at_baseline)
:named REQ3_AUXILIARY0)) ;; "chemotherapy at baseline was specifically for malignant neoplastic disease"

(assert
(! (=> patient_has_undergone_chemotherapy_for_malignant_neoplastic_disease_at_baseline@@at_baseline
     patient_has_undergone_chemotherapy_for_malignant_neoplastic_disease_at_baseline)
:named REQ3_AUXILIARY1)) ;; "chemotherapy for malignant neoplastic disease occurred at baseline"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_chemotherapy_for_malignant_neoplastic_disease_at_baseline)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was receiving chemotherapy for malignant neoplastic disease at baseline."
