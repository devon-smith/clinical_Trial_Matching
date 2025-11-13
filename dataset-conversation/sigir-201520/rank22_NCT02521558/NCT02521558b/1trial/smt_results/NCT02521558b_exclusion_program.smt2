;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than 50 years of age OR the patient is older than 90 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (or (< patient_age_value_recorded_now_in_years 50)
              (> patient_age_value_recorded_now_in_years 90)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is younger than 50 years of age) OR (the patient is older than 90 years of age)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_substance_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of substance misuse behavior at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have any history of substance misuse behavior at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of substance misuse behavior.","meaning":"Boolean indicating whether the patient has any history of substance misuse behavior at any time in the past."} ;; "the patient has any self-reported history of substance abuse"

(declare-const patient_has_finding_of_substance_misuse_behavior_inthehistory@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of substance misuse behavior is self-reported.","when_to_set_to_false":"Set to false if the patient's history of substance misuse behavior is not self-reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is self-reported.","meaning":"Boolean indicating whether the patient's history of substance misuse behavior is self-reported."} ;; "self-reported history of substance abuse"

(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of alcohol abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have any history of alcohol abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of alcohol abuse.","meaning":"Boolean indicating whether the patient has any history of alcohol abuse at any time in the past."} ;; "the patient has any self-reported history of alcohol abuse"

(declare-const patient_has_finding_of_alcohol_abuse_inthehistory@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of alcohol abuse is self-reported.","when_to_set_to_false":"Set to false if the patient's history of alcohol abuse is not self-reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is self-reported.","meaning":"Boolean indicating whether the patient's history of alcohol abuse is self-reported."} ;; "self-reported history of alcohol abuse"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_substance_misuse_behavior_inthehistory@@self_reported
      patient_has_finding_of_substance_misuse_behavior_inthehistory)
:named REQ1_AUXILIARY0)) ;; "self-reported history of substance abuse"

(assert
(! (=> patient_has_finding_of_alcohol_abuse_inthehistory@@self_reported
      patient_has_finding_of_alcohol_abuse_inthehistory)
:named REQ1_AUXILIARY1)) ;; "self-reported history of alcohol abuse"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have any self-reported history of substance abuse
(assert
(! (not patient_has_finding_of_substance_misuse_behavior_inthehistory@@self_reported)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has any self-reported history of substance abuse"

;; Exclusion: patient must NOT have any self-reported history of alcohol abuse
(assert
(! (not patient_has_finding_of_alcohol_abuse_inthehistory@@self_reported)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has any self-reported history of alcohol abuse"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_head_trauma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of head trauma at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have any history of head trauma at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of head trauma.","meaning":"Boolean indicating whether the patient has any history of head trauma at any time in the past."} ;; "any self-reported history of prior head trauma"

(declare-const patient_has_finding_of_head_trauma_inthehistory@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of head trauma is self-reported.","when_to_set_to_false":"Set to false if the patient's history of head trauma is not self-reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is self-reported.","meaning":"Boolean indicating whether the patient's history of head trauma is self-reported."} ;; "self-reported history of prior head trauma"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident (stroke) at any time in the past."} ;; "stroke"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of cerebrovascular accident (stroke) is self-reported.","when_to_set_to_false":"Set to false if the patient's history of cerebrovascular accident (stroke) is not self-reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is self-reported.","meaning":"Boolean indicating whether the patient's history of cerebrovascular accident (stroke) is self-reported."} ;; "self-reported history of stroke"

(declare-const patient_has_finding_of_traumatic_brain_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a traumatic brain injury at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a traumatic brain injury at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a traumatic brain injury.","meaning":"Boolean indicating whether the patient has ever had a traumatic brain injury at any time in the past."} ;; "traumatic brain injury"

(declare-const patient_has_finding_of_traumatic_brain_injury_inthehistory@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of traumatic brain injury is self-reported.","when_to_set_to_false":"Set to false if the patient's history of traumatic brain injury is not self-reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is self-reported.","meaning":"Boolean indicating whether the patient's history of traumatic brain injury is self-reported."} ;; "self-reported history of traumatic brain injury"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_cerebrovascular_accident_inthehistory@@self_reported
          patient_has_finding_of_traumatic_brain_injury_inthehistory@@self_reported)
     patient_has_finding_of_head_trauma_inthehistory@@self_reported)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (stroke, traumatic brain injury)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_head_trauma_inthehistory@@self_reported
       patient_has_finding_of_head_trauma_inthehistory)
:named REQ2_AUXILIARY1)) ;; "self-reported history of prior head trauma"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cerebrovascular_accident_inthehistory@@self_reported
       patient_has_finding_of_cerebrovascular_accident_inthehistory)
:named REQ2_AUXILIARY2)) ;; "self-reported history of stroke"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_traumatic_brain_injury_inthehistory@@self_reported
       patient_has_finding_of_traumatic_brain_injury_inthehistory)
:named REQ2_AUXILIARY3)) ;; "self-reported history of traumatic brain injury"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_head_trauma_inthehistory@@self_reported)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "any self-reported history of prior head trauma with non-exhaustive examples (stroke, traumatic brain injury)"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_depressive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of depressive disorder.","when_to_set_to_false":"Set to false if the patient does not have any history of depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of depressive disorder.","meaning":"Boolean indicating whether the patient has any history of depressive disorder."} ;; "depression"
(declare-const patient_has_finding_of_depressive_disorder_inthehistory@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of depressive disorder is self-reported.","when_to_set_to_false":"Set to false if the patient's history of depressive disorder is not self-reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of depressive disorder is self-reported.","meaning":"Boolean indicating whether the patient's history of depressive disorder is self-reported."} ;; "self-reported history of depressive disorder"
(declare-const patient_has_finding_of_depressive_disorder_inthehistory@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of depressive disorder is significant.","when_to_set_to_false":"Set to false if the patient's history of depressive disorder is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of depressive disorder is significant.","meaning":"Boolean indicating whether the patient's history of depressive disorder is significant."} ;; "significant depression"
(declare-const patient_has_finding_of_depressive_disorder_inthehistory@@self_reported@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any prior self-reported history of significant depressive disorder.","when_to_set_to_false":"Set to false if the patient does not have any prior self-reported history of significant depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any prior self-reported history of significant depressive disorder.","meaning":"Boolean indicating whether the patient has any prior self-reported history of significant depressive disorder."} ;; "any prior self-reported history of significant depression"
(declare-const patient_has_finding_of_mood_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of mood disorder.","when_to_set_to_false":"Set to false if the patient does not have any history of mood disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of mood disorder.","meaning":"Boolean indicating whether the patient has any history of mood disorder."} ;; "mood disorder"
(declare-const patient_has_finding_of_mood_disorder_inthehistory@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of mood disorder is self-reported.","when_to_set_to_false":"Set to false if the patient's history of mood disorder is not self-reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of mood disorder is self-reported.","meaning":"Boolean indicating whether the patient's history of mood disorder is self-reported."} ;; "self-reported history of mood disorder"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_depressive_disorder_inthehistory@@self_reported
      patient_has_finding_of_depressive_disorder_inthehistory)
:named REQ3_AUXILIARY0)) ;; "self-reported history of depressive disorder"

(assert
(! (=> patient_has_finding_of_depressive_disorder_inthehistory@@significant
      patient_has_finding_of_depressive_disorder_inthehistory)
:named REQ3_AUXILIARY1)) ;; "significant depression"

(assert
(! (=> patient_has_finding_of_depressive_disorder_inthehistory@@self_reported@@significant
      (and patient_has_finding_of_depressive_disorder_inthehistory@@self_reported
           patient_has_finding_of_depressive_disorder_inthehistory@@significant))
:named REQ3_AUXILIARY2)) ;; "any prior self-reported history of significant depression"

(assert
(! (=> patient_has_finding_of_mood_disorder_inthehistory@@self_reported
      patient_has_finding_of_mood_disorder_inthehistory)
:named REQ3_AUXILIARY3)) ;; "self-reported history of mood disorder"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_depressive_disorder_inthehistory@@self_reported@@significant)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any prior self-reported history of significant depression."

(assert
(! (not patient_has_finding_of_mood_disorder_inthehistory@@self_reported)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any prior self-reported history of other mood disorder."
