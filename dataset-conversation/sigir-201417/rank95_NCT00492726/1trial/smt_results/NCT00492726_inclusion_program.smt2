;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_in_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized (admitted to a hospital at the present time).","when_to_set_to_false":"Set to false if the patient is currently not hospitalized (not admitted to a hospital at the present time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized (admitted to a hospital at the present time)."}  ;; "hospitalized"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be hospitalized.
(assert
  (! patient_has_finding_of_patient_in_hospital_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be hospitalized."

;; Component 1: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_intravenous_antibiotic_therapy_value_recorded_inthefuture_withunit_days Real) ;; {"when_to_set_to_value":"Set to the expected number of full days if the anticipated duration of intravenous antibiotic therapy for the patient is known.","when_to_set_to_null":"Set to null if the expected duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the expected duration (in full days) of intravenous antibiotic therapy anticipated for the patient in the future."}  ;; "expected duration of treatment with intravenous antibiotic therapy anticipated to be ≥ 5 full days and ≤ 14 days"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and (>= patient_intravenous_antibiotic_therapy_value_recorded_inthefuture_withunit_days 5)
          (<= patient_intravenous_antibiotic_therapy_value_recorded_inthefuture_withunit_days 14))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "expected duration of treatment with intravenous antibiotic therapy anticipated to be ≥ 5 full days and ≤ 14 days"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_ability_to_provide_documented_signed_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to provide documented and signed written informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to provide documented and signed written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to provide documented and signed written informed consent.","meaning":"Boolean indicating whether the patient currently has the ability to provide documented and signed written informed consent."} ;; "the ability to provide documented and signed written informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_ability_to_provide_documented_signed_written_informed_consent_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have the ability to provide documented and signed written informed consent"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of intra-abdominal infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of intra-abdominal infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of intra-abdominal infection.","meaning":"Boolean indicating whether the patient currently has intra-abdominal infection."} ;; "intra-abdominal infection"
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now@@confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's intra-abdominal infection is confirmed.","when_to_set_to_false":"Set to false if the patient's intra-abdominal infection is not confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intra-abdominal infection is confirmed.","meaning":"Boolean indicating whether the patient's intra-abdominal infection is confirmed."} ;; "confirmed intra-abdominal infection"
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now@@suspected_as_defined_in_following_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's intra-abdominal infection is suspected and the suspicion is defined by the following criteria.","when_to_set_to_false":"Set to false if the patient's intra-abdominal infection is not suspected or not defined by the following criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intra-abdominal infection is suspected as defined by the following criteria.","meaning":"Boolean indicating whether the patient's intra-abdominal infection is suspected as defined by the following criteria."} ;; "suspected intra-abdominal infection as defined in the following criteria"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply the stem variable (if confirmed or suspected, then must have intra-abdominal infection)
(assert
  (! (=> patient_has_finding_of_infectious_disease_of_abdomen_now@@confirmed
         patient_has_finding_of_infectious_disease_of_abdomen_now)
     :named REQ3_AUXILIARY0)) ;; If confirmed, then intra-abdominal infection present

(assert
  (! (=> patient_has_finding_of_infectious_disease_of_abdomen_now@@suspected_as_defined_in_following_criteria
         patient_has_finding_of_infectious_disease_of_abdomen_now)
     :named REQ3_AUXILIARY1)) ;; If suspected (as defined), then intra-abdominal infection present

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have either a confirmed intra-abdominal infection OR a suspected intra-abdominal infection as defined in the following criteria
(assert
  (! (or patient_has_finding_of_infectious_disease_of_abdomen_now@@confirmed
         patient_has_finding_of_infectious_disease_of_abdomen_now@@suspected_as_defined_in_following_criteria)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a confirmed intra-abdominal infection) OR (a suspected intra-abdominal infection as defined in the following criteria)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_abdominal_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of intra-abdominal abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of intra-abdominal abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of intra-abdominal abscess.","meaning":"Boolean indicating whether the patient currently has a finding of intra-abdominal abscess."} ;; "intra-abdominal abscess"
(declare-const patient_has_finding_of_gross_peritoneal_inflammation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gross peritoneal inflammation.","when_to_set_to_false":"Set to false if the patient currently does not have gross peritoneal inflammation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gross peritoneal inflammation.","meaning":"Boolean indicating whether the patient currently has gross peritoneal inflammation."} ;; "gross peritoneal inflammation"
(declare-const patient_has_finding_of_gross_peritoneal_inflammation_now@@accompanied_by_purulent_exudates Bool) ;; {"when_to_set_to_true":"Set to true if the gross peritoneal inflammation is accompanied by purulent exudates.","when_to_set_to_false":"Set to false if the gross peritoneal inflammation is not accompanied by purulent exudates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the gross peritoneal inflammation is accompanied by purulent exudates.","meaning":"Boolean indicating whether the gross peritoneal inflammation is accompanied by purulent exudates."} ;; "gross peritoneal inflammation with purulent exudates"
(declare-const patient_has_finding_of_gross_peritoneal_inflammation_now@@classified_as_peritonitis Bool) ;; {"when_to_set_to_true":"Set to true if the gross peritoneal inflammation is classified as peritonitis.","when_to_set_to_false":"Set to false if the gross peritoneal inflammation is not classified as peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the gross peritoneal inflammation is classified as peritonitis.","meaning":"Boolean indicating whether the gross peritoneal inflammation is classified as peritonitis."} ;; "gross peritoneal inflammation with purulent exudates (i.e. peritonitis)"
(declare-const patient_has_finding_of_perforation_of_intestine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of intestinal perforation.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of intestinal perforation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of intestinal perforation.","meaning":"Boolean indicating whether the patient currently has a finding of intestinal perforation."} ;; "macroscopic intestinal perforation"
(declare-const patient_has_finding_of_perforation_of_intestine_now@@macroscopic Bool) ;; {"when_to_set_to_true":"Set to true if the intestinal perforation is macroscopic.","when_to_set_to_false":"Set to false if the intestinal perforation is not macroscopic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intestinal perforation is macroscopic.","meaning":"Boolean indicating whether the intestinal perforation is macroscopic."} ;; "macroscopic intestinal perforation"
(declare-const patient_has_finding_of_perforation_of_intestine_now@@associated_with_localized_peritonitis Bool) ;; {"when_to_set_to_true":"Set to true if the intestinal perforation is associated with localized peritonitis.","when_to_set_to_false":"Set to false if the intestinal perforation is not associated with localized peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intestinal perforation is associated with localized peritonitis.","meaning":"Boolean indicating whether the intestinal perforation is associated with localized peritonitis."} ;; "macroscopic intestinal perforation with localized peritonitis"
(declare-const patient_has_finding_of_perforation_of_intestine_now@@associated_with_diffuse_peritonitis Bool) ;; {"when_to_set_to_true":"Set to true if the intestinal perforation is associated with diffuse peritonitis.","when_to_set_to_false":"Set to false if the intestinal perforation is not associated with diffuse peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intestinal perforation is associated with diffuse peritonitis.","meaning":"Boolean indicating whether the intestinal perforation is associated with diffuse peritonitis."} ;; "macroscopic intestinal perforation with diffuse peritonitis"
(declare-const patient_has_undergone_surgical_procedure_within_24_hours_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within 24 hours prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure within 24 hours prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within 24 hours prior to enrollment.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within 24 hours prior to enrollment."} ;; "surgical procedure performed within 24 hours prior to enrollment"
(declare-const patient_has_undergone_surgical_procedure_within_24_hours_prior_to_enrollment@@limited_to_laparotomy_or_laparoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure within 24 hours prior to enrollment is limited to laparotomy or laparoscopy.","when_to_set_to_false":"Set to false if the surgical procedure within 24 hours prior to enrollment is not limited to laparotomy or laparoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure within 24 hours prior to enrollment is limited to laparotomy or laparoscopy.","meaning":"Boolean indicating whether the surgical procedure within 24 hours prior to enrollment is limited to laparotomy or laparoscopy."} ;; "surgical procedure (laparotomy or laparoscopy) performed within 24 hours prior to enrollment"
(declare-const patient_is_exposed_to_purulent_discharge_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to purulent discharge (purulent exudates).","when_to_set_to_false":"Set to false if the patient is currently not exposed to purulent discharge (purulent exudates).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to purulent discharge (purulent exudates).","meaning":"Boolean indicating whether the patient is currently exposed to purulent discharge (purulent exudates)."} ;; "purulent exudates"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_gross_peritoneal_inflammation_now@@accompanied_by_purulent_exudates
         patient_has_finding_of_gross_peritoneal_inflammation_now)
     :named REQ4_AUXILIARY0)) ;; "gross peritoneal inflammation with purulent exudates"

(assert
  (! (=> patient_has_finding_of_gross_peritoneal_inflammation_now@@classified_as_peritonitis
         patient_has_finding_of_gross_peritoneal_inflammation_now)
     :named REQ4_AUXILIARY1)) ;; "gross peritoneal inflammation with purulent exudates (i.e. peritonitis)"

(assert
  (! (=> patient_has_finding_of_perforation_of_intestine_now@@macroscopic
         patient_has_finding_of_perforation_of_intestine_now)
     :named REQ4_AUXILIARY2)) ;; "macroscopic intestinal perforation"

(assert
  (! (=> patient_has_finding_of_perforation_of_intestine_now@@associated_with_localized_peritonitis
         patient_has_finding_of_perforation_of_intestine_now)
     :named REQ4_AUXILIARY3)) ;; "macroscopic intestinal perforation with localized peritonitis"

(assert
  (! (=> patient_has_finding_of_perforation_of_intestine_now@@associated_with_diffuse_peritonitis
         patient_has_finding_of_perforation_of_intestine_now)
     :named REQ4_AUXILIARY4)) ;; "macroscopic intestinal perforation with diffuse peritonitis"

(assert
  (! (=> patient_has_undergone_surgical_procedure_within_24_hours_prior_to_enrollment@@limited_to_laparotomy_or_laparoscopy
         patient_has_undergone_surgical_procedure_within_24_hours_prior_to_enrollment)
     :named REQ4_AUXILIARY5)) ;; "surgical procedure (laparotomy or laparoscopy) performed within 24 hours prior to enrollment"

;; Exhaustive subcategories: surgical procedure within 24h ≡ laparotomy or laparoscopy within 24h
(assert
  (! (= patient_has_undergone_surgical_procedure_within_24_hours_prior_to_enrollment
        patient_has_undergone_surgical_procedure_within_24_hours_prior_to_enrollment@@limited_to_laparotomy_or_laparoscopy)
     :named REQ4_AUXILIARY6)) ;; "surgical procedure (laparotomy or laparoscopy) performed within 24 hours prior to enrollment"

;; Exhaustive subcategories: gross peritoneal inflammation with purulent exudates ≡ peritonitis
(assert
  (! (= patient_has_finding_of_gross_peritoneal_inflammation_now@@classified_as_peritonitis
        patient_has_finding_of_gross_peritoneal_inflammation_now@@accompanied_by_purulent_exudates)
     :named REQ4_AUXILIARY7)) ;; "gross peritoneal inflammation with purulent exudates (i.e. peritonitis)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; If the patient has a confirmed intra-abdominal infection, then must have had a surgical procedure (laparotomy or laparoscopy) within 24h prior to enrollment that revealed at least one of:
;; - gross peritoneal inflammation with purulent exudates (i.e. peritonitis)
;; - intra-abdominal abscess
;; - macroscopic intestinal perforation with localized peritonitis
;; - macroscopic intestinal perforation with diffuse peritonitis

(assert
  (! (=> patient_has_finding_of_infectious_disease_of_abdomen_now@@confirmed
         (and patient_has_undergone_surgical_procedure_within_24_hours_prior_to_enrollment@@limited_to_laparotomy_or_laparoscopy
              (or patient_has_finding_of_gross_peritoneal_inflammation_now@@classified_as_peritonitis
                  patient_has_finding_of_abdominal_abscess_now
                  (and patient_has_finding_of_perforation_of_intestine_now@@macroscopic
                       patient_has_finding_of_perforation_of_intestine_now@@associated_with_localized_peritonitis)
                  (and patient_has_finding_of_perforation_of_intestine_now@@macroscopic
                       patient_has_finding_of_perforation_of_intestine_now@@associated_with_diffuse_peritonitis))))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient has a confirmed intra-abdominal infection, the patient must have had a surgical procedure (laparotomy or laparoscopy) performed within 24 hours prior to enrollment that revealed at least one of the following: gross peritoneal inflammation with purulent exudates (i.e. peritonitis), intra-abdominal abscess, macroscopic intestinal perforation with localized peritonitis, or macroscopic intestinal perforation with diffuse peritonitis"

;; ===================== Declarations for the inclusion criterion (REQ 5, COMPONENT 2) =====================
(declare-const patient_has_finding_of_abdominal_tenderness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of abdominal tenderness.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of abdominal tenderness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of abdominal tenderness.","meaning":"Boolean indicating whether the patient currently has a finding of abdominal tenderness."} ;; "abdominal tenderness (with or without rebound)"
(declare-const patient_has_finding_of_abdominal_involuntary_guarding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of involuntary abdominal guarding.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of involuntary abdominal guarding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of involuntary abdominal guarding.","meaning":"Boolean indicating whether the patient currently has a finding of involuntary abdominal guarding."} ;; "involuntary abdominal guarding"
(declare-const patient_has_finding_of_bowel_sounds_absent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of absent bowel sounds.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of absent bowel sounds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of absent bowel sounds.","meaning":"Boolean indicating whether the patient currently has a finding of absent bowel sounds."} ;; "absent bowel sounds"
(declare-const patient_has_finding_of_diminished_bowel_sounds_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of diminished bowel sounds.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of diminished bowel sounds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of diminished bowel sounds.","meaning":"Boolean indicating whether the patient currently has a finding of diminished bowel sounds."} ;; "diminished bowel sounds"
(declare-const patient_has_finding_of_abdominal_rigidity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of abdominal wall rigidity.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of abdominal wall rigidity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of abdominal wall rigidity.","meaning":"Boolean indicating whether the patient currently has a finding of abdominal wall rigidity."} ;; "abdominal wall rigidity"

;; ===================== Constraint Assertions (REQ 5, COMPONENT 2) =====================
(assert
  (! (or patient_has_finding_of_abdominal_tenderness_now
         patient_has_finding_of_abdominal_involuntary_guarding_now
         patient_has_finding_of_bowel_sounds_absent_now
         patient_has_finding_of_diminished_bowel_sounds_now
         patient_has_finding_of_abdominal_rigidity_now)
     :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "abdominal tenderness (with or without rebound) OR involuntary abdominal guarding OR absent bowel sounds OR diminished bowel sounds OR abdominal wall rigidity"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_will_undergo_laparoscopy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a laparoscopy in the future (relative to enrollment).","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo a laparoscopy in the future (relative to enrollment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo a laparoscopy in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo a laparoscopy in the future."} ;; "laparoscopy"
(declare-const patient_will_undergo_laparoscopy_inthefuture@@temporalcontext_within_24_hours_of_enrollment_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a laparoscopy within 24 hours of enrollment in the study.","when_to_set_to_false":"Set to false if the patient is scheduled for laparoscopy but not within 24 hours of enrollment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduling is within 24 hours of enrollment.","meaning":"Boolean indicating whether the scheduling of laparoscopy is within 24 hours of enrollment in the study."} ;; "laparoscopy within 24 hours of enrollment"
(declare-const patient_will_undergo_laparotomy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a laparotomy in the future (relative to enrollment).","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo a laparotomy in the future (relative to enrollment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo a laparotomy in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo a laparotomy in the future."} ;; "laparotomy"
(declare-const patient_will_undergo_laparotomy_inthefuture@@temporalcontext_within_24_hours_of_enrollment_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a laparotomy within 24 hours of enrollment in the study.","when_to_set_to_false":"Set to false if the patient is scheduled for laparotomy but not within 24 hours of enrollment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduling is within 24 hours of enrollment.","meaning":"Boolean indicating whether the scheduling of laparotomy is within 24 hours of enrollment in the study."} ;; "laparotomy within 24 hours of enrollment"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_will_undergo_laparoscopy_inthefuture@@temporalcontext_within_24_hours_of_enrollment_in_study
         patient_will_undergo_laparoscopy_inthefuture)
     :named REQ6_AUXILIARY0)) ;; "laparoscopy within 24 hours of enrollment implies laparoscopy scheduled"

(assert
  (! (=> patient_will_undergo_laparotomy_inthefuture@@temporalcontext_within_24_hours_of_enrollment_in_study
         patient_will_undergo_laparotomy_inthefuture)
     :named REQ6_AUXILIARY1)) ;; "laparotomy within 24 hours of enrollment implies laparotomy scheduled"

;; Exhaustive subcategories: surgical procedure ≡ (laparotomy OR laparoscopy)
(define-fun patient_will_undergo_surgical_procedure_inthefuture@@temporalcontext_within_24_hours_of_enrollment_in_study () Bool
  (or patient_will_undergo_laparotomy_inthefuture@@temporalcontext_within_24_hours_of_enrollment_in_study
      patient_will_undergo_laparoscopy_inthefuture@@temporalcontext_within_24_hours_of_enrollment_in_study)) ;; "surgical procedure (laparotomy or laparoscopy) within 24 hours of enrollment"

;; ===================== Constraint Assertions (REQ 6) =====================
;; If the patient is enrolled on the basis of a suspected intra-abdominal infection, they must be scheduled for laparotomy or laparoscopy within 24 hours of enrollment.
(assert
  (! (or (not patient_has_finding_of_infectious_disease_of_abdomen_now@@suspected_as_defined_in_following_criteria)
         patient_will_undergo_surgical_procedure_inthefuture@@temporalcontext_within_24_hours_of_enrollment_in_study)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "If enrolled on basis of suspected intra-abdominal infection, must be scheduled for laparotomy or laparoscopy within 24 hours of enrollment"
