;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body mass index (BMI) in kilograms per square meter is recorded now.","when_to_set_to_null":"Set to null if no such BMI measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "body mass index"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 30.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "body mass index ≥ 30 kilograms per square meter"

(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 39.9)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "body mass index ≤ 39.9 kilograms per square meter"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 25 years AND aged ≤ 50 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 25 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 25)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 25 years."

;; Component 1: To be included, the patient must be aged ≤ 50 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 50)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 50 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_weight_decreased_value_recorded_inthepast3months_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value in kilograms if the patient's body weight loss during the past three months is documented.","when_to_set_to_null":"Set to null if no measurement of body weight loss during the past three months is available or the value is indeterminate.","meaning":"Numeric value (kilograms) representing the patient's body weight loss during the past three months."} // "loss of body weight > 3 kilograms during the past three months"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must NOT have loss of body weight > 3 kilograms during the past three months.
(assert
  (! (not (> patient_weight_decreased_value_recorded_inthepast3months_withunit_kilograms 3.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have loss of body weight > 3 kilograms during the past three months."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a pregnancy test at entry.","when_to_set_to_false":"Set to false if the patient is not currently pregnant as determined by a pregnancy test at entry.","when_to_set_to_null":"Set to null if the patient's pregnancy status at entry is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "a negative result on a pregnancy test at entry"
(declare-const pregnancy_test_result_value_recorded_at_entry_withunit_binary Real) ;; {"when_to_set_to_value":"Set to 0 if the pregnancy test performed at entry is negative; set to 1 if the pregnancy test performed at entry is positive.","when_to_set_to_null":"Set to null if the result of the pregnancy test performed at entry is unknown, not documented, or cannot be determined.","meaning":"Binary value indicating the result of the pregnancy test performed at entry, where 0 is negative and 1 is positive."} // "a negative result on a pregnancy test at entry"
(declare-const pregnancy_test_result_value_recorded_at_entry_withunit_binary@@performed_at_entry Bool) ;; {"when_to_set_to_true":"Set to true if the pregnancy test was performed at entry.","when_to_set_to_false":"Set to false if the pregnancy test was not performed at entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pregnancy test was performed at entry.","meaning":"Boolean indicating whether the pregnancy test was performed at entry."} // "a negative result on a pregnancy test at entry"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: pregnancy test result at entry implies pregnancy status
(assert
  (! (= patient_is_pregnant_now
        (= pregnancy_test_result_value_recorded_at_entry_withunit_binary 1.0))
     :named REQ3_AUXILIARY0)) ;; "patient is currently pregnant as determined by a pregnancy test at entry"

;; Qualifier variable implies test was performed at entry
(assert
  (! (=> pregnancy_test_result_value_recorded_at_entry_withunit_binary@@performed_at_entry
         (or (= pregnancy_test_result_value_recorded_at_entry_withunit_binary 0.0)
             (= pregnancy_test_result_value_recorded_at_entry_withunit_binary 1.0)))
     :named REQ3_AUXILIARY1)) ;; "pregnancy test was performed at entry"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must have a negative result on a pregnancy test at entry
(assert
  (! (and pregnancy_test_result_value_recorded_at_entry_withunit_binary@@performed_at_entry
          (= pregnancy_test_result_value_recorded_at_entry_withunit_binary 0.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a negative result on a pregnancy test at entry."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently considered not to have childbearing potential.","when_to_set_to_null":"Set to null if the patient's current childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "the patient is a woman of childbearing potential"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is female."} // "the patient is a woman of childbearing potential"
(declare-const patient_has_undergone_ligation_of_fallopian_tube_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone ligation of the fallopian tube (tubal ligation) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone ligation of the fallopian tube (tubal ligation) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone ligation of the fallopian tube (tubal ligation).","meaning":"Boolean indicating whether the patient has ever undergone ligation of the fallopian tube (tubal ligation) in the past."} // "tubal ligation"
(declare-const patient_is_using_condom_as_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a condom as a means of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using a condom as a means of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a condom as a means of contraception.","meaning":"Boolean indicating whether the patient is currently using a condom as a means of contraception."} // "condom"
(declare-const patient_is_using_diaphragm_as_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a diaphragm as a means of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using a diaphragm as a means of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a diaphragm as a means of contraception.","meaning":"Boolean indicating whether the patient is currently using a diaphragm as a means of contraception."} // "diaphragm"
(declare-const patient_is_using_oral_contraceptive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an oral contraceptive as a means of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using an oral contraceptive as a means of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an oral contraceptive as a means of contraception.","meaning":"Boolean indicating whether the patient is currently using an oral contraceptive as a means of contraception."} // "oral contraceptive"
(declare-const patient_is_using_implanted_contraceptive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an implanted contraceptive as a means of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using an implanted contraceptive as a means of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an implanted contraceptive as a means of contraception.","meaning":"Boolean indicating whether the patient is currently using an implanted contraceptive as a means of contraception."} // "implanted contraceptive"
(declare-const patient_is_using_intrauterine_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an intrauterine device as a means of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using an intrauterine device as a means of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an intrauterine device as a means of contraception.","meaning":"Boolean indicating whether the patient is currently using an intrauterine device as a means of contraception."} // "intrauterine device"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Sex qualifier for childbearing potential
(assert
  (! (=> patient_has_childbearing_potential_now
         patient_sex_is_female_now)
     :named REQ4_AUXILIARY0)) ;; "the patient is a woman of childbearing potential"

;; Exhaustive subcategories for contraception methods
(assert
  (! (= (or patient_is_using_condom_as_contraception_now
            patient_is_using_diaphragm_as_contraception_now
            patient_is_using_oral_contraceptive_now
            patient_is_using_implanted_contraceptive_now
            patient_is_using_intrauterine_device_now)
         (exists ((x Bool)) x)) ; placeholder for umbrella, but SMT-LIB does not allow exists for booleans, so use direct OR
     :named REQ4_AUXILIARY1)) ;; "means of contraception with exhaustive subcategories (condom, diaphragm, oral contraceptive, implanted contraceptive, intrauterine device)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; If the patient is a woman of childbearing potential, she must have had a tubal ligation OR use at least one permitted means of contraception
(assert
  (! (or (not patient_has_childbearing_potential_now)
         (or patient_has_undergone_ligation_of_fallopian_tube_inthehistory
             (or patient_is_using_condom_as_contraception_now
                 patient_is_using_diaphragm_as_contraception_now
                 patient_is_using_oral_contraceptive_now
                 patient_is_using_implanted_contraceptive_now
                 patient_is_using_intrauterine_device_now)))
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a woman of childbearing potential, the patient must have had a tubal ligation OR use at least one of the following means of contraception with exhaustive subcategories (condom, diaphragm, oral contraceptive, implanted contraceptive, intrauterine device)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any means of birth control (contraception).","when_to_set_to_false":"Set to false if the patient is currently not using any means of birth control (contraception).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any means of birth control (contraception).","meaning":"Boolean indicating whether the patient is currently using any means of birth control (contraception)."} // "means of birth control"
(declare-const patient_has_finding_of_contraception_now@@is_additional Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current use of contraception is as an additional method beyond other primary means.","when_to_set_to_false":"Set to false if the patient's current use of contraception is not as an additional method (i.e., it is the primary or only method).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception is being used as an additional method.","meaning":"Boolean indicating whether the patient's current contraception is being used as an additional method beyond other primary means."} // "any additional means of birth control"
(declare-const patient_is_in_exclusive_relationship_with_male_partner_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in an exclusive relationship with a male partner.","when_to_set_to_false":"Set to false if the patient is currently not in an exclusive relationship with a male partner.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in an exclusive relationship with a male partner.","meaning":"Boolean indicating whether the patient is currently in an exclusive relationship with a male partner."} // "exclusive relationship with a male partner"
(declare-const patient_is_in_exclusive_relationship_with_male_partner_now@@partner_has_had_successful_vasectomy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's male partner in the exclusive relationship has had a successful vasectomy.","when_to_set_to_false":"Set to false if the patient's male partner in the exclusive relationship has not had a successful vasectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's male partner in the exclusive relationship has had a successful vasectomy.","meaning":"Boolean indicating whether the patient's male partner in the exclusive relationship has had a successful vasectomy."} // "male partner who has had a successful vasectomy"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's partner is currently male.","when_to_set_to_false":"Set to false if the patient's partner is currently not male.","when_to_set_to_null":"Set to null if the patient's partner's sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's partner is currently male."} // "patient is a woman in an exclusive relationship with a male partner who has had a successful vasectomy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_contraception_now@@is_additional
         patient_has_finding_of_contraception_now)
     :named REQ5_AUXILIARY0)) ;; "any additional means of birth control"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_in_exclusive_relationship_with_male_partner_now@@partner_has_had_successful_vasectomy
         patient_is_in_exclusive_relationship_with_male_partner_now)
     :named REQ5_AUXILIARY1)) ;; "male partner who has had a successful vasectomy"

;; ===================== Constraint Assertions (REQ 5) =====================
;; If the patient is a woman in an exclusive relationship with a male partner who has had a successful vasectomy, she is NOT required to use any additional means of birth control.
(assert
  (! (=> (and patient_sex_is_female_now
              patient_is_in_exclusive_relationship_with_male_partner_now
              patient_is_in_exclusive_relationship_with_male_partner_now@@partner_has_had_successful_vasectomy)
         (not patient_has_finding_of_contraception_now@@is_additional))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is a woman in an exclusive relationship with a male partner who has had a successful vasectomy, the patient is NOT required to use any additional means of birth control."
