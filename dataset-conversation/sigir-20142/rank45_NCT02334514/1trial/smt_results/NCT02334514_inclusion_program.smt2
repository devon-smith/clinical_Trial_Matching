;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."}  ;; "cough"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."}  ;; "fever"
(declare-const patient_has_finding_of_fever_now@@high Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has high fever.","when_to_set_to_false":"Set to false if the patient currently has fever but it is not high.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fever is high.","meaning":"Boolean indicating whether the patient currently has high fever."}  ;; "high fever"
(declare-const patient_has_finding_of_fever_now@@sudden_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever and the onset was sudden.","when_to_set_to_false":"Set to false if the patient currently has fever but the onset was not sudden.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of fever was sudden.","meaning":"Boolean indicating whether the patient currently has fever with sudden onset."}  ;; "sudden onset of fever"
(declare-const patient_has_finding_of_headache_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has headache.","when_to_set_to_false":"Set to false if the patient currently does not have headache.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has headache.","meaning":"Boolean indicating whether the patient currently has headache."}  ;; "headache"
(declare-const patient_has_finding_of_joint_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has joint pain.","when_to_set_to_false":"Set to false if the patient currently does not have joint pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has joint pain.","meaning":"Boolean indicating whether the patient currently has joint pain."}  ;; "joint pain"
(declare-const patient_has_finding_of_malaise_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malaise.","when_to_set_to_false":"Set to false if the patient currently does not have malaise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malaise.","meaning":"Boolean indicating whether the patient currently has malaise."}  ;; "malaise"
(declare-const patient_has_finding_of_malaise_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe malaise.","when_to_set_to_false":"Set to false if the patient currently has malaise but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malaise is severe.","meaning":"Boolean indicating whether the patient currently has severe malaise."}  ;; "severe malaise"
(declare-const patient_has_finding_of_muscle_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has muscle pain.","when_to_set_to_false":"Set to false if the patient currently does not have muscle pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has muscle pain.","meaning":"Boolean indicating whether the patient currently has muscle pain."}  ;; "muscle pain"
(declare-const patient_has_finding_of_pain_in_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sore throat.","when_to_set_to_false":"Set to false if the patient currently does not have sore throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sore throat.","meaning":"Boolean indicating whether the patient currently has sore throat."}  ;; "sore throat"
(declare-const patient_has_finding_of_runny_nose_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has runny nose.","when_to_set_to_false":"Set to false if the patient currently does not have runny nose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has runny nose.","meaning":"Boolean indicating whether the patient currently has runny nose."}  ;; "runny nose"
(declare-const patient_has_suspicion_of_influenza_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical presentation that suggests influenza virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical presentation that suggests influenza virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical presentation suggestive of influenza virus infection.","meaning":"Boolean indicating whether the patient currently has a clinical presentation suggestive of influenza virus infection."}  ;; "clinical presentation that suggests influenza virus infection"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_fever_now@@high
         patient_has_finding_of_fever_now)
     :named REQ0_AUXILIARY0)) ;; "high fever" is a type of fever

(assert
  (! (=> patient_has_finding_of_fever_now@@sudden_onset
         patient_has_finding_of_fever_now)
     :named REQ0_AUXILIARY1)) ;; "sudden onset of fever" is a type of fever

(assert
  (! (=> patient_has_finding_of_malaise_now@@severe
         patient_has_finding_of_malaise_now)
     :named REQ0_AUXILIARY2)) ;; "severe malaise" is a type of malaise

;; Non-exhaustive examples: each example symptom implies suspicion of influenza, but not vice versa
(assert
  (! (=> (or patient_has_finding_of_fever_now@@high
             patient_has_finding_of_fever_now@@sudden_onset
             patient_has_finding_of_cough_now
             patient_has_finding_of_headache_now
             patient_has_finding_of_muscle_pain_now
             patient_has_finding_of_joint_pain_now
             patient_has_finding_of_malaise_now@@severe
             patient_has_finding_of_pain_in_throat_now
             patient_has_finding_of_runny_nose_now)
         patient_has_suspicion_of_influenza_now)
     :named REQ0_AUXILIARY3)) ;; "such as sudden onset of high fever, cough, headache, muscle pain, joint pain, severe malaise, sore throat, and runny nose" are non-exhaustive examples of clinical presentation suggesting influenza

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_suspicion_of_influenza_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a clinical presentation that suggests influenza virus infection"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_influenza_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of influenza virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of influenza virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of influenza virus infection.","meaning":"Boolean indicating whether the patient currently has influenza virus infection."}  ;; "To be included, the patient must be positive for influenza virus infection by polymerase chain reaction test."
(declare-const patient_has_finding_of_influenza_now@@confirmed_by_polymerase_chain_reaction_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient's influenza virus infection is confirmed by polymerase chain reaction (PCR) test.","when_to_set_to_false":"Set to false if the patient's influenza virus infection is not confirmed by polymerase chain reaction (PCR) test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's influenza virus infection is confirmed by PCR test.","meaning":"Boolean indicating whether the patient's influenza virus infection is confirmed by PCR test."}  ;; "To be included, the patient must be positive for influenza virus infection by polymerase chain reaction test."
(declare-const patient_has_finding_of_influenza_now@@test_result_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's polymerase chain reaction (PCR) test for influenza virus infection is positive.","when_to_set_to_false":"Set to false if the patient's PCR test for influenza virus infection is negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's PCR test for influenza virus infection is positive.","meaning":"Boolean indicating whether the patient's PCR test for influenza virus infection is positive."}  ;; "To be included, the patient must be positive for influenza virus infection by polymerase chain reaction test."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_influenza_now@@confirmed_by_polymerase_chain_reaction_test
         patient_has_finding_of_influenza_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must be positive for influenza virus infection by polymerase chain reaction test."

;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_influenza_now@@test_result_is_positive
         patient_has_finding_of_influenza_now)
     :named REQ1_AUXILIARY1)) ;; "To be included, the patient must be positive for influenza virus infection by polymerase chain reaction test."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Patient must be positive for influenza virus infection by PCR test
(assert
  (! (and patient_has_finding_of_influenza_now@@confirmed_by_polymerase_chain_reaction_test
          patient_has_finding_of_influenza_now@@test_result_is_positive)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be positive for influenza virus infection by polymerase chain reaction test."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_indication_for_antiviral_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical indication for antiviral treatment.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical indication for antiviral treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical indication for antiviral treatment.","meaning":"Boolean indicating whether the patient currently has a clinical indication for antiviral treatment."}  ;; "To be included, the patient must have an indication for antiviral treatment."
(declare-const patient_has_undergone_antiviral_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone antiviral therapy at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone antiviral therapy at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone antiviral therapy.","meaning":"Boolean indicating whether the patient has ever undergone antiviral therapy in their medical history."}  ;; "antiviral treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_indication_for_antiviral_treatment_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an indication for antiviral treatment."
