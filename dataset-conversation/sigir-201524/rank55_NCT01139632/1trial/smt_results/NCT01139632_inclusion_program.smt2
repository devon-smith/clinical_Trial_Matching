;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_suspicion_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have coronary arteriosclerosis (coronary artery disease).","when_to_set_to_false":"Set to false if the patient is currently not suspected to have coronary arteriosclerosis (coronary artery disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have coronary arteriosclerosis (coronary artery disease).","meaning":"Boolean indicating whether the patient is currently suspected to have coronary arteriosclerosis (coronary artery disease)."}

(declare-const patient_has_suspicion_of_coronary_arteriosclerosis_now@@risk_level_intermediate Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have coronary arteriosclerosis and is at intermediate risk for this condition.","when_to_set_to_false":"Set to false if the patient is currently suspected to have coronary arteriosclerosis but is not at intermediate risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is at intermediate risk for coronary arteriosclerosis.","meaning":"Boolean indicating whether the patient is at intermediate risk for coronary arteriosclerosis."}

(declare-const patient_has_suspicion_of_coronary_arteriosclerosis_now@@disease_severity_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have coronary arteriosclerosis and the disease is considered significant.","when_to_set_to_false":"Set to false if the patient is currently suspected to have coronary arteriosclerosis but the disease is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is significant.","meaning":"Boolean indicating whether the suspected coronary arteriosclerosis is significant."}

(declare-const patient_has_diagnosis_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chest pain.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chest pain."}

(declare-const patient_has_diagnosis_of_chest_pain_now@@admitted_to_hospital_with_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient was admitted to the hospital with a diagnosis of chest pain.","when_to_set_to_false":"Set to false if the patient was not admitted to the hospital with a diagnosis of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was admitted to the hospital with a diagnosis of chest pain.","meaning":"Boolean indicating whether the patient was admitted to the hospital with a diagnosis of chest pain."}

(declare-const patient_is_undergoing_ct_angiography_of_coronary_arteries_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing computed tomography angiography of coronary arteries.","when_to_set_to_false":"Set to false if the patient is currently not undergoing computed tomography angiography of coronary arteries.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing computed tomography angiography of coronary arteries.","meaning":"Boolean indicating whether the patient is currently undergoing computed tomography angiography of coronary arteries."}

(declare-const patient_is_undergoing_ct_angiography_of_coronary_arteries_now@@procedure_elective Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing computed tomography angiography of coronary arteries and the procedure is elective.","when_to_set_to_false":"Set to false if the patient is currently undergoing computed tomography angiography of coronary arteries and the procedure is not elective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is elective.","meaning":"Boolean indicating whether the procedure is elective."}

(declare-const patient_is_undergoing_ct_angiography_of_coronary_arteries_now@@indication_suspicion_of_coronary_arteriosclerosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing computed tomography angiography of coronary arteries and the procedure is being performed due to suspicion of coronary arteriosclerosis.","when_to_set_to_false":"Set to false if the patient is currently undergoing computed tomography angiography of coronary arteries and the procedure is not being performed due to suspicion of coronary arteriosclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is being performed due to suspicion of coronary arteriosclerosis.","meaning":"Boolean indicating whether the procedure is being performed due to suspicion of coronary arteriosclerosis."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable: "admitted to the hospital with the diagnosis of chest pain"
(assert
  (! (=> patient_has_diagnosis_of_chest_pain_now@@admitted_to_hospital_with_diagnosis
         patient_has_diagnosis_of_chest_pain_now)
     :named REQ0_AUXILIARY0)) ;; "have been admitted to the hospital with the diagnosis of chest pain"

;; Qualifier variable implies stem variable: "procedure is elective"
(assert
  (! (=> patient_is_undergoing_ct_angiography_of_coronary_arteries_now@@procedure_elective
         patient_is_undergoing_ct_angiography_of_coronary_arteries_now)
     :named REQ0_AUXILIARY1)) ;; "be undergoing elective computed tomography coronary angiography"

;; Qualifier variable implies stem variable: "procedure is being performed due to suspicion of coronary arteriosclerosis"
(assert
  (! (=> patient_is_undergoing_ct_angiography_of_coronary_arteries_now@@indication_suspicion_of_coronary_arteriosclerosis
         patient_is_undergoing_ct_angiography_of_coronary_arteries_now)
     :named REQ0_AUXILIARY2)) ;; "due to suspicion of coronary artery disease"

;; Qualifier variable implies stem variable: "intermediate risk for having significant coronary artery disease"
(assert
  (! (=> patient_has_suspicion_of_coronary_arteriosclerosis_now@@risk_level_intermediate
         patient_has_suspicion_of_coronary_arteriosclerosis_now)
     :named REQ0_AUXILIARY3)) ;; "be at intermediate risk for having significant coronary artery disease"

;; Qualifier variable implies stem variable: "significant coronary artery disease"
(assert
  (! (=> patient_has_suspicion_of_coronary_arteriosclerosis_now@@disease_severity_significant
         patient_has_suspicion_of_coronary_arteriosclerosis_now)
     :named REQ0_AUXILIARY4)) ;; "significant coronary artery disease"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: "be at intermediate risk for having significant coronary artery disease"
(assert
  (! (and patient_has_suspicion_of_coronary_arteriosclerosis_now@@risk_level_intermediate
          patient_has_suspicion_of_coronary_arteriosclerosis_now@@disease_severity_significant)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be at intermediate risk for having significant coronary artery disease"

;; Component 1: "have been admitted to the hospital with the diagnosis of chest pain" OR "be undergoing elective computed tomography coronary angiography due to suspicion of coronary artery disease"
(assert
  (! (or patient_has_diagnosis_of_chest_pain_now@@admitted_to_hospital_with_diagnosis
         (and patient_is_undergoing_ct_angiography_of_coronary_arteries_now@@procedure_elective
              patient_is_undergoing_ct_angiography_of_coronary_arteries_now@@indication_suspicion_of_coronary_arteriosclerosis))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have been admitted to the hospital with the diagnosis of chest pain OR be undergoing elective computed tomography coronary angiography due to suspicion of coronary artery disease"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_able_to_provide_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide written informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide written informed consent."} // "the patient must be able to provide written informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_able_to_provide_written_informed_consent_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to provide written informed consent"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain as a clinical finding.","meaning":"Boolean indicating whether the patient currently has chest pain as a clinical finding."} // "have chest pain"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea as a clinical finding.","meaning":"Boolean indicating whether the patient currently has dyspnea as a clinical finding."} // "have dyspnea"
(declare-const patient_has_finding_of_intermittent_arrhythmias_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intermittent arrhythmias.","when_to_set_to_false":"Set to false if the patient currently does not have intermittent arrhythmias.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intermittent arrhythmias.","meaning":"Boolean indicating whether the patient currently has intermittent arrhythmias."} // "have intermittent arrhythmias"
(declare-const patient_has_finding_of_stress_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a stress test at the current time.","when_to_set_to_false":"Set to false if the patient has not undergone a stress test at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a stress test at the current time.","meaning":"Boolean indicating whether the patient has undergone a stress test at the current time."} // "have stress tests"
(declare-const patient_has_finding_of_stress_test_now@@stress_test_result_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current stress test result is negative.","when_to_set_to_false":"Set to false if the patient's current stress test result is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current stress test result is negative.","meaning":"Boolean indicating whether the patient's current stress test result is negative."} // "have negative stress tests"
(declare-const patient_has_finding_of_stress_test_now@@stress_test_result_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current stress test result is positive.","when_to_set_to_false":"Set to false if the patient's current stress test result is not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current stress test result is positive.","meaning":"Boolean indicating whether the patient's current stress test result is positive."} // "have positive stress tests"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_stress_test_now@@stress_test_result_negative
         patient_has_finding_of_stress_test_now)
     :named REQ3_AUXILIARY0)) ;; "have negative stress tests" implies "have stress test"

(assert
  (! (=> patient_has_finding_of_stress_test_now@@stress_test_result_positive
         patient_has_finding_of_stress_test_now)
     :named REQ3_AUXILIARY1)) ;; "have positive stress tests" implies "have stress test"

;; Definition of intermediate risk for significant coronary artery disease
(assert
  (! (= patient_has_suspicion_of_coronary_arteriosclerosis_now@@risk_level_intermediate
        (or
          patient_has_finding_of_chest_pain_now
          (and patient_has_finding_of_dyspnea_now
               patient_has_finding_of_stress_test_now@@stress_test_result_negative)
          (and (not patient_has_finding_of_chest_pain_now)
               patient_has_finding_of_stress_test_now@@stress_test_result_positive)
          (and (not patient_has_finding_of_chest_pain_now)
               (not patient_has_finding_of_stress_test_now@@stress_test_result_positive)
               patient_has_finding_of_intermittent_arrhythmias_now)))
     :named REQ3_AUXILIARY2)) ;; "intermediate risk for having significant coronary artery disease, defined as ..."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_suspicion_of_coronary_arteriosclerosis_now@@risk_level_intermediate
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be at intermediate risk for having significant coronary artery disease"
