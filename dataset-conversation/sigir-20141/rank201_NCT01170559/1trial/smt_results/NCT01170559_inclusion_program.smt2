;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_intermittent_palpitations_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intermittent (episodic) palpitations.","when_to_set_to_false":"Set to false if the patient does not have a documented history of intermittent (episodic) palpitations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intermittent (episodic) palpitations.","meaning":"Boolean indicating whether the patient has a history of intermittent (episodic) palpitations."} // "a good history of episodic palpitations"
(declare-const patient_has_finding_of_palpitations_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of palpitations.","when_to_set_to_false":"Set to false if the patient does not have a documented history of palpitations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of palpitations.","meaning":"Boolean indicating whether the patient has a history of palpitations."} // "a good history of symptomatic palpitations"
(declare-const patient_has_finding_of_sustained_palpitations_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of sustained palpitations.","when_to_set_to_false":"Set to false if the patient does not have a documented history of sustained palpitations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of sustained palpitations.","meaning":"Boolean indicating whether the patient has a history of sustained palpitations."} // "a good history of sustained palpitations"
(declare-const patient_has_finding_of_sustained_palpitations_inthehistory@@with_sudden_offset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of sustained palpitations includes sudden offset.","when_to_set_to_false":"Set to false if the patient's history of sustained palpitations does not include sudden offset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of sustained palpitations includes sudden offset.","meaning":"Boolean indicating whether the patient's history of sustained palpitations includes sudden offset."} // "sudden offset"
(declare-const patient_has_finding_of_symptom_started_suddenly_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of symptoms that started suddenly.","when_to_set_to_false":"Set to false if the patient does not have a documented history of symptoms that started suddenly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of symptoms that started suddenly.","meaning":"Boolean indicating whether the patient has a history of symptoms that started suddenly."} // "sudden onset"
(declare-const patient_has_finding_of_tachycardia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of tachycardia (fast heart beats).","when_to_set_to_false":"Set to false if the patient does not have a documented history of tachycardia (fast heart beats).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of tachycardia (fast heart beats).","meaning":"Boolean indicating whether the patient has a history of tachycardia (fast heart beats)."} // "fast heart beats"
(declare-const patient_has_finding_of_dyspnea_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of dyspnea (shortness of breath).","when_to_set_to_false":"Set to false if the patient does not have a documented history of dyspnea (shortness of breath).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of dyspnea (shortness of breath).","meaning":"Boolean indicating whether the patient has a history of dyspnea (shortness of breath)."} // "shortness of breath"
(declare-const patient_has_finding_of_dizziness_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of dizziness.","when_to_set_to_false":"Set to false if the patient does not have a documented history of dizziness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of dizziness.","meaning":"Boolean indicating whether the patient has a history of dizziness."} // "dizziness"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition of sustained palpitations per requirement: sudden onset AND sudden offset AND fast heart beats AND possibly associated with shortness of breath OR dizziness
(assert
  (! (= patient_has_finding_of_sustained_palpitations_inthehistory
        (and patient_has_finding_of_symptom_started_suddenly_inthehistory
             patient_has_finding_of_sustained_palpitations_inthehistory@@with_sudden_offset
             patient_has_finding_of_tachycardia_inthehistory
             (or patient_has_finding_of_dyspnea_inthehistory
                 patient_has_finding_of_dizziness_inthehistory)))
     :named REQ1_AUXILIARY0)) ;; "a good history of sustained palpitations (defined as sudden onset AND sudden offset AND fast heart beats AND possibly associated with shortness of breath OR dizziness)"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_sustained_palpitations_inthehistory@@with_sudden_offset
         patient_has_finding_of_sustained_palpitations_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "sudden offset" is a qualifier of sustained palpitations

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: episodic palpitations
(assert
  (! patient_has_finding_of_intermittent_palpitations_inthehistory
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a good history of episodic palpitations"

;; Component 1: symptomatic palpitations
(assert
  (! patient_has_finding_of_palpitations_inthehistory
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a good history of symptomatic palpitations"

;; Component 2: sustained palpitations (as defined above)
(assert
  (! patient_has_finding_of_sustained_palpitations_inthehistory
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a good history of sustained palpitations (defined as sudden onset AND sudden offset AND fast heart beats AND possibly associated with shortness of breath OR dizziness)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_palpitations_inthehistory@@terminated_before_presentation_to_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient's palpitations terminated before presentation to hospital.","when_to_set_to_false":"Set to false if the patient's palpitations did not terminate before presentation to hospital (i.e., were ongoing at presentation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's palpitations terminated before presentation to hospital.","meaning":"Boolean indicating whether the patient's palpitations terminated before presentation to hospital."} // "the patient's palpitations must terminate before presentation to hospital"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_palpitations_inthehistory@@terminated_before_presentation_to_hospital
         patient_has_finding_of_palpitations_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "the patient's palpitations must terminate before presentation to hospital" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_palpitations_inthehistory@@terminated_before_presentation_to_hospital
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient's palpitations must terminate before presentation to hospital"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_palpitations_value_recorded_inthehistory_withunit_episodes_per_2_weeks Real) ;; {"when_to_set_to_value":"Set to the number of palpitations episodes recorded for the patient in any two-week period in their history.","when_to_set_to_null":"Set to null if no such measurement is available or cannot be determined.","meaning":"Numeric value representing the frequency of palpitations episodes per two weeks in the patient's history."} // "episodes of palpitations must occur at a frequency of < 1 episode every two weeks"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (< patient_palpitations_value_recorded_inthehistory_withunit_episodes_per_2_weeks 1.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "episodes of palpitations must occur at a frequency of < 1 episode every two weeks"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_palpitations_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has palpitations.","when_to_set_to_false":"Set to false if the patient currently does not have palpitations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has palpitations.","meaning":"Boolean indicating whether the patient currently has palpitations."} // "palpitations"
(declare-const patient_has_finding_of_palpitations_now@@not_previously_caught_on_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current palpitations have NOT previously been caught on electrocardiogram.","when_to_set_to_false":"Set to false if the patient's current palpitations have previously been caught on electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current palpitations have previously been caught on electrocardiogram.","meaning":"Boolean indicating whether the patient's current palpitations have NOT previously been caught on electrocardiogram."} // "palpitations must NOT have previously been caught on electrocardiogram"
(declare-const patient_has_finding_of_palpitations_now@@not_previously_caught_on_ambulatory_monitoring Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current palpitations have NOT previously been caught on ambulatory monitoring.","when_to_set_to_false":"Set to false if the patient's current palpitations have previously been caught on ambulatory monitoring.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current palpitations have previously been caught on ambulatory monitoring.","meaning":"Boolean indicating whether the patient's current palpitations have NOT previously been caught on ambulatory monitoring."} // "palpitations must NOT have previously been caught on ambulatory monitoring"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_palpitations_now@@not_previously_caught_on_electrocardiogram
         patient_has_finding_of_palpitations_now)
     :named REQ4_AUXILIARY0)) ;; "palpitations must NOT have previously been caught on electrocardiogram"

(assert
  (! (=> patient_has_finding_of_palpitations_now@@not_previously_caught_on_ambulatory_monitoring
         patient_has_finding_of_palpitations_now)
     :named REQ4_AUXILIARY1)) ;; "palpitations must NOT have previously been caught on ambulatory monitoring"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and patient_has_finding_of_palpitations_now@@not_previously_caught_on_electrocardiogram
          patient_has_finding_of_palpitations_now@@not_previously_caught_on_ambulatory_monitoring)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "palpitations must NOT have previously been caught on electrocardiogram AND NOT on ambulatory monitoring"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_ecg_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a normal resting electrocardiogram.","when_to_set_to_false":"Set to false if the patient currently does not have a normal resting electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a normal resting electrocardiogram.","meaning":"Boolean indicating whether the patient currently has a normal resting electrocardiogram."} // "normal resting electrocardiogram"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_ecg_normal_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a normal resting electrocardiogram."
