;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits cough.","when_to_set_to_false":"Set to false if the patient currently does not exhibit cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits cough.","meaning":"Boolean indicating whether the patient currently exhibits cough."}  ;; "cough"
(declare-const patient_has_finding_of_fatigue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits fatigue.","when_to_set_to_false":"Set to false if the patient currently does not exhibit fatigue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits fatigue.","meaning":"Boolean indicating whether the patient currently exhibits fatigue."}  ;; "fatigue"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits fever.","when_to_set_to_false":"Set to false if the patient currently does not exhibit fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits fever.","meaning":"Boolean indicating whether the patient currently exhibits fever."}  ;; "fever"
(declare-const patient_has_finding_of_headache_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits headache.","when_to_set_to_false":"Set to false if the patient currently does not exhibit headache.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits headache.","meaning":"Boolean indicating whether the patient currently exhibits headache."}  ;; "headache"
(declare-const patient_has_finding_of_influenza_like_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits at least one influenza-like illness symptom.","when_to_set_to_false":"Set to false if the patient currently does not exhibit any influenza-like illness symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits any influenza-like illness symptoms.","meaning":"Boolean indicating whether the patient currently exhibits at least one influenza-like illness symptom."}  ;; "flu-like symptom"
(declare-const patient_has_finding_of_influenza_like_illness_now@@occurs_during_flu_season Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits at least one influenza-like illness symptom and this occurrence is during a flu season.","when_to_set_to_false":"Set to false if the patient currently exhibits at least one influenza-like illness symptom but not during a flu season.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the occurrence is during a flu season.","meaning":"Boolean indicating whether the patient currently exhibits at least one influenza-like illness symptom during a flu season."}  ;; "flu-like symptom during a flu season"
(declare-const patient_has_finding_of_muscle_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits muscle pain (myalgia).","when_to_set_to_false":"Set to false if the patient currently does not exhibit muscle pain (myalgia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits muscle pain (myalgia).","meaning":"Boolean indicating whether the patient currently exhibits muscle pain (myalgia)."}  ;; "myalgia"
(declare-const patient_has_finding_of_nasal_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits nasal obstruction.","when_to_set_to_false":"Set to false if the patient currently does not exhibit nasal obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits nasal obstruction.","meaning":"Boolean indicating whether the patient currently exhibits nasal obstruction."}  ;; "nasal obstruction"
(declare-const patient_has_finding_of_pain_in_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently exhibits pain in throat (sore throat).","when_to_set_to_false":"Set to false if the patient currently does not exhibit pain in throat (sore throat).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently exhibits pain in throat (sore throat).","meaning":"Boolean indicating whether the patient currently exhibits pain in throat (sore throat)."}  ;; "sore throat"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples: any of the listed symptoms implies influenza-like illness
(assert
  (! (=> (or patient_has_finding_of_cough_now
             patient_has_finding_of_muscle_pain_now
             patient_has_finding_of_nasal_obstruction_now
             patient_has_finding_of_pain_in_throat_now
             patient_has_finding_of_headache_now
             patient_has_finding_of_fatigue_now
             patient_has_finding_of_fever_now)
         patient_has_finding_of_influenza_like_illness_now)
     :named REQ0_AUXILIARY0)) ;; "at least one flu-like symptom (with non-exhaustive examples (cough OR myalgia OR nasal obstruction OR sore throat OR headache OR fatigue OR fever))"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_influenza_like_illness_now@@occurs_during_flu_season
         patient_has_finding_of_influenza_like_illness_now)
     :named REQ0_AUXILIARY1)) ;; "flu-like symptom during a flu season" implies "flu-like symptom"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must exhibit at least one flu-like symptom during a flu season.
(assert
  (! patient_has_finding_of_influenza_like_illness_now@@occurs_during_flu_season
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must exhibit at least one flu-like symptom ... during a flu season."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_willing_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to participate in the study.","when_to_set_to_false":"Set to false if the patient is not willing to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to participate in the study.","meaning":"Boolean indicating whether the patient is willing to participate in the study."} ;; "the patient ... must be willing to participate in the study"
(declare-const guardian_is_willing_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the guardian of the patient is willing to participate in the study.","when_to_set_to_false":"Set to false if the guardian of the patient is not willing to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the guardian of the patient is willing to participate in the study.","meaning":"Boolean indicating whether the guardian of the patient is willing to participate in the study."} ;; "the guardian of the patient ... must be willing to participate in the study"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_is_willing_to_participate_in_study
         guardian_is_willing_to_participate_in_study)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient OR the guardian of the patient must be willing to participate in the study"
