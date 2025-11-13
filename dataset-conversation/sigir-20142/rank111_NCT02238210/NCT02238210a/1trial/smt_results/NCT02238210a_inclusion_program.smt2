;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently female."} // "male OR female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently male."} // "male OR female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "at least 2 years of age AND NOT older than 5 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_female_now patient_sex_is_male_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (male OR female)."

(assert
  (! (>= patient_age_value_recorded_now_in_years 2)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be at least 2 years of age at screening."

(assert
  (! (<= patient_age_value_recorded_now_in_years 5)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not be older than 5 years of age at screening."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_common_cold_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of common cold.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of common cold.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of common cold.","meaning":"Boolean indicating whether the patient currently has a diagnosis of common cold."} // "diagnosis of common cold"
(declare-const patient_has_finding_of_nasal_discharge_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has rhinorrhea (nasal discharge).","when_to_set_to_false":"Set to false if the patient currently does not have rhinorrhea (nasal discharge).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rhinorrhea (nasal discharge).","meaning":"Boolean indicating whether the patient currently has rhinorrhea (nasal discharge)."} // "presence of acute onset of rhinorrhea"
(declare-const patient_has_finding_of_nasal_discharge_now@@acute_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current rhinorrhea (nasal discharge) has an acute onset.","when_to_set_to_false":"Set to false if the patient's current rhinorrhea (nasal discharge) does not have an acute onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current rhinorrhea (nasal discharge) has an acute onset.","meaning":"Boolean indicating whether the patient's current rhinorrhea (nasal discharge) has an acute onset."} // "acute onset"
(declare-const patient_has_finding_of_nasal_discharge_now@@onset_within_48_hours_of_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current rhinorrhea (nasal discharge) onset occurred within 48 hours of the screening visit.","when_to_set_to_false":"Set to false if the patient's current rhinorrhea (nasal discharge) onset did not occur within 48 hours of the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of the patient's current rhinorrhea (nasal discharge) occurred within 48 hours of the screening visit.","meaning":"Boolean indicating whether the onset of the patient's current rhinorrhea (nasal discharge) occurred within 48 hours of the screening visit."} // "onset within 48 hours of screening visit"
(declare-const patient_has_finding_of_swollen_nasal_mucosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has swollen nasal mucosa (membranes).","when_to_set_to_false":"Set to false if the patient currently does not have swollen nasal mucosa (membranes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has swollen nasal mucosa (membranes).","meaning":"Boolean indicating whether the patient currently has swollen nasal mucosa (membranes)."} // "swollen nasal membranes"
(declare-const patient_has_finding_of_swollen_nasal_mucosa_now@@characteristic_of_common_cold Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current swollen nasal mucosa (membranes) is characteristic of common cold.","when_to_set_to_false":"Set to false if the patient's current swollen nasal mucosa (membranes) is not characteristic of common cold.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the swelling is characteristic of common cold.","meaning":"Boolean indicating whether the patient's current swollen nasal mucosa (membranes) is characteristic of common cold."} // "characteristic of common cold"
(declare-const patient_has_finding_of_swollen_nasal_mucosa_now@@present_on_examination_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current swollen nasal mucosa (membranes) is present on examination at screening.","when_to_set_to_false":"Set to false if the patient's current swollen nasal mucosa (membranes) is not present on examination at screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the swelling is present on examination at screening.","meaning":"Boolean indicating whether the patient's current swollen nasal mucosa (membranes) is present on examination at screening."} // "on examination at screening"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever"
(declare-const patient_has_finding_of_fever_now@@measured_orally_or_equivalent_method Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current fever was measured orally or by an equivalent method.","when_to_set_to_false":"Set to false if the patient's current fever was not measured orally or by an equivalent method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fever was measured orally or by an equivalent method.","meaning":"Boolean indicating whether the patient's current fever was measured orally or by an equivalent method."} // "measured orally or by an equivalent method"
(declare-const patient_has_finding_of_fever_now@@measured_within_48_hours_of_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current fever was measured within 48 hours of the visit.","when_to_set_to_false":"Set to false if the patient's current fever was not measured within 48 hours of the visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fever was measured within 48 hours of the visit.","meaning":"Boolean indicating whether the patient's current fever was measured within 48 hours of the visit."} // "within 48 hours of visit"
(declare-const patient_has_finding_of_fever_now@@measured_at_home_away_from_clinic_or_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current fever was measured at home, away from the clinic, or at the time of screening.","when_to_set_to_false":"Set to false if the patient's current fever was not measured at home, away from the clinic, or at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fever was measured at home, away from the clinic, or at the time of screening.","meaning":"Boolean indicating whether the patient's current fever was measured at home, away from the clinic, or at the time of screening."} // "may be measured at home, away from the clinic, or at time of screening"
(declare-const patient_has_finding_of_fever_value_recorded_within_48_hours_of_visit_in_degrees_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's fever temperature measured within 48 hours of the visit, in degrees Fahrenheit.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's fever temperature measured within 48 hours of the visit, in degrees Fahrenheit."} // "fever up to 102 degrees Fahrenheit (measured orally or by an equivalent method) within 48 hours of visit"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_nasal_discharge_now@@acute_onset
         patient_has_finding_of_nasal_discharge_now)
     :named REQ1_AUXILIARY0)) ;; "acute onset of rhinorrhea"

(assert
  (! (=> patient_has_finding_of_nasal_discharge_now@@onset_within_48_hours_of_screening_visit
         patient_has_finding_of_nasal_discharge_now)
     :named REQ1_AUXILIARY1)) ;; "onset within 48 hours of screening visit"

(assert
  (! (=> patient_has_finding_of_swollen_nasal_mucosa_now@@characteristic_of_common_cold
         patient_has_finding_of_swollen_nasal_mucosa_now)
     :named REQ1_AUXILIARY2)) ;; "swollen nasal membranes characteristic of common cold"

(assert
  (! (=> patient_has_finding_of_swollen_nasal_mucosa_now@@present_on_examination_at_screening
         patient_has_finding_of_swollen_nasal_mucosa_now)
     :named REQ1_AUXILIARY3)) ;; "swollen nasal membranes present on examination at screening"

(assert
  (! (=> patient_has_finding_of_fever_now@@measured_orally_or_equivalent_method
         patient_has_finding_of_fever_now)
     :named REQ1_AUXILIARY4)) ;; "fever measured orally or by equivalent method"

(assert
  (! (=> patient_has_finding_of_fever_now@@measured_within_48_hours_of_visit
         patient_has_finding_of_fever_now)
     :named REQ1_AUXILIARY5)) ;; "fever measured within 48 hours of visit"

(assert
  (! (=> patient_has_finding_of_fever_now@@measured_at_home_away_from_clinic_or_at_screening
         patient_has_finding_of_fever_now)
     :named REQ1_AUXILIARY6)) ;; "fever measured at home, away from clinic, or at screening"

;; Definition: fever up to 102°F (measured orally or equivalent) within 48 hours of visit
(assert
  (! (= patient_has_finding_of_fever_now
        (and (<= patient_has_finding_of_fever_value_recorded_within_48_hours_of_visit_in_degrees_fahrenheit 102.0)
             patient_has_finding_of_fever_now@@measured_orally_or_equivalent_method
             patient_has_finding_of_fever_now@@measured_within_48_hours_of_visit))
     :named REQ1_AUXILIARY7)) ;; "fever up to 102°F (measured orally or equivalent) within 48 hours of visit"

;; Definition: swollen nasal membranes characteristic of common cold on examination at screening
(assert
  (! (= patient_has_finding_of_swollen_nasal_mucosa_now
        (and patient_has_finding_of_swollen_nasal_mucosa_now@@characteristic_of_common_cold
             patient_has_finding_of_swollen_nasal_mucosa_now@@present_on_examination_at_screening))
     :named REQ1_AUXILIARY8)) ;; "swollen nasal membranes characteristic of common cold on examination at screening"

;; Definition: acute onset of rhinorrhea within 48 hours of screening visit
(assert
  (! (= patient_has_finding_of_nasal_discharge_now
        (and patient_has_finding_of_nasal_discharge_now@@acute_onset
             patient_has_finding_of_nasal_discharge_now@@onset_within_48_hours_of_screening_visit))
     :named REQ1_AUXILIARY9)) ;; "acute onset of rhinorrhea within 48 hours of screening visit"

;; Definition: diagnosis of common cold
(assert
  (! (= patient_has_diagnosis_of_common_cold_now
        (and patient_has_finding_of_nasal_discharge_now
             (or patient_has_finding_of_swollen_nasal_mucosa_now
                 patient_has_finding_of_fever_now)))
     :named REQ1_AUXILIARY10)) ;; "diagnosis of common cold defined as (acute onset of rhinorrhea within 48 hours of screening visit AND at least one of: swollen nasal membranes characteristic of common cold on examination at screening OR fever up to 102°F (measured orally or equivalent) within 48 hours of visit)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_common_cold_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a diagnosis of common cold defined as (presence of acute onset of rhinorrhea (with onset within 48 hours of screening visit) AND at least one of the following: (presence of swollen nasal membranes characteristic of common cold on examination at screening) OR (presence of fever up to 102 degrees Fahrenheit (measured orally or by an equivalent method) within 48 hours of visit (which may be measured at home, away from the clinic, or at time of screening)))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const parent_is_capable_of_reading_and_understanding_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent is capable of reading and understanding the informed consent.","when_to_set_to_false":"Set to false if the patient's parent is not capable of reading and understanding the informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent is capable of reading and understanding the informed consent.","meaning":"Boolean indicating whether the patient's parent is capable of reading and understanding the informed consent."} // "parent ... capable of reading and understanding the informed consent"
(declare-const parent_is_capable_of_recording_trial_diary_information Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent is capable of recording trial diary information.","when_to_set_to_false":"Set to false if the patient's parent is not capable of recording trial diary information.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent is capable of recording trial diary information.","meaning":"Boolean indicating whether the patient's parent is capable of recording trial diary information."} // "parent ... capable of recording trial diary information"
(declare-const parent_is_capable_of_administering_trial_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent is capable of administering the trial drug.","when_to_set_to_false":"Set to false if the patient's parent is not capable of administering the trial drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent is capable of administering the trial drug.","meaning":"Boolean indicating whether the patient's parent is capable of administering the trial drug."} // "parent ... capable of administering trial drug"
(declare-const parent_is_capable_of_reading_and_understanding_trial_assessment_questionnaire Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent is capable of reading and understanding the trial assessment questionnaire.","when_to_set_to_false":"Set to false if the patient's parent is not capable of reading and understanding the trial assessment questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent is capable of reading and understanding the trial assessment questionnaire.","meaning":"Boolean indicating whether the patient's parent is capable of reading and understanding the trial assessment questionnaire."} // "parent ... capable of reading and understanding the trial assessment questionnaire"
(declare-const legal_guardian_is_capable_of_reading_and_understanding_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legal guardian is capable of reading and understanding the informed consent.","when_to_set_to_false":"Set to false if the patient's legal guardian is not capable of reading and understanding the informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legal guardian is capable of reading and understanding the informed consent.","meaning":"Boolean indicating whether the patient's legal guardian is capable of reading and understanding the informed consent."} // "legal guardian ... capable of reading and understanding the informed consent"
(declare-const legal_guardian_is_capable_of_recording_trial_diary_information Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legal guardian is capable of recording trial diary information.","when_to_set_to_false":"Set to false if the patient's legal guardian is not capable of recording trial diary information.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legal guardian is capable of recording trial diary information.","meaning":"Boolean indicating whether the patient's legal guardian is capable of recording trial diary information."} // "legal guardian ... capable of recording trial diary information"
(declare-const legal_guardian_is_capable_of_administering_trial_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legal guardian is capable of administering the trial drug.","when_to_set_to_false":"Set to false if the patient's legal guardian is not capable of administering the trial drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legal guardian is capable of administering the trial drug.","meaning":"Boolean indicating whether the patient's legal guardian is capable of administering the trial drug."} // "legal guardian ... capable of administering trial drug"
(declare-const legal_guardian_is_capable_of_reading_and_understanding_trial_assessment_questionnaire Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legal guardian is capable of reading and understanding the trial assessment questionnaire.","when_to_set_to_false":"Set to false if the patient's legal guardian is not capable of reading and understanding the trial assessment questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legal guardian is capable of reading and understanding the trial assessment questionnaire.","meaning":"Boolean indicating whether the patient's legal guardian is capable of reading and understanding the trial assessment questionnaire."} // "legal guardian ... capable of reading and understanding the trial assessment questionnaire"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: parent or legal guardian must be capable of reading and understanding informed consent
(assert
  (! (or parent_is_capable_of_reading_and_understanding_informed_consent
         legal_guardian_is_capable_of_reading_and_understanding_informed_consent)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "parent or legal guardian ... capable of reading and understanding the informed consent"

;; Component 1: parent or legal guardian must be capable of recording trial diary information
(assert
  (! (or parent_is_capable_of_recording_trial_diary_information
         legal_guardian_is_capable_of_recording_trial_diary_information)
     :named REQ2_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "parent or legal guardian ... capable of recording trial diary information"

;; Component 2: parent or legal guardian must be capable of administering trial drug
(assert
  (! (or parent_is_capable_of_administering_trial_drug
         legal_guardian_is_capable_of_administering_trial_drug)
     :named REQ2_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "parent or legal guardian ... capable of administering trial drug"

;; Component 3: parent or legal guardian must be capable of reading and understanding trial assessment questionnaire
(assert
  (! (or parent_is_capable_of_reading_and_understanding_trial_assessment_questionnaire
         legal_guardian_is_capable_of_reading_and_understanding_trial_assessment_questionnaire)
     :named REQ2_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "parent or legal guardian ... capable of reading and understanding the trial assessment questionnaire"
