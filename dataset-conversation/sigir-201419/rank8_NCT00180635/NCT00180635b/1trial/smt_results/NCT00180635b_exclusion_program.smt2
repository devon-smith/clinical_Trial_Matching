;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (i.e., taking or receiving) steroid medications.","when_to_set_to_false":"Set to false if the patient is not currently exposed to steroid medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to steroid medications.","meaning":"Boolean indicating whether the patient is currently exposed to steroid medications."} ;; "concomitant use of oral steroid medications"
(declare-const patient_is_exposed_to_steroid_now@@administered_orally_as_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to steroids is via oral administration as a medication.","when_to_set_to_false":"Set to false if the patient's current exposure to steroids is not via oral administration as a medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current steroid exposure is via oral administration as a medication.","meaning":"Boolean indicating whether the patient's current steroid exposure is via oral administration as a medication."} ;; "oral steroid medications"
(declare-const patient_is_exposed_to_steroid_now@@used_concomitantly Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to steroids is concomitant with the study intervention or relevant period.","when_to_set_to_false":"Set to false if the patient's current exposure to steroids is not concomitant with the study intervention or relevant period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current steroid exposure is concomitant with the study intervention or relevant period.","meaning":"Boolean indicating whether the patient's current steroid exposure is concomitant with the study intervention or relevant period."} ;; "concomitant use"
(declare-const patient_is_exposed_to_steroid_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to (i.e., took or received) steroid medications at any time within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient was not exposed to steroid medications at any time within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to steroid medications within the past 4 weeks.","meaning":"Boolean indicating whether the patient was exposed to steroid medications within the past 4 weeks."} ;; "pre-treatment with oral steroid medications within the last four weeks"
(declare-const patient_is_exposed_to_steroid_inthepast4weeks@@administered_orally_as_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to steroids within the past 4 weeks was via oral administration as a medication.","when_to_set_to_false":"Set to false if the patient's exposure to steroids within the past 4 weeks was not via oral administration as a medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's steroid exposure within the past 4 weeks was via oral administration as a medication.","meaning":"Boolean indicating whether the patient's steroid exposure within the past 4 weeks was via oral administration as a medication."} ;; "oral steroid medications"
(declare-const patient_is_exposed_to_steroid_inthepast4weeks@@used_as_pre_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to steroids within the past 4 weeks was as pre-treatment (i.e., before the main intervention or screening).","when_to_set_to_false":"Set to false if the patient's exposure to steroids within the past 4 weeks was not as pre-treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's steroid exposure within the past 4 weeks was as pre-treatment.","meaning":"Boolean indicating whether the patient's steroid exposure within the past 4 weeks was as pre-treatment."} ;; "pre-treatment"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_steroid_now@@administered_orally_as_medication
      patient_is_exposed_to_steroid_now)
:named REQ0_AUXILIARY0)) ;; "oral steroid medications"

(assert
(! (=> patient_is_exposed_to_steroid_now@@used_concomitantly
      patient_is_exposed_to_steroid_now)
:named REQ0_AUXILIARY1)) ;; "concomitant use"

(assert
(! (=> patient_is_exposed_to_steroid_inthepast4weeks@@administered_orally_as_medication
      patient_is_exposed_to_steroid_inthepast4weeks)
:named REQ0_AUXILIARY2)) ;; "oral steroid medications"

(assert
(! (=> patient_is_exposed_to_steroid_inthepast4weeks@@used_as_pre_treatment
      patient_is_exposed_to_steroid_inthepast4weeks)
:named REQ0_AUXILIARY3)) ;; "pre-treatment"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have concomitant use of oral steroid medications
(assert
(! (not patient_is_exposed_to_steroid_now@@administered_orally_as_medication)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "concomitant use of oral steroid medications"

;; Exclusion: patient must NOT have pre-treatment with oral steroid medications within the last four weeks
(assert
(! (not (and patient_is_exposed_to_steroid_inthepast4weeks@@administered_orally_as_medication
             patient_is_exposed_to_steroid_inthepast4weeks@@used_as_pre_treatment))
:named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "pre-treatment with oral steroid medications within the last four weeks"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_respiratory_tract_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a respiratory tract infection at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a respiratory tract infection at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a respiratory tract infection.","meaning":"Boolean indicating whether the patient has ever had a respiratory tract infection in their history."} ;; "respiratory tract infection"

(declare-const patient_has_finding_of_respiratory_tract_infection_inthehistory@@temporalcontext_within4weeks_prior_to_trial_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a respiratory tract infection and the infection occurred within four weeks prior to entry into the trial.","when_to_set_to_false":"Set to false if the patient has had a respiratory tract infection but not within four weeks prior to entry into the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the respiratory tract infection occurred within four weeks prior to trial entry.","meaning":"Boolean indicating whether the patient's respiratory tract infection occurred within four weeks prior to entry into the trial."} ;; "respiratory tract infection within four weeks prior to entry into the trial"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_respiratory_tract_infection_inthehistory@@temporalcontext_within4weeks_prior_to_trial_entry
      patient_has_finding_of_respiratory_tract_infection_inthehistory)
   :named REQ1_AUXILIARY0)) ;; "respiratory tract infection within four weeks prior to entry into the trial" implies "respiratory tract infection"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_respiratory_tract_infection_inthehistory@@temporalcontext_within4weeks_prior_to_trial_entry)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a respiratory tract infection within four weeks prior to entry into the trial."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is currently documented as female."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as lactating.","when_to_set_to_false":"Set to false if the patient is currently documented as not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (and patient_sex_is_female_now
               (or patient_is_pregnant_now
                   patient_is_lactating_now)))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is female AND (the patient is pregnant OR the patient is lactating)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has drug abuse (i.e., current drug abuse).","when_to_set_to_false":"Set to false if the patient currently does not have drug abuse (i.e., current drug abuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has drug abuse (i.e., current drug abuse).","meaning":"Boolean indicating whether the patient currently has drug abuse (i.e., current drug abuse)."} ;; "the patient has a history of current drug abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had drug abuse (i.e., past drug abuse).","when_to_set_to_false":"Set to false if the patient has never had drug abuse (i.e., past drug abuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had drug abuse (i.e., past drug abuse).","meaning":"Boolean indicating whether the patient has ever had drug abuse (i.e., past drug abuse)."} ;; "the patient has a history of past drug abuse"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alcohol abuse (i.e., current alcohol abuse).","when_to_set_to_false":"Set to false if the patient currently does not have alcohol abuse (i.e., current alcohol abuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol abuse (i.e., current alcohol abuse).","meaning":"Boolean indicating whether the patient currently has alcohol abuse (i.e., current alcohol abuse)."} ;; "the patient has a history of current alcohol abuse"
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had alcohol abuse (i.e., past alcohol abuse).","when_to_set_to_false":"Set to false if the patient has never had alcohol abuse (i.e., past alcohol abuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had alcohol abuse (i.e., past alcohol abuse).","meaning":"Boolean indicating whether the patient has ever had alcohol abuse (i.e., past alcohol abuse)."} ;; "the patient has a history of past alcohol abuse"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of current drug abuse."

(assert
  (! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of past drug abuse."

(assert
  (! (not patient_has_finding_of_alcohol_abuse_now)
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of current alcohol abuse."

(assert
  (! (not patient_has_finding_of_alcohol_abuse_inthehistory)
     :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of past alcohol abuse."
