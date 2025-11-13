;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_allergy_to_paracetamol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to paracetamol.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to paracetamol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to paracetamol.","meaning":"Boolean indicating whether the patient currently has an allergy to paracetamol."} ;; "allergic to paracetamol"
(declare-const patient_has_finding_of_allergy_to_antipyretic_other_than_paracetamol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to any antipyretic other than paracetamol.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to any antipyretic other than paracetamol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to any antipyretic other than paracetamol.","meaning":"Boolean indicating whether the patient currently has an allergy to any antipyretic other than paracetamol."} ;; "allergic to any other antipyretic"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_has_finding_of_allergy_to_paracetamol_now
            patient_has_finding_of_allergy_to_antipyretic_other_than_paracetamol_now))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is allergic to paracetamol) OR (the patient is allergic to any other antipyretic)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_underlying_immunocompromised_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any underlying immunocompromised condition.","when_to_set_to_false":"Set to false if the patient currently does not have any underlying immunocompromised condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any underlying immunocompromised condition.","meaning":"Boolean indicating whether the patient currently has any underlying immunocompromised condition."} ;; "the patient has any underlying immunocompromised condition"
(declare-const patient_has_underlying_immunocompromised_condition_now@@underlying Bool) ;; {"when_to_set_to_true":"Set to true if the immunocompromised condition is underlying (pre-existing or chronic).","when_to_set_to_false":"Set to false if the immunocompromised condition is not underlying (not pre-existing or not chronic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunocompromised condition is underlying.","meaning":"Boolean indicating whether the immunocompromised condition is underlying (pre-existing or chronic)."} ;; "underlying immunocompromised condition"
(declare-const patient_is_exposed_to_immunosuppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to any immunosuppressant agent.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to any immunosuppressant agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to any immunosuppressant agent.","meaning":"Boolean indicating whether the patient is currently exposed to (receiving) any immunosuppressant agent."} ;; "the patient is receiving any immunosuppressive agent"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_underlying_immunocompromised_condition_now@@underlying
      patient_has_underlying_immunocompromised_condition_now)
:named REQ1_AUXILIARY0)) ;; "underlying immunocompromised condition"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have any underlying immunocompromised condition
(assert
(! (not patient_has_underlying_immunocompromised_condition_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has any underlying immunocompromised condition"

;; Exclusion: patient must NOT be receiving any immunosuppressive agent
(assert
(! (not patient_is_exposed_to_immunosuppressant_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is receiving any immunosuppressive agent"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_chronic_liver_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with chronic liver disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with chronic liver disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with chronic liver disease.","meaning":"Boolean indicating whether the patient has any history of chronic liver disease."} ;; "any history of chronic liver disease"

(declare-const patient_has_diagnosis_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of lung disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of lung disease."} ;; "any active lung disease"

(declare-const patient_has_diagnosis_of_disorder_of_lung_now@@requires_regular_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current lung disease requires regular medication.","when_to_set_to_false":"Set to false if the patient's current lung disease does not require regular medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current lung disease requires regular medication.","meaning":"Boolean indicating whether the patient's current lung disease requires regular medication."} ;; "lung disease requiring regular medication"

(declare-const patient_has_diagnosis_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart disease."} ;; "any active heart disease"

(declare-const patient_has_diagnosis_of_heart_disease_now@@requires_regular_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart disease requires regular medication.","when_to_set_to_false":"Set to false if the patient's current heart disease does not require regular medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart disease requires regular medication.","meaning":"Boolean indicating whether the patient's current heart disease requires regular medication."} ;; "heart disease requiring regular medication"

(declare-const patient_has_diagnosis_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of kidney disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of kidney disease."} ;; "any active renal disease"

(declare-const patient_has_diagnosis_of_kidney_disease_now@@requires_regular_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current kidney disease requires regular medication.","when_to_set_to_false":"Set to false if the patient's current kidney disease does not require regular medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current kidney disease requires regular medication.","meaning":"Boolean indicating whether the patient's current kidney disease requires regular medication."} ;; "renal disease requiring regular medication"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disorder_of_lung_now@@requires_regular_medication
      patient_has_diagnosis_of_disorder_of_lung_now)
:named REQ2_AUXILIARY0)) ;; "active lung disease requiring regular medication"

(assert
(! (=> patient_has_diagnosis_of_heart_disease_now@@requires_regular_medication
      patient_has_diagnosis_of_heart_disease_now)
:named REQ2_AUXILIARY1)) ;; "active heart disease requiring regular medication"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_now@@requires_regular_medication
      patient_has_diagnosis_of_kidney_disease_now)
:named REQ2_AUXILIARY2)) ;; "active renal disease requiring regular medication"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_liver_disease_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "any history of chronic liver disease"

(assert
(! (not patient_has_diagnosis_of_disorder_of_lung_now@@requires_regular_medication)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "any active lung disease requiring regular medication"

(assert
(! (not patient_has_diagnosis_of_heart_disease_now@@requires_regular_medication)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "any active heart disease requiring regular medication"

(assert
(! (not patient_has_diagnosis_of_kidney_disease_now@@requires_regular_medication)
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "any active renal disease requiring regular medication"
