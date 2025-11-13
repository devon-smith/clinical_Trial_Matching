;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has immunodeficiency disorder."} ;; "immune deficiency"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_immunodeficiency_disorder_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immune deficiency."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergy_to_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to nonsteroidal anti-inflammatory drugs (NSAIDs).","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to nonsteroidal anti-inflammatory drugs (NSAIDs).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to nonsteroidal anti-inflammatory drugs (NSAIDs).","meaning":"Boolean indicating whether the patient currently has an allergy to nonsteroidal anti-inflammatory drugs (NSAIDs)."} ;; "allergy to nonsteroidal anti-inflammatory drugs"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_allergy_to_non_steroidal_anti_inflammatory_agent_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to nonsteroidal anti-inflammatory drugs."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_exacerbation_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an exacerbation of asthma at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had an exacerbation of asthma at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an exacerbation of asthma in their history.","meaning":"Boolean indicating whether the patient has ever had an exacerbation of asthma in their history."} ;; "exacerbation of asthma"
(declare-const patient_has_finding_of_exacerbation_of_asthma_inthehistory@@caused_by_nonsteroidal_anti_inflammatory_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical exacerbation of asthma was caused by nonsteroidal anti-inflammatory drugs.","when_to_set_to_false":"Set to false if the patient's historical exacerbation of asthma was not caused by nonsteroidal anti-inflammatory drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether nonsteroidal anti-inflammatory drugs caused the patient's historical exacerbation of asthma.","meaning":"Boolean indicating whether the patient's historical exacerbation of asthma was caused by nonsteroidal anti-inflammatory drugs."} ;; "previous exacerbation of asthma due to nonsteroidal anti-inflammatory drugs"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_exacerbation_of_asthma_inthehistory@@caused_by_nonsteroidal_anti_inflammatory_drugs
      patient_has_finding_of_exacerbation_of_asthma_inthehistory)
:named REQ2_AUXILIARY0)) ;; "previous exacerbation of asthma due to nonsteroidal anti-inflammatory drugs"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_exacerbation_of_asthma_inthehistory@@caused_by_nonsteroidal_anti_inflammatory_drugs)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of previous exacerbation of asthma due to nonsteroidal anti-inflammatory drugs."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has fever on the day of the examination.","when_to_set_to_false":"Set to false if the patient does not have fever on the day of the examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has fever on the day of the examination.","meaning":"Boolean indicating whether the patient has fever on the day of the examination."} ;; "fever on the day of the examination"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_fever_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fever on the day of the examination."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_undergoing_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antibiotic therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing antibiotic therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antibiotic therapy."} ;; "currently receiving antibiotic treatment"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_undergoing_antibiotic_therapy_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving antibiotic treatment."
