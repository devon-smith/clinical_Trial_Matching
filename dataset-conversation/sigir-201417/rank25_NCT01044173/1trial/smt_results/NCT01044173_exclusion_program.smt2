;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_can_undergo_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo magnetic resonance imaging (i.e., has no contraindications to MRI).","when_to_set_to_false":"Set to false if the patient currently cannot undergo magnetic resonance imaging due to any contraindications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo magnetic resonance imaging.","meaning":"Boolean indicating whether the patient can currently undergo magnetic resonance imaging (MRI)."} ;; "magnetic resonance imaging"
(declare-const patient_has_contraindication_to_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to undergoing magnetic resonance imaging (MRI).","when_to_set_to_false":"Set to false if the patient currently has no contraindications to undergoing magnetic resonance imaging (MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to undergoing magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient currently has any contraindication to undergoing magnetic resonance imaging (MRI)."} ;; "contraindications to magnetic resonance imaging"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Contraindication to MRI means cannot undergo MRI, and vice versa
(assert
(! (= patient_has_contraindication_to_magnetic_resonance_imaging_now
    (not patient_can_undergo_magnetic_resonance_imaging_now))
:named REQ0_AUXILIARY0)) ;; "contraindications to magnetic resonance imaging" <-> "cannot undergo magnetic resonance imaging"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_contraindication_to_magnetic_resonance_imaging_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindications to magnetic resonance imaging."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_suspicion_of_vascular_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have a vascular disorder.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have a vascular disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have a vascular disorder.","meaning":"Boolean indicating whether the patient currently has suspicion of a vascular disorder."} ;; "vascular disease"
(declare-const patient_has_suspicion_of_vascular_disorder_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have an acute vascular disorder.","when_to_set_to_false":"Set to false if the patient is currently suspected to have a vascular disorder but it is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspicion of vascular disorder is acute.","meaning":"Boolean indicating whether the suspicion of vascular disorder is acute."} ;; "acute vascular disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_suspicion_of_vascular_disorder_now@@acute
      patient_has_suspicion_of_vascular_disorder_now)
:named REQ1_AUXILIARY0)) ;; "acute vascular disease" implies "vascular disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_suspicion_of_vascular_disorder_now@@acute)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspicion of acute vascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure (cardiac insufficiency).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure (cardiac insufficiency).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure (cardiac insufficiency).","meaning":"Boolean indicating whether the patient currently has heart failure (cardiac insufficiency)."} ;; "cardiac insufficiency"
(declare-const patient_has_finding_of_heart_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure (cardiac insufficiency) and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has heart failure (cardiac insufficiency) but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart failure (cardiac insufficiency) is severe.","meaning":"Boolean indicating whether the patient's current heart failure (cardiac insufficiency) is severe."} ;; "severe cardiac insufficiency"
(declare-const patient_has_finding_of_respiratory_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory insufficiency (pulmonary insufficiency).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory insufficiency (pulmonary insufficiency).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of respiratory insufficiency (pulmonary insufficiency).","meaning":"Boolean indicating whether the patient currently has respiratory insufficiency (pulmonary insufficiency)."} ;; "pulmonary insufficiency"
(declare-const patient_has_finding_of_respiratory_insufficiency_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory insufficiency (pulmonary insufficiency) and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has respiratory insufficiency (pulmonary insufficiency) but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory insufficiency (pulmonary insufficiency) is severe.","meaning":"Boolean indicating whether the patient's current respiratory insufficiency (pulmonary insufficiency) is severe."} ;; "severe pulmonary insufficiency"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_failure_now@@severe
      patient_has_finding_of_heart_failure_now)
   :named REQ2_AUXILIARY0)) ;; "severe cardiac insufficiency"

(assert
(! (=> patient_has_finding_of_respiratory_insufficiency_now@@severe
      patient_has_finding_of_respiratory_insufficiency_now)
   :named REQ2_AUXILIARY1)) ;; "severe pulmonary insufficiency"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@severe)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe cardiac insufficiency."

(assert
(! (not patient_has_finding_of_respiratory_insufficiency_now@@severe)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe pulmonary insufficiency."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric illness (mental disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric illness (mental disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric illness (mental disorder).","meaning":"Boolean indicating whether the patient currently has a psychiatric illness (mental disorder) now."} ;; "psychiatric illness"
(declare-const patient_has_finding_of_mental_disorder_now@@untreated_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric illness (mental disorder) and the illness is untreated.","when_to_set_to_false":"Set to false if the patient currently has a psychiatric illness (mental disorder) and the illness is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychiatric illness (mental disorder) is untreated.","meaning":"Boolean indicating whether the patient's current psychiatric illness (mental disorder) is untreated."} ;; "untreated psychiatric illness"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@untreated_status
      patient_has_finding_of_mental_disorder_now)
:named REQ4_AUXILIARY0)) ;; "untreated psychiatric illness" implies "psychiatric illness"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now@@untreated_status)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has untreated psychiatric illness."
