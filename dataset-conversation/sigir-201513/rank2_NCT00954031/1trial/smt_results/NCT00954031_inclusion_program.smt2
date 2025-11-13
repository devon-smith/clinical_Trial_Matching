;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_peritonsillar_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peritonsillar abscess (phlegmon).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peritonsillar abscess (phlegmon).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of peritonsillar abscess (phlegmon).","meaning":"Boolean indicating whether the patient currently has peritonsillar abscess (phlegmon)."} // "clinical existence of a peritonsillar abscess (phlegmon)"
(declare-const patient_has_finding_of_peritonsillar_abscess_now@@validated_by_senior_ear_nose_and_throat_specialist Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peritonsillar abscess (phlegmon) is validated by a senior ear, nose, and throat specialist.","when_to_set_to_false":"Set to false if the patient's peritonsillar abscess (phlegmon) is not validated by a senior ear, nose, and throat specialist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a senior ear, nose, and throat specialist validated the peritonsillar abscess (phlegmon).","meaning":"Boolean indicating whether the patient's peritonsillar abscess (phlegmon) is validated by a senior ear, nose, and throat specialist."} // "validated by a senior ear, nose, and throat specialist"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_peritonsillar_abscess_now@@validated_by_senior_ear_nose_and_throat_specialist
         patient_has_finding_of_peritonsillar_abscess_now)
     :named REQ0_AUXILIARY0)) ;; "validated by a senior ear, nose, and throat specialist" implies "clinical existence of a peritonsillar abscess (phlegmon)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_peritonsillar_abscess_now@@validated_by_senior_ear_nose_and_throat_specialist
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "clinical existence of a peritonsillar abscess (phlegmon) validated by a senior ear, nose, and throat specialist"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_puncture_wound_of_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of puncture wound of the throat.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of puncture wound of the throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of puncture wound of the throat.","meaning":"Boolean indicating whether the patient currently has a puncture wound of the throat."} // "puncture of the throat"
(declare-const visible_appearance_of_patient_throat_justifies_puncture_of_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if, at the present time, the visible appearance of the patient's throat is such that it justifies puncture of the throat.","when_to_set_to_false":"Set to false if, at the present time, the visible appearance of the patient's throat does not justify puncture of the throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the visible appearance of the patient's throat justifies puncture of the throat at the present time.","meaning":"Boolean indicating whether the visible appearance of the patient's throat at the present time justifies puncture of the throat."} // "the visible appearance of the patient's throat must justify puncture of the throat"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! visible_appearance_of_patient_throat_justifies_puncture_of_throat_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the visible appearance of the patient's throat must justify puncture of the throat"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_peritonsillar_abscess_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with peritonsillar abscess at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with peritonsillar abscess in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with peritonsillar abscess in the past.","meaning":"Boolean indicating whether the patient has ever been diagnosed with peritonsillar abscess in the past."} // "peritonsillar abscess"
(declare-const patient_has_symptoms_of_sore_throat_symptom_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had symptoms of sore throat at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had symptoms of sore throat in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had symptoms of sore throat in the past.","meaning":"Boolean indicating whether the patient has ever had symptoms of sore throat in the past."} // "sore throat"
(declare-const patient_has_symptoms_of_sore_throat_symptom_inthehistory@@temporalcontext_within_10_days_before_diagnosis_of_peritonsillar_abscess Bool) ;; {"when_to_set_to_true":"Set to true if the patient had symptoms of sore throat within the 10 days before the date of diagnosis of peritonsillar abscess.","when_to_set_to_false":"Set to false if the patient did not have symptoms of sore throat within the 10 days before the date of diagnosis of peritonsillar abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had symptoms of sore throat within the 10 days before the date of diagnosis of peritonsillar abscess.","meaning":"Boolean indicating whether the patient had symptoms of sore throat within the 10 days before the date of diagnosis of peritonsillar abscess."} // "sore throat in the 10 days preceding the date of diagnosis of peritonsillar abscess"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_symptoms_of_sore_throat_symptom_inthehistory@@temporalcontext_within_10_days_before_diagnosis_of_peritonsillar_abscess
         patient_has_symptoms_of_sore_throat_symptom_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "whether or not the patient had consulted for a sore throat in the 10 days preceding the date of diagnosis of peritonsillar abscess"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The requirement states that inclusion is permitted regardless of sore throat consultation in the 10 days before diagnosis; always satisfiable.
(assert
  (! true
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "may be included whether OR not the patient had consulted for a sore throat in the 10 days preceding the date of diagnosis of peritonsillar abscess"
