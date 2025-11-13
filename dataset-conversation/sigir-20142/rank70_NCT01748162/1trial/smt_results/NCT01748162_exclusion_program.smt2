;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_subglottic_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of subglottic stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of subglottic stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of subglottic stenosis.","meaning":"Boolean indicating whether the patient currently has subglottic stenosis."} ;; "subglottic stenosis"
(declare-const patient_has_finding_of_subglottic_stenosis_now@@grade_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has subglottic stenosis and the grade is 3.","when_to_set_to_false":"Set to false if the patient currently has subglottic stenosis and the grade is not 3.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the grade of subglottic stenosis is 3.","meaning":"Boolean indicating whether the patient currently has subglottic stenosis of grade 3."} ;; "grade 3 subglottic stenosis"
(declare-const patient_has_finding_of_subglottic_stenosis_now@@grade_4 Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has subglottic stenosis and the grade is 4.","when_to_set_to_false":"Set to false if the patient currently has subglottic stenosis and the grade is not 4.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the grade of subglottic stenosis is 4.","meaning":"Boolean indicating whether the patient currently has subglottic stenosis of grade 4."} ;; "grade 4 subglottic stenosis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
(! (=> patient_has_finding_of_subglottic_stenosis_now@@grade_3
       patient_has_finding_of_subglottic_stenosis_now)
   :named REQ0_AUXILIARY0)) ;; "grade 3 subglottic stenosis"

(assert
(! (=> patient_has_finding_of_subglottic_stenosis_now@@grade_4
       patient_has_finding_of_subglottic_stenosis_now)
   :named REQ0_AUXILIARY1)) ;; "grade 4 subglottic stenosis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_subglottic_stenosis_now@@grade_3)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has grade 3 subglottic stenosis."

(assert
(! (not patient_has_finding_of_subglottic_stenosis_now@@grade_4)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has grade 4 subglottic stenosis."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hemangioma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of hemangioma.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of hemangioma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of hemangioma.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of hemangioma."} ;; "hemangioma"
(declare-const patient_has_finding_of_hemangioma_now@@subglottic_location Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hemangioma is located in the subglottic region.","when_to_set_to_false":"Set to false if the patient's hemangioma is not located in the subglottic region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hemangioma is located in the subglottic region.","meaning":"Boolean indicating whether the patient's hemangioma is located in the subglottic region."} ;; "subglottic hemangioma"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_hemangioma_now@@subglottic_location
      patient_has_finding_of_hemangioma_now)
   :named REQ1_AUXILIARY0)) ;; "subglottic hemangioma" (location qualifier implies hemangioma finding)

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hemangioma_now@@subglottic_location)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has subglottic hemangioma."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_congenital_cleft_larynx_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a congenital cleft of the larynx (laryngeal cleft).","when_to_set_to_false":"Set to false if the patient currently does not have a congenital cleft of the larynx (laryngeal cleft).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a congenital cleft of the larynx (laryngeal cleft).","meaning":"Boolean indicating whether the patient currently has a congenital cleft of the larynx (laryngeal cleft)."} ;; "laryngeal cleft"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_congenital_cleft_larynx_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has posterior laryngeal cleft."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_recurrent_respiratory_papillomatosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of recurrent respiratory papillomatosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of recurrent respiratory papillomatosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of recurrent respiratory papillomatosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of recurrent respiratory papillomatosis."} ;; "recurrent respiratory papillomatosis"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_recurrent_respiratory_papillomatosis_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recurrent respiratory papillomatosis."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_external_compression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has external compression.","when_to_set_to_false":"Set to false if the patient currently does not have external compression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has external compression.","meaning":"Boolean indicating whether the patient currently has external compression."} ;; "external compression"
(declare-const patient_has_finding_of_innominate_artery_compression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has innominate artery compression.","when_to_set_to_false":"Set to false if the patient currently does not have innominate artery compression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has innominate artery compression.","meaning":"Boolean indicating whether the patient currently has innominate artery compression."} ;; "innominate artery compression"
(declare-const patient_has_finding_of_mediastinal_mass_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mediastinal mass.","when_to_set_to_false":"Set to false if the patient currently does not have a mediastinal mass.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mediastinal mass.","meaning":"Boolean indicating whether the patient currently has a mediastinal mass."} ;; "mediastinal mass"
(declare-const patient_has_finding_of_double_aortic_arch_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a double aortic arch.","when_to_set_to_false":"Set to false if the patient currently does not have a double aortic arch.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a double aortic arch.","meaning":"Boolean indicating whether the patient currently has a double aortic arch."} ;; "double aortic arch"
(declare-const patient_has_finding_of_similar_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has similar conditions that may cause external compression.","when_to_set_to_false":"Set to false if the patient currently does not have similar conditions that may cause external compression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has similar conditions that may cause external compression.","meaning":"Boolean indicating whether the patient currently has similar conditions that may cause external compression."} ;; "similar conditions"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_innominate_artery_compression_now
          patient_has_finding_of_mediastinal_mass_now
          patient_has_finding_of_double_aortic_arch_now
          patient_has_finding_of_similar_conditions_now)
    patient_has_finding_of_external_compression_now)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples ((innominate artery compression) OR (mediastinal mass) OR (double aortic arch) OR (similar conditions))."

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_innominate_artery_compression_now
    patient_has_finding_of_external_compression_now)
:named REQ4_AUXILIARY1)) ;; "innominate artery compression is a type of external compression"

(assert
(! (=> patient_has_finding_of_mediastinal_mass_now
    patient_has_finding_of_external_compression_now)
:named REQ4_AUXILIARY2)) ;; "mediastinal mass is a type of external compression"

(assert
(! (=> patient_has_finding_of_double_aortic_arch_now
    patient_has_finding_of_external_compression_now)
:named REQ4_AUXILIARY3)) ;; "double aortic arch is a type of external compression"

(assert
(! (=> patient_has_finding_of_similar_conditions_now
    patient_has_finding_of_external_compression_now)
:named REQ4_AUXILIARY4)) ;; "similar conditions are types of external compression"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_external_compression_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has external compression with non-exhaustive examples ((innominate artery compression) OR (mediastinal mass) OR (double aortic arch) OR (similar conditions))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_clinical_signs_of_sign_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs.","meaning":"Boolean indicating whether the patient currently has clinical signs."} ;; "signs"
(declare-const patient_has_clinical_signs_of_sign_now@@suggesting_another_cause_of_stridor Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinical signs suggest another cause of stridor.","when_to_set_to_false":"Set to false if the patient's clinical signs do not suggest another cause of stridor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinical signs suggest another cause of stridor.","meaning":"Boolean indicating whether the patient's clinical signs suggest another cause of stridor."} ;; "signs suggesting another cause of stridor"
(declare-const patient_has_finding_of_epiglottitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of epiglottitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of epiglottitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of epiglottitis.","meaning":"Boolean indicating whether the patient currently has epiglottitis."} ;; "epiglottitis"
(declare-const patient_has_finding_of_tracheitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tracheitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tracheitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of tracheitis.","meaning":"Boolean indicating whether the patient currently has tracheitis."} ;; "bacterial tracheitis"
(declare-const patient_has_finding_of_foreign_body_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of a foreign body.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of a foreign body.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of a foreign body.","meaning":"Boolean indicating whether the patient currently has a foreign body."} ;; "foreign body"
(declare-const patient_has_finding_of_foreign_body_now@@located_in_supraglottic_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's foreign body is located in the supraglottic region.","when_to_set_to_false":"Set to false if the patient's foreign body is not located in the supraglottic region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's foreign body is located in the supraglottic region.","meaning":"Boolean indicating whether the patient's foreign body is located in the supraglottic region."} ;; "supraglottic foreign body"
(declare-const patient_has_finding_of_stridor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of stridor.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of stridor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of stridor.","meaning":"Boolean indicating whether the patient currently has stridor."} ;; "stridor"
(declare-const patient_has_finding_of_stridor_now@@suggested_to_be_caused_by_another_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's stridor is suggested to be caused by another condition (e.g., epiglottitis, bacterial tracheitis, supraglottic foreign body).","when_to_set_to_false":"Set to false if the patient's stridor is not suggested to be caused by another condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's stridor is suggested to be caused by another condition.","meaning":"Boolean indicating whether the patient's stridor is suggested to be caused by another condition."} ;; "stridor suggested to be caused by another condition"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term for symptoms suggesting another cause of stridor
(assert
(! (=> (or patient_has_finding_of_epiglottitis_now
          patient_has_finding_of_tracheitis_now
          patient_has_finding_of_foreign_body_now@@located_in_supraglottic_region)
        patient_has_finding_of_stridor_now@@suggested_to_be_caused_by_another_condition)
   :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples ((epiglottitis) OR (bacterial tracheitis) OR (supraglottic foreign body))" for symptoms

;; Non-exhaustive examples imply umbrella term for signs suggesting another cause of stridor
(assert
(! (=> (or patient_has_finding_of_epiglottitis_now
          patient_has_finding_of_tracheitis_now
          patient_has_finding_of_foreign_body_now@@located_in_supraglottic_region)
        patient_has_clinical_signs_of_sign_now@@suggesting_another_cause_of_stridor)
   :named REQ5_AUXILIARY1)) ;; "with non-exhaustive examples ((epiglottitis) OR (bacterial tracheitis) OR (supraglottic foreign body))" for signs

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_stridor_now@@suggested_to_be_caused_by_another_condition
       patient_has_finding_of_stridor_now)
   :named REQ5_AUXILIARY2)) ;; "stridor suggested to be caused by another condition"

(assert
(! (=> patient_has_clinical_signs_of_sign_now@@suggesting_another_cause_of_stridor
       patient_has_clinical_signs_of_sign_now)
   :named REQ5_AUXILIARY3)) ;; "signs suggesting another cause of stridor"

(assert
(! (=> patient_has_finding_of_foreign_body_now@@located_in_supraglottic_region
       patient_has_finding_of_foreign_body_now)
   :named REQ5_AUXILIARY4)) ;; "supraglottic foreign body"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have symptoms suggesting another cause of stridor
(assert
(! (not patient_has_finding_of_stridor_now@@suggested_to_be_caused_by_another_condition)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms suggesting another cause of stridor with non-exhaustive examples ((epiglottitis) OR (bacterial tracheitis) OR (supraglottic foreign body))."

;; Exclusion: patient must NOT have signs suggesting another cause of stridor
(assert
(! (not patient_has_clinical_signs_of_sign_now@@suggesting_another_cause_of_stridor)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs suggesting another cause of stridor with non-exhaustive examples ((epiglottitis) OR (bacterial tracheitis) OR (supraglottic foreign body))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_tracheomalacia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tracheomalacia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tracheomalacia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of tracheomalacia.","meaning":"Boolean indicating whether the patient currently has tracheomalacia."} ;; "tracheomalacia"
(declare-const patient_has_finding_of_tracheomalacia_now@@severe_enough_to_cause_respiratory_distress Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tracheomalacia is severe enough to cause respiratory distress.","when_to_set_to_false":"Set to false if the patient's tracheomalacia is not severe enough to cause respiratory distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tracheomalacia is severe enough to cause respiratory distress.","meaning":"Boolean indicating whether the patient's tracheomalacia is severe enough to cause respiratory distress."} ;; "tracheomalacia severe enough to cause respiratory distress"
(declare-const patient_has_finding_of_bronchomalacia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bronchomalacia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bronchomalacia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bronchomalacia.","meaning":"Boolean indicating whether the patient currently has bronchomalacia."} ;; "bronchomalacia"
(declare-const patient_has_finding_of_bronchomalacia_now@@severe_enough_to_cause_respiratory_distress Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bronchomalacia is severe enough to cause respiratory distress.","when_to_set_to_false":"Set to false if the patient's bronchomalacia is not severe enough to cause respiratory distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bronchomalacia is severe enough to cause respiratory distress.","meaning":"Boolean indicating whether the patient's bronchomalacia is severe enough to cause respiratory distress."} ;; "bronchomalacia severe enough to cause respiratory distress"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_tracheomalacia_now@@severe_enough_to_cause_respiratory_distress
      patient_has_finding_of_tracheomalacia_now)
   :named REQ6_AUXILIARY0)) ;; "tracheomalacia severe enough to cause respiratory distress"

(assert
(! (=> patient_has_finding_of_bronchomalacia_now@@severe_enough_to_cause_respiratory_distress
      patient_has_finding_of_bronchomalacia_now)
   :named REQ6_AUXILIARY1)) ;; "bronchomalacia severe enough to cause respiratory distress"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_tracheomalacia_now@@severe_enough_to_cause_respiratory_distress)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tracheomalacia severe enough to cause respiratory distress."

(assert
(! (not patient_has_finding_of_bronchomalacia_now@@severe_enough_to_cause_respiratory_distress)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bronchomalacia severe enough to cause respiratory distress."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_undergoing_administration_of_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving administration of steroid therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving administration of steroid therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving administration of steroid therapy.","meaning":"Boolean indicating whether the patient is currently receiving administration of steroid therapy."} ;; "steroid therapy"
(declare-const patient_is_undergoing_administration_of_steroid_now@@for_previously_diagnosed_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving administration of steroid therapy and the therapy is for a previously diagnosed condition.","when_to_set_to_false":"Set to false if the patient is currently receiving administration of steroid therapy but not for a previously diagnosed condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the steroid therapy is for a previously diagnosed condition.","meaning":"Boolean indicating whether the patient's current steroid therapy is for a previously diagnosed condition."} ;; "currently receiving steroid therapy for a previously diagnosed condition"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_administration_of_steroid_now@@for_previously_diagnosed_condition
      patient_is_undergoing_administration_of_steroid_now)
:named REQ7_AUXILIARY0)) ;; "currently receiving steroid therapy for a previously diagnosed condition"

;; Non-exhaustive example: reactive airway disease is an example of previously diagnosed condition
(declare-const patient_has_diagnosis_of_reactive_airway_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of reactive airway disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of reactive airway disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of reactive airway disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of reactive airway disease."} ;; "reactive airway disease"
(assert
(! (=> (and patient_is_undergoing_administration_of_steroid_now
           patient_has_diagnosis_of_reactive_airway_disease_now)
      patient_is_undergoing_administration_of_steroid_now@@for_previously_diagnosed_condition)
:named REQ7_AUXILIARY1)) ;; "with non-exhaustive examples (reactive airway disease)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_undergoing_administration_of_steroid_now@@for_previously_diagnosed_condition)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving steroid therapy for a previously diagnosed condition with non-exhaustive examples (reactive airway disease)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_other_medical_condition_necessitating_chronic_steroid_utilization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other medical condition that necessitates chronic steroid utilization.","when_to_set_to_false":"Set to false if the patient currently does not have any other medical condition that necessitates chronic steroid utilization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other medical condition that necessitates chronic steroid utilization.","meaning":"Boolean indicating whether the patient currently has any other medical condition that necessitates chronic steroid utilization."} ;; "other medical conditions necessitating chronic steroid utilization"

(declare-const patient_is_undergoing_administration_of_steroid_now@@for_previously_diagnosed_condition@@necessitating_chronic_steroid_utilization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's previously diagnosed condition necessitates chronic steroid utilization.","when_to_set_to_false":"Set to false if the patient's previously diagnosed condition does not necessitate chronic steroid utilization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's previously diagnosed condition necessitates chronic steroid utilization.","meaning":"Boolean indicating whether the patient's previously diagnosed condition necessitates chronic steroid utilization."} ;; "currently receiving steroid therapy for a previously diagnosed condition, and the underlying condition necessitates chronic steroid utilization"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_other_medical_condition_necessitating_chronic_steroid_utilization_now
            patient_is_undergoing_administration_of_steroid_now@@for_previously_diagnosed_condition@@necessitating_chronic_steroid_utilization))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other medical conditions necessitating chronic steroid utilization."
