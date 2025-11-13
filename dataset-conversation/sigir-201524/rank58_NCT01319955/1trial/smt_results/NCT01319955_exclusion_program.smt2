;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_chronic_disease_of_respiratory_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of chronic disease of the respiratory system at any time in their history (including currently).","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of chronic disease of the respiratory system at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of chronic disease of the respiratory system.","meaning":"Boolean indicating whether the patient has ever been diagnosed with a chronic disease of the respiratory system."} ;; "chronic respiratory illness"
(declare-const patient_has_diagnosis_of_chronic_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of chronic heart disease at any time in their history (including currently).","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of chronic heart disease at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of chronic heart disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with chronic heart disease."} ;; "chronic cardiac illness"
(declare-const patient_has_diagnosis_of_chronic_nervous_system_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of chronic nervous system disorder at any time in their history (including currently).","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of chronic nervous system disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of chronic nervous system disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with chronic nervous system disorder."} ;; "chronic neurological illness"

;; Additional variable for non-exhaustive example (seizure disorder)
(declare-const patient_has_diagnosis_of_seizure_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of seizure disorder at any time in their history (including currently).","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of seizure disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of seizure disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with seizure disorder."} ;; "seizure disorder (non-exhaustive example of chronic neurological illness)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive example: seizure disorder implies chronic neurological illness
(assert
(! (=> patient_has_diagnosis_of_seizure_disorder_inthehistory
      patient_has_diagnosis_of_chronic_nervous_system_disorder_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (seizure disorder)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_disease_of_respiratory_system_inthehistory)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known chronic respiratory illness."

(assert
(! (not patient_has_diagnosis_of_chronic_heart_disease_inthehistory)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known chronic cardiac illness."

(assert
(! (not patient_has_diagnosis_of_chronic_nervous_system_disorder_inthehistory)
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known chronic neurological illness with non-exhaustive examples (seizure disorder)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_nutritional_marasmus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of nutritional marasmus (severe malnutrition).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of nutritional marasmus (severe malnutrition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nutritional marasmus (severe malnutrition).","meaning":"Boolean indicating whether the patient currently has nutritional marasmus (severe malnutrition)."} ;; "severely malnourished"
(declare-const patient_requires_hospitalisation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires hospitalisation for any reason.","when_to_set_to_false":"Set to false if the patient currently does not require hospitalisation for any reason.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires hospitalisation for any reason.","meaning":"Boolean indicating whether the patient currently requires hospitalisation for any reason."} ;; "requires hospitalisation for any other reason"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_nutritional_marasmus_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is severely malnourished."

(assert
(! (not patient_requires_hospitalisation_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires hospitalisation for any other reason."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_suspicion_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected of having tuberculosis.","when_to_set_to_false":"Set to false if the patient is currently not suspected of having tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected of having tuberculosis.","meaning":"Boolean indicating whether the patient is currently suspected of having tuberculosis."} ;; "the patient is suspected of having tuberculosis (World Health Organization guidelines)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_suspicion_of_tuberculosis_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected of having tuberculosis (World Health Organization guidelines)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_allergy_to_egg_protein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented to have an allergy to egg protein.","when_to_set_to_false":"Set to false if the patient is currently documented not to have an allergy to egg protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to egg protein.","meaning":"Boolean indicating whether the patient currently has an allergy to egg protein."} ;; "egg allergy"
(declare-const patient_has_finding_of_allergy_to_egg_protein_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to egg protein is known (documented or confirmed).","when_to_set_to_false":"Set to false if the patient's allergy to egg protein is not known (not documented or not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to egg protein is known.","meaning":"Boolean indicating whether the patient's allergy to egg protein is known (documented or confirmed)."} ;; "known to have egg allergy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergy_to_egg_protein_now@@known
      patient_has_finding_of_allergy_to_egg_protein_now)
    :named REQ3_AUXILIARY0)) ;; "known to have egg allergy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_allergy_to_egg_protein_now@@known)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is known to have egg allergy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const parents_of_patient_withhold_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the parents of the patient are currently withholding consent.","when_to_set_to_false":"Set to false if the parents of the patient are currently not withholding consent (i.e., have given consent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parents of the patient are currently withholding consent.","meaning":"Boolean indicating whether the parents of the patient are currently withholding consent."} ;; "the parents of the patient withhold consent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not parents_of_patient_withhold_consent_now)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the parents of the patient withhold consent."
