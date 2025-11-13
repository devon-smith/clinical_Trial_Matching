;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "age less than or equal to six months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (<= patient_age_value_recorded_now_in_months 6))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is age less than or equal to six months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_immunodeficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of immunodeficiency of any type.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of immunodeficiency of any type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of immunodeficiency of any type.","meaning":"Boolean indicating whether the patient currently has a diagnosis of immunodeficiency of any type."} ;; "immunodeficiency"
(declare-const patient_has_diagnosis_of_primary_immune_deficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary immune deficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary immune deficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary immune deficiency disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary immune deficiency disorder."} ;; "primary immunodeficiency"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now@@advanced Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection and the infection is advanced.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of human immunodeficiency virus infection but the infection is not advanced.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is advanced.","meaning":"Boolean indicating whether the patient currently has a diagnosis of advanced human immunodeficiency virus infection."} ;; "advanced human immunodeficiency virus infection"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_primary_immune_deficiency_disorder_now
           patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now@@advanced)
    patient_has_diagnosis_of_immunodeficiency_now)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((primary immunodeficiency) OR (advanced human immunodeficiency virus infection))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now@@advanced
       patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now)
:named REQ1_AUXILIARY1)) ;; "advanced human immunodeficiency virus infection" implies "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_immunodeficiency_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immunodeficiency with non-exhaustive examples ((primary immunodeficiency) OR (advanced human immunodeficiency virus infection))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis."} ;; "cystic fibrosis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_diagnosis_of_cystic_fibrosis_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cystic fibrosis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy)."} ;; "malignancy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignancy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_cardiac_defect_known_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac defect that is known (documented or confirmed).","when_to_set_to_false":"Set to false if the patient currently does not have a known cardiac defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known cardiac defect.","meaning":"Boolean indicating whether the patient currently has a known cardiac defect."} ;; "the patient has known cardiac defect"
(declare-const patient_has_finding_of_lung_defect_known_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lung defect that is known (documented or confirmed).","when_to_set_to_false":"Set to false if the patient currently does not have a known lung defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known lung defect.","meaning":"Boolean indicating whether the patient currently has a known lung defect."} ;; "the patient has known lung defect"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_cardiac_defect_known_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known cardiac defect."

(assert
(! (not patient_has_finding_of_lung_defect_known_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known lung defect."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bronchiectasis.","meaning":"Boolean indicating whether the patient currently has bronchiectasis."} ;; "bronchiectasis"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_finding_of_bronchiectasis_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bronchiectasis."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_pneumonia_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of pneumonia at any time within the past six months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of pneumonia at any time within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of pneumonia within the past six months.","meaning":"Boolean indicating whether the patient has had a diagnosis of pneumonia within the past six months."} ;; "previous pneumonia in the past six months"
(declare-const patient_has_diagnosis_of_abscess_of_lung_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of lung abscess at any time within the past six months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of lung abscess at any time within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of lung abscess within the past six months.","meaning":"Boolean indicating whether the patient has had a diagnosis of lung abscess within the past six months."} ;; "previous lung abscess in the past six months"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_diagnosis_of_pneumonia_inthepast6months)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous pneumonia in the past six months."

(assert
  (! (not patient_has_diagnosis_of_abscess_of_lung_inthepast6months)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous lung abscess in the past six months."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_condition_requiring_treatment_with_immune_suppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a condition that requires treatment with an immune suppressant.","when_to_set_to_false":"Set to false if the patient currently does not have a condition that requires treatment with an immune suppressant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a condition that requires treatment with an immune suppressant.","meaning":"Boolean indicating whether the patient currently has a condition that requires treatment with an immune suppressant."} ;; "condition requiring treatment with immune suppressant"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_condition_requiring_treatment_with_immune_suppressant_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has condition requiring treatment with immune suppressant."
