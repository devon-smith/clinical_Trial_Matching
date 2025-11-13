;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; "Boolean clinical finding indicating whether the patient currently has a diagnosis of Alzheimer's disease." {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."} ;; "To be included, the patient must have a diagnosis of mild Alzheimer's disease (diagnosed by the referring clinician of the patient per recent National Institutes of Aging-Alzheimer's Association criteria (McKhann et al., 2011))."
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_by_referring_clinician Bool) ;; "Boolean clinical finding indicating whether the patient currently has a diagnosis of Alzheimer's disease and the diagnosis was made by the referring clinician of the patient." {"when_to_set_to_true":"Set to true if the patient's diagnosis of Alzheimer's disease was made by the referring clinician.","when_to_set_to_false":"Set to false if the patient's diagnosis of Alzheimer's disease was not made by the referring clinician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the referring clinician made the diagnosis.","meaning":"Boolean indicating whether the patient's Alzheimer's disease diagnosis was made by the referring clinician."} ;; "diagnosed by the referring clinician of the patient"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_per_recent_national_institutes_of_aging_alzheimer_s_association_criteria_mckhann_et_al_2011 Bool) ;; "Boolean clinical finding indicating whether the patient currently has a diagnosis of Alzheimer's disease and the diagnosis was made per recent National Institutes of Aging-Alzheimer's Association criteria (McKhann et al., 2011)." {"when_to_set_to_true":"Set to true if the patient's diagnosis of Alzheimer's disease was made per recent National Institutes of Aging-Alzheimer's Association criteria (McKhann et al., 2011).","when_to_set_to_false":"Set to false if the patient's diagnosis of Alzheimer's disease was not made per these criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made per these criteria.","meaning":"Boolean indicating whether the patient's Alzheimer's disease diagnosis was made per recent National Institutes of Aging-Alzheimer's Association criteria (McKhann et al., 2011)."} ;; "per recent National Institutes of Aging-Alzheimer's Association criteria (McKhann et al., 2011)"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@mild_severity Bool) ;; "Boolean clinical finding indicating whether the patient currently has a diagnosis of Alzheimer's disease and the disease is mild in severity." {"when_to_set_to_true":"Set to true if the patient's Alzheimer's disease is mild in severity.","when_to_set_to_false":"Set to false if the patient's Alzheimer's disease is not mild in severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Alzheimer's disease is mild in severity.","meaning":"Boolean indicating whether the patient's Alzheimer's disease is mild in severity."} ;; "mild Alzheimer's disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_by_referring_clinician
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY0)) ;; "diagnosed by the referring clinician of the patient"

(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_per_recent_national_institutes_of_aging_alzheimer_s_association_criteria_mckhann_et_al_2011
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY1)) ;; "per recent National Institutes of Aging-Alzheimer's Association criteria (McKhann et al., 2011)"

(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@mild_severity
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY2)) ;; "mild Alzheimer's disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_by_referring_clinician
          patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_per_recent_national_institutes_of_aging_alzheimer_s_association_criteria_mckhann_et_al_2011
          patient_has_diagnosis_of_alzheimer_s_disease_now@@mild_severity)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of mild Alzheimer's disease (diagnosed by the referring clinician of the patient per recent National Institutes of Aging-Alzheimer's Association criteria (McKhann et al., 2011))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "age ≥ 50 years AND age ≤ 90 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be age ≥ 50 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 50)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≥ 50 years."

;; Component 1: To be included, the patient must be age ≤ 90 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 90)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≤ 90 years."
