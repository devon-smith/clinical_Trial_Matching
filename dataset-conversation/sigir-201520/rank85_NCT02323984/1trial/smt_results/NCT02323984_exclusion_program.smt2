;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_american_society_of_anesthesiologists_physical_status_class_4_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has American Society of Anesthesiologists physical status classification IV.","when_to_set_to_false":"Set to false if the patient currently does not have American Society of Anesthesiologists physical status classification IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has American Society of Anesthesiologists physical status classification IV.","meaning":"Boolean indicating whether the patient currently has American Society of Anesthesiologists physical status classification IV."} ;; "American Society of Anesthesiologists physical status classification IV"

(declare-const patient_has_finding_of_american_society_of_anesthesiologists_physical_status_class_5_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has American Society of Anesthesiologists physical status classification V.","when_to_set_to_false":"Set to false if the patient currently does not have American Society of Anesthesiologists physical status classification V.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has American Society of Anesthesiologists physical status classification V.","meaning":"Boolean indicating whether the patient currently has American Society of Anesthesiologists physical status classification V."} ;; "American Society of Anesthesiologists physical status classification V"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_american_society_of_anesthesiologists_physical_status_class_4_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has American Society of Anesthesiologists physical status classification IV."

(assert
  (! (not patient_has_finding_of_american_society_of_anesthesiologists_physical_status_class_5_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has American Society of Anesthesiologists physical status classification V."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_of_vision_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of vision.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of vision.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of vision.","meaning":"Boolean indicating whether the patient currently has a disorder of vision."} ;; "visual disorder"
(declare-const patient_has_finding_of_disorder_of_vision_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of vision and the disorder is severe.","when_to_set_to_false":"Set to false if the patient currently has a disorder of vision but the disorder is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of vision is severe.","meaning":"Boolean indicating whether the patient's current disorder of vision is severe."} ;; "severe visual disorder"
(declare-const patient_has_finding_of_auditory_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an auditory dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have an auditory dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an auditory dysfunction.","meaning":"Boolean indicating whether the patient currently has an auditory dysfunction."} ;; "auditory disorder"
(declare-const patient_has_finding_of_auditory_dysfunction_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an auditory dysfunction and the dysfunction is severe.","when_to_set_to_false":"Set to false if the patient currently has an auditory dysfunction but the dysfunction is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the auditory dysfunction is severe.","meaning":"Boolean indicating whether the patient's current auditory dysfunction is severe."} ;; "severe auditory disorder"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_vision_now@@severe
      patient_has_finding_of_disorder_of_vision_now)
   :named REQ1_AUXILIARY0)) ;; "severe visual disorder" implies "visual disorder"

(assert
(! (=> patient_has_finding_of_auditory_dysfunction_now@@severe
      patient_has_finding_of_auditory_dysfunction_now)
   :named REQ1_AUXILIARY1)) ;; "severe auditory disorder" implies "auditory disorder"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disorder_of_vision_now@@severe)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe visual disorder."

(assert
(! (not patient_has_finding_of_auditory_dysfunction_now@@severe)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe auditory disorder."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_illiteracy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of illiteracy (is illiterate).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of illiteracy (is not illiterate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has illiteracy.","meaning":"Boolean indicating whether the patient currently has illiteracy (is illiterate) at the present time."} ;; "illiterate"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_illiteracy_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is illiterate."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_bipolar_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been clinically diagnosed with bipolar disorder at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been clinically diagnosed with bipolar disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been clinically diagnosed with bipolar disorder.","meaning":"Boolean indicating whether the patient has ever had a clinical diagnosis of bipolar disorder."} ;; "bipolar disorder"
(declare-const patient_has_diagnosis_of_major_depressive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been clinically diagnosed with major depressive disorder at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been clinically diagnosed with major depressive disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been clinically diagnosed with major depressive disorder.","meaning":"Boolean indicating whether the patient has ever had a clinical diagnosis of major depressive disorder."} ;; "major depression"
(declare-const patient_has_diagnosis_of_major_depressive_disorder_inthehistory@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's major depressive disorder is currently uncontrolled.","when_to_set_to_false":"Set to false if the patient's major depressive disorder is currently controlled or in remission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's major depressive disorder is uncontrolled.","meaning":"Boolean indicating whether the patient's major depressive disorder is currently uncontrolled."} ;; "uncontrolled major depression"
(declare-const patient_has_diagnosis_of_major_psychiatric_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been clinically diagnosed with any major psychiatric condition at any time in their history, including but not limited to bipolar disorder, uncontrolled major depression, or schizophrenia.","when_to_set_to_false":"Set to false if the patient has never been clinically diagnosed with any major psychiatric condition at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been clinically diagnosed with any major psychiatric condition.","meaning":"Boolean indicating whether the patient has ever had a clinical diagnosis of a major psychiatric condition."} ;; "major psychiatric condition"
(declare-const patient_has_diagnosis_of_schizophrenia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been clinically diagnosed with schizophrenia at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been clinically diagnosed with schizophrenia at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been clinically diagnosed with schizophrenia.","meaning":"Boolean indicating whether the patient has ever had a clinical diagnosis of schizophrenia."} ;; "schizophrenia"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_bipolar_disorder_inthehistory
           patient_has_diagnosis_of_major_depressive_disorder_inthehistory@@uncontrolled
           patient_has_diagnosis_of_schizophrenia_inthehistory)
        patient_has_diagnosis_of_major_psychiatric_condition_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((bipolar disorder) OR (uncontrolled major depression) OR (schizophrenia))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_major_depressive_disorder_inthehistory@@uncontrolled
       patient_has_diagnosis_of_major_depressive_disorder_inthehistory)
   :named REQ3_AUXILIARY1)) ;; "uncontrolled major depression"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_major_psychiatric_condition_inthehistory)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinically diagnosed major psychiatric condition with non-exhaustive examples ((bipolar disorder) OR (uncontrolled major depression) OR (schizophrenia))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia (any type).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia (any type).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia (any type).","meaning":"Boolean indicating whether the patient currently has dementia (any type) now."} ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@of_alzheimers_type Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dementia is of Alzheimer's type.","when_to_set_to_false":"Set to false if the patient's current dementia is not of Alzheimer's type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dementia is of Alzheimer's type.","meaning":"Boolean indicating whether the patient's current dementia is of Alzheimer's type."} ;; "dementia of Alzheimer's type"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_dementia_now@@of_alzheimers_type
      patient_has_finding_of_dementia_now)
:named REQ4_AUXILIARY0)) ;; "dementia of Alzheimer's type" implies "dementia"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_dementia_now@@of_alzheimers_type)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia of Alzheimer's type."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Parkinson's disease."} ;; "Parkinson disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_parkinson_s_disease_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Parkinson disease."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_multiple_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of multiple sclerosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of multiple sclerosis."} ;; "multiple sclerosis"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_multiple_sclerosis_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has multiple sclerosis."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_vascular_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of vascular dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of vascular dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of vascular dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of vascular dementia."} ;; "vascular dementia"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_vascular_dementia_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has vascular dementia."
