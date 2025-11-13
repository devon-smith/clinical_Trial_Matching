;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_injury_of_head_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of head trauma at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of head trauma at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of head trauma.","meaning":"Boolean indicating whether the patient has ever had head trauma in their history."} ;; "head trauma"
(declare-const patient_loss_of_consciousness_value_recorded_inthehistory_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the duration in minutes if a numeric measurement of loss of consciousness duration is recorded at any time in the patient's history.","when_to_set_to_null":"Set to null if no such duration measurement is available or the value is indeterminate.","meaning":"Numeric value representing the duration in minutes of any loss of consciousness episode in the patient's history."} ;; "loss of consciousness for a duration greater than or equal to thirty minutes at any time during the lifespan of the patient"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_has_finding_of_injury_of_head_inthehistory
               (>= patient_loss_of_consciousness_value_recorded_inthehistory_withunit_minutes 30)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had head trauma with post-traumatic loss of consciousness for a duration greater than or equal to thirty minutes at any time during the lifespan of the patient."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_loss_of_senses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has loss of senses (any sensory loss, such as vision or hearing).","when_to_set_to_false":"Set to false if the patient currently does not have loss of senses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has loss of senses.","meaning":"Boolean indicating whether the patient currently has loss of senses (any sensory loss, such as vision or hearing)."} ;; "loss of senses"
(declare-const patient_has_finding_of_vision_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vision loss.","when_to_set_to_false":"Set to false if the patient currently does not have vision loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vision loss.","meaning":"Boolean indicating whether the patient currently has vision loss."} ;; "loss of vision"
(declare-const patient_has_finding_of_hearing_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hearing loss.","when_to_set_to_false":"Set to false if the patient currently does not have hearing loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hearing loss.","meaning":"Boolean indicating whether the patient currently has hearing loss."} ;; "loss of hearing"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_vision_loss_now
           patient_has_finding_of_hearing_loss_now)
       patient_has_finding_of_loss_of_senses_now)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (loss of vision OR loss of hearing)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_loss_of_senses_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has loss of senses with non-exhaustive examples (loss of vision OR loss of hearing)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_photosensitive_epilepsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has photosensitive epilepsy.","when_to_set_to_false":"Set to false if the patient currently does not have photosensitive epilepsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has photosensitive epilepsy.","meaning":"Boolean indicating whether the patient currently has photosensitive epilepsy."} ;; "photosensitive epilepsy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_photosensitive_epilepsy_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has photosensitive epilepsy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_can_undergo_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo a magnetic resonance imaging (MRI) examination.","when_to_set_to_false":"Set to false if the patient cannot currently undergo a magnetic resonance imaging (MRI) examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a magnetic resonance imaging (MRI) examination.","meaning":"Boolean indicating whether the patient can currently undergo a magnetic resonance imaging (MRI) examination."} ;; "magnetic resonance imaging"
(declare-const patient_has_finding_of_foreign_body_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a foreign body present.","when_to_set_to_false":"Set to false if the patient currently does not have a foreign body present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a foreign body present.","meaning":"Boolean indicating whether the patient currently has a foreign body present."} ;; "foreign bodies"
(declare-const patient_has_finding_of_foreign_body_now@@is_metal Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a foreign body present and that foreign body is metal.","when_to_set_to_false":"Set to false if the patient currently has a foreign body present and that foreign body is not metal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the foreign body is metal.","meaning":"Boolean indicating whether the patient's current foreign body is metal."} ;; "metal foreign bodies"
(declare-const patient_has_finding_of_claustrophobia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has claustrophobia.","when_to_set_to_false":"Set to false if the patient currently does not have claustrophobia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has claustrophobia.","meaning":"Boolean indicating whether the patient currently has claustrophobia."} ;; "claustrophobia"
(declare-const patient_has_finding_of_claustrophobia_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has claustrophobia and it is severe.","when_to_set_to_false":"Set to false if the patient currently has claustrophobia and it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the claustrophobia is severe.","meaning":"Boolean indicating whether the patient's current claustrophobia is severe."} ;; "severe claustrophobia"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_foreign_body_now@@is_metal
       patient_has_finding_of_foreign_body_now)
   :named REQ3_AUXILIARY0)) ;; "presence of metal foreign bodies"

(assert
(! (=> patient_has_finding_of_claustrophobia_now@@is_severe
       patient_has_finding_of_claustrophobia_now)
   :named REQ3_AUXILIARY1)) ;; "presence of severe claustrophobia"

;; Unsuitability for MRI due to (metal foreign bodies OR severe claustrophobia) means cannot undergo MRI
(assert
(! (= patient_can_undergo_magnetic_resonance_imaging_now
      (not (or patient_has_finding_of_foreign_body_now@@is_metal
               patient_has_finding_of_claustrophobia_now@@is_severe)))
   :named REQ3_AUXILIARY2)) ;; "unsuitable for magnetic resonance imaging examination due to (presence of metal foreign bodies OR presence of severe claustrophobia)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! patient_can_undergo_magnetic_resonance_imaging_now
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unsuitable for magnetic resonance imaging examination due to (presence of metal foreign bodies OR presence of severe claustrophobia)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_drug_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of drug abuse.","meaning":"Boolean indicating whether the patient currently has drug abuse."} ;; "drug abuse"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "alcohol abuse"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_finding_of_drug_abuse_now
            patient_has_finding_of_alcohol_abuse_now))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has drug abuse OR alcohol abuse."
