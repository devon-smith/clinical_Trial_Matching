;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not classified as an outpatient (e.g., inpatient, emergency, etc.).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an outpatient.","meaning":"Boolean indicating whether the patient is currently classified as an outpatient."} ;; "To be included, the patient must be an outpatient."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_outpatient_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an outpatient."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_sinusitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently fulfills the clinical diagnostic criteria for acute sinusitis (i.e., has a diagnosis of acute sinusitis).","when_to_set_to_false":"Set to false if the patient currently does not fulfill the clinical diagnostic criteria for acute sinusitis (i.e., does not have a diagnosis of acute sinusitis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently fulfills the clinical diagnostic criteria for acute sinusitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute sinusitis."} ;; "To be included, the patient must fulfill the clinical diagnostic criteria for acute sinusitis."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_acute_sinusitis_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must fulfill the clinical diagnostic criteria for acute sinusitis."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
;; Major factors
(declare-const patient_has_finding_of_facial_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has facial pressure.","when_to_set_to_false":"Set to false if the patient currently does not have facial pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has facial pressure.","meaning":"Boolean indicating whether the patient currently has facial pressure."} ;; "facial pressure"
(declare-const patient_has_finding_of_pain_in_face_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has facial pain.","when_to_set_to_false":"Set to false if the patient currently does not have facial pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has facial pain.","meaning":"Boolean indicating whether the patient currently has facial pain."} ;; "facial pain"
(declare-const patient_has_finding_of_facial_congestion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has facial congestion.","when_to_set_to_false":"Set to false if the patient currently does not have facial congestion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has facial congestion.","meaning":"Boolean indicating whether the patient currently has facial congestion."} ;; "facial congestion"
(declare-const patient_has_finding_of_facial_fullness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has facial fullness.","when_to_set_to_false":"Set to false if the patient currently does not have facial fullness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has facial fullness.","meaning":"Boolean indicating whether the patient currently has facial fullness."} ;; "facial fullness"
(declare-const patient_has_finding_of_nasal_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nasal obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have nasal obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nasal obstruction.","meaning":"Boolean indicating whether the patient currently has nasal obstruction."} ;; "nasal obstruction"
(declare-const patient_has_finding_of_purulent_nasal_discharge_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has purulent nasal discharge.","when_to_set_to_false":"Set to false if the patient currently does not have purulent nasal discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has purulent nasal discharge.","meaning":"Boolean indicating whether the patient currently has purulent nasal discharge."} ;; "nasal purulence"
(declare-const patient_has_finding_of_posterior_rhinorrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has postnasal discharge.","when_to_set_to_false":"Set to false if the patient currently does not have postnasal discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has postnasal discharge.","meaning":"Boolean indicating whether the patient currently has postnasal discharge."} ;; "postnasal discharge"
(declare-const patient_has_finding_of_sense_of_smell_impaired_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyposmia (impaired sense of smell).","when_to_set_to_false":"Set to false if the patient currently does not have hyposmia (impaired sense of smell).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyposmia (impaired sense of smell).","meaning":"Boolean indicating whether the patient currently has hyposmia (impaired sense of smell)."} ;; "hyposmia"
(declare-const patient_has_finding_of_loss_of_sense_of_smell_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has anosmia (loss of sense of smell).","when_to_set_to_false":"Set to false if the patient currently does not have anosmia (loss of sense of smell).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anosmia (loss of sense of smell).","meaning":"Boolean indicating whether the patient currently has anosmia (loss of sense of smell)."} ;; "anosmia"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"

;; Minor factors
(declare-const patient_has_finding_of_headache_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has headache.","when_to_set_to_false":"Set to false if the patient currently does not have headache.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has headache.","meaning":"Boolean indicating whether the patient currently has headache."} ;; "headache"
(declare-const patient_has_finding_of_breath_smells_unpleasant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has halitosis (unpleasant breath odor).","when_to_set_to_false":"Set to false if the patient currently does not have halitosis (unpleasant breath odor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has halitosis (unpleasant breath odor).","meaning":"Boolean indicating whether the patient currently has halitosis (unpleasant breath odor)."} ;; "halitosis"
(declare-const patient_has_finding_of_fatigue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fatigue.","when_to_set_to_false":"Set to false if the patient currently does not have fatigue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fatigue.","meaning":"Boolean indicating whether the patient currently has fatigue."} ;; "fatigue"
(declare-const patient_has_finding_of_toothache_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dental pain (toothache).","when_to_set_to_false":"Set to false if the patient currently does not have dental pain (toothache).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dental pain (toothache).","meaning":"Boolean indicating whether the patient currently has dental pain (toothache)."} ;; "dental pain"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "cough"
(declare-const patient_has_finding_of_pain_of_ear_structure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ear pain.","when_to_set_to_false":"Set to false if the patient currently does not have ear pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ear pain.","meaning":"Boolean indicating whether the patient currently has ear pain."} ;; "ear pain"
(declare-const patient_has_finding_of_ear_pressure_sensation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ear pressure sensation.","when_to_set_to_false":"Set to false if the patient currently does not have ear pressure sensation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ear pressure sensation.","meaning":"Boolean indicating whether the patient currently has ear pressure sensation."} ;; "ear pressure"
(declare-const patient_has_finding_of_ear_fullness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ear fullness.","when_to_set_to_false":"Set to false if the patient currently does not have ear fullness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ear fullness.","meaning":"Boolean indicating whether the patient currently has ear fullness."} ;; "ear fullness"

;; Duration qualifiers for all major and minor factors
(declare-const patient_has_finding_of_facial_pressure_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has facial pressure and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has facial pressure but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of facial pressure is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has facial pressure with duration more than one week and less than four weeks."} ;; "duration of facial pressure is more than one week and less than four weeks"
(declare-const patient_has_finding_of_pain_in_face_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has facial pain and the duration of the pain is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has facial pain but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of facial pain is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has facial pain with duration more than one week and less than four weeks."} ;; "duration of facial pain is more than one week and less than four weeks"
(declare-const patient_has_finding_of_facial_congestion_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has facial congestion and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has facial congestion but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of facial congestion is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has facial congestion with duration more than one week and less than four weeks."} ;; "duration of facial congestion is more than one week and less than four weeks"
(declare-const patient_has_finding_of_facial_fullness_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has facial fullness and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has facial fullness but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of facial fullness is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has facial fullness with duration more than one week and less than four weeks."} ;; "duration of facial fullness is more than one week and less than four weeks"
(declare-const patient_has_finding_of_nasal_obstruction_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nasal obstruction and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has nasal obstruction but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of nasal obstruction is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has nasal obstruction with duration more than one week and less than four weeks."} ;; "duration of nasal obstruction is more than one week and less than four weeks"
(declare-const patient_has_finding_of_purulent_nasal_discharge_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has purulent nasal discharge and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has purulent nasal discharge but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of purulent nasal discharge is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has purulent nasal discharge with duration more than one week and less than four weeks."} ;; "duration of purulent nasal discharge is more than one week and less than four weeks"
(declare-const patient_has_finding_of_posterior_rhinorrhea_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has postnasal discharge and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has postnasal discharge but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of postnasal discharge is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has postnasal discharge with duration more than one week and less than four weeks."} ;; "duration of postnasal discharge is more than one week and less than four weeks"
(declare-const patient_has_finding_of_sense_of_smell_impaired_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyposmia and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has hyposmia but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of hyposmia is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has hyposmia with duration more than one week and less than four weeks."} ;; "duration of hyposmia is more than one week and less than four weeks"
(declare-const patient_has_finding_of_loss_of_sense_of_smell_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has anosmia and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has anosmia but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of anosmia is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has anosmia with duration more than one week and less than four weeks."} ;; "duration of anosmia is more than one week and less than four weeks"
(declare-const patient_has_finding_of_fever_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has fever but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of fever is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has fever with duration more than one week and less than four weeks."} ;; "duration of fever is more than one week and less than four weeks"

(declare-const patient_has_finding_of_headache_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has headache and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has headache but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of headache is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has headache with duration more than one week and less than four weeks."} ;; "duration of headache is more than one week and less than four weeks"
(declare-const patient_has_finding_of_breath_smells_unpleasant_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has halitosis and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has halitosis but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of halitosis is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has halitosis with duration more than one week and less than four weeks."} ;; "duration of halitosis is more than one week and less than four weeks"
(declare-const patient_has_finding_of_fatigue_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fatigue and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has fatigue but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of fatigue is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has fatigue with duration more than one week and less than four weeks."} ;; "duration of fatigue is more than one week and less than four weeks"
(declare-const patient_has_finding_of_toothache_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dental pain and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has dental pain but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of dental pain is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has dental pain with duration more than one week and less than four weeks."} ;; "duration of dental pain is more than one week and less than four weeks"
(declare-const patient_has_finding_of_cough_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has cough but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of cough is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has cough with duration more than one week and less than four weeks."} ;; "duration of cough is more than one week and less than four weeks"
(declare-const patient_has_finding_of_pain_of_ear_structure_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ear pain and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has ear pain but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of ear pain is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has ear pain with duration more than one week and less than four weeks."} ;; "duration of ear pain is more than one week and less than four weeks"
(declare-const patient_has_finding_of_ear_pressure_sensation_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ear pressure sensation and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has ear pressure sensation but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of ear pressure sensation is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has ear pressure sensation with duration more than one week and less than four weeks."} ;; "duration of ear pressure sensation is more than one week and less than four weeks"
(declare-const patient_has_finding_of_ear_fullness_now@@duration_more_than_one_week_and_less_than_four_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ear fullness and the duration is more than one week and less than four weeks.","when_to_set_to_false":"Set to false if the patient currently has ear fullness but the duration is not more than one week and less than four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of ear fullness is more than one week and less than four weeks.","meaning":"Boolean indicating whether the patient currently has ear fullness with duration more than one week and less than four weeks."} ;; "duration of ear fullness is more than one week and less than four weeks"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Each duration qualifier implies the corresponding stem variable
(assert
  (! (=> patient_has_finding_of_facial_pressure_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_facial_pressure_now)
     :named REQ2_AUXILIARY0)) ;; "duration of facial pressure is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_pain_in_face_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_pain_in_face_now)
     :named REQ2_AUXILIARY1)) ;; "duration of facial pain is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_facial_congestion_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_facial_congestion_now)
     :named REQ2_AUXILIARY2)) ;; "duration of facial congestion is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_facial_fullness_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_facial_fullness_now)
     :named REQ2_AUXILIARY3)) ;; "duration of facial fullness is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_nasal_obstruction_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_nasal_obstruction_now)
     :named REQ2_AUXILIARY4)) ;; "duration of nasal obstruction is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_purulent_nasal_discharge_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_purulent_nasal_discharge_now)
     :named REQ2_AUXILIARY5)) ;; "duration of purulent nasal discharge is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_posterior_rhinorrhea_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_posterior_rhinorrhea_now)
     :named REQ2_AUXILIARY6)) ;; "duration of postnasal discharge is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_sense_of_smell_impaired_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_sense_of_smell_impaired_now)
     :named REQ2_AUXILIARY7)) ;; "duration of hyposmia is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_loss_of_sense_of_smell_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_loss_of_sense_of_smell_now)
     :named REQ2_AUXILIARY8)) ;; "duration of anosmia is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_fever_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_fever_now)
     :named REQ2_AUXILIARY9)) ;; "duration of fever is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_headache_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_headache_now)
     :named REQ2_AUXILIARY10)) ;; "duration of headache is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_breath_smells_unpleasant_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_breath_smells_unpleasant_now)
     :named REQ2_AUXILIARY11)) ;; "duration of halitosis is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_fatigue_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_fatigue_now)
     :named REQ2_AUXILIARY12)) ;; "duration of fatigue is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_toothache_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_toothache_now)
     :named REQ2_AUXILIARY13)) ;; "duration of dental pain is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_cough_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_cough_now)
     :named REQ2_AUXILIARY14)) ;; "duration of cough is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_pain_of_ear_structure_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_pain_of_ear_structure_now)
     :named REQ2_AUXILIARY15)) ;; "duration of ear pain is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_ear_pressure_sensation_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_ear_pressure_sensation_now)
     :named REQ2_AUXILIARY16)) ;; "duration of ear pressure sensation is more than one week and less than four weeks"
(assert
  (! (=> patient_has_finding_of_ear_fullness_now@@duration_more_than_one_week_and_less_than_four_weeks
         patient_has_finding_of_ear_fullness_now)
     :named REQ2_AUXILIARY17)) ;; "duration of ear fullness is more than one week and less than four weeks"

;; ===================== Definitions for major and minor factor sets (REQ 2) =====================
;; List of major factors (with duration constraint)
(define-fun major_factor_with_duration_count () Int
  (+ (ite patient_has_finding_of_facial_pressure_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_pain_in_face_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_facial_congestion_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_facial_fullness_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_nasal_obstruction_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_purulent_nasal_discharge_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_posterior_rhinorrhea_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_sense_of_smell_impaired_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_loss_of_sense_of_smell_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_fever_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
  )) ;; "at least two of the major factors (with duration >1 and <4 weeks)"

;; List of minor factors (with duration constraint)
(define-fun minor_factor_with_duration_count () Int
  (+ (ite patient_has_finding_of_headache_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_breath_smells_unpleasant_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_fatigue_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_toothache_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_cough_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_pain_of_ear_structure_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_ear_pressure_sensation_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
     (ite patient_has_finding_of_ear_fullness_now@@duration_more_than_one_week_and_less_than_four_weeks 1 0)
  )) ;; "at least two of the minor factors (with duration >1 and <4 weeks)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Major/minor factor logic
(assert
  (! (or
        (>= major_factor_with_duration_count 2)
        (and (>= major_factor_with_duration_count 1)
             (>= minor_factor_with_duration_count 2)))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least two major factors OR (one major AND two minor factors), all with duration >1 and <4 weeks"

;; Component 1: Duration constraint (all factors must have duration >1 and <4 weeks)
;; This is already encoded by using only the @@duration_more_than_one_week_and_less_than_four_weeks variables in the counts above.
;; No further assertion needed, as the counts above only include findings with the required duration.

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have at least one of the major factors (facial pressure OR facial pain OR facial congestion OR facial fullness OR nasal obstruction OR nasal purulence OR postnasal discharge OR hyposmia OR anosmia OR fever).
(assert
  (! (or patient_has_finding_of_facial_pressure_now
         patient_has_finding_of_pain_in_face_now
         patient_has_finding_of_facial_congestion_now
         patient_has_finding_of_facial_fullness_now
         patient_has_finding_of_nasal_obstruction_now
         patient_has_finding_of_purulent_nasal_discharge_now
         patient_has_finding_of_posterior_rhinorrhea_now
         patient_has_finding_of_sense_of_smell_impaired_now
         patient_has_finding_of_loss_of_sense_of_smell_now
         patient_has_finding_of_fever_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one of the major factors (facial pressure OR facial pain OR facial congestion OR facial fullness OR nasal obstruction OR nasal purulence OR postnasal discharge OR hyposmia OR anosmia OR fever)."

;; ===================== Constraint Assertions (REQ 4) =====================
;; "To be included, the patient must have at least one of the minor factors (headache OR halitosis OR fatigue OR dental pain OR cough OR ear pain OR ear pressure OR ear fullness)."
(assert
  (! (or patient_has_finding_of_headache_now
         patient_has_finding_of_breath_smells_unpleasant_now
         patient_has_finding_of_fatigue_now
         patient_has_finding_of_toothache_now
         patient_has_finding_of_cough_now
         patient_has_finding_of_pain_of_ear_structure_now
         patient_has_finding_of_ear_pressure_sensation_now
         patient_has_finding_of_ear_fullness_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one of the minor factors (headache OR halitosis OR fatigue OR dental pain OR cough OR ear pain OR ear pressure OR ear fullness)."
