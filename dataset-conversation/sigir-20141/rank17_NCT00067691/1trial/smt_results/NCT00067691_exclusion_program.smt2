;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_acupuncture_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone acupuncture at any time prior to the present (i.e., any time in the patient's history).","when_to_set_to_false":"Set to false if the patient has never undergone acupuncture at any time prior to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone acupuncture in the past.","meaning":"Boolean indicating whether the patient has ever undergone acupuncture at any time in the past."} ;; "The patient is excluded if the patient has had prior acupuncture."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_acupuncture_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior acupuncture."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has obesity.","when_to_set_to_false":"Set to false if the patient currently does not have obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} ;; "obesity"
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"
(declare-const patient_has_finding_of_sarcoid_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sarcoid disease.","when_to_set_to_false":"Set to false if the patient currently does not have sarcoid disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sarcoid disease.","meaning":"Boolean indicating whether the patient currently has sarcoid disease."} ;; "sarcoid disease"
(declare-const patient_has_other_condition_suspected_of_causing_shortness_of_breath_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other condition suspected of causing shortness of breath, not limited to congestive heart failure, sarcoid disease, pneumonia, or obesity.","when_to_set_to_false":"Set to false if the patient currently does not have any other condition suspected of causing shortness of breath.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other condition suspected of causing shortness of breath.","meaning":"Boolean indicating whether the patient currently has any other condition suspected of causing shortness of breath, not limited to congestive heart failure, sarcoid disease, pneumonia, or obesity."} ;; "other conditions suspected of causing shortness of breath"
(declare-const patient_has_suspicion_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have dyspnea (shortness of breath).","when_to_set_to_false":"Set to false if the patient is currently not suspected to have dyspnea (shortness of breath).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have dyspnea.","meaning":"Boolean indicating whether the patient is currently suspected to have dyspnea (shortness of breath)."} ;; "shortness of breath"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_congestive_heart_failure_now
           patient_has_finding_of_sarcoid_disease_now
           patient_has_finding_of_pneumonia_now
           patient_has_finding_of_obesity_now)
       patient_has_other_condition_suspected_of_causing_shortness_of_breath_now)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((congestive heart failure) OR (sarcoid disease) OR (pneumonia) OR (obesity))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_other_condition_suspected_of_causing_shortness_of_breath_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other conditions suspected of causing shortness of breath with non-exhaustive examples ((congestive heart failure) OR (sarcoid disease) OR (pneumonia) OR (obesity))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_deformity_of_chest_wall_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a deformity of the chest wall.","when_to_set_to_false":"Set to false if the patient currently does not have a deformity of the chest wall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a deformity of the chest wall.","meaning":"Boolean indicating whether the patient currently has a deformity of the chest wall."} ;; "chest wall deformity"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (not patient_has_finding_of_deformity_of_chest_wall_now))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has no chest wall deformity."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_myoneural_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of neuromuscular disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of neuromuscular disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of neuromuscular disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of neuromuscular disorder."} ;; "neuromuscular disorders"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_myoneural_disorder_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neuromuscular disorders."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_pulmonary_vascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary vascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary vascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary vascular disease.","meaning":"Boolean indicating whether the patient currently has pulmonary vascular disease."} ;; "The patient is excluded if the patient has pulmonary vascular disease."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_pulmonary_vascular_disease_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary vascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anemia.","meaning":"Boolean indicating whether the patient currently has anemia."} ;; "anemia"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_anemia_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anemia."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_uncontrolled_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncontrolled pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncontrolled pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled pain.","meaning":"Boolean indicating whether the patient currently has uncontrolled pain."} ;; "uncontrolled pain"
(declare-const patient_has_finding_of_uncontrolled_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncontrolled infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncontrolled infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled infection.","meaning":"Boolean indicating whether the patient currently has uncontrolled infection."} ;; "uncontrolled infection"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_uncontrolled_pain_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled pain."

(assert
  (! (not patient_has_finding_of_uncontrolled_infection_now)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled infection."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart valve dysfunction (heart valve disorder).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart valve dysfunction (heart valve disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart valve dysfunction (heart valve disorder).","meaning":"Boolean indicating whether the patient currently has heart valve dysfunction (heart valve disorder)."} ;; "heart valve dysfunction"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_heart_valve_disorder_now)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart valve dysfunction."
