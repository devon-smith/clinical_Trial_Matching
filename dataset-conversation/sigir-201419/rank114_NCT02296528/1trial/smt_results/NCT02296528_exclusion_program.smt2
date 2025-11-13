;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_oropharyngeal_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of oropharyngeal dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of oropharyngeal dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has oropharyngeal dysphagia.","meaning":"Boolean indicating whether the patient currently has oropharyngeal dysphagia."} ;; "oropharyngeal dysphagia"

(declare-const patient_has_finding_of_oropharyngeal_dysphagia_now@@profound_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has oropharyngeal dysphagia and the severity is profound.","when_to_set_to_false":"Set to false if the patient currently has oropharyngeal dysphagia but the severity is not profound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of oropharyngeal dysphagia is profound.","meaning":"Boolean indicating whether the patient currently has oropharyngeal dysphagia with profound severity."} ;; "profound oropharyngeal dysphagia"

(declare-const patient_is_feeding_tube_dependent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently dependent on a feeding tube.","when_to_set_to_false":"Set to false if the patient is currently not dependent on a feeding tube.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently dependent on a feeding tube.","meaning":"Boolean indicating whether the patient is currently dependent on a feeding tube."} ;; "feeding tube dependent"

(declare-const feeding_tube_dependence_duration_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has been dependent on a feeding tube as of now.","when_to_set_to_null":"Set to null if the duration of feeding tube dependence is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration, in months, that the patient has been dependent on a feeding tube as of now."} ;; "duration of feeding tube dependence is less than twelve months"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_oropharyngeal_dysphagia_now@@profound_severity
      patient_has_finding_of_oropharyngeal_dysphagia_now)
   :named REQ0_AUXILIARY0)) ;; "profound oropharyngeal dysphagia"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT satisfy all three conditions simultaneously
(assert
(! (not (and patient_has_finding_of_oropharyngeal_dysphagia_now@@profound_severity
             patient_is_feeding_tube_dependent_now
             (< feeding_tube_dependence_duration_value_recorded_now_in_months 12)))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has profound oropharyngeal dysphagia) AND (the patient is feeding tube dependent) AND (the duration of feeding tube dependence is less than twelve months)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_esophageal_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has esophageal phase dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have esophageal phase dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has esophageal phase dysphagia.","meaning":"Boolean indicating whether the patient currently has esophageal phase dysphagia."} ;; "esophageal phase dysphagia"

(declare-const patient_has_finding_of_esophageal_dysmotility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has esophageal dysmotility, either by personal history or documented diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have esophageal dysmotility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has esophageal dysmotility.","meaning":"Boolean indicating whether the patient currently has esophageal dysmotility."} ;; "personal history of esophageal dysmotility OR documented diagnosis of esophageal dysmotility"

(declare-const patient_has_finding_of_hiatal_hernia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hiatal hernia, either by personal history or documented diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have hiatal hernia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hiatal hernia.","meaning":"Boolean indicating whether the patient currently has hiatal hernia."} ;; "personal history of hiatal hernia OR documented diagnosis of hiatal hernia"

(declare-const patient_has_finding_of_stricture_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stricture of esophagus, either by personal history or documented diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have stricture of esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stricture of esophagus.","meaning":"Boolean indicating whether the patient currently has stricture of esophagus."} ;; "personal history of esophageal stricture OR documented diagnosis of esophageal stricture"

(declare-const patient_has_finding_of_eosinophilic_esophagitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has eosinophilic esophagitis, either by personal history or documented diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have eosinophilic esophagitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has eosinophilic esophagitis.","meaning":"Boolean indicating whether the patient currently has eosinophilic esophagitis."} ;; "personal history of eosinophilic esophagitis OR documented diagnosis of eosinophilic esophagitis"

(declare-const patient_has_finding_of_erosive_peptic_esophagitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has erosive peptic esophagitis, either by personal history or documented diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have erosive peptic esophagitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has erosive peptic esophagitis.","meaning":"Boolean indicating whether the patient currently has erosive peptic esophagitis, either by personal history or documented diagnosis."} ;; "personal history of erosive peptic esophagitis OR documented diagnosis of erosive peptic esophagitis"

(declare-const patient_has_finding_of_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a systemic disease.","meaning":"Boolean indicating whether the patient currently has a systemic disease."} ;; "personal history of systemic disease affecting the esophagus OR documented diagnosis of systemic disease affecting the esophagus"

(declare-const patient_has_finding_of_systemic_disease_now@@affecting_esophagus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's systemic disease affects the esophagus.","when_to_set_to_false":"Set to false if the patient's systemic disease does not affect the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's systemic disease affects the esophagus.","meaning":"Boolean indicating whether the patient's systemic disease affects the esophagus."} ;; "systemic disease affecting the esophagus"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: esophageal phase dysphagia is present if any of the listed findings are present
(assert
(! (= patient_has_finding_of_esophageal_dysphagia_now
(or patient_has_finding_of_esophageal_dysmotility_now
    patient_has_finding_of_hiatal_hernia_now
    patient_has_finding_of_stricture_of_esophagus_now
    patient_has_finding_of_eosinophilic_esophagitis_now
    patient_has_finding_of_erosive_peptic_esophagitis_now
    patient_has_finding_of_systemic_disease_now@@affecting_esophagus))
:named REQ1_AUXILIARY0)) ;; "as defined by ((personal history of esophageal dysmotility) OR (documented diagnosis of esophageal dysmotility) OR (personal history of hiatal hernia) OR (documented diagnosis of hiatal hernia) OR (personal history of esophageal stricture) OR (documented diagnosis of esophageal stricture) OR (personal history of eosinophilic esophagitis) OR (documented diagnosis of eosinophilic esophagitis) OR (personal history of erosive peptic esophagitis) OR (documented diagnosis of erosive peptic esophagitis) OR (personal history of systemic disease affecting the esophagus) OR (documented diagnosis of systemic disease affecting the esophagus))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_systemic_disease_now@@affecting_esophagus
       patient_has_finding_of_systemic_disease_now)
:named REQ1_AUXILIARY1)) ;; "systemic disease affecting the esophagus" implies "systemic disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_esophageal_dysphagia_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has esophageal phase dysphagia, as defined by ..."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_foods_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to consume any food by mouth.","when_to_set_to_false":"Set to false if the patient is currently unable to consume any food by mouth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to consume any food by mouth.","meaning":"Boolean indicating whether the patient is currently exposed to (consumes) foods."} ;; "food"
(declare-const patient_is_exposed_to_foods_now@@consumed_by_mouth Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to foods is specifically by mouth.","when_to_set_to_false":"Set to false if the patient's exposure to foods is not by mouth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to foods is by mouth.","meaning":"Boolean indicating whether the patient's exposure to foods is specifically by mouth."} ;; "consumed by mouth"
(declare-const patient_is_exposed_to_foods_now@@documented_by_fluoroscopic_swallow_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ability to consume foods by mouth is documented by fluoroscopic swallow study.","when_to_set_to_false":"Set to false if the patient's ability to consume foods by mouth is not documented by fluoroscopic swallow study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ability to consume foods by mouth is documented by fluoroscopic swallow study.","meaning":"Boolean indicating whether the patient's ability to consume foods by mouth is documented by fluoroscopic swallow study."} ;; "documented by fluoroscopic swallow study"
(declare-const patient_is_exposed_to_liquid_substance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to consume any liquid by mouth.","when_to_set_to_false":"Set to false if the patient is currently unable to consume any liquid by mouth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to consume any liquid by mouth.","meaning":"Boolean indicating whether the patient is currently exposed to (consumes) liquid substances."} ;; "liquid"
(declare-const patient_is_exposed_to_liquid_substance_now@@consumed_by_mouth Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to liquid substances is specifically by mouth.","when_to_set_to_false":"Set to false if the patient's exposure to liquid substances is not by mouth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to liquid substances is by mouth.","meaning":"Boolean indicating whether the patient's exposure to liquid substances is specifically by mouth."} ;; "consumed by mouth"
(declare-const patient_is_exposed_to_liquid_substance_now@@documented_by_fluoroscopic_swallow_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ability to consume liquid substances by mouth is documented by fluoroscopic swallow study.","when_to_set_to_false":"Set to false if the patient's ability to consume liquid substances by mouth is not documented by fluoroscopic swallow study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ability to consume liquid substances by mouth is documented by fluoroscopic swallow study.","meaning":"Boolean indicating whether the patient's ability to consume liquid substances by mouth is documented by fluoroscopic swallow study."} ;; "documented by fluoroscopic swallow study"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_foods_now@@consumed_by_mouth
      patient_is_exposed_to_foods_now)
:named REQ2_AUXILIARY0)) ;; "consumed by mouth"

(assert
(! (=> patient_is_exposed_to_foods_now@@documented_by_fluoroscopic_swallow_study
      patient_is_exposed_to_foods_now@@consumed_by_mouth)
:named REQ2_AUXILIARY1)) ;; "as documented by fluoroscopic swallow study"

(assert
(! (=> patient_is_exposed_to_liquid_substance_now@@consumed_by_mouth
      patient_is_exposed_to_liquid_substance_now)
:named REQ2_AUXILIARY2)) ;; "consumed by mouth"

(assert
(! (=> patient_is_exposed_to_liquid_substance_now@@documented_by_fluoroscopic_swallow_study
      patient_is_exposed_to_liquid_substance_now@@consumed_by_mouth)
:named REQ2_AUXILIARY3)) ;; "as documented by fluoroscopic swallow study"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_exposed_to_foods_now@@documented_by_fluoroscopic_swallow_study)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is able to safely consume any food by mouth, as documented by fluoroscopic swallow study."

(assert
(! (not patient_is_exposed_to_liquid_substance_now@@documented_by_fluoroscopic_swallow_study)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is able to safely consume any liquid by mouth, as documented by fluoroscopic swallow study."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "individuals under sixty-five years of age" / "individuals over sixty-five years of age"
(declare-const upper_esophageal_sphincter_opening_value_recorded_on_fluoroscopic_swallow_study_in_cm Real) ;; {"when_to_set_to_value":"Set to the measured value in centimeters if the upper esophageal sphincter opening is recorded on a fluoroscopic swallow study.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined from a fluoroscopic swallow study.","meaning":"Numeric value indicating the measured upper esophageal sphincter opening in centimeters, as recorded on a fluoroscopic swallow study."} ;; "upper esophageal sphincter opening greater than 0.55 centimeters for individuals under sixty-five years of age on fluoroscopic swallow study" / "upper esophageal sphincter opening greater than 0.40 centimeters for individuals over sixty-five years of age on fluoroscopic swallow study"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion if upper esophageal sphincter opening is normal for age group
(assert
(! (not (and
           (< patient_age_value_recorded_now_in_years 65)
           (> upper_esophageal_sphincter_opening_value_recorded_on_fluoroscopic_swallow_study_in_cm 0.55)))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "upper esophageal sphincter opening greater than 0.55 centimeters for individuals under sixty-five years of age on fluoroscopic swallow study"

(assert
(! (not (and
           (>= patient_age_value_recorded_now_in_years 65)
           (> upper_esophageal_sphincter_opening_value_recorded_on_fluoroscopic_swallow_study_in_cm 0.40)))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "upper esophageal sphincter opening greater than 0.40 centimeters for individuals over sixty-five years of age on fluoroscopic swallow study"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that the patient is currently pregnant, such as a positive pregnancy test result.","when_to_set_to_false":"Set to false if there is evidence that the patient is currently not pregnant, such as a negative pregnancy test result.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is currently pregnant, as evidenced by a positive result on a pregnancy test"

;; patient_age_value_recorded_now_in_years is already declared:
;; (declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than sixty years of age"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_is_pregnant_now
             (< patient_age_value_recorded_now_in_years 60)))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is currently pregnant, as evidenced by a positive result on a pregnancy test) AND (the patient is younger than sixty years of age))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
;; patient_age_value_recorded_now_in_years is already declared:
;; (declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "individuals under sixty-five years of age" / "individuals over sixty-five years of age"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (<= patient_age_value_recorded_now_in_years 17))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is seventeen years of age or younger."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_received_dysphagia_therapy_successfully_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had successful receipt of dysphagia therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has not had successful receipt of dysphagia therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had successful receipt of dysphagia therapy at any time in the past.","meaning":"Boolean indicating whether the patient has had successful receipt of dysphagia therapy in the history."} ;; "the patient has had successful receipt of dysphagia therapy"

(declare-const dysphagia_therapy_duration_value_recorded_within_3_months_of_study_enrollment_in_months Real) ;; {"when_to_set_to_value":"Set to the total number of months of dysphagia therapy the patient has received within three months prior to study enrollment.","when_to_set_to_null":"Set to null if the total duration of dysphagia therapy within three months prior to study enrollment is unknown, not documented, or cannot be determined.","meaning":"Numeric value (in months) of dysphagia therapy duration within three months prior to study enrollment."} ;; "less than three months of dysphagia therapy within three months of study enrollment"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_received_dysphagia_therapy_successfully_in_the_history)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had successful receipt of dysphagia therapy."

(assert
(! (not (< dysphagia_therapy_duration_value_recorded_within_3_months_of_study_enrollment_in_months 3))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had less than three months of dysphagia therapy within three months of study enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_ability_to_perform_general_manipulative_activities_value_recorded_now_withunit_block_and_box_test_score Real) ;; {"when_to_set_to_value":"Set to the measured Block and Box Test score if a numeric measurement of the patient's manual dexterity is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric Block and Box Test score representing the patient's current manual dexterity."} ;; "Block and Box Test score"
(declare-const patient_block_and_box_test_score_normal_limit_value_for_age_sex_and_hand_now_withunit_blocks Real) ;; {"when_to_set_to_value":"Set to the normal lower limit Block and Box Test score for the patient's age, sex, and hand if such reference data is available now.","when_to_set_to_null":"Set to null if no such reference value is available or the value is indeterminate.","meaning":"Numeric normal lower limit Block and Box Test score for the patient's age, sex, and hand."} ;; "normal limits per age, sex, and hand"
(declare-const patient_lacks_manual_dexterity_to_operate_swallowing_expansion_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently lacks sufficient manual dexterity to operate the swallowing expansion device.","when_to_set_to_false":"Set to false if the patient currently has sufficient manual dexterity to operate the swallowing expansion device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently lacks sufficient manual dexterity to operate the swallowing expansion device.","meaning":"Boolean indicating whether the patient currently lacks sufficient manual dexterity to operate the swallowing expansion device."} ;; "lacks manual dexterity to operate the swallowing expansion device"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "sex is female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "sex is male"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Definition: lacking manual dexterity to operate the device is determined by Block and Box Test score below normal limits per age, sex, and hand
(assert
(! (= patient_lacks_manual_dexterity_to_operate_swallowing_expansion_device_now
(< patient_ability_to_perform_general_manipulative_activities_value_recorded_now_withunit_block_and_box_test_score
   patient_block_and_box_test_score_normal_limit_value_for_age_sex_and_hand_now_withunit_blocks))
:named REQ7_AUXILIARY0)) ;; "as determined by a Block and Box Test score below the normal limits per age, sex, and hand."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_lacks_manual_dexterity_to_operate_swallowing_expansion_device_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient lacks manual dexterity to operate the swallowing expansion device, as determined by a Block and Box Test score below the normal limits per age, sex, and hand)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_unable_to_lift_five_pound_weight_off_table_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to lift a five pound weight off of a table.","when_to_set_to_false":"Set to false if the patient is currently able to lift a five pound weight off of a table.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to lift a five pound weight off of a table.","meaning":"Boolean indicating whether the patient is currently unable to lift a five pound weight off of a table."} ;; "the patient is unable to lift a five pound weight off of a table"
(declare-const patient_is_unable_to_keep_five_pound_weight_elevated_for_ten_seconds_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to keep a five pound weight elevated for ten seconds.","when_to_set_to_false":"Set to false if the patient is currently able to keep a five pound weight elevated for ten seconds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to keep a five pound weight elevated for ten seconds.","meaning":"Boolean indicating whether the patient is currently unable to keep a five pound weight elevated for ten seconds."} ;; "the patient is unable to keep a five pound weight elevated for ten seconds"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_is_unable_to_lift_five_pound_weight_off_table_now
             patient_is_unable_to_keep_five_pound_weight_elevated_for_ten_seconds_now))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is unable to lift a five pound weight off of a table) AND (the patient is unable to keep a five pound weight elevated for ten seconds))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const abbreviated_mental_test_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Abbreviated Mental Test Score (AMTS) recorded now, in points.","when_to_set_to_null":"Set to null if the patient's Abbreviated Mental Test Score (AMTS) is unknown, not documented, or cannot be determined at the present time.","meaning":"Numeric value of the patient's Abbreviated Mental Test Score (AMTS) recorded now, in points."} ;; "Abbreviated Mental Test Score less than six"

(declare-const patients_ability_to_perform_cognitive_activity_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has positive cognitive ability (i.e., possesses cognitive ability) now.","when_to_set_to_false":"Set to false if the patient currently does not have positive cognitive ability now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has positive cognitive ability now.","meaning":"Boolean indicating whether the patient currently has positive cognitive ability now."} ;; "cognitive ability"

(declare-const patients_ability_to_perform_cognitive_activity_is_positive_now@@evidenced_by_abbreviated_mental_test_score Bool) ;; {"when_to_set_to_true":"Set to true if the patient's positive cognitive ability now is evidenced by Abbreviated Mental Test Score.","when_to_set_to_false":"Set to false if the patient's positive cognitive ability now is not evidenced by Abbreviated Mental Test Score.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Abbreviated Mental Test Score evidences the patient's positive cognitive ability now.","meaning":"Boolean indicating whether the patient's positive cognitive ability now is evidenced by Abbreviated Mental Test Score."} ;; "as evidenced by an Abbreviated Mental Test Score less than six"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition: positive cognitive ability evidenced by AMTS requires AMTS >= 6
(assert
(! (= patients_ability_to_perform_cognitive_activity_is_positive_now@@evidenced_by_abbreviated_mental_test_score
    (>= abbreviated_mental_test_score_value_recorded_now_withunit_points 6))
:named REQ9_AUXILIARY0)) ;; "as evidenced by an Abbreviated Mental Test Score less than six"

;; Qualifier variable implies stem variable
(assert
(! (=> patients_ability_to_perform_cognitive_activity_is_positive_now@@evidenced_by_abbreviated_mental_test_score
    patients_ability_to_perform_cognitive_activity_is_positive_now)
:named REQ9_AUXILIARY1)) ;; "cognitive ability evidenced by AMTS implies cognitive ability"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient lacks cognitive ability to operate swallowing expansion device, as evidenced by AMTS < 6
(assert
(! (not patients_ability_to_perform_cognitive_activity_is_positive_now@@evidenced_by_abbreviated_mental_test_score)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient lacks cognitive ability to operate the swallowing expansion device, as evidenced by an Abbreviated Mental Test Score less than six"

;; Exclusion: patient lacks cognitive ability to provide informed consent, as evidenced by AMTS < 6
;; Since both exclusions are evidenced by AMTS < 6, and the same variable is used, the assertion is repeated for the second component.
(assert
(! (not patients_ability_to_perform_cognitive_activity_is_positive_now@@evidenced_by_abbreviated_mental_test_score)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient lacks cognitive ability to provide informed consent, as evidenced by an Abbreviated Mental Test Score less than six"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_active_tumor_involving_cricoid_cartilage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an active tumor that involves the cricoid cartilage.","when_to_set_to_false":"Set to false if the patient currently does not have an active tumor involving the cricoid cartilage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an active tumor involving the cricoid cartilage.","meaning":"Boolean indicating whether the patient currently has an active tumor involving the cricoid cartilage."} ;; "the patient has an active tumor involving the cricoid cartilage"
(declare-const patient_has_active_tumor_involving_laryngeal_cartilage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an active tumor that involves the laryngeal cartilage.","when_to_set_to_false":"Set to false if the patient currently does not have an active tumor involving the laryngeal cartilage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an active tumor involving the laryngeal cartilage.","meaning":"Boolean indicating whether the patient currently has an active tumor involving the laryngeal cartilage."} ;; "the patient has an active tumor involving the laryngeal cartilage"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_active_tumor_involving_cricoid_cartilage_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an active tumor involving the cricoid cartilage."

(assert
(! (not patient_has_active_tumor_involving_laryngeal_cartilage_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an active tumor involving the laryngeal cartilage."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_personal_history_of_allergic_reaction_to_titanium Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented personal history of allergic reaction to titanium.","when_to_set_to_false":"Set to false if the patient does not have a documented personal history of allergic reaction to titanium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a personal history of allergic reaction to titanium.","meaning":"Boolean indicating whether the patient has a personal history of allergic reaction to titanium."} ;; "the patient has a personal history of allergic reaction to titanium"
(declare-const patient_has_personal_history_of_adverse_reaction_to_titanium Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented personal history of adverse reaction to titanium.","when_to_set_to_false":"Set to false if the patient does not have a documented personal history of adverse reaction to titanium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a personal history of adverse reaction to titanium.","meaning":"Boolean indicating whether the patient has a personal history of adverse reaction to titanium."} ;; "the patient has a personal history of adverse reaction to titanium"

(declare-const patient_has_known_allergic_reaction_to_titanium Bool) ;; {"when_to_set_to_true":"Set to true if the patient is known to have an allergic reaction to titanium, as evidenced by personal history of allergic or adverse reaction to titanium.","when_to_set_to_false":"Set to false if the patient is known not to have an allergic reaction to titanium, as evidenced by absence of personal history of allergic or adverse reaction to titanium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known allergic reaction to titanium.","meaning":"Boolean indicating whether the patient has a known allergic reaction to titanium, as evidenced by personal history of allergic or adverse reaction to titanium."} ;; "has a known allergic reaction to titanium, as evidenced by ((the patient has a personal history of allergic reaction to titanium) OR (the patient has a personal history of adverse reaction to titanium))"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Definition: known allergic reaction to titanium is evidenced by personal history of allergic or adverse reaction to titanium
(assert
(! (= patient_has_known_allergic_reaction_to_titanium
     (or patient_has_personal_history_of_allergic_reaction_to_titanium
         patient_has_personal_history_of_adverse_reaction_to_titanium))
:named REQ11_AUXILIARY0)) ;; "as evidenced by ((the patient has a personal history of allergic reaction to titanium) OR (the patient has a personal history of adverse reaction to titanium))"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_known_allergic_reaction_to_titanium)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergic reaction to titanium, as evidenced by ((the patient has a personal history of allergic reaction to titanium) OR (the patient has a personal history of adverse reaction to titanium))."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_infectious_disorder_of_cartilage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infectious disorder of cartilage (i.e., infection of cartilage present at the time of evaluation).","when_to_set_to_false":"Set to false if the patient currently does not have an infectious disorder of cartilage at the time of evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infectious disorder of cartilage at the time of evaluation.","meaning":"Boolean indicating whether the patient currently has an infectious disorder of cartilage."} ;; "infection of cartilage at the time of evaluation"
(declare-const patient_has_finding_of_infectious_disorder_of_cartilage_now@@documented_by_recent_imaging_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infectious disorder of cartilage is documented by a recent imaging study.","when_to_set_to_false":"Set to false if the patient's infectious disorder of cartilage is not documented by a recent imaging study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a recent imaging study documents the infectious disorder of cartilage.","meaning":"Boolean indicating whether the patient's infectious disorder of cartilage is documented by a recent imaging study."} ;; "infection of cartilage at the time of implantation, as documented by recent imaging study"
(declare-const patient_has_finding_of_infectious_disorder_of_cartilage_now@@documented_by_abnormal_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infectious disorder of cartilage is documented by abnormal physical examination.","when_to_set_to_false":"Set to false if the patient's infectious disorder of cartilage is not documented by abnormal physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether abnormal physical examination documents the infectious disorder of cartilage.","meaning":"Boolean indicating whether the patient's infectious disorder of cartilage is documented by abnormal physical examination."} ;; "infection of cartilage at the time of implantation, as documented by abnormal physical examination"
(declare-const patient_has_finding_of_infective_disorder_of_head_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infective disorder of the head (i.e., infection of head present at the time of evaluation).","when_to_set_to_false":"Set to false if the patient currently does not have an infective disorder of the head at the time of evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infective disorder of the head at the time of evaluation.","meaning":"Boolean indicating whether the patient currently has an infective disorder of the head."} ;; "infection of head at the time of evaluation"
(declare-const patient_has_finding_of_infective_disorder_of_head_now@@documented_by_recent_imaging_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infective disorder of the head is documented by a recent imaging study.","when_to_set_to_false":"Set to false if the patient's infective disorder of the head is not documented by a recent imaging study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a recent imaging study documents the infective disorder of the head.","meaning":"Boolean indicating whether the patient's infective disorder of the head is documented by a recent imaging study."} ;; "infection of head at the time of implantation, as documented by recent imaging study"
(declare-const patient_has_finding_of_infective_disorder_of_head_now@@documented_by_abnormal_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infective disorder of the head is documented by abnormal physical examination.","when_to_set_to_false":"Set to false if the patient's infective disorder of the head is not documented by abnormal physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether abnormal physical examination documents the infective disorder of the head.","meaning":"Boolean indicating whether the patient's infective disorder of the head is documented by abnormal physical examination."} ;; "infection of head at the time of implantation, as documented by abnormal physical examination"
(declare-const patient_has_finding_of_infectious_disorder_of_neck_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infectious disorder of the neck at the time of evaluation.","when_to_set_to_false":"Set to false if the patient currently does not have an infectious disorder of the neck at the time of evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infectious disorder of the neck at the time of evaluation.","meaning":"Boolean indicating whether the patient currently has an infectious disorder of the neck at the time of evaluation."} ;; "infection of neck at the time of evaluation"
(declare-const patient_has_finding_of_infectious_disorder_of_neck_now@@documented_by_recent_imaging_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infectious disorder of the neck at the time of evaluation is documented by a recent imaging study.","when_to_set_to_false":"Set to false if the patient's infectious disorder of the neck at the time of evaluation is not documented by a recent imaging study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a recent imaging study documents the infectious disorder of the neck at the time of evaluation.","meaning":"Boolean indicating whether the patient's infectious disorder of the neck at the time of evaluation is documented by a recent imaging study."} ;; "infection of neck at the time of evaluation, as documented by recent imaging study"
(declare-const patient_has_finding_of_infectious_disorder_of_neck_now@@documented_by_abnormal_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infectious disorder of the neck at the time of evaluation is documented by abnormal physical examination.","when_to_set_to_false":"Set to false if the patient's infectious disorder of the neck at the time of evaluation is not documented by abnormal physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether abnormal physical examination documents the infectious disorder of the neck at the time of evaluation.","meaning":"Boolean indicating whether the patient's infectious disorder of the neck at the time of evaluation is documented by abnormal physical examination."} ;; "infection of neck at the time of evaluation, as documented by abnormal physical examination"
(declare-const patient_has_finding_of_infectious_disorder_of_neck_at_implantation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an infectious disorder of the neck at the time of implantation.","when_to_set_to_false":"Set to false if the patient does not have an infectious disorder of the neck at the time of implantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an infectious disorder of the neck at the time of implantation.","meaning":"Boolean indicating whether the patient has an infectious disorder of the neck at the time of implantation."} ;; "infection of neck at the time of implantation"
(declare-const patient_has_finding_of_infectious_disorder_of_neck_at_implantation@@documented_by_recent_imaging_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infectious disorder of the neck at the time of implantation is documented by a recent imaging study.","when_to_set_to_false":"Set to false if the patient's infectious disorder of the neck at the time of implantation is not documented by a recent imaging study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a recent imaging study documents the infectious disorder of the neck at the time of implantation.","meaning":"Boolean indicating whether the patient's infectious disorder of the neck at the time of implantation is documented by a recent imaging study."} ;; "infection of neck at the time of implantation, as documented by recent imaging study"
(declare-const patient_has_finding_of_infectious_disorder_of_neck_at_implantation@@documented_by_abnormal_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infectious disorder of the neck at the time of implantation is documented by abnormal physical examination.","when_to_set_to_false":"Set to false if the patient's infectious disorder of the neck at the time of implantation is not documented by abnormal physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether abnormal physical examination documents the infectious disorder of the neck at the time of implantation.","meaning":"Boolean indicating whether the patient's infectious disorder of the neck at the time of implantation is documented by abnormal physical examination."} ;; "infection of neck at the time of implantation, as documented by abnormal physical examination"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variables for cartilage
(assert
(! (=> patient_has_finding_of_infectious_disorder_of_cartilage_now@@documented_by_recent_imaging_study
      patient_has_finding_of_infectious_disorder_of_cartilage_now)
    :named REQ12_AUXILIARY0)) ;; "infection of cartilage at the time of implantation, as documented by recent imaging study"

(assert
(! (=> patient_has_finding_of_infectious_disorder_of_cartilage_now@@documented_by_abnormal_physical_examination
      patient_has_finding_of_infectious_disorder_of_cartilage_now)
    :named REQ12_AUXILIARY1)) ;; "infection of cartilage at the time of implantation, as documented by abnormal physical examination"

;; Qualifier variables imply corresponding stem variables for head
(assert
(! (=> patient_has_finding_of_infective_disorder_of_head_now@@documented_by_recent_imaging_study
      patient_has_finding_of_infective_disorder_of_head_now)
    :named REQ12_AUXILIARY2)) ;; "infection of head at the time of implantation, as documented by recent imaging study"

(assert
(! (=> patient_has_finding_of_infective_disorder_of_head_now@@documented_by_abnormal_physical_examination
      patient_has_finding_of_infective_disorder_of_head_now)
    :named REQ12_AUXILIARY3)) ;; "infection of head at the time of implantation, as documented by abnormal physical examination"

;; Qualifier variables imply corresponding stem variables for neck (evaluation)
(assert
(! (=> patient_has_finding_of_infectious_disorder_of_neck_now@@documented_by_recent_imaging_study
      patient_has_finding_of_infectious_disorder_of_neck_now)
    :named REQ12_AUXILIARY4)) ;; "infection of neck at the time of evaluation, as documented by recent imaging study"

(assert
(! (=> patient_has_finding_of_infectious_disorder_of_neck_now@@documented_by_abnormal_physical_examination
      patient_has_finding_of_infectious_disorder_of_neck_now)
    :named REQ12_AUXILIARY5)) ;; "infection of neck at the time of evaluation, as documented by abnormal physical examination"

;; Qualifier variables imply corresponding stem variables for neck (implantation)
(assert
(! (=> patient_has_finding_of_infectious_disorder_of_neck_at_implantation@@documented_by_recent_imaging_study
      patient_has_finding_of_infectious_disorder_of_neck_at_implantation)
    :named REQ12_AUXILIARY6)) ;; "infection of neck at the time of implantation, as documented by recent imaging study"

(assert
(! (=> patient_has_finding_of_infectious_disorder_of_neck_at_implantation@@documented_by_abnormal_physical_examination
      patient_has_finding_of_infectious_disorder_of_neck_at_implantation)
    :named REQ12_AUXILIARY7)) ;; "infection of neck at the time of implantation, as documented by abnormal physical examination"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Component 0: Cartilage infection (any of the three conditions)
(assert
(! (not (or patient_has_finding_of_infectious_disorder_of_cartilage_now
            patient_has_finding_of_infectious_disorder_of_cartilage_now@@documented_by_recent_imaging_study
            patient_has_finding_of_infectious_disorder_of_cartilage_now@@documented_by_abnormal_physical_examination))
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "infection of cartilage at the time of evaluation OR infection of cartilage at the time of implantation, as documented by recent imaging study OR abnormal physical examination"

;; Component 1: Head infection (any of the three conditions)
(assert
(! (not (or patient_has_finding_of_infective_disorder_of_head_now
            patient_has_finding_of_infective_disorder_of_head_now@@documented_by_recent_imaging_study
            patient_has_finding_of_infective_disorder_of_head_now@@documented_by_abnormal_physical_examination))
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "infection of head at the time of evaluation OR infection of head at the time of implantation, as documented by recent imaging study OR abnormal physical examination"

;; Component 2: Neck infection (any of the four conditions)
(assert
(! (not (or patient_has_finding_of_infectious_disorder_of_neck_now
            patient_has_finding_of_infectious_disorder_of_neck_now@@documented_by_recent_imaging_study
            patient_has_finding_of_infectious_disorder_of_neck_now@@documented_by_abnormal_physical_examination
            patient_has_finding_of_infectious_disorder_of_neck_at_implantation
            patient_has_finding_of_infectious_disorder_of_neck_at_implantation@@documented_by_recent_imaging_study
            patient_has_finding_of_infectious_disorder_of_neck_at_implantation@@documented_by_abnormal_physical_examination))
    :named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "infection of neck at the time of evaluation OR infection of neck at the time of implantation, as documented by recent imaging study OR abnormal physical examination"

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_tracheotomy_tube_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a tracheotomy tube present.","when_to_set_to_false":"Set to false if the patient currently does not have a tracheotomy tube present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a tracheotomy tube present.","meaning":"Boolean indicating whether the patient currently has a tracheotomy tube present."} ;; "the patient has a tracheotomy tube present"
(declare-const patient_has_tracheotomy_tube_present_now@@present Bool) ;; {"when_to_set_to_true":"Set to true if the tracheotomy tube is present in the patient.","when_to_set_to_false":"Set to false if the tracheotomy tube is not present in the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tracheotomy tube is present in the patient.","meaning":"Boolean indicating whether the tracheotomy tube is present in the patient."} ;; "the patient has a tracheotomy tube present"
(declare-const patient_has_finding_of_respiratory_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of airway (respiratory) obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of airway (respiratory) obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has airway (respiratory) obstruction.","meaning":"Boolean indicating whether the patient currently has airway (respiratory) obstruction."} ;; "airway obstruction"
(declare-const patient_has_finding_of_respiratory_obstruction_now@@necessitating_tracheotomy_tube Bool) ;; {"when_to_set_to_true":"Set to true if the patient's airway (respiratory) obstruction necessitates a tracheotomy tube.","when_to_set_to_false":"Set to false if the patient's airway (respiratory) obstruction does not necessitate a tracheotomy tube.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the airway obstruction necessitates a tracheotomy tube.","meaning":"Boolean indicating whether the patient's airway (respiratory) obstruction necessitates a tracheotomy tube."} ;; "airway obstruction necessitating a tracheotomy tube"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable for tracheotomy tube presence
(assert
(! (=> patient_has_tracheotomy_tube_present_now@@present
       patient_has_tracheotomy_tube_present_now)
   :named REQ13_AUXILIARY0)) ;; "the patient has a tracheotomy tube present"

;; Qualifier variable implies corresponding stem variable for airway obstruction
(assert
(! (=> patient_has_finding_of_respiratory_obstruction_now@@necessitating_tracheotomy_tube
       patient_has_finding_of_respiratory_obstruction_now)
   :named REQ13_AUXILIARY1)) ;; "airway obstruction necessitating a tracheotomy tube"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient must NOT have a tracheotomy tube present
(assert
(! (not patient_has_tracheotomy_tube_present_now)
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a tracheotomy tube present"

;; Exclusion: patient must NOT have airway obstruction necessitating a tracheotomy tube
(assert
(! (not patient_has_finding_of_respiratory_obstruction_now@@necessitating_tracheotomy_tube)
   :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has airway obstruction necessitating a tracheotomy tube"

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_documented_history_of_noncompliance_with_recommendations_to_take_nothing_by_mouth Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of noncompliance with recommendations to take nothing by mouth.","when_to_set_to_false":"Set to false if the patient does not have a documented history of noncompliance with recommendations to take nothing by mouth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a documented history of noncompliance with recommendations to take nothing by mouth.","meaning":"Boolean indicating whether the patient has a documented history of noncompliance with recommendations to take nothing by mouth."} ;; "documented history of noncompliance with recommendations to take nothing by mouth"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_documented_history_of_noncompliance_with_recommendations_to_take_nothing_by_mouth)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a documented history of noncompliance with recommendations to take nothing by mouth."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_insensate_larynx_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an insensate larynx.","when_to_set_to_false":"Set to false if the patient currently does not have an insensate larynx.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an insensate larynx.","meaning":"Boolean indicating whether the patient currently has an insensate larynx."} ;; "the patient has an insensate larynx"
(declare-const patient_laryngopharyngeal_sensory_threshold_value_now_in_mmhg_air_pulse_pressure Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's current laryngopharyngeal sensory threshold in mmHg air pulse pressure.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current laryngopharyngeal sensory threshold in mmHg air pulse pressure."} ;; "the patient has a laryngopharyngeal sensory threshold less than six mmHg air pulse pressure"
(declare-const patient_has_complete_absence_of_laryngeal_adductor_reflex_on_palpation_of_arytenoid_with_flexible_laryngoscope_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a complete absence of the laryngeal adductor reflex on palpation of the arytenoid with a flexible laryngoscope.","when_to_set_to_false":"Set to false if the patient currently does not have a complete absence of the laryngeal adductor reflex on palpation of the arytenoid with a flexible laryngoscope.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a complete absence of the laryngeal adductor reflex on palpation of the arytenoid with a flexible laryngoscope.","meaning":"Boolean indicating whether the patient currently has a complete absence of the laryngeal adductor reflex on palpation of the arytenoid with a flexible laryngoscope."} ;; "the patient has a complete absence of the laryngeal adductor reflex on palpation of the arytenoid with a flexible laryngoscope"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Definition: insensate larynx = (laryngopharyngeal sensory threshold < 6 mmHg air pulse pressure) OR (complete absence of laryngeal adductor reflex on palpation of arytenoid with flexible laryngoscope)
(assert
(! (= patient_has_finding_of_insensate_larynx_now
     (or (< patient_laryngopharyngeal_sensory_threshold_value_now_in_mmhg_air_pulse_pressure 6)
         patient_has_complete_absence_of_laryngeal_adductor_reflex_on_palpation_of_arytenoid_with_flexible_laryngoscope_now))
   :named REQ15_AUXILIARY0)) ;; "defined as ((the patient has a laryngopharyngeal sensory threshold less than six mmHg air pulse pressure) OR (the patient has a complete absence of the laryngeal adductor reflex on palpation of the arytenoid with a flexible laryngoscope))."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_insensate_larynx_now)
   :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an insensate larynx, defined as ((the patient has a laryngopharyngeal sensory threshold less than six mmHg air pulse pressure) OR (the patient has a complete absence of the laryngeal adductor reflex on palpation of the arytenoid with a flexible laryngoscope))."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_zenker_s_diverticulum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Zenker's diverticulum at the time of evaluation.","when_to_set_to_false":"Set to false if the patient currently does not have Zenker's diverticulum at the time of evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Zenker's diverticulum at the time of evaluation.","meaning":"Boolean indicating whether the patient currently has Zenker's diverticulum."} ;; "the patient has a current Zenker's diverticulum at the time of evaluation"
(declare-const patient_has_finding_of_zenker_s_diverticulum_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had Zenker's diverticulum in the past (history).","when_to_set_to_false":"Set to false if the patient has never had Zenker's diverticulum in the past (history).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had Zenker's diverticulum in the past (history).","meaning":"Boolean indicating whether the patient has ever had Zenker's diverticulum in the past (history)."} ;; "the patient has a history of Zenker's diverticulum"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_zenker_s_diverticulum_now)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a current Zenker's diverticulum at the time of evaluation"

(assert
(! (not patient_has_finding_of_zenker_s_diverticulum_inthehistory)
:named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of Zenker's diverticulum"

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_excessive_salivation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of excessive salivation (sialorrhea).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of excessive salivation (sialorrhea).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has excessive salivation (sialorrhea).","meaning":"Boolean indicating whether the patient currently has excessive salivation (sialorrhea)."} ;; "sialorrhea at the time of evaluation"
(declare-const patient_has_finding_of_oral_commissure_incompetence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has oral commissure incompetence.","when_to_set_to_false":"Set to false if the patient currently does not have oral commissure incompetence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has oral commissure incompetence.","meaning":"Boolean indicating whether the patient currently has oral commissure incompetence."} ;; "oral commissure incompetence at the time of evaluation"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_excessive_salivation_now)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sialorrhea at the time of evaluation, with or without oral commissure incompetence."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_xerostomia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of xerostomia at the time of evaluation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of xerostomia at the time of evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has xerostomia at the time of evaluation.","meaning":"Boolean indicating whether the patient currently has xerostomia now."} ;; "xerostomia at the time of evaluation"
(declare-const patient_has_finding_of_xerostomia_now@@profound_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has xerostomia now and the severity is profound.","when_to_set_to_false":"Set to false if the patient currently has xerostomia now but the severity is not profound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of xerostomia is profound.","meaning":"Boolean indicating whether the patient currently has profound xerostomia now."} ;; "profound xerostomia at the time of evaluation"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_xerostomia_now@@profound_severity
       patient_has_finding_of_xerostomia_now)
   :named REQ18_AUXILIARY0)) ;; "profound xerostomia at the time of evaluation"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_finding_of_xerostomia_now@@profound_severity)
   :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has profound xerostomia at the time of evaluation."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_orocutaneous_fistula_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has orocutaneous fistulae present at the time of evaluation.","when_to_set_to_false":"Set to false if the patient currently does not have orocutaneous fistulae present at the time of evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has orocutaneous fistulae present at the time of evaluation.","meaning":"Boolean indicating whether the patient currently has orocutaneous fistulae."} ;; "the patient has orocutaneous fistulae at the time of evaluation"
(declare-const patient_has_finding_of_pharyngocutaneous_fistula_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pharyngocutaneous fistulae present at the time of evaluation.","when_to_set_to_false":"Set to false if the patient currently does not have pharyngocutaneous fistulae present at the time of evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pharyngocutaneous fistulae present at the time of evaluation.","meaning":"Boolean indicating whether the patient currently has pharyngocutaneous fistulae."} ;; "the patient has pharyngocutaneous fistulae at the time of evaluation"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_orocutaneous_fistula_now)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has orocutaneous fistulae at the time of evaluation"

(assert
(! (not patient_has_finding_of_pharyngocutaneous_fistula_now)
:named REQ19_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has pharyngocutaneous fistulae at the time of evaluation"

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_finding_of_immunosuppression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has immunosuppression at the time of evaluation.","when_to_set_to_false":"Set to false if the patient currently does not have immunosuppression at the time of evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immunosuppression at the time of evaluation.","meaning":"Boolean indicating whether the patient currently has immunosuppression."} ;; "the patient has current immunosuppression at the time of evaluation"

(declare-const patient_has_finding_of_immunosuppression_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had immunosuppression in the past (history of immunosuppression).","when_to_set_to_false":"Set to false if the patient has never had immunosuppression in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had immunosuppression in the past.","meaning":"Boolean indicating whether the patient has ever had immunosuppression in the past."} ;; "the patient has a history of immunosuppression"

(declare-const patient_has_diagnosis_of_immunodeficiency_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with an immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with an immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with an immunodeficiency disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with an immunodeficiency disorder."} ;; "the patient has a diagnosed immunodeficiency disorder"

(declare-const patient_is_taking_immunosuppressant_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken immunosuppressive medication in the past.","when_to_set_to_false":"Set to false if the patient has never taken immunosuppressive medication in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken immunosuppressive medication in the past.","meaning":"Boolean indicating whether the patient has ever taken immunosuppressive medication in the past."} ;; "the patient is on immunosuppressive medication (in the history)"

(declare-const patient_is_taking_immunosuppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking immunosuppressive medication.","when_to_set_to_false":"Set to false if the patient is not currently taking immunosuppressive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking immunosuppressive medication.","meaning":"Boolean indicating whether the patient is currently taking immunosuppressive medication."} ;; "the patient is on immunosuppressive medication (now)"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Definition: history of immunosuppression is defined as (diagnosed immunodeficiency disorder OR ever on immunosuppressive medication)
(assert
(! (= patient_has_finding_of_immunosuppression_inthehistory
     (or patient_has_diagnosis_of_immunodeficiency_disorder_inthehistory
         patient_is_taking_immunosuppressant_in_the_history))
:named REQ20_AUXILIARY0)) ;; "history of immunosuppression, as defined by ((the patient has a diagnosed immunodeficiency disorder) OR (the patient is on immunosuppressive medication))"

;; ===================== Constraint Assertions (REQ 20) =====================
;; Exclusion: patient must NOT have current immunosuppression
(assert
(! (not patient_has_finding_of_immunosuppression_now)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has current immunosuppression at the time of evaluation"

;; Exclusion: patient must NOT have a history of immunosuppression (as defined above)
(assert
(! (not patient_has_finding_of_immunosuppression_inthehistory)
:named REQ20_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of immunosuppression, as defined by ((the patient has a diagnosed immunodeficiency disorder) OR (the patient is on immunosuppressive medication))"

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (coagulopathy) at the time of evaluation.","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder (coagulopathy) at the time of evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder (coagulopathy) at the time of evaluation.","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (coagulopathy)."} ;; "the patient has current coagulopathy at the time of evaluation"

(declare-const patient_has_finding_of_blood_coagulation_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a blood coagulation disorder (coagulopathy) in their history.","when_to_set_to_false":"Set to false if the patient has never had a blood coagulation disorder (coagulopathy) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a blood coagulation disorder (coagulopathy) in their history.","meaning":"Boolean indicating whether the patient has ever had a blood coagulation disorder (coagulopathy) in their history."} ;; "the patient has a history of coagulopathy, as defined by ((the patient has a diagnosed coagulation disorder)..."

(declare-const patient_is_on_anticoagulation_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any anticoagulation medication.","when_to_set_to_false":"Set to false if the patient is not currently taking any anticoagulation medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any anticoagulation medication.","meaning":"Boolean indicating whether the patient is currently taking any anticoagulation medication."} ;; "the patient is on anticoagulation medication with non-exhaustive examples (baby aspirin, over-the-counter non-steroidal anti-inflammatory medication, herbal agent, warfarin)"

(declare-const patient_is_on_anticoagulation_medication_now@@cannot_be_temporarily_stopped_for_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current anticoagulation medication cannot be temporarily stopped for the procedure.","when_to_set_to_false":"Set to false if the patient's current anticoagulation medication can be temporarily stopped for the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current anticoagulation medication can be temporarily stopped for the procedure.","meaning":"Boolean indicating whether the patient's current anticoagulation medication cannot be temporarily stopped for the procedure."} ;; "the patient is on anticoagulation medication ... that cannot be temporarily stopped for the procedure"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Non-exhaustive examples imply umbrella term for anticoagulation medication
;; (baby aspirin, over-the-counter non-steroidal anti-inflammatory medication, herbal agent, warfarin) are examples, not exhaustive
;; No explicit variables for these examples, so no auxiliary assertion needed for them

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_on_anticoagulation_medication_now@@cannot_be_temporarily_stopped_for_procedure
      patient_is_on_anticoagulation_medication_now)
:named REQ21_AUXILIARY0)) ;; "the patient is on anticoagulation medication ... that cannot be temporarily stopped for the procedure"

;; ===================== Constraint Assertions (REQ 21) =====================
;; Exclusion if current coagulopathy at time of evaluation
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now)
:named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has current coagulopathy at the time of evaluation"

;; Exclusion if history of coagulopathy, as defined by (diagnosed coagulation disorder OR anticoagulation medication that cannot be temporarily stopped for the procedure)
(assert
(! (not (or patient_has_finding_of_blood_coagulation_disorder_inthehistory
            patient_is_on_anticoagulation_medication_now@@cannot_be_temporarily_stopped_for_procedure))
:named REQ21_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of coagulopathy, as defined by ((the patient has a diagnosed coagulation disorder) OR (the patient is on anticoagulation medication ... that cannot be temporarily stopped for the procedure))"

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_is_exposed_to_sedative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to a sedative.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to a sedative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to a sedative.","meaning":"Boolean indicating whether the patient is currently exposed to (taking) a sedative."} ;; "the patient is taking sedative medication"
(declare-const patient_is_taking_opioid_receptor_agonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a narcotic medication (opioid receptor agonist containing product).","when_to_set_to_false":"Set to false if the patient is currently not taking a narcotic medication (opioid receptor agonist containing product).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a narcotic medication (opioid receptor agonist containing product).","meaning":"Boolean indicating whether the patient is currently taking a narcotic medication (opioid receptor agonist containing product)."} ;; "the patient is taking narcotic medication"
(declare-const patient_is_exposed_to_skeletal_muscle_relaxant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to a skeletal muscle relaxant.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to a skeletal muscle relaxant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to a skeletal muscle relaxant.","meaning":"Boolean indicating whether the patient is currently exposed to (taking) a skeletal muscle relaxant."} ;; "the patient is taking muscle relaxant medication"
(declare-const patient_is_exposed_to_anxiolytic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to an anxiolytic agent.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to an anxiolytic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to an anxiolytic agent.","meaning":"Boolean indicating whether the patient is currently exposed to (taking) an anxiolytic agent."} ;; "the patient is taking anxiolytic medication"
(declare-const patient_is_exposed_to_cannabis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to cannabis (medical marijuana).","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to cannabis (medical marijuana).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to cannabis (medical marijuana).","meaning":"Boolean indicating whether the patient is currently exposed to (taking) cannabis (medical marijuana)."} ;; "the patient is taking medical marijuana"
(declare-const patient_is_exposed_to_alcohol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to alcohol.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to alcohol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to alcohol.","meaning":"Boolean indicating whether the patient is currently exposed to (taking) alcohol."} ;; "the patient is taking alcohol"
(declare-const patient_is_exposed_to_nicotine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to nicotine (non-medicinal, e.g., tobacco-derived or recreational nicotine).","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to nicotine (non-medicinal, e.g., tobacco-derived or recreational nicotine).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to nicotine (non-medicinal, e.g., tobacco-derived or recreational nicotine).","meaning":"Boolean indicating whether the patient is currently exposed to (taking) nicotine (non-medicinal, e.g., tobacco-derived or recreational nicotine)."} ;; "the patient is taking nicotine"
(declare-const patient_is_taking_nicotine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a medicinal nicotine-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a medicinal nicotine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a medicinal nicotine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a medicinal nicotine-containing product."} ;; "the patient is taking medicinal nicotine"
(declare-const patient_is_exposed_to_mind_altering_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to other mind-altering medication.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to other mind-altering medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to other mind-altering medication.","meaning":"Boolean indicating whether the patient is currently exposed to (taking) other mind-altering medication."} ;; "the patient is taking other mind-altering medication"
(declare-const patient_is_exposed_to_mind_altering_medication_now@@may_affect_safe_patient_use_of_swallowing_device Bool) ;; {"when_to_set_to_true":"Set to true if the mind-altering medication may affect safe patient use of the swallowing device.","when_to_set_to_false":"Set to false if the mind-altering medication does not affect safe patient use of the swallowing device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mind-altering medication may affect safe patient use of the swallowing device.","meaning":"Boolean indicating whether the mind-altering medication may affect safe patient use of the swallowing device."} ;; "may affect safe patient use of the swallowing device"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_mind_altering_medication_now@@may_affect_safe_patient_use_of_swallowing_device
      patient_is_exposed_to_mind_altering_medication_now)
:named REQ22_AUXILIARY0)) ;; "other mind-altering medication that may affect safe patient use of the swallowing device"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_is_exposed_to_sedative_now)
:named REQ22_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is taking sedative medication"

(assert
(! (not patient_is_taking_opioid_receptor_agonist_containing_product_now)
:named REQ22_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is taking narcotic medication"

(assert
(! (not patient_is_exposed_to_skeletal_muscle_relaxant_now)
:named REQ22_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is taking muscle relaxant medication"

(assert
(! (not patient_is_exposed_to_anxiolytic_agent_now)
:named REQ22_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is taking anxiolytic medication"

(assert
(! (not patient_is_exposed_to_cannabis_now)
:named REQ22_COMPONENT4_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is taking medical marijuana"

(assert
(! (not patient_is_exposed_to_alcohol_now)
:named REQ22_COMPONENT5_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is taking alcohol"

(assert
(! (not patient_is_exposed_to_nicotine_now)
:named REQ22_COMPONENT6_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is taking nicotine"

(assert
(! (not patient_is_taking_nicotine_containing_product_now)
:named REQ22_COMPONENT7_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is taking medicinal nicotine"

(assert
(! (not patient_is_exposed_to_mind_altering_medication_now@@may_affect_safe_patient_use_of_swallowing_device)
:named REQ22_COMPONENT8_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is taking other mind-altering medication that may affect safe patient use of the swallowing device"

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_is_taking_antifibrotic_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any antifibrotic medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any antifibrotic medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking antifibrotic medication.","meaning":"Boolean indicating whether the patient is currently taking antifibrotic medication."} ;; "The patient is excluded if the patient is taking antifibrotic medication."

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
  (! (not patient_is_taking_antifibrotic_medication_now)
     :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking antifibrotic medication."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_has_finding_of_bilateral_vocal_fold_immobility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bilateral vocal fold immobility.","when_to_set_to_false":"Set to false if the patient currently does not have bilateral vocal fold immobility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bilateral vocal fold immobility.","meaning":"Boolean indicating whether the patient currently has bilateral vocal fold immobility."} ;; "bilateral vocal fold immobility"
(declare-const patient_has_finding_of_bilateral_vocal_fold_immobility_now@@evidenced_on_endoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bilateral vocal fold immobility is evidenced on endoscopy.","when_to_set_to_false":"Set to false if the patient's bilateral vocal fold immobility is not evidenced on endoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bilateral vocal fold immobility is evidenced on endoscopy.","meaning":"Boolean indicating whether the patient's bilateral vocal fold immobility is evidenced on endoscopy."} ;; "as evidenced on endoscopy"
(declare-const patient_has_finding_of_bilateral_vocal_fold_immobility_now@@present_in_any_position Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bilateral vocal fold immobility is present in any position.","when_to_set_to_false":"Set to false if the patient's bilateral vocal fold immobility is not present in any position.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bilateral vocal fold immobility is present in any position.","meaning":"Boolean indicating whether the patient's bilateral vocal fold immobility is present in any position."} ;; "in any position"
(declare-const patient_has_undergone_endoscopy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone endoscopy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone endoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone endoscopy.","meaning":"Boolean indicating whether the patient has undergone endoscopy at any time in the past."} ;; "endoscopy"

;; ===================== Auxiliary Assertions (REQ 24) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_bilateral_vocal_fold_immobility_now@@evidenced_on_endoscopy
      patient_has_finding_of_bilateral_vocal_fold_immobility_now)
   :named REQ24_AUXILIARY0)) ;; "as evidenced on endoscopy"

(assert
(! (=> patient_has_finding_of_bilateral_vocal_fold_immobility_now@@present_in_any_position
      patient_has_finding_of_bilateral_vocal_fold_immobility_now)
   :named REQ24_AUXILIARY1)) ;; "in any position"

;; ===================== Constraint Assertions (REQ 24) =====================
;; Exclusion: patient must NOT have bilateral vocal fold immobility in any position, as evidenced on endoscopy
(assert
(! (not (and patient_has_finding_of_bilateral_vocal_fold_immobility_now@@present_in_any_position
             patient_has_finding_of_bilateral_vocal_fold_immobility_now@@evidenced_on_endoscopy))
   :named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bilateral vocal fold immobility in any position, as evidenced on endoscopy."
