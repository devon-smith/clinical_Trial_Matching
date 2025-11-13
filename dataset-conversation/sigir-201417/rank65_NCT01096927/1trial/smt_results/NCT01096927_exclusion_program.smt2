;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_peritonitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peritonitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of peritonitis.","meaning":"Boolean indicating whether the patient currently has peritonitis."} ;; "peritonitis"
(declare-const patient_has_finding_of_peritonitis_now@@diffuse Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peritonitis is diffuse.","when_to_set_to_false":"Set to false if the patient's peritonitis is not diffuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's peritonitis is diffuse.","meaning":"Boolean indicating whether the patient's peritonitis is diffuse."} ;; "diffuse peritonitis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_peritonitis_now@@diffuse
      patient_has_finding_of_peritonitis_now)
:named REQ0_AUXILIARY0)) ;; "diffuse peritonitis" means peritonitis is present and is diffuse

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_peritonitis_now@@diffuse)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diffuse peritonitis."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergic_reaction_caused_by_antibacterial_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergic reaction caused by an antibacterial agent (antibiotics).","when_to_set_to_false":"Set to false if the patient currently does not have an allergic reaction caused by an antibacterial agent (antibiotics).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergic reaction caused by an antibacterial agent (antibiotics).","meaning":"Boolean indicating whether the patient currently has an allergic reaction caused by an antibacterial agent (antibiotics)."} ;; "allergy to antibiotics"
(declare-const patient_has_finding_of_allergic_reaction_caused_by_antibacterial_agent_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the allergic reaction to antibiotics is documented in the patient's record.","when_to_set_to_false":"Set to false if the allergic reaction to antibiotics is not documented in the patient's record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergic reaction to antibiotics is documented.","meaning":"Boolean indicating whether the allergic reaction to antibiotics is documented."} ;; "documented allergy to antibiotics"
(declare-const patient_has_finding_of_allergy_to_penicillin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to penicillin.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to penicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to penicillin.","meaning":"Boolean indicating whether the patient currently has an allergy to penicillin."} ;; "allergy to penicillin"
(declare-const patient_has_finding_of_allergy_to_penicillin_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the allergy to penicillin is documented in the patient's record.","when_to_set_to_false":"Set to false if the allergy to penicillin is not documented in the patient's record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to penicillin is documented.","meaning":"Boolean indicating whether the allergy to penicillin is documented."} ;; "documented allergy to penicillin"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_allergic_reaction_caused_by_antibacterial_agent_now@@documented
      patient_has_finding_of_allergic_reaction_caused_by_antibacterial_agent_now)
   :named REQ1_AUXILIARY0)) ;; "documented allergy to antibiotics"

(assert
(! (=> patient_has_finding_of_allergy_to_penicillin_now@@documented
      patient_has_finding_of_allergy_to_penicillin_now)
   :named REQ1_AUXILIARY1)) ;; "documented allergy to penicillin"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_allergic_reaction_caused_by_antibacterial_agent_now@@documented)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a documented allergy to antibiotics."

(assert
(! (not patient_has_finding_of_allergy_to_penicillin_now@@documented)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a documented allergy to penicillin."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_undergoing_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antibiotic therapy (i.e., ongoing at the present time).","when_to_set_to_false":"Set to false if the patient is not currently undergoing antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing antibiotic therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antibiotic therapy."} ;; "the patient has ongoing antibiotic therapy"
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously undergone (i.e., started) antibiotic therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone antibiotic therapy in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone antibiotic therapy in the past.","meaning":"Boolean indicating whether the patient has ever undergone antibiotic therapy in the past."} ;; "the patient has previously started antibiotic therapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_is_undergoing_antibiotic_therapy_now
            patient_has_undergone_antibiotic_therapy_inthehistory))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has ongoing antibiotic therapy) OR (the patient has previously started antibiotic therapy)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_appendectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an appendectomy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an appendectomy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an appendectomy.","meaning":"Boolean indicating whether the patient has ever undergone an appendectomy in their history."} ;; "has had a previous appendectomy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_appendectomy_inthehistory)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous appendectomy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant, as determined by a positive pregnancy test result.","when_to_set_to_false":"Set to false if the patient is currently not pregnant, as determined by a negative pregnancy test result.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has a positive pregnancy test"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive pregnancy test."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_inflammatory_bowel_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with inflammatory bowel disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with inflammatory bowel disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with inflammatory bowel disease.","meaning":"Boolean indicating whether the patient has a history of inflammatory bowel disease."} ;; "the patient has a history of inflammatory bowel disease"
(declare-const patient_has_suspicion_of_inflammatory_bowel_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if there is current suspicion of inflammatory bowel disease in the patient.","when_to_set_to_false":"Set to false if there is no current suspicion of inflammatory bowel disease in the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is current suspicion of inflammatory bowel disease in the patient.","meaning":"Boolean indicating whether there is current suspicion of inflammatory bowel disease."} ;; "there is suspicion of inflammatory bowel disease recrudescence"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_diagnosis_of_inflammatory_bowel_disease_inthehistory)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of inflammatory bowel disease."

(assert
  (! (not patient_has_suspicion_of_inflammatory_bowel_disease_now)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if there is suspicion of inflammatory bowel disease recrudescence."
