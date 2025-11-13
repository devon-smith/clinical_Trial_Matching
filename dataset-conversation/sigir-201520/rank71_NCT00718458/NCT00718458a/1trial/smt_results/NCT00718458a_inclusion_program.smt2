;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_gives_consent_themselves_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to and does give consent themselves now.","when_to_set_to_false":"Set to false if the patient is not able to or does not give consent themselves now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient gives consent themselves now.","meaning":"Boolean indicating whether the patient gives consent themselves now."} // "the patient gives consent themselves"
(declare-const legally_authorized_representative_gives_consent_for_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if a legally authorized representative gives consent for the patient now.","when_to_set_to_false":"Set to false if a legally authorized representative does not give consent for the patient now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a legally authorized representative gives consent for the patient now.","meaning":"Boolean indicating whether a legally authorized representative gives consent for the patient now."} // "a legally authorized representative gives consent for the patient"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_gives_consent_themselves_now
         legally_authorized_representative_gives_consent_for_patient_now)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient gives consent themselves OR a legally authorized representative gives consent for the patient"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_myoneural_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with a neuromuscular disease.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with a neuromuscular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with a neuromuscular disease.","meaning":"Boolean indicating whether the patient is currently diagnosed with a neuromuscular disease."} // "be diagnosed with a neuromuscular disease"
(declare-const patient_has_finding_of_difficulty_communicating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has difficulty communicating.","when_to_set_to_false":"Set to false if the patient currently does not have difficulty communicating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficulty communicating.","meaning":"Boolean indicating whether the patient currently has difficulty communicating."} // "have a limited ability to communicate"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be diagnosed with a neuromuscular disease.
(assert
  (! patient_has_diagnosis_of_myoneural_disorder_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be diagnosed with a neuromuscular disease."

;; Component 1: The patient must have a limited ability to communicate.
(assert
  (! patient_has_finding_of_difficulty_communicating_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a limited ability to communicate."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patients_visual_cue_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to perceive (see) visual cues.","when_to_set_to_false":"Set to false if the patient is currently unable to perceive (see) visual cues.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to perceive (see) visual cues.","meaning":"Boolean indicating whether the patient is currently able to perceive (see) visual cues."} // "be able to see visual cues"
(declare-const patients_visual_cue_is_positive_now@@presented_on_screen Bool) ;; {"when_to_set_to_true":"Set to true if the visual cues are presented on a screen.","when_to_set_to_false":"Set to false if the visual cues are not presented on a screen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the visual cues are presented on a screen.","meaning":"Boolean indicating whether the visual cues are presented on a screen."} // "visual letters presented on the screen"
(declare-const patients_auditory_stimulus_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to perceive (hear) auditory stimuli.","when_to_set_to_false":"Set to false if the patient is currently unable to perceive (hear) auditory stimuli.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to perceive (hear) auditory stimuli.","meaning":"Boolean indicating whether the patient is currently able to perceive (hear) auditory stimuli."} // "be able to hear auditory cues"
(declare-const patients_auditory_stimulus_is_positive_now@@presented_through_speakers_or_earphones Bool) ;; {"when_to_set_to_true":"Set to true if the auditory stimuli are presented through speakers or earphones.","when_to_set_to_false":"Set to false if the auditory stimuli are not presented through speakers or earphones.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the auditory stimuli are presented through speakers or earphones.","meaning":"Boolean indicating whether the auditory stimuli are presented through speakers or earphones."} // "auditory words presented through speakers or earphones"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for visual cues implies stem variable
(assert
  (! (=> patients_visual_cue_is_positive_now@@presented_on_screen
         patients_visual_cue_is_positive_now)
     :named REQ2_AUXILIARY0)) ;; "visual letters presented on the screen" is a non-exhaustive example of visual cues

;; Qualifier variable for auditory cues implies stem variable
(assert
  (! (=> patients_auditory_stimulus_is_positive_now@@presented_through_speakers_or_earphones
         patients_auditory_stimulus_is_positive_now)
     :named REQ2_AUXILIARY1)) ;; "auditory words presented through speakers or earphones" is a non-exhaustive example of auditory cues

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must be able to see visual cues OR hear auditory cues
(assert
  (! (or patients_visual_cue_is_positive_now
         patients_auditory_stimulus_is_positive_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be able to see visual cues ... OR ... be able to hear auditory cues"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patients_ability_to_comprehend_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to comprehend (understand) instructions.","when_to_set_to_false":"Set to false if the patient is currently unable to comprehend (understand) instructions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to comprehend (understand) instructions.","meaning":"Boolean indicating whether the patient currently has a positive ability to comprehend (understand) instructions."} // "be able to understand instructions"
(declare-const patients_ability_to_comprehend_is_positive_now@@instructions_concern_participation Bool) ;; {"when_to_set_to_true":"Set to true if the instructions being comprehended by the patient concern participation.","when_to_set_to_false":"Set to false if the instructions being comprehended by the patient do not concern participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the instructions being comprehended by the patient concern participation.","meaning":"Boolean indicating whether the instructions being comprehended by the patient concern participation."} // "instructions concerning participation"
(declare-const patients_memory_recall_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to recall (remember) instructions.","when_to_set_to_false":"Set to false if the patient is currently unable to recall (remember) instructions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to recall (remember) instructions.","meaning":"Boolean indicating whether the patient currently has a positive ability to recall (remember) instructions."} // "be able to remember instructions"
(declare-const patients_memory_recall_is_positive_now@@instructions_concern_participation Bool) ;; {"when_to_set_to_true":"Set to true if the instructions being recalled by the patient concern participation.","when_to_set_to_false":"Set to false if the instructions being recalled by the patient do not concern participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the instructions being recalled by the patient concern participation.","meaning":"Boolean indicating whether the instructions being recalled by the patient concern participation."} // "instructions concerning participation"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable for comprehension
(assert
  (! (=> patients_ability_to_comprehend_is_positive_now@@instructions_concern_participation
         patients_ability_to_comprehend_is_positive_now)
     :named REQ3_AUXILIARY0)) ;; "be able to understand instructions concerning participation"

;; Qualifier variable implies corresponding stem variable for memory recall
(assert
  (! (=> patients_memory_recall_is_positive_now@@instructions_concern_participation
         patients_memory_recall_is_positive_now)
     :named REQ3_AUXILIARY1)) ;; "be able to remember instructions concerning participation"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must be able to understand instructions concerning participation
(assert
  (! patients_ability_to_comprehend_is_positive_now@@instructions_concern_participation
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be able to understand instructions concerning participation"

;; Component 1: Must be able to remember instructions concerning participation
(assert
  (! patients_memory_recall_is_positive_now@@instructions_concern_participation
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be able to remember instructions concerning participation"
