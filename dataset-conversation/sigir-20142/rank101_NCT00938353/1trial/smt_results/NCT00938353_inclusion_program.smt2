;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const written_informed_consent_obtained_prior_to_study_related_procedures Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent for the patient has been obtained before any study-related procedures are performed.","when_to_set_to_false":"Set to false if written informed consent for the patient has not been obtained before any study-related procedures are performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent for the patient has been obtained prior to any study-related procedures.","meaning":"Boolean indicating whether written informed consent for the patient has been obtained prior to any study-related procedures."} ;; "To be included, the patient must have written informed consent obtained (by the parents of the patient OR by the legal representative of the patient) prior to any study-related procedures."
(declare-const written_informed_consent_obtained_prior_to_study_related_procedures@@obtained_by_parents_or_legal_representative Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent for the patient has been obtained by either the parents of the patient or the legal representative of the patient prior to any study-related procedures.","when_to_set_to_false":"Set to false if written informed consent for the patient has not been obtained by either the parents of the patient or the legal representative of the patient prior to any study-related procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent for the patient has been obtained by either the parents of the patient or the legal representative of the patient prior to any study-related procedures.","meaning":"Boolean indicating whether written informed consent for the patient has been obtained by either the parents of the patient or the legal representative of the patient prior to any study-related procedures."} ;; "To be included, the patient must have written informed consent obtained (by the parents of the patient OR by the legal representative of the patient) prior to any study-related procedures."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> written_informed_consent_obtained_prior_to_study_related_procedures@@obtained_by_parents_or_legal_representative
         written_informed_consent_obtained_prior_to_study_related_procedures)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have written informed consent obtained (by the parents of the patient OR by the legal representative of the patient) prior to any study-related procedures."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! written_informed_consent_obtained_prior_to_study_related_procedures@@obtained_by_parents_or_legal_representative
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have written informed consent obtained (by the parents of the patient OR by the legal representative of the patient) prior to any study-related procedures."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient must be male or female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "the patient must be male or female"

(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "aged between 6 months and 3 years"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged between 6 months and 3 years"

(declare-const patient_is_referring_to_emergency_room_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently presenting to or being referred to the emergency room.","when_to_set_to_false":"Set to false if the patient is not currently presenting to or being referred to the emergency room.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting to or being referred to the emergency room.","meaning":"Boolean indicating whether the patient is currently presenting to or being referred to the emergency room."} ;; "referring to the emergency room"

(declare-const patient_has_finding_of_barking_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has barking cough.","when_to_set_to_false":"Set to false if the patient currently does not have barking cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has barking cough.","meaning":"Boolean indicating whether the patient currently has barking cough."} ;; "barky cough"
(declare-const patient_has_finding_of_barking_cough_now@@acute_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's barking cough has an acute onset.","when_to_set_to_false":"Set to false if the patient's barking cough does not have an acute onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's barking cough has an acute onset.","meaning":"Boolean indicating whether the patient's barking cough has an acute onset."} ;; "acute onset barky cough"

(declare-const patient_has_finding_of_stridor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stridor.","when_to_set_to_false":"Set to false if the patient currently does not have stridor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stridor.","meaning":"Boolean indicating whether the patient currently has stridor."} ;; "stridor"
(declare-const patient_has_finding_of_stridor_now@@acute_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's stridor has an acute onset.","when_to_set_to_false":"Set to false if the patient's stridor does not have an acute onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's stridor has an acute onset.","meaning":"Boolean indicating whether the patient's stridor has an acute onset."} ;; "acute onset stridor"

(declare-const patient_has_finding_of_hoarse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hoarseness.","when_to_set_to_false":"Set to false if the patient currently does not have hoarseness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hoarseness.","meaning":"Boolean indicating whether the patient currently has hoarseness."} ;; "hoarseness"
(declare-const patient_has_finding_of_hoarse_now@@acute_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hoarseness has an acute onset.","when_to_set_to_false":"Set to false if the patient's hoarseness does not have an acute onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hoarseness has an acute onset.","meaning":"Boolean indicating whether the patient's hoarseness has an acute onset."} ;; "acute onset hoarseness"

(declare-const patient_has_finding_of_respiratory_distress_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory distress.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory distress.","meaning":"Boolean indicating whether the patient currently has respiratory distress."} ;; "respiratory distress"
(declare-const patient_has_finding_of_respiratory_distress_now@@acute_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's respiratory distress has an acute onset.","when_to_set_to_false":"Set to false if the patient's respiratory distress does not have an acute onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory distress has an acute onset.","meaning":"Boolean indicating whether the patient's respiratory distress has an acute onset."} ;; "acute onset respiratory distress"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_barking_cough_now@@acute_onset
         patient_has_finding_of_barking_cough_now)
     :named REQ1_AUXILIARY0)) ;; "acute onset barky cough" implies "barky cough"

(assert
  (! (=> patient_has_finding_of_stridor_now@@acute_onset
         patient_has_finding_of_stridor_now)
     :named REQ1_AUXILIARY1)) ;; "acute onset stridor" implies "stridor"

(assert
  (! (=> patient_has_finding_of_hoarse_now@@acute_onset
         patient_has_finding_of_hoarse_now)
     :named REQ1_AUXILIARY2)) ;; "acute onset hoarseness" implies "hoarseness"

(assert
  (! (=> patient_has_finding_of_respiratory_distress_now@@acute_onset
         patient_has_finding_of_respiratory_distress_now)
     :named REQ1_AUXILIARY3)) ;; "acute onset respiratory distress" implies "respiratory distress"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be male or female"

;; Component 1: The patient must be aged between 6 months and 3 years.
(assert
  (! (and (>= patient_age_value_recorded_now_in_months 6.0)
          (<= patient_age_value_recorded_now_in_years 3.0))
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "aged between 6 months and 3 years"

;; Component 2: The patient must be referring to the emergency room with acute onset barky cough, stridor, hoarseness, and respiratory distress.
(assert
  (! (and patient_is_referring_to_emergency_room_now
          patient_has_finding_of_barking_cough_now@@acute_onset
          patient_has_finding_of_stridor_now@@acute_onset
          patient_has_finding_of_hoarse_now@@acute_onset
          patient_has_finding_of_respiratory_distress_now@@acute_onset)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "referring to the emergency room with acute onset barky cough, stridor, hoarseness, and respiratory distress"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_croup_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of croup.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of croup.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of croup.","meaning":"Boolean indicating whether the patient currently has a diagnosis of croup."} ;; "the patient must have a diagnosis of moderate croup (Westley score 3-8)"
(declare-const westley_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current Westley croup score in points if available.","when_to_set_to_null":"Set to null if the patient's current Westley croup score is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the patient's current Westley croup score, recorded in points."} ;; "Westley score 3-8"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient must have a diagnosis of moderate croup (Westley score 3-8).
(assert
  (! (and patient_has_diagnosis_of_croup_now
          (<= 3 westley_score_value_recorded_now_withunit_points)
          (<= westley_score_value_recorded_now_withunit_points 8))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a diagnosis of moderate croup (Westley score 3-8)."
