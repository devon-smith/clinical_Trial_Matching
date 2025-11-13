;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."}  ;; "have a diagnosis of Alzheimer's disease"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_nincds_adrda_mckhann_drachman_1984 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of Alzheimer's disease was made according to NINCDS-ADRDA criteria (McKhann, Drachman et al. 1984).","when_to_set_to_false":"Set to false if the patient's current diagnosis of Alzheimer's disease was not made according to NINCDS-ADRDA criteria (McKhann, Drachman et al. 1984).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made according to NINCDS-ADRDA criteria.","meaning":"Boolean indicating whether the patient's current diagnosis of Alzheimer's disease was made according to NINCDS-ADRDA criteria (McKhann, Drachman et al. 1984)."}  ;; "according to National Institute of Neurological and Communicative Disorders and Stroke and the Alzheimer's Disease and Related Disorders Association criteria (McKhann, Drachman et al. 1984)"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dubois_2007_typical Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of typical Alzheimer's disease was made according to Dubois B. et al. 2007.","when_to_set_to_false":"Set to false if the patient's current diagnosis of typical Alzheimer's disease was not made according to Dubois B. et al. 2007.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made according to Dubois B. et al. 2007.","meaning":"Boolean indicating whether the patient's current diagnosis of typical Alzheimer's disease was made according to Dubois B. et al. 2007."}  ;; "have a diagnosis of typical Alzheimer's disease (Dubois B. et al. 2007)"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dubois_2007_atypical Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of atypical Alzheimer's disease was made according to Dubois B. et al. 2007.","when_to_set_to_false":"Set to false if the patient's current diagnosis of atypical Alzheimer's disease was not made according to Dubois B. et al. 2007.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made according to Dubois B. et al. 2007.","meaning":"Boolean indicating whether the patient's current diagnosis of atypical Alzheimer's disease was made according to Dubois B. et al. 2007."}  ;; "have a diagnosis of atypical Alzheimer's disease (Dubois B. et al. 2007)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable (diagnosis of Alzheimer's disease)
(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_nincds_adrda_mckhann_drachman_1984
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY0)) ;; If diagnosed according to NINCDS-ADRDA, then must have diagnosis of Alzheimer's disease

(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dubois_2007_typical
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY1)) ;; If diagnosed as typical AD per Dubois 2007, then must have diagnosis of Alzheimer's disease

(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dubois_2007_atypical
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY2)) ;; If diagnosed as atypical AD per Dubois 2007, then must have diagnosis of Alzheimer's disease

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have at least one of the three: 
;; (diagnosis of AD per NINCDS-ADRDA) OR (diagnosis of typical AD per Dubois 2007) OR (diagnosis of atypical AD per Dubois 2007)
(assert
  (! (or patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_nincds_adrda_mckhann_drachman_1984
         patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dubois_2007_typical
         patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosed_according_to_dubois_2007_atypical)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have a diagnosis of Alzheimer's disease according to NINCDS-ADRDA OR typical AD (Dubois 2007) OR atypical AD (Dubois 2007)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured score if a Mini Mental State Examination score is recorded for the patient now.","when_to_set_to_null":"Set to null if no Mini Mental State Examination score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini Mental State Examination score recorded now."}  ;; "Mini Mental State Examination score recorded now"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 16.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "score at Mini Mental State Examination greater than or equal to 16"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_resides_in_nursing_home_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in a nursing home.","when_to_set_to_false":"Set to false if the patient currently does not reside in a nursing home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in a nursing home.","meaning":"Boolean indicating whether the patient currently resides in a nursing home."}  ;; "the patient must reside in a nursing home"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_resides_in_nursing_home_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must reside in a nursing home"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_beneficiary_of_social_security_scheme_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a beneficiary of a social security scheme.","when_to_set_to_false":"Set to false if the patient is currently not a beneficiary of a social security scheme.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a beneficiary of a social security scheme.","meaning":"Boolean indicating whether the patient is currently a beneficiary of a social security scheme."}  ;; "the patient must be a beneficiary of a social security scheme"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_beneficiary_of_social_security_scheme_now
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be a beneficiary of a social security scheme"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_signed_free_and_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed free and informed consent at the present time.","when_to_set_to_false":"Set to false if the patient has not signed free and informed consent at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed free and informed consent at the present time.","meaning":"Boolean indicating whether the patient has signed free and informed consent at the present time."}  ;; "the patient must have signed free and informed consent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_signed_free_and_informed_consent_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have signed free and informed consent"
