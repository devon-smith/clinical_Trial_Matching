;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_severely_ill_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently severely ill.","when_to_set_to_false":"Set to false if the patient is currently not severely ill.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently severely ill.","meaning":"Boolean indicating whether the patient is currently severely ill."} ;; "the patient is severely ill"
(declare-const patient_is_undergoing_admission_to_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to an intensive care unit (ICU).","when_to_set_to_false":"Set to false if the patient is currently not admitted to an intensive care unit (ICU).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to an intensive care unit (ICU).","meaning":"Boolean indicating whether the patient is currently admitted to an intensive care unit (ICU)."} ;; "hospitalized in an intensive care unit"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_is_severely_ill_now
             patient_is_undergoing_admission_to_intensive_care_unit_now))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is severely ill AND the patient is hospitalized in an intensive care unit."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_pleural_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pleural effusion.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pleural effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleural effusion.","meaning":"Boolean indicating whether the patient currently has pleural effusion."} ;; "pleural effusion"
(declare-const patient_has_finding_of_pleural_effusion_now@@treated_with_chest_drainage Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pleural effusion is being treated with chest drainage.","when_to_set_to_false":"Set to false if the patient's current pleural effusion is not being treated with chest drainage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pleural effusion is being treated with chest drainage.","meaning":"Boolean indicating whether the patient's current pleural effusion is being treated with chest drainage."} ;; "pleural effusion that is treated with chest drainage"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_pleural_effusion_now@@treated_with_chest_drainage
      patient_has_finding_of_pleural_effusion_now)
   :named REQ1_AUXILIARY0)) ;; "pleural effusion that is treated with chest drainage" implies "pleural effusion"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_pleural_effusion_now@@treated_with_chest_drainage)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has pleural effusion that is treated with chest drainage)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_atelectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of atelectasis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of atelectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of atelectasis.","meaning":"Boolean indicating whether the patient currently has atelectasis."} ;; "atelectasis"
(declare-const patient_has_finding_of_atelectasis_now@@detected_by_x_ray Bool) ;; {"when_to_set_to_true":"Set to true if the patient's atelectasis is detected by x-ray.","when_to_set_to_false":"Set to false if the patient's atelectasis is not detected by x-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's atelectasis is detected by x-ray.","meaning":"Boolean indicating whether the patient's atelectasis is detected by x-ray."} ;; "atelectasis detected by x-ray"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_atelectasis_now@@detected_by_x_ray
      patient_has_finding_of_atelectasis_now)
:named REQ2_AUXILIARY0)) ;; "atelectasis detected by x-ray" implies "atelectasis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_atelectasis_now@@detected_by_x_ray)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atelectasis detected by x-ray."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_pneumonia_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of pneumonia within the previous six months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of pneumonia within the previous six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of pneumonia within the previous six months.","meaning":"Boolean indicating whether the patient has had a diagnosis of pneumonia within the previous six months."} ;; "the patient has had pneumonia in the previous six months"
(declare-const patient_has_diagnosis_of_pleural_effusion_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of pleural effusion within the previous six months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of pleural effusion within the previous six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of pleural effusion within the previous six months.","meaning":"Boolean indicating whether the patient has had a diagnosis of pleural effusion within the previous six months."} ;; "the patient has had pleural effusion in the previous six months"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_diagnosis_of_pneumonia_inthepast6months
            patient_has_diagnosis_of_pleural_effusion_inthepast6months))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has had pneumonia in the previous six months) OR (the patient has had pleural effusion in the previous six months))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any pulmonary underlying disease (disorder of lung).","when_to_set_to_false":"Set to false if the patient currently does not have any pulmonary underlying disease (disorder of lung).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any pulmonary underlying disease (disorder of lung).","meaning":"Boolean indicating whether the patient currently has any pulmonary underlying disease (disorder of lung)."} ;; "any other pulmonary underlying disease"
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "heart disease"
(declare-const patient_has_finding_of_cerebral_palsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cerebral palsy.","when_to_set_to_false":"Set to false if the patient currently does not have cerebral palsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cerebral palsy.","meaning":"Boolean indicating whether the patient currently has cerebral palsy."} ;; "cerebral palsy"
(declare-const patient_has_finding_of_immune_defect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has immune deficiency (immune defect).","when_to_set_to_false":"Set to false if the patient currently does not have immune deficiency (immune defect).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immune deficiency (immune defect).","meaning":"Boolean indicating whether the patient currently has immune deficiency (immune defect)."} ;; "immune deficiency"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_disorder_of_lung_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other pulmonary underlying disease."

(assert
(! (not patient_has_finding_of_heart_disease_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart disease."

(assert
(! (not patient_has_finding_of_cerebral_palsy_now)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cerebral palsy."

(assert
(! (not patient_has_finding_of_immune_defect_now)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immune deficiency."
