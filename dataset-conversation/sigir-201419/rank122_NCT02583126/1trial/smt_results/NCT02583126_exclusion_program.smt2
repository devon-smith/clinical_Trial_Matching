;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of a mental disorder at any time in the past (prior to the present).","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of a mental disorder prior to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of a mental disorder prior to the present.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a mental disorder at any time in the past."} ;; "previous psychiatric diagnosis"

(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a mental disorder (i.e., at the present time).","when_to_set_to_false":"Set to false if the patient does not currently have a diagnosis of a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a mental disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a mental disorder."} ;; "acute psychiatric diagnosis"

(declare-const patient_has_diagnosis_of_mental_disorder_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a mental disorder is acute (of sudden onset and/or short duration).","when_to_set_to_false":"Set to false if the patient's current diagnosis of a mental disorder is not acute (e.g., chronic or not specified as acute).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current diagnosis of a mental disorder is acute.","meaning":"Boolean indicating whether the patient's current diagnosis of a mental disorder is acute."} ;; "acute psychiatric diagnosis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@acute
       patient_has_diagnosis_of_mental_disorder_now)
   :named REQ0_AUXILIARY0)) ;; "acute psychiatric diagnosis" qualifier implies current psychiatric diagnosis

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_has_diagnosis_of_mental_disorder_inthehistory
            patient_has_diagnosis_of_mental_disorder_now@@acute))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a previous psychiatric diagnosis) OR (the patient has an acute psychiatric diagnosis)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired cognition (cognitive deficit).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired cognition (cognitive deficit).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired cognition (cognitive deficit).","meaning":"Boolean indicating whether the patient currently has impaired cognition (cognitive deficit)."} ;; "cognitive deficit"
(declare-const patient_has_finding_of_mental_deficit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of mental deficit.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of mental deficit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental deficit.","meaning":"Boolean indicating whether the patient currently has a mental deficit."} ;; "mental deficit"
(declare-const patient_has_finding_of_impaired_functioning_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of impaired functioning.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of impaired functioning.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired functioning.","meaning":"Boolean indicating whether the patient currently has impaired functioning."} ;; "impaired functioning"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_impaired_cognition_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cognitive deficit."

(assert
  (! (not patient_has_finding_of_mental_deficit_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a mental deficit."

(assert
  (! (not patient_has_finding_of_impaired_functioning_now)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has impaired functioning."
