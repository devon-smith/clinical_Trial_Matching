;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_sex_is_female_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be female."

(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_pregnancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents to a study midwife with suspected pregnancy.","when_to_set_to_false":"Set to false if the patient currently presents to a study midwife without suspected pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents to a study midwife with suspected pregnancy.","meaning":"Boolean indicating whether the patient currently presents to a study midwife with suspected pregnancy."} // "the patient must present to a study midwife with suspected pregnancy"
(declare-const patient_has_finding_of_pregnancy_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pregnancy is suspected (not confirmed) at the time of presentation to a study midwife.","when_to_set_to_false":"Set to false if the patient's pregnancy is confirmed or not suspected at the time of presentation to a study midwife.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pregnancy is suspected at the time of presentation to a study midwife.","meaning":"Boolean indicating whether the patient's pregnancy is suspected (not confirmed) at the time of presentation to a study midwife."} // "suspected pregnancy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_pregnancy_now@@suspected
         patient_has_finding_of_pregnancy_now)
     :named REQ1_AUXILIARY0)) ;; "suspected pregnancy" implies "pregnancy"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must present to a study midwife with suspected pregnancy
(assert
  (! patient_has_finding_of_pregnancy_now@@suspected
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must present to a study midwife with suspected pregnancy."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_lives_in_study_village Bool) ;; {"when_to_set_to_true":"Set to true if the patient lives in a study village.","when_to_set_to_false":"Set to false if the patient does not live in a study village.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient lives in a study village.","meaning":"Boolean indicating whether the patient lives in a study village."} // "the patient must live in a study village"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_lives_in_study_village
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must live in a study village"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_schistosoma_japonicum_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Schistosoma japonicum infection.","when_to_set_to_false":"Set to false if the patient currently does not have Schistosoma japonicum infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Schistosoma japonicum infection.","meaning":"Boolean indicating whether the patient currently has Schistosoma japonicum infection."} // "the patient must be infected with Schistosoma japonicum infection"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_schistosoma_japonicum_infection_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be infected with Schistosoma japonicum infection"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a urine pregnancy test.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a urine pregnancy test.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined by a urine pregnancy test.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "pregnancy as determined by (urine pregnancy test)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_pregnant_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have pregnancy as determined by urine pregnancy test."

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: "To be included, the patient must be age ≥ 18 years."
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_otherwise_healthy_as_determined_by_medical_history_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is otherwise healthy as determined by medical history now.","when_to_set_to_false":"Set to false if the patient is not otherwise healthy as determined by medical history now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is otherwise healthy as determined by medical history now.","meaning":"Boolean indicating whether the patient is otherwise healthy as determined by medical history now."} // "otherwise healthy as determined by medical history"
(declare-const patient_has_undergone_physical_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a physical examination now.","when_to_set_to_false":"Set to false if the patient has not undergone a physical examination now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a physical examination now.","meaning":"Boolean indicating whether the patient has undergone a physical examination now."} // "physical examination"
(declare-const patient_has_undergone_ultrasonography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an ultrasonography (ultrasound examination) now.","when_to_set_to_false":"Set to false if the patient has not undergone an ultrasonography (ultrasound examination) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an ultrasonography (ultrasound examination) now.","meaning":"Boolean indicating whether the patient has undergone an ultrasonography (ultrasound examination) now."} // "ultrasound examination"
(declare-const patient_is_otherwise_healthy_as_determined_by_laboratory_assessment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is otherwise healthy as determined by laboratory assessment now.","when_to_set_to_false":"Set to false if the patient is not otherwise healthy as determined by laboratory assessment now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is otherwise healthy as determined by laboratory assessment now.","meaning":"Boolean indicating whether the patient is otherwise healthy as determined by laboratory assessment now."} // "otherwise healthy as determined by laboratory assessment"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: "otherwise healthy as determined by medical history"
(assert
  (! patient_is_otherwise_healthy_as_determined_by_medical_history_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be otherwise healthy as determined by medical history."

;; Component 1: "otherwise healthy as determined by physical examination"
(assert
  (! patient_has_undergone_physical_examination_now
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be otherwise healthy as determined by physical examination."

;; Component 2: "otherwise healthy as determined by ultrasound examination"
(assert
  (! patient_has_undergone_ultrasonography_now
     :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be otherwise healthy as determined by ultrasound examination."

;; Component 3: "otherwise healthy as determined by laboratory assessment"
(assert
  (! patient_is_otherwise_healthy_as_determined_by_laboratory_assessment_now
     :named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be otherwise healthy as determined by laboratory assessment."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const pregnancy_gestational_age_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the gestational age in weeks for the patient's current pregnancy, recorded at the present time.","when_to_set_to_null":"Set to null if the gestational age in weeks for the patient's current pregnancy is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the gestational age in weeks for the patient's current pregnancy, recorded at the present time."} // "gestational age in weeks for the patient's current pregnancy, recorded at the present time"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must have pregnancy between (gestational age ≥ 12 weeks AND gestational age ≤ 16 weeks).
(assert
  (! (and (>= pregnancy_gestational_age_value_recorded_now_in_weeks 12.0)
          (<= pregnancy_gestational_age_value_recorded_now_in_weeks 16.0))
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "gestational age ≥ 12 weeks AND gestational age ≤ 16 weeks"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_ability_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to provide informed consent to participate.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to provide informed consent to participate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to provide informed consent to participate.","meaning":"Boolean indicating whether the patient currently has the ability to provide informed consent to participate."} // "the patient must have the ability to provide informed consent to participate"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_ability_to_provide_informed_consent_now
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to provide informed consent to participate"
