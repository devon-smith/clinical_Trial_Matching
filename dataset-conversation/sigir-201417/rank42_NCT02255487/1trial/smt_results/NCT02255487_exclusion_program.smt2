;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_allergy_to_chlorhexidine_gluconate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to chlorhexidine gluconate.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to chlorhexidine gluconate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to chlorhexidine gluconate.","meaning":"Boolean indicating whether the patient currently has an allergy to chlorhexidine gluconate."} ;; "The patient is excluded if the patient has a known allergy to chlorhexidine gluconate."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_allergy_to_chlorhexidine_gluconate_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to chlorhexidine gluconate."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const abbreviated_injury_scale_score_value_recorded_at_time_of_surgery_withunit_none Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Abbreviated Injury Scale score measured at the time of surgery.","when_to_set_to_null":"Set to null if the score at the time of surgery is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's Abbreviated Injury Scale score measured at the time of surgery. No unit is used; the score is a scale value."} ;; "estimated Abbreviated Injury Scale score = 6 at the time of surgery"
(declare-const patient_has_finding_of_traumatic_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of traumatic injury.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of traumatic injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding or diagnosis of traumatic injury.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of traumatic injury."} ;; "trauma"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_has_finding_of_traumatic_injury_now
             (= abbreviated_injury_scale_score_value_recorded_at_time_of_surgery_withunit_none 6)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has trauma) AND (the patient has an estimated Abbreviated Injury Scale score = 6 at the time of surgery)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_american_society_of_anesthesiologists_physical_status_class_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's American Society of Anesthesiologists Physical Status Classification score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current American Society of Anesthesiologists Physical Status Classification score."} ;; "American Society of Anesthesiologists Physical Status Classification score"

(declare-const principal_investigator_finds_patient_stable_enough_for_study_participation_now Bool) ;; {"when_to_set_to_true":"Set to true if the principal investigator currently finds the patient stable enough for study participation.","when_to_set_to_false":"Set to false if the principal investigator currently does NOT find the patient stable enough for study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the principal investigator currently finds the patient stable enough for study participation.","meaning":"Boolean indicating whether the principal investigator currently finds the patient stable enough for study participation."} ;; "the principal investigator does NOT find the patient stable enough for study participation despite a score of 5"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (and (>= patient_american_society_of_anesthesiologists_physical_status_class_value_recorded_now_withunit_none 5)
               (not principal_investigator_finds_patient_stable_enough_for_study_participation_now)))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has an American Society of Anesthesiologists Physical Status Classification score ≥ 5) AND (the principal investigator does NOT find the patient stable enough for study participation despite a score of 5))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently documented as not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_sex_is_female_now
             (or patient_is_pregnant_now
                 patient_is_breastfeeding_now)))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is female AND (the patient is pregnant OR the patient is breastfeeding)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_laparotomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a laparotomy at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a laparotomy at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a laparotomy.","meaning":"Boolean indicating whether the patient has ever undergone a laparotomy in their history."} ;; "laparotomy"
(declare-const patient_has_undergone_laparotomy_inthehistory@@indication_damage_control Bool) ;; {"when_to_set_to_true":"Set to true if the patient's laparotomy was performed specifically for damage control purposes.","when_to_set_to_false":"Set to false if the patient's laparotomy was not performed for damage control purposes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the laparotomy was performed for damage control purposes.","meaning":"Boolean indicating whether the patient's laparotomy was performed for damage control."} ;; "damage control laparotomy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable for damage control indication implies the patient has undergone laparotomy
(assert
(! (=> patient_has_undergone_laparotomy_inthehistory@@indication_damage_control
      patient_has_undergone_laparotomy_inthehistory)
    :named REQ4_AUXILIARY0)) ;; "damage control laparotomy" implies "laparotomy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_laparotomy_inthehistory@@indication_damage_control)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone damage control laparotomy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_abdomen_incision_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an abdominal incision at any time in the past, regardless of location or context.","when_to_set_to_false":"Set to false if the patient has never undergone an abdominal incision at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an abdominal incision.","meaning":"Boolean indicating whether the patient has ever undergone an abdominal incision in the past."} ;; "abdominal incision"
(declare-const patient_has_undergone_abdomen_incision_inthehistory@@created_prior_to_entering_operating_room Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an abdominal incision and the incision was created prior to entering the operating room.","when_to_set_to_false":"Set to false if the patient has ever undergone an abdominal incision but the incision was not created prior to entering the operating room.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the incision was created prior to entering the operating room.","meaning":"Boolean indicating whether the patient's abdominal incision was created prior to entering the operating room."} ;; "abdominal incision created prior to entering the operating room"
(declare-const patient_has_undergone_abdomen_incision_inthehistory@@made_in_trauma_bay Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an abdominal incision and the incision was made in the trauma bay.","when_to_set_to_false":"Set to false if the patient has ever undergone an abdominal incision but the incision was not made in the trauma bay.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the incision was made in the trauma bay.","meaning":"Boolean indicating whether the patient's abdominal incision was made in the trauma bay."} ;; "an abdominal incision made in the trauma bay"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive example: incision in trauma bay implies created prior to entering OR
(assert
(! (=> patient_has_undergone_abdomen_incision_inthehistory@@made_in_trauma_bay
      patient_has_undergone_abdomen_incision_inthehistory@@created_prior_to_entering_operating_room)
   :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (an abdominal incision made in the trauma bay to cross clamp the aorta)."

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_undergone_abdomen_incision_inthehistory@@created_prior_to_entering_operating_room
      patient_has_undergone_abdomen_incision_inthehistory)
   :named REQ5_AUXILIARY1)) ;; "abdominal incision created prior to entering the operating room" implies "abdominal incision"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_undergone_abdomen_incision_inthehistory@@made_in_trauma_bay
      patient_has_undergone_abdomen_incision_inthehistory)
   :named REQ5_AUXILIARY2)) ;; "abdominal incision made in the trauma bay" implies "abdominal incision"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_abdomen_incision_inthehistory@@created_prior_to_entering_operating_room)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had an abdominal incision created prior to entering the operating room with non-exhaustive examples (an abdominal incision made in the trauma bay to cross clamp the aorta)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in a clinical trial.","when_to_set_to_false":"Set to false if the patient is not currently enrolled in a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in a clinical trial.","meaning":"Boolean indicating whether the patient is currently enrolled in a clinical trial."} ;; "the patient is currently enrolled in a clinical trial"
(declare-const patient_is_undergoing_clinical_trial_now@@is_interventional_and_randomized Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial is both interventional and randomized.","when_to_set_to_false":"Set to false if the clinical trial is not both interventional and randomized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial is both interventional and randomized.","meaning":"Boolean indicating whether the clinical trial is both interventional and randomized."} ;; "interventional randomized clinical trial"
(declare-const patient_is_undergoing_clinical_trial_now@@is_ongoing_at_time_of_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial is ongoing at the time of the patient's enrollment.","when_to_set_to_false":"Set to false if the clinical trial is not ongoing at the time of the patient's enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial is ongoing at the time of the patient's enrollment.","meaning":"Boolean indicating whether the clinical trial is ongoing at the time of the patient's enrollment."} ;; "ongoing interventional randomized clinical trial"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_undergoing_clinical_trial_now@@is_interventional_and_randomized
      patient_is_undergoing_clinical_trial_now)
:named REQ6_AUXILIARY0)) ;; "interventional randomized clinical trial"

(assert
(! (=> patient_is_undergoing_clinical_trial_now@@is_ongoing_at_time_of_enrollment
      patient_is_undergoing_clinical_trial_now)
:named REQ6_AUXILIARY1)) ;; "ongoing interventional randomized clinical trial"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_is_undergoing_clinical_trial_now
             patient_is_undergoing_clinical_trial_now@@is_interventional_and_randomized
             patient_is_undergoing_clinical_trial_now@@is_ongoing_at_time_of_enrollment))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently enrolled in an ongoing interventional randomized clinical trial."
