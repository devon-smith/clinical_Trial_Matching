;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_laser_supraglottoplasty_prior_to_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone laser supraglottoplasty at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never undergone laser supraglottoplasty prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone laser supraglottoplasty prior to the current evaluation.","meaning":"Boolean indicating whether the patient has undergone laser supraglottoplasty prior to the current evaluation."} ;; "The patient is excluded if the patient has had prior laser supraglottoplasty."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_undergone_laser_supraglottoplasty_prior_to_evaluation)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior laser supraglottoplasty."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_adenoid_excision_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone adenoid excision (adenoidectomy) at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never undergone adenoid excision (adenoidectomy) prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone adenoid excision (adenoidectomy) prior to the current evaluation.","meaning":"Boolean indicating whether the patient has ever undergone adenoid excision (adenoidectomy) at any time in the past."} ;; "adenoidectomy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_undergone_adenoid_excision_inthehistory)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior adenoidectomy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_tonsillectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a tonsillectomy procedure at any time in the past (prior to the current evaluation).","when_to_set_to_false":"Set to false if the patient has never undergone a tonsillectomy procedure at any time in the past (prior to the current evaluation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a tonsillectomy procedure at any time in the past.","meaning":"Boolean indicating whether the patient has ever undergone a tonsillectomy procedure at any time in the past (up to and including the present)."} ;; "tonsillectomy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_tonsillectomy_inthehistory)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior tonsillectomy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_stridor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of stridor.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of stridor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of stridor.","meaning":"Boolean indicating whether the patient currently has stridor."} ;; "stridor"
(declare-const patient_has_finding_of_stridor_now@@co_occurs_with_cyanosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's stridor co-occurs with cyanosis.","when_to_set_to_false":"Set to false if the patient's stridor does not co-occur with cyanosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's stridor co-occurs with cyanosis.","meaning":"Boolean indicating whether the patient's stridor co-occurs with cyanosis."} ;; "stridor with cyanosis"
(declare-const patient_has_finding_of_stridor_now@@co_occurs_with_apnea Bool) ;; {"when_to_set_to_true":"Set to true if the patient's stridor co-occurs with apnea.","when_to_set_to_false":"Set to false if the patient's stridor does not co-occur with apnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's stridor co-occurs with apnea.","meaning":"Boolean indicating whether the patient's stridor co-occurs with apnea."} ;; "stridor with apnea"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_stridor_now@@co_occurs_with_cyanosis
      patient_has_finding_of_stridor_now)
:named REQ3_AUXILIARY0)) ;; "stridor with cyanosis"

(assert
(! (=> patient_has_finding_of_stridor_now@@co_occurs_with_apnea
      patient_has_finding_of_stridor_now)
:named REQ3_AUXILIARY1)) ;; "stridor with apnea"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_stridor_now@@co_occurs_with_cyanosis)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has stridor with cyanosis."

(assert
(! (not patient_has_finding_of_stridor_now@@co_occurs_with_apnea)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has stridor with apnea."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_respiratory_distress_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory distress.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of respiratory distress.","meaning":"Boolean indicating whether the patient currently has respiratory distress now."} ;; "respiratory distress"
(declare-const patient_has_finding_of_respiratory_distress_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory distress and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has respiratory distress but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of the patient's current respiratory distress is severe.","meaning":"Boolean indicating whether the patient's current respiratory distress is severe."} ;; "severe respiratory distress"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_respiratory_distress_now@@severity_severe
      patient_has_finding_of_respiratory_distress_now)
:named REQ4_AUXILIARY0)) ;; "severe respiratory distress" implies "respiratory distress"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_respiratory_distress_now@@severity_severe)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe respiratory distress."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_recurrent_pneumonia_value_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the total number of recurrent pneumonia episodes the patient has had in their history if this information is available.","when_to_set_to_null":"Set to null if the number of recurrent pneumonia episodes in the patient's history is unknown, not documented, or cannot be determined.","meaning":"Numeric count of recurrent pneumonia episodes the patient has had in their history."} ;; "recurrent pneumonia (number of episodes ≥ 3)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (>= patient_recurrent_pneumonia_value_recorded_inthehistory_withunit_count 3))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had recurrent pneumonia (number of episodes ≥ 3)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_cyst_of_larynx_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of laryngeal cyst (cyst of larynx).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of laryngeal cyst (cyst of larynx).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of laryngeal cyst (cyst of larynx).","meaning":"Boolean indicating whether the patient currently has a laryngeal cyst (cyst of larynx)."} ;; "laryngeal cyst"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_cyst_of_larynx_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a laryngeal cyst."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_vocal_cord_paralysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of vocal cord paralysis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of vocal cord paralysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of vocal cord paralysis.","meaning":"Boolean indicating whether the patient currently has vocal cord paralysis."} ;; "The patient is excluded if the patient has vocal cord paralysis."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_vocal_cord_paralysis_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has vocal cord paralysis."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_airway_vascular_malformation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an airway vascular malformation.","when_to_set_to_false":"Set to false if the patient currently does not have an airway vascular malformation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an airway vascular malformation.","meaning":"Boolean indicating whether the patient currently has an airway vascular malformation."} ;; "The patient is excluded if the patient has an airway vascular malformation."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_airway_vascular_malformation_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an airway vascular malformation."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of neoplastic disease (neoplasm).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of neoplastic disease (neoplasm).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of neoplastic disease (neoplasm).","meaning":"Boolean indicating whether the patient currently has a neoplastic disease (neoplasm)."} ;; "The patient is excluded if the patient has a neoplasm."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_neoplastic_disease_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a neoplasm."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_subglottic_hemangioma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a subglottic hemangioma.","when_to_set_to_false":"Set to false if the patient currently does not have a subglottic hemangioma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a subglottic hemangioma.","meaning":"Boolean indicating whether the patient currently has a subglottic hemangioma."} ;; "The patient is excluded if the patient has a subglottic hemangioma."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (not patient_has_finding_of_subglottic_hemangioma_now)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a subglottic hemangioma."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_paradoxical_movement_of_vocal_cord_on_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has paradoxical movement of the vocal cord on respiration.","when_to_set_to_false":"Set to false if the patient currently does not have paradoxical movement of the vocal cord on respiration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paradoxical movement of the vocal cord on respiration.","meaning":"Boolean indicating whether the patient currently has paradoxical movement of the vocal cord on respiration."} ;; "paradoxical vocal cord motion"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_paradoxical_movement_of_vocal_cord_on_respiration_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has paradoxical vocal cord motion."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_posterior_glottic_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has posterior glottic stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have posterior glottic stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has posterior glottic stenosis.","meaning":"Boolean indicating whether the patient currently has posterior glottic stenosis."} ;; "The patient is excluded if the patient has posterior glottic stenosis."

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (not patient_has_finding_of_posterior_glottic_stenosis_now)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has posterior glottic stenosis."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_glottic_web_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has glottic webs.","when_to_set_to_false":"Set to false if the patient currently does not have glottic webs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has glottic webs.","meaning":"Boolean indicating whether the patient currently has glottic webs."} ;; "The patient is excluded if the patient has glottic webs."

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_glottic_web_now)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has glottic webs."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_discoordinate_pharyngolaryngomalacia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has discoordinate pharyngolaryngomalacia.","when_to_set_to_false":"Set to false if the patient currently does not have discoordinate pharyngolaryngomalacia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has discoordinate pharyngolaryngomalacia.","meaning":"Boolean indicating whether the patient currently has discoordinate pharyngolaryngomalacia."} ;; "The patient is excluded if the patient has discoordinate pharyngolaryngomalacia."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
  (! (not patient_has_finding_of_discoordinate_pharyngolaryngomalacia_now)
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has discoordinate pharyngolaryngomalacia."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_refuses_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient has explicitly refused to participate.","when_to_set_to_false":"Set to false if the patient has not refused to participate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has refused to participate.","meaning":"Boolean indicating whether the patient has refused to participate."} ;; "The patient is excluded if the patient refuses to participate."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_refuses_to_participate)
    :named REQ15_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to participate."
