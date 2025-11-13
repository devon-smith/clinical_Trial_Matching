;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_reports_written_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient reports having provided written consent.","when_to_set_to_false":"Set to false if the patient reports not having provided written consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient reports having provided written consent.","meaning":"Boolean indicating whether the patient reports having provided written consent."}  ;; "To be included, the patient must report written consent."
(declare-const patient_reports_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient reports having provided informed consent.","when_to_set_to_false":"Set to false if the patient reports not having provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient reports having provided informed consent.","meaning":"Boolean indicating whether the patient reports having provided informed consent."}  ;; "To be included, the patient must report informed consent."
(declare-const patient_reports_signed_consent_by_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient reports that the signed consent was provided by the patient.","when_to_set_to_false":"Set to false if the patient reports that the signed consent was not provided by the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient reports that the signed consent was provided by the patient.","meaning":"Boolean indicating whether the patient reports that the signed consent was provided by the patient."}  ;; "To be included, the patient must report signed consent by the patient and a trusted person."
(declare-const patient_reports_signed_consent_by_trusted_person Bool) ;; {"when_to_set_to_true":"Set to true if the patient reports that the signed consent was provided by a trusted person.","when_to_set_to_false":"Set to false if the patient reports that the signed consent was not provided by a trusted person.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient reports that the signed consent was provided by a trusted person.","meaning":"Boolean indicating whether the patient reports that the signed consent was provided by a trusted person."}  ;; "To be included, the patient must report signed consent by the patient and a trusted person."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_reports_written_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must report written consent."

(assert
  (! patient_reports_informed_consent
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must report informed consent."

(assert
  (! (and patient_reports_signed_consent_by_patient
          patient_reports_signed_consent_by_trusted_person)
     :named REQ0_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must report signed consent by the patient and a trusted person."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_beneficiary_of_social_security_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a beneficiary of a social security system.","when_to_set_to_false":"Set to false if the patient is currently not a beneficiary of a social security system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a beneficiary of a social security system.","meaning":"Boolean indicating whether the patient is currently a beneficiary of a social security system."}  ;; "To be included, the patient must be (a member of a social security system OR a beneficiary of a social security system)."
(declare-const patient_is_member_of_social_security_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a member of a social security system.","when_to_set_to_false":"Set to false if the patient is currently not a member of a social security system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a member of a social security system.","meaning":"Boolean indicating whether the patient is currently a member of a social security system."}  ;; "To be included, the patient must be (a member of a social security system OR a beneficiary of a social security system)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_is_member_of_social_security_system_now
         patient_is_beneficiary_of_social_security_system_now)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be (a member of a social security system OR a beneficiary of a social security system)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 55 years AND aged ≤ 85 years"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be aged ≥ 55 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 55)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 55 years."

;; Component 1: To be included, the patient must be aged ≤ 85 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 85)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 85 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."}  ;; "Alzheimer disease"
(declare-const patient_has_diagnosis_of_frontotemporal_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of frontotemporal dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of frontotemporal dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of frontotemporal dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of frontotemporal dementia."}  ;; "frontotemporal dementia"
(declare-const patient_has_diagnosis_of_diffuse_lewy_body_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia with Lewy bodies (diffuse Lewy body disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia with Lewy bodies (diffuse Lewy body disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia with Lewy bodies (diffuse Lewy body disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia with Lewy bodies (diffuse Lewy body disease)."}  ;; "dementia with Lewy bodies"
(declare-const patient_has_diagnosis_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Parkinson's disease."}  ;; "Parkinson disease"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have (Alzheimer disease OR frontotemporal dementia OR dementia with Lewy bodies OR Parkinson disease).
(assert
  (! (or patient_has_diagnosis_of_alzheimer_s_disease_now
         patient_has_diagnosis_of_frontotemporal_dementia_now
         patient_has_diagnosis_of_diffuse_lewy_body_disease_now
         patient_has_diagnosis_of_parkinson_s_disease_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (Alzheimer disease OR frontotemporal dementia OR dementia with Lewy bodies OR Parkinson disease)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_hydrocephalus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hydrocephalus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hydrocephalus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hydrocephalus.","meaning":"Boolean indicating whether the patient currently has hydrocephalus."}  ;; "To be included, the patient must have chronic adult hydrocephalus (HCA) requiring depletion lumbar puncture (PL)."
(declare-const patient_has_finding_of_hydrocephalus_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hydrocephalus is chronic.","when_to_set_to_false":"Set to false if the patient's hydrocephalus is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hydrocephalus is chronic.","meaning":"Boolean indicating whether the patient's hydrocephalus is chronic."}  ;; "chronic adult hydrocephalus"
(declare-const patient_has_finding_of_hydrocephalus_now@@adult_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hydrocephalus occurs in adulthood (adult-onset).","when_to_set_to_false":"Set to false if the patient's hydrocephalus does not occur in adulthood.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hydrocephalus occurs in adulthood.","meaning":"Boolean indicating whether the patient's hydrocephalus occurs in adulthood (adult-onset)."}  ;; "chronic adult hydrocephalus"
(declare-const patient_has_finding_of_hydrocephalus_now@@requires_depletion_lumbar_puncture Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hydrocephalus requires depletion lumbar puncture.","when_to_set_to_false":"Set to false if the patient's hydrocephalus does not require depletion lumbar puncture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hydrocephalus requires depletion lumbar puncture.","meaning":"Boolean indicating whether the patient's hydrocephalus requires depletion lumbar puncture."}  ;; "hydrocephalus requiring depletion lumbar puncture"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_hydrocephalus_now@@chronic
         patient_has_finding_of_hydrocephalus_now)
     :named REQ4_AUXILIARY0)) ;; "chronic hydrocephalus" implies hydrocephalus

(assert
  (! (=> patient_has_finding_of_hydrocephalus_now@@adult_onset
         patient_has_finding_of_hydrocephalus_now)
     :named REQ4_AUXILIARY1)) ;; "adult-onset hydrocephalus" implies hydrocephalus

(assert
  (! (=> patient_has_finding_of_hydrocephalus_now@@requires_depletion_lumbar_puncture
         patient_has_finding_of_hydrocephalus_now)
     :named REQ4_AUXILIARY2)) ;; "hydrocephalus requiring depletion lumbar puncture" implies hydrocephalus

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Must have chronic adult hydrocephalus requiring depletion lumbar puncture
(assert
  (! (and patient_has_finding_of_hydrocephalus_now@@chronic
          patient_has_finding_of_hydrocephalus_now@@adult_onset
          patient_has_finding_of_hydrocephalus_now@@requires_depletion_lumbar_puncture)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have chronic adult hydrocephalus (HCA) requiring depletion lumbar puncture (PL)."
