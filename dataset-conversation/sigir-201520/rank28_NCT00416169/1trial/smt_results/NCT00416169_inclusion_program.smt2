;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an outpatient.","when_to_set_to_false":"Set to false if the patient is not currently an outpatient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an outpatient.","meaning":"Boolean indicating whether the patient is currently an outpatient."} ;; "To be included, the patient must be an outpatient."

(declare-const patient_has_diagnosis_of_frontotemporal_dementia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinical diagnosis of frontotemporal dementia documented at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical diagnosis of frontotemporal dementia documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical diagnosis of frontotemporal dementia.","meaning":"Boolean indicating whether the patient has ever had a clinical diagnosis of frontotemporal dementia documented in their history."} ;; "clinical diagnosis of frontotemporal dementia"
(declare-const patient_has_diagnosis_of_frontotemporal_dementia_inthehistory@@documented_for_at_least_1_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinical diagnosis of frontotemporal dementia has been documented for at least 1 year.","when_to_set_to_false":"Set to false if the patient's clinical diagnosis of frontotemporal dementia has not been documented for at least 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the documentation duration is at least 1 year.","meaning":"Boolean indicating whether the patient's clinical diagnosis of frontotemporal dementia has been documented for at least 1 year."} ;; "clinical diagnosis of frontotemporal dementia documented for at least 1 year"

(declare-const patient_has_diagnosis_of_pick_complex_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinical diagnosis of Pick complex documented at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical diagnosis of Pick complex documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical diagnosis of Pick complex.","meaning":"Boolean indicating whether the patient has ever had a clinical diagnosis of Pick complex documented in their history."} ;; "clinical diagnosis of Pick complex (PC/FTD)"
(declare-const patient_has_diagnosis_of_pick_complex_inthehistory@@documented_for_at_least_1_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinical diagnosis of Pick complex has been documented for at least 1 year.","when_to_set_to_false":"Set to false if the patient's clinical diagnosis of Pick complex has not been documented for at least 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the documentation duration is at least 1 year.","meaning":"Boolean indicating whether the patient's clinical diagnosis of Pick complex has been documented for at least 1 year."} ;; "clinical diagnosis of Pick complex documented for at least 1 year"

(declare-const patient_has_diagnosis_of_primary_progressive_aphasia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinical diagnosis of primary progressive aphasia documented at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical diagnosis of primary progressive aphasia documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical diagnosis of primary progressive aphasia.","meaning":"Boolean indicating whether the patient has ever had a clinical diagnosis of primary progressive aphasia documented in their history."} ;; "primary progressive aphasia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_diagnosis_of_frontotemporal_dementia_inthehistory@@documented_for_at_least_1_year
         patient_has_diagnosis_of_frontotemporal_dementia_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "clinical diagnosis of frontotemporal dementia documented for at least 1 year"

(assert
  (! (=> patient_has_diagnosis_of_pick_complex_inthehistory@@documented_for_at_least_1_year
         patient_has_diagnosis_of_pick_complex_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "clinical diagnosis of Pick complex documented for at least 1 year"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be an outpatient
(assert
  (! patient_is_outpatient_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an outpatient."

;; Component 1: Patient must have a clinical diagnosis of frontotemporal dementia or Pick complex (PC/FTD) documented for at least 1 year, with either primary progressive aphasia or frontotemporal dementia
(assert
  (! (or
        (and patient_has_diagnosis_of_frontotemporal_dementia_inthehistory@@documented_for_at_least_1_year
             (or patient_has_diagnosis_of_primary_progressive_aphasia_inthehistory
                 patient_has_diagnosis_of_frontotemporal_dementia_inthehistory))
        (and patient_has_diagnosis_of_pick_complex_inthehistory@@documented_for_at_least_1_year
             (or patient_has_diagnosis_of_primary_progressive_aphasia_inthehistory
                 patient_has_diagnosis_of_frontotemporal_dementia_inthehistory))
     )
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "clinical diagnosis of frontotemporal dementia or a clinical diagnosis of Pick complex (PC/FTD) documented for at least 1 year with either primary progressive aphasia or frontotemporal dementia."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has recently undergone a magnetic resonance imaging scan.","when_to_set_to_false":"Set to false if the patient has not recently undergone a magnetic resonance imaging scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has recently undergone a magnetic resonance imaging scan.","meaning":"Boolean indicating whether the patient has recently undergone a magnetic resonance imaging scan."} ;; "magnetic resonance imaging scan"
(declare-const patient_has_undergone_magnetic_resonance_imaging_now@@confirms_frontotemporal_lobar_atrophy_consistent_with_frontotemporal_dementia_or_pick_complex Bool) ;; {"when_to_set_to_true":"Set to true if the patient's recent magnetic resonance imaging scan confirms frontotemporal lobar atrophy consistent with frontotemporal dementia or Pick complex.","when_to_set_to_false":"Set to false if the patient's recent magnetic resonance imaging scan does not confirm frontotemporal lobar atrophy consistent with frontotemporal dementia or Pick complex.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's recent magnetic resonance imaging scan confirms frontotemporal lobar atrophy consistent with frontotemporal dementia or Pick complex.","meaning":"Boolean indicating whether the patient's recent magnetic resonance imaging scan confirms frontotemporal lobar atrophy consistent with frontotemporal dementia or Pick complex."} ;; "recent MRI scan confirming frontotemporal lobar atrophy consistent with frontotemporal dementia OR Pick complex"
(declare-const patient_has_undergone_computerized_axial_tomography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has recently undergone a computed tomography scan.","when_to_set_to_false":"Set to false if the patient has not recently undergone a computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has recently undergone a computed tomography scan.","meaning":"Boolean indicating whether the patient has recently undergone a computed tomography scan."} ;; "computed tomography scan"
(declare-const patient_has_undergone_computerized_axial_tomography_now@@confirms_frontotemporal_lobar_atrophy_consistent_with_frontotemporal_dementia_or_pick_complex Bool) ;; {"when_to_set_to_true":"Set to true if the patient's recent computed tomography scan confirms frontotemporal lobar atrophy consistent with frontotemporal dementia or Pick complex.","when_to_set_to_false":"Set to false if the patient's recent computed tomography scan does not confirm frontotemporal lobar atrophy consistent with frontotemporal dementia or Pick complex.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's recent computed tomography scan confirms frontotemporal lobar atrophy consistent with frontotemporal dementia or Pick complex.","meaning":"Boolean indicating whether the patient's recent computed tomography scan confirms frontotemporal lobar atrophy consistent with frontotemporal dementia or Pick complex."} ;; "recent CT scan confirming frontotemporal lobar atrophy consistent with frontotemporal dementia OR Pick complex"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_magnetic_resonance_imaging_now@@confirms_frontotemporal_lobar_atrophy_consistent_with_frontotemporal_dementia_or_pick_complex
         patient_has_undergone_magnetic_resonance_imaging_now)
     :named REQ1_AUXILIARY0)) ;; "recent MRI scan confirming frontotemporal lobar atrophy consistent with frontotemporal dementia OR Pick complex"

(assert
  (! (=> patient_has_undergone_computerized_axial_tomography_now@@confirms_frontotemporal_lobar_atrophy_consistent_with_frontotemporal_dementia_or_pick_complex
         patient_has_undergone_computerized_axial_tomography_now)
     :named REQ1_AUXILIARY1)) ;; "recent CT scan confirming frontotemporal lobar atrophy consistent with frontotemporal dementia OR Pick complex"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (a recent MRI scan confirming frontotemporal lobar atrophy consistent with frontotemporal dementia OR Pick complex) OR (a recent CT scan confirming frontotemporal lobar atrophy consistent with frontotemporal dementia OR Pick complex).
(assert
  (! (or patient_has_undergone_magnetic_resonance_imaging_now@@confirms_frontotemporal_lobar_atrophy_consistent_with_frontotemporal_dementia_or_pick_complex
         patient_has_undergone_computerized_axial_tomography_now@@confirms_frontotemporal_lobar_atrophy_consistent_with_frontotemporal_dementia_or_pick_complex)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (a recent MRI scan confirming frontotemporal lobar atrophy consistent with frontotemporal dementia OR Pick complex) OR (a recent CT scan confirming frontotemporal lobar atrophy consistent with frontotemporal dementia OR Pick complex)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patients_activity_of_daily_living_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the opportunity to perform activities of daily living.","when_to_set_to_false":"Set to false if the patient currently does not have the opportunity to perform activities of daily living.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the opportunity to perform activities of daily living.","meaning":"Boolean indicating whether the patient currently has the opportunity to perform activities of daily living."} ;; "the patient must have the opportunity to perform certain activities of daily living"
(declare-const patients_activity_of_daily_living_is_positive_now@@described_in_alzheimers_disease_cooperative_study_activities_of_daily_living_inventory Bool) ;; {"when_to_set_to_true":"Set to true if the patient's opportunity to perform activities of daily living is described in the Alzheimer's Disease Cooperative Study -- Activities of Daily Living Inventory.","when_to_set_to_false":"Set to false if the patient's opportunity to perform activities of daily living is not described in the Alzheimer's Disease Cooperative Study -- Activities of Daily Living Inventory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's opportunity to perform activities of daily living is described in the Alzheimer's Disease Cooperative Study -- Activities of Daily Living Inventory.","meaning":"Boolean indicating whether the patient's opportunity to perform activities of daily living is described in the Alzheimer's Disease Cooperative Study -- Activities of Daily Living Inventory."} ;; "as described in the Alzheimer's Disease Cooperative Study -- Activities of Daily Living Inventory"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patients_activity_of_daily_living_is_positive_now@@described_in_alzheimers_disease_cooperative_study_activities_of_daily_living_inventory
         patients_activity_of_daily_living_is_positive_now)
     :named REQ2_AUXILIARY0)) ;; "as described in the Alzheimer's Disease Cooperative Study -- Activities of Daily Living Inventory" implies "opportunity to perform activities of daily living"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patients_activity_of_daily_living_is_positive_now@@described_in_alzheimers_disease_cooperative_study_activities_of_daily_living_inventory
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the opportunity to perform certain activities of daily living as described in the Alzheimer's Disease Cooperative Study -- Activities of Daily Living Inventory"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const caregiver_visit_days_per_week_now Real) ;; {"when_to_set_to_value":"Set to the number of days per week the patient currently receives visits from a responsible caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days per week the patient currently receives visits from a responsible caregiver.","meaning":"Numeric value indicating the number of days per week the patient currently receives visits from a responsible caregiver."} ;; "have regular visits (at least 4 days per week) from a responsible caregiver"
(declare-const patient_has_regular_visits_from_responsible_caregiver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving regular visits from a responsible caregiver.","when_to_set_to_false":"Set to false if the patient is not currently receiving regular visits from a responsible caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving regular visits from a responsible caregiver.","meaning":"Boolean indicating whether the patient is currently receiving regular visits from a responsible caregiver."} ;; "have regular visits from a responsible caregiver"
(declare-const patient_is_living_with_responsible_caregiver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living with a responsible caregiver.","when_to_set_to_false":"Set to false if the patient is not currently living with a responsible caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living with a responsible caregiver.","meaning":"Boolean indicating whether the patient is currently living with a responsible caregiver."} ;; "be living with a responsible caregiver"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: patient has regular visits from a responsible caregiver only if visits occur at least 4 days per week
(assert
  (! (= patient_has_regular_visits_from_responsible_caregiver_now
        (>= caregiver_visit_days_per_week_now 4))
     :named REQ3_AUXILIARY0)) ;; "have regular visits (at least 4 days per week) from a responsible caregiver"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must either be living with a responsible caregiver OR have regular visits (at least 4 days per week) from a responsible caregiver
(assert
  (! (or patient_is_living_with_responsible_caregiver_now
         patient_has_regular_visits_from_responsible_caregiver_now)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be living with a responsible caregiver OR have regular visits (at least 4 days per week) from a responsible caregiver"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const mini_mental_state_examination_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the value of the patient's Mini Mental State Examination score recorded now, in points.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's Mini Mental State Examination score is now.","meaning":"Numeric value representing the patient's Mini Mental State Examination score recorded now, in points."} ;; "Mini Mental State Examination score > 5"
(declare-const patient_can_undergo_neuropsychological_testing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to undergo neuropsychological testing.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to undergo neuropsychological testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to undergo neuropsychological testing.","meaning":"Boolean indicating whether the patient currently has the ability to undergo neuropsychological testing."} ;; "ability to complete baseline neuropsychometric testing"
(declare-const patient_can_undergo_neuropsychological_testing_now@@baseline_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ability to undergo neuropsychological testing now is specifically in the baseline context.","when_to_set_to_false":"Set to false if the patient's ability to undergo neuropsychological testing now is not in the baseline context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ability to undergo neuropsychological testing now is in the baseline context.","meaning":"Boolean indicating whether the patient's ability to undergo neuropsychological testing now is in the baseline context."} ;; "ability to complete baseline neuropsychometric testing"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_can_undergo_neuropsychological_testing_now@@baseline_context
         patient_can_undergo_neuropsychological_testing_now)
     :named REQ4_AUXILIARY0)) ;; "ability to complete baseline neuropsychometric testing"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Mini Mental State Examination score > 5
(assert
  (! (> mini_mental_state_examination_score_value_recorded_now_withunit_points 5.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "Mini Mental State Examination score > 5"

;; Component 1: Ability to complete baseline neuropsychometric testing
(assert
  (! patient_can_undergo_neuropsychological_testing_now@@baseline_context
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "ability to complete baseline neuropsychometric testing"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_can_see_sufficiently_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to see sufficiently.","when_to_set_to_false":"Set to false if the patient is currently unable to see sufficiently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to see sufficiently.","meaning":"Boolean indicating whether the patient is currently able to see sufficiently."} ;; "be able to see sufficiently"
(declare-const patient_can_hear_sufficiently_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to hear sufficiently.","when_to_set_to_false":"Set to false if the patient is currently unable to hear sufficiently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to hear sufficiently.","meaning":"Boolean indicating whether the patient is currently able to hear sufficiently."} ;; "be able to hear sufficiently"
(declare-const patient_can_communicate_sufficiently_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to communicate sufficiently.","when_to_set_to_false":"Set to false if the patient is currently unable to communicate sufficiently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to communicate sufficiently.","meaning":"Boolean indicating whether the patient is currently able to communicate sufficiently."} ;; "be able to communicate sufficiently"
(declare-const patient_can_undergo_neuropsychological_testing_now@@serial Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo neuropsychological testing and the testing is serial (repeated over time).","when_to_set_to_false":"Set to false if the patient is currently able to undergo neuropsychological testing but the testing is not serial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neuropsychological testing is serial.","meaning":"Boolean indicating whether the patient is currently able to undergo serial neuropsychological testing."} ;; "serial neuropsychometric tests"
(declare-const patient_can_undergo_neuropsychological_testing_now@@willing_to_complete Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo neuropsychological testing and is willing to complete the testing.","when_to_set_to_false":"Set to false if the patient is currently able to undergo neuropsychological testing but is not willing to complete the testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to complete neuropsychological testing.","meaning":"Boolean indicating whether the patient is currently able and willing to complete neuropsychological testing."} ;; "willing to complete serial neuropsychometric tests"
(declare-const patient_is_willing_to_complete_serial_neuropsychometric_tests_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to complete serial neuropsychometric tests.","when_to_set_to_false":"Set to false if the patient is currently not willing to complete serial neuropsychometric tests.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to complete serial neuropsychometric tests.","meaning":"Boolean indicating whether the patient is currently willing to complete serial neuropsychometric tests."} ;; "be willing to complete serial neuropsychometric tests"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies willingness to complete serial neuropsychometric tests
(assert
  (! (=> patient_can_undergo_neuropsychological_testing_now@@willing_to_complete
         patient_is_willing_to_complete_serial_neuropsychometric_tests_now)
     :named REQ5_AUXILIARY0)) ;; "be willing to complete serial neuropsychometric tests"

;; Qualifier variable implies ability to undergo serial neuropsychometric testing
(assert
  (! (=> patient_can_undergo_neuropsychological_testing_now@@serial
         patient_is_willing_to_complete_serial_neuropsychometric_tests_now)
     :named REQ5_AUXILIARY1)) ;; "serial neuropsychometric tests"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: patient must be able to see sufficiently
(assert
  (! patient_can_see_sufficiently_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be able to see sufficiently"

;; Component 1: patient must be able to hear sufficiently
(assert
  (! patient_can_hear_sufficiently_now
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be able to hear sufficiently"

;; Component 2: patient must be able to communicate sufficiently
(assert
  (! patient_can_communicate_sufficiently_now
     :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "be able to communicate sufficiently"

;; Component 3: patient must be willing to complete serial neuropsychometric tests
(assert
  (! patient_is_willing_to_complete_serial_neuropsychometric_tests_now
     :named REQ5_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to complete serial neuropsychometric tests"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown or not documented.","meaning":"Indicates whether the patient's current recorded sex is female."} ;; "if the patient is a female of childbearing age"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown or not documented.","meaning":"Numeric value indicating the patient's current age in years."} ;; "if the patient is a female of childbearing age"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential (e.g., due to menopause or surgical sterilization).","when_to_set_to_null":"Set to null if the patient's current childbearing potential is unknown or not documented.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "if the patient is a female of childbearing age"
(declare-const patient_has_finding_of_sterility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sterile.","when_to_set_to_false":"Set to false if the patient is currently not sterile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sterile.","meaning":"Boolean indicating whether the patient is currently sterile."} ;; "sterile"
(declare-const patient_has_finding_of_sterility_now@@surgically_achieved Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sterility is surgically achieved.","when_to_set_to_false":"Set to false if the patient's sterility is not surgically achieved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sterility is surgically achieved.","meaning":"Boolean indicating whether the patient's sterility is surgically achieved."} ;; "be surgically sterile"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing contraception.","when_to_set_to_false":"Set to false if the patient is currently not practicing contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently practicing contraception.","meaning":"Boolean indicating whether the patient is currently practicing contraception."} ;; "birth control"
(declare-const patient_has_finding_of_contraception_now@@effective_method Bool) ;; {"when_to_set_to_true":"Set to true if the contraception method practiced by the patient is effective.","when_to_set_to_false":"Set to false if the contraception method practiced by the patient is not effective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception method practiced by the patient is effective.","meaning":"Boolean indicating whether the contraception method practiced by the patient is effective."} ;; "effective method of birth control"
(declare-const patient_has_finding_of_contraception_now@@practiced_before_entry_and_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the contraception method is practiced both before entry and throughout the study.","when_to_set_to_false":"Set to false if the contraception method is not practiced both before entry and throughout the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception method is practiced both before entry and throughout the study.","meaning":"Boolean indicating whether the contraception method is practiced both before entry and throughout the study."} ;; "practicing an effective method of birth control before entry AND throughout the study"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable (sterility)
(assert
  (! (=> patient_has_finding_of_sterility_now@@surgically_achieved
         patient_has_finding_of_sterility_now)
     :named REQ6_AUXILIARY0)) ;; "be surgically sterile"

;; Qualifier variable implies corresponding stem variable (contraception)
(assert
  (! (=> patient_has_finding_of_contraception_now@@effective_method
         patient_has_finding_of_contraception_now)
     :named REQ6_AUXILIARY1)) ;; "effective method of birth control"

(assert
  (! (=> patient_has_finding_of_contraception_now@@practiced_before_entry_and_throughout_study
         patient_has_finding_of_contraception_now)
     :named REQ6_AUXILIARY2)) ;; "practicing an effective method of birth control before entry AND throughout the study"

;; ===================== Constraint Assertions (REQ 6) =====================
;; If the patient is a female of childbearing age, she must be surgically sterile OR practicing an effective method of birth control before entry AND throughout the study
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (or patient_has_finding_of_sterility_now@@surgically_achieved
             (and patient_has_finding_of_contraception_now@@effective_method
                  patient_has_finding_of_contraception_now@@practiced_before_entry_and_throughout_study)))
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a female of childbearing age, the patient must (be surgically sterile) OR (be practicing an effective method of birth control before entry AND throughout the study)"
