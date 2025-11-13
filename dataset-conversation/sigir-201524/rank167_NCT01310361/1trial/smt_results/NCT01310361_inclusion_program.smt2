;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 6 years AND aged ≤ 15 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 6)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 6 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 15)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 15 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever"
(declare-const patient_has_finding_of_erythema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has erythema (of tonsils).","when_to_set_to_false":"Set to false if the patient currently does not have erythema (of tonsils).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has erythema (of tonsils).","meaning":"Boolean indicating whether the patient currently has erythema (of tonsils)."} // "erythema of tonsils"
(declare-const patient_has_finding_of_exudate_on_tonsils_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has exudate on the tonsils.","when_to_set_to_false":"Set to false if the patient currently does not have exudate on the tonsils.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has exudate on the tonsils.","meaning":"Boolean indicating whether the patient currently has exudate on the tonsils."} // "exudate of tonsils"
(declare-const patient_has_finding_of_lymphadenopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lymphadenopathy (enlarged lymph nodes).","when_to_set_to_false":"Set to false if the patient currently does not have lymphadenopathy (enlarged lymph nodes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lymphadenopathy (enlarged lymph nodes).","meaning":"Boolean indicating whether the patient currently has lymphadenopathy (enlarged lymph nodes)."} // "enlarged lymph nodes"
(declare-const patient_has_finding_of_pain_in_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain in throat (sore throat).","when_to_set_to_false":"Set to false if the patient currently does not have pain in throat (sore throat).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain in throat (sore throat).","meaning":"Boolean indicating whether the patient currently has pain in throat (sore throat)."} // "sore throat"
(declare-const patient_has_finding_of_tenderness_of_neck_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tenderness of neck.","when_to_set_to_false":"Set to false if the patient currently does not have tenderness of neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tenderness of neck.","meaning":"Boolean indicating whether the patient currently has tenderness of neck."} // "neck tenderness"
(declare-const patient_has_finding_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal pain.","meaning":"Boolean indicating whether the patient currently has abdominal pain."} // "abdominal pain"
(declare-const patient_has_finding_of_petechiae_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has petechiae.","when_to_set_to_false":"Set to false if the patient currently does not have petechiae.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has petechiae.","meaning":"Boolean indicating whether the patient currently has petechiae."} // "petechia"
(declare-const patient_has_finding_of_petechiae_now@@located_in_pharynx Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has petechiae and the petechiae are located in the pharynx.","when_to_set_to_false":"Set to false if the patient currently has petechiae but they are not located in the pharynx.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the petechiae are located in the pharynx.","meaning":"Boolean indicating whether the patient currently has petechiae located in the pharynx."} // "petechia of pharynx"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_petechiae_now@@located_in_pharynx
         patient_has_finding_of_petechiae_now)
     :named REQ1_AUXILIARY0)) ;; "petechia of pharynx" is a type of petechiae

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: At least one of the following objective signs: fever OR erythema of tonsils OR exudate of tonsils OR enlarged lymph nodes
(assert
  (! (or patient_has_finding_of_fever_now
         patient_has_finding_of_erythema_now
         patient_has_finding_of_exudate_on_tonsils_now
         patient_has_finding_of_lymphadenopathy_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least one of the following objective signs: fever OR erythema of tonsils OR exudate of tonsils OR enlarged lymph nodes"

;; Component 1: The subjective sign (sore throat) is required
(assert
  (! patient_has_finding_of_pain_in_throat_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the subjective sign (sore throat)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_used_antibiotic_in_week_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any antibiotic at least once during the week before screening.","when_to_set_to_false":"Set to false if the patient has not used any antibiotic at all during the week before screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any antibiotic during the week before screening.","meaning":"Boolean indicating whether the patient has used any antibiotic during the week before screening."} // "must NOT have used any antibiotic during the week before screening"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_used_antibiotic_in_week_before_screening)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have used any antibiotic during the week before screening"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_throat_culture_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a throat culture at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a throat culture at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a throat culture.","meaning":"Boolean indicating whether the patient has ever undergone a throat culture in their history."} // "throat culture"
(declare-const patient_has_undergone_throat_culture_inthehistory@@performed_before_initiation_of_administration_of_drug Bool) ;; {"when_to_set_to_true":"Set to true if the throat culture was performed before the initiation of administration of drug.","when_to_set_to_false":"Set to false if the throat culture was not performed before the initiation of administration of drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the throat culture was performed before the initiation of administration of drug.","meaning":"Boolean indicating whether the throat culture was performed before the initiation of administration of drug."} // "throat culture performed before the initiation of administration of drug"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_throat_culture_inthehistory@@performed_before_initiation_of_administration_of_drug
         patient_has_undergone_throat_culture_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "throat culture performed before the initiation of administration of drug" implies "throat culture"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_undergone_throat_culture_inthehistory@@performed_before_initiation_of_administration_of_drug
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must have a throat culture performed before the initiation of administration of drug"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_throat_swab_culture_positive_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a positive throat swab culture result documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a positive throat swab culture result documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a positive throat swab culture result.","meaning":"Boolean indicating whether the patient has ever had a positive throat swab culture result."} // "positive throat culture"
(declare-const patient_has_finding_of_throat_swab_culture_positive_inthehistory@@indicates_infection_with_group_a_beta_hemolytic_streptococcus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's positive throat swab culture result indicates infection with Group A beta-hemolytic Streptococcus.","when_to_set_to_false":"Set to false if the patient's positive throat swab culture result does not indicate infection with Group A beta-hemolytic Streptococcus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive throat swab culture result indicates infection with Group A beta-hemolytic Streptococcus.","meaning":"Boolean indicating whether the patient's positive throat swab culture result indicates infection with Group A beta-hemolytic Streptococcus."} // "positive throat culture indicating infection with Group A beta-hemolytic Streptococcus"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_throat_swab_culture_positive_inthehistory@@indicates_infection_with_group_a_beta_hemolytic_streptococcus
         patient_has_finding_of_throat_swab_culture_positive_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "positive throat culture indicating infection with Group A beta-hemolytic Streptococcus" implies "positive throat culture"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_throat_swab_culture_positive_inthehistory@@indicates_infection_with_group_a_beta_hemolytic_streptococcus
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a positive throat culture indicating infection with Group A beta-hemolytic Streptococcus."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_allergy_to_penicillin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy to penicillin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy to penicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to penicillin.","meaning":"Boolean indicating whether the patient has ever had a history of allergy to penicillin."} // "no previous history of allergy to penicillin"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_penicillin_inthehistory)
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "no previous history of allergy to penicillin"
