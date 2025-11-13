;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently recorded as male.","when_to_set_to_false":"Set to false if the patient's sex is currently recorded as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."}  ;; "be male OR be female"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently recorded as female.","when_to_set_to_false":"Set to false if the patient's sex is currently recorded as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."}  ;; "be male OR be female"
(declare-const patient_body_weight_value_recorded_now_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight in kilograms is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in kilograms."}  ;; "body weight ≥ 13 kilograms"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 3 years AND ≤ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: (be male OR be female)
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be male OR be female"

;; Component 1: body weight ≥ 13 kilograms
(assert
  (! (>= patient_body_weight_value_recorded_now_withunit_kilograms 13.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "body weight ≥ 13 kilograms"

;; Component 2: age ≥ 3 years AND ≤ 18 years
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 3.0)
          (<= patient_age_value_recorded_now_in_years 18.0))
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "age ≥ 3 years AND ≤ 18 years"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_cerebral_palsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cerebral palsy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cerebral palsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cerebral palsy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cerebral palsy."}  ;; "have a diagnosis of cerebral palsy"
(declare-const patient_has_diagnosis_of_intellectual_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of intellectual disability.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of intellectual disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of intellectual disability.","meaning":"Boolean indicating whether the patient currently has a diagnosis of intellectual disability."}  ;; "have a diagnosis of mental retardation"
(declare-const patient_has_diagnosis_of_neurological_deficit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of neurological deficit.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of neurological deficit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of neurological deficit.","meaning":"Boolean indicating whether the patient currently has a diagnosis of neurological deficit."}  ;; "have a diagnosis of any other neurologic impairment"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the nervous system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the nervous system."}  ;; "have a diagnosis of any other neurologic condition"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must (have a diagnosis of cerebral palsy) OR (have a diagnosis of mental retardation) OR (have a diagnosis of any other neurologic impairment) OR (have a diagnosis of any other neurologic condition).
(assert
  (! (or patient_has_diagnosis_of_cerebral_palsy_now
         patient_has_diagnosis_of_intellectual_disability_now
         patient_has_diagnosis_of_neurological_deficit_now
         patient_has_diagnosis_of_disorder_of_nervous_system_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have a diagnosis of cerebral palsy) OR (have a diagnosis of mental retardation) OR (have a diagnosis of any other neurologic impairment) OR (have a diagnosis of any other neurologic condition)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const modified_teachers_drooling_scale_score_value_recorded_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the integer value of the patient's current Modified Teacher's Drooling Scale score as recorded now.","when_to_set_to_null":"Set to null if the patient's current Modified Teacher's Drooling Scale score is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current Modified Teacher's Drooling Scale score (integer)."}  ;; "have a Modified Teacher's Drooling Scale score ≥ 5"
(declare-const patient_has_finding_of_dribbling_from_mouth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of drooling (dribbling from mouth).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of drooling (dribbling from mouth).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of drooling (dribbling from mouth).","meaning":"Boolean indicating whether the patient currently has drooling (dribbling from mouth)."}  ;; "have chronic drooling in the absence of treatment to the extent that the chin or clothing becomes wet on most days"
(declare-const patient_has_finding_of_dribbling_from_mouth_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current drooling is chronic.","when_to_set_to_false":"Set to false if the patient's current drooling is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current drooling is chronic.","meaning":"Boolean indicating whether the patient's current drooling is chronic."}  ;; "chronic drooling"
(declare-const patient_has_finding_of_dribbling_from_mouth_now@@in_absence_of_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current drooling occurs in the absence of treatment.","when_to_set_to_false":"Set to false if the patient's current drooling does not occur in the absence of treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current drooling occurs in the absence of treatment.","meaning":"Boolean indicating whether the patient's current drooling occurs in the absence of treatment."}  ;; "in the absence of treatment"
(declare-const patient_has_finding_of_dribbling_from_mouth_now@@extent_chin_or_clothing_wet_on_most_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current drooling is of sufficient severity that the chin or clothing becomes wet on most days.","when_to_set_to_false":"Set to false if the patient's current drooling is not of sufficient severity that the chin or clothing becomes wet on most days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current drooling is of sufficient severity that the chin or clothing becomes wet on most days.","meaning":"Boolean indicating whether the patient's current drooling is of sufficient severity that the chin or clothing becomes wet on most days."}  ;; "to the extent that the chin or clothing becomes wet on most days"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_dribbling_from_mouth_now@@chronic
         patient_has_finding_of_dribbling_from_mouth_now)
     :named REQ2_AUXILIARY0)) ;; "chronic drooling"

(assert
  (! (=> patient_has_finding_of_dribbling_from_mouth_now@@in_absence_of_treatment
         patient_has_finding_of_dribbling_from_mouth_now)
     :named REQ2_AUXILIARY1)) ;; "drooling in the absence of treatment"

(assert
  (! (=> patient_has_finding_of_dribbling_from_mouth_now@@extent_chin_or_clothing_wet_on_most_days
         patient_has_finding_of_dribbling_from_mouth_now)
     :named REQ2_AUXILIARY2)) ;; "drooling to the extent that the chin or clothing becomes wet on most days"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: chronic drooling in the absence of treatment to the extent that the chin or clothing becomes wet on most days
(assert
  (! (and patient_has_finding_of_dribbling_from_mouth_now@@chronic
          patient_has_finding_of_dribbling_from_mouth_now@@in_absence_of_treatment
          patient_has_finding_of_dribbling_from_mouth_now@@extent_chin_or_clothing_wet_on_most_days)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have chronic drooling in the absence of treatment to the extent that the chin or clothing becomes wet on most days"

;; Component 1: Modified Teacher's Drooling Scale score ≥ 5
(assert
  (! (>= modified_teachers_drooling_scale_score_value_recorded_now_withunit_integer 5)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have a Modified Teacher's Drooling Scale score ≥ 5"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_lives_in_situation_with_reliable_parents_willing_and_capable_to_administer_medications_as_determined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient lives in a situation where reliable parents are both willing and capable of administering medications, as determined by the investigator.","when_to_set_to_false":"Set to false if the patient does not live in a situation where reliable parents are both willing and capable of administering medications, as determined by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient lives in a situation where reliable parents are both willing and capable of administering medications, as determined by the investigator.","meaning":"Boolean indicating whether the patient lives in a situation where reliable parents are both willing and capable of administering medications, as determined by the investigator."}  ;; "be living in a situation where reliable parents are willing AND capable of administering medications, as determined by the investigator"
(declare-const patient_lives_in_situation_with_reliable_caregivers_willing_and_capable_to_administer_medications_as_determined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient lives in a situation where reliable caregivers are both willing and capable of administering medications, as determined by the investigator.","when_to_set_to_false":"Set to false if the patient does not live in a situation where reliable caregivers are both willing and capable of administering medications, as determined by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient lives in a situation where reliable caregivers are both willing and capable of administering medications, as determined by the investigator.","meaning":"Boolean indicating whether the patient lives in a situation where reliable caregivers are both willing and capable of administering medications, as determined by the investigator."}  ;; "be living in a situation where reliable caregivers are willing AND capable of administering medications, as determined by the investigator"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient must (be living in a situation where reliable parents are willing AND capable of administering medications, as determined by the investigator) OR (be living in a situation where reliable caregivers are willing AND capable of administering medications, as determined by the investigator).
(assert
  (! (or patient_lives_in_situation_with_reliable_parents_willing_and_capable_to_administer_medications_as_determined_by_investigator
         patient_lives_in_situation_with_reliable_caregivers_willing_and_capable_to_administer_medications_as_determined_by_investigator)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (be living in a situation where reliable parents are willing AND capable of administering medications, as determined by the investigator) OR (be living in a situation where reliable caregivers are willing AND capable of administering medications, as determined by the investigator)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_written_informed_consent_signed_by_legally_acceptable_representative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has written informed consent signed by a legally acceptable representative.","when_to_set_to_false":"Set to false if the patient currently does not have written informed consent signed by a legally acceptable representative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has written informed consent signed by a legally acceptable representative.","meaning":"Boolean indicating whether the patient currently has written informed consent signed by a legally acceptable representative."}  ;; "have written informed consent signed by the legally acceptable representative"
(declare-const patient_has_written_informed_consent_signed_by_parent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has written informed consent signed by the parent.","when_to_set_to_false":"Set to false if the patient currently does not have written informed consent signed by the parent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has written informed consent signed by the parent.","meaning":"Boolean indicating whether the patient currently has written informed consent signed by the parent."}  ;; "have written informed consent signed by the parent"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have written informed consent signed by the parent OR legally acceptable representative.
(assert
  (! (or patient_has_written_informed_consent_signed_by_parent_now
         patient_has_written_informed_consent_signed_by_legally_acceptable_representative_now)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have written informed consent signed by the parent OR legally acceptable representative"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_written_assent_signed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has written assent signed.","when_to_set_to_false":"Set to false if the patient currently does not have written assent signed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has written assent signed.","meaning":"Boolean indicating whether the patient currently has written assent signed."}  ;; "have written assent signed"
(declare-const patient_has_written_assent_signed_now@@signed_by_age_appropriate_patient Bool) ;; {"when_to_set_to_true":"Set to true if the written assent is signed by the age-appropriate patient.","when_to_set_to_false":"Set to false if the written assent is not signed by the age-appropriate patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the written assent is signed by the age-appropriate patient.","meaning":"Boolean indicating whether the written assent is signed by the age-appropriate patient."}  ;; "signed by the age-appropriate patient"
(declare-const patient_has_written_assent_signed_now@@signed_if_patient_is_mentally_capable_as_determined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the written assent is signed and the patient is mentally capable as determined by the investigator.","when_to_set_to_false":"Set to false if the written assent is not signed or the patient is not mentally capable as determined by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the written assent is signed and the patient is mentally capable as determined by the investigator.","meaning":"Boolean indicating whether the written assent is signed if the patient is mentally capable as determined by the investigator."}  ;; "signed if the patient is mentally capable, as determined by the investigator"
(declare-const patient_has_written_assent_signed_now@@required_by_site_institutional_review_board Bool) ;; {"when_to_set_to_true":"Set to true if the written assent is required by the site's Institutional Review Board.","when_to_set_to_false":"Set to false if the written assent is not required by the site's Institutional Review Board.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the written assent is required by the site's Institutional Review Board.","meaning":"Boolean indicating whether the written assent is required by the site's Institutional Review Board."}  ;; "required by the site's Institutional Review Board"
(declare-const patient_is_mentally_capable_now_as_determined_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently mentally capable as determined by the investigator.","when_to_set_to_false":"Set to false if the patient is currently not mentally capable as determined by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently mentally capable as determined by the investigator.","meaning":"Boolean indicating whether the patient is currently mentally capable as determined by the investigator."}  ;; "mentally capable, as determined by the investigator"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_written_assent_signed_now@@signed_by_age_appropriate_patient
         patient_has_written_assent_signed_now)
     :named REQ5_AUXILIARY0)) ;; "signed by the age-appropriate patient"

(assert
  (! (=> patient_has_written_assent_signed_now@@signed_if_patient_is_mentally_capable_as_determined_by_investigator
         patient_has_written_assent_signed_now)
     :named REQ5_AUXILIARY1)) ;; "signed if the patient is mentally capable, as determined by the investigator"

(assert
  (! (=> patient_has_written_assent_signed_now@@required_by_site_institutional_review_board
         patient_has_written_assent_signed_now)
     :named REQ5_AUXILIARY2)) ;; "required by the site's Institutional Review Board"

;; The written assent is only required if both the patient is mentally capable (as determined by investigator) AND the site's IRB requires it.
(assert
  (! (= patient_has_written_assent_signed_now@@signed_if_patient_is_mentally_capable_as_determined_by_investigator
         (and patient_is_mentally_capable_now_as_determined_by_investigator
              patient_has_written_assent_signed_now@@required_by_site_institutional_review_board))
     :named REQ5_AUXILIARY3)) ;; "signed if the patient is mentally capable, as determined by the investigator, AND required by the site's Institutional Review Board"

;; ===================== Constraint Assertions (REQ 5) =====================
;; If both mentally capable AND IRB requires assent, then written assent signed by age-appropriate patient is required.
(assert
  (! (or (not (and patient_is_mentally_capable_now_as_determined_by_investigator
                   patient_has_written_assent_signed_now@@required_by_site_institutional_review_board))
         (and patient_has_written_assent_signed_now
              patient_has_written_assent_signed_now@@signed_by_age_appropriate_patient))
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have written assent signed by the age-appropriate patient IF the patient is mentally capable, as determined by the investigator, AND required by the site's Institutional Review Board"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_negative_pregnancy_test_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient had a pregnancy test at the screening visit and the result was negative.","when_to_set_to_false":"Set to false if the patient had a pregnancy test at the screening visit and the result was not negative (i.e., positive or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had a negative pregnancy test at the screening visit.","meaning":"Boolean indicating whether the patient had a negative pregnancy test at the screening visit."}  ;; "have a negative pregnancy test at screening"
(declare-const patient_has_negative_pregnancy_test_at_visit_2 Bool) ;; {"when_to_set_to_true":"Set to true if the patient had a pregnancy test at Visit 2 and the result was negative.","when_to_set_to_false":"Set to false if the patient had a pregnancy test at Visit 2 and the result was not negative (i.e., positive or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had a negative pregnancy test at Visit 2.","meaning":"Boolean indicating whether the patient had a negative pregnancy test at Visit 2."}  ;; "have a negative pregnancy test at Visit 2"
(declare-const patient_is_of_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently of childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently not of childbearing potential (e.g., postmenopausal, surgically sterile).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently of childbearing potential.","meaning":"Boolean indicating whether the patient is currently of childbearing potential."}  ;; "female of childbearing potential"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: IF the patient is female of childbearing potential, must have a negative pregnancy test at screening
(assert
  (! (or (not (and patient_sex_is_female_now patient_is_of_childbearing_potential_now))
         patient_has_negative_pregnancy_test_at_screening)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "IF the patient is female of childbearing potential, the patient must have a negative pregnancy test at screening"

;; Component 1: IF the patient is female of childbearing potential, must have a negative pregnancy test at Visit 2
(assert
  (! (or (not (and patient_sex_is_female_now patient_is_of_childbearing_potential_now))
         patient_has_negative_pregnancy_test_at_visit_2)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "IF the patient is female of childbearing potential, the patient must have a negative pregnancy test at Visit 2"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a medically acceptable form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any medically acceptable form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."}  ;; "use a medically acceptable form of contraception"
(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."}  ;; "is sexually active"

;; ===================== Constraint Assertions (REQ 7) =====================
;; If the patient is female of childbearing potential AND is sexually active, the patient must use a medically acceptable form of contraception.
(assert
  (! (or (not (and patient_sex_is_female_now
                   patient_is_of_childbearing_potential_now
                   patient_is_sexually_active_now))
         patient_has_finding_of_contraception_now)
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "IF the patient is female of childbearing potential AND is sexually active, the patient must use a medically acceptable form of contraception."
