;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const ecog_performance_status_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's current ECOG performance status if it is documented.","when_to_set_to_null":"Set to null if the patient's current ECOG performance status is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current ECOG performance status as an integer."} ;; "Eastern Cooperative Oncology Group (ECOG) performance status = 4"
(declare-const patient_has_finding_of_general_health_poor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poor general health status.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poor general health status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor general health status.","meaning":"Boolean indicating whether the patient currently has poor general health status."} ;; "poor general status"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: poor general status is defined as ECOG performance status = 4
(assert
(! (= patient_has_finding_of_general_health_poor_now
    (= ecog_performance_status_value_recorded_now_withunit_integer 4))
:named REQ0_AUXILIARY0)) ;; "defined as Eastern Cooperative Oncology Group (ECOG) performance status = 4"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_general_health_poor_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poor general status (defined as Eastern Cooperative Oncology Group (ECOG) performance status = 4)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dysphagia.","meaning":"Boolean indicating whether the patient currently has dysphagia."} ;; "dysphagia"
(declare-const patient_has_finding_of_dysphagia_now@@not_caused_by_esophageal_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dysphagia is NOT caused by esophageal cancer.","when_to_set_to_false":"Set to false if the patient's dysphagia is caused by esophageal cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dysphagia is caused by esophageal cancer.","meaning":"Boolean indicating whether the patient's dysphagia is NOT caused by esophageal cancer."} ;; "dysphagia that is NOT caused by esophageal cancer"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_dysphagia_now@@not_caused_by_esophageal_cancer
      patient_has_finding_of_dysphagia_now)
   :named REQ1_AUXILIARY0)) ;; "dysphagia that is NOT caused by esophageal cancer" implies "dysphagia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_dysphagia_now@@not_caused_by_esophageal_cancer)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dysphagia that is NOT caused by esophageal cancer."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_noncooperative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently noncooperative.","when_to_set_to_false":"Set to false if the patient is currently cooperative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently noncooperative.","meaning":"Boolean indicating whether the patient is currently noncooperative."} ;; "the patient is noncooperative"
(declare-const patient_provides_authorization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently provides authorization.","when_to_set_to_false":"Set to false if the patient currently does not provide authorization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently provides authorization.","meaning":"Boolean indicating whether the patient currently provides authorization."} ;; "the patient does NOT provide authorization"
(declare-const patient_provides_signature_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently provides signature.","when_to_set_to_false":"Set to false if the patient currently does not provide signature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently provides signature.","meaning":"Boolean indicating whether the patient currently provides signature."} ;; "the patient does NOT provide signature"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: The patient is excluded if (the patient is noncooperative) OR ((the patient does NOT provide authorization) AND (the patient does NOT provide signature)).
(assert
(! (not (or patient_is_noncooperative_now
            (and (not patient_provides_authorization_now)
                 (not patient_provides_signature_now))))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is noncooperative) OR ((the patient does NOT provide authorization) AND (the patient does NOT provide signature))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (cancer)."} ;; "cancer"
(declare-const superior_border_of_patient_cancer_position_relative_to_seventh_cervical_vertebra Real) ;; {"when_to_set_to_value":"Set to the measured or documented anatomical position of the superior border of the patient's cancer relative to the seventh cervical vertebra, in vertebral levels or millimeters.","when_to_set_to_null":"Set to null if the anatomical position of the superior border of the patient's cancer relative to the seventh cervical vertebra is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the anatomical position of the superior border of the patient's cancer relative to the seventh cervical vertebra."} ;; "the superior border of the patient's cancer is higher than the seventh cervical vertebra"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (and patient_has_finding_of_malignant_neoplastic_disease_now
               (> superior_border_of_patient_cancer_position_relative_to_seventh_cervical_vertebra 0)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the superior border of the patient's cancer is higher than the seventh cervical vertebra."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_malignant_tumor_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant tumor of the esophagus (esophageal carcinoma).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant tumor of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant tumor of the esophagus.","meaning":"Boolean indicating whether the patient currently has a malignant tumor of the esophagus."} ;; "esophageal carcinoma"
(declare-const patient_has_finding_of_ulcerative_esophageal_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ulcerative esophageal carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have ulcerative esophageal carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ulcerative esophageal carcinoma.","meaning":"Boolean indicating whether the patient currently has ulcerative esophageal carcinoma."} ;; "ulcerative esophageal carcinoma"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_ulcerative_esophageal_carcinoma_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ulcerative esophageal carcinoma."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_esophageal_fistula_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of esophageal fistula.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of esophageal fistula.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of esophageal fistula.","meaning":"Boolean indicating whether the patient currently has an esophageal fistula."} ;; "esophageal fistulas"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_esophageal_fistula_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has esophageal fistulas."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_white_blood_cell_number_finding_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current white blood cell count (in number per cubic millimeter) is available for the patient.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current white blood cell count in number per cubic millimeter."} ;; "white blood cell count"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (< patient_white_blood_cell_number_finding_value_recorded_now_withunit_per_cubic_millimeter 3000))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's white blood cell count < 3000 per cubic millimeter."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hepatic failure.","meaning":"Boolean indicating whether the patient currently has hepatic failure."} ;; "hepatic inadequacy"
(declare-const patient_has_finding_of_hepatic_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe hepatic failure.","when_to_set_to_false":"Set to false if the patient currently has hepatic failure but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic failure is severe.","meaning":"Boolean indicating whether the patient's hepatic failure is severe."} ;; "severe hepatic inadequacy"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal inadequacy"
(declare-const patient_has_finding_of_renal_impairment_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe renal impairment.","when_to_set_to_false":"Set to false if the patient currently has renal impairment but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal impairment is severe.","meaning":"Boolean indicating whether the patient's renal impairment is severe."} ;; "severe renal inadequacy"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hepatic_failure_now@@severe
      patient_has_finding_of_hepatic_failure_now)
   :named REQ7_AUXILIARY0)) ;; "severe hepatic inadequacy" implies "hepatic inadequacy"

(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severe
      patient_has_finding_of_renal_impairment_now)
   :named REQ7_AUXILIARY1)) ;; "severe renal inadequacy" implies "renal inadequacy"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_hepatic_failure_now@@severe)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hepatic inadequacy."

(assert
(! (not patient_has_finding_of_renal_impairment_now@@severe)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal inadequacy."
